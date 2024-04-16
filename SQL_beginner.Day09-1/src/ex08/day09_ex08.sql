CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop INT default 10)
RETURNS TABLE (number INT) AS
$$
DECLARE
    f1 INT := 1;
    f2 INT := 1;
    next_value INT := 1;
BEGIN
    IF(pstop >= f1) THEN
        number := f1;
        return next;
    END IF;
    while f2 < pstop loop
        number := f2;
        return NEXT;
        next_value := f1 + f2;
        f1 := f2;
        f2 := next_value;
    end loop;
    return;
END;
$$ LANGUAGE 'plpgsql';

select * from fnc_fibonacci(100);
select * from fnc_fibonacci();