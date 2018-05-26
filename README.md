# Read Me

To get started with the app, clone the repo and then install the needed gems:

```
$ bundle install --without production
```

Next, migrate the database:

```
$ rails db:migrate
```

You'll need to make an account with [Spotify Developer](https://beta.developer.spotify.com/dashboard/login)
to get Spotify API access keys.  Put those access keys in a .env file in your
root directory like below:

```
SPOTIFY_CLIENT_ID = "XXXXXXXX"
SPOTIFY_CLIENT_SECRET = "XXXXXXXX"
```

Set the Spotify callback link on Spotify Developer to your hosted environment.  

```
Example: http://localhost:3000/auth/spotify/callback
Example: http://heroku-project.com/auth/spotify/callback
```

Run the application

```
$ rails server
```
