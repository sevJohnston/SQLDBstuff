drop table delivery_service cascade constraints;
drop table package cascade constraints;

create table delivery_service
(delivery_service_id    number  Primary key,
delivery_service_name   varchar2(50) not null);

create table package
(package_id           number  PRIMARY KEY,
package_desc        varchar2(25) not null,
date_delivered      date not null,
fk_delivery_service_id      number);

alter table package 
add constraint fk_delivery_service
foreign key (fk_delivery_service_id)
references delivery_service (delivery_service_id);

insert into delivery_service (delivery_service_id, delivery_service_name)
values (12345, 'Untied Parcel Service');

insert into delivery_service (delivery_service_id, delivery_service_name)
values (23456,'Federal Excess');

insert into package 
(package_id, package_desc, date_delivered, fk_delivery_service_id)
values (987,'Perfect Diamonds','14-Jun-2019',23456);

insert into package 
(package_id, package_desc, date_delivered, fk_delivery_service_id)
values (765, 'Care Package','29-Apr-2019',12345);

insert into package 
(package_id, package_desc, date_delivered, fk_delivery_service_id)
values (876, 'French Winos','19-Jul-2019',NULL);

select * from delivery_service;
select * from package;

select package_desc, date_delivered, delivery_service_name
from package
join delivery_service
on package.FK_DELIVERY_SERVICE_ID=delivery_service.DELIVERY_SERVICE_ID;



select DELIVERY_SERVICE_NAME,PACKAGE_DESC, DATE_DELIVERED
FROM DELIVERY_SERVICE
RIGHT JOIN PACKAGE
ON DELIVERY_SERVICE.DELIVERY_SERVICE_ID=PACKAGE.FK_DELIVERY_SERVICE_ID
ORDER BY DELIVERY_SERVICE_NAME ASC;

SELECT PACKAGE_DESC, DATE_DELIVERED, DELIVERY_SERVICE_NAME
FROM PACKAGE
FULL OUTER JOIN DELIVERY_SERVICE
ON PACKAGE.FK_DELIVERY_SERVICE_ID=DELIVERY_SERVICE.DELIVERY_SERVICE_ID
ORDER BY PACKAGE_DESC DESC;