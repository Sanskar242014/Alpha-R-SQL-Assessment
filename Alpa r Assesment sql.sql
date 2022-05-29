--Q1 How many Organization in total
--select count(*) from organisations;

--2 How many organisations do not have offer_requests
select o.id, o.org_name from organisations o 
left join offer_requests or2 on o.id = or2.id 
where o.id isnull ;


--3 How many organisations have offer_requests 
select count(org_name) from 
(select * from offer_requests o
left join organisations o1 on o.organisation_id = o1.id) as foo;






--4 How many organisation have no offers
select count(distinct org_name) from 
(select * from offers o 
left join organisations o2 on o.organisation_id = o2.id) as foo; 


-- 5 which organisations has maximum offers and how many offers
select org_name,count(org_name) from (select * from offers o 
left join organisations o2 on o.organisation_id = o2.id) as foo 
group by org_name order by 2 desc limit 1 ; 


 -- 6 which organisations has minimum offers and how many offers
select org_name,count(org_name) from (select * from offers o 
left join organisations o2 on o.organisation_id = o2.id) as foo 
group by org_name order by 2 asc limit 1;

--7 Which organisation has maximum orders and how many orders
select org_name,count(org_name) from (select * from orders o 
left join organisations o2 on o.organisation_id = o2.id ) as foo
group by org_name order by 2 desc limit 1;


--8 Which organisation has minimum orders and how many orders
select org_name, count(org_name) from (select * from orders o
left join organisations o2 on o.organisation_id = o2.id  ) as foo
group by org_name order by 2 asc limit 1;

--9 Which organisation has the maximum total amount of offers and what is the amount
select org_name, sum(total_amount) from (select * from orders o
left join organisations o2 on o.organisation_id = o2.id ) as foo
group by org_name order by 2 desc limit 1;

--10 Which organisation has the maximum total amount of orders and what is the amount
select org_name, sum(total_amount) from (select * from orders o 
left join organisations o2 on o.organisation_id = o2.id) as foo
group by org_name order by 2 asc limit 1;