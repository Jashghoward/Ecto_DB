alias MyTest.{Repo, Shop, Movie, Rental, Customer}

shop_params = [
  %{name: "Shop One"},
  %{name: "Shop Two"},
  %{name: "Shop Three"}
]

Enum.each(shop_params, fn shop_params ->
  changeset = Shop.changeset(%Shop{}, shop_params)
  Repo.insert!(changeset)
end)

movie_params = [
  %{title: "Movie 1", category: "Action", shop_id: 1},
  %{title: "Movie 2", category: "Comedy", shop_id: 2},
  %{title: "Movie 3", category: "Drama", shop_id: 1}
]

# Enum.each(movie_params, fn movie_params ->
#   changeset = Movie.changeset(%Movie{}, movie_params)
#   Repo.insert!(changeset)
# end)

movies = Enum.map(movie_params, fn movie_params ->
  changeset = Movie.changeset(%Movie{}, movie_params)
  case Repo.insert(changeset) do
    {:ok, movie} ->
      movie
    {:error, _changeset} ->
      IO.puts "Failed to insert movie: #{inspect(movie_params)}"
      nil
  end
end)
|> Enum.filter(&(&1 != nil))  # Remove nil values

IO.puts "Inserted #{length(movies)} movies"


customer_data = [
  %{firstname: "John", lastname: "Doe"},
  %{firstname: "Jane", lastname: "Smith"},
  %{firstname: "Alice", lastname: "Johnson"}
]

# Insert customers
customers = Enum.map(customer_data, fn customer_params ->
  changeset = Customer.changeset(%Customer{}, customer_params)
  case Repo.insert(changeset) do
    {:ok, customer} ->
      customer
    {:error, _changeset} ->
      IO.puts "Failed to insert customer: #{inspect(customer_params)}"
      nil
  end
end)
|> Enum.filter(&(&1 != nil))  # Remove nil values

IO.puts "Inserted #{length(customers)} customers"

# # Create rentals for customers
# Enum.each(customers, fn customer ->
#   customer_movies = Enum.take(movies, 2)  # Limit to 2 movies per customer
#   Enum.each(customer_movies, fn movie ->
#     rental_changeset = %Rental{customer_id: customer.id, movie_id: movie.id}
#     Repo.insert!(rental_changeset)
#   end)
# end)

# Create rentals for customers
Enum.each(customers, fn customer ->
  customer_movies = Enum.take(movies, 2)  # Limit to 2 movies per customer (HEX Docs)
  Enum.each(customer_movies, fn movie ->
    rental_changeset = %Rental{
      customer_id: customer.id,
      movie_id: movie.id,
      date_rented: DateTime.truncate(DateTime.utc_now(), :second)
    }
    Repo.insert!(rental_changeset)
  end)
end)

rentals_with_details = MyTest.Rental.get_rentals_with_details()

Enum.each(rentals_with_details, fn rental ->
  IO.puts("Rental ID: #{rental.id}")
  IO.puts("Movie ID: #{rental.movie_id}, Title: #{rental.movie_title}")
  IO.puts("Customer ID: #{rental.customer_id}, Name: #{rental.customer_name}")
  IO.puts("Date Rented: #{rental.inserted_at}")
  IO.puts("\n")
end)




# # Insert customers
# Enum.each(customer_data, fn customer_params ->
#   changeset = Customer.changeset(%Customer{}, customer_params)
#   Repo.insert!(changeset)
# end)

# IO.puts "Inserted #{length(customer_data)} customers"

# # Create rentals for customers
# Enum.each(customers, fn customer ->
#   customer_movies = Enum.take(movies, 2)  # Limit to 2 movies per customer
#   Enum.each(customer_movies, fn movie ->
#     rental_changeset = %Rental{customer_id: customer.id, movie_id: movie.id}
#     Repo.insert!(rental_changeset)
#   end)
# end)
