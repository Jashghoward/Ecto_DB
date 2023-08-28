defmodule MyTest.Repo.Migrations.CreateCustomersTable do
  use Ecto.Migration

  def change do
    create table(:customers) do
      add :firstname, :string
      add :lastname, :string
      timestamps()
    end
  end
end
