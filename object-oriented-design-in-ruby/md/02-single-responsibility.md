## Designing Classes with a Single Responsibility

The foundation of an object-oriented system is the _message_, but the most visible organizational structure is the _class_.

This section will cover _what belongs in a class_

_insist that it be simple_

make sure it does waht it is supposed to do _right now_ and is also easy to change _later_.

<..>

Sandi Says...

"The quality of easy changeability reveals the craft of programming."

Easy to change means:

* Changes have no unexpected side effects
* Small changes in requirements require correspondingly small changes in code
* Existing code is easy to reuse
* The easiest way to make a change is to add code that in itself is easy to change

<..>

Code qualities

* **Transparent** The consequences of change should be obvious in the code that is changeing and in distant code that relies upon it
* **Reasonable** The cost of any change should be proportional to the benefits the change acheives
* **Usable** Existing code should be usable in new and unexpected contexts
* **Exemplary** The code itself should encourage those who change it to perpetuate these qualities

Let's write _TRUE_ code!

<..>

## Let's talk about SRP

In principle, classes should have a single responsibility (SRP).

That is, a class should do the smallest possible useful thing.

Applications that are easy to change consist of classes taht are easy to reuse.

A class taht has more than one responsiblity is difficult to reuse.

You increase your application's chance of breaking unexpectedly if you depend on classes that do too much.

<..>

## Determining if a Class Has a Single Responsibility

* Answer the question: What does it do?
* You can't use the word "and"
* You can't use the word "or"

"SRP doesn't require that a class do only one very narrow thing or that it change for only a single nitpicky reason, instead SRP requires that a class be cohesive -- that everything the class does be highly related to its purpose."

<..>

## When to Make Design Decisions

"When the future cost of doing nothing is the same as the current cost, postpone the decision. Make the decision only when you must with the information yo uhave at that time."

(dicuss)

"This 'improve it now' versus 'improve it later' tension always exists."

<..>

## Writing Code that Embraces Change

* Depend on behavior, not data
* Hide instance variables
* Hide data structures
* Extract extra responsibilities from methods
* Isolate extra responsibilities in classes

<..>

## An SRP Refacorting Journey

![bicycle gears](/images/gears.jpg)

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
  attr_reader :chainring, :cog, :wheel
  def initialize(chainring, cog, wheel = nil)
    @chainring = chainring
    @cog = cog
    @wheel = wheel
  end

  def ratio
    chainring / cog.to_f
  end

  def gear_inches
    ratio * wheel.diameter
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
