SELECT CONCAT(name,'(age:',age,',gender:''',gender::varchar,''',address:''',address::varchar,''')') AS person_information FROM person
ORDER BY person_information;