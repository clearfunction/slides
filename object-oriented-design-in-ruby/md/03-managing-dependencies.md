## More on OOP

<p class="fragment fade-in">All of the behavior is dispersed among the objects.</p>
<p class="fragment fade-in">Each message is initiated to invoke some bit of behavior.</p>
<p class="fragment fade-in">Therefore, for any desired behavior, an object either:</p>
<p class="fragment fade-in">• knows it personally</p>
<p class="fragment fade-in">• inherits it</p>
<p class="fragment fade-in">• knows another object who knows it</p>

<..>

## Managing Dependencies

Subject: accessing behavior implemented in _other_ objects.

![dependent](images/dependent-1.gif)

<..>

## Things to Consider

_Knowing_ creates a dependency.

![dependent](images/knowing.gif)

<p class="fragment fade-in">If not managed carefully, these dependencies will stangle your application.</p>

<..>

## Defining Dependency

An object depends on another object if, when one object changes, the other might be forced to change in turn.

![dependent](images/dependent-2.gif)

<..>

## Recognizing Dependencies

An object has a dependency when it knows:

1.  The name of another class.
2.  The name of a message that it intends to send to someone other than `self`.
3.  The arguments that a message requires.
4.  The order of those arguments.

<..>

## Back to our little journey

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

## Coupling Between Objects

![dependencies](images/dependencies.jpg)

<p class="fragment fade-in">Objects behave like a single entity.</p>
<p class="fragment fade-in">Relatively impossible to reuse <em>just one</em>.</p>
<p class="fragment fade-in">Changes to one force changes to <em>all</em>.</p>

<..>

## Let's look at those dependencies

![sobbing](images/sobbing.gif)

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

`Gear` doesn't "know or care" that the object might be an instance of class `Wheel`. `Gear` only knows that it holds an object that responds to `diameter`.

<p class="fragment fade-in">`Gear` is now smarter because it knows less.</p>

<..>

## Ways to Isolate Dependencies

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

Isolating Instance Creation, Part Deux

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

<p class="fragment fade-in">This is pretty benign, but...</p>

<..>

## 😱😱😱

```ruby
def gear_inches
  #... a few lines of scary math
  foo = some_intermediate_result * wheel.diameter
  #... more lines of scary math
end
```

<p class="fragment fade-in">![scared](images/scared.gif)</p>

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

<p class="fragment fade-in">![confident](images/confident.gif)</p>

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

Use named parameters for initialization arguments

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

Explicitly define defaults

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

<p class="fragment fade-in">Some classes are more likely than others to require changes.</p>
<p class="fragment fade-in">Concrete classes change more likely than abstractions.</p>
<p class="fragment fade-in">Changing a class with many dependents can end poorly.</p>

<..>

![danger zones](images/danger-zones.png)

<..>

## General rule

_Depend on things that change less often than you do._

<..>

## Summary:

## Managing Dependencies

* This is one way to future-proof applications.
* Injecting dependencies creates loosely coupled objects that can be reused in novel ways.
* Isolating dependencies allows objects to quickly adapt to unexpected changes.
* The key to managing dependencies is to control their direction.
