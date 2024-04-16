SELECT gs.series_date::date AS missing_date
FROM generate_series('2022-01-01'::date, '2022-01-10'::date, '1 day'::interval) AS gs(series_date)
LEFT OUTER JOIN (
				SELECT person_id,visit_date
				FROM person_visits
				WHERE person_id = 1 OR person_id = 2
			) AS pv ON pv.visit_date = gs.series_date
WHERE person_id IS NULL
ORDER BY missing_date;