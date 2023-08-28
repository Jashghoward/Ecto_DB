# import ExUnit.Assertions

# alias MusicDB.{Repo, Artist}

# result =
# Repo.insert_all("artists", [[name: "John Coltrane"]])
# #=> {1, nil}

# assert {1, nil} = result

# result =
# Repo.insert(%Artist{name: "John Coltrane"})
# #=> {:ok, %MusicDB.Artist{__meta__: #Ecto.Schema.Metadata<:loaded, "artists">,
# #=>  id: 4, name: "John Coltrane", ...}

# assert {:ok, %MusicDB.Artist{}} = result

# result =
# Repo.insert_all(Artist, [[name: "John Coltrane"]])
# #=> {1, nil}

# assert {1, nil} = result


import ExUnit.Assertions

alias MyTest.{Repo, Shop}

result =
Repo.insert(%Shop{name: "Shop_12"})
#=> {:ok, %MusicDB.Artist{__meta__: #Ecto.Schema.Metadata<:loaded, "artists">,
#=>  id: 4, name: "John Coltrane", ...}

IO.puts("New shop has been created #{result}")

assert {:ok, %MyTest.Shop{}} = result
