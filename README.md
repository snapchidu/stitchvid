[![Build Status](https://travis-ci.org/snapchidu/stitchvid.svg?branch=develop)](https://travis-ci.org/snapchidu/stitchvid)

User stories:

- [] As a user,
      So that I can see the latest videos
      I want to see a list of videos on the homepage

- [] As a user
     So that I can add to latest videos
     I want to upload to the app

- [] As an admin
     So that my website doesn't crash
     I want to store my videos efficiently

- [] As a user,
     So that I can see videos by a topic (#hashtag)
     I want to view curated topics on the homepage

- [] As a user,
     So that I can add my own interests
     I want to be able to add my own topics (#hashtags) to homepage

- [] As a user,
     So that I can contribute to hashtags I am interested in
     I want to upload videos directly to a specific hashtag

- [] As a user
     So that I can get a visual narrative of a particular topic (#hashtag)
     I want to be able to stitch videos together

- [] As a user
     So that others don't upload instead of me
     I want to have to login to upload a video

[!Waffle](https://waffle.io/snapchidu/stitchvid)

## Installation instructions

### YouTube API setup

There are two sets of credentials needed for this application to work.

1) Video processing will not work until you create a YouTube token for authorising general API requests.
To do this go to https://console.developers.google.com/project and create a project,
then in the credentials section select 'Create new key', and copy the resulting
API key using `export YOUTUBE_AUTH_TOKEN='yourkeyhere'`` in ``.bash_profile` then
reload your shell. Without this, uploaded videos will not be published on the site.

2) Log in will not work until you create a YouTube OAuth token pair from the same location, and save
them as env variables YT_CLIENT_ID and YT_CLIENT_SECRET in the same way. You'll need to set a Redirect URI of `https://[yourlocation]/auth/google_oauth2/callback` and a JavaScript origin of `https://[yourlocation]/`. Without
these you won't be able to log into Google and upload videos via the application.

3) You'll need to enable YouTube Data API v3, Contacts API, and Google+ API in the project APIs menu and wait some time for them to become effective as well.

### Local Installation

Set up the Google project for API access, set the enabled URLs to localhost, add the tokens to ~/.bash-profile and reload shell.
```
git clone https://github.com/snapchidu/stitchvid.git
cd stitchvid
bundle
bin/rake db:create RAILS_ENV=test
bin/rake db:create RAILS_ENV=development
bin/rake db:migrate RAILS_ENV=test
bin/rake db:migrate RAILS_ENV=development
bin/rails s
```

### Heroku Installation from Shell

Based on https://devcenter.heroku.com/articles/getting-started-with-rails4

Authorise your Heroku account using `heroku auth`, and cd to the local repo in shell.
```
heroku create
git push heroku [yourbranchname]:master
heroku config:set YOUTUBE_AUTH_TOKEN=whateveritis
heroku config:set YT_CLIENT_ID=whateveritis
heroku config:set YT_CLIENT_SECRET=whateveritis
heroku run rake db:migrate
heroku ps:scale web=1
heroku open
```

Also `heroku config` to check config vars, `heroku run bash` to get shell and `heroku -t logs` to get live logging are useful.

To attach a local repo to an existing heroku instance, use `heroku git:remote -a [heroku instance name]`.
