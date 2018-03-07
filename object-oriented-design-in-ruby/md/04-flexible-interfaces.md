## Creating Flexible Interfaces

<p class="fragment fade-in">Interface vs. `interface`</p>

<..>

## Communication Patterns

![commication patterns](images/communication-patterns.png)

<..>

## Find the Public Interface

<p class="fragment fade-in">Use Sequence Diagrams</p>
<p class="fragment fade-in"><em>One way of doing this is UML modeling</em></p>

<..>

<p style="height:500px;">![first step](images/uml-1.jpeg)</p>

<..>

<p style="height:500px;">![second step](images/uml-2.jpeg)</p>

<..>

<p style="height:500px;">![third step](images/uml-3.jpeg)</p>

<..>

## Some Helpful Categories

* Public vs. Private interfaces
* "what" vs. "how"

<..>

## Be Very Cautious

```ruby
customer.bicycle.wheel.tire
customer.bicycle.wheel.rotate
hash.keys.sort.join(', ')
```

<p class="fragment fade-in">"Trainwrecks waiting to happen"</p>
<p class="fragment fade-in">It's like saying, "there's some behavior way over there that I need right here and _I know how to go get it._"</p>

NOTE:
The Law of Demeter

<..>

Your familiarity with the public interfaces of known objects may lead you to string together long message chains to get at distant behavior.

<..>

## Summary:

## Creating Flexible Interfaces

* OOP is defined by messages that pass between objects.
* This message passing takes place along "public" interfaces.
* Well-defined public interfaces consist of stable methods that expose the responsibilities of their underlying classes and provide maximal benefit at minimal cost.
* We want to pass _trusting_ messages that ask for waht the sender wants without telling the receiver how to behave.
