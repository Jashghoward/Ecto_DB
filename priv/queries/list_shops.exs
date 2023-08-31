alias MyTest.{Repo, Shop}

all_shops = Repo.all(Shop)



IO.puts("List of all shops:")
Enum.each(all_shops, fn shop ->
  IO.puts("#{shop.name}")
end)
