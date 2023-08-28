defmodule MyTest.Movie do
  import Ecto.Changeset
  use Ecto.Schema
  alias MyTest.{Rental}

  schema "movies" do
    field(:title, :string)
    field(:category, :string)
    belongs_to(:shop, MyTest.Shop)

    timestamps()
    has_many :rentals, Rental
  end

  def changeset(movie, params \\ %{}) do
    movie
    |> cast(params, [:title, :category, :shop_id])
    |> validate_required([:title, :category, :shop_id])
  end


end
