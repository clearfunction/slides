## Managing Dependencies

In OOP, each message is initiated by an object to invoke some bit of behavior. All of the behavior is dispersed among the objects.

Therefore, for any desired behavior, an object either knows it personally, inherits it, or knows another object who knows it.

This section is about the third, getting access to behavior when that behavior is implemented in _other_ objects.

<..>

_Knowing_ creates a dependency.

If not managed carefully, these dependencies will stangle your application.

[gif here]

An object depends on another object if, when one object changes, the other might be forced to change in turn.

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

```bash
$ puts Gear.new(52, 11, 26, 1.5).gear_inches
# -> 137.090909090909
```

<..>

## Recognizing Dependencies

An object has a dependency when it knows:

* The name of another class.
* The name of a message that it intends to send to someone other than `self`.
* THe arguments that a message requires.
* The order of those arguments.

<..>

## Coupling Between Objects (CBO)

The more tightly coupled two objects are, the more they behave like a single entity.

![dependencies](images/dependencies.jpg)

When two (or three or more) objects are so tightly coupled that they behave as a unit, it's impossible to reuse just one. Changes to one force changes to all.

<..>

## Let's look at those four kinds of dependencies!

[gif here]

<..>

## Inject Dependencies

```ruby
class Gear
  attr_reader :chainring, :cog, :wheel
  def initialize(chainring, cog, wheel)
    @chainring = chainring
    @cog = cog
    @wheel = wheel
  end

  def gear_inches
    ratio * wheel.diameter
  end
# ...
end
```

```bash
# Gear expects a `Duck` that knows `diameter`
$ puts Gear.new(52, 11, Wheel.new(26, 1.5)).gear_inches
# -> 137.090909090909
```

<..>

`Gear` doesn't know or care that the object might be an instance of class `Wheel`. `Gear` only knows that it holds an object that responds to `diameter`.

`Gear` is now smarter because it knows less.

<..>

## Isolate Dependencies

* Isolate Instance Creation
* Isolate Vulnerable External Messages

<..>

## Isolate Instance Creation

```ruby
class Gear
  attr_reader :chainring, :cog, :wheel
  def initialize(chainring, cog, rim, tire)
    @chainring = chainring
    @cog = cog
    @wheel = Wheel.new(rim, tire)
  end

  def gear_inches
    ratio * wheel.diameter
  end
# ...
```

<..>

## Isolate Instance Creation

```ruby
class Gear
  attr_reader :chainring, :cog, :rim, :tire, :wheel
  def initialize(chainring, cog, rim, tire)
    @chainring = chainring
    @cog = cog
    @rim = rim
    @tire = tire
  end

  def gear_inches
    ratio * wheel.diameter
  end

  def wheel
    @wheel ||= Wheel.new(rim, tire)
  end

end
```

<..>

## Isolate Vulnerable External Messages

```ruby
def gear_inches
  ratio * wheel.diameter
end
```

This is pretty benign, but...

<..>

## 😱😱😱

```ruby
def gear_inches
  #... a few lines of scary math
  foo = some_intermediate_result * wheel.diameter
  #... more lines of scary math
end
```

[scared gif here]

<..>

```ruby
def gear_inches
  #... a few lines of scary math
  foo = some_intermediate_result * diameter
  #... more lines of scary math
end

def diameter
  wheel.diameter
end
```

[confident gif here]

<..>

## Remove Argument-Order Dependencies

```ruby
class Gear
  attr_reader :chainring, :cog, :wheel
  def initialize(chainring, cog, wheel)
    @chainring = chainring
    @cog = cog
    @wheel = wheel
  end
# ...
end

Gear.new(
  52,
  11,
  Wheel.new(26, 1.5)
).gear_inches
```

<..>

## Use named parameters for initialization arguments

```ruby
class Gear
  attr_reader :chainring, :cog, :wheel
  def initialize(chainring:, cog:, wheel:)
    @chainring = chainring
    @cog = cog
    @wheel = wheel
  end
# ...
end

Gear.new(
  cog: 11,
  wheel: Wheel.new(26, 1.5),
  chainring: 52
).gear_inches
```

<..>

## Explicitly define defaults

```ruby
class Gear
  attr_reader :chainring, :cog, :wheel
  def initialize(chainring: 40, cog: 18, wheel:)
    @chainring = chainring
    @cog = cog
    @wheel = wheel
  end
# ...
end

Gear.new(
  wheel: Wheel.new(26, 1.5),
  chainring: 52
)
#<Gear:0x007fd05a13c040 @chainring=52, @cog=18, @wheel=#<Wheel:0x007fd05a13c090 @rim=26, @tire=1.5>>
```

<..>

## Managing Dependency Direction

```ruby
class Gear
  attr_reader :chainring, :cog,
  def initialize(chainring, cog)
    @chainring = chainring
    @cog = cog
  end

  def gear_inches(diameter)
    ratio * diameter
  end

  def ratio
    chainring / cog.to_f
  end
# ...
end
```

<..>

```ruby
class Wheel
  attr_reader :rim, :tire, :gear
  def initialize(rim, tire, chainring, cog)
    @rim = rim
    @tire = tire
    @gear = Gear.new(chainring, cog)
  end

  def diameter
    rim + (tire * 2)
  end

  def gear_inches(diameter)
    gear.gear_inches(diameter)
  end
# ...
end
```

```bash
$ Wheel.new(26, 1.5, 52, 11).gear_inches
```

<..>

## Choosing dependency direction

* Some classes are more likely than others to have changes in requirements.
* Concrete classes are more likely to change than abstract classes.
* Changing a class that has many dependents will result in widespread consequences.

<..>

![danger zones](images/danger-zones.png)

<..>

## General rule

_Depend on things that change less often than you do._

<..>

## Summary: Managing Dependencies

* This is one way to future-proof applications.
* Injecting dependencies creates loosely coupled objects that can be reused in novel ways.
* Isolating dependencies allows objects to quickly adapt to unexpected changes.
* The key to managing dependencies is to control their direction.
