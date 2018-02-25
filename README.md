# Simple BTC mining implementation in Elm

This is spike from workshop focused on bitcoin & block chain principles. If we would decide go further we could make this:

* make this works only via console (not HTML needed, the result should be printed directly into console)
* make timestamp correctly working. Getting current time/date is in Elm side-effect so it require more additional logic to handle side-effects.
* make module Transaction which would implement transaction logic (from, to, amount, returned amount)
* make some performance measurement and try optimise code (eg. try Trampoline strategy for recursion)
* make accepting block logic (I am not sure how it should works in principle yet)

### Run example
Install Elm https://guide.elm-lang.org/install.html

Generate and run html
```
$> elm-make Main.elm --output index.html
$> open index.html
```
