  defmodule MyTest.Shop do
    import Ecto.Changeset
    use Ecto.Schema
    alias MyTest.{Movie}


    schema "shops" do
      field(:name, :string)
      timestamps()

      has_many(:movies, Movie)
    end

    def changeset(shop, params \\ %{}) do
      shop
      |> cast(params, [:name])
      |> validate_required(:name)
      |> unique_constraint(:name)
    end
  end

  defmodule MyApp.ShopContext do
    alias MyTest.{Repo, Shop}

    def create_shop(attrs) do
      %Shop{}
      |> Shop.changeset(attrs)
      |> Repo.insert()
    end
  end
