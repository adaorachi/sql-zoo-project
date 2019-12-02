#More JOIN operations

#1
SELECT id, title
 FROM movie
 WHERE yr=1962

#2
SELECT yr FROM movie
WHERE title = 'Citizen Kane'

#3
SELECT id,title,yr FROM movie
WHERE title LIKE('%Star Trek%')
ORDER BY yr

#4
SELECT id FROM actor WHERE name = 'Glenn Close'

#5
SELECT id FROM movie WHERE title = 'Casablanca'

#6
SELECT name FROM actor
JOIN casting ON actor.id = actorid
JOIN movie ON movieid=movie.id
WHERE movieid = 11768

#7
SELECT name FROM actor
JOIN casting ON actor.id = actorid
JOIN movie ON movieid=movie.id
WHERE title = 'Alien'

#8
SELECT title FROM movie
JOIN casting ON movie.id = movieid
JOIN actor ON actorid=actor.id
WHERE name = 'Harrison Ford'

#9
SELECT title FROM movie
JOIN casting ON movie.id = movieid
JOIN actor ON actorid=actor.id
WHERE name = 'Harrison Ford' AND NOT ord =  1

#10
SELECT title, name FROM movie
JOIN casting ON movie.id = movieid
JOIN actor ON actorid=actor.id
WHERE ord = 1 AND yr = 1962

#11
SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
         JOIN actor   ON actorid=actor.id
where name='John Travolta'
GROUP BY yr
HAVING COUNT(title)=(SELECT MAX(c) FROM
(SELECT yr,COUNT(title) AS c FROM
   movie JOIN casting ON movie.id=movieid
         JOIN actor   ON actorid=actor.id
 where name='John Travolta'
 GROUP BY yr) AS t
)

#12
SELECT title, name FROM movie 
JOIN casting x ON movie.id = movieid
JOIN actor ON actor.id =actorid
WHERE ord=1 AND movieid IN
(SELECT movieid FROM casting y
JOIN actor ON actor.id=actorid
WHERE name='Julie Andrews')

#13
SELECT name FROM actor
JOIN casting ON actorid=actor.id
WHERE ord=1
GROUP BY name
HAVING COUNT(ord)>=30

#14
SELECT title, COUNT(actorid) FROM movie
JOIN casting ON movieid=id
WHERE yr = 1978
GROUP BY title
ORDER BY COUNT(actorid) DESC, title

#15
SELECT name
FROM movie JOIN casting ON movie.id = movieid JOIN actor ON actorid = actor.id 
WHERE movieid IN (SELECT movieid FROM casting, actor
WHERE actorid=actor.id
AND name='Art Garfunkel') AND name <>'Art Garfunkel'