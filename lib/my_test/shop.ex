  defmodule MyTest.Shop do
    import Ecto.Changeset
    use Ecto.Schema
    alias MyTest.{Movie, Repo, Shop}


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

    # def create_shop(shop_name) do
    #   result = %Shop{name: shop_name}
    #   Repo.insert!(result)

    #   IO.puts("New shop has been created #{result}")
    # end
  end
