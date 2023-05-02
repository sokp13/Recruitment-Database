--select * from player
delete from socials;
--TEAMS
insert into teams(team_name, coach_name, city, state, country)
values  ('Lakeview High School', 'Torii Weatherspoon', 'Chicago','Illinois','USA'),
        ('East High School', 'Kevin Griese', 'Myrtle Beach','South Carolina','USA'),
        ('North High School', 'Geno Davis', 'Cedar Rapids','Iowa','USA'),
        ('Reed Academy', 'Daniel Lee', 'Worcester','Massachusetts','USA'),
        ('Freedom High School', 'William Davis', 'Bozeman','Montana','USA'),
        ('Liberty High School', 'Matthew Wong', 'Libertyville','Illinois','USA'),
        ('Hope Science Preparatory School', 'Andrew Johnson', 'Kansas City','Missouri','USA'),
        ('Central College', 'Benjamin Kim', 'Regina','Saskatchewan','CAN'),
        ('Unity Academy', 'Jamal Thompson', 'Brampton','Ontario','CAN');

--PERSON
insert into person(ID, first_name, last_name, position, date_of_birth, grad_year, gpa, team_name)
values  (1, 'Evan', 'Johnson', 'Point Guard', '2007-08-21', 2025, 3.5, 'Lakeview High School'),
        (2, 'Liam', 'Smith', 'Center', '2005-04-10', 2023, 2.6, 'Central College'),
        (3, 'Tariq', 'Niang', 'Small Forward', '2006-12-05', 2024, 3.6, 'East High School'),
        (4, 'Leslie', 'Garcia', 'Power Forward', '2008-02-15', 2026, 2.7, 'North High School'),
        (5, 'Tomas', 'Müller', 'Shooting Guard', '2006-06-30', 2024, 3.8, 'Central College'),               -- canadian school
        (6, 'Amadou', 'Diallo', 'Point Guard', '2004-11-12', 2023, 3.4, 'Reed Academy'),       -- postgrad
        (7, 'Kofi', 'Appiah', 'Center', '2005-08-17', 2023, 3.7, 'Liberty High School'),
        (8, 'Martin', 'Silva', 'Small Forward', '2007-01-28', 2025, 2.0, 'Freedom High School'),
        (9, 'Aidan', 'Kone', 'Power Forward', '2006-05-03', 2024, 3.9, 'Hope Science Preparatory School'),
        (10, 'Omar', 'Said', 'Shooting Guard', '2004-09-11', 2023, 3.2, 'Unity Academy');                   -- postgrad

--GENERAL
insert into general(date_of_birth, hometown, nationality)
values  ('2004-11-12','Fitchburg, Massachusetts','Nigerian'),
        ('2006-12-05','Toronto, Ontario','Canadian'),
        ('2005-04-10','Kansas City, Missouri','American'),
        ('2006-05-03','Chicago, Illinois','American'),
        ('2007-01-28','Lansing, Michigan','American'),
        ('2006-06-30','Leipzig, Saxony','German'),
        ('2004-09-11','London, Greater London','United Kingdom'),
        ('2008-02-15','Cali, Cauca Valley','Colombian'),
        ('2005-08-17','San-Paedro, Bas-Sassandra','Ivory Coast'),
        ('2007-08-21','Saskatoon, Saskatchewan','Canadian');

--BODY
insert into body(ID, height, weight, wingspan, vertical_leap)
values  (10, 75, 195, 80.1, 42.2),
        (1, 74, 190, 78.4, 40.5),
        (6, 78, 205, 79.3, 41.1),
        (5, 73, 185, 77.8, 39.1),
        (4, 81, 230, 85.3, 42.2),
        (3, 82, 225, 84.1, 40.3),
        (9, 80, 220, 86.0, 39.2),
        (8, 83, 240, 83.1, 41.4),
        (7, 84, 260, 90.0, 37.9),
        (2, 86, 275, 89.4, 35.1);

--ELIGIBILITY
insert into eligibility(grad_year, gpa, is_postgraduate)
values  (2023, 3.2, 'yes'),
        (2024, 3.9, 'no'),
        (2025, 2.0, 'no'),
        (2023, 3.7, 'no'),
        (2023, 3.4, 'yes'),
        (2026, 2.7, 'no'),
        (2024, 3.8, 'no'),
        (2024, 3.6, 'no'),
        (2023, 2.6, 'no'),
        (2025, 3.5, 'no');

--STATS
insert into statistics(ID, PPG, APG, RPG, BPG, SPG, field_goal_pct, three_point_pct, free_throw_pct)
values  (7, 22.3, 02.5, 13.3, 02.8, 00.9, 75.7, 27.9, 67.0),
        (2, 21.5, 05.2, 18.6, 04.1, 01.2, 65.4, 40.7, 75.3),
        (3, 27.3, 05.2, 08.9, 01.3, 01.7, 51.9, 38.2, 71.3),
        (4, 25.8, 04.3, 12.1, 02.0, 01.5, 55.7, 32.3, 66.6),
        (8, 28.6, 06.4, 07.8, 00.8, 02.2, 51.0, 39.4, 80.0),
        (10, 20.3, 02.0, 04.3, 00.1, 00.4, 46.3, 55.9, 97.1),
        (5, 24.5, 08.7, 05.3, 00.0, 02.1, 49.8, 42.5, 89.2),
        (9, 27.8, 06.2, 04.9, 00.2, 01.7, 51.3, 46.7, 92.4),
        (6, 17.2, 07.1, 08.9, 01.7, 05.9, 50.1, 27.6, 65.5),
        (1, 35.4, 13.3, 07.8, 01.4, 01.8, 46.4, 43.3, 89.5);

--RECRUITMENT        
insert into recruitment(first_name, last_name, school, date_of_visit, official, offered)
values  ('Liam', 'Smith', 'Marist', '10/19/2022', true, true),
        ('Evan', 'Johnson', 'Miami', '9/1/2022', true, true),
        ('Evan', 'Johnson', 'Kansas State', '8/30/2022', false, true),
        ('Evan', 'Johnson', 'Duke', '6/3/2022', true, false),
        ('Martin', 'Silva', 'Wichita State', '1/3/2023', true, true),
        ('Aidan', 'Kone', 'Texas Tech', '4/12/2023', false, true);

--CONTACTS
insert into contact(ID, email)
values  (10, 'osaid@gmail.com'),
        (8, 'sillysilva@gmail.com'),
        (4, 'leslieIsABoyname@gmail.com'),
        (6, 'naija1960@outlook.com'),
        (9, 'kone_aidan323@yahoo.com'),
        (2, 'd33pthree0@gmail.com'),
        (5, 'tomasRellum@yahoo.com'),
        (1, 'backcourtEJ@gmail.com'),
        (3, 'tariqnn@outlook.com'),
        (7, 'kappiah@gmail.com');

--PHONE NUMBERS
insert into numbers(contact_id, phone_number)
values  (10, '(905) 557-1234'),
        (8, '(248) 325-5678'),
        (4, '(319) 555-1234'),
        (6, '(978) 190-6789'),
        (9, '(773) 555-3456'),
        (2, '(306) 441-4321'),
        (5, '(306) 555-9876'),
        (1, '(312) 829-5678'),
        (3, '(843) 555-8765'),
        (7, '(847) 102-2345');

--SOCIALS
insert into socials(social_media_id, Snapchat, Instagram, Twitter)
values  (4, '@lezzie', NULL, '@lezzie1'),
        (2, '@generic_liam', 'smittyliam', '@generic_liam'),
        (6, '@madyDiallo', 'amadouuu', NULL),
        (1, '@EJEJ27', NULL, NULL),
        (10, NULL, 'omarsaidyo', '@osaidwhat'),
        (8, '@martySilver', 'silvermrty', '@martosaliva'),
        (3, '@tarryK', NULL, NULL),
        (7, '@kofiah', NULL, '@appiahkofee');


