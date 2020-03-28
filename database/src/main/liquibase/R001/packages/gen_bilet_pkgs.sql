CREATE OR REPLACE PACKAGE LTSYS.GEN_BILET_PKG AS 

PROCEDURE GEN_BILET_8_NR_JUCATE
  (
    p_cod_sch ltsys.sch.cod%type
  );

PROCEDURE GEN_BILET_9_NR_JUCATE
  (
    p_cod_sch ltsys.sch.cod%type
  );

PROCEDURE GEN_BILET_10_NR_JUCATE
  (
    p_cod_sch ltsys.sch.cod%type
  );

PROCEDURE GEN_BILET_12_NR_JUCATE
  (
    p_cod_sch ltsys.sch.cod%type
  );

END GEN_BILET_PKG;
