CREATE UNIQUE INDEX idx_person_discounts_unique on person_discounts(person_id,pizzeria_id);
set enable_seqscan to off;
explain analyse
SELECT * FROM person_discounts
WHERE person_id IN (1,2,3);