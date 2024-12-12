
DROP TABLE IF EXISTS marks;



CREATE TABLE marks (
    ID SERIAL PRIMARY KEY,
    score INTEGER
);


INSERT INTO marks (score) VALUES (35), (55), (65), (85), (95);


SELECT * FROM marks;


-- a. Display the grade for each student based on the marks relation.

SELECT 
    ID,
    score,
    CASE
        WHEN score < 40 THEN 'F'
        WHEN score >= 40 AND score < 60 THEN 'C'
        WHEN score >= 60 AND score < 80 THEN 'B'
        WHEN score >= 80 THEN 'A'
    END AS grade
FROM marks;


-- b. Find the number of students with each grade.


SELECT 
    CASE
        WHEN score < 40 THEN 'F'
        WHEN score >= 40 AND score < 60 THEN 'C'
        WHEN score >= 60 AND score < 80 THEN 'B'
        WHEN score >= 80 THEN 'A'
    END AS grade,
    COUNT(*) AS student_count
FROM marks
GROUP BY 
    CASE
        WHEN score < 40 THEN 'F'
        WHEN score >= 40 AND score < 60 THEN 'C'
        WHEN score >= 60 AND score < 80 THEN 'B'
        WHEN score >= 80 THEN 'A'
    END
ORDER BY grade;