# Alias the Repo, Customer, and Movie modules
alias MyTest.{Repo, Customer}

all_customers = Repo.all(Customer)

IO.puts("List of all customers:")
Enum.each(all_customers, fn customer ->
  IO.puts("#{customer.firstname} #{customer.lastname}")
end)
