-- APPLY

-- funcion de tabla que devuelve las ordenes hechas por un cliente
--CREATE FUNCTION fn_cliente_ordenes (@codigo_cliente varchar(5))
--RETURNS TABLE
--AS
--RETURN
--	(SELECT OrderID, OrderDate
--	FROM Orders
--	WHERE CustomerID = @codigo_cliente)

select * from fn_cliente_ordenes('ANTON')

-- CROSS APPLY
-- union entre la tabla customers y la función (NO ES POSIBLE UTILIZAR INNER JOIN)
-- VINCULAMOS UNA TABLA CONTRA UNA EXPRESIÓN DE TABLA!!!!

select c.customerid, c.companyname, c.country, o.orderid, o.orderdate
from customers as c cross apply fn_cliente_ordenes(C.CustomerID) AS o


-- OUTER APPLY
-- Similar al left outer join

select c.customerid, c.companyname, c.country, o.orderid, o.orderdate
from customers as c outer apply fn_cliente_ordenes(C.CustomerID) AS o
where o.OrderId = NULL
ORDER BY c.CustomerID