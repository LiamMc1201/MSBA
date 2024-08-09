SELECt Jobtitle,Gender
From HumanResources.Employee
Where JobTitle Like '%Sales%'
UNION
Select Gender,JobTitle
from HumanResources.Employee
Where JobTitle Like 'Vice President%'


--Select  <what>
--From <Where>







Select FirstName,LastName,VacationHours,SickLeaveHours
from HumanResources.Employee
Inner Join Person.Person
On Employee.BusinessEntityID = Person.BusinessEntityID


Select JobTitle,Rate
from HumanResources.EmployeePayHistory eph
Inner Join HumanResources.Employee e 
On eph.EmployeePayHistory.BusinessEntityID = e.Employee.BusinessEntityID
where rate < 20 


Select a.BusinessEntityID, a.BirthDate,a.BirthDate,a.BusinessEntityID 
from HumanResources.Employee a
INNER Join HumanResources.Employee B
on a.BirthDate =b.BirthDate
where a.BusinessEntityID < b.BusinessEntityID


Select a.BusinessEntityID, b.BusinessEntityID
from HumanResources.Employee a
cross join HumanResources.Employee B 


Select p.FirstName,p.LastName,e.JobTitle,d.Name as departmentname
from HumanResources.Employee E 
INNER JOIN Person.Person p
on e.BusinessEntityID = p.BusinessEntityID
INNER JOIN HumanResources.EmployeeDepartmentHistory edh
on e.BusinessEntityID = edh.BusinessEntityID
Inner JOIN HumanResources.Department d
on edh.DepartmentID = d.DepartmentID
where edh.EndDate is null 
And d.GroupName = 'Research and Development'



Select MAX(rateChangeDate)
from HumanResources.EmployeePayHistory
Where RateChangeDate <= '2008-12-31'

Select p.FirstName,p.LastName,e.JobTitle,eph.RateChangeDate,eph.Rate
from HumanResources.Employee E
Inner Join Person.Person P
on e.BusinessEntityID = p.BusinessEntityID
inner join HumanResources.EmployeePayHistory eph 
on e.BusinessEntityID = eph.BusinessEntityID
where eph.rateChangeDate = (Select MAX(rateChangeDate)
from HumanResources.EmployeePayHistory
Where RateChangeDate <= '2008-12-31')


Select j.JobCandidateID,p.FirstName,p.LastName,e.JobTitle
from HumanResources.JobCandidate j 
LEFT OUTER Join HumanResources.Employee e 
on j.BusinessEntityID = e.BusinessEntityID
LEFT OUTER join person.person P
on e.BusinessEntityID = p.BusinessEntityID

select COUNT(*) 
from HumanResources.Employee
INNER JOIN HumanResources.EmployeeDepartmentHistory edh
on e.BusinessEntityID = edh.EmployeeDepartmentHistory
INNER JOIN HumanResources.Department d 
on edh.DepartmentID = d.DepartmentID
where e.Gender = 'F'
and d.Name = 'Sales'


Select COUNT(Distinct HireDate) As differenthiredates
from HumanResources.Employee



Select SUM(VacationHours) as TotalVacation,SUM(SickLeaveHours) as TotalSick,
SUM(VacationHours) + SUM(SickLeaveHours) as TotalPTO
from HumanResources.Employee


Select MAX(BirthDate) As youngest,MIN(BirthDate) as oldest
from HumanResources.Employee



Select DateDiff(dd,MIN(HireDate), GETDATE())/365.25 As YearsTenure
    from HumanResources.Employee
    Where Gender = 'F'

Select AVG(DateDiff(dd,HireDate, GETDATE())/365.25) As YearsTenure
from HumanResources.Employee


Select Gender,Count(*)
from HumanResources.Employee
group by Gender,MaritalStatus




Select Gender, COUNT(*) as total
From HumanResources.Employee
Where MaritalStatus = 'M'
Group by Gender 

Select Gender, Count(*) As total
from HumanResources.Employee
Group by Gender, MaritalStatus
Having MaritalStatus = 'M'





