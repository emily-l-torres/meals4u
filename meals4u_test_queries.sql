-- Simple query
-- This simple query gets all entrees with more than 10 in quantity.
SELECT g.Item_Name, g.Quantity 
FROM General_Item_Inventory g 
JOIN Entree e ON g.Item_ID = e.Item_ID 
WHERE g.Quantity > 10;
-- Aggregate
-- This aggregate SQL query counts how many items fall under each category (Entree, Side, Drink).
SELECT Item_Type, COUNT(*) AS Item_Count 
FROM General_Item_Inventory 
GROUP BY Item_Type;
-- Inner join/outer join
-- This inner join SQL query gets all students and their university names.
SELECT u.Name AS Student_Name, uni.College_Name 
FROM Students s 
JOIN Users u ON s.User_ID = u.User_ID 
JOIN Universities uni ON s.College_ID = uni.College_ID;
-- Nested query
-- This nested query lists all students who are on a plan with more than 25 meals.
SELECT Name
FROM Users
WHERE User_ID IN (
    SELECT User_ID
    FROM Students
    WHERE Plan_ID IN (
        SELECT Plan_ID
        FROM Plans
        WHERE Total_Meals > 25
    )
);
-- Correlated query
-- This correlated query finds users who ordered more than their average quantity per order.
SELECT DISTINCT oh.User_ID 
FROM Order_History oh 
WHERE oh.Quantity > ( 
	SELECT AVG(oh2.Quantity) 
	FROM Order_History oh2 
	WHERE oh2.User_ID = oh.User_ID 
);
-- >=ALL/>ANY/Exists/Not Exists
-- This >= ALL query gets students who are paying the highest base price for their plan.
SELECT s.User_ID, p.Base_Price 
FROM Students s 
JOIN Plans p ON s.Plan_ID = p.Plan_ID 
WHERE p.Base_Price >= ALL ( 
	SELECT Base_Price 
	FROM Plans 
);
-- This EXISTS query finds students who belong to universities with more than 100 Meals4U students.
SELECT u.Name 
FROM Users u 
WHERE EXISTS ( 
	SELECT 1 
	FROM Students s 
	JOIN Universities uni ON s.College_ID = uni.College_ID 
	WHERE s.User_ID = u.User_ID AND uni.Students_in_Meals4U > 100 
);
-- Set operations (Union)
-- This union query lists all item names from both entrees and sides.
SELECT g.Item_Name 
FROM General_Item_Inventory g 
JOIN Entree e ON g.Item_ID = e.Item_ID 
UNION 
SELECT g.Item_Name 
FROM General_Item_Inventory g 
JOIN Side s ON g.Item_ID = s.Item_ID;
-- Subqueries in Select and From
-- This subquery in from lists students and their latest plan delivery.
SELECT u.Name, latest_plans.Scheduled_Delivery_Date 
FROM Students s 
JOIN Users u ON s.User_ID = u.User_ID 
JOIN ( 
	SELECT User_ID, MAX(Scheduled_Delivery_Date) AS Scheduled_Delivery_Date 
	FROM Plans 
	GROUP BY User_ID 
) AS latest_plans ON s.User_ID = latest_plans.User_ID;
