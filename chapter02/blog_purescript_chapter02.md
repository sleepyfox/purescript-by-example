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

## Dependency management
The book suggests adding new dependencies by using:

    $ pulp dep install purescript-math --save

The problem  with this is that pulp has deprecated dependency management and recommends that you leave this to bower - in my view a bad call q.v. leiningen. For those unfamiliar with bower, the correct incantation is:

    bower install --save purescript-math

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
circleArea :: Number -> Number
circleArea radius = pi * radius * radius
```

For those used to Javascript - don't forget that you need to do `circleArea 2.0` rather than `circleArea 2` if you want to avoid a type-error because you can't multiply an Int by a Float without explicit conversion...

## Exercise 2
The purescript-globals
