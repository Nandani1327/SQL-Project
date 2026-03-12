#1.
use project2;
show tables;
select * from sports1;
select * from sports2;

#2.Write an sql query to show all the UNIQUE team names 
select distinct (team) team_name from sports2;

#3.write an SQL query to show name of team which has rank 1 from group 7 
select team from sports2 where `group`=7 and `rank`=1;

#4.Write an sql query to show count of all teams
select count(team) from sports2 ;

#5.Write an SQL query to show matches_played by each team
select  distinct (team) ,matches_played  from sports2;

#6.Write an SQL query to show team, percent of wins with respect to matches_played by each team and name the resulting column as wins_percent
select team,100.0*(wins/matches_played) from sports2;

#7.Write an SQL query to show which team has maximum goals_scored and their count 
select team,goals_scored from sports2 where goals_scored =    (select max(goals_scored) from sports2);

#8.Write an SQL query to show percent of draws with respect to matches_played round of to 2 digits by each team
select team,round(100.0*(draws/matches_played)) from sports2;

#9.Write an SQL query to show which team has minimum goals_scored and their count
select team,goals_scored from sports2 where goals_scored = (select min(goals_scored) from sports2);

/*10.Write an SQL query to show percent of losses with respect to matches_played by each team in ascending order by losses
*and name the resulting column as losses_percent
*/
select team,100.0*(losses/matches_played) from sports2 order by losses;

#11.Write an SQL query to show the average goal_difference 
select avg(goal_difference) from sports2;

#12.Write an SQL query to show name of the team where points are 0 
select team,points from sports2 where points=0;

#13.Write a SQL query to show all data where expected_goal_scored is less than exp_goal_conceded
select * from sports2 where expected_goal_scored < exp_goal_conceded;

#14.Write an SQL query to show data where exp_goal_difference is in between -0.5 and 0.5
select exp_goal_difference from sports2 where exp_goal_difference between -0.5 and 0.5;

#15.Write an SQL query to show all data in ascending order by exp_goal_difference_per_90
select * from sports2 order by exp_goal_difference_per_90;

#16.Write an SQL query to show team which has maximum number of players_used
select team,players_used from sports1 where players_used = (select max(players_used) from sports1);

#17.Write an SQL query to show each team name and avg_age in ascending order by avg_age
select team,avg_age from sports1 order by avg_age ;

#18.Write an sql query to show average possession of teams
select team,avg(possession) from sports1 group by team;

#19.Write a SQL query to show team which has played atleast 5 games
select team,games from sports1 where games <= 5;

#20.Write an SQL query to show all data for which minutes is greater than 600
select * from sports1 where minutes > 600;

#21.Write an SQL query to show team, goals, assists in ascending order by goals
select team,goals,assists from sports1 order by goals ;

#22.Write an SQL query to show team, pens_made, pens_att in descending order by pens_made
select team,pens_made,pens_att from sports1 order by pens_made desc;

#23.Write an SQL query to show team, cards_yellow, cards_red where cards_red is equal to 1 in ascending order by cards_yellow
select team,cards_yellow,cards_red from sports1 where cards_red = 1 order by cards_yellow;

#24.Write an SQL query to show team, goals_per90, assists_per90, goals_assists_per90 in descending order by goals_assists_per90 
select team, goals_per90, assists_per90, goals_assists_per90 from sports1 order by goals_assists_per90 desc;

#25.Write an SQL query to show team, goals_pens_per90, goals_assists_pens_per90 in ascending order by goals_assists_pens_per90 
select team, goals_pens_per90, goals_assists_pens_per90 from sports1 order by goals_assists_pens_per90 asc;

#26.Write an SQL query to show team, shots, shots_on_target, shots_on_target_pct where shots_on_target_pct is less than 30 in ascending order by shots_on_target_pct 
select team, shots, shots_on_target, shots_on_target_pct from sports1 where shots_on_target_pct < 30 order by shots_on_target_pct ;

#27.Write an SQL query to show team, shots_per90, shots_on_target_per90 for team Belgium
select team, shots_per90, shots_on_target_per90 from sports1 where team = "Belgium";

#28.Write an SQL query to show team, goals_per_shot, goals_per_shot_on_target, average_shot_distance in descending order by average_shot_distance 
select team, goals_per_shot, goals_per_shot_on_target, average_shot_distance from sports1 order by average_shot_distance desc ;

#29.Write an SQL query to show team, errors, touches for which errors is 0 and touches is less than 1500
select  team, errors, touches from sports1 where errors = 0 and touches < 1500;

#30.Write an SQL query to show team, fouls which has maximum number of fouls
select team , fouls from sports1 where fouls = (select max(fouls) from sports1);

#31.Write an SQL query to show team, offsides which has offsides less than 10 or greater than 20
select team,offsides from sports1 where offsides < 10 or offsides > 20;

#32.Write an SQL query to show team, aerials_won, aerials_lost, aerials_won_pct in descending order by aerials_won_pct 
select team, aerials_won, aerials_lost, aerials_won_pct from sports1 order by aerials_won_pct desc; 

#33.Write an SQL query to show number of teams each group has.
 select `group`,count(team) from sports1 group by  `group`; 

#34.Write a SQL query to show team names group 6 has
select team,`group` from sports2 where `group` = 6;

#35.Write an SQL query to show Australia belongs to which group 
select team,`group` from sports2 where team="australia";

#36.Write an SQL query to show group, average wins by each group 
select `group`,avg(wins) from sports2 group by `group` ;

#37.Write an SQL query to show group, maximum expected_goal_scored by each group in ascending order by expected_goal_scored
select `group` ,max(expected_goal_scored) as ex from sports2 group by `group`order by ex;

#38.Write an SQL query to show group, minimum exp_goal_conceded by each group in descending order by exp_goal_conceded 
select `group` , min(exp_goal_conceded) as exp from sports2 group by `group` order by exp desc;

#39.Write an SQL query to show group, average exp_goal_difference_per_90 for each group in ascending order by exp_goal_difference_per_90 
select `group` , avg(exp_goal_difference_per_90) as goal from sports2 group by `group` order by goal;

#40.Write an SQL query to show which team has equal number of goals_scored and goals_against 
select team,goals_scored,goals_against  from sports2 where goals_scored = goals_against;

#41.Write an SQL query to show which team has maximum players_used 
select team, max(players_used) from sports1 group by team;

#42.Write an SQL query to show team, players_used, avg_age, games, minutes where minutes lessthan 500 and greater than 200 
select  team, players_used, avg_age, games, minutes from sports1 where minutes < 500 and minutes > 200;

#43.write an SQL query to show all data of group_stats in ascending order BY points
select * from sports2 order by points;

#44.Write an SQL query to show ALL UNIQUE team in ascending order by team
select distinct (team) from sports1 order by team;
select distinct (team) from sports2 order by team;

#45.Write an SQL query to show average avg_age of each group and arrange it in descending order by avg_age. 
select sports2.`group`,avg(sports1.avg_age) as age from sports1 inner join sports2 on sports1.team=sports2.team  group by sports2.`group` order by age desc;
select * from sports2;
#46.Write an SQL query to show sum of fouls for each group and arrange it in ascending order by fouls.
select sports2.`group` ,sum(sports1.fouls) as f from sports1 inner join sports2 on sports1.team=sports2.team group by sports2.`group` order by f; 

#47.Write an SQL query to show total number of games for each group and arrange it in descending order by games. 
select sports2.`group` , sum(sports1.games) as game from sports1 inner join sports2 on sports1.team=sports2.team group by sports2.`group` order by game desc;

#48.Write an SQL query to show total number of players_used for each group and arrange it in ascending order by players_used. 
select sports2.`group` , sum(sports1.players_used) as player from sports1 inner join sports2 on sports1.team=sports2.team group by sports2.`group` order by player;

#49.Write an SQL query to show total number of offsides for each group and arrange it in ascending order by offsides.
select sports2.`group` , sum(sports1.offsides) as offside from sports1 inner join sports2 on sports1.team=sports2.team group by sports2.`group` order by offside;

#50.Write an SQL query to show average passes_pct for each group and arrange it in descending order by passes_pct.
select sports2.`group`, avg(sports1.passes_pct) as passes from sports1 inner join sports2 on sports1.team=sports2.team group by sports2.`group` order by passes desc;

#51.Write an SQL query to show average goals_per90 for each group and arrange it in ascending order by goals_per90.
select sports2.`group`, avg(sports1.goals_per90) as goals from sports1 inner join sports2 on sports1.team=sports2.team group by sports2.`group` order by goals;