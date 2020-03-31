create table ltsys.lt
(
  id_extr integer,
  id_sch integer,
  id_bilet integer,
  nr1 integer,
  nr2 integer,
  nr3 integer,
  nr4 integer,
  nr5 integer,
  nr6 integer,
  nr7 integer,
  nr8 integer,
  nr9 integer,
  nr10 integer,
  nr11 integer,
  nr12 integer
);
create index ltsys.lt_id_extr_idx on ltsys.lt(id_extr);
create index ltsys.lt_id_sch_idx on ltsys.lt(id_sch);