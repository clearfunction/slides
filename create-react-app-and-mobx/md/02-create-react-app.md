# create-react-app

<..>

## The problem?

<div style="float: left; width: 50%;">
    <ul>
        <li>Setting up webpack</li>
        <li>Setting up babel</li>
        <li>Setting up tests</li>
        <li>Setting up hot reloading</li>
        <li>Keeping up to date build tools</li>
        <li>People aren't consistent</li>
    </ul>
</div>

<div style="float: right; width: 50%;">
![A tangled mess](/images/tangled.webp)
</div>

<..>

![untabled](/images/untangled.webp)<!-- .element: style="border: none; width: 280px; background-color: rgba(0,0,0,0); box-shadow: none" -->

<..>

![react](/images/create-react-app.png)

<div>
    <ul>
        <li>React, JSX, ES6, and Flow support</li>
        <li>Configured dev server</li>
        <li>Build scripts for dev, test, and production</li>
        <li>Hot reloading</li>
        <li>Upgradeable</li>
        <li>Friendly Dev Experience</li>
        <li>Best practices</li>
        <li>Customizable</li>
    </ul>
</div>

<..>

## Demo

Note:
create app (with custom scripts) taskify

yarn add prettier

change logo (with one from desktop)

CF Taskify 0153

fatal error overlay

tests

create model (TaskItem)

create TaskItemStore, TaskItemListView, TaskItemView

TODO snippets here...
<..>

<pre>
    <code data-trim data-noescape class="cmd">
        yarn global add create-react-app
    </code>
</pre>

<..>

<pre>
    <code data-trim data-noescape class="cmd">
        create-react-app taskify-mobx --scripts-version custom-react-scripts
    </code>
</pre>

<..>

![fresh app](/images/fresh-app.png)

<..>

<pre>
    <code data-trim data-noescape class="cmd">
        yarn add prettier --dev
    </code>
</pre>
to make me never think about formatting
<..>

<pre>
    <code data-trim data-noescape class="cmd">
        yarn start
    </code>
</pre>

![new app browser](/images/fresh-app-browser.png)

<..>

### Errors in console and browser overlay

![error-browser](/images/error-in-browser.png)

<..>

<pre>
    <code data-trim data-noescape class="cmd">
        yarn test
    </code>
</pre>

![tests](/images/react-tests.png)

<..>

## Small config

![tests](/images/small-config.png)
