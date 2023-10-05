defmodule MyTest.Movie do
  import Ecto.Changeset
  use Ecto.Schema
  alias MyTest.{Repo, Rental, Movie}
  import Ecto.Query

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


  def list_movie do
    query = from(m in Movie, join: s in assoc(m, :shop), select: {m.title, s.name})
    movies_with_shop_names = Repo.all(query)
  # Print the list of movies and their associated shop names
    IO.puts("List of movies with their associated shop names:")
    Enum.each(movies_with_shop_names, fn {movie_title, shop_name} ->


      IO.puts("#{movie_title} (Shop: #{shop_name})")
    end)
  end

  def create_movie do
    new_movie = %Movie{title: "New Movie", category: "Action", shop_id: 1} # Replace 1 with the actual shop ID
    Repo.insert!(new_movie)


    IO.puts("New movie added successfully.")
  end
end
