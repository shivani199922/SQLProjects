USE new_schema;

-- ******************************
-- SLIDE 2
-- TOTAL Deaths in the World
-- ******************************
SELECT MAX(total_cases), MAX(total_deaths) FROM africa WHERE location = 'World'
UNION
SELECT MAX(total_cases), MAX(total_deaths) FROM asia WHERE location = 'World'
UNION
SELECT MAX(total_cases), MAX(total_deaths) FROM europe WHERE location = 'World'
UNION
SELECT MAX(total_cases), MAX(total_deaths) FROM north_america WHERE location = 'World'
UNION
SELECT MAX(total_cases), MAX(total_deaths) FROM oceania WHERE location = 'World'
UNION
SELECT MAX(total_cases), MAX(total_deaths) FROM south_america WHERE location = 'World';

-- ******************************
-- SLIDE 3
-- Growth in Death and New Cases
-- ******************************

SELECT date, new_deaths FROM africa WHERE location = 'World'
UNION
SELECT date, new_deaths FROM asia WHERE location = 'World'
UNION
SELECT date, new_deaths FROM europe WHERE location = 'World'
UNION
SELECT date, new_deaths FROM north_america WHERE location = 'World'
UNION
SELECT date, new_deaths FROM oceania WHERE location = 'World'
UNION
SELECT date, new_deaths FROM south_america WHERE location = 'World';

-- ******************************
-- SLIDE 4
-- Growth in Death and Vaccinations
-- ******************************

SELECT date, total_vaccinations FROM africa WHERE location = 'World'
UNION
SELECT date, total_vaccinations FROM asia WHERE location = 'World'
UNION
SELECT date, total_vaccinations FROM europe WHERE location = 'World'
UNION
SELECT date, total_vaccinations FROM north_america WHERE location = 'World'
UNION
SELECT date, total_vaccinations FROM oceania WHERE location = 'World'
UNION
SELECT date, total_vaccinations FROM south_america WHERE location = 'World';



-- ******************************
-- SLIDE 5
-- SPREAD by INCOME LEVEL
-- ******************************

SELECT location as income_level, MAX(total_cases) / MAX(population) * 100 as spread
FROM africa WHERE location in 
('High income','Low income','Lower middle income','Upper middle income')
GROUP BY 1
UNION
SELECT location as income_level, MAX(total_cases) / MAX(population) * 100 as spread
FROM asia WHERE location in 
('High income','Low income','Lower middle income','Upper middle income')
GROUP by 1 
UNION
SELECT location as income_level, MAX(total_cases) / MAX(population) * 100 as spread
FROM europe WHERE location in 
('High income','Low income','Lower middle income','Upper middle income')
GROUP by 1
UNION
SELECT location as income_level, MAX(total_cases) / MAX(population) * 100 as spread
FROM north_america WHERE location in 
('High income','Low income','Lower middle income','Upper middle income')
GROUP by 1
UNION
SELECT location as income_level, MAX(total_cases) / MAX(population) * 100 as spread
FROM oceania WHERE location in 
('High income','Low income','Lower middle income','Upper middle income')
GROUP by 1 
UNION
SELECT location as income_level, MAX(total_cases) / MAX(population) * 100 as spread
FROM south_america WHERE location in 
('High income','Low income','Lower middle income','Upper middle income')
GROUP by 1 ORDER BY 2 DESC;

-- ******************************
-- SLIDE 6
-- SPREAD Country
-- ******************************
SELECT location, MAX(total_cases) / MAX(population) * 100 as spread, MAX(population) as pop
FROM africa  WHERE continent <> '0'
GROUP by 1 
HAVING pop > 100000000
UNION
SELECT location, MAX(total_cases) / MAX(population) * 100 as spread, MAX(population) as pop
FROM asia  WHERE continent <> '0'
GROUP by 1 
HAVING pop > 100000000
UNION
SELECT location, MAX(total_cases) / MAX(population) * 100 as spread, MAX(population) as pop
FROM europe WHERE continent <> '0'
GROUP by 1 
HAVING pop > 100000000
UNION
SELECT location, MAX(total_cases) / MAX(population) * 100 as spread, MAX(population) as pop
FROM north_america WHERE continent <> '0'
GROUP by 1 
HAVING pop > 100000000
UNION
SELECT location, MAX(total_cases) / MAX(population) * 100 as spread, MAX(population) as pop
FROM oceania WHERE continent <> '0'
GROUP by 1 
HAVING pop > 100000000
UNION
SELECT location, MAX(total_cases) / MAX(population) * 100 as spread, MAX(population) as pop
FROM south_america  WHERE continent <> '0'
GROUP by 1 
HAVING pop > 100000000
ORDER BY 2 DESC;

-- *******************************
-- SLIDE 7
-- SPREAD vs GDP
-- *******************************


SELECT location, MAX(total_cases) / MAX(population) * 100 as spread, max(gdp_per_capita) as gdp_per_capita
FROM asia  WHERE continent <> '0'
GROUP by 1
UNION
SELECT location, MAX(total_cases) / MAX(population) * 100 as spread, max(gdp_per_capita) as gdp_per_capita
FROM africa WHERE continent <> '0'
GROUP by 1
UNION
SELECT location, MAX(total_cases) / MAX(population) * 100 as spread, max(gdp_per_capita) as gdp_per_capita
FROM europe  WHERE continent <> '0'
GROUP by 1
UNION
SELECT location, MAX(total_cases) / MAX(population) * 100 as spread, max(gdp_per_capita) as gdp_per_capita
FROM north_america WHERE continent <> '0'
GROUP by 1
UNION
SELECT location, MAX(total_cases) / MAX(population) * 100 as spread, max(gdp_per_capita) as gdp_per_capita
FROM oceania WHERE continent <> '0'
GROUP by 1
UNION
SELECT location, MAX(total_cases) / MAX(population) * 100 as spread, max(gdp_per_capita) as gdp_per_capita
FROM south_america WHERE continent <> '0'
GROUP by 1;
