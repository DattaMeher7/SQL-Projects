--1
select Customer_Name  "Customer Name",Customer_Segment "Customer Segment"
from cust_dimen
--2
select *
from cust_dimen order by Region  desc
--3
select Order_ID,Order_Date
from orders_dimen where Order_Priority='High'
--4
select sum(Sales) total_sales ,avg(Sales) avg_sales
from market_fact
--5
select max(Sales) max_sale,min(Sales) min_sale
from market_fact
--6
select Region,count(distinct (Cust_id)) "no of people"
from cust_dimen group by Region order by "no of people" desc
--7
select Region,count(distinct (Cust_id)) "no of people"
from cust_dimen group by Region order by "no of people" desc
limit 1
--8
select c.Customer_Name Customer_Name,m.Order_Quantity Order_Quantity,p.Product_Sub_Category Product
from cust_dimen c join market_fact m join prod_dimen p 
on c.Cust_id=m.Cust_id and m.Prod_id =p.Prod_id Where  c.Region = "ATLANTIC" and p.Product_Sub_Category = "TABLES" order by m.Order_Quantity desc;
--9
select Customer_name,count(Customer_Segment)
from cust_dimen
where Province in ('ontario') and Customer_Segment in ('small business')
group by Customer_Name
--10
select p.Prod_id Prod_id,sum(m.Order_Quantity) Total_quantity
from market_fact m join prod_dimen p 
on m.Prod_id =p.Prod_id group by p.Product_Sub_Category  order by Total_quantity desc
--11
select Prod_id,Product_Sub_Category
from prod_dimen where Product_Category in ('TECHNOLOGY','FURNITURE')
--12
select p.Product_Category Product_Category,sum(m.Profit) Total_Profit
from market_fact m join prod_dimen p
on m.Prod_id =p.Prod_id group by p.Product_Category order by Total_Profit desc
--13
select p.Product_Category Product_Category, p.Product_Sub_Category Product_Sub_Category ,sum(m.Profit) Total_Profit
from market_fact m join prod_dimen p
on m.Prod_id =p.Prod_id group by p.Product_Sub_Category order by Total_Profit desc
--14
select o.Order_Date as 'order date',m.Order_Quantity as "order quantity", m.Sales as "sales"
from orders_dimen o  
cross join market_fact m on m.Ord_id = o.Ord_ID
--15
select distinct Customer_Name
from cust_dimen
where Customer_Name like '_R%' and customer_name like '___D%'
--16
select c.Cust_id,m.sales,c.Customer_Name,c.Region
from cust_dimen c
cross join market_fact m on c.Cust_id=m.Cust_id
where sales between 1000 and 5000
--17
select sales 
from market_fact 
order by sales desc
limit 1 offset 2 
--18
select sum(m.profit),count(distinct (m.Ship_id)) as no_of_Shipments,region
from market_fact m
 left join prod_dimen p on m.Prod_id=P.Prod_id
left join cust_dimen c on m.Cust_id=c.Cust_id
where Product_Sub_Category like '%tables%'
group by region,Product_Sub_Category
order by sum(m.profit)