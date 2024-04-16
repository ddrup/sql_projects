WITH pv AS(
	SELECT person_id,visit_date
	FROM person_visits
	WHERE person_id = 1 OR person_id = 2
),
	gsr AS(
	SELECT gs.series_date::date AS missing_date
	FROM generate_series('2022-01-01'::date, '2022-01-10'::date, '1 day'::interval) AS gs(series_date)
)

SELECT gsr.missing_date AS missing_date
FROM gsr
LEFT OUTER JOIN pv ON pv.visit_date = gsr.missing_date
WHERE person_id IS NULL
ORDER BY missing_date;