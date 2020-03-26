create or replace force view ltsys.lt_v as
select id_extr,
       id_sch,
       id_bilet,
       nr1,
       nr2,
       nr3,
       nr4,
       nr5,
       nr6
  from lt
 where id_bilet is not null;