
-- union all (incluye todos, incluso los repetidos)
select CompanyName, ContactName, Country from Customers
union all
select CompanyName, ContactName, Country from Suppliers
order by ContactName

-- union (no incluye los elementos repetidos)
select CompanyName, ContactName, Country from Customers
union
select CompanyName, ContactName, Country from Suppliers
order by ContactName

-- intersect (devuelve solo las filas que coinciden en ambos conjuntos)
select CustomerID from Customers
intersect -- equivalente a inner join
select CustomerID from Orders
-- esto devuelve solo los clientes que han ordenado

-- intersect (devuelve las filas que NO coinciden en ambos conjuntos)
select CustomerId from Customers
except -- equivalente a left outer join
select CustomerID from Orders
-- esto devuelve solo los clientes NO que han ordenado