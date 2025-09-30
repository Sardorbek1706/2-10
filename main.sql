CREATE TABLE football_clubs (
    club_id SERIAL PRIMARY KEY,
    club_name VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    country VARCHAR(100) NOT NULL,
    founded_year INT
);
INSERT INTO football_clubs (club_name, city, country, founded_year) VALUES
('Real Madrid', 'Madrid', 'Spain', 1902),
('Barcelona', 'Barcelona', 'Spain', 1899),
('Manchester United', 'Manchester', 'England', 1878),
('Bayern Munich', 'Munich', 'Germany', 1900);
CREATE TABLE tournaments (
    tournament_id SERIAL PRIMARY KEY,
    tournament_name VARCHAR(100) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status VARCHAR(20)
);
INSERT INTO tournaments (tournament_name, start_date, end_date, status) VALUES
('UEFA Champions League', '2025-09-01', '2026-05-20', 'Ongoing'),
('Europa League', '2025-09-10', '2026-05-25', 'Upcoming');
CREATE TABLE tournament_groups (
    group_id SERIAL PRIMARY KEY,
    group_name VARCHAR(100) NOT NULL,
    tournament_id INT REFERENCES tournaments(tournament_id) ON DELETE CASCADE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO tournament_groups (group_name, tournament_id) VALUES
('Group A', 1),
('Group B', 1),
('Group C', 2);
CREATE TABLE teams (
    team_id SERIAL PRIMARY KEY,
    team_name VARCHAR(100) NOT NULL,
    club_id INT REFERENCES football_clubs(club_id) ON DELETE CASCADE,
    group_id INT REFERENCES tournament_groups(group_id) ON DELETE SET NULL,
    coach_name VARCHAR(100)
);
INSERT INTO teams (team_name, club_id, group_id, coach_name) VALUES
('Real Madrid First Team', 1, 1, 'Carlo Ancelotti'),
('Barcelona First Team', 2, 1, 'Xavi Hernandez'),
('Manchester United First Team', 3, 2, 'Erik ten Hag'),
('Bayern Munich First Team', 4, 2, 'Thomas Tuchel');

CREATE TABLE players (
    player_id SERIAL PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    position VARCHAR(50) NOT NULL,
    team_id INT REFERENCES teams(team_id) ON DELETE CASCADE,
    jersey_number INT
);
INSERT INTO players (full_name, date_of_birth, position, team_id, jersey_number) VALUES
('Karim Benzema', '1987-12-19', 'Forward', 1, 9),
('Luka Modric', '1985-09-09', 'Midfielder', 1, 10),
('Lionel Messi', '1987-06-24', 'Forward', 2, 10),
('Pedri Gonzalez', '2002-11-25', 'Midfielder', 2, 8),
('Marcus Rashford', '1997-10-31', 'Forward', 3, 10),
('Bruno Fernandes', '1994-09-08', 'Midfielder', 3, 8),
('Thomas Muller', '1989-09-13', 'Forward', 4, 25),
('Joshua Kimmich', '1995-02-08', 'Midfielder', 4, 6);
CREATE TABLE match_fixtures (
    match_id SERIAL PRIMARY KEY,
    match_date TIMESTAMP NOT NULL,
    venue VARCHAR(100),
    home_team_id INT REFERENCES teams(team_id) ON DELETE CASCADE,
    away_team_id INT REFERENCES teams(team_id) ON DELETE CASCADE,
    home_score INT,
    away_score INT,
    tournament_id INT REFERENCES tournaments(tournament_id) ON DELETE CASCADE,
    match_status VARCHAR(20)
);
INSERT INTO match_fixtures (match_date, venue, home_team_id, away_team_id, home_score, away_score, tournament_id, match_status) VALUES
('2025-09-15 20:00:00', 'Santiago Bernabeu', 1, 2, 2, 1, 1, 'Finished'),
('2025-09-16 21:00:00', 'Old Trafford', 3, 4, 1, 3, 1, 'Finished'),
('2025-10-01 20:00:00', 'Camp Nou', 2, 3, NULL, NULL, 1, 'Scheduled');
