
#|

Example bits and pieces.


(dex:get "https://api.github.com/users/vindarel")
"{\"login\":\"vindarel\",\"id\":3721004,\"node_id\":\"MDQ6VXNlcjM3MjEwMDQ=\",\"avatar_url\":\"https://avatars.githubusercontent.com/u/3721004?v=4\",\"gravatar_id\":\"\",\"url\":\"https://api.github.com/users/vindarel\",\"html_url\":\"https://github.com/vindarel\",\"followers_url\":\"https://api.github.com/users/vindarel/followers\",\"following_url\":\"https://api.github.com/users/vindarel/following{/other_user}\",\"gists_url\":\"https://api.github.com/users/vindarel/gists{/gist_id}\",\"starred_url\":\"https://api.github.com/users/vindarel/starred{/owner}{/repo}\",\"subscriptions_url\":\"https://api.github.com/users/vindarel/subscriptions\",\"organizations_url\":\"https://api.github.com/users/vindarel/orgs\",\"repos_url\":\"https://api.github.com/users/vindarel/repos\",\"events_url\":\"https://api.github.com/users/vindarel/events{/privacy}\",\"received_events_url\":\"https://api.github.com/users/vindarel/received_events\",\"type\":\"User\",\"site_admin\":false,\"name\":\"vindarel\",\"company\":null,\"blog\":\"https://lisp-journey.gitlab.io/\",\"location\":\"France\",\"email\":null,\"hireable\":null,\"bio\":\"Full stack developer.\",\"twitter_username\":null,\"public_repos\":167,\"public_gists\":15,\"followers\":148,\"following\":16,\"created_at\":\"2013-02-27T21:51:12Z\",\"updated_at\":\"2021-10-12T17:43:42Z\"}"
200
(dict
  "server" "GitHub.com"
  "date" "Tue, 26 Apr 2022 04:23:55 GMT"
  "content-type" "application/json; charset=utf-8"
  "cache-control" "public, max-age=60, s-maxage=60"
  "vary" "Accept, Accept-Encoding, Accept, X-Requested-With"
  "etag" "W/\"9fe46994c34fcdf3ce4ac6c9fa54ad7ff78b2b67bd4bb4996faaea9d00529297\""
  "last-modified" "Tue, 12 Oct 2021 17:43:42 GMT"
  "x-github-media-type" "github.v3; format=json"
  "access-control-expose-headers" "ETag, Link, Location, Retry-After, X-GitHub-OTP, X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Used, X-RateLimit-Resource, X-RateLimit-Reset, X-OAuth-Scopes, X-Accepted-OAuth-Scopes, X-Poll-Interval, X-GitHub-Media-Type, X-GitHub-SSO, X-GitHub-Request-Id, Deprecation, Sunset"
  "access-control-allow-origin" "*"
  "strict-transport-security" "max-age=31536000; includeSubdomains; preload"
  "x-frame-options" "deny"
  "x-content-type-options" "nosniff"
  "x-xss-protection" "0"
  "referrer-policy" "origin-when-cross-origin, strict-origin-when-cross-origin"
  "content-security-policy" "default-src 'none'"
  "x-ratelimit-limit" "60"
  "x-ratelimit-remaining" "59"
  "x-ratelimit-reset" "1650950635"
  "x-ratelimit-resource" "core"
  "x-ratelimit-used" "1"
  "accept-ranges" "bytes"
  "content-length" "1222"
  "x-github-request-id" "ABD4:D2C6:7C417DE:7E44508:626773DB"
 )
#<QURI.URI.HTTP:URI-HTTPS https://api.github.com/users/vindarel>
#<CL+SSL::SSL-STREAM for #<FD-STREAM for "socket 192.168.1.53:43988, peer: 140.82.121.6:443" {1009238ED3}>>


(jojo:parse "{\"login\":\"vindarel\",\"id\":3721004,\"node_id\":\"MDQ6VXNlcjM3MjEwMDQ=\",\"avatar_url\":\"https://avatars.githubusercontent.com/u/3721004?v=4\",\"gravatar_id\":\"\",\"url\":\"https://api.github.com/users/vindarel\",\"html_url\":\"https://github.com/vindarel\",\"followers_url\":\"https://api.github.com/users/vindarel/followers\",\"following_url\":\"https://api.github.com/users/vindarel/following{/other_user}\",\"gists_url\":\"https://api.github.com/users/vindarel/gists{/gist_id}\",\"starred_url\":\"https://api.github.com/users/vindarel/starred{/owner}{/repo}\",\"subscriptions_url\":\"https://api.github.com/users/vindarel/subscriptions\",\"organizations_url\":\"https://api.github.com/users/vindarel/orgs\",\"repos_url\":\"https://api.github.com/users/vindarel/repos\",\"events_url\":\"https://api.github.com/users/vindarel/events{/privacy}\",\"received_events_url\":\"https://api.github.com/users/vindarel/received_events\",\"type\":\"User\",\"site_admin\":false,\"name\":\"vindarel\",\"company\":null,\"blog\":\"https://lisp-journey.gitlab.io/\",\"location\":\"France\",\"email\":null,\"hireable\":null,\"bio\":\"Full stack developer.\",\"twitter_username\":null,\"public_repos\":167,\"public_gists\":15,\"followers\":148,\"following\":16,\"created_at\":\"2013-02-27T21:51:12Z\",\"updated_at\":\"2021-10-12T17:43:42Z\"}" )

(:|updated_at| "2021-10-12T17:43:42Z" :|created_at| "2013-02-27T21:51:12Z"
 :|following| 16 :|followers| 148 :|public_gists| 15 :|public_repos| 167
 :|twitter_username| NIL :|bio| "Full stack developer." :|hireable| NIL
 :|email| NIL :|location| "France" :|blog| "https://lisp-journey.gitlab.io/"
 :|company| NIL :|name| "vindarel" :|site_admin| NIL :|type| "User"
 :|received_events_url| "https://api.github.com/users/vindarel/received_events"
 :|events_url| "https://api.github.com/users/vindarel/events{/privacy}"
 :|repos_url| "https://api.github.com/users/vindarel/repos"
 :|organizations_url| "https://api.github.com/users/vindarel/orgs"
 :|subscriptions_url| "https://api.github.com/users/vindarel/subscriptions"
 :|starred_url| "https://api.github.com/users/vindarel/starred{/owner}{/repo}"
 :|gists_url| "https://api.github.com/users/vindarel/gists{/gist_id}"
 :|following_url|
 "https://api.github.com/users/vindarel/following{/other_user}"
 :|followers_url| "https://api.github.com/users/vindarel/followers" :|html_url|
 "https://github.com/vindarel" :|url| "https://api.github.com/users/vindarel"
 :|gravatar_id| "" :|avatar_url|
 "https://avatars.githubusercontent.com/u/3721004?v=4" :|node_id|
 "MDQ6VXNlcjM3MjEwMDQ=" :|id| 3721004 :|login| "vindarel")

See also the shasht library.

It returns a hash-table.
Now see also serapeum:dict and its toggle-pretty-print-hash-tables.

(local-time:parse-timestring "2013-02-27T21:51:12Z")
@2013-02-27T22:51:12.000000+01:00


|#
