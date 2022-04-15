# DatingApp

To start your Phoenix server:

  * Setup the alias with `alias phx="docker run --rm -it -w /app -v $(pwd)/src:/app -p 4000:4000 --network dating-app-network phx"`
  * Start the data layer with `bash db.sh`
  * Start the docker container with `phx bash`
  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix

## To do:

* Profiles system
  * Updating your profile doesn't need to go through the event system
  * Just use phoenix to generate the profile, then remember to send the open profile command when creating an account
* Stack system
  * Create another read model that tracks likes and dislikes in order to generate a list of profiles to swipe through
  * Track location and use that to generate new stacks
  * Elastic search
    * Yeah, definitely throw everything into elastic search
    * Question is if we should duplicate data between postgres and elasticsearch
  * https://medium.com/tinder-engineering/geosharded-recommendations-part-1-sharding-approach-d5d54e0ec77a
* Photo system
  * Upload photos to S3
* Rich messaging
  * Currently we just send a string, but it would be cool to allow emoji reactions & some formatting
* Stack system
  * Elastic search fields:
    * ID
    * Name
    * Date of birth
    * Gender
    * Gender preference
  * Postgres? fields:
    * ID
    * Name
    * Date of birth
    * Gender
    * Photos
    * Bio
    * Location
  * Shard users into different elastic search instances based on location
