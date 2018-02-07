## Lambdas, Serverless, and Stuff

Daniel Pritchett // Clear Function // Memphis, TN

February 2018 Lunch and Learn 🥙 

![Clear Function](img/clear-function-logo-white.svg) <!-- .element: style="border: none; width: 300px; background-color: rgba(0,0,0,0); box-shadow: none; margin-left: 225px" -->

---

## Outline

- What's a Lambda?
- Who supports them?
- What tools make it easy?
- Examples
- What tools make it _not_ easy?
- What's coming next

---

## What's a Lambda?

----

Ok, this talk is really about serverless computing. But not Kubernetes, just function-as-a-service stuff.

A lambda is a function that runs in its own context. Standalone cloud-hosted event handlers, mostly. The cloud vendors tend to want you to use their own proprietary event buses, but there are ways to be lazy and just set up an HTTP microservice instead of learning everyone's new events API.

----

## Who cares?

- Per-request pricing means you can compute ROI on your feature dev for once
- Super useful for sysadmin tasks: Do this specific thing infrequently; don't make me keep a whole server up forever.
- Good for highly variable infrequent workloads in general: Image thumbnailing and other media processing, ops alert handling, etc.

---

## Who supports them?

- Amazon: Lambdas
- Azure: Azure Functions
- Google: Cloud Functions
- Iron.io workers

---

## What tools make it easy?

----

[`up`](https://up.docs.apex.sh/), by _TJ!_
  ![pogchamp](img/pogchamp.jpg) <!-- .element: style="border: none; width: 150px; background-color: rgba(0,0,0,0); box-shadow: none; margin-left: 225px" -->

- I deployed some Go and JS functions with this, easy peasy. Except when I tried domain names, then it was terrible, because AWS and CloudFormation.

----

```json
{
  "name": "emoji-service-5",
  "profile": "default",
  "regions": [
    "us-east-2"
  ],
  "stages": {
    "development": {
      "domain": "emoji-dev2.pritchettbots.com"
    },
    "production": {
      "domain": "emoji.pritchettbots.com"
    }
  }
}
```

----

[`serverless`](https://serverless.com/)

- Feels bad because it tries harder to be everything to everyone, but still easier than actually learning how to Lambda up front. So many moving parts on AWS!

---

## Examples

----

Instagrabber: https://github.com/dpritchett/instagrabber

```go
func main() {
	rand.Seed(time.Now().Unix()) // initialize global pseudo random generator

	addr := ":" + os.Getenv("PORT")
	http.HandleFunc("/", renderPhoto)
	http.HandleFunc("/raw", printRawPhotoUrl)

	log.Println("Serving on port " + os.Getenv("PORT") + "...")
	log.Fatal(http.ListenAndServe(addr, nil))
}
```

----

emojiaas (node on lambda with `up`)

```js
const http = require("http");
const url = require("url");

const emoji = require("./emoji/emoji");

const { PORT = 3000 } = process.env;

http
  .createServer((req, res) => {
    route = url.parse(`http://${req.url}`).pathname;

    if (route.match(/\/named\/\w+/)) {
      const longName = route.split("/named/")[1];

      const imageUrl = emoji.imageUrlFromName(longName);

      res.end(`<html><body><img src="${imageUrl}"/></body></html>`);
    } else {
      res.end(`Hello World from Node.js at ${route}\n`);
    }
  })
  .listen(PORT);
```

----

emozure (node on Azure with `serverless`)

```js
'use strict';

/* eslint-disable no-param-reassign */

module.exports.hello = function (context) {
  context.log('JavaScript HTTP trigger function processed a request.');

  context.res = {
    // status: 200, /* Defaults to 200 */
    body: 'Go Serverless v1.x! Your function executed successfully!',
  };

  context.done();
};
```

---

## What tools make it _not_ easy

Doing it by hand with the cloud providers' recommended tools, mostly.

---

## What's coming next?

Containerized FaaS.

jurrently most of the stuff (including Iron.io workers a million years ago) has you upload the code directly and then it builds it Heroku-style. Cool if you need it, but Amazon for instance is using old versions of Node and no Ruby at all.

Containers to the rescue!
