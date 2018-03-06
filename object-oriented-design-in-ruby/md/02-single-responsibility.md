## Designing Classes with a Single Responsibility

<p class="fragment fade-in">Subject: <em>what belongs in a class</em></p>
<p class="fragment fade-in">Mission: <em>insist that it be simple</em></p>

<..>

## First Things First

<p class="fragment fade-in">The foundation of an object-oriented system is the <em>message</em>, but the most visible organizational structure is the <em>class</em>.</p>
<p class="fragment fade-in">See that it does what it is supposed to do <em>right now</em> and is also easy to change <em>later</em>.</p>

<..>

## Sandi Says...

"The quality of easy changeability reveals the craft of programming."

![craft](images/craft.gif)

<..>

## Easy to change:

* Changes have no unexpected side effects
* Small changes in requirements require correspondingly small changes in code
* Existing code is easy to reuse
* The easiest way to make a change is to add code that in itself is easy to change

<..>

## Code qualities:

* **Transparent** - Obvious consequences of change
* **Reasonable** - Proportional cost and benefits
* **Usable** - Usable in new and unexpected contexts
* **Exemplary** - Encourages perpetuating these qualities

<p class="fragment fade-in">Let's write <em>TRUE</em> code!</p>

<..>

## Let's talk about SRP

![responsibility](images/responsibility-1.gif)

<p class="fragment fade-in">In principle, classes should have a single responsibility.</p>
<p class="fragment fade-in">That is, a class should do the smallest possible useful thing.</p>

<..>

## Let's talk about SRP

![responsibility](images/responsibility-2.gif)

<p class="fragment fade-in">Apps are easy to change when classes are easy to reuse.</p>
<p class="fragment fade-in">A class with more than one responsiblity is difficult to reuse.</p>
<p class="fragment fade-in">You increase your application's chance of breaking unexpectedly if you depend on classes that do too much.</p>

<..>

## Determining if a Class Has a Single Responsibility

* Answer the question: What does it do?
* You can't use the word "and"
* You can't use the word "or"

![happy programmer](images/happy-programmer.gif)

<..>

## Determining if a Class Has a Single Responsibility

"SRP doesn't require that a class do only one very narrow thing or that it change for only a single nitpicky reason, instead SRP requires that a class be cohesive -- that everything the class does be highly related to its purpose."

![frustrated programmer](images/stressed-programmer.gif)

<..>

## When to Make Design Decisions

"When the future cost of doing nothing is the same as the current cost, postpone the decision. Make the decision only when you must with the information yo uhave at that time."

<p class="fragment fade-in">(dicuss)</p>
<p class="fragment fade-in">This is a tension to live in.</p>

<..>

## Code that Embraces Change

* Depend on behavior, not data
* Hide instance variables
* Hide data structures
* Extract extra responsibilities from methods
* Isolate extra responsibilities in classes

<..>

## An SRP Refactoring Journey

<p class="fragment fade-in">![bicycle gears](/images/gears.jpg)</p>

<..>

```ruby
class Gear
  attr_reader :chainring, :cog
  def initialize(chainring, cog)
    @chainring = chainring
    @cog = cog
  end

  def ratio
    chainring / cog.to_f
  end

end
```

```bash
$ puts Gear.new(52, 11).ratio
# -> 4.72727272727273
```

<..>

## New requirements

![bicycle wheels](/images/wheels.png)

<..>

```ruby
class Gear
  attr_reader :chainring, :cog, :rim, :tire
  def initialize(chainring, cog, rim, tire)
    @chainring = chainring
    @cog = cog
    @rim = rim
    @tire = tire
  end

  def ratio
    chainring / cog.to_f
  end

  def gear_inches
    ratio * (rim * (tire * 2))
  end

end
```

```bash
$ puts Gear.new(52, 11, 26, 1.5).gear_inches
# -> 137.090909090909

$ puts Gear.new(52, 11).ratio # didn't this used to work?
# ArgumentError: wrong number of arguments (2 for 4)
```

<..>

```ruby
class Gear
  attr_reader :chainring, :cog, :rim, :tire
  def initialize(chainring, cog, rim, tire)
    @chainring = chainring
    @cog = cog
    @rim = rim
    @tire = tire
  end

  def gear_inches
    ratio * Wheel.new(rim, tire).diameter
  end

  def ratio
    chainring / cog.to_f
  end

end
```

<..>

```ruby
class Wheel
  attr_reader :rim, :tire
  def initialize(rim, tire)
    @rim = rim
    @tire = tire
  end

  def diameter
    rim + (tire * 2)
  end

  def circumference
    diameter * Math::PI
  end

end
```

<..>

```bash
$ @wheel = Wheel.new(26, 1.5)
$ puts @wheel.circumference
# -> 91.106186954104

$ puts Gear.new(52, 11, @wheel).gear_inches
# -> 137.090909090909

$ puts Gear.new(52, 11).ratio
# -> 4.72727272727273
```

<..>

## Summary: SRP Classes

* Changeable, maintainable software begins with classes that have a single responsibility.
* Classes that do one thing _isolate_ that thing from the rest of your application.
* This isolation allows change without consequence and reuse without duplication.
