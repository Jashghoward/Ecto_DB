alias MyTest.{Repo, Rental, Movie, Customer}
import Ecto.Query


query = from(r in Rental,
             join: m in assoc(r, :movie),
             join: c in assoc(r, :customer),
             select: {m.id, c.id, r.date_rented})

rentals_with_details = Repo.all(query)

IO.puts("List of rentals with associated details:")
Enum.each(rentals_with_details, fn {movie_id, customer_id, date_rented} ->
  IO.puts("(Movie ID: #{movie_id}, Customer ID: #{customer_id}, Date Rented: #{date_rented})")
end)
