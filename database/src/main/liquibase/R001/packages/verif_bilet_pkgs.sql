CREATE OR REPLACE PACKAGE LTSYS.VERIF_BILET_PKG AS 

PROCEDURE VERIF_BILET_3_NR_CASTIGATOARE
  (
    p_nr_bilete integer,
    p_id_extr integer
  );

PROCEDURE VERIF_BILET_4_NR_CASTIGATOARE
  (
    p_nr_bilete integer,
    p_id_extr integer
  );

PROCEDURE VERIF_BILET_5_NR_CASTIGATOARE
  (
    p_nr_bilete integer,
    p_id_extr integer
  );

END VERIF_BILET_PKG;