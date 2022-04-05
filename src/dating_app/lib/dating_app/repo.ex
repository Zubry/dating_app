defmodule DatingApp.Repo do
  use Ecto.Repo,
    otp_app: :dating_app,
    adapter: Ecto.Adapters.Postgres
end
