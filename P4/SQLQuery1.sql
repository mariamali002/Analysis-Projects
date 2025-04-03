select * from Bank_Loan_Data

select count(id) as Total_loan_applications from Bank_Loan_Data

select count(id) as PMTD_Total_loan_applications from Bank_Loan_Data
where MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021


select sum(loan_amount) as MTD_Total_Amount_Fund from Bank_Loan_Data
where MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021


select sum(loan_amount) as PMTD_Total_Amount_Fund from Bank_Loan_Data
where MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021


select sum(total_payment) as PMTD_Total_Payment from Bank_Loan_Data 
where MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021


select round(sum(int_rate),4)*100 as PMTD_Avg_interest_rate from Bank_Loan_Data
where MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021


select round(sum(dti),4)*100 as PMTD_Avg_DTI from Bank_Loan_Data
where MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021



select (count(case when loan_status = 'Fully Paid' OR loan_status = 'Current' then id end) *100)
/count(id) as Good_loan_Percentage from Bank_Loan_Data


select count(id) as Good_Loan_Application from Bank_Loan_Data
where loan_status = 'Fully Paid' OR loan_status = 'Current'

select sum(total_payment) as Good_Loan_Recieved_Amount from Bank_Loan_Data
where loan_status = 'Fully Paid' OR loan_status = 'Current'



select (count(case when loan_status = 'Charged Off'  then id end) *100.0)
/count(id) as Bad_loan_Percentage from Bank_Loan_Data




select count(id) as Bad_Loan_Application from Bank_Loan_Data
where loan_status = 'Charged Off' 




select sum(total_payment) as Bad_Loan_Recieved_Amount from Bank_Loan_Data
where loan_status = 'Charged Off' 



select loan_status,count(id) as Total_Loan_Application,
sum(total_payment) as Total_Amount_Recieved,
sum(loan_amount) as Total_Funded_Amount,
AVG(int_rate * 100) as interest_Rate,
AVG(dti *100) as DTI 
from Bank_Loan_Data
group by  loan_status


select loan_status,sum(total_payment) as MTD__Total_Amount_Received,sum(loan_amount) as MTD_Total_Fund_Amount
from Bank_Loan_Data
where MONTH(issue_date) = 12
group by loan_status



select home_ownership,
Count(id) as Total_Loan_Applications,
sum(Loan_amount) as Total_Funded_amount,
sum(total_payment) as Total_Recieved_Amount
from Bank_Loan_Data
group by home_ownership
order by home_ownership


