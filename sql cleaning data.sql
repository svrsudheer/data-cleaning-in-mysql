use layoff;
-- create database layoff
-- upload csv file layoffs
-- ------create table like layoffs by name layoff_staging to not to change main data set-----------------------------------------------------
/*create table  layoff_staging
like layoffs;*/
-- -------insert layoffs data into layoff_staging ----using -----select--------------------------------------------------------------------------------------
/*insert layoff_staging 
select * from layoffs*/


-- SELECT * FROM layoff.layoff_staging;

-- -----------------giving row_number ---to all values---to check duplicates-----------------------------------------------------------------------------------------------

-- SELECT *,row_number() over (partition by company,location,industry,total_laid_off,percentage_laid_off,date,stage,country,funds_raised_millions)
-- as row_num
--  FROM layoff.layoff_staging;
 
 
 -- finding duplicates----------with cte---------------------------------------------------------------------------------------------------------------------
 /*with cte_duplicates as
 (
SELECT *,row_number() over (partition by company,location,industry,total_laid_off,percentage_laid_off,date,stage,country,funds_raised_millions)
as row_num
 FROM layoff.layoff_staging
 )
 select * from cte_duplicates
 where row_num >1;
 */
-- create like table as layoff_staging as layoff_staging_2----------with new table------from ----copy to Clipboard-------create statement-------paste--------------------------------------------------------------------------------
/*CREATE TABLE `layoff_staging_2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;*/

-- ----------------------------insert data into layoff_staging_2----------from ------layoff_staging with row_number---------
-- SELECT * FROM layoff.layoff_staging_2; 
-- insert layoff.layoff_staging_2
-- SELECT *,
-- row_number() 
-- over (partition by company,location,industry,total_laid_off,percentage_laid_off,date,stage,country,funds_raised_millions)
-- as row_num
--  FROM layoff.layoff_staging
-- ;
-- -------------------------check duplicate and delete it-------------------------------------------------------
-- SELECT * FROM layoff.layoff_staging_2 where row_num>1
-- delet FROM layoff.layoff_staging_2 where row_num>1
-- -----------------cleanind data stings-----------and date format-----------------------------------------------------------------------------------
-- select company,trim(company) from layoff.layoff_staging_2;
-- update layoff.layoff_staging_2 
-- set company = trim(company)
-- SELECT  distinct industry FROM layoff.layoff_staging_2 order by 1 ;
-- SELECT distinct industry from layoff_staging_2  where industry like "crypto%"
-- update  layoff.layoff_staging_2 
-- set industry = 'Crypto'
-- where industry like "crypto%"

-- SELECT  distinct country FROM layoff.layoff_staging_2 order by 1 ;
-- SELECT distinct country from layoff_staging_2  where country like 'United States%'
-- update  layoff.layoff_staging_2 
-- set country = trim(trailing '.' from country)
-- where country like "United States%";
-- select `date`,str_to_date(`date`,'%m/%d/%Y') FROM layoff.layoff_staging_2;
--  update  layoff.layoff_staging_2 
-- set date = str_to_date(`date`,'%m/%d/%Y');
-- alter table	layoff_staging_2
-- modify column `date`  date;
-- ------------------check for null value or empty cell or blank cells---------------------------------------
-- select * from layoff_staging_2 where industry is null or industry=''
-- select * from layoff_staging_2 where company= 'airbnb'; 
/* 
select t1.industry,t2.industry
 from layoff_staging_2 t1
join layoff_staging_2 t2
on t1.company = t2.company
where t1.industry is null 
and t2.industry is not null;
*/

/*select t1.company,t2.company
 from layoff_staging_2 t1
join layoff_staging_2 t2
on t1.company = t2.company
*/
/*
update layoff_staging_2
set industry= NULL
where industry='';
*/
/* 
select t1.industry,t2.industry
 from layoff_staging_2 t1
join layoff_staging_2 t2
on t1.company = t2.company
where t1.industry is null 
and t2.industry is not null;
*/
/*
update layoff_staging_2 t1
join layoff_staging_2 t2
on t1.company = t2.company
set t1.industry=t2.industry
where t1.industry is null 
and t2.industry is not null;
*/
-- select * from layoff_staging_2 where industry is null or industry=''
-- select * from layoff_staging_2 where total_laid_off is null 
-- delet from layoff_staging_2
-- where total_laid_off is null
-- and percentage_laid_off is null;
--  alter table layoff_staging_2
--  drop column row_num























