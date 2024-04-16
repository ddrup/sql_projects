CREATE INDEX idx_person_name
ON person(upper(name));
SET ENABLE_SEQSCAN TO OFF;
EXPLAIN ANALYZE
SELECT *
FROM person
WHERE upper(name) = 'ANDREY';