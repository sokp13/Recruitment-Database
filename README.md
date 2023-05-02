Sean Okpoebo

***
**Domain Description**
***
*College Recruitment Database*:
This database is designed to store and manage information related to the recruitment of high school athletes by colleges. It includes student information, their statistical information, and whether or not these students have received offers from colleges.

***
**Entities and Relationships**
***
_Each of these entities will be assigned an easily-trackable identifier, to make accession simpler.
_
_Person_
The representation of the high-school recruit. This entity contains the name, and position of each player, among additional information. 

_Teams_
The representation of the teams which these players played for. This contains the name, location, and coach of each team.

_Statistics_
The representation of the player's statline from while playing in high school. Note: the statstics can be abbreviated.

- Points per game : PPG
- Assists per game : APG
- Rebounds per game : RPG
- Blocks per game : BPG
- Steals per game : SPG

_Recruitment_
The representation of colleges offering scholarships and campus visits to certain players. This contains the player name, offering school, and if an offer is extended.

_Eligibility_
The entity that withholds information regarding a players graduation year, gpa, and post-graduate status.

_Body_
The entity that stores unique player physical makeups concerning height, weight, wingspan, and vertical jump. Height, wingspan, and vertical is measured in inches, and weight in pounds.

_Contact_
The entity representing where the player's contact information can be found. Phone numbers, emails, and social media handles are stored here.

***
**E-R Diagram**
***
![](diagram.png)


***
**Relation Schema**
***
(primary keys are **bold**)

person(**ID**, first_name, last_name, position, date_of_birth, grad_year, gpa, team_name)   

general(**date_of_birth**, hometown, nationality) 

body(**ID**, height, weight, wingspan, vertical_leap) 

statistics(**ID**, ppg, rpg, apg, bpg, spg, field_goal_pct, three_point_pct, free_throw_pct) 

contact(**ID**, social_media_id, email) 

numbers(**contact_id**, phone_number) 

teams(**team_name**, coach_name, city, state, country) 

eligibility(**grad_year**, **gpa**, is_postgraduate) 

recruitment(**player_visit_id**, first_name, last_name, school, date_of_visit, official, offered) 

socials(**social_media_id**, Snapchat, Instagram, Twitter)

_For each of these functional dependencies, none end up being non-trivial, and each primary key uniquely identifies tuples within each relation._

***
**Transaction and Query Executions**
***

_Viewing each player, and their information_
~~~~sql
select p.first_name, p.last_name, g.date_of_birth, c.email, n.phone_number
from person p 
join general g on g.date_of_birth = p.date_of_birth
join contact c on c.ID = p.ID
join numbers n on n.contact_id = c.ID;
~~~~
| first_name | last_name | date_of_birth | email                      | phone_number   |
|------------|-----------|---------------|----------------------------|----------------|
| Omar       | Said      | 2004-09-11    | osaid@gmail.com            | (905) 557-1234 |
| Martin     | Silva     | 2007-01-28    | sillysilva@gmail.com       | (248) 325-5678 |
| Leslie     | Garcia    | 2008-02-15    | leslieIsABoyname@gmail.com | (319) 555-1234 |
| Amadou     | Diallo    | 2004-11-12    | naija1960@outlook.com      | (978) 190-6789 |
| Aidan      | Kone      | 2006-05-03    | kone_aidan323@yahoo.com    | (773) 555-3456 |
| Liam       | Smith     | 2005-04-10    | d33pthree0@gmail.com       | (306) 441-4321 |
| Tomas      | Müller    | 2006-06-30    | tomasRellum@yahoo.com      | (306) 555-9876 |
| Evan       | Johnson   | 2007-08-21    | backcourtEJ@gmail.com      | (312) 829-5678 |
| Tariq      | Niang     | 2006-12-05    | tariqnn@outlook.com        | (843) 555-8765 |


_Viewing players with their statlines, team info, if they're a postgraduate_
~~~~sql
select p.first_name, p.last_name, t.team_name, t.coach_name, s.PPG, s.APG, s.RPG, s.field_goal_pct, s.three_point_pct, e.is_postgraduate
from person p 
join statistics s on p.ID = s.ID
join teams t on t.team_name = p.team_name
join eligibility e on e.grad_year = p.grad_year and p.gpa = e.gpa;
~~~~
| first_name | last_name | team_name                       | coach_name         | PPG  | APG  | RPG  | field_goal_pct | three_point_pct | is_postgraduate |
|------------|-----------|---------------------------------|--------------------|------|------|------|----------------|-----------------|-----------------|
| Evan       | Johnson   | Lakeview High School            | Torii Weatherspoon | 35.4 | 13.3 | 7.8  | 46.4           | 43.3            | no              |
| Liam       | Smith     | Central College                 | Benjamin Kim       | 21.5 | 5.2  | 18.6 | 65.4           | 40.7            | no              |
| Tariq      | Niang     | East High School                | Kevin Griese       | 27.3 | 5.2  | 8.9  | 51.9           | 38.2            | no              |
| Leslie     | Garcia    | North High School               | Geno Davis         | 25.8 | 4.3  | 12.1 | 55.7           | 32.3            | no              |
| Tomas      | Müller    | Central College                 | Benjamin Kim       | 24.5 | 8.7  | 5.3  | 49.8           | 42.5            | no              |
| Amadou     | Diallo    | Reed Academy                    | Daniel Lee         | 17.2 | 7.1  | 8.9  | 50.1           | 27.6            | yes             |
| Kofi       | Appiah    | Liberty High School             | Matthew Wong       | 22.3 | 2.5  | 13.3 | 75.7           | 27.9            | no              |
| Martin     | Silva     | Freedom High School             | William Davis      | 28.6 | 6.4  | 7.8  | 51             | 39.4            | no              |
| Aidan      | Kone      | Hope Science Preparatory School | Andrew Johnson     | 27.8 | 6.2  | 4.9  | 51.3           | 46.7            | no              |


_Connecting players to socials regardless if they have them or not_
~~~~sql
select *
from person p 
natural join contact c
left outer join socials s on s.social_media_id = c.social_media_id;
~~~~
| ID | first_name | last_name | position       | date_of_birth | grad_year | gpa | team_name                       | social_media_id | email                      | social_media_id | Snapchat      | Instagram  | Twitter       |
|----|------------|-----------|----------------|---------------|-----------|-----|---------------------------------|-----------------|----------------------------|-----------------|---------------|------------|---------------|
| 10 | Omar       | Said      | Shooting Guard | 2004-09-11    | 2023      | 3.2 | Unity Academy                   | 1               | osaid@gmail.com            | 1               | @EJEJ27       | NULL       | NULL          |
| 8  | Martin     | Silva     | Small Forward  | 2007-01-28    | 2025      | 2   | Freedom High School             | 2               | sillysilva@gmail.com       | 2               | @generic_liam | smittyliam | @generic_liam |
| 4  | Leslie     | Garcia    | Power Forward  | 2008-02-15    | 2026      | 2.7 | North High School               | 3               | leslieIsABoyname@gmail.com | 3               | @tarryK       | NULL       | NULL          |
| 6  | Amadou     | Diallo    | Point Guard    | 2004-11-12    | 2023      | 3.4 | Reed Academy                    | 4               | naija1960@outlook.com      | 4               | @lezzie       | NULL       | @lezzie1      |
| 9  | Aidan      | Kone      | Power Forward  | 2006-05-03    | 2024      | 3.9 | Hope Science Preparatory School | 5               | kone_aidan323@yahoo.com    | NULL            | NULL          | NULL       | NULL          |
| 2  | Liam       | Smith     | Center         | 2005-04-10    | 2023      | 2.6 | Central College                 | 6               | d33pthree0@gmail.com       | 6               | @madyDiallo   | amadouuu   | NULL          |
| 5  | Tomas      | Müller    | Shooting Guard | 2006-06-30    | 2024      | 3.8 | Central College                 | 7               | tomasRellum@yahoo.com      | 7               | @kofiah       | NULL       | @appiahkofee  |
| 1  | Evan       | Johnson   | Point Guard    | 2007-08-21    | 2025      | 3.5 | Lakeview High School            | 8               | backcourtEJ@gmail.com      | 8               | @martySilver  | silvermrty | @martosaliva  |
| 3  | Tariq      | Niang     | Small Forward  | 2006-12-05    | 2024      | 3.6 | East High School                | 9               | tariqnn@outlook.com        | NULL            | NULL          | NULL       | NULL          |


_Aggregating all the recruit points_
~~~~sql
select sum(PPG) as 'All Recruit Points Scored'
from statistics;
~~~~
| All Recruit Points Scored |
|---------------------------|
| 250.7                     |


_Showing the teams who have someone with at least a 3.6 gpa_
~~~~sql
select distinct p.team_name
from person p
join eligibility e on e.grad_year = p.grad_year and e.gpa = p.gpa
where (e.grad_year, e.gpa) in (
  select grad_year, max(gpa)
  from eligibility
  group by grad_year
  having gpa > 3.6
);
~~~~
| team_name                       |
|---------------------------------|
| Liberty High School             |
| Hope Science Preparatory School |


_Giving the teams who don't have a point guard, or shooting guard in the database_
~~~~sql
SELECT team_name
FROM teams
WHERE NOT EXISTS (
    SELECT *
    FROM person
    WHERE person.team_name = teams.team_name
      AND person.position like '%Guard%'
);
~~~~
| team_name                       |
|---------------------------------|
| East High School                |
| Freedom High School             |
| Hope Science Preparatory School |
| Liberty High School             |
| North High School               |


_Shows the teams that don't have a player in the database born after 2005_
~~~~sql
select team_name, count(*) as 'Players'
from person
where date_of_birth between '2004-01-01' AND '2005-12-31'
  and team_name in (
    select team_name
    from teams
  )
group by team_name;
~~~~
| team_name           |
|---------------------|
| Central College     |
| Liberty High School |
| Reed Academy        |
| Unity Academy       |


