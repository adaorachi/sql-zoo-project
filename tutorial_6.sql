#The JOIN operation

#1
SELECT matchid, player FROM goal 
WHERE teamid LIKE 'GER'

#2
SELECT id,stadium,team1,team2 FROM game
WHERE id = 1012;

#3
SELECT player,teamid,stadium,mdate
FROM game JOIN goal ON (id=matchid)
WHERE teamid = 'GER'

#4
SELECT team1,team2,player FROM game JOIN goal ON (id=matchid)
WHERE player LIKE 'Mario%';

#5
SELECT player, teamid, coach, gtime
FROM goal JOIN eteam on teamid=id
WHERE gtime<=10

#6
SELECT mdate, teamname FROM game JOIN eteam ON (team1=eteam.id)
WHERE coach = 'Fernando Santos'

#7
SELECT player FROM goal JOIN game ON matchid=id
WHERE stadium = 'National Stadium, Warsaw'

#8
SELECT DISTINCT player
FROM game JOIN goal ON matchid = id 
WHERE teamid!='GER' AND (team1='GER' OR team2='GER')

#9
SELECT teamname, COUNT(*)
FROM eteam JOIN goal ON id=teamid
GROUP BY teamname
ORDER BY Count(*) DESC

#10
SELECT stadium, COUNT(player)
FROM game JOIN goal ON (id=matchid)
GROUP BY stadium
ORDER BY COUNT(player) DESC

#11
SELECT matchid, mdate, COUNT(player)
FROM game JOIN goal ON matchid = id AND (team1 = 'POL' OR team2 = 'POL')
GROUP BY matchid, mdate
ORDER BY COUNT(player) DESC

#12
SELECT matchid, mdate, COUNT(player)
FROM game JOIN goal ON matchid = id AND (team1 = 'GER' OR team2 = 'GER') AND teamid='GER'
GROUP BY matchid, mdate
ORDER BY COUNT(player) DESC

#13
SELECT mdate,
team1,
SUM(CASE WHEN teamid = team1 THEN 1 ELSE 0 END) AS goals1,
team2,
SUM(CASE WHEN teamid = team2 THEN 1 ELSE 0 END) AS goals2
FROM game LEFT JOIN goal ON (id = matchid)
GROUP BY mdate,team1, team2
ORDER BY mdate, matchid, team1, team2