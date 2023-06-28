
create table person (
Id Int primary Key,
First_name Varchar(55) not null,
Last_name Varchar(100) not null
);

create table address (
addressId Int ,
id Int, 
Foreign Key (addressId) References address_info(addressId),
Foreign Key (id) References person(Id)	
);

create table address_info (
 addressId Int Primary Key,
 Street_number Int null,
 Street_name varchar(255) null,
 city varchar(255) null,
 state varchar(255) null,
 zipcode Int null
);
Insert Into person (Id, First_name, Last_name) Values 
(1, 'Abel', 'Melese'),
(2, 'john', 'smith'),
(3, 'David', 'Doe');

Insert Into address_info (addressId,Street_number,Street_name, city,state, zipcode ) Values 
(145, '4525', 'Chestnut st','Bethesda','Maryland','54566'),
(654, '5426', 'Pearl st','Bethesda','Maryland','75412'),
(786, '5464', 'Fenton St','silver spring','Maryland','65412');

Insert Into address (addressId,Id) Values 
(145,1 ),
(654, 2),
(786, 3);

SELECT
    p.Id AS person_id,
    p.First_name,
    p.Last_name,
    ai.Street_number,
    ai.Street_name,
    ai.City,
    ai.State,
    ai.zipcode
FROM
    person p
LEFT JOIN
    address a ON p.Id = a.id
LEFT JOIN
    address_info ai ON a.addressId = ai.addressId
ORDER BY
    ai.Street_number;



