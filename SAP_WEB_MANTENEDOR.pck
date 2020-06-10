create or replace package SAP_WEB_MANTENEDOR is

  -- Author  : RPSEBAS
  -- Created : 28-04-2020 19:21:12
  -- Purpose : 
  --
  /* -----------------------------------------------------
  || -----------------------------------------------------
  || P_INSE_COMP_CTABLE: Inserta un comprobante contable
  || -----------------------------------------------------
  */ -----------------------------------------------------
  PROCEDURE P_INSE_COMP_CTABLE(P_COD_COMP_TW    IN  VARCHAR2,
                               P_COD_COMP_SAP   IN  VARCHAR2,
                               P_NOM_COMP       IN  VARCHAR2, 
                               P_RESPALDO       IN  VARCHAR2,
                               P_REVISION       IN  VARCHAR2,
                               P_GRUPO          IN  VARCHAR2,
                               P_DET_GRUPO_SAP  IN  VARCHAR2,
                               P_MCA_CIERRE     IN  VARCHAR2, 
                               P_DET_GRUPO_ANUL IN  VARCHAR2,
                               P_MENSAJE        OUT VARCHAR2);
  /* -----------------------------------------------------
  || -----------------------------------------------------
  || P_OBTN_COMP_CTABLE: Obtiene comprobantes contables
  || -----------------------------------------------------
  */ -----------------------------------------------------
  PROCEDURE P_OBTN_COMP_CTABLE(P_ROWID IN VARCHAR2,P_CURSOR OUT SYS_REFCURSOR);
  /* -----------------------------------------------------
  || -----------------------------------------------------
  || P_ACTU_COMP_CTABLE: Actualiza comprobante contable
  || -----------------------------------------------------
  */ -----------------------------------------------------
  procedure P_ACTU_COMP_CTABLE(P_COD_COMP_TW       in varchar2,
                                  P_COD_COMP_SAP    in varchar2,
                                  P_NOM_COMP        in varchar2,
                                  P_RESPALDO        in varchar2,
                                  P_REVISION        in varchar2,
                                  P_GRUPO           in varchar2,
                                  P_DET_GRUPO_SAP   in varchar2,
                                  P_MCA_CIERRE      in varchar2,
                                  P_GRUPO_ANUL      in varchar2,
                                  P_ROWID           in varchar2,
                                  p_mensaje          out varchar2);
  /* -----------------------------------------------------
  || -----------------------------------------------------
  || P_ELIM_COMP_CTABLE: Elimina comprobante contable
  || -----------------------------------------------------
  */ -----------------------------------------------------
  PROCEDURE P_ELIM_COMP_CTABLE (P_ROWID IN  VARCHAR2,P_MENSAJE OUT VARCHAR2);
  /* -----------------------------------------------------
  || -----------------------------------------------------
  || P_INSE_CTA_CTABLE: Inserta una cuenta contable
  || -----------------------------------------------------
  */ -----------------------------------------------------
  PROCEDURE P_INSE_CTA_CTABLE ( P_CENTRO_COSTO IN VARCHAR2,
                                P_COD_CTA_SAP IN VARCHAR2,
                                P_COD_CTA_TW IN VARCHAR2, 
                                P_CUENTA_ASOCIADA IN VARCHAR2,
                                P_DESCRIPCION IN VARCHAR2,
                                P_GRUPO IN VARCHAR2,
                                P_MCA_EMPLEADO IN VARCHAR2,
                                P_MCA_IVA IN VARCHAR2, 
                                P_MCA_RAMO IN VARCHAR2,
                                P_TIPO_CUENTA IN VARCHAR2, 
                                P_TITULO_DETALLE IN VARCHAR2,
                                P_MENSAJE      OUT VARCHAR2);
  /* -----------------------------------------------------
  || -----------------------------------------------------
  || P_OBTN_CTA_CTABLE: Obtiene cuentas contables
  || -----------------------------------------------------
  */ -----------------------------------------------------
  PROCEDURE P_OBTN_CTA_CTABLE(P_ROWID VARCHAR2,P_CURSOR out SYS_REFCURSOR);
  /* -----------------------------------------------------
  || -----------------------------------------------------
  || P_ACTU_CTA_CTABLE: Actualiza una cuenta contable
  || -----------------------------------------------------
  */ -----------------------------------------------------
  PROCEDURE P_ACTU_CTA_CTABLE(P_CENTRO_COSTO IN VARCHAR2,
                              P_COD_CTA_SAP IN VARCHAR2,
                              P_COD_CTA_TW IN VARCHAR2,
                              P_CUENTA_ASOCIADA IN VARCHAR2,
                              P_DESCRIPCION in varchar2,
                              P_GRUPO IN VARCHAR2,
                              P_MCA_EMPLEADO IN VARCHAR2,
                              P_MCA_IVA IN VARCHAR2,
                              P_MCA_RAMO IN VARCHAR2,
                              P_TIPO_CUENTA IN VARCHAR2,
                              P_TITULO_DETALLE IN VARCHAR2,
                              P_ROWID IN VARCHAR2,
                              P_MENSAJE  OUT VARCHAR2);
  /* -----------------------------------------------------
  || -----------------------------------------------------
  || P_ACTU_CTA_CTABLE: Elimina una cuenta contable
  || -----------------------------------------------------
  */ -----------------------------------------------------
  PROCEDURE P_ELIM_CTA_CTABLE (P_ROWID IN VARCHAR2,P_MENSAJE OUT VARCHAR2);
  /* -----------------------------------------------------
  || -----------------------------------------------------
  || P_INSE_CTA_BANCO: Inserta una cuenta banco
  || -----------------------------------------------------
  */ -----------------------------------------------------
  PROCEDURE P_INSE_CTA_BANCO ( P_CTA_SIMP IN VARCHAR2,
                                P_CTA_CONTABLE IN NUMBER,
                                P_BANCO IN VARCHAR2, 
                                P_MONEDA IN NUMBER,
                                P_CTA_CTE IN NUMBER,
                                P_BK_CUENTA IN VARCHAR2,
                                P_COD_CIA IN NUMBER,
                                P_MENSAJE OUT VARCHAR2);
  /* -----------------------------------------------------
  || -----------------------------------------------------
  || P_OBTN_CTA_BANCO: Obtiene cuentas banco
  || -----------------------------------------------------
  */ -----------------------------------------------------
  PROCEDURE P_OBTN_CTA_BANCO(P_ROWID VARCHAR2,P_CURSOR out SYS_REFCURSOR);
  /* -----------------------------------------------------
  || -----------------------------------------------------
  || P_ACTU_CTA_BANCO: Actualiza una cuenta banco
  || -----------------------------------------------------
  */ -----------------------------------------------------
  PROCEDURE P_ACTU_CTA_BANCO(P_CTA_SIMP in varchar2,
                              P_CTA_CONTABLE IN NUMBER,
                              P_BANCO in varchar2,
                              P_CUENTA_SAP in NUMBER,
                              P_MONEDA in NUMBER,
                              P_CTA_CTE in NUMBER,
                              P_BK_CUENTA in varchar2,
                              P_COD_CIA in NUMBER,
                              P_ROWID in varchar2,
                              P_MENSAJE out varchar2);
  /* -----------------------------------------------------
  || -----------------------------------------------------
  || P_ELIM_CTA_BANCO: Elimina una cuenta banco
  || -----------------------------------------------------
  */ -----------------------------------------------------
  PROCEDURE P_ELIM_CTA_BANCO(P_ROWID IN VARCHAR2,P_MENSAJE OUT VARCHAR2);
  /* -----------------------------------------------------
  || -----------------------------------------------------
  || P_INSE_RAMO_CTABLE: Inserta ramo contable
  || -----------------------------------------------------
  */ -----------------------------------------------------
  PROCEDURE P_INSE_RAMO_CTABLE (P_COD_RAMO_CTABLE_TW IN  NUMBER,
                               P_COD_RAMO_CTABLE_SAP IN  VARCHAR2,
                               P_NOM_RAMO            IN  VARCHAR2,
                               P_MENSAJE             OUT VARCHAR2);
  /* -----------------------------------------------------
  || -----------------------------------------------------
  || P_OBTN_RAMO_CTABLE: Obtiene ramos contable
  || -----------------------------------------------------
  */ -----------------------------------------------------
  PROCEDURE P_OBTN_RAMO_CTABLE(P_COD_RAMO_CTABLE_TW IN  NUMBER,
                               P_CURSOR             OUT SYS_REFCURSOR);
  /* -----------------------------------------------------
  || -----------------------------------------------------
  || P_ACTU_RAMO_CTABLE: Actualiza ramo contable
  || -----------------------------------------------------
  */ -----------------------------------------------------
  PROCEDURE P_ACTU_RAMO_CTABLE(P_COD_RAMO_CTABLE_TW  IN  NUMBER,
                               P_COD_RAMO_CTABLE_SAP IN  VARCHAR2,
                               P_NOM_RAMO            IN  VARCHAR2,
                               P_MENSAJE             OUT VARCHAR2);
  /* -----------------------------------------------------
  || -----------------------------------------------------
  || P_ELIM_RAMO_CTABLE: Elimina ramo contable
  || -----------------------------------------------------
  */ -----------------------------------------------------
  PROCEDURE P_ELIM_RAMO_CTABLE (P_COD_RAMO_CTABLE_TW IN  NUMBER,
                                P_MENSAJE            OUT VARCHAR2);
  /* -----------------------------------------------------
  || -----------------------------------------------------
  || P_INSE_CTRO_COSTO: Inserta un centro de costo
  || -----------------------------------------------------
  */ -----------------------------------------------------
  PROCEDURE P_INSE_CTRO_COSTO(P_COD_CCOSTO IN  NUMBER,
                              P_NOM_CCOSTO IN  VARCHAR2,
                              P_MENSAJE    OUT VARCHAR2);
  /* -----------------------------------------------------
  || -----------------------------------------------------
  || P_OBTN_CTRO_COSTO: Obtiene centros de costo
  || -----------------------------------------------------
  */ -----------------------------------------------------
  PROCEDURE P_OBTN_CTRO_COSTO(P_COD_CCOSTO IN  NUMBER,
                              P_CURSOR     OUT SYS_REFCURSOR);
  /* -----------------------------------------------------
  || -----------------------------------------------------
  || P_ACTU_CTRO_COSTO: Actualiza un centro de costo
  || -----------------------------------------------------
  */ -----------------------------------------------------
  PROCEDURE P_ACTU_CTRO_COSTO(P_COD_CCOSTO IN  NUMBER,
                              P_NOM_CCOSTO IN  VARCHAR2,
                              P_MENSAJE    OUT VARCHAR2);
  /* -----------------------------------------------------
  || -----------------------------------------------------
  || P_ELIM_CTRO_COSTO: Elimina un centro de costo
  || -----------------------------------------------------
  */ -----------------------------------------------------
  PROCEDURE P_ELIM_CTRO_COSTO (P_COD_CCOSTO IN  NUMBER,
                               P_MENSAJE    OUT VARCHAR2);
  /* -----------------------------------------------------
  || -----------------------------------------------------
  || P_INSE_MONEDA: Inserta una moneda
  || -----------------------------------------------------
  */ -----------------------------------------------------
  PROCEDURE P_INSE_MONEDA (P_COD_MON_TW  IN  NUMBER,
                           P_NOM_MONEDA  IN  VARCHAR2,
                           P_COD_MON_ISO IN  VARCHAR2, 
                           P_COD_MON_SAP IN  VARCHAR2,
                           P_MCA_PROPIA  IN  VARCHAR2,
                           P_MENSAJE     OUT VARCHAR2);
  /* -----------------------------------------------------
  || -----------------------------------------------------
  || P_OBTN_MONEDA: Obtiene monedas
  || -----------------------------------------------------
  */ -----------------------------------------------------
  PROCEDURE P_OBTN_MONEDA(P_ROWID  in  VARCHAR2,
                          P_CURSOR out SYS_REFCURSOR);
  /* -----------------------------------------------------
  || -----------------------------------------------------
  || P_ACTU_MONEDA: Actualiza moneda
  || -----------------------------------------------------
  */ -----------------------------------------------------
  PROCEDURE P_ACTU_MONEDA(P_COD_MON_TW  IN  NUMBER,
                          P_NOM_MONEDA  IN  VARCHAR2,
                          P_COD_MON_ISO IN  VARCHAR2, 
                          P_COD_MON_SAP IN  VARCHAR2,
                          P_MCA_PROPIA  IN  VARCHAR2,
                          P_ROWID       IN  VARCHAR2,
                          P_MENSAJE     OUT varchar2);
  /* -----------------------------------------------------
  || -----------------------------------------------------
  || P_ELIM_MONEDA: Elimina moneda
  || -----------------------------------------------------
  */ -----------------------------------------------------
  PROCEDURE P_ELIM_MONEDA (P_ROWID   IN  VARCHAR2,
                           P_MENSAJE OUT VARCHAR2);
end SAP_WEB_MANTENEDOR;
/
create or replace package body SAP_WEB_MANTENEDOR is
  /* -----------------------------------------------------
  || -----------------------------------------------------
  || P_INSE_COMP_CTABLE: Inserta un comprobante contable
  || -----------------------------------------------------
  */ -----------------------------------------------------
  PROCEDURE P_INSE_COMP_CTABLE(P_COD_COMP_TW    IN  VARCHAR2,
                               P_COD_COMP_SAP   IN  VARCHAR2,
                               P_NOM_COMP       IN  VARCHAR2, 
                               P_RESPALDO       IN  VARCHAR2,
                               P_REVISION       IN  VARCHAR2,
                               P_GRUPO          IN  VARCHAR2,
                               P_DET_GRUPO_SAP  IN  VARCHAR2,
                               P_MCA_CIERRE     IN  VARCHAR2, 
                               P_DET_GRUPO_ANUL IN  VARCHAR2,
                               P_MENSAJE        OUT VARCHAR2) IS
    --
    l_count NUMERIC;
    --
  BEGIN
    --
    l_count := 0;
    --
    SELECT COUNT(*) INTO l_count FROM SAP.dim_sap_codigo_asiento_bk@SAP 
    WHERE COD_COMP_SAP = P_COD_COMP_SAP 
    AND COD_COMP_TW = P_COD_COMP_TW;
    --
    IF l_count = 0 THEN
      --
      INSERT INTO SAP.dim_sap_codigo_asiento_bk@SAP 
      ( COD_COMP_TW,
        COD_COMP_SAP, 
        NOM_COMP,
        RESPALDO,
        REVISION,
        GRUPO,
        DET_GRUPO_SAP,
        MCA_CIERRE,
        DET_GRUPO_ANUL
        )VALUES(       
        P_COD_COMP_TW,
        P_COD_COMP_SAP, 
        P_NOM_COMP,
        P_RESPALDO,
        P_REVISION,
        P_GRUPO,
        P_DET_GRUPO_SAP,
        P_MCA_CIERRE,
        P_DET_GRUPO_ANUL
      );
      --    
      P_MENSAJE:='OK';
      --    
      COMMIT;
      --
    ELSE
      --
      P_MENSAJE :='YA EXISTE COMPROBANTE';
      --
    END IF;
    --
  EXCEPTION
    WHEN OTHERS THEN
      --
      ROLLBACK;
      --
      P_MENSAJE :='ERROR EN SP: P_INSE_COMP_CTABLE';
      --
  END P_INSE_COMP_CTABLE;
  /* -----------------------------------------------------
  || -----------------------------------------------------
  || P_OBTN_COMP_CTABLE: Obtiene comprobantes contables
  || -----------------------------------------------------
  */ -----------------------------------------------------
  PROCEDURE P_OBTN_COMP_CTABLE(P_ROWID  IN  VARCHAR2,
                               P_CURSOR OUT SYS_REFCURSOR) as
    --
  BEGIN
    --
  IF P_ROWID IS NULL OR P_ROWID ='' THEN
    --
    OPEN P_CURSOR for
      select rowid, a.* from SAP.dim_sap_codigo_asiento_bk@SAP a;
    COMMIT;
    --
   ELSE
     --
     OPEN P_CURSOR for
      select rowid, a.* from SAP.dim_sap_codigo_asiento_bk@SAP a
      WHERE a.rowid = P_ROWID;
     COMMIT;
     --
  END IF;
  --
  END P_OBTN_COMP_CTABLE;
  /* -----------------------------------------------------
  || -----------------------------------------------------
  || P_ACTU_COMP_CTABLE: Actualiza comprobante contable
  || -----------------------------------------------------
  */ -----------------------------------------------------
  procedure P_ACTU_COMP_CTABLE(P_COD_COMP_TW     in varchar2,
                               P_COD_COMP_SAP    in varchar2,
                               P_NOM_COMP        in varchar2,
                               P_RESPALDO        in varchar2,
                               P_REVISION        in varchar2,
                               P_GRUPO           in varchar2,
                               P_DET_GRUPO_SAP   in varchar2,
                               P_MCA_CIERRE      in varchar2,
                               P_GRUPO_ANUL      in varchar2,
                               P_ROWID           in varchar2,
                               p_mensaje         out varchar2) as
  
   BEGIN
   
      UPDATE 
        SAP.dim_sap_codigo_asiento_bk@SAP 
      SET
          COD_COMP_TW = P_COD_COMP_TW,
          COD_COMP_SAP = P_COD_COMP_SAP,
          NOM_COMP     = P_NOM_COMP,
          RESPALDO     = P_RESPALDO,
          REVISION     = P_REVISION,
          GRUPO        = P_GRUPO,
          DET_GRUPO_SAP = P_DET_GRUPO_SAP,
          MCA_CIERRE = P_MCA_CIERRE,
          DET_GRUPO_ANUL = P_GRUPO_ANUL
        WHERE 
          ROWID = P_ROWID;
        p_mensaje:='OK';
        COMMIT;
 
   exception
    when others then
      --
      rollback;
      p_mensaje:='ERROR';
      --
  end P_ACTU_COMP_CTABLE;
  /* -----------------------------------------------------
  || -----------------------------------------------------
  || P_ELIM_COMP_CTABLE: Elimina comprobante contable
  || -----------------------------------------------------
  */ -----------------------------------------------------
  PROCEDURE P_ELIM_COMP_CTABLE (P_ROWID   IN VARCHAR2,
                                P_MENSAJE OUT VARCHAR2) IS
  BEGIN
    --
    DELETE sap.dim_sap_codigo_asiento_bk@SAP
     WHERE ROWID = P_ROWID;
    --
    P_MENSAJE:='OK';
    --
    COMMIT;
    --
  exception
    when others then
      --
      rollback;
      P_MENSAJE:='ERROR';
      --
  END P_ELIM_COMP_CTABLE;
  --
  /* -----------------------------------------------------
  || -----------------------------------------------------
  || P_INSE_CTA_CTABLE: Inserta una cuenta contable
  || -----------------------------------------------------
  */ -----------------------------------------------------
  PROCEDURE P_INSE_CTA_CTABLE ( P_CENTRO_COSTO    IN  VARCHAR2,
                                P_COD_CTA_SAP     IN  VARCHAR2,
                                P_COD_CTA_TW      IN  VARCHAR2, 
                                P_CUENTA_ASOCIADA IN  VARCHAR2,
                                P_DESCRIPCION     IN  VARCHAR2,
                                P_GRUPO           IN  VARCHAR2,
                                P_MCA_EMPLEADO    IN  VARCHAR2,
                                P_MCA_IVA         IN  VARCHAR2, 
                                P_MCA_RAMO        IN  VARCHAR2,
                                P_TIPO_CUENTA     IN  VARCHAR2, 
                                P_TITULO_DETALLE  IN  VARCHAR2,
                                P_MENSAJE         OUT VARCHAR2) IS
                                
                                                   
  --                             
  l_count NUMERIC;
  --
  BEGIN
    --
    l_count :=0;
    --
    SELECT COUNT(*) INTO l_count FROM SAP.dim_sap_cuenta_contable_bk@SAP WHERE COD_CTA_SAP = P_COD_CTA_SAP AND COD_CTA_TW = P_COD_CTA_TW;
    --
    IF l_count = 0 THEN
        --
        INSERT INTO SAP.dim_sap_cuenta_contable_bk@SAP(
          CENTRO_COSTO,
          COD_CTA_SAP,
          COD_CTA_TW,
          CUENTA_ASOCIADA,
          DESCRIPCION,
          GRUPO,
          MCA_EMPLEADO,
          MCA_IVA,
          MCA_RAMO,
          TIPO_CUENTA,
          TITULO_DETALLE) 
          VALUES(
          P_CENTRO_COSTO,
          P_COD_CTA_SAP,
          P_COD_CTA_TW, 
          P_CUENTA_ASOCIADA,
          P_DESCRIPCION,
          P_GRUPO,
          P_MCA_EMPLEADO,
          P_MCA_IVA, 
          P_MCA_RAMO,
          P_TIPO_CUENTA, 
          P_TITULO_DETALLE 
          );
          --
          P_MENSAJE:='OK';
          --
          COMMIT;
    ELSE
       P_MENSAJE:='P_COD_CTA_SAP y P_COD_CTA_TW ya existen';
    END IF;
    --
  EXCEPTION
    WHEN OTHERS THEN
    --
    ROLLBACK;
    --
    P_MENSAJE :='ERROR EN SP: P_INSE_CTA_CTABLE';
    --
  END P_INSE_CTA_CTABLE;
  /* -----------------------------------------------------
  || -----------------------------------------------------
  || P_OBTN_CTA_CTABLE: Obtiene cuentas contables
  || -----------------------------------------------------
  */ -----------------------------------------------------
  PROCEDURE P_OBTN_CTA_CTABLE(P_ROWID  IN  VARCHAR2,
                              P_CURSOR OUT SYS_REFCURSOR) AS
  BEGIN
    --
    IF P_ROWID IS NULL OR P_ROWID ='' THEN
      --
      OPEN P_CURSOR FOR
           SELECT rowid,a.* FROM SAP.dim_sap_cuenta_contable_bk@SAP a;
      COMMIT;
      --
    ELSE
      --
      OPEN P_CURSOR FOR
           SELECT rowid,a.* FROM SAP.dim_sap_cuenta_contable_bk@SAP a
           WHERE a.ROWID = p_rowid;
      COMMIT;
      --
    END IF;
    --
  END P_OBTN_CTA_CTABLE;
  /* -----------------------------------------------------
  || -----------------------------------------------------
  || P_ACTU_CTA_CTABLE: Actualiza una cuenta contable
  || -----------------------------------------------------
  */ -----------------------------------------------------
  PROCEDURE P_ACTU_CTA_CTABLE(P_CENTRO_COSTO    IN  VARCHAR2,
                              P_COD_CTA_SAP     IN  VARCHAR2,
                              P_COD_CTA_TW      IN  VARCHAR2,
                              P_CUENTA_ASOCIADA IN  VARCHAR2,
                              P_DESCRIPCION     IN  VARCHAR2,
                              P_GRUPO           IN  VARCHAR2,
                              P_MCA_EMPLEADO    IN  VARCHAR2,
                              P_MCA_IVA         IN  VARCHAR2,
                              P_MCA_RAMO        IN  VARCHAR2,
                              P_TIPO_CUENTA     IN  VARCHAR2,
                              P_TITULO_DETALLE  IN  VARCHAR2,
                              P_ROWID           IN  VARCHAR2,
                              P_MENSAJE         OUT VARCHAR2) AS
    BEGIN
        UPDATE 
          SAP.dim_sap_cuenta_contable_bk@SAP 
        SET
            CENTRO_COSTO = P_CENTRO_COSTO,
            COD_CTA_SAP = P_COD_CTA_SAP,
            COD_CTA_TW = P_COD_CTA_TW,
            CUENTA_ASOCIADA = P_CUENTA_ASOCIADA,
            DESCRIPCION = P_DESCRIPCION,
            GRUPO = P_GRUPO,
            MCA_EMPLEADO = P_MCA_EMPLEADO,
            MCA_IVA = P_MCA_IVA, 
            MCA_RAMO = P_MCA_RAMO, 
            TIPO_CUENTA = P_TIPO_CUENTA,
            TITULO_DETALLE = P_TITULO_DETALLE
          WHERE 
            ROWID = P_ROWID;
          P_MENSAJE:='OK';
      COMMIT;
   
    EXCEPTION
    when others then
      --
      rollback;
      P_MENSAJE:='ERROR';
      --
  end P_ACTU_CTA_CTABLE;
  /* -----------------------------------------------------
  || -----------------------------------------------------
  || P_ACTU_CTA_CTABLE: Elimina una cuenta contable
  || -----------------------------------------------------
  */ -----------------------------------------------------
  PROCEDURE P_ELIM_CTA_CTABLE (P_ROWID   IN  VARCHAR2,
                               P_MENSAJE OUT VARCHAR2) IS
  BEGIN
    --
    DELETE sap.dim_sap_cuenta_contable_bk@SAP
     WHERE ROWID = P_ROWID;
    --
    P_MENSAJE:='OK';
    --
    COMMIT;
    --
  exception
    when others then
      --
      rollback;
      P_MENSAJE:='ERROR';
      --
  END P_ELIM_CTA_CTABLE;
  /* -----------------------------------------------------
  || -----------------------------------------------------
  || P_INSE_CTA_BANCO: Inserta una cuenta banco
  || -----------------------------------------------------
  */ -----------------------------------------------------
  PROCEDURE P_INSE_CTA_BANCO ( P_CTA_SIMP      IN  VARCHAR2,
                                P_CTA_CONTABLE IN  NUMBER,
                                P_BANCO        IN  VARCHAR2, 
                                P_MONEDA       IN  NUMBER,
                                P_CTA_CTE      IN  NUMBER,
                                P_BK_CUENTA    IN  VARCHAR2,
                                P_COD_CIA      IN  NUMBER,
                                P_MENSAJE      OUT VARCHAR2) IS
   
    l_count NUMERIC;
    --
    BEGIN
      --
      l_count :=0;
      --
      SELECT COUNT(*) INTO l_count FROM SAP.dim_sap_cta_banco_pos_bk@SAP 
      WHERE 
      CTA_SIMP = P_CTA_SIMP AND 
      CTA_CONTABLE = P_CTA_CONTABLE AND
      BANCO = P_BANCO AND
      MONEDA = P_MONEDA AND
      CTA_CTE = P_CTA_CTE AND
      BK_CUENTA = P_BK_CUENTA AND
      COD_CIA = P_COD_CIA;
     
    IF l_count = 0 THEN
      --
      INSERT INTO SAP.dim_sap_cta_banco_pos_bk@SAP 
      (CTA_SIMP, 
      CTA_CONTABLE, 
      BANCO,
      MONEDA, 
      CTA_CTE, 
      BK_CUENTA, 
      COD_CIA
      )
      VALUES 
      (P_CTA_SIMP,
      P_CTA_CONTABLE,
      P_BANCO,
      P_MONEDA,
      P_CTA_CTE,
      P_BK_CUENTA,
      P_COD_CIA);
      COMMIT;
      --
      P_MENSAJE:='OK';
      --
    ELSE
      --
      P_MENSAJE:='YA EXISTE CUENTA BANCO';
      --
    END IF;
  exception
    when others then
      --
      rollback;
      P_MENSAJE:='ERROR';
      --
  END P_INSE_CTA_BANCO;
  /* -----------------------------------------------------
  || -----------------------------------------------------
  || P_OBTN_CTA_BANCO: Obtiene cuentas banco
  || -----------------------------------------------------
  */ -----------------------------------------------------
  PROCEDURE P_OBTN_CTA_BANCO(P_ROWID  IN  VARCHAR2,
                             P_CURSOR out SYS_REFCURSOR) AS
  --
  BEGIN
    --
    IF P_ROWID IS NULL OR P_ROWID ='' THEN
      --
      OPEN P_CURSOR for
        SELECT rowid,a.* FROM SAP.dim_sap_cta_banco_pos_bk@SAP a;
      COMMIT;
      --
    ELSE
      --
      OPEN P_CURSOR for
      SELECT rowid,a.* FROM SAP.dim_sap_cta_banco_pos_bk@SAP a
      WHERE a.ROWID = p_rowid;
      COMMIT;
      --
    END IF;
    --
  END P_OBTN_CTA_BANCO;
  /* -----------------------------------------------------
  || -----------------------------------------------------
  || P_ACTU_CTA_BANCO: Actualiza una cuenta banco
  || -----------------------------------------------------
  */ -----------------------------------------------------
  PROCEDURE P_ACTU_CTA_BANCO(P_CTA_SIMP     in  varchar2,
                             P_CTA_CONTABLE IN  NUMBER,
                             P_BANCO        in  varchar2,
                             P_CUENTA_SAP   in  NUMBER,
                             P_MONEDA       in  NUMBER,
                             P_CTA_CTE      in  NUMBER,
                             P_BK_CUENTA    in  varchar2,
                             P_COD_CIA      in  NUMBER,
                             P_ROWID        in  varchar2,
                             P_MENSAJE      out varchar2) as
                                      
   BEGIN    
     --        
     UPDATE SAP.dim_sap_cta_banco_pos_bk@SAP
      SET
        CTA_SIMP = P_CTA_SIMP,
        CTA_CONTABLE = P_CTA_CONTABLE,
        BANCO = P_BANCO,
        CUENTA_SAP = P_CUENTA_SAP,
        MONEDA = P_MONEDA,
        CTA_CTE = P_CTA_CTE,
        BK_CUENTA = P_BK_CUENTA,
        COD_CIA =P_COD_CIA
      WHERE ROWID =P_ROWID;
        P_MENSAJE:='OK';
      COMMIT;
      --
  EXCEPTION
    WHEN OTHERS THEN
      --
      rollback;
      P_MENSAJE:='ERROR';
      --
  end P_ACTU_CTA_BANCO;
  /* -----------------------------------------------------
  || -----------------------------------------------------
  || P_ELIM_CTA_BANCO: Elimina una cuenta banco
  || -----------------------------------------------------
  */ -----------------------------------------------------
  PROCEDURE P_ELIM_CTA_BANCO(P_ROWID   IN  VARCHAR2,
                             P_MENSAJE OUT VARCHAR2) IS
  BEGIN
    --
    DELETE sap.dim_sap_cta_banco_pos_bk@SAP
     WHERE ROWID = P_ROWID;
    --
    P_MENSAJE:='OK';
    --
    COMMIT;
    --
  exception
    when others then
      --
      rollback;
      P_MENSAJE:='ERROR';
      --
  END P_ELIM_CTA_BANCO;
  /* -----------------------------------------------------
  || -----------------------------------------------------
  || P_INSE_RAMO_CTABLE: Inserta ramo contable
  || -----------------------------------------------------
  */ -----------------------------------------------------
  PROCEDURE P_INSE_RAMO_CTABLE (P_COD_RAMO_CTABLE_TW IN  NUMBER,
                               P_COD_RAMO_CTABLE_SAP IN  VARCHAR2,
                               P_NOM_RAMO            IN  VARCHAR2,
                               P_MENSAJE             OUT VARCHAR2) IS
  
   v_count PLS_INTEGER := 0;
  BEGIN
    SELECT COUNT(*) INTO v_count FROM SAP.dim_sap_ramo_contable_bk@SAP WHERE COD_RAMO_CTABLE_TW = P_COD_RAMO_CTABLE_TW;
    IF v_count = 0 THEN
    --
    INSERT INTO SAP.dim_sap_ramo_contable_bk@SAP(
      COD_RAMO_CTABLE_TW,
      COD_RAMO_CTABLE_SAP,
      NOM_RAMO
      ) 
      VALUES
      (
      P_COD_RAMO_CTABLE_TW,
      P_COD_RAMO_CTABLE_SAP,
      P_NOM_RAMO
      );
    --
    P_MENSAJE:='OK';
    --
    COMMIT;
    ELSE
      P_MENSAJE:='RAMO CONTABLE YA EXISTE';
    END IF;
    --
  exception
    when others then
      --
      rollback;
      P_MENSAJE:='ERROR';
      --
  END P_INSE_RAMO_CTABLE;
  /* -----------------------------------------------------
  || -----------------------------------------------------
  || P_OBTN_RAMO_CTABLE: Obtiene ramos contable
  || -----------------------------------------------------
  */ -----------------------------------------------------
  PROCEDURE P_OBTN_RAMO_CTABLE(P_COD_RAMO_CTABLE_TW IN  NUMBER,
                               P_CURSOR             OUT SYS_REFCURSOR) AS
  BEGIN
    IF P_COD_RAMO_CTABLE_TW IS NULL OR P_COD_RAMO_CTABLE_TW =0 THEN
      --
      OPEN P_CURSOR FOR
      SELECT rowid,a.* FROM SAP.dim_sap_ramo_contable_bk@SAP a;
      COMMIT;
      --
    ELSE
      --
      OPEN P_CURSOR FOR
      SELECT rowid,a.* FROM SAP.dim_sap_ramo_contable_bk@SAP a
      WHERE a.COD_RAMO_CTABLE_TW = P_COD_RAMO_CTABLE_TW;
      COMMIT;
      --
    END IF;
  END P_OBTN_RAMO_CTABLE;
  /* -----------------------------------------------------
  || -----------------------------------------------------
  || P_ACTU_RAMO_CTABLE: Actualiza ramo contable
  || -----------------------------------------------------
  */ -----------------------------------------------------
  PROCEDURE P_ACTU_RAMO_CTABLE(P_COD_RAMO_CTABLE_TW  IN  NUMBER,
                               P_COD_RAMO_CTABLE_SAP IN  VARCHAR2,
                               P_NOM_RAMO            IN  VARCHAR2,
                               P_MENSAJE             OUT VARCHAR2) AS
    
  BEGIN

    UPDATE 
      SAP.dim_sap_ramo_contable_bk@SAP 
    SET
      COD_RAMO_CTABLE_TW = P_COD_RAMO_CTABLE_TW,
      COD_RAMO_CTABLE_SAP = P_COD_RAMO_CTABLE_SAP,
      NOM_RAMO     = P_NOM_RAMO
    WHERE 
      COD_RAMO_CTABLE_TW = P_COD_RAMO_CTABLE_TW;
      p_mensaje:='OK';
      COMMIT;
    
    EXCEPTION
    when others then
      --
      rollback;
      p_mensaje:='ERROR';
      --
  end P_ACTU_RAMO_CTABLE;
  /* -----------------------------------------------------
  || -----------------------------------------------------
  || P_ELIM_RAMO_CTABLE: Elimina ramo contable
  || -----------------------------------------------------
  */ -----------------------------------------------------
  PROCEDURE P_ELIM_RAMO_CTABLE (P_COD_RAMO_CTABLE_TW IN  NUMBER,
                                P_MENSAJE            OUT VARCHAR2) IS
  BEGIN
    --
    DELETE sap.dim_sap_ramo_contable_bk@SAP
     WHERE COD_RAMO_CTABLE_TW = P_COD_RAMO_CTABLE_TW;
    --
    P_MENSAJE:='OK';
    --
    COMMIT;
    --
  exception
    when others then
      --
      rollback;
      P_MENSAJE:='ERROR';
      --
  END P_ELIM_RAMO_CTABLE;
  /* -----------------------------------------------------
  || -----------------------------------------------------
  || P_INSE_CTRO_COSTO: Inserta un centro de costo
  || -----------------------------------------------------
  */ -----------------------------------------------------
  PROCEDURE P_INSE_CTRO_COSTO(P_COD_CCOSTO IN  NUMBER,
                              P_NOM_CCOSTO IN  VARCHAR2,
                              P_MENSAJE    OUT VARCHAR2) IS
    --
    v_count PLS_INTEGER := 0;
    --
  BEGIN
    --
    SELECT COUNT(*) INTO v_count FROM SAP.dim_sap_centro_costo_bk@SAP WHERE COD_CCOSTO = P_COD_CCOSTO AND NOM_CCOSTO = P_NOM_CCOSTO;
    IF v_count = 0 THEN
    --
    INSERT INTO SAP.dim_sap_centro_costo_bk@SAP(
      COD_CCOSTO,
      NOM_CCOSTO
      ) 
      VALUES(
      P_COD_CCOSTO,
      P_NOM_CCOSTO
      );
    --
    P_MENSAJE:='OK';
    --
    COMMIT;
    ELSE
       P_MENSAJE:='CENTRO DE COSTA YA EXISTE';
       END IF;
    --
  exception
    when others then
      --
      rollback;
      P_MENSAJE:='ERROR';
      --
  END P_INSE_CTRO_COSTO;
  /* -----------------------------------------------------
  || -----------------------------------------------------
  || P_OBTN_CTRO_COSTO: Obtiene centros de costo
  || -----------------------------------------------------
  */ -----------------------------------------------------
  PROCEDURE P_OBTN_CTRO_COSTO(P_COD_CCOSTO IN  NUMBER,
                              P_CURSOR     OUT SYS_REFCURSOR) as
  BEGIN
    --
    IF P_COD_CCOSTO IS NULL OR P_COD_CCOSTO = 0 THEN
      --
      OPEN P_CURSOR FOR
      SELECT rowid,a.* FROM SAP.dim_sap_centro_costo_bk@SAP a;
      COMMIT;
      --
     ELSE
       --
       OPEN P_CURSOR FOR
       SELECT rowid,a.* FROM SAP.dim_sap_centro_costo_bk@SAP a
       WHERE a.COD_CCOSTO = P_COD_CCOSTO;
       COMMIT;
       --
      END IF;
  END P_OBTN_CTRO_COSTO;
  /* -----------------------------------------------------
  || -----------------------------------------------------
  || P_ACTU_CTRO_COSTO: Actualiza un centro de costo
  || -----------------------------------------------------
  */ -----------------------------------------------------
  PROCEDURE P_ACTU_CTRO_COSTO(P_COD_CCOSTO IN  NUMBER,
                              P_NOM_CCOSTO IN  VARCHAR2,
                              P_MENSAJE    OUT VARCHAR2) AS
    --
    l_count NUMERIC;
    --
  BEGIN
    l_count :=0;
    -- SI YA EXISTE NO DEBE ACTUALIZAR Y NO DEBE CREARSE
    SELECT COUNT(*) INTO l_count FROM SAP.dim_sap_centro_costo_bk@SAP WHERE COD_CCOSTO = P_COD_CCOSTO AND NOM_CCOSTO = P_NOM_CCOSTO;
    --
    IF l_count = 0 THEN
      --
      UPDATE SAP.dim_sap_centro_costo_bk@SAP 
      SET
      NOM_CCOSTO = P_NOM_CCOSTO
      WHERE 
      P_COD_CCOSTO = P_COD_CCOSTO;
      P_MENSAJE:='OK';
      COMMIT;
      --
     ELSE
       --
       P_MENSAJE:='YA EXISTE CENTRO DE COSTO';
       --
     END IF;
     --
    exception
    when others then
      --
      rollback;
      p_mensaje:='ERROR';
      --
  END P_ACTU_CTRO_COSTO;
  /* -----------------------------------------------------
  || -----------------------------------------------------
  || P_ELIM_CTRO_COSTO: Elimina un centro de costo
  || -----------------------------------------------------
  */ -----------------------------------------------------
  PROCEDURE P_ELIM_CTRO_COSTO (P_COD_CCOSTO IN  NUMBER,
                               P_MENSAJE    OUT VARCHAR2) IS
  BEGIN
    --
    DELETE sap.dim_sap_centro_costo_bk@SAP
     WHERE COD_CCOSTO = P_COD_CCOSTO;
    --
    P_MENSAJE:='OK';
    --
    COMMIT;
    --
  exception
    when others then
      --
      rollback;
      P_MENSAJE:='ERROR';
      --
  END P_ELIM_CTRO_COSTO;
  /* -----------------------------------------------------
  || -----------------------------------------------------
  || P_INSE_MONEDA: Inserta una moneda
  || -----------------------------------------------------
  */ -----------------------------------------------------
  PROCEDURE P_INSE_MONEDA (P_COD_MON_TW  IN  NUMBER,
                           P_NOM_MONEDA  IN  VARCHAR2,
                           P_COD_MON_ISO IN  VARCHAR2, 
                           P_COD_MON_SAP IN  VARCHAR2,
                           P_MCA_PROPIA  IN  VARCHAR2,
                           P_MENSAJE     OUT VARCHAR2) IS
  BEGIN
    --
    INSERT INTO SAP.dim_sap_moneda_bk@SAP(
      COD_MON_TW,
      NOM_MONEDA,
      COD_MON_ISO,
      COD_MON_SAP,
      MCA_PROPIA
      ) 
      VALUES(
      P_COD_MON_TW,
      P_NOM_MONEDA,
      P_COD_MON_ISO,
      P_COD_MON_SAP,
      P_MCA_PROPIA
      );
    --
    P_MENSAJE:='OK';
    --
    COMMIT;
    --
  exception
    when others then
      --
      rollback;
      P_MENSAJE:='ERROR';
      --
  END P_INSE_MONEDA;
  /* -----------------------------------------------------
  || -----------------------------------------------------
  || P_OBTN_MONEDA: Obtiene monedas
  || -----------------------------------------------------
  */ -----------------------------------------------------
  PROCEDURE P_OBTN_MONEDA(P_ROWID  in  VARCHAR2,
                          P_CURSOR out SYS_REFCURSOR) IS
    --
  BEGIN
    --
    IF P_ROWID IS NULL OR P_ROWID ='' THEN
      --
      OPEN P_CURSOR for
           SELECT rowid,a.* FROM SAP.dim_sap_moneda_bk@SAP a;
      COMMIT;
      --
    ELSE
      --
      OPEN P_CURSOR FOR
           SELECT rowid, a.* FROM SAP.dim_sap_moneda_bk@SAP a
           WHERE a.ROWID = p_rowid;
      COMMIT;
      --
    END IF;
   
  END P_OBTN_MONEDA;
  /* -----------------------------------------------------
  || -----------------------------------------------------
  || P_ACTU_MONEDA: Actualiza moneda
  || -----------------------------------------------------
  */ -----------------------------------------------------
  PROCEDURE P_ACTU_MONEDA(P_COD_MON_TW  IN  NUMBER,
                          P_NOM_MONEDA  IN  VARCHAR2,
                          P_COD_MON_ISO IN  VARCHAR2, 
                          P_COD_MON_SAP IN  VARCHAR2,
                          P_MCA_PROPIA  IN  VARCHAR2,
                          P_ROWID       IN  VARCHAR2,
                          P_MENSAJE     OUT varchar2) IS
    begin
    UPDATE 
      SAP.dim_sap_moneda_bk@SAP 
    SET
      COD_MON_TW = P_COD_MON_TW,
      NOM_MONEDA = P_NOM_MONEDA,
      COD_MON_ISO = P_COD_MON_ISO,
      COD_MON_SAP = P_COD_MON_SAP,
      MCA_PROPIA  = P_MCA_PROPIA
    WHERE 
      ROWID = P_ROWID;
    P_MENSAJE:='OK';
    COMMIT;
    exception
    when others then
      --
      rollback;
      P_MENSAJE:='ERROR';
      --
  end P_ACTU_MONEDA;
  /* -----------------------------------------------------
  || -----------------------------------------------------
  || P_ELIM_MONEDA: Elimina moneda
  || -----------------------------------------------------
  */ -----------------------------------------------------
  PROCEDURE P_ELIM_MONEDA (P_ROWID   IN  VARCHAR2,
                           P_MENSAJE OUT VARCHAR2) IS
  BEGIN
    --
    DELETE sap.dim_sap_moneda_bk@SAP
     WHERE ROWID = P_ROWID;
    --
    P_MENSAJE:='OK';
    --
    COMMIT;
    --
  exception
    when others then
      --
      rollback;
      P_MENSAJE:='ERROR';
      --
  END P_ELIM_MONEDA;
  --
end SAP_WEB_MANTENEDOR;
/
