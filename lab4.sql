--4.1
/* No, becasue we still have records of VA in the income and population tables. */

--4.2
/* There is no fips value that is 80 so this does not work. */

--4.3
/* ChatGPT produced effective code for this purpose, however, it was not perfect. */

--4.5
/* the code worked perfectly */

--4.6
WITH recent_year AS (
  SELECT MAX(year) AS lastest_year
  FROM income
)
  
SELECT name.name, income.income, income.year
FROM income
JOIN name ON income.fips = name.fips
WHERE income.year = (SELECT MAX(year) FROM income)
ORDER BY income.income DESC
LIMIT 1

--4.7
WITH recent_pop AS (
    SELECT pop 
    FROM population 
    WHERE fips = '51'
    ORDER BY year DESC
    LIMIT 1
),
old_pop AS (
    SELECT pop 
    FROM population 
    WHERE fips = '51' 
    ORDER BY year DESC 
    OFFSET 5 LIMIT 1
)
SELECT 
    ((recent_pop.pop - old_pop.pop) / old_pop.pop::decimal) * 100 AS growth_rate
FROM 
    recent_pop, old_pop

/* Prompt: Calculate the VA population growth rate in the past five year 
I did  have to modify to get a better result because it did not presenta  clear code the first time. */

--4.8
/* ChatGPTs responses are not not always accurate. The code produced in usually effective.
Sometimes you are required to build off of your previous prompt to get a more effective answer to your question. */
