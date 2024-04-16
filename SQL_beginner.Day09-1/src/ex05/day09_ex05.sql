DROP FUNCTION fnc_persons_male();
DROP FUNCTION fnc_persons_female();

CREATE FUNCTION fnc_persons(pgender varchar default 'female') RETURNS SETOF person AS
$$
    SELECT * FROM person
        WHERE CASE
            WHEN pgender = 'male' THEN gender = 'male'
            WHEN pgender = 'female' THEN gender = 'female'
        END;
$$ LANGUAGE sql;

select *
from fnc_persons(pgender := 'male');

select *
from fnc_persons();