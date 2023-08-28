defmodule MyTest.Customer do
  import Ecto.Changeset
  use Ecto.Schema
  alias MyTest.{Rental}


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
end
