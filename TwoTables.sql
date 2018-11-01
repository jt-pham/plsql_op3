drop table pitem cascade constraints;
drop table pitem_audit cascade constraints;
create table pitem (item_id number, item_name char(20), item_desc char(20), retail_price number(10,2),
item_cost number(10,2), category char(10));
insert into pitem values (1, null, null, null, 10, null);
insert into pitem values (2, null, null, null, 10, null);
insert into pitem values (3, null, null, null, 10, null);
insert into pitem values (4, null, null, null, 10, null);
insert into pitem values (5, null, null, null, 10, null);
insert into pitem values (6, null, null, null, 10, null);
insert into pitem values (7, null, null, null, 10, null);
insert into pitem values (8, null, null, null, 10, null);
insert into pitem values (9, null, null, null, 10, null);
insert into pitem values (10, null, null, null, 10, null);
insert into pitem values (11, null, null, null, 10, null);
insert into pitem values (12, null, null, null, 10, null);
insert into pitem values (13, null, null, null, 10, null);
insert into pitem values (14, null, null, null, 10, null);
insert into pitem values (15, null, null, null, 10, null);
insert into pitem values (16, null, null, null, 10, null);
insert into pitem values (17, null, null, null, 10, null);
insert into pitem values (18, null, null, null, 10, null);
insert into pitem values (19, null, null, null, 10, null);
insert into pitem values (20, null, null, null, 10, null);
describe pitem
set linesize 130
set pagesize 100
select * from pitem;
create table pitem_audit (item_id number, message char(80));
describe pitem_audit
select * from pitem_audit;
COMMIT;
