defmodule MyTest.Repo.Migrations.CreateMovies do
  use Ecto.Migration

  def change do
    create table(:movies) do
      add :title, :string
      add :category, :string
      add :shop_id, references(:shops, on_delete: :nothing)  # Adjust the on_delete option according to your needs
      timestamps()
    end

    create index(:movies, [:shop_id])
  end
end
