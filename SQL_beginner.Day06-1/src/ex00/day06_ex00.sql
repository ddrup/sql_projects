CREATE TABLE person_discounts (
    id bigint primary key ,
    pizzeria_id bigint,
    person_id bigint,
    discount numeric,
    constraint fk_person_discounts_pizzeria_id foreign key (pizzeria_id) references pizzeria(id),
    constraint fk_person_discounts_person_id foreign key (person_id) references person(id)
)