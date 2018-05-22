## Demo



## Getting started

To get started with the app, clone the repo and then install the needed gems:

```
$ bundle install --without production
```

Next, migrate the database:

```
$ rails db:migrate
```

If the test suite passes, you'll be ready to run the app in a local server:

```
$ rails s
```

Once you're in the application, navigate to /help for instructions on connecting
to your Twilio account.
