CREATE SEQUENCE seq_person_discounts;
select setval('seq_person_discounts',(select count(*) from person_discounts));
alter table person_discounts alter column id set default nextval('seq_person_discounts');