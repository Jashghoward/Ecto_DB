alias MyTest.{Repo, Movie, Shop}

import Ecto.Query

query = from(m in Movie, join: s in assoc(m, :shop), select: {m.title, s.name})
movies_with_shop_names = Repo.all(query)

# Print the list of movies and their associated shop names
IO.puts("List of movies with their associated shop names:")
Enum.each(movies_with_shop_names, fn {movie_title, shop_name} ->
  IO.puts("#{movie_title} (Shop: #{shop_name})")
end)


# query = from(m in Movie, where: m.shop_id == m.id)
# movies_with_shop_id = Repo.all(query)

# IO.puts("List of movies with shop_id:")
# Enum.each(movies_with_shop_id, fn movie ->
#   IO.puts("#{movie.title} (Shop ID: #{movie.shop_id})")
# end)
