% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/gcalendr_auth.R
\name{calendar_auth_configure}
\alias{calendar_auth_configure}
\alias{calendar_oauth_app}
\title{Edit and view auth configuration}
\usage{
calendar_auth_configure(app, path)

calendar_oauth_app()
}
\arguments{
\item{app}{OAuth app, in the sense of \code{\link[httr:oauth_app]{httr::oauth_app()}}.}

\item{path}{JSON downloaded from Google Cloud Platform Console, containing a
client id (aka key) and secret, in one of the forms supported for the \code{txt}
argument of \code{\link[jsonlite:fromJSON]{jsonlite::fromJSON()}} (typically, a file path or JSON string).}
}
\value{
\itemize{
\item \code{calendar_auth_configure()}: An object of R6 class
\link[gargle:AuthState]{gargle::AuthState}, invisibly.
\item \code{calendar_oauth_app()}: the current user-configured
\code{\link[httr:oauth_app]{httr::oauth_app()}}.
}
}
\description{
These functions give more control over and visibility into the auth
configuration than \code{\link[=calendar_auth]{calendar_auth()}} does. \code{calendar_auth_configure()}
lets the user specify their own:
\itemize{
\item OAuth app, which is used when obtaining a user token.
See the vignette
\href{https://gargle.r-lib.org/articles/get-api-credentials.html}{How to get your own API credentials}
for more.
If the user does not configure these settings, internal defaults
are used.
\code{calendar_oauth_app()} retrieves the currently configured OAuth app.
}
}
\examples{
# see the current user-configured OAuth app (probaby `NULL`)
calendar_oauth_app()

if (require(httr)) {

  # store current state, so we can restore
  original_app <- calendar_oauth_app()

  # bring your own app via client id (aka key) and secret
  google_app <- httr::oauth_app(
    "my-awesome-google-api-wrapping-package",
    key = "123456789.apps.googleusercontent.com",
    secret = "abcdefghijklmnopqrstuvwxyz"
  )
  calendar_auth_configure(app = google_app)

  # confirm current app
  calendar_oauth_app()

  # restore original state
  calendar_auth_configure(app = original_app)
  calendar_oauth_app()
}

\dontrun{
# bring your own app via JSON downloaded from GCP Console
calendar_auth_configure(
  path = "/path/to/the/JSON/you/downloaded/from/gcp/console.json"
)
}

}
\seealso{
Other auth functions: \code{\link{calendar_auth}},
  \code{\link{calendar_deauth}}
}
\concept{auth functions}
