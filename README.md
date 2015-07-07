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

You should create a YouTube token for authorising general API requests.
To do this go to https://console.developers.google.com/project and create a project,
then in the credentials section select 'Create new key', and copy the resulting
API key using `export YOUTUBE_AUTH_TOKEN='yourkeyhere'`` in ``.bash_profile` then
reload your shell. Without this, uploaded videos will not be published on the site.

You should also create a YouTube OAuth2 token pair from the same location, and save
them as env variables YT_CLIENT_ID and YT_CLIENT_SECRET in the same way. Without
these you won't be able to log into Google and upload videos via the application.
