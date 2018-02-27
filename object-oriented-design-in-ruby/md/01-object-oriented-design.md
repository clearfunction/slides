## Object-Oriented Design

<p class="fragment fade-in"><em>a series of spontaneous interactions between objects</em></p>

<..>

## A Way to View Development

<p class="fragment fade-in">Not a collection of predefined procedures</p>
<p class="fragment fade-in">Series of messages that pass between objects</p>
<p class="fragment fade-in">With this perspective, the rest is just natural!</p>

<..>

## Defining Design

* Every application is a collection of code
* The code's arrangement is the _design_.

![art](/images/art.gif)

<..>

![art again](/images/art-2.gif)

<p class="fragment fade-in">Design is the art of arranging code.</p>
<p class="fragment fade-in">The purpose of design is to allow us to do design <em>later</em>.</p>
<p class="fragment fade-in">💸 _The primary goal is reducing the cost of change._ 💸</p>

<..>

## Design Solves Problems

* It doesn't have to be productivity versus happiness
* Because change is unavoidable, design matters
* Applications that are easy to change are a joy to write

<p class="fragment fade-in">The Goal: _Flexible &amp; Adaptable_ Apps</p>

<..>

## Sandi Says...

"Agile believes that your customers can't define the software they want before seeing it, so it's best to show them sooner rather than later. If this premise is true, then it logically follows that you should build software in tiny increments, gradually iterating your way into an application that meets the customer's true need."

<..>

## Sandi Says...

"If Agile is correct, two other things are also true. First, there is absolutely no point in doing a Big Up Front Design (BUFD) (because it cannot possibly be correct), and second, no one can predict when the application will be done (because you don't know in advance what it will eventually do)."

<p class="fragment fade-in">(discuss)</p>

<..>

## 🚨🚨🚨 WARNING! 🚨🚨🚨

![warning](/images/warning.gif)

<..>

## 🚨🚨🚨 WARNING! 🚨🚨🚨

<p class="fragment fade-in">Successful but _undesigned_ applications carry the seeds of their own destruction.</p>
<p class="fragment fade-in">They are easy to write but gradually become impossible to change.</p>
<p class="fragment fade-in">If you cannot write well-designed code, you'll have to rewrite your application during every iteration.</p>

<..>

## 🚨🚨🚨 WARNING! 🚨🚨🚨

<p class="fragment fade-in">You must do the best you can in the time you have.</p>
<p class="fragment fade-in">When the act of design prevents software from being delivered on time, you have lost.</p>

<..>

## Intro to OOD

![message passing](images/message-passing.gif)

<..>

## Intro to OOD

<div style="font-size:28px;">
  <p class="fragment fade-in">Objects have behavior <em>and</em> may contain data, to which they alone control access.</p>
  <p class="fragment fade-in">Objects invoke one another's behavior by sending each other <em>messages</em>.</p>
  <p class="fragment fade-in">Every object decides for itself how much, or how little, of its data to expose.</p>
  <p class="fragment fade-in">Objects have <em>types</em> which tell other objects what messages they respond to.</p>
  <p class="fragment fade-in">OO languages allow you to create new types of your own!</p>
</div>
