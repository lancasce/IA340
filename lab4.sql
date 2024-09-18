--4.1
/* No, becasue we still have records of VA in the income and population tables. */

--4.2
/* There is no fips value that is 80 so this does not work. */

--4.3
/* ChatGPT produced effective code for this purpose, however, it was not perfect. */

--4.6
/* the code worked perfectly */

SELECT name.name, income.income, income.year
FROM income
JOIN name ON income.fips = name.fips
WHERE income.year = (SELECT MAX(year) FROM income)
ORDER BY income.income DESC
LIMIT 1

--4.7

--4.8
/* not always perfectly accurate. you need to train it to work more precisely/be correct more often */
