
-- Artist Table
-- Add 3 new artists to the artist table using INSERT. (It’s already created.)

insert into artist(name)
values ('Kesha'),('Hilary Duff'),('Shakira'); 
select * from artist
where name in('Kesha','Hilary Duff','Shakira')

-- Select 5 artists in alphabetical order.
select * from artist 
order by name asc 
limit 5

-- Employee Table¶
-- List all employee first and last names only that live in Calgary.

select first_name, last_name from employee 
where city = 'Calgary'

-- Find everyone that reports to Nancy Edwards (Use the ReportsTo column). You will need to query the employee table to find the Id for Nancy Edwards

-- select * from employee
-
-- where employee_id = 2

select * from employee 
where reports_to = 2

-- Count how many people live in Lethbridge
select count(first_name) from employee
where city = 'Lethbridge'

-- Invoice Table¶
-- Count how many orders were made from the USA.

select count(invoice_id) from invoice
where billing_country = 'USA'

-- Find the largest order total amount.

select MAX(total) from invoice
-- select MAX(unit_price * quantity) from invoice_line

-- Find the smallest order total amount.

select MIN(total) from invoice

-- Find all orders bigger than $5.

select * from invoice_line
where ((unit_price * quantity) > 5)

-- Count how many orders were smaller than $5.

select count(unit_price * quantity) from invoice_line
where ((unit_price * quantity) < 5)

-- Get the total sum of the orders.
--of the orders specified above 
select SUM(unit_price * quantity) from invoice_line
where ((unit_price * quantity) < 5)

---vs syntax for all orders

select SUM(unit_price * quantity) from invoice_line

---in this case values are the same

-- JOIN Queries (Various tables)
-- Get all invoices where the unit_price on the invoice_line is greater than $0.99.

select * from invoice i
join invoice_line il
on i.invoice_id = il.invoice_id
where unit_price > .99

-- Get the invoice_date, customer first_name and last_name, and total from all invoices.

select i.invoice_date, i.total, c.first_name, c.last_name
from invoice i
join customer c
on i.customer_id = c.customer_id

-- Get the customer first_name and last_name and the support rep’s first_name and last_name from all customers. Note that support reps are on the employee table.

select c.first_name as customer_first, c.last_name as cutomer_last, e.first_name as support_rep_first, e.last_name as support_rep_last
from customer c
join employee e
on c.support_rep_id = e.employee_id

-- Get the album title and the artist name from all albums.
select a.name as artist, al.title as album
from album al
join artist a
on a.artist_id = al.artist_id

