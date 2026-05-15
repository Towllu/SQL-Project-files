SELECT * FROM my_projects.merged_dataset_updated;

# Metrics
SELECT COUNT(Reference_id) AS Total_Applicants,
ROUND(AVG(Tuition_Fees),2) AS Avg_Tuition_Fee,
ROUND(AVG(Living_Expenses),2)AS Avg_Living_Expenses,
ROUND(AVG(Funds_from_Other_Sources),2) AS Avg_Funds_from_Other_Sources
FROM my_projects.merged_dataset_updated;


# Gender count for the applicants
SELECT Gender, Count(Reference_ID)  Number_of_Applicants
FROM my_projects.merged_dataset_updated
GROUP BY Gender
ORDER BY Number_of_Applicants DESC;


# Number of Applicants by Departments
SELECT Departments, Count(Reference_ID)  Number_of_Applicants
FROM my_projects.merged_dataset_updated
GROUP BY Departments
ORDER BY Number_of_Applicants DESC
LIMIT 10;


# Number of applicants by Student_Status
SELECT Student_Status, Count(Reference_ID)  Number_of_Applicants
FROM my_projects.merged_dataset_updated
GROUP BY Student_Status
ORDER BY Number_of_Applicants DESC;


# Number of applicants by Citizenship
SELECT Citizenship, Count(Reference_ID)  Number_of_Applicants
FROM my_projects.merged_dataset_updated
GROUP BY Citizenship
ORDER BY Number_of_Applicants DESC
LIMIT 10;


# Number of applicants by Intake
SELECT Intake, Count(Reference_ID)  Number_of_Applicants
FROM my_projects.merged_dataset_updated
GROUP BY Intake
ORDER BY Number_of_Applicants DESC
LIMIT 10;


# Number of applicants by Age Group
SELECT Age_group, Count(Reference_ID)  Number_of_Applicants
FROM my_projects.merged_dataset_updated
GROUP BY Age_group
ORDER BY Number_of_Applicants DESC;


# Number of applicants by Program of interest
SELECT Program_Of_interest, Count(Reference_ID)  Number_of_Applicants
FROM my_projects.merged_dataset_updated
GROUP BY Program_Of_interest
ORDER BY Number_of_Applicants DESC
LIMIT 10;


# Number of applicants by Education Level
SELECT Education_Level, Count(Reference_ID)  Number_of_Applicants
FROM my_projects.merged_dataset_updated
GROUP BY Education_Level
ORDER BY Number_of_Applicants DESC;


# Number of applicants by School_Fund_Type
SELECT School_Fund_Type, Count(Reference_ID)  Number_of_Applicants
FROM my_projects.merged_dataset_updated
GROUP BY School_Fund_Type
ORDER BY Number_of_Applicants DESC;


# Average Tuition Fees by Departments
SELECT Departments, 
ROUND(AVG(Tuition_Fees),0)  Avg_Tuition_Fee
FROM my_projects.merged_dataset_updated
GROUP BY Departments
ORDER BY Avg_Tuition_Fee DESC
LIMIT 10;


# Average Tuition Fees by Citizenship
SELECT Citizenship, 
ROUND(AVG(Tuition_Fees),0)  Avg_Tuition_Fee
FROM my_projects.merged_dataset_updated
GROUP BY Citizenship
ORDER BY Avg_Tuition_Fee DESC
LIMIT 10;


# Average Funds_From_This_School by School_Fund_Type
SELECT School_Fund_Type, 
ROUND(AVG(Funds_From_This_School),0)  Avg_Funds_From_This_School,
Count(Reference_ID)  Number_of_Applicants
FROM my_projects.merged_dataset_updated
GROUP BY School_Fund_Type
ORDER BY Avg_Funds_From_This_School DESC;


# Number of Applicants VS Average_Tuition_Fees by Deposit_Paid
SELECT Deposit_Paid, 
ROUND(AVG(Tuition_Fees),0)  Avg_Tuition_Fee,
Count(Reference_ID)  Number_of_Applicants
FROM my_projects.merged_dataset_updated
GROUP BY Deposit_Paid
ORDER BY Avg_Tuition_Fee DESC;


# Number of Applicants VS Funds_From_Other_Sources by Other_Source_Type
SELECT Other_Source_Type, 
ROUND(AVG(Funds_From_Other_Sources),0)  Avg_Funds_From_Other_Sources,
Count(Reference_ID)  Number_of_Applicants
FROM my_projects.merged_dataset_updated
GROUP BY Other_Source_Type
ORDER BY Avg_Funds_From_Other_Sources DESC;

SELECT Gender,
Count(Reference_ID)  Number_of_Applicants
FROM my_projects.merged_dataset_updated
WHERE citizenship = 'Nigeria'
GROUP BY Gender, citizenship;
