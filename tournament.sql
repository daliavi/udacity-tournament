-- Table definitions for the tournament project.

select pg_terminate_backend(pid) from pg_stat_activity where datname='tournament';
DROP DATABASE  IF EXISTS  tournament;
CREATE DATABASE tournament;
\c tournament;

CREATE TABLE Players
(
  "id" SERIAL,
  "name" varchar(256) NOT NULL,
  CONSTRAINT "PKey" PRIMARY KEY ("id")
);

CREATE TABLE Matches
(
  "id" SERIAL,
  "winner_id" integer NOT NULL REFERENCES Players ON DELETE CASCADE,
  "loser_id" integer NOT NULL REFERENCES Players ON DELETE CASCADE,
  CONSTRAINT "MKey" PRIMARY KEY ("id")
);

-- a helper view to construct standings
create view games_played_view as
select players.id, count(1) as games_played
from players, matches
where (players.id = matches.winner_id) or (players.id = matches.loser_id)
group by players.id;

-- a helper view to construct standings
create view winners_view as
select winner_id as id, count(1) wins
from matches
group by winner_id;

create view standings_view as
select players.id, players.name, coalesce(wins,0) as wins, coalesce(games_played,0) as matches
from Players
left join winners_view on  winners_view.id = players.id
left join games_played_view on players.id=games_played_view.id
order by wins desc;

SELECT * from Players;
SELECT * from Matches;
SELECT * from standings_view;