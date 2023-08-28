# Alias the Repo and Customer modules
alias MyTest.{Repo, Customer}
import Ecto.Query



# Fetch a shop ID (replace with the actual shop ID)

# Define movie attributes
customer_attrs = %{firstname: "Vas", lastname: "Marantos"}

result = Repo.insert(customer_attrs)

assert {:ok, %MyTest.Customer{}} = result
# Create a changeset for the new movie
customer_changeset = Customer.changeset(%Customer{}, customer_attrs)

# Insert the new movie into the database
case Repo.insert(customer_changeset) do
  {:ok, inserted_movie} ->
    IO.puts("New movie added with ID: #{inserted_movie.id}")
  {:error, changeset} ->
    IO.inspect(changeset.errors, label: "Failed to insert new movie")
end

# Alias the Repo and Movie modules
alias MyTest.{Repo, Movie}

# Insert the new movie into the database
new_customer = %Customer{firstname: "New", lastname: "Action"} # Replace 1 with the actual shop ID
Repo.insert!(new_customer)

IO.puts("New movie added successfully.")
