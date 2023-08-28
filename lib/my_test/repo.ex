defmodule MyTest.Repo do

  use Ecto.Repo,
  otp_app: :my_test,
  adapter: Ecto.Adapters.Postgres



end
