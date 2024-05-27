use casestudy;
select * from swiggy;
select count(*) from swiggy;

-- now we solve the Question 

-- question 1: how many restaurant have a rating greate than 4.5
select count(distinct(restaurant_name))high_rated_restaurant from swiggy where rating>4.5;

-- question 2:WHICH IS THE TOP 1 CITY WITH THE HIGHEST NUMBER OF RESTAURANTS?
select city ,count(distinct restaurant_name) restaurnat_count from swiggy group by city order by restaurnat_count desc limit 1;

-- question 3:HOW MANY RESTAURANTS HAVE THE WORD "PIZZA" IN THEIR NAME?->String matching
select count(distinct restaurant_name) as pizza_restaurants from swiggy where restaurant_name like '%Pizza%';

-- question 4:WHAT IS THE MOST COMMON CUISINE AMONG THE RESTAURANTS IN THE DATASET?
select cuisine,count(*) as cuisine_count from swiggy group by cuisine order by cuisine_count desc limit 1;

-- question 5:WHAT IS THE AVERAGE RATING OF RESTAURANTS IN EACH CITY?

select city,avg(rating) 'avg_rating' from swiggy group by city;

-- question 6:WHAT IS THE HIGHEST PRICE OF ITEM UNDER THE 'RECOMMENDED' MENU CATEGORY FOR EACH RESTAURANT?
select distinct restaurant_name ,menu_category,max(price) highestprice from swiggy where menu_category='Recommended' group by restaurant_name,menu_category;

-- question 7: FIND THE TOP 5 MOST EXPENSIVE RESTAURANTS THAT OFFER CUISINE OTHER THAN INDIAN CUISINE
select distinct restaurant_name,cost_per_person from swiggy where cuisine !='India' order by cost_per_person desc limit 5;

-- question 8:FIND THE RESTAURANTS THAT HAVE AN AVERAGE COST WHICH IS HIGHER THAN THE TOTAL AVERAGE COST OF ALL RESTAURANTS TOGETHER.
select distinct restaurant_name,cost_per_person from swiggy where cost_per_person > (select avg(cost_per_person) from swiggy);

-- question 9:RETRIEVE THE DETAILS OF RESTAURANTS THAT HAVE THE SAME NAME BUT ARE LOCATED IN DIFFERENT CITIES.
select distinct t1.restaurant_name ,t1.city,t2.city from swiggy t1 join swiggy t2 on t1.restaurant_name = t2.restaurant_name and t1.city != t2.city;

-- question 10:WHICH RESTAURANT OFFERS THE MOST NUMBER OF ITEMS IN THE 'MAIN COURSE' CATEGORY?
select distinct restaurant_name ,menu_category,count(item) as no_of_items from swiggy where menu_category='Main Course' group by restaurant_name,menu_category order by no_of_items desc limit 1;

-- question 11:LIST THE NAMES OF RESTAURANTS THAT ARE 100% VEGEATARIAN IN ALPHABETICAL ORDER OF RESTAURANT NAME.
select distinct restaurant_name,(count(case when veg_or_nonveg='Veg' then 1 end)*100/count(*)) as vegeatarian_percetage from swiggy group by restaurant_name having vegeatarian_percetage=100.00 order by restaurant_name;

-- question 12:WHICH IS RESTAURNAT PROVIDING THE LOWESET AVERAGE PRICE FOR ALL ITEMS?
SELECT DISTINCT RESTAURANT_NAME,AVG(PRICE) AS AVERAGE_PRICE FROM SWIGGY group by RESTAURANT_NAME ORDER BY AVERAGE_PRICE LIMIT 1;

-- QUESTION 13:WHICH TOP 5 RESTAURANT OFFERS HIGHEST NUMBER OF CATEGORIES?
SELECT DISTINCT RESTAURANT_NAME ,COUNT(DISTINCT MENU_CATEGORY)AS NO_OF_CATEGORIES FROM SWIGGY group by RESTAURANT_NAME ORDER BY NO_OF_CATEGORIES DESC LIMIT 5;

-- QUESTION 14:WHICH RESTAURANT PROVIDES THE HIGHEST PERCENTAGE OF NON-VEGEATARIAN FOOD?

 SELECT distinct RESTAURANT_NAME ,
(COUNT(CASE WHEN VEG_OR_NONVEG='Non-veg' then 1 end) *100 /count(*)) as nonvegetraian_percentage from swiggy group by restaurant_name order by nonvegetraian_percentage desc limit 1;

-- SELECT * FROM SWIGGY; 