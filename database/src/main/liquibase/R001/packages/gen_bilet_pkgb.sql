CREATE OR REPLACE PACKAGE BODY LTSYS.GEN_BILET_PKG AS 

PROCEDURE GEN_BILET_8_NR_JUCATE
  (
    p_cod_sch ltsys.sch.cod%type
  ) IS

  v_sch_row ltsys.sch%rowtype;
  v_id_extr integer;
  type lt_r is record
  (
     nr1 integer,
     nr2 integer,
     nr3 integer,
     nr4 integer,
     nr5 integer,
     nr6 integer,
     nr7 integer,
     nr8 integer
  );
  v_tmp_lt_r lt_r;
  v_tmp_lt_r2 lt_r;
  v_nr_extras integer;
  v_nr_castigator integer := 0;
  v_nr_necastigator integer := 0;
begin
  select s.*
    into v_sch_row
    from ltsys.sch s
   where s.cod = p_cod_sch
     and s.cod like '%8';
  dbms_output.put_line('sistem: ' || v_sch_row.denumire);	 
  select nvl(max(t.id_extr),0) + 1 into v_id_extr from ltsys.lt t;
  --
  v_tmp_lt_r := null;
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
  --nr7
  loop
    v_nr_extras := trunc(DBMS_RANDOM.VALUE(1, 49));
    exit when v_nr_extras != v_tmp_lt_r.nr1 and v_nr_extras != v_tmp_lt_r.nr2 and v_nr_extras != v_tmp_lt_r.nr3
                                            and v_nr_extras != v_tmp_lt_r.nr4 and v_nr_extras != v_tmp_lt_r.nr5
                                            and v_nr_extras != v_tmp_lt_r.nr6;
  end loop;
  v_tmp_lt_r.nr7 := v_nr_extras;
  --nr8
  loop
    v_nr_extras := trunc(DBMS_RANDOM.VALUE(1, 49));
    exit when v_nr_extras != v_tmp_lt_r.nr1 and v_nr_extras != v_tmp_lt_r.nr2 and v_nr_extras != v_tmp_lt_r.nr3
                                            and v_nr_extras != v_tmp_lt_r.nr4 and v_nr_extras != v_tmp_lt_r.nr5
                                            and v_nr_extras != v_tmp_lt_r.nr6 and v_nr_extras != v_tmp_lt_r.nr7;
  end loop;
  v_tmp_lt_r.nr8 := v_nr_extras;
  
  insert into ltsys.lt
    (
      id_extr,
      id_sch,
      id_bilet,
      nr1,
      nr2,
      nr3,
      nr4,
      nr5,
      nr6,
      nr7,
      nr8
    )
  values
    (
      v_id_extr,
      v_sch_row.id_sch,
      null,
      v_tmp_lt_r.nr1,
      v_tmp_lt_r.nr2,
      v_tmp_lt_r.nr3,
      v_tmp_lt_r.nr4,
      v_tmp_lt_r.nr5,
      v_tmp_lt_r.nr6,
      v_tmp_lt_r.nr7,
      v_tmp_lt_r.nr8
    );
  dbms_output.put_line('id extragere generata: ' || v_id_extr);
  for x in (select * from ltsys.sch_det t where t.id_sch = v_sch_row.id_sch order by t.poz) loop
    v_tmp_lt_r2 := null;
    --
    if x.nr1 = 1 then
      v_tmp_lt_r2.nr1 := v_tmp_lt_r.nr1;
    elsif x.nr1 = 2 then
      v_tmp_lt_r2.nr1 := v_tmp_lt_r.nr2;
    elsif x.nr1 = 3 then
      v_tmp_lt_r2.nr1 := v_tmp_lt_r.nr3;
    elsif x.nr1 = 4 then
      v_tmp_lt_r2.nr1 := v_tmp_lt_r.nr4;
    elsif x.nr1 = 5 then
      v_tmp_lt_r2.nr1 := v_tmp_lt_r.nr5;
    elsif x.nr1 = 6 then
      v_tmp_lt_r2.nr1 := v_tmp_lt_r.nr6;
    elsif x.nr1 = 7 then
      v_tmp_lt_r2.nr1 := v_tmp_lt_r.nr7;
    elsif x.nr1 = 8 then
      v_tmp_lt_r2.nr1 := v_tmp_lt_r.nr8;                  
    end if;
    --
    if x.nr2 = 1 then
      v_tmp_lt_r2.nr2 := v_tmp_lt_r.nr1;
    elsif x.nr2 = 2 then
      v_tmp_lt_r2.nr2 := v_tmp_lt_r.nr2;
    elsif x.nr2 = 3 then
      v_tmp_lt_r2.nr2 := v_tmp_lt_r.nr3;
    elsif x.nr2 = 4 then
      v_tmp_lt_r2.nr2 := v_tmp_lt_r.nr4;
    elsif x.nr2 = 5 then
      v_tmp_lt_r2.nr2 := v_tmp_lt_r.nr5;
    elsif x.nr2 = 6 then
      v_tmp_lt_r2.nr2 := v_tmp_lt_r.nr6;
    elsif x.nr2 = 7 then
      v_tmp_lt_r2.nr2 := v_tmp_lt_r.nr7;
    elsif x.nr2 = 8 then
      v_tmp_lt_r2.nr2 := v_tmp_lt_r.nr8;                  
    end if;
    --
    if x.nr3 = 1 then
      v_tmp_lt_r2.nr3 := v_tmp_lt_r.nr1;
    elsif x.nr3 = 2 then
      v_tmp_lt_r2.nr3 := v_tmp_lt_r.nr2;
    elsif x.nr3 = 3 then
      v_tmp_lt_r2.nr3 := v_tmp_lt_r.nr3;
    elsif x.nr3 = 4 then
      v_tmp_lt_r2.nr3 := v_tmp_lt_r.nr4;
    elsif x.nr3 = 5 then
      v_tmp_lt_r2.nr3 := v_tmp_lt_r.nr5;
    elsif x.nr3 = 6 then
      v_tmp_lt_r2.nr3 := v_tmp_lt_r.nr6;
    elsif x.nr3 = 7 then
      v_tmp_lt_r2.nr3 := v_tmp_lt_r.nr7;
    elsif x.nr3 = 8 then
      v_tmp_lt_r2.nr3 := v_tmp_lt_r.nr8;                  
    end if;
    --
    if x.nr4 = 1 then
      v_tmp_lt_r2.nr4 := v_tmp_lt_r.nr1;
    elsif x.nr4 = 2 then
      v_tmp_lt_r2.nr4 := v_tmp_lt_r.nr2;
    elsif x.nr4 = 3 then
      v_tmp_lt_r2.nr4 := v_tmp_lt_r.nr3;
    elsif x.nr4 = 4 then
      v_tmp_lt_r2.nr4 := v_tmp_lt_r.nr4;
    elsif x.nr4 = 5 then
      v_tmp_lt_r2.nr4 := v_tmp_lt_r.nr5;
    elsif x.nr4 = 6 then
      v_tmp_lt_r2.nr4 := v_tmp_lt_r.nr6;
    elsif x.nr4 = 7 then
      v_tmp_lt_r2.nr4 := v_tmp_lt_r.nr7;
    elsif x.nr4 = 8 then
      v_tmp_lt_r2.nr4 := v_tmp_lt_r.nr8;                  
    end if;
    --
    if x.nr5 = 1 then
      v_tmp_lt_r2.nr5 := v_tmp_lt_r.nr1;
    elsif x.nr5 = 2 then
      v_tmp_lt_r2.nr5 := v_tmp_lt_r.nr2;
    elsif x.nr5 = 3 then
      v_tmp_lt_r2.nr5 := v_tmp_lt_r.nr3;
    elsif x.nr5 = 4 then
      v_tmp_lt_r2.nr5 := v_tmp_lt_r.nr4;
    elsif x.nr5 = 5 then
      v_tmp_lt_r2.nr5 := v_tmp_lt_r.nr5;
    elsif x.nr5 = 6 then
      v_tmp_lt_r2.nr5 := v_tmp_lt_r.nr6;
    elsif x.nr5 = 7 then
      v_tmp_lt_r2.nr5 := v_tmp_lt_r.nr7;
    elsif x.nr5 = 8 then
      v_tmp_lt_r2.nr5 := v_tmp_lt_r.nr8;                  
    end if;
    --
    if x.nr6 = 1 then
      v_tmp_lt_r2.nr6 := v_tmp_lt_r.nr1;
    elsif x.nr6 = 2 then
      v_tmp_lt_r2.nr6 := v_tmp_lt_r.nr2;
    elsif x.nr6 = 3 then
      v_tmp_lt_r2.nr6 := v_tmp_lt_r.nr3;
    elsif x.nr6 = 4 then
      v_tmp_lt_r2.nr6 := v_tmp_lt_r.nr4;
    elsif x.nr6 = 5 then
      v_tmp_lt_r2.nr6 := v_tmp_lt_r.nr5;
    elsif x.nr6 = 6 then
      v_tmp_lt_r2.nr6 := v_tmp_lt_r.nr6;
    elsif x.nr6 = 7 then
      v_tmp_lt_r2.nr6 := v_tmp_lt_r.nr7;
    elsif x.nr6 = 8 then
      v_tmp_lt_r2.nr6 := v_tmp_lt_r.nr8;                  
    end if;
	
    insert into ltsys.lt
      (
        id_extr,
        id_sch,
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
        v_sch_row.id_sch,
        x.poz,
        v_tmp_lt_r2.nr1,
        v_tmp_lt_r2.nr2,
        v_tmp_lt_r2.nr3,
        v_tmp_lt_r2.nr4,
        v_tmp_lt_r2.nr5,
        v_tmp_lt_r2.nr6
      );
  end loop;
  
END GEN_BILET_8_NR_JUCATE;
  
PROCEDURE GEN_BILET_9_NR_JUCATE
  (
    p_cod_sch ltsys.sch.cod%type
  ) IS

  v_sch_row ltsys.sch%rowtype;
  v_id_extr integer;
  type lt_r is record
  (
     nr1 integer,
     nr2 integer,
     nr3 integer,
     nr4 integer,
     nr5 integer,
     nr6 integer,
     nr7 integer,
     nr8 integer,
     nr9 integer
  );
  v_tmp_lt_r lt_r;
  v_tmp_lt_r2 lt_r;
  v_nr_extras integer;
  v_nr_castigator integer := 0;
  v_nr_necastigator integer := 0;
begin
  select s.*
    into v_sch_row
    from ltsys.sch s
   where s.cod = p_cod_sch
     and s.cod like '%9';
  dbms_output.put_line('sistem: ' || v_sch_row.denumire);
  select nvl(max(t.id_extr),0) + 1 into v_id_extr from ltsys.lt t;
  --
  v_tmp_lt_r := null;
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
  --nr7
  loop
    v_nr_extras := trunc(DBMS_RANDOM.VALUE(1, 49));
    exit when v_nr_extras != v_tmp_lt_r.nr1 and v_nr_extras != v_tmp_lt_r.nr2 and v_nr_extras != v_tmp_lt_r.nr3
                                            and v_nr_extras != v_tmp_lt_r.nr4 and v_nr_extras != v_tmp_lt_r.nr5
                                            and v_nr_extras != v_tmp_lt_r.nr6;
  end loop;
  v_tmp_lt_r.nr7 := v_nr_extras;
  --nr8
  loop
    v_nr_extras := trunc(DBMS_RANDOM.VALUE(1, 49));
    exit when v_nr_extras != v_tmp_lt_r.nr1 and v_nr_extras != v_tmp_lt_r.nr2 and v_nr_extras != v_tmp_lt_r.nr3
                                            and v_nr_extras != v_tmp_lt_r.nr4 and v_nr_extras != v_tmp_lt_r.nr5
                                            and v_nr_extras != v_tmp_lt_r.nr6 and v_nr_extras != v_tmp_lt_r.nr7;
  end loop;
  v_tmp_lt_r.nr8 := v_nr_extras;
  --nr9
  loop
    v_nr_extras := trunc(DBMS_RANDOM.VALUE(1, 49));
    exit when v_nr_extras != v_tmp_lt_r.nr1 and v_nr_extras != v_tmp_lt_r.nr2 and v_nr_extras != v_tmp_lt_r.nr3
                                            and v_nr_extras != v_tmp_lt_r.nr4 and v_nr_extras != v_tmp_lt_r.nr5
                                            and v_nr_extras != v_tmp_lt_r.nr6 and v_nr_extras != v_tmp_lt_r.nr7
                                            and v_nr_extras != v_tmp_lt_r.nr8;
  end loop;
  v_tmp_lt_r.nr9 := v_nr_extras;
  
  insert into ltsys.lt
    (
      id_extr,
      id_sch,
      id_bilet,
      nr1,
      nr2,
      nr3,
      nr4,
      nr5,
      nr6,
      nr7,
      nr8,
      nr9
    )
  values
    (
      v_id_extr,
      v_sch_row.id_sch,
      null,
      v_tmp_lt_r.nr1,
      v_tmp_lt_r.nr2,
      v_tmp_lt_r.nr3,
      v_tmp_lt_r.nr4,
      v_tmp_lt_r.nr5,
      v_tmp_lt_r.nr6,
      v_tmp_lt_r.nr7,
      v_tmp_lt_r.nr8,
      v_tmp_lt_r.nr9
    );
  dbms_output.put_line('id extragere generata: ' || v_id_extr);
  for x in (select * from ltsys.sch_det t where t.id_sch = v_sch_row.id_sch order by t.poz) loop
    v_tmp_lt_r2 := null;
    --
    if x.nr1 = 1 then
      v_tmp_lt_r2.nr1 := v_tmp_lt_r.nr1;
    elsif x.nr1 = 2 then
      v_tmp_lt_r2.nr1 := v_tmp_lt_r.nr2;
    elsif x.nr1 = 3 then
      v_tmp_lt_r2.nr1 := v_tmp_lt_r.nr3;
    elsif x.nr1 = 4 then
      v_tmp_lt_r2.nr1 := v_tmp_lt_r.nr4;
    elsif x.nr1 = 5 then
      v_tmp_lt_r2.nr1 := v_tmp_lt_r.nr5;
    elsif x.nr1 = 6 then
      v_tmp_lt_r2.nr1 := v_tmp_lt_r.nr6;
    elsif x.nr1 = 7 then
      v_tmp_lt_r2.nr1 := v_tmp_lt_r.nr7;
    elsif x.nr1 = 8 then
      v_tmp_lt_r2.nr1 := v_tmp_lt_r.nr8;                  
    elsif x.nr1 = 9 then
      v_tmp_lt_r2.nr1 := v_tmp_lt_r.nr9;
    end if;
    --
    if x.nr2 = 1 then
      v_tmp_lt_r2.nr2 := v_tmp_lt_r.nr1;
    elsif x.nr2 = 2 then
      v_tmp_lt_r2.nr2 := v_tmp_lt_r.nr2;
    elsif x.nr2 = 3 then
      v_tmp_lt_r2.nr2 := v_tmp_lt_r.nr3;
    elsif x.nr2 = 4 then
      v_tmp_lt_r2.nr2 := v_tmp_lt_r.nr4;
    elsif x.nr2 = 5 then
      v_tmp_lt_r2.nr2 := v_tmp_lt_r.nr5;
    elsif x.nr2 = 6 then
      v_tmp_lt_r2.nr2 := v_tmp_lt_r.nr6;
    elsif x.nr2 = 7 then
      v_tmp_lt_r2.nr2 := v_tmp_lt_r.nr7;
    elsif x.nr2 = 8 then
      v_tmp_lt_r2.nr2 := v_tmp_lt_r.nr8;    
    elsif x.nr2 = 9 then
      v_tmp_lt_r2.nr2 := v_tmp_lt_r.nr9;              
    end if;
    --
    if x.nr3 = 1 then
      v_tmp_lt_r2.nr3 := v_tmp_lt_r.nr1;
    elsif x.nr3 = 2 then
      v_tmp_lt_r2.nr3 := v_tmp_lt_r.nr2;
    elsif x.nr3 = 3 then
      v_tmp_lt_r2.nr3 := v_tmp_lt_r.nr3;
    elsif x.nr3 = 4 then
      v_tmp_lt_r2.nr3 := v_tmp_lt_r.nr4;
    elsif x.nr3 = 5 then
      v_tmp_lt_r2.nr3 := v_tmp_lt_r.nr5;
    elsif x.nr3 = 6 then
      v_tmp_lt_r2.nr3 := v_tmp_lt_r.nr6;
    elsif x.nr3 = 7 then
      v_tmp_lt_r2.nr3 := v_tmp_lt_r.nr7;
    elsif x.nr3 = 8 then
      v_tmp_lt_r2.nr3 := v_tmp_lt_r.nr8;   
    elsif x.nr3 = 9 then
      v_tmp_lt_r2.nr3 := v_tmp_lt_r.nr9;               
    end if;
    --
    if x.nr4 = 1 then
      v_tmp_lt_r2.nr4 := v_tmp_lt_r.nr1;
    elsif x.nr4 = 2 then
      v_tmp_lt_r2.nr4 := v_tmp_lt_r.nr2;
    elsif x.nr4 = 3 then
      v_tmp_lt_r2.nr4 := v_tmp_lt_r.nr3;
    elsif x.nr4 = 4 then
      v_tmp_lt_r2.nr4 := v_tmp_lt_r.nr4;
    elsif x.nr4 = 5 then
      v_tmp_lt_r2.nr4 := v_tmp_lt_r.nr5;
    elsif x.nr4 = 6 then
      v_tmp_lt_r2.nr4 := v_tmp_lt_r.nr6;
    elsif x.nr4 = 7 then
      v_tmp_lt_r2.nr4 := v_tmp_lt_r.nr7;
    elsif x.nr4 = 8 then
      v_tmp_lt_r2.nr4 := v_tmp_lt_r.nr8;  
    elsif x.nr4 = 9 then
      v_tmp_lt_r2.nr4 := v_tmp_lt_r.nr9;                 
    end if;
    --
    if x.nr5 = 1 then
      v_tmp_lt_r2.nr5 := v_tmp_lt_r.nr1;
    elsif x.nr5 = 2 then
      v_tmp_lt_r2.nr5 := v_tmp_lt_r.nr2;
    elsif x.nr5 = 3 then
      v_tmp_lt_r2.nr5 := v_tmp_lt_r.nr3;
    elsif x.nr5 = 4 then
      v_tmp_lt_r2.nr5 := v_tmp_lt_r.nr4;
    elsif x.nr5 = 5 then
      v_tmp_lt_r2.nr5 := v_tmp_lt_r.nr5;
    elsif x.nr5 = 6 then
      v_tmp_lt_r2.nr5 := v_tmp_lt_r.nr6;
    elsif x.nr5 = 7 then
      v_tmp_lt_r2.nr5 := v_tmp_lt_r.nr7;
    elsif x.nr5 = 8 then
      v_tmp_lt_r2.nr5 := v_tmp_lt_r.nr8;    
    elsif x.nr5 = 9 then
      v_tmp_lt_r2.nr5 := v_tmp_lt_r.nr9;               
    end if;
    --
    if x.nr6 = 1 then
      v_tmp_lt_r2.nr6 := v_tmp_lt_r.nr1;
    elsif x.nr6 = 2 then
      v_tmp_lt_r2.nr6 := v_tmp_lt_r.nr2;
    elsif x.nr6 = 3 then
      v_tmp_lt_r2.nr6 := v_tmp_lt_r.nr3;
    elsif x.nr6 = 4 then
      v_tmp_lt_r2.nr6 := v_tmp_lt_r.nr4;
    elsif x.nr6 = 5 then
      v_tmp_lt_r2.nr6 := v_tmp_lt_r.nr5;
    elsif x.nr6 = 6 then
      v_tmp_lt_r2.nr6 := v_tmp_lt_r.nr6;
    elsif x.nr6 = 7 then
      v_tmp_lt_r2.nr6 := v_tmp_lt_r.nr7;
    elsif x.nr6 = 8 then
      v_tmp_lt_r2.nr6 := v_tmp_lt_r.nr8;    
    elsif x.nr6 = 9 then
      v_tmp_lt_r2.nr6 := v_tmp_lt_r.nr9;               
    end if;
	
    insert into ltsys.lt
      (
        id_extr,
        id_sch,
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
        v_sch_row.id_sch,
        x.poz,
        v_tmp_lt_r2.nr1,
        v_tmp_lt_r2.nr2,
        v_tmp_lt_r2.nr3,
        v_tmp_lt_r2.nr4,
        v_tmp_lt_r2.nr5,
        v_tmp_lt_r2.nr6
      );
  end loop;

END GEN_BILET_9_NR_JUCATE;

PROCEDURE GEN_BILET_10_NR_JUCATE
  (
    p_cod_sch ltsys.sch.cod%type
  ) IS

  v_sch_row ltsys.sch%rowtype;
  v_id_extr integer;
  type lt_r is record
  (
     nr1 integer,
     nr2 integer,
     nr3 integer,
     nr4 integer,
     nr5 integer,
     nr6 integer,
     nr7 integer,
     nr8 integer,
     nr9 integer,
     nr10 integer
  );
  v_tmp_lt_r lt_r;
  v_tmp_lt_r2 lt_r;
  v_nr_extras integer;
  v_nr_castigator integer := 0;
  v_nr_necastigator integer := 0;
begin
  select s.*
    into v_sch_row
    from ltsys.sch s
   where s.cod = p_cod_sch
     and s.cod like '%10';
  dbms_output.put_line('sistem: ' || v_sch_row.denumire);
  select nvl(max(t.id_extr),0) + 1 into v_id_extr from ltsys.lt t;
  --
  v_tmp_lt_r := null;
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
  --nr7
  loop
    v_nr_extras := trunc(DBMS_RANDOM.VALUE(1, 49));
    exit when v_nr_extras != v_tmp_lt_r.nr1 and v_nr_extras != v_tmp_lt_r.nr2 and v_nr_extras != v_tmp_lt_r.nr3
                                            and v_nr_extras != v_tmp_lt_r.nr4 and v_nr_extras != v_tmp_lt_r.nr5
                                            and v_nr_extras != v_tmp_lt_r.nr6;
  end loop;
  v_tmp_lt_r.nr7 := v_nr_extras;
  --nr8
  loop
    v_nr_extras := trunc(DBMS_RANDOM.VALUE(1, 49));
    exit when v_nr_extras != v_tmp_lt_r.nr1 and v_nr_extras != v_tmp_lt_r.nr2 and v_nr_extras != v_tmp_lt_r.nr3
                                            and v_nr_extras != v_tmp_lt_r.nr4 and v_nr_extras != v_tmp_lt_r.nr5
                                            and v_nr_extras != v_tmp_lt_r.nr6 and v_nr_extras != v_tmp_lt_r.nr7;
  end loop;
  v_tmp_lt_r.nr8 := v_nr_extras;
  --nr9
  loop
    v_nr_extras := trunc(DBMS_RANDOM.VALUE(1, 49));
    exit when v_nr_extras != v_tmp_lt_r.nr1 and v_nr_extras != v_tmp_lt_r.nr2 and v_nr_extras != v_tmp_lt_r.nr3
                                            and v_nr_extras != v_tmp_lt_r.nr4 and v_nr_extras != v_tmp_lt_r.nr5
                                            and v_nr_extras != v_tmp_lt_r.nr6 and v_nr_extras != v_tmp_lt_r.nr7
                                            and v_nr_extras != v_tmp_lt_r.nr8;
  end loop;
  v_tmp_lt_r.nr9 := v_nr_extras;
  --nr10
  loop
    v_nr_extras := trunc(DBMS_RANDOM.VALUE(1, 49));
    exit when v_nr_extras != v_tmp_lt_r.nr1 and v_nr_extras != v_tmp_lt_r.nr2 and v_nr_extras != v_tmp_lt_r.nr3
                                            and v_nr_extras != v_tmp_lt_r.nr4 and v_nr_extras != v_tmp_lt_r.nr5
                                            and v_nr_extras != v_tmp_lt_r.nr6 and v_nr_extras != v_tmp_lt_r.nr7
                                            and v_nr_extras != v_tmp_lt_r.nr8 and v_nr_extras != v_tmp_lt_r.nr9;
  end loop;
  v_tmp_lt_r.nr10 := v_nr_extras;
  
  insert into ltsys.lt
    (
      id_extr,
      id_sch,
      id_bilet,
      nr1,
      nr2,
      nr3,
      nr4,
      nr5,
      nr6,
      nr7,
      nr8,
      nr9,
      nr10
    )
  values
    (
      v_id_extr,
      v_sch_row.id_sch,
      null,
      v_tmp_lt_r.nr1,
      v_tmp_lt_r.nr2,
      v_tmp_lt_r.nr3,
      v_tmp_lt_r.nr4,
      v_tmp_lt_r.nr5,
      v_tmp_lt_r.nr6,
      v_tmp_lt_r.nr7,
      v_tmp_lt_r.nr8,
      v_tmp_lt_r.nr9,
      v_tmp_lt_r.nr10
    );
  dbms_output.put_line('id extragere generata: ' || v_id_extr);
  for x in (select * from ltsys.sch_det t where t.id_sch = v_sch_row.id_sch order by t.poz) loop
    v_tmp_lt_r2 := null;
    --
    if x.nr1 = 1 then
      v_tmp_lt_r2.nr1 := v_tmp_lt_r.nr1;
    elsif x.nr1 = 2 then
      v_tmp_lt_r2.nr1 := v_tmp_lt_r.nr2;
    elsif x.nr1 = 3 then
      v_tmp_lt_r2.nr1 := v_tmp_lt_r.nr3;
    elsif x.nr1 = 4 then
      v_tmp_lt_r2.nr1 := v_tmp_lt_r.nr4;
    elsif x.nr1 = 5 then
      v_tmp_lt_r2.nr1 := v_tmp_lt_r.nr5;
    elsif x.nr1 = 6 then
      v_tmp_lt_r2.nr1 := v_tmp_lt_r.nr6;
    elsif x.nr1 = 7 then
      v_tmp_lt_r2.nr1 := v_tmp_lt_r.nr7;
    elsif x.nr1 = 8 then
      v_tmp_lt_r2.nr1 := v_tmp_lt_r.nr8;                  
    elsif x.nr1 = 9 then
      v_tmp_lt_r2.nr1 := v_tmp_lt_r.nr9;
    elsif x.nr1 = 10 then
      v_tmp_lt_r2.nr1 := v_tmp_lt_r.nr10;
    end if;
    --
    if x.nr2 = 1 then
      v_tmp_lt_r2.nr2 := v_tmp_lt_r.nr1;
    elsif x.nr2 = 2 then
      v_tmp_lt_r2.nr2 := v_tmp_lt_r.nr2;
    elsif x.nr2 = 3 then
      v_tmp_lt_r2.nr2 := v_tmp_lt_r.nr3;
    elsif x.nr2 = 4 then
      v_tmp_lt_r2.nr2 := v_tmp_lt_r.nr4;
    elsif x.nr2 = 5 then
      v_tmp_lt_r2.nr2 := v_tmp_lt_r.nr5;
    elsif x.nr2 = 6 then
      v_tmp_lt_r2.nr2 := v_tmp_lt_r.nr6;
    elsif x.nr2 = 7 then
      v_tmp_lt_r2.nr2 := v_tmp_lt_r.nr7;
    elsif x.nr2 = 8 then
      v_tmp_lt_r2.nr2 := v_tmp_lt_r.nr8;    
    elsif x.nr2 = 9 then
      v_tmp_lt_r2.nr2 := v_tmp_lt_r.nr9; 
    elsif x.nr2 = 10 then
      v_tmp_lt_r2.nr2 := v_tmp_lt_r.nr10;             
    end if;
    --
    if x.nr3 = 1 then
      v_tmp_lt_r2.nr3 := v_tmp_lt_r.nr1;
    elsif x.nr3 = 2 then
      v_tmp_lt_r2.nr3 := v_tmp_lt_r.nr2;
    elsif x.nr3 = 3 then
      v_tmp_lt_r2.nr3 := v_tmp_lt_r.nr3;
    elsif x.nr3 = 4 then
      v_tmp_lt_r2.nr3 := v_tmp_lt_r.nr4;
    elsif x.nr3 = 5 then
      v_tmp_lt_r2.nr3 := v_tmp_lt_r.nr5;
    elsif x.nr3 = 6 then
      v_tmp_lt_r2.nr3 := v_tmp_lt_r.nr6;
    elsif x.nr3 = 7 then
      v_tmp_lt_r2.nr3 := v_tmp_lt_r.nr7;
    elsif x.nr3 = 8 then
      v_tmp_lt_r2.nr3 := v_tmp_lt_r.nr8;   
    elsif x.nr3 = 9 then
      v_tmp_lt_r2.nr3 := v_tmp_lt_r.nr9;  
    elsif x.nr3 = 10 then
      v_tmp_lt_r2.nr3 := v_tmp_lt_r.nr10;             
    end if;
    --
    if x.nr4 = 1 then
      v_tmp_lt_r2.nr4 := v_tmp_lt_r.nr1;
    elsif x.nr4 = 2 then
      v_tmp_lt_r2.nr4 := v_tmp_lt_r.nr2;
    elsif x.nr4 = 3 then
      v_tmp_lt_r2.nr4 := v_tmp_lt_r.nr3;
    elsif x.nr4 = 4 then
      v_tmp_lt_r2.nr4 := v_tmp_lt_r.nr4;
    elsif x.nr4 = 5 then
      v_tmp_lt_r2.nr4 := v_tmp_lt_r.nr5;
    elsif x.nr4 = 6 then
      v_tmp_lt_r2.nr4 := v_tmp_lt_r.nr6;
    elsif x.nr4 = 7 then
      v_tmp_lt_r2.nr4 := v_tmp_lt_r.nr7;
    elsif x.nr4 = 8 then
      v_tmp_lt_r2.nr4 := v_tmp_lt_r.nr8;  
    elsif x.nr4 = 9 then
      v_tmp_lt_r2.nr4 := v_tmp_lt_r.nr9; 
    elsif x.nr4 = 10 then
      v_tmp_lt_r2.nr4 := v_tmp_lt_r.nr10;                
    end if;
    --
    if x.nr5 = 1 then
      v_tmp_lt_r2.nr5 := v_tmp_lt_r.nr1;
    elsif x.nr5 = 2 then
      v_tmp_lt_r2.nr5 := v_tmp_lt_r.nr2;
    elsif x.nr5 = 3 then
      v_tmp_lt_r2.nr5 := v_tmp_lt_r.nr3;
    elsif x.nr5 = 4 then
      v_tmp_lt_r2.nr5 := v_tmp_lt_r.nr4;
    elsif x.nr5 = 5 then
      v_tmp_lt_r2.nr5 := v_tmp_lt_r.nr5;
    elsif x.nr5 = 6 then
      v_tmp_lt_r2.nr5 := v_tmp_lt_r.nr6;
    elsif x.nr5 = 7 then
      v_tmp_lt_r2.nr5 := v_tmp_lt_r.nr7;
    elsif x.nr5 = 8 then
      v_tmp_lt_r2.nr5 := v_tmp_lt_r.nr8;    
    elsif x.nr5 = 9 then
      v_tmp_lt_r2.nr5 := v_tmp_lt_r.nr9;    
    elsif x.nr5 = 10 then
      v_tmp_lt_r2.nr5 := v_tmp_lt_r.nr10;           
    end if;
    --
    if x.nr6 = 1 then
      v_tmp_lt_r2.nr6 := v_tmp_lt_r.nr1;
    elsif x.nr6 = 2 then
      v_tmp_lt_r2.nr6 := v_tmp_lt_r.nr2;
    elsif x.nr6 = 3 then
      v_tmp_lt_r2.nr6 := v_tmp_lt_r.nr3;
    elsif x.nr6 = 4 then
      v_tmp_lt_r2.nr6 := v_tmp_lt_r.nr4;
    elsif x.nr6 = 5 then
      v_tmp_lt_r2.nr6 := v_tmp_lt_r.nr5;
    elsif x.nr6 = 6 then
      v_tmp_lt_r2.nr6 := v_tmp_lt_r.nr6;
    elsif x.nr6 = 7 then
      v_tmp_lt_r2.nr6 := v_tmp_lt_r.nr7;
    elsif x.nr6 = 8 then
      v_tmp_lt_r2.nr6 := v_tmp_lt_r.nr8;    
    elsif x.nr6 = 9 then
      v_tmp_lt_r2.nr6 := v_tmp_lt_r.nr9;        
    elsif x.nr6 = 10 then
      v_tmp_lt_r2.nr6 := v_tmp_lt_r.nr10;       
    end if;
	
    insert into ltsys.lt
      (
        id_extr,
        id_sch,
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
        v_sch_row.id_sch,
        x.poz,
        v_tmp_lt_r2.nr1,
        v_tmp_lt_r2.nr2,
        v_tmp_lt_r2.nr3,
        v_tmp_lt_r2.nr4,
        v_tmp_lt_r2.nr5,
        v_tmp_lt_r2.nr6
      );
  end loop;

END GEN_BILET_10_NR_JUCATE;

PROCEDURE GEN_BILET_12_NR_JUCATE
  (
    p_cod_sch ltsys.sch.cod%type
  ) IS

  v_sch_row ltsys.sch%rowtype;
  v_id_extr integer;
  type lt_r is record
  (
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
  v_tmp_lt_r lt_r;
  v_tmp_lt_r2 lt_r;
  v_nr_extras integer;
  v_nr_castigator integer := 0;
  v_nr_necastigator integer := 0;
begin
  select s.*
    into v_sch_row
    from ltsys.sch s
   where s.cod = p_cod_sch
     and s.cod like '%12';
  dbms_output.put_line('sistem: ' || v_sch_row.denumire);
  select nvl(max(t.id_extr),0) + 1 into v_id_extr from ltsys.lt t;
  --
  v_tmp_lt_r := null;
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
  --nr7
  loop
    v_nr_extras := trunc(DBMS_RANDOM.VALUE(1, 49));
    exit when v_nr_extras != v_tmp_lt_r.nr1 and v_nr_extras != v_tmp_lt_r.nr2 and v_nr_extras != v_tmp_lt_r.nr3
                                            and v_nr_extras != v_tmp_lt_r.nr4 and v_nr_extras != v_tmp_lt_r.nr5
                                            and v_nr_extras != v_tmp_lt_r.nr6;
  end loop;
  v_tmp_lt_r.nr7 := v_nr_extras;
  --nr8
  loop
    v_nr_extras := trunc(DBMS_RANDOM.VALUE(1, 49));
    exit when v_nr_extras != v_tmp_lt_r.nr1 and v_nr_extras != v_tmp_lt_r.nr2 and v_nr_extras != v_tmp_lt_r.nr3
                                            and v_nr_extras != v_tmp_lt_r.nr4 and v_nr_extras != v_tmp_lt_r.nr5
                                            and v_nr_extras != v_tmp_lt_r.nr6 and v_nr_extras != v_tmp_lt_r.nr7;
  end loop;
  v_tmp_lt_r.nr8 := v_nr_extras;
  --nr9
  loop
    v_nr_extras := trunc(DBMS_RANDOM.VALUE(1, 49));
    exit when v_nr_extras != v_tmp_lt_r.nr1 and v_nr_extras != v_tmp_lt_r.nr2 and v_nr_extras != v_tmp_lt_r.nr3
                                            and v_nr_extras != v_tmp_lt_r.nr4 and v_nr_extras != v_tmp_lt_r.nr5
                                            and v_nr_extras != v_tmp_lt_r.nr6 and v_nr_extras != v_tmp_lt_r.nr7
                                            and v_nr_extras != v_tmp_lt_r.nr8;
  end loop;
  v_tmp_lt_r.nr9 := v_nr_extras;
  --nr10
  loop
    v_nr_extras := trunc(DBMS_RANDOM.VALUE(1, 49));
    exit when v_nr_extras != v_tmp_lt_r.nr1 and v_nr_extras != v_tmp_lt_r.nr2 and v_nr_extras != v_tmp_lt_r.nr3
                                            and v_nr_extras != v_tmp_lt_r.nr4 and v_nr_extras != v_tmp_lt_r.nr5
                                            and v_nr_extras != v_tmp_lt_r.nr6 and v_nr_extras != v_tmp_lt_r.nr7
                                            and v_nr_extras != v_tmp_lt_r.nr8 and v_nr_extras != v_tmp_lt_r.nr9;
  end loop;
  v_tmp_lt_r.nr10 := v_nr_extras;
  --nr11
  loop
    v_nr_extras := trunc(DBMS_RANDOM.VALUE(1, 49));
    exit when v_nr_extras != v_tmp_lt_r.nr1 and v_nr_extras != v_tmp_lt_r.nr2 and v_nr_extras != v_tmp_lt_r.nr3
                                            and v_nr_extras != v_tmp_lt_r.nr4 and v_nr_extras != v_tmp_lt_r.nr5
                                            and v_nr_extras != v_tmp_lt_r.nr6 and v_nr_extras != v_tmp_lt_r.nr7
                                            and v_nr_extras != v_tmp_lt_r.nr8 and v_nr_extras != v_tmp_lt_r.nr9
                                            and v_nr_extras != v_tmp_lt_r.nr10;
  end loop;
  v_tmp_lt_r.nr11 := v_nr_extras;
  --nr12
  loop
    v_nr_extras := trunc(DBMS_RANDOM.VALUE(1, 49));
    exit when v_nr_extras != v_tmp_lt_r.nr1 and v_nr_extras != v_tmp_lt_r.nr2 and v_nr_extras != v_tmp_lt_r.nr3
                                            and v_nr_extras != v_tmp_lt_r.nr4 and v_nr_extras != v_tmp_lt_r.nr5
                                            and v_nr_extras != v_tmp_lt_r.nr6 and v_nr_extras != v_tmp_lt_r.nr7
                                            and v_nr_extras != v_tmp_lt_r.nr8 and v_nr_extras != v_tmp_lt_r.nr9
                                            and v_nr_extras != v_tmp_lt_r.nr10 and v_nr_extras != v_tmp_lt_r.nr11;
  end loop;
  v_tmp_lt_r.nr12 := v_nr_extras;
  
  insert into ltsys.lt
    (
      id_extr,
      id_sch,
      id_bilet,
      nr1,
      nr2,
      nr3,
      nr4,
      nr5,
      nr6,
      nr7,
      nr8,
      nr9,
      nr10,
      nr11,
      nr12
    )
  values
    (
      v_id_extr,
      v_sch_row.id_sch,
      null,
      v_tmp_lt_r.nr1,
      v_tmp_lt_r.nr2,
      v_tmp_lt_r.nr3,
      v_tmp_lt_r.nr4,
      v_tmp_lt_r.nr5,
      v_tmp_lt_r.nr6,
      v_tmp_lt_r.nr7,
      v_tmp_lt_r.nr8,
      v_tmp_lt_r.nr9,
      v_tmp_lt_r.nr10,
      v_tmp_lt_r.nr11,
      v_tmp_lt_r.nr12
    );
  dbms_output.put_line('id extragere generata: ' || v_id_extr);
  for x in (select * from ltsys.sch_det t where t.id_sch = v_sch_row.id_sch order by t.poz) loop
    v_tmp_lt_r2 := null;
    --
    if x.nr1 = 1 then
      v_tmp_lt_r2.nr1 := v_tmp_lt_r.nr1;
    elsif x.nr1 = 2 then
      v_tmp_lt_r2.nr1 := v_tmp_lt_r.nr2;
    elsif x.nr1 = 3 then
      v_tmp_lt_r2.nr1 := v_tmp_lt_r.nr3;
    elsif x.nr1 = 4 then
      v_tmp_lt_r2.nr1 := v_tmp_lt_r.nr4;
    elsif x.nr1 = 5 then
      v_tmp_lt_r2.nr1 := v_tmp_lt_r.nr5;
    elsif x.nr1 = 6 then
      v_tmp_lt_r2.nr1 := v_tmp_lt_r.nr6;
    elsif x.nr1 = 7 then
      v_tmp_lt_r2.nr1 := v_tmp_lt_r.nr7;
    elsif x.nr1 = 8 then
      v_tmp_lt_r2.nr1 := v_tmp_lt_r.nr8;  
    elsif x.nr1 = 9 then
      v_tmp_lt_r2.nr1 := v_tmp_lt_r.nr9;
    elsif x.nr1 = 10 then
      v_tmp_lt_r2.nr1 := v_tmp_lt_r.nr10;
    elsif x.nr1 = 11 then
      v_tmp_lt_r2.nr1 := v_tmp_lt_r.nr11;
    elsif x.nr1 = 12 then
      v_tmp_lt_r2.nr1 := v_tmp_lt_r.nr12;                 
    end if;
    --
    if x.nr2 = 1 then
      v_tmp_lt_r2.nr2 := v_tmp_lt_r.nr1;
    elsif x.nr2 = 2 then
      v_tmp_lt_r2.nr2 := v_tmp_lt_r.nr2;
    elsif x.nr2 = 3 then
      v_tmp_lt_r2.nr2 := v_tmp_lt_r.nr3;
    elsif x.nr2 = 4 then
      v_tmp_lt_r2.nr2 := v_tmp_lt_r.nr4;
    elsif x.nr2 = 5 then
      v_tmp_lt_r2.nr2 := v_tmp_lt_r.nr5;
    elsif x.nr2 = 6 then
      v_tmp_lt_r2.nr2 := v_tmp_lt_r.nr6;
    elsif x.nr2 = 7 then
      v_tmp_lt_r2.nr2 := v_tmp_lt_r.nr7;
    elsif x.nr2 = 8 then
      v_tmp_lt_r2.nr2 := v_tmp_lt_r.nr8;
    elsif x.nr2 = 9 then
      v_tmp_lt_r2.nr2 := v_tmp_lt_r.nr9;
    elsif x.nr2 = 10 then
      v_tmp_lt_r2.nr2 := v_tmp_lt_r.nr10;
    elsif x.nr2 = 11 then
      v_tmp_lt_r2.nr2 := v_tmp_lt_r.nr11;
    elsif x.nr2 = 12 then
      v_tmp_lt_r2.nr2 := v_tmp_lt_r.nr12;                    
    end if;
    --
    if x.nr3 = 1 then
      v_tmp_lt_r2.nr3 := v_tmp_lt_r.nr1;
    elsif x.nr3 = 2 then
      v_tmp_lt_r2.nr3 := v_tmp_lt_r.nr2;
    elsif x.nr3 = 3 then
      v_tmp_lt_r2.nr3 := v_tmp_lt_r.nr3;
    elsif x.nr3 = 4 then
      v_tmp_lt_r2.nr3 := v_tmp_lt_r.nr4;
    elsif x.nr3 = 5 then
      v_tmp_lt_r2.nr3 := v_tmp_lt_r.nr5;
    elsif x.nr3 = 6 then
      v_tmp_lt_r2.nr3 := v_tmp_lt_r.nr6;
    elsif x.nr3 = 7 then
      v_tmp_lt_r2.nr3 := v_tmp_lt_r.nr7;
    elsif x.nr3 = 8 then
      v_tmp_lt_r2.nr3 := v_tmp_lt_r.nr8;        
    elsif x.nr3 = 9 then
      v_tmp_lt_r2.nr3 := v_tmp_lt_r.nr9;
    elsif x.nr3 = 10 then
      v_tmp_lt_r2.nr3 := v_tmp_lt_r.nr10;
    elsif x.nr3 = 11 then
      v_tmp_lt_r2.nr3 := v_tmp_lt_r.nr11;
    elsif x.nr3 = 12 then
      v_tmp_lt_r2.nr3 := v_tmp_lt_r.nr12;            
    end if;
    --
    if x.nr4 = 1 then
      v_tmp_lt_r2.nr4 := v_tmp_lt_r.nr1;
    elsif x.nr4 = 2 then
      v_tmp_lt_r2.nr4 := v_tmp_lt_r.nr2;
    elsif x.nr4 = 3 then
      v_tmp_lt_r2.nr4 := v_tmp_lt_r.nr3;
    elsif x.nr4 = 4 then
      v_tmp_lt_r2.nr4 := v_tmp_lt_r.nr4;
    elsif x.nr4 = 5 then
      v_tmp_lt_r2.nr4 := v_tmp_lt_r.nr5;
    elsif x.nr4 = 6 then
      v_tmp_lt_r2.nr4 := v_tmp_lt_r.nr6;
    elsif x.nr4 = 7 then
      v_tmp_lt_r2.nr4 := v_tmp_lt_r.nr7;
    elsif x.nr4 = 8 then
      v_tmp_lt_r2.nr4 := v_tmp_lt_r.nr8;
    elsif x.nr4 = 9 then
      v_tmp_lt_r2.nr4 := v_tmp_lt_r.nr9;
    elsif x.nr4 = 10 then
      v_tmp_lt_r2.nr4 := v_tmp_lt_r.nr10;
    elsif x.nr4 = 11 then
      v_tmp_lt_r2.nr4 := v_tmp_lt_r.nr11;
    elsif x.nr4 = 12 then
      v_tmp_lt_r2.nr4 := v_tmp_lt_r.nr12;                    
    end if;
    --
    if x.nr5 = 1 then
      v_tmp_lt_r2.nr5 := v_tmp_lt_r.nr1;
    elsif x.nr5 = 2 then
      v_tmp_lt_r2.nr5 := v_tmp_lt_r.nr2;
    elsif x.nr5 = 3 then
      v_tmp_lt_r2.nr5 := v_tmp_lt_r.nr3;
    elsif x.nr5 = 4 then
      v_tmp_lt_r2.nr5 := v_tmp_lt_r.nr4;
    elsif x.nr5 = 5 then
      v_tmp_lt_r2.nr5 := v_tmp_lt_r.nr5;
    elsif x.nr5 = 6 then
      v_tmp_lt_r2.nr5 := v_tmp_lt_r.nr6;
    elsif x.nr5 = 7 then
      v_tmp_lt_r2.nr5 := v_tmp_lt_r.nr7;
    elsif x.nr5 = 8 then
      v_tmp_lt_r2.nr5 := v_tmp_lt_r.nr8;   
    elsif x.nr5 = 9 then
      v_tmp_lt_r2.nr5 := v_tmp_lt_r.nr9;
    elsif x.nr5 = 10 then
      v_tmp_lt_r2.nr5 := v_tmp_lt_r.nr10;
    elsif x.nr5 = 11 then
      v_tmp_lt_r2.nr5 := v_tmp_lt_r.nr11;
    elsif x.nr5 = 12 then
      v_tmp_lt_r2.nr5 := v_tmp_lt_r.nr12;               
    end if;
    --
    if x.nr6 = 1 then
      v_tmp_lt_r2.nr6 := v_tmp_lt_r.nr1;
    elsif x.nr6 = 2 then
      v_tmp_lt_r2.nr6 := v_tmp_lt_r.nr2;
    elsif x.nr6 = 3 then
      v_tmp_lt_r2.nr6 := v_tmp_lt_r.nr3;
    elsif x.nr6 = 4 then
      v_tmp_lt_r2.nr6 := v_tmp_lt_r.nr4;
    elsif x.nr6 = 5 then
      v_tmp_lt_r2.nr6 := v_tmp_lt_r.nr5;
    elsif x.nr6 = 6 then
      v_tmp_lt_r2.nr6 := v_tmp_lt_r.nr6;
    elsif x.nr6 = 7 then
      v_tmp_lt_r2.nr6 := v_tmp_lt_r.nr7;
    elsif x.nr6 = 8 then
      v_tmp_lt_r2.nr6 := v_tmp_lt_r.nr8;       
    elsif x.nr6 = 9 then
      v_tmp_lt_r2.nr6 := v_tmp_lt_r.nr9;
    elsif x.nr6 = 10 then
      v_tmp_lt_r2.nr6 := v_tmp_lt_r.nr10;
    elsif x.nr6 = 11 then
      v_tmp_lt_r2.nr6 := v_tmp_lt_r.nr11;
    elsif x.nr6 = 12 then
      v_tmp_lt_r2.nr6 := v_tmp_lt_r.nr12;           
    end if;
	
    insert into ltsys.lt
      (
        id_extr,
        id_sch,
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
        v_sch_row.id_sch,
        x.poz,
        v_tmp_lt_r2.nr1,
        v_tmp_lt_r2.nr2,
        v_tmp_lt_r2.nr3,
        v_tmp_lt_r2.nr4,
        v_tmp_lt_r2.nr5,
        v_tmp_lt_r2.nr6
      );
  end loop;

END GEN_BILET_12_NR_JUCATE;

END GEN_BILET_PKG;
