# Pewlett Hackard Analysis

## Project Overview
The purpose of this analysis is to provide foresight into the impacts on the Pewlett Hackard workforce as employees leave for retirement. Using company employee data, this analysis will inform discussions around organizational restructuring or other high-level decisions to mitigate gaps that may appear.  

## Results 
From the 6 datasets, four tables were created.

**Retirement Titles** 

![retirement_titles](/images/retirement_titles.jpg)

This table filters employee information (employee number, first name, last name, title, dates of employement) by employee date of birth, holding only employees born between 1952 to 1955 (ages 65 to 68). 

**Unique Titles**

![unique_titles](/images/unique_titles.jpg)

This table filters duplicates from the Retirement Titles. 

**Retiring Titles**

![retiring_titles](/images/retiring_titles.jpg)

This table counts the total employees of retirement age by each title. 

**Mentoring Eligibility**

![Mentoring_Eligibility](/images/mentoring_eligibility.jpg)

This table filters employee information (employee number, first name, last name, birth date, date of employment, and title) by employee date of birth, holding employees that are of 55 years in age and are still currently employed. These individuals could be identified as candidates to be promoted.  

**Key Takeaways**

- The Retirement Titles table was found to have duplicates. Reasons for the duplicates could be promotions, department changes, or employees who leave the company and then are re-hired at a different time.  
- To remove duplicates, Unique Titles uses the DISTINCT ON code to remove the first row of data for each duplicated value.  
- In reviewing the tables, the question of when the individuals listed in the Unique Titles table will retire should be an important question for senior management. Since the recognized retirement age in United States law is 66 years and 2 months, it would seem like retirement of individuals over that age should be prioritized. Cascading the number of retiring employees over the next three years might be a helpful strategy. 
- While the analysis provides specific individuals that will be retiring along with those that could potentially replace retirees, more information would be needed to show if there are enough individuals in the mentoring eligibility category.

## Summary
This summary will answer the following questions:

**1. How many roles will need to be filled as the "silver tsunami" begins to make an impact?**

In the Retiring Titles table, there are 90,398 employees, who are eligible to retire. An additional query was run to find the count of employees qualified for mentoring, which found there are 1,711 individuals within that group. See the table below. 

![med_count_by_titles](/images/med_count_by_titles.jpg) 

By this comparison, this group will not be able to fill the remaining roles after employees retire. Additionally, this comparison does not look at specifically mentoring-qualified individuals who are already in senior positions of Senior Staff, Senior Engineer and Technique Leader. Therefore, those individuals will not actually fill workforce gaps. 

**2. Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?**

While there are not enough mentoring eligible employees to meet a 1:1 ratio with retirement-ready employees, if Pewlett Hackard expanded their definitions of mentoring eligibility to more junior staff, this could remedy the gaps left from this "silver tsunami". 

An additional query shows how many individuals within each department and title would be retiring. See the table below. This could provide insight on where exactly individuals need to be trained to fill soon-to-be empty roles.

![retiring_departments](/images/retiring_departments.jpg)