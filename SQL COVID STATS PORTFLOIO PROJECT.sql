select   MAX(total_cases) as Highestinfectioncount,  Max((total_cases/population))*100 as PercentPopulationInfected,
 Max((total_vaccinations/population))* 100 as numberofvaccinated 
From CovidDeaths$
Order by 1,2   