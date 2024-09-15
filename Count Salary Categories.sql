Input: 
Accounts table:
+------------+--------+
| account_id | income |
+------------+--------+
| 3          | 108939 |
| 2          | 12747  |
| 8          | 87709  |
| 6          | 91796  |
+------------+--------+
Output: 
+----------------+----------------+
| category       | accounts_count |
+----------------+----------------+
| Low Salary     | 1              |
| Average Salary | 0              |
| High Salary    | 3              |
+----------------+----------------+
Explanation: 
Low Salary: Account 2.
Average Salary: No accounts.
High Salary: Accounts 3, 6, and 8.

# Write your MySQL query statement below
select "Low Salary" as category,
sum(if(income <20000,1,0)) as accounts_count
from accounts
union 
select "Average Salary" as category,
sum(if(income between 20000 and 50000,1,0)) as accounts_count
from accounts
union 
select "High Salary" as category,
sum(if(income >50000,1,0)) as accounts_count
from accounts
