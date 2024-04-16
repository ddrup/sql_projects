SELECT ps.name AS person_name1,  ps1.name AS person_name2, ps.address AS common_address
FROM person ps
CROSS JOIN person ps1
WHERE ps1.address = ps.address AND ps.id > ps1.id
ORDER BY person_name1, person_name2, common_address;