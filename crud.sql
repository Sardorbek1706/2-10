INSERT INTO football_clubs (club_name, city, country, founded_year)
VALUES ('Arsenal', 'London', 'England', 1886);
SELECT * FROM football_clubs;
SELECT * FROM football_clubs WHERE club_id = 1;
UPDATE football_clubs
SET city = 'Madrid (Spain)'
WHERE club_id = 1;
DELETE FROM football_clubs WHERE club_id = 5;
INSERT INTO tournaments (tournament_name, start_date, end_date, status)
VALUES ('Conference League', '2025-09-20', '2026-05-15', 'Upcoming');
SELECT * FROM tournaments;
UPDATE tournaments
SET status = 'Finished'
WHERE tournament_id = 1;
DELETE FROM tournaments WHERE tournament_id = 3;
INSERT INTO tournament_groups (group_name, tournament_id)
VALUES ('Group D', 1);
SELECT * FROM tournament_groups;
UPDATE tournament_groups
SET group_name = 'Group A1'
WHERE group_id = 1;
DELETE FROM tournament_groups WHERE group_id = 4;
INSERT INTO teams (team_name, club_id, group_id, coach_name)
VALUES ('Arsenal First Team', 5, 3, 'Mikel Arteta');
SELECT t.team_id, t.team_name, f.club_name, tg.group_name, t.coach_name
FROM teams t
JOIN football_clubs f ON t.club_id = f.club_id
LEFT JOIN tournament_groups tg ON t.group_id = tg.group_id;
UPDATE teams
SET coach_name = 'Zinedine Zidane'
WHERE team_id = 1;
DELETE FROM teams WHERE team_id = 5;
INSERT INTO players (full_name, date_of_birth, position, team_id, jersey_number)
VALUES ('Jude Bellingham', '2003-06-29', 'Midfielder', 1, 5);
SELECT p.full_name, p.position, t.team_name
FROM players p
JOIN teams t ON p.team_id = t.team_id;
UPDATE players
SET jersey_number = 7
WHERE player_id = 9;
DELETE FROM players WHERE player_id = 8;
INSERT INTO match_fixtures (match_date, venue, home_team_id, away_team_id, home_score, away_score, tournament_id, match_status)
VALUES ('2025-11-01 21:00:00', 'Emirates Stadium', 5, 1, NULL, NULL, 1, 'Scheduled');
SELECT m.match_id, m.match_date, m.venue, 
       ht.team_name AS home_team, 
       at.team_name AS away_team, 
       m.home_score, m.away_score, 
       m.match_status
FROM match_fixtures m
JOIN teams ht ON m.home_team_id = ht.team_id
JOIN teams at ON m.away_team_id = at.team_id;
UPDATE match_fixtures
SET home_score = 3, away_score = 2, match_status = 'Finished'
WHERE match_id = 3;
DELETE FROM match_fixtures WHERE match_id = 4;
