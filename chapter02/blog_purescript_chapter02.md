# Chapter 2
## Starting out
Don't forget to start the project by using:

    pulp init

Also don't forget that you don't need to do:

    pulp build run

as pulp will do any needed compilation as part of 'run'.

## The REPL
Remember to use pulp rather than psci directly, so that you get implicit management of dependencies:

    pulp psci

And don't forget that you need the package `purescript-psci-support` to be installed with:

	bower install --save-dev purescript-psci-support

If you get the dreaded error:

    > 1 + 1
    Error found:
    in module $PSCI
    at  line 1, column 1 - line 1, column 5

    Unknown value (+)

The problem here is that you haven't imported the Prelude library.

    > import Prelude
    > 1 + 1
    2

You can check which libraries that you've got loaded in the repl by:

    > :show import

You can see which packages are available to `import` by using:

    > :show loaded

Although you can quit with `:quit` you can also quit by typing ^d (CTRL-d)

## Dependency management
The book suggests adding new dependencies by using:

    $ pulp dep install purescript-math --save

The problem  with this is that pulp has deprecated dependency management and recommends that you leave this to bower - in my view a bad call q.v. leiningen. For those unfamiliar with bower, the correct incantation is:

    bower install --save purescript-math
	
You'll also need:

	bower install --save purescript-console
	bower install --save purescript-eff

Personally I think it would be great if we could do the whole thing with npm, but heh :-/

If you want to know what bower components are installed, simply:

    bower list

Unfortunately pulp seems pretty messy, leaving a bunch of droppings in your directories:
* .cache
* .config
* .local
* .purescript
* .psci_modules
* .pulp_cache
* .psci

Ugh! Coming soon - how to manage your whole work-flow using `make` and ditch pulp completely...

## Exercise 1
The code for circleArea is pretty trivial:
```purescript
import Math (pi)
circleArea :: Number -> Number
circleArea radius = pi * radius * radius
```

Then start up the REPL with:
	
	make repl

The src/Main.purs gets loaded up into the REPL automagically, so we can just do:

	> import Main
	> circleArea 10.0
	314.1592653589793
	
For those used to Javascript - don't forget that you need to do `circleArea 10.0` rather than `circleArea 10` if you want to avoid a type-error because you can't multiply an Int by a Float without explicit conversion...

Remember that if you want to show something on the display, you can only use `log` for strings, as it has type `log :: forall eff. String -> Eff (console :: CONSOLE | eff) Unit` - for non-strings you'll have to use `logShow` which is also in the package `Control.Monad.Eff.Console` as described [here](https://pursuit.purescript.org/packages/purescript-console/1.0.0/docs/Control.Monad.Eff.Console). Get used to reading Pursuit for package definitions, it's a big help when things don't work out the way you expect, which is going to be a lot of the time to begin with... 

## Exercise 2
The purescript-globals package seems to include a rag-tag bag of JS functions that are presumably not covered by other libraries, e.g.
* nan
* isNaN
* infinity
* isFinite
* readInt
* readFloat
* and some stuff to do with URIs...

Make sure that you're in the chapter02 directory and then

    bower install --save purescript-globals

and then doing:

    make repl
    > import Global
    > nan
    NaN

Simples. The purescript-globals package contains two modules: Global and Global.Unsafe, which contains the following four functions:
* unsafeStringify
* unsafeToPrecision
* unsafeToFixed
* unsafeToExponential

These allow you to convert native JS things into strings (in an unsafe way). I'm not sure why these would be useful over a Type's Show mechanism, I'm guessing this may be a helper for foreign functions? Answers on a postcard please...
