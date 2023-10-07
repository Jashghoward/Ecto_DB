defmodule MyTest.Customer do
  import Ecto.Changeset
  use Ecto.Schema
  alias MyTest.{Rental, Customer, Repo}


  schema "customers" do
    field(:firstname, :string)
    field(:lastname, :string)
    timestamps()

    has_many :rentals, Rental
  end

  def changeset(customer, params) do
    customer


    |> cast(params, [:firstname, :lastname])
    |> validate_required([:firstname, :lastname])



  end

  def create_customer do
      new_customer = %Customer{firstname: "Brad", lastname: "Howard"} # Replace 1 with the actual shop ID
      Repo.insert!(new_customer)

      IO.puts("New movie added successfully.")
  end
end
