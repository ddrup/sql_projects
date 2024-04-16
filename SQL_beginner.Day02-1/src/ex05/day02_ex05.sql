WITH female AS(
	SELECT name
	FROM person
	WHERE gender = 'female' AND age > 25
)

SELECT name
FROM female
ORDER BY name;