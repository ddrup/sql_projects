CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date(pperson varchar default 'Dmitriy',pprice numeric default 500, pdate date default '2022-01-08')
RETURNS TABLE (name varchar) AS
$$
BEGIN
    return QUERY (SELECT pi.name FROM pizzeria pi
                        INNER JOIN public.menu m on pi.id = m.pizzeria_id
                        INNER JOIN public.person_visits pv on pi.id = pv.pizzeria_id
                        INNER JOIN public.person p on pv.person_id = p.id
                        WHERE p.name = pperson and m.price < pprice and pdate = pv.visit_date
                 );
END;
$$ LANGUAGE 'plpgsql';

select *
from fnc_person_visits_and_eats_on_date(pprice := 800);

select *
from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');
