select *
From CovidDeaths$
Order by 1,2

select location, date, total_cases, new_cases, total_deaths, population
From CovidDeaths$
Order by 1,2

--looking at total cases vs total deaths
--shows the licklyhood of dying of covid in your country 

select location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as deathpercentage
From CovidDeaths$
Where location like '%states%'
Order by 1,2


--Looking at Total Cases Vs Population 
select location, date, total_cases, population, (total_cases/population)*100 as PercentofPopulationInfected
From CovidDeaths$
Where location = 'united States'
Order by 1,2

--looking for the country with the highest infection rate compaired to population 
select location, population, MAX(total_cases) as Highestinfectioncount,  Max((total_cases/population))*100 as PercentPopulationInfected
From CovidDeaths$
--Where location = 'united States'
Group by  location, population
Order by 1,2

--Showing countries with Highest Death Counr per population 

Select  location,MAX(total_deaths) as TotalDeathCount
From CovidDeaths$
--Where location = 'united States'
Where continent is not null 
Group by location
Order by TotalDeathCount desc

--LETS BREAK THINGS DOWN BY CONTINENT
Select continent, MAX(total_deaths) as TotalDeathCount
From CovidDeaths$
--Where location = 'united States'
Where continent is not null 
Group by continent
order by TotalDeathCount desc


--GLOBAL NUMBERS
--Death percentage each date
Select date, SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(New_cases)*100 as DeathPercentage
From CovidDeaths$
Where continent is not null 
Group By date
order by 1,2 

--total Global death percentage 
Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(New_cases)*100 as DeathPercentage
From CovidDeaths$
Where continent is not null 
--Group By date
order by 1,2 

--total vaccinations vs population 
select location, population, MAX(total_cases) as Highestinfectioncount,  Max((total_cases/population))*100 as PercentPopulationInfected,
 Max((total_vaccinations/population))*100
From CovidDeaths$
--Where location = 'united States'
Order by 1,2