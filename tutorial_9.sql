#1
SELECT response FROM nss
WHERE A_STRONGLY_AGREE LIMIT 1

#2
SELECT institution, subject FROM nss
WHERE question='Q15' AND score >= 100

#3
SELECT institution,score FROM nss
WHERE question='Q15' AND subject = '(8) Computer Science' AND score < 50

#4
SELECT subject,SUM(response) FROM nss
WHERE question='Q22' AND (subject='(8) Computer Science' OR subject='(H) Creative Arts and Design')
GROUP BY subject
#5
SELECT subject,SUM(response*A_STRONGLY_AGREE/100) FROM nss
WHERE question='Q22' AND (subject= '(8) Computer Science' OR subject= '(H) Creative Arts and Design')
GROUP BY subject

#6
SELECT subject, ROUND(SUM(response*A_STRONGLY_AGREE)/SUM(response),0) FROM nss
WHERE question='Q22' AND (subject = '(8) Computer Science' OR subject = '(H) Creative Arts and Design')
GROUP BY subject

#7
SELECT institution, ROUND(SUM(response*score)/SUM(response),0)
  FROM nss
 WHERE question='Q22'
   AND (institution LIKE '%Manchester%')
GROUP BY institution
ORDER BY institution

#8
SELECT institution, SUM(sample), SUM(CASE WHEN subject LIKE '(8)%' THEN sample END)  FROM nss
 WHERE question='Q22'
   AND (institution LIKE '%Manchester%')
GROUP BY institution