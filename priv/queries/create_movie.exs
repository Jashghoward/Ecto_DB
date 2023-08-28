import ExUnit.Assertions





# Alias the Repo and Movie modules
# alias MyTest.{Repo, Movie}
import Ecto.Query

# # Create a new movie struct
# new_movie = %Movie{title: "New Movie", category: "Director Name"}

# # Insert the new movie into the database
# result = Repo.insert(new_movie)

# # Check the result
# IO.inspect(result)


# # Fetch a shop ID (replace with the actual shop ID)
# shop_id = 1

# # Create a new movie struct with the shop_id
# new_movie = %Movie{title: "New Movie Six", category: "Action", shop_id: shop_id}

# # Insert the new movie into the database
# result = Repo.insert(new_movie)

# # Check the result
# IO.inspect(result)


# Alias the Repo, Movie, and Shop modules
alias MyTest.{Repo, Movie, Shop}

# Fetch a shop ID (replace with the actual shop ID)
shop_id = 1

# Define movie attributes
movie_attrs = %{title: "New Movie", category: "Action", shop_id: shop_id}

result =
Repo.insert(movie_attrs)

assert {:ok, %MyTest.Movie{}} = result
# Create a changeset for the new movie
movie_changeset = Movie.changeset(%Movie{}, movie_attrs)

# Insert the new movie into the database
case Repo.insert(movie_changeset) do
  {:ok, inserted_movie} ->
    IO.puts("New movie added with ID: #{inserted_movie.id}")
  {:error, changeset} ->
    IO.inspect(changeset.errors, label: "Failed to insert new movie")
end








# Alias the Repo and Movie modules
alias MyTest.{Repo, Movie}

# Insert the new movie into the database
new_movie = %Movie{title: "New Movie", category: "Action", shop_id: 1} # Replace 1 with the actual shop ID
Repo.insert!(new_movie)

IO.puts("New movie added successfully.")
