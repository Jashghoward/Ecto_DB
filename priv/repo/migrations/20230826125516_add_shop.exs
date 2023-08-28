defmodule MyTest.Repo.Migrations.AddShopTable do
  use Ecto.Migration

  def change do
    create table(:shops) do
      add :name, :string
      timestamps()
  end

    create index(:shops, [:name], unique: true)
  end
end
