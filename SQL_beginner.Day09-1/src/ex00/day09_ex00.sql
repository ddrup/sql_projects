CREATE TABLE person_audit(
    created timestamp with time zone default current_timestamp not null,
    type_event char(1) default 'I' not null,
    row_id bigint not null,
    name varchar,
    age integer,
    gender varchar,
    address varchar
    constraint ch_type_event check ( type_event in ('I','D','U') )
);

CREATE OR REPLACE FUNCTION fnc_trg_person_insert_audit()
    RETURNS trigger AS
$$
BEGIN
    INSERT INTO person_audit (type_event,row_id,name,age,gender,address)
    VALUES ('I',NEW.id,NEW.name,NEW.age,NEW.gender,NEW.address);
    RETURN NEW;
END;
$$ LANGUAGE 'plpgsql';

CREATE TRIGGER trg_person_insert_audit
    AFTER INSERT
    ON person
    FOR EACH ROW
    EXECUTE PROCEDURE fnc_trg_person_insert_audit();
INSERT INTO person(id, name, age, gender, address) VALUES (10,'Damir', 22, 'male', 'Irkutsk');