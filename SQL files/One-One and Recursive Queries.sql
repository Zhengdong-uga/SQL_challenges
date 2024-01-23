

#List each dept head's salary

SELECT dept.deptname,empfname,empsalary
FROM dept JOIN emp
ON dept.empno = emp.empno;

#Find the salary of Nancy’s boss.

SELECT Subordinate.empfname as 'Subordinate Name',Supervisor.empfname as 'Supervisor Name',Supervisor.empsalary as 'Supervisor Salary'
FROM emp Supervisor JOIN emp Subordinate
ON Supervisor.empno = Subordinate.bossno
WHERE Subordinate.empfname = 'Nancy';

SELECT * 
FROM emp 
WHERE empno = 5;

#Find the names of employees who earn more than their supervisors.

SELECT Supervisor.empfname as 'Supervisor name',Supervisor.empsalary,Subordinate.empfname,Subordinate.empsalary
FROM emp Supervisor JOIN emp Subordinate
ON Supervisor.empno = Subordinate.bossno
WHERE Subordinate.empsalary > Supervisor.empsalary;

#Find the names of employees in the same department as their boss

SELECT Boss.empfname as 'Boss First Name',Boss.deptname,Worker.empfname,Worker.deptname
FROM emp Boss JOIN emp Worker 
ON Boss.empno = Worker.bossno
WHERE Boss.deptname = Worker.deptname;

#List the name of the boss and the number of employees they supervise.

SELECT Boss.empfname,count(*) as 'Number of subordinates'
FROM emp Boss JOIN emp Worker 
ON Boss.empno = Worker.bossno
GROUP BY Boss.empfname;

SELECT Boss.empfname,Worker.empfname 
FROM emp Boss JOIN emp Worker 
ON Boss.empno = Worker.bossno
Order by Boss.empfname;

#Home Assignment - List the name of the department, 
#the boss of the department and 
#the number of employees they supervise.


#Who preceded elizabeth II ? 

SELECT premonname,premonnum
FROM monarch
WHERE monname = 'Elizabeth' AND monnum = 'II';


SELECT premonname,premonnum
FROM monarch
WHERE monname = 'Elizabeth' and monnum = 'II';

#Was Elizabeth II's predecessor a king or queen?


SELECT * 
FROM monarch;

SELECT pred.montype as 'Predecessor Monarch Type'
FROM monarch curr JOIN monarch pred
ON pred.monname = curr.premonname
AND pred.monnum = curr.premonnum
WHERE curr.monname = 'Elizabeth' AND curr.monnum = 'II';

#Which british monarch is at the head of the monarchy family tree? 
SELECT * FROM monarch;

SELECT montype,monname,monnum
FROM monarch
WHERE premonname IS NULL;

SELECT pre.montype 
FROM monarch cur JOIN monarch pre
ON cur.premonname = pre.monname AND cur.premonnum = pre.monnum
WHERE cur.monname = 'Elizabeth'
AND cur.monnum = 'II';

#Class Assignment - List the kings and queens of England in ascending chronological order.


#List the product identifier 
#of each component of the animal photography kit.

SELECT subprodid 
FROM product JOIN assembly
ON 	product.prodid = assembly.prodid
WHERE proddesc = 'Animal photography kit';
   
#Home-Assignment List the product description and cost of each component 
#of the animal photography kit.





 



