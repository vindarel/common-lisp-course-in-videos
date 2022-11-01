
# Exercises

## Using HANDLER-CASE

You are writing a library that does an HTTP request.

1. do the request in a simple function, that is simply a wrapper around `dex:get`.
2. write another function that calls this first one, but that handles the max of conditions you can think of:
   - handle usocket errors (host not found…)
   - handle Dexador errors (handle 400, 404 and 500 error codes)
   - handle any other error
3. if you catch any other unexpected error, return a condition of yours and give the maximum context inside custom slots.
4. find a way to have automated tests. Even if you don't setup a test framework like FiveAM yet, have some code that mimicks network errors, without actually calling the `dex:get` function, and have assertions that check that you get the expected result.
   - how do you programmatically check that an error was signaled, how do you run all tests without stopping at the first error? You're closer to wanting a test framework…
   - when you run the tests from the CLI, be sure to return the error code 1 in case of errors.

## MY-IGNORE-ERRORS

The `ignore-errors` macro is easily constructed with `handler-case`: catch all errors and return two values: NIL and the condition object.

You can try this pattern in your code and ensure that you don't see any difference with `ignore-errors`.

But, if you want to factor out the pattern, you'll quickly realize that you need to do it with a macro. What you can do now is do it with a function, and realize it doesn't work.

Writing the macro is for another chapter. But, jump at `ignore-errors`' definition to see that it is a simple macro. Hint: you don't need `sb-xc:defmacro` but simply `defmacro`.
