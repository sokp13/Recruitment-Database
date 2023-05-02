
-- Viewing each of the players in the database
select * from person;

-- Viewing each player, and their body measurements, and their information
select p.first_name, p.last_name, g.date_of_birth, c.email, n.phone_number
from person p 
join general g on g.date_of_birth = p.date_of_birth
join contact c on c.ID = p.ID
join numbers n on n.contact_id = c.ID;

-- Viewing players with their statlines, team info, if they're a postgraduate
select p.first_name, p.last_name, t.team_name, t.coach_name, s.PPG, s.APG, s.RPG, s.field_goal_pct, s.three_point_pct, e.is_postgraduate
from person p 
join statistics s on p.ID = s.ID
join teams t on t.team_name = p.team_name
join eligibility e on e.grad_year = p.grad_year and p.gpa = e.gpa;

-- Connecting players to socials regardless if they have them or not
select *
from person p 
natural join contact c
left outer join socials s on s.social_media_id = c.social_media_id;

-- Aggregates all the recruit points
select sum(PPG) as 'All Recruit Points Scored'
from statistics;

-- Showing the teams how have someone with at least a 3.6 gpa
select distinct p.team_name
from person p
join eligibility e on e.grad_year = p.grad_year and e.gpa = p.gpa
where (e.grad_year, e.gpa) in (
  select grad_year, max(gpa)
  from eligibility
  group by grad_year
  having gpa > 3.6
);

-- Gives us the teams who don't have a guard in the database
SELECT team_name
FROM teams
WHERE NOT EXISTS (
    SELECT *
    FROM person
    WHERE person.team_name = teams.team_name
      AND person.position like '%Guard%'
);

-- Shows the teams that don't have a player in the db born after 2005
select team_name, count(*) as 'Players'
from person
where date_of_birth between '2004-01-01' AND '2005-12-31'
  and team_name in (
    select team_name
    from teams
  )
group by team_name;