# # defmodule MyTest.Rental do
# #   use Ecto.Schema
# #   import Ecto.Changeset
# #   alias MyTest.{Repo}
# #   import Ecto.Query

# #   schema "rentals" do
# #     belongs_to :customer, MyTest.Customer
# #     belongs_to :movie, MyTest.Movie
# #     field :date_rented, :utc_datetime # or :naive_datetime, depending on your needs

# #     timestamps()
# #   end

# #   def changeset(rental, params \\ %{}) do
# #     rental
# #     |> cast(params, [:customer_id, :movie_id, :date_rented])
# #     |> validate_required([:customer_id, :movie_id, :date_rented])
# #     |> unique_constraint([:customer_id, :movie_id], name: :rentals_unique_constraint)
# #   end


# #   def get_rentals_with_details() do
# #     from(r in MyTest.Rental,
# #       join: m in MyTest.Movie, on: r.movie_id == m.id,
# #       join: c in MyTest.Customer, on: r.customer_id == c.id,
# #       select: {r, m.title, c.firstname, c.lastname}
# #     )
# #     |> Repo.all()
# #     |> Enum.map(fn {rental, movie_title, firstname, lastname} ->
# #       %{
# #         rental | movie_title: movie_title,
# #         customer_name: "#{firstname} #{lastname}"
# #       }
# #     end)
# #   end
# # end


defmodule MyTest.Rental do
  use Ecto.Schema
  import Ecto.Changeset
  alias MyTest.{Customer, Movie, Rental, Repo}
  import Ecto.Query

  schema "rentals" do
    belongs_to :customer, Customer
    belongs_to :movie, Movie
    field :date_rented, :utc_datetime
    field :customer_name, :string
    field :movie_title, :string


    timestamps()
  end

  def changeset(rental, params \\ %{}) do
    rental
    |> cast(params, [:customer_id, :movie_id, :date_rented, :customer_name, :movie_title])
    |> validate_required([:customer_id, :movie_id, :date_rented, :customer_name, :movie_title])
    |> unique_constraint([:customer_id, :movie_id], name: :rentals_unique_constraint)
  end



  def get_rentals_with_details() do
    from(r in Rental,
      join: m in MyTest.Movie, on: r.movie_id == m.id,
      join: c in MyTest.Customer, on: r.customer_id == c.id,
      select: %{
        id: r.id,
        movie_id: m.id,
        movie_title: m.title,
        customer_id: c.id,
        customer_name: fragment("CONCAT(?, ' ', ?)", c.firstname, c.lastname),
        inserted_at: r.inserted_at  # Include the inserted_at field
      }
    )
    |> Repo.all()
  end

  # def rent_movie() do
  #   Repo.transaction(fn ->
  #     rental_count_query = from(r in Rental, where: r.customer_id == ^customer_id, select: count(r.id))

  #     case Repo.aggregate(rental_count_query, :count) do
  #       count when count >= 2 ->
  #         IO.puts("Customer has reached the maximum rental limit")
  #       _ ->
  #         rental_attrs = %{customer_id: customer_id, movie_id: movie_id, date_rented: current_datetime_utc}
  #         Repo.insert!(Rental.changeset(%Rental{}, rental_attrs))
  #         IO.puts("Movie rented successfully")
  #     end
  #   end)
  # end
end









# defmodule MyTest.Rental do
#   use Ecto.Schema
#   import Ecto.Changeset
#   alias MyTest.{Customer, Movie, Rental, Repo}
#   import Ecto.Query

#   schema "rentals" do
#     belongs_to :customer, Customer
#     belongs_to :movie, Movie
#     field :date_rented, :utc_datetime


#     timestamps()
#   end

#   def changeset(rental, params \\ %{}) do
#     rental
#     |> cast(params, [:customer_id, :movie_id, :date_rented, :customer_name, :movie_title])  # Update fields
#     |> validate_required([:customer_id, :movie_id, :date_rented, :customer_name, :movie_title])  # Update fields
#     |> unique_constraint([:customer_id, :movie_id], name: :rentals_unique_constraint)
#   end

#   def get_rentals_with_details() do
#     from(r in Rental,
#       join: m in MyTest.Movie, on: r.movie_id == m.id,
#       join: c in MyTest.Customer, on: r.customer_id == c.id,
#       select: %{r | movie_title: m.title, customer_name: fragment("CONCAT(?, ' ', ?)", c.firstname, c.lastname)}
#     )
#     |> Repo.all()
#   end
# end
