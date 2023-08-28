import Config


config :my_test, :ecto_repos, [MyTest.Repo]

config :my_test, MyTest.Repo,
database: "my_test",
username: "joshhoward",
password: "",
hostname: "localhost"
