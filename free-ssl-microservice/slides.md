## Deploy an SSL-secured 🔐 Go microservice with a free certificate from Let's Encrypt

Daniel Pritchett // Clear Function // Memphis, TN

Devspace 2016

---

## What?

* SSL

* Go

* Microservice

* Let's Encrypt

---

## SSL

> Transport Layer Security (TLS) and its predecessor, Secure Sockets Layer (SSL), both frequently referred to as "SSL", are cryptographic protocols that provide communications security over a computer network.
- [Wikipedia](https://en.wikipedia.org/wiki/Transport_Layer_Security)


----


## What's SSL doing for me?

* A padlock on your web page
* Raises user confidence in your security
* No unsightly _"This page may be hacking your Gibsons!"_ warnings

🍩💻


---

## Go

![Gopher mascots frolicking](img/usergroups.png)

----

## Go

* A programming language
* Created at Google
* Open source

----

## Go

* Statically typed
* Statically _LINKED_
* Small syntax
* Very fast compiles are a core value
* Nice built-in concurrency primitives 
* Cross compiles* between Windows, OSX, Linux, amd64, 386, ARM

----

## Go

```go
func diceHandler(w http.ResponseWriter, req *http.Request) {
  fmt.Fprintf(w, "You rolled a %d.", rollDice())
}

func rollDice() int {
  return rand.Intn(6) + 1
}
```

----

## Fast compiles, chunky files

```sh
daniel@Molly-Millions ~/c/d/diceRoller> time go build .
        1.19 real         1.19 user         0.20 sys
daniel@Molly-Millions ~/c/d/diceRoller> ll diceRoller
-rwxr-xr-x  1 daniel  staff   7.2M Oct 10 18:34 diceRoller
daniel@Molly-Millions ~/c/d/diceRoller>
```

---

## Microservice
Ok, this is just a really tiny web app.

```sh
daniel@Molly-Millions ~/c/d/diceRoller> curl https://dice.dpritchett.net
You rolled a 2.
```

----

## But!

* We can put a lot of really tiny webapps on a low-cost VPS
* We can give them all free SSL!

