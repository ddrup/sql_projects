SELECT p.address, round((max(p.age) - (min(p.age::numeric)/max(p.age::numeric))),2) as formula, round(avg(p.age),2) as average,
       (max(p.age) - (min(p.age::numeric)/max(p.age::numeric))) > avg(p.age) as comparison
FROM person p
GROUP BY p.address
ORDER BY p.address;