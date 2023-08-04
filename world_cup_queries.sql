use worldcup;


-- #1 who had the most goals?
select player_name, goals_scored
from wc_player_stats
order by goals_scored desc
limit 4;

-- #2 which forward or mid had the least goals?
select player_name, goals_scored, position
from wc_player_stats
where 
	(position =  "FW") or
	(position = "MF")
order by goals_scored asc;

-- #3 which defenders had the most goals?
select player_name, goals_scored, position
from wc_player_stats
where 
	position =  "DF"
order by goals_scored desc;

-- #4 which club has the most international players
select club, count(*)
from wc_player_stats
group by club
order by count(*) desc;

-- #5 who had the most assists
select player_name, assists
from wc_player_stats
order by assists desc;

-- #6 which midfielder had the most assists
select player_name, assists, position
from wc_player_stats
where position= "MF"
order by assists desc;

-- #7 who had the most appearances 
select player_name, appearances
from wc_player_stats
order by appearances desc
limit 5;

-- #8 which defender made the most tackles 
select wc_player_stats.player_name, wc_player_stats.position, wc_player_stats2.successful_tackles
from wc_player_stats
inner join wc_player_stats2 on  wc_player_stats.player_id= wc_player_stats2.player_id
where  wc_player_stats.position="DF"
order by 3 desc;

-- #9 who had the most minutes played
select wc_player_stats.player_name, wc_player_stats.position, wc_player_stats2.minutes_played
from wc_player_stats
inner join wc_player_stats2 on  wc_player_stats.player_id= wc_player_stats2.player_id
order by 3 desc;

-- #10 who caused the most fouls
select  wc_player_stats.player_name, wc_player_stats.position, wc_player_stats2.fouls_caused
from wc_player_stats
inner join wc_player_stats2 on  wc_player_stats.player_id= wc_player_stats2.player_id
order by 3 desc;

-- #11 who caused the most fouls
select  wc_player_stats.player_name, wc_player_stats.position, wc_player_stats2.fouls_commited
from wc_player_stats
inner join wc_player_stats2 on  wc_player_stats.player_id= wc_player_stats2.player_id
order by 3 desc;

-- #12 players from what clubs caused the most fouls
select  wc_player_stats.club, sum(wc_player_stats2.fouls_caused)
from wc_player_stats
inner join wc_player_stats2 on  wc_player_stats.player_id= wc_player_stats2.player_id
group by  wc_player_stats.club
order by 2 desc;

-- #13 what national team caused the most fouls 
select  wc_player_stats.nationality, sum(wc_player_stats2.fouls_caused)
from wc_player_stats
inner join wc_player_stats2 on  wc_player_stats.player_id= wc_player_stats2.player_id
group by  wc_player_stats.nationality
order by 2 desc;

-- #14 players from what clubs commited the most fouls
select  wc_player_stats.club, sum(wc_player_stats2.fouls_commited)
from wc_player_stats
inner join wc_player_stats2 on  wc_player_stats.player_id= wc_player_stats2.player_id
group by  wc_player_stats.club
order by 2 desc;

-- #15 what national team commited the most fouls 
select  wc_player_stats.nationality, sum(wc_player_stats2.fouls_commited)
from wc_player_stats
inner join wc_player_stats2 on  wc_player_stats.player_id= wc_player_stats2.player_id
group by  wc_player_stats.nationality
order by 2 desc;

-- #16 Which player has the most successful dribbles
select wc_player_stats.player_name, wc_player_stats.position, wc_player_stats2.successful_dribbles
from wc_player_stats
inner join wc_player_stats2 on  wc_player_stats.player_id= wc_player_stats2.player_id
order by 3 desc;

-- #17 Who completed the most passes
select wc_player_stats.player_name, wc_player_stats.position, wc_player_stats2.pass_completed,pass_completed_percent
from wc_player_stats
inner join wc_player_stats2 on  wc_player_stats.player_id= wc_player_stats2.player_id
order by 3 desc;

# 18 which team had the most shots
select wc_player_stats.nationality, sum(wc_player_stats2.shots) as total_shots
from wc_player_stats
inner join wc_player_stats2 on  wc_player_stats.player_id= wc_player_stats2.player_id
group by wc_player_stats.nationality
order by 2 desc;

# 19 which team had the most shots on target
select wc_player_stats.nationality, sum(wc_player_stats2.shots_on_target) as shots_on_target
from wc_player_stats
inner join wc_player_stats2 on  wc_player_stats.player_id= wc_player_stats2.player_id
group by wc_player_stats.nationality
order by 2 desc;

-- #20 which age group has the most goals
select
case 
when age between 15 and 20 then '15-20'
when age between 21 and 25 then '21-25'
when age between 26 and 30 then '26-30'
when age between 31 and 35 then '31-35'
when age between 36 and 40 then '36-40'
end as age_range,
sum(goals_scored) as goals_scored
from wc_player_stats
group by age_range
order by goals_scored desc;

-- #21 which age group has the most assists
select
case 
when age between 15 and 20 then '15-20'
when age between 21 and 25 then '21-25'
when age between 26 and 30 then '26-30'
when age between 31 and 35 then '31-35'
when age between 36 and 40 then '36-40'
end as age_range,
sum(assists) as assists
from wc_player_stats
group by age_range
order by assists desc;

-- #22 which age group has the most minutes on average
select
case 
when wc_player_stats.age between 15 and 20 then '15-20'
when wc_player_stats.age between 21 and 25 then '21-25'
when wc_player_stats.age between 26 and 30 then '26-30'
when wc_player_stats.age between 31 and 35 then '31-35'
when wc_player_stats.age between 36 and 40 then '36-40'
end as age_range,
avg(wc_player_stats2.minutes_played) as minutes_played
from wc_player_stats
inner join wc_player_stats2 on  wc_player_stats.player_id= wc_player_stats2.player_id
group by 1
order by 2 desc;

-- #23 which team had the least tackles
select wc_player_stats.nationality, sum(wc_player_stats2.successful_tackles) as total_tackles
from wc_player_stats
inner join wc_player_stats2 on  wc_player_stats.player_id= wc_player_stats2.player_id
group by 1
order by 2 desc;

-- #24 Which player has the highest pass completed to minutes ratio. Only players that played more than 90 minutes(1 full game)
select 
wc_player_stats.player_id, wc_player_stats.player_name, wc_player_stats2.pass_completed/wc_player_stats2.minutes_played as ratio
from wc_player_stats
inner join wc_player_stats2 on  wc_player_stats.player_id= wc_player_stats2.player_id
where wc_player_stats2.minutes_played > 90
order by 3 desc;

-- #25	What national team has played the most world cup games ****

select  away_team,count(*)
from wc_1930_2018
group by away_team
order by count(*) desc;

select home_team,count(*)
from wc_1930_2018
group by home_team
order by count(*) desc;

-- #26	*** What national team has played the most world cups
select home_team,count(*)
from wc_1930_2018
group by home_team,year
order by 2 desc;

select away_team,count(*)
from wc_1930_2018
group by away_team,year
order by 2 desc;

-- #27 who has won the most world cups
select  winner, count(winner)
from world_cups
group by winner
order by 2 desc;

-- #28	what team has scored the most goals of all time
select home_team, away_team, sum(home_goals + away_goals)
from wc_1930_2018
group by home_team
order by 3 desc;

select home_team, away_team, sum(home_goals + away_goals)
from wc_1930_2018
group by away_team
order by 3 desc;



