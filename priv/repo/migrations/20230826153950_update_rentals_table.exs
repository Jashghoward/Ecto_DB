defmodule MyTest.Repo.Migrations.CreateRentals do
  use Ecto.Migration

  def change do
    create table(:rentals) do
      add :customer_id, references(:customers, on_delete: :nothing)
      add :customer_name, :string
      add :movie_id, references(:movies, on_delete: :nothing)
      add :movie_title, :string
      add :date_rented, :utc_datetime

      timestamps()
    end

    create unique_index(:rentals, [:customer_id, :movie_id], name: :rentals_unique_constraint)
  end
end
