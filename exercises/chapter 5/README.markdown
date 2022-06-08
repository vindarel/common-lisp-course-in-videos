
# Exercise: fetching GitHub's API

Request the GitHub's API for data about a user and display it nicely.

Create a new project with an .asd system definition and a `src/`
directory. Use our
[cl-cookieproject](https://github.com/vindarel/cl-cookieproject)
generator ([demo video](https://www.youtube.com/watch?v=XFc513MJjos))
or copy-paste an existing .asd file.

Have a quick look at https://docs.github.com/en/rest/guides/getting-started-with-the-rest-api

Use the [Dexador](https://github.com/fukamachi/dexador/) library to
fire the HTTP GET request. `dex:get` returns **multiple values**, see
its documentation. The first one is the JSON content, as a
string. Isolate the HTTP request inside a function of its own.

Use the [Jonathan](https://github.com/Rudolph-Miller/jonathan) library to parse JSON. `jojo:parse` returns a property list:

```lisp
(:|updated_at| "2021-10-12T17:43:42Z" :|created_at| "2013-02-27T21:51:12Z"
 :|email| NIL :|location| "France" :|blog| "https://lisp-journey.gitlab.io/"
 :|company| NIL :|name| "vindarel" :|site_admin| NIL :|type| "User"
 …)
```

Its keys are symbols that respect the case: `:|foo|`. Access elements with `getf` (or the `access` library).


## Example input:

    https://api.github.com/users/vindarel/

No authentication is required for that URL (rate limit to 60 requests per hour with no authentication).

## Expected output:

Prettily print:

- the user's name, email, location, blog, twitter_username, bio, company,
- its number of public repositories,
- account creation date, account update date.

First simply print a data per line, then try yourself at printing a
justified table. Use `format` or use any library.

While you're at it, you can…

- handle the case when a user doesn't exist (check the API's return code)
- build a binary, accept CLI args (the username, display options, help…)
- compute the number of years, months and days the user created his account, like "created 2 years, 3 months ago". Use the [local-time](https://lispcookbook.github.io/cl-cookbook/dates_and_times.html#the-local-time-library) library and look for others.
- get the user's `repos` (not "projects") and sort them by number of stars
- cache requests. I liked [function-cache](https://github.com/AccelerationNet/function-cache)
- save notes about a user on disk and restore them
  - format the notes in markdown
- …

# Demo video

In this video I show how I inspect the GitHub API and the libraries I
use to do the HTTP requests and parse JSON: Dexador, Jonathan, Shasht,
Serapeum: [How to make requests to GitHub's REST API in Lisp](https://www.youtube.com/watch?v=TAtwcBh1QLg).
