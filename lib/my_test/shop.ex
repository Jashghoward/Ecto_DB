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

    # def create_shop(attrs) do
    #   %Shop{}
    #   |> Shop.changeset(attrs)
    #   |> Repo.insert()
    # end

    # Create a new shop with this function
    def create_shop(shop_name) do
      result = %Shop{name: shop_name}
      Repo.insert!(result)
      IO.puts("New shop has been created #{result}")
    end

    def list_shops do
      all_shops = Repo.all(Shop)

        IO.puts("List of all shops:")
        Enum.each(all_shops, fn shop ->
        IO.puts("#{shop.name}")
      end)
    end
  end
