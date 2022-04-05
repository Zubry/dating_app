# DatingApp

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix

## To do:

* Messaging system
  * Read from the read model to ensure users are matched, then emit a message event
  * Matches Read Model can listen for the message event to show the last sent message
* Profiles system
  * Updating your profile doesn't need to go through the event system
  * Just use phoenix to generate the profile, then remember to send the open profile command when creating an account
* Stack system
  * Create another read model that tracks likes, dislikes, and location updates in order to generate a list of profiles to swipe through
  * Should use postgres with postgis
* 
