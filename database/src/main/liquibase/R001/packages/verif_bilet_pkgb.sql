CREATE OR REPLACE PACKAGE BODY LTSYS.VERIF_BILET_PKG AS 

PROCEDURE VERIF_BILET_3_NR_CASTIGATOARE
  (
    p_nr_bilete integer,
    p_id_extr integer
  ) IS

  v_sch_row ltsys.sch%rowtype;
  v_id_extr integer;
  v_id_bilet integer;
  type lt_v_r is record
  (
     nr1 integer,
     nr2 integer,
     nr3 integer,
     nr4 integer,
     nr5 integer,
     nr6 integer
  );
  v_tmp_lt_r lt_v_r;
  v_nr_extras integer;
  v_nr_castig integer := 0;
  e_err exception;
begin
  begin
    select b.*
      into v_sch_row
      from lt a,
           sch b
     where a.id_extr = p_id_extr
       and a.id_sch = b.id_sch
	   and a.id_bilet is null
       and b.cod like '3%';
  exception
    when no_data_found then
	  raise e_err;
  end;
  dbms_output.put_line('sistem: ' || v_sch_row.denumire);
  dbms_output.put_line('bilete verificate: ' || p_nr_bilete);
  select nvl(max(t.id_extr),0) + 1 into v_id_extr from lt t;
  v_tmp_lt_r := null;
  for i in 1 .. p_nr_bilete loop
    --nr1
    v_nr_extras := trunc(DBMS_RANDOM.VALUE(1, 49));
    v_tmp_lt_r.nr1 := v_nr_extras;
    --nr2
    loop
      v_nr_extras := trunc(DBMS_RANDOM.VALUE(1, 49));
      exit when v_nr_extras != v_tmp_lt_r.nr1;
    end loop;
    v_tmp_lt_r.nr2 := v_nr_extras;
    --nr3
    loop
      v_nr_extras := trunc(DBMS_RANDOM.VALUE(1, 49));
      exit when v_nr_extras != v_tmp_lt_r.nr1 and v_nr_extras != v_tmp_lt_r.nr2;
    end loop;
    v_tmp_lt_r.nr3 := v_nr_extras;
    --nr4
    loop
      v_nr_extras := trunc(DBMS_RANDOM.VALUE(1, 49));
      exit when v_nr_extras != v_tmp_lt_r.nr1 and v_nr_extras != v_tmp_lt_r.nr2 and v_nr_extras != v_tmp_lt_r.nr3;
    end loop;
    v_tmp_lt_r.nr4 := v_nr_extras;
    --nr5
    loop
      v_nr_extras := trunc(DBMS_RANDOM.VALUE(1, 49));
      exit when v_nr_extras != v_tmp_lt_r.nr1 and v_nr_extras != v_tmp_lt_r.nr2 and v_nr_extras != v_tmp_lt_r.nr3
                                              and v_nr_extras != v_tmp_lt_r.nr4;
    end loop;
    v_tmp_lt_r.nr5 := v_nr_extras;
    --nr6
    loop
      v_nr_extras := trunc(DBMS_RANDOM.VALUE(1, 49));
      exit when v_nr_extras != v_tmp_lt_r.nr1 and v_nr_extras != v_tmp_lt_r.nr2 and v_nr_extras != v_tmp_lt_r.nr3
                                              and v_nr_extras != v_tmp_lt_r.nr4 and v_nr_extras != v_tmp_lt_r.nr5;
    end loop;
    v_tmp_lt_r.nr6 := v_nr_extras;
    --insert lt_v
    insert into lt_v
      (
        id_extr,
        id_bilet,
        nr1,
        nr2,
        nr3,
        nr4,
        nr5,
        nr6
      )
    values
      (
        v_id_extr,
        i,
        v_tmp_lt_r.nr1,
        v_tmp_lt_r.nr2,
        v_tmp_lt_r.nr3,
        v_tmp_lt_r.nr4,
        v_tmp_lt_r.nr5,
        v_tmp_lt_r.nr6
      );
  end loop;
  for x in (select * from lt_v t where t.id_extr = v_id_extr order by t.id_bilet) loop
  for y in (select * from lt_v t where t.id_extr = p_id_extr order by t.id_bilet) loop
    begin
      with a as (
        select t.nr1 as nr from lt_v t where t.id_extr = y.id_extr and t.id_bilet = y.id_bilet
        union all
        select t.nr2 as nr from lt_v t where t.id_extr = y.id_extr and t.id_bilet = y.id_bilet
        union all
        select t.nr3 as nr from lt_v t where t.id_extr = y.id_extr and t.id_bilet = y.id_bilet
        union all
        select t.nr4 as nr from lt_v t where t.id_extr = y.id_extr and t.id_bilet = y.id_bilet
        union all
        select t.nr5 as nr from lt_v t where t.id_extr = y.id_extr and t.id_bilet = y.id_bilet
        union all
        select t.nr6 as nr from lt_v t where t.id_extr = y.id_extr and t.id_bilet = y.id_bilet)
      select t.id_bilet into v_id_bilet
        from lt_v t
       where t.id_extr = x.id_extr
         and t.id_bilet = x.id_bilet
         and (
              (
                   t.nr1 in (select a.nr from a)
               and t.nr2 in (select a.nr from a)
               and t.nr3 in (select a.nr from a)
              ) or
              (
                   t.nr1 in (select a.nr from a)
               and t.nr2 in (select a.nr from a)
               and t.nr4 in (select a.nr from a)
              ) or
              (
                   t.nr1 in (select a.nr from a)
               and t.nr2 in (select a.nr from a)
               and t.nr5 in (select a.nr from a)
              ) or
              (
                   t.nr1 in (select a.nr from a)
               and t.nr2 in (select a.nr from a)
               and t.nr6 in (select a.nr from a)
              ) or
              (
                   t.nr1 in (select a.nr from a)
               and t.nr3 in (select a.nr from a)
               and t.nr4 in (select a.nr from a)
              ) or
              (
                   t.nr2 in (select a.nr from a)
               and t.nr3 in (select a.nr from a)
               and t.nr5 in (select a.nr from a)
              ) or    
              (
                   t.nr1 in (select a.nr from a)
               and t.nr3 in (select a.nr from a)
               and t.nr6 in (select a.nr from a)
              ) or  
              (
                   t.nr1 in (select a.nr from a)
               and t.nr4 in (select a.nr from a)
               and t.nr5 in (select a.nr from a)
              ) or   
              (
                   t.nr1 in (select a.nr from a)
               and t.nr4 in (select a.nr from a)
               and t.nr6 in (select a.nr from a)
              ) or
              (
                   t.nr1 in (select a.nr from a)
               and t.nr5 in (select a.nr from a)
               and t.nr6 in (select a.nr from a)
              ) or
              (
                   t.nr2 in (select a.nr from a)
               and t.nr3 in (select a.nr from a)
               and t.nr4 in (select a.nr from a)
              ) or
              (
                   t.nr2 in (select a.nr from a)
               and t.nr3 in (select a.nr from a)
               and t.nr5 in (select a.nr from a)
              ) or
              (
                   t.nr2 in (select a.nr from a)
               and t.nr3 in (select a.nr from a)
               and t.nr6 in (select a.nr from a)
              ) or
              (
                   t.nr2 in (select a.nr from a)
               and t.nr4 in (select a.nr from a)
               and t.nr5 in (select a.nr from a)
              ) or
              (
                   t.nr2 in (select a.nr from a)
               and t.nr4 in (select a.nr from a)
               and t.nr6 in (select a.nr from a)
              ) or
              (
                   t.nr2 in (select a.nr from a)
               and t.nr5 in (select a.nr from a)
               and t.nr6 in (select a.nr from a)
              ) or
              (
                   t.nr3 in (select a.nr from a)
               and t.nr4 in (select a.nr from a)
               and t.nr5 in (select a.nr from a)
              ) or
              (
                   t.nr3 in (select a.nr from a)
               and t.nr4 in (select a.nr from a)
               and t.nr6 in (select a.nr from a)
              ) or
              (
                   t.nr3 in (select a.nr from a)
               and t.nr5 in (select a.nr from a)
               and t.nr6 in (select a.nr from a)
              ) or
              (
                   t.nr4 in (select a.nr from a)
               and t.nr5 in (select a.nr from a)
               and t.nr6 in (select a.nr from a)
              )                                                     
             );
      dbms_output.put_line('bilet castigator id_extr: ' || x.id_extr || ' & id_bilet: '|| x.id_bilet ||'; bilet jucat id_extr: ' || y.id_extr || ' & id_bilet: '|| y.id_bilet);
      v_nr_castig := v_nr_castig + 1;
    exception
      when no_data_found then
        null;
    end;
  end loop;
  end loop;
  dbms_output.put_line('bilete castigatoare: ' || v_nr_castig);
  
exception
  when e_err then
    dbms_output.put_line('Extragere ' || p_id_extr || ' invalida');

END VERIF_BILET_3_NR_CASTIGATOARE;

PROCEDURE VERIF_BILET_4_NR_CASTIGATOARE
  (
    p_nr_bilete integer,
    p_id_extr integer
  ) IS
  
  v_sch_row ltsys.sch%rowtype;
  v_id_extr integer;
  v_id_bilet integer;
  type lt_v_r is record
  (
     nr1 integer,
     nr2 integer,
     nr3 integer,
     nr4 integer,
     nr5 integer,
     nr6 integer
  );
  v_tmp_lt_r lt_v_r;
  v_nr_extras integer;
  v_nr_castig integer := 0;
  e_err exception;
begin
  begin
    select b.*
      into v_sch_row
      from lt a,
           sch b
     where a.id_extr = p_id_extr
       and a.id_sch = b.id_sch
	   and a.id_bilet is null
       and b.cod like '4%';
  exception
    when no_data_found then
	  raise e_err;
  end;
  dbms_output.put_line('sistem: ' || v_sch_row.denumire);
  dbms_output.put_line('bilete verificate: ' || p_nr_bilete);
  select nvl(max(t.id_extr),0) + 1 into v_id_extr from lt t;
  v_tmp_lt_r := null;
  for i in 1 .. p_nr_bilete loop
    --nr1
    v_nr_extras := trunc(DBMS_RANDOM.VALUE(1, 49));
    v_tmp_lt_r.nr1 := v_nr_extras;
    --nr2
    loop
      v_nr_extras := trunc(DBMS_RANDOM.VALUE(1, 49));
      exit when v_nr_extras != v_tmp_lt_r.nr1;
    end loop;
    v_tmp_lt_r.nr2 := v_nr_extras;
    --nr3
    loop
      v_nr_extras := trunc(DBMS_RANDOM.VALUE(1, 49));
      exit when v_nr_extras != v_tmp_lt_r.nr1 and v_nr_extras != v_tmp_lt_r.nr2;
    end loop;
    v_tmp_lt_r.nr3 := v_nr_extras;
    --nr4
    loop
      v_nr_extras := trunc(DBMS_RANDOM.VALUE(1, 49));
      exit when v_nr_extras != v_tmp_lt_r.nr1 and v_nr_extras != v_tmp_lt_r.nr2 and v_nr_extras != v_tmp_lt_r.nr3;
    end loop;
    v_tmp_lt_r.nr4 := v_nr_extras;
    --nr5
    loop
      v_nr_extras := trunc(DBMS_RANDOM.VALUE(1, 49));
      exit when v_nr_extras != v_tmp_lt_r.nr1 and v_nr_extras != v_tmp_lt_r.nr2 and v_nr_extras != v_tmp_lt_r.nr3
                                              and v_nr_extras != v_tmp_lt_r.nr4;
    end loop;
    v_tmp_lt_r.nr5 := v_nr_extras;
    --nr6
    loop
      v_nr_extras := trunc(DBMS_RANDOM.VALUE(1, 49));
      exit when v_nr_extras != v_tmp_lt_r.nr1 and v_nr_extras != v_tmp_lt_r.nr2 and v_nr_extras != v_tmp_lt_r.nr3
                                              and v_nr_extras != v_tmp_lt_r.nr4 and v_nr_extras != v_tmp_lt_r.nr5;
    end loop;
    v_tmp_lt_r.nr6 := v_nr_extras;
    --insert lt_v
    insert into lt_v
      (
        id_extr,
        id_bilet,
        nr1,
        nr2,
        nr3,
        nr4,
        nr5,
        nr6
      )
    values
      (
        v_id_extr,
        i,
        v_tmp_lt_r.nr1,
        v_tmp_lt_r.nr2,
        v_tmp_lt_r.nr3,
        v_tmp_lt_r.nr4,
        v_tmp_lt_r.nr5,
        v_tmp_lt_r.nr6
      );
  end loop;
  for x in (select * from lt_v t where t.id_extr = v_id_extr order by t.id_bilet) loop
  for y in (select * from lt_v t where t.id_extr = p_id_extr order by t.id_bilet) loop
    begin
      with a as (
        select t.nr1 as nr from lt_v t where t.id_extr = y.id_extr and t.id_bilet = y.id_bilet
        union all
        select t.nr2 as nr from lt_v t where t.id_extr = y.id_extr and t.id_bilet = y.id_bilet
        union all
        select t.nr3 as nr from lt_v t where t.id_extr = y.id_extr and t.id_bilet = y.id_bilet
        union all
        select t.nr4 as nr from lt_v t where t.id_extr = y.id_extr and t.id_bilet = y.id_bilet
        union all
        select t.nr5 as nr from lt_v t where t.id_extr = y.id_extr and t.id_bilet = y.id_bilet
        union all
        select t.nr6 as nr from lt_v t where t.id_extr = y.id_extr and t.id_bilet = y.id_bilet)
      select t.id_bilet into v_id_bilet
        from lt_v t
       where t.id_extr = x.id_extr
         and t.id_bilet = x.id_bilet
         and (
              (
                   t.nr1 in (select a.nr from a)
               and t.nr2 in (select a.nr from a)
               and t.nr3 in (select a.nr from a)
               and t.nr4 in (select a.nr from a)
              ) or
              (
                   t.nr1 in (select a.nr from a)
               and t.nr2 in (select a.nr from a)
               and t.nr3 in (select a.nr from a)
               and t.nr5 in (select a.nr from a)
              ) or
              (
                   t.nr1 in (select a.nr from a)
               and t.nr2 in (select a.nr from a)
               and t.nr3 in (select a.nr from a)
               and t.nr6 in (select a.nr from a)
              ) or
              (
                   t.nr1 in (select a.nr from a)
               and t.nr2 in (select a.nr from a)
               and t.nr4 in (select a.nr from a)
               and t.nr5 in (select a.nr from a)
              ) or
              (
                   t.nr1 in (select a.nr from a)
               and t.nr2 in (select a.nr from a)
               and t.nr4 in (select a.nr from a)
               and t.nr6 in (select a.nr from a)
              ) or
              (
                   t.nr1 in (select a.nr from a)
               and t.nr2 in (select a.nr from a)
               and t.nr5 in (select a.nr from a)
               and t.nr6 in (select a.nr from a)
              ) or
              (
                   t.nr1 in (select a.nr from a)
               and t.nr3 in (select a.nr from a)
               and t.nr4 in (select a.nr from a)
               and t.nr5 in (select a.nr from a)
              ) or
              (
                   t.nr1 in (select a.nr from a)
               and t.nr3 in (select a.nr from a)
               and t.nr4 in (select a.nr from a)
               and t.nr6 in (select a.nr from a)
              ) or
              (
                   t.nr1 in (select a.nr from a)
               and t.nr3 in (select a.nr from a)
               and t.nr5 in (select a.nr from a)
               and t.nr6 in (select a.nr from a)
              ) or
              (
                   t.nr1 in (select a.nr from a)
               and t.nr4 in (select a.nr from a)
               and t.nr5 in (select a.nr from a)
               and t.nr6 in (select a.nr from a)
              ) or
              (
                   t.nr2 in (select a.nr from a)
               and t.nr3 in (select a.nr from a)
               and t.nr4 in (select a.nr from a)
               and t.nr5 in (select a.nr from a)
              ) or
              (
                   t.nr2 in (select a.nr from a)
               and t.nr3 in (select a.nr from a)
               and t.nr4 in (select a.nr from a)
               and t.nr6 in (select a.nr from a)
              ) or
              (
                   t.nr2 in (select a.nr from a)
               and t.nr3 in (select a.nr from a)
               and t.nr5 in (select a.nr from a)
               and t.nr6 in (select a.nr from a)
              ) or
              (
                   t.nr2 in (select a.nr from a)
               and t.nr4 in (select a.nr from a)
               and t.nr5 in (select a.nr from a)
               and t.nr6 in (select a.nr from a)
              ) or
              (
                   t.nr3 in (select a.nr from a)
               and t.nr4 in (select a.nr from a)
               and t.nr5 in (select a.nr from a)
               and t.nr6 in (select a.nr from a)
              )                                                                    
             );
      dbms_output.put_line('bilet castigator id_extr: ' || x.id_extr || ' & id_bilet: '|| x.id_bilet ||'; bilet jucat id_extr: ' || y.id_extr || ' & id_bilet: '|| y.id_bilet);
      v_nr_castig := v_nr_castig + 1;
    exception
      when no_data_found then
        null;
    end;
  end loop;
  end loop;
  dbms_output.put_line('bilete castigatoare: ' || v_nr_castig);
  
exception
  when e_err then
    dbms_output.put_line('Extragere ' || p_id_extr || ' invalida');

END VERIF_BILET_4_NR_CASTIGATOARE;

PROCEDURE VERIF_BILET_5_NR_CASTIGATOARE
  (
    p_nr_bilete integer,
    p_id_extr integer
  ) IS
  
  v_sch_row ltsys.sch%rowtype;
  v_id_extr integer;
  v_id_bilet integer;
  type lt_v_r is record
  (
     nr1 integer,
     nr2 integer,
     nr3 integer,
     nr4 integer,
     nr5 integer,
     nr6 integer
  );
  v_tmp_lt_r lt_v_r;
  v_nr_extras integer;
  v_nr_castigator integer := 0;
  e_err exception;
begin
  begin
    select b.*
      into v_sch_row
      from lt a,
           sch b
     where a.id_extr = p_id_extr
       and a.id_sch = b.id_sch
	   and a.id_bilet is null
       and b.cod like '5%';
  exception
    when no_data_found then
	  raise e_err;
  end;
  dbms_output.put_line('sistem: ' || v_sch_row.denumire);
  dbms_output.put_line('bilete verificate: ' || p_nr_bilete);
  select nvl(max(t.id_extr),0) + 1 into v_id_extr from lt t;
  v_tmp_lt_r := null;
  for i in 1 .. p_nr_bilete loop
    --nr1
    v_nr_extras := trunc(DBMS_RANDOM.VALUE(1, 49));
    v_tmp_lt_r.nr1 := v_nr_extras;
    --nr2
    loop
      v_nr_extras := trunc(DBMS_RANDOM.VALUE(1, 49));
      exit when v_nr_extras != v_tmp_lt_r.nr1;
    end loop;
    v_tmp_lt_r.nr2 := v_nr_extras;
    --nr3
    loop
      v_nr_extras := trunc(DBMS_RANDOM.VALUE(1, 49));
      exit when v_nr_extras != v_tmp_lt_r.nr1 and v_nr_extras != v_tmp_lt_r.nr2;
    end loop;
    v_tmp_lt_r.nr3 := v_nr_extras;
    --nr4
    loop
      v_nr_extras := trunc(DBMS_RANDOM.VALUE(1, 49));
      exit when v_nr_extras != v_tmp_lt_r.nr1 and v_nr_extras != v_tmp_lt_r.nr2 and v_nr_extras != v_tmp_lt_r.nr3;
    end loop;
    v_tmp_lt_r.nr4 := v_nr_extras;
    --nr5
    loop
      v_nr_extras := trunc(DBMS_RANDOM.VALUE(1, 49));
      exit when v_nr_extras != v_tmp_lt_r.nr1 and v_nr_extras != v_tmp_lt_r.nr2 and v_nr_extras != v_tmp_lt_r.nr3
                                              and v_nr_extras != v_tmp_lt_r.nr4;
    end loop;
    v_tmp_lt_r.nr5 := v_nr_extras;
    --nr6
    loop
      v_nr_extras := trunc(DBMS_RANDOM.VALUE(1, 49));
      exit when v_nr_extras != v_tmp_lt_r.nr1 and v_nr_extras != v_tmp_lt_r.nr2 and v_nr_extras != v_tmp_lt_r.nr3
                                              and v_nr_extras != v_tmp_lt_r.nr4 and v_nr_extras != v_tmp_lt_r.nr5;
    end loop;
    v_tmp_lt_r.nr6 := v_nr_extras;
    --insert lt_v
    insert into lt_v
      (
        id_extr,
        id_bilet,
        nr1,
        nr2,
        nr3,
        nr4,
        nr5,
        nr6
      )
    values
      (
        v_id_extr,
        i,
        v_tmp_lt_r.nr1,
        v_tmp_lt_r.nr2,
        v_tmp_lt_r.nr3,
        v_tmp_lt_r.nr4,
        v_tmp_lt_r.nr5,
        v_tmp_lt_r.nr6
      );
  end loop;
  for x in (select * from lt_v t where t.id_extr = v_id_extr order by t.id_bilet) loop
  for y in (select * from lt_v t where t.id_extr = p_id_extr order by t.id_bilet) loop
    begin
      with a as (
        select t.nr1 as nr from lt_v t where t.id_extr = y.id_extr and t.id_bilet = y.id_bilet
        union all
        select t.nr2 as nr from lt_v t where t.id_extr = y.id_extr and t.id_bilet = y.id_bilet
        union all
        select t.nr3 as nr from lt_v t where t.id_extr = y.id_extr and t.id_bilet = y.id_bilet
        union all
        select t.nr4 as nr from lt_v t where t.id_extr = y.id_extr and t.id_bilet = y.id_bilet
        union all
        select t.nr5 as nr from lt_v t where t.id_extr = y.id_extr and t.id_bilet = y.id_bilet
        union all
        select t.nr6 as nr from lt_v t where t.id_extr = y.id_extr and t.id_bilet = y.id_bilet)
      select t.id_bilet into v_id_bilet
        from lt_v t
       where t.id_extr = x.id_extr
         and t.id_bilet = x.id_bilet
         and (
              (
                   t.nr1 in (select a.nr from a)
               and t.nr2 in (select a.nr from a)
               and t.nr3 in (select a.nr from a)
               and t.nr4 in (select a.nr from a)
               and t.nr5 in (select a.nr from a)
              ) or
              (
                   t.nr1 in (select a.nr from a)
               and t.nr2 in (select a.nr from a)
               and t.nr3 in (select a.nr from a)
               and t.nr4 in (select a.nr from a)
               and t.nr6 in (select a.nr from a)
              ) or
              (
                   t.nr1 in (select a.nr from a)
               and t.nr2 in (select a.nr from a)
               and t.nr3 in (select a.nr from a)
               and t.nr5 in (select a.nr from a)
               and t.nr6 in (select a.nr from a)
              ) or
              (
                   t.nr1 in (select a.nr from a)
               and t.nr2 in (select a.nr from a)
               and t.nr4 in (select a.nr from a)
               and t.nr5 in (select a.nr from a)
               and t.nr6 in (select a.nr from a)
              ) or
              (
                   t.nr1 in (select a.nr from a)
               and t.nr3 in (select a.nr from a)
               and t.nr4 in (select a.nr from a)
               and t.nr5 in (select a.nr from a)
               and t.nr6 in (select a.nr from a)
              ) or
              (
                   t.nr2 in (select a.nr from a)
               and t.nr3 in (select a.nr from a)
               and t.nr4 in (select a.nr from a)
               and t.nr5 in (select a.nr from a)
               and t.nr6 in (select a.nr from a)
              )                                                           
             );
      dbms_output.put_line('bilet castigator id_extr: ' || x.id_extr || ' & id_bilet: '|| x.id_bilet ||'; bilet jucat id_extr: ' || y.id_extr || ' & id_bilet: '|| y.id_bilet);
      v_nr_castigator := v_nr_castigator + 1;
    exception
      when no_data_found then
        null;
    end;
  end loop;
  end loop;
  dbms_output.put_line('bilete castigatoare: ' || v_nr_castigator);
  
exception
  when e_err then
    dbms_output.put_line('Extragere ' || p_id_extr || ' invalida');
	
END VERIF_BILET_5_NR_CASTIGATOARE;

END VERIF_BILET_PKG;
