create database finance;
use finance;

create table customer(cust_id int primary key,first_name varchar(50),
last_name varchar(50),email varchar(50), phone varchar(15));

create table branch(branch_id int primary key,branch_name varchar(50),branch_location varchar(50));

create table account (acc_id int primary key,acc_ytype varchar(50), 
cust_id int,balance decimal(12,2),foreign key(cust_id) references customer(cust_id));

create table loan (cust_id int,loan_id int primary key,loan_amount decimal(12,2),
interest_rate decimal(5,2),loan_start_date datetime,loan_end_date  datetime,
foreign key(cust_id) references customer(cust_id));

create table employee(emp_id int primary key,first_name varchar(50),last_name varchar(50),branch_id int,
hire_date datetime,salary decimal(12,2),foreign key(branch_id) references branch(branch_id));

create table transact(trans_id int primary key,acc_id int,trans_date datetime,
amount decimal(12,2),trans_type varchar(50),foreign key(acc_id) references account(acc_id));

create table card(acc_id int,card_id int primary key,card_num int,card_type varchar(50),
expiry_date date,foreign key(acc_id)references account(acc_id));

create table history(acc_id int,hist_id int primary key,balance_before decimal(12,2),
balance_after decimal (12,2),change_date date,foreign key(acc_id) references
account(acc_id));

create table overdraft_policy(policy_id int primary key,max_overdraft_limit decimal(12,2),
interest_rate decimal(5,2));

create table payment (pay_id int primary key,loan_id int,pay_date datetime,
amount_paid decimal(12,2),foreign key (loan_id)references loan(loan_id));

create table audit_log(emp_id int ,log_id int primary key,log_date date,action varchar(50),
foreign key(emp_id)references employee(emp_id));

create table account_transaction(acc_id int,trans_id int,foreign key
(acc_id)references account(acc_id),foreign key(trans_id)references transaction(trans_id));

ALTER TABLE customer MODIFY phone VARCHAR(15);

INSERT INTO customer VALUES(1, 'Vishnu', 'Kumar', 'vishnu@gmail.com', 9876543210),
(2, 'Arun', 'Raj', 'arun@gmail.com', 9876543211),
(3, 'Rahul', 'Menon', 'rahul@gmail.com', 9876543212),
(4, 'Anu', 'Thomas', 'anu@gmail.com', 9876543213),
(5, 'Akhil', 'Das', 'akhil@gmail.com', 9876543214);
INSERT INTO branch VALUES(1, 'Main Branch', 'Palakkad'),
(2, 'City Branch', 'Kochi'),
(3, 'Central Branch', 'Thrissur'),
(4, 'North Branch', 'Kozhikode'),
(5, 'South Branch', 'Thiruvananthapuram');
INSERT INTO account VALUES(101, 'Savings', 1, 25000.00),
(102, 'Current', 2, 45000.00),
(103, 'Savings', 3, 18000.50),
(104, 'Savings', 4, 32000.75),
(105, 'Current', 5, 55000.00);
INSERT INTO loan VALUES(1, 1001, 200000.00, 7.50, '2026-01-10', '2031-01-10'),
(2, 1002, 350000.00, 8.00, '2026-02-15', '2033-02-15'),
(3, 1003, 150000.00, 7.25, '2026-03-05', '2031-03-05'),
(4, 1004, 500000.00, 8.50, '2026-04-20', '2036-04-20'),
(5, 1005, 275000.00, 7.75, '2026-05-12', '2033-05-12');
INSERT INTO employee VALUES(101, 'Ravi', 'Kumar', 1, '2022-06-15', 35000.00),
(102, 'Arun', 'Raj', 2, '2021-08-20', 42000.00),
(103, 'Rahul', 'Menon', 3, '2023-01-10', 38000.00),
(104, 'Anu', 'Thomas', 4, '2020-04-25', 50000.00),
(105, 'Akhil', 'Das', 5, '2022-11-05', 45000.00);
INSERT INTO transact VALUES(1, 101, '2026-01-15', 5000.00, 'Deposit'),
(2, 102, '2026-02-20', 10000.00, 'Withdrawal'),
(3, 103, '2026-03-10', 7500.00, 'Deposit'),
(4, 104, '2026-04-25', 12000.00, 'Withdrawal'),
(5, 105, '2026-05-15', 15000.00, 'Deposit');
ALTER TABLE card MODIFY card_num VARCHAR(20);
INSERT INTO card VALUES(101, 201, '4567891234567890', 'Debit', '2029-01-31'),
(102, 202, '5678901234567891', 'Credit', '2028-06-30'),
(103, 203, '6789012345678902', 'Debit', '2030-03-31'),
(104, 204, '7890123456789013', 'Credit', '2029-09-30'),
(105, 205, '8901234567890124', 'Debit', '2031-12-31');
INSERT INTO history VALUES (101, 301, 20000.00, 25000.00, '2026-01-15'),
(102, 302, 55000.00, 45000.00, '2026-02-20'),
(103, 303, 10500.50, 18000.50, '2026-03-10'),
(104, 304, 44000.75, 32000.75, '2026-04-25'),
(105, 305, 40000.00, 55000.00, '2026-05-15');
INSERT INTO overdraft_policy VALUES(1, 10000.00, 10.50),
(2, 20000.00, 11.00),
(3, 30000.00, 11.50),
(4, 40000.00, 12.00),
(5, 50000.00, 12.50);
INSERT INTO payment VALUES(401, 1001, '2026-02-10', 5000.00),
(402, 1002, '2026-03-15', 7500.00),
(403, 1003, '2026-04-05', 4500.00),
(404, 1004, '2026-05-20', 10000.00),
(405, 1005, '2026-06-12', 6000.00);
INSERT INTO audit_log VALUES(101, 501, '2026-01-10', 'Login'),
(102, 502, '2026-02-15', 'Salary Updated'),
(103, 503, '2026-03-20', 'Employee Added'),
(104, 504, '2026-04-05', 'Record Updated'),
(105, 505, '2026-05-12', 'Logout');
INSERT INTO account_transaction VALUES
(101, 1),
(102, 2),
(103, 3),
(104, 4),
(105, 5);
select * from customer;

select balance from account where balance>10000;

select cust_id,count(acc_id)as total_account from account group by cust_id;

select cust_id, sum(balance) as total_balance from account group by cust_id;

select * from transact where acc_id=101;

select sum(amount) as total_deposits from transact where trans_type = 'Deposit';

Select sum(amount) AS total_deposits from transact where trans_type = 'withdrawal';

select cust_id,max(balance)as highest_balance from account group by cust_id order by
 highest_balance desc limit 1;
 
select cust_id,count(acc_id)as total_account from account group by cust_id
having count(cust_id)>1;

select c.cust_id,c.first_name,c.last_name,a.acc_id,a.balance,t.trans_id,
t.trans_date,t.amount,t.trans_type from customer c join account a on c.cust_id=a.cust_id
join transact t on a.acc_id=t.acc_id;

select acc_id,avg(amount) as average_transacted_amount from transact group by acc_id;

select  trans_id,acc_id,trans_date,amount,trans_type,sum(amount) over (order by trans_date)
as running_total from transact;

select cust_id,total_balance,dense_rank() over (order by total_balance desc) as balance_rank 
from (select cust_id,sum(balance) as total_balance from account group by cust_id) as customer_balance;

with customer_transactions as (
    select c.cust_id, sum(t.amount) as total_transaction_amount
    from customer c
    inner join transact t on c.cust_id = t.acc_id
    group by c.cust_id
)
select *
from customer_transactions;
