Input: 
Products table:
+------------+-----------+-------------+
| product_id | new_price | change_date |
+------------+-----------+-------------+
| 1          | 20        | 2019-08-14  |
| 2          | 50        | 2019-08-14  |
| 1          | 30        | 2019-08-15  |
| 1          | 35        | 2019-08-16  |
| 2          | 65        | 2019-08-17  |
| 3          | 20        | 2019-08-18  |
+------------+-----------+-------------+
Output: 
+------------+-------+
| product_id | price |
+------------+-------+
| 2          | 50    |
| 1          | 35    |
| 3          | 10    |
+------------+-------+

# Write your MySQL query statement below
select product_id,new_price as price
from products 
where(product_id,change_date) in
(
    select product_id,max(change_date)
    from products
    where change_date<='2019-08-16'
    group by product_id
)
union 
select product_id,10 as price
from products 
where(product_id) not in
(
    select product_id
    from products
    where change_date<='2019-08-16'
    group by product_id
)
