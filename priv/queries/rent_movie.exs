# Alias the Repo and Rental modules
alias MyTest.{Repo, Rental}


# Assuming you have customer_id and movie_id
customer_id = 4
movie_id = 2

current_datetime_utc = DateTime.utc_now()

# Create a new rental entry within a transaction
Repo.transaction(fn ->
  rental_count_query = from(r in Rental, where: r.customer_id == ^customer_id, select: count(r.id))

  case Repo.aggregate(rental_count_query, :count) do
    count when count >= 2 ->
      IO.puts("Customer has reached the maximum rental limit")
    _ ->
      rental_attrs = %{customer_id: customer_id, movie_id: movie_id, date_rented: current_datetime_utc}
      Repo.insert!(Rental.changeset(%Rental{}, rental_attrs))
      IO.puts("Movie rented successfully")
  end
end)
