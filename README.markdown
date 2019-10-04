## Twitter Demo

This application is a simplistic example of consuming the Twitter
REST API from a Rails app.

It uses the [Twitter gem](https://github.com/sferik/twitter) to
fetch tweets from a user's timeline and display them on the page
in a basic UI.

### Setup

```
git clone git@github.com:sujithps/webcrawl.git
cd webcrawl
bundle
rake db:create db:migrate
rails s
```

(Yes, the API credentials are hardcoded in the app. This makes it easier for students to set up.)
