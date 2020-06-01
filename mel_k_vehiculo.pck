create or replace package mel_k_vehiculo is

  -- AUTHOR  : GAPEREZ
  -- CREATED : 10-AUG-09 12:30:58 PM
  -- PURPOSE :

  TYPE TYCURSOR IS REF CURSOR;

  PROCEDURE P_CALCULA_PRIMAS(P_COD_DOCUM_MAE          VARCHAR2,
                             P_COD_DOCUM_ASEG         VARCHAR2,
                             P_COD_MARCA              NUMBER,
                             P_COD_MODELO             NUMBER,
                             P_COD_SUB_MODELO         NUMBER,
                             P_ANTIG_VEH              VARCHAR2,
                             P_COD_MODALIDAD          NUMBER,
                             P_NUM_MATRICULA          VARCHAR2,
                             P_MONTO_RC               VARCHAR2,
                             P_EDAD                   VARCHAR2,
                             P_SEXO                   VARCHAR2,
                             P_CANT_SINIESTROS        VARCHAR2,
                             P_MONTO_SINIESTROS       VARCHAR2,
                             P_RC_EXCESO              VARCHAR2,
                             P_CONV                   VARCHAR2,
                             P_COB_OPC                VARCHAR2,
                             P_MCA_MEL                VARCHAR2,
                             P_TIPO_DESCUENTO_DATABSS VARCHAR2,
                             P_DESCUENTO_DATABSS      VARCHAR2,
                             P_PRIMA                  OUT VARCHAR2,
                             P_PRIMA_TOTAL            OUT VARCHAR2,
                             P_DESC                   OUT VARCHAR2,
                             P_PORC_DESC              OUT VARCHAR2,
                             P_RECAR                  OUT VARCHAR2,
                             P_PORC_RECAR             OUT VARCHAR2,
                             P_COD_RAMO               IN OUT VARCHAR2,
                             P_ERROR                  OUT VARCHAR2);

  PROCEDURE P_LLAMA_EM_P_999DV0005(P_COD_RAMO             VARCHAR2,
                                   P_COD_MODALIDAD        VARCHAR2,
                                   P_COD_MARCA            VARCHAR2,
                                   P_COD_MODELO           VARCHAR2,
                                   P_ANIO_VEH             VARCHAR2,
                                   P_ANTIG_VEH            VARCHAR2,
                                   P_VAL_SUB_MODELO       VARCHAR2,
                                   P_NUM_MATRICULA        VARCHAR2,
                                   P_TIP_DOCUM            VARCHAR2,
                                   P_COD_DOCUM_ASEG       VARCHAR2,
                                   P_COD_AGT              VARCHAR2,
                                   P_COD_NIVEL3           VARCHAR2,
                                   P_MONTO_RC             VARCHAR2,
                                   P_SEXO                 VARCHAR2,
                                   P_RANGO_EDAD_CONDUCTOR VARCHAR2,
                                   P_EDAD                 VARCHAR2,
                                   P_MONTO_SINIESTROS     VARCHAR2,
                                   P_CANT_SINIESTROS      VARCHAR2,
                                   P_PERDIDA_TOTAL        VARCHAR2,
                                   P_MCA_MEL              VARCHAR2,
                                   P_PRIMA_PROPUESTA      OUT VARCHAR2,
                                   P_TIPO_DESC            OUT VARCHAR2,
                                   P_DESCUENTO            OUT VARCHAR2);

  PROCEDURE P_CUADRA_PRIMA(P_PRIMA_PROPUESTA        NUMBER,
                           P_TIPO_DESC              VARCHAR2,
                           P_DESCUENTO              VARCHAR2,
                           P_PRIMA_MINIMA           NUMBER,
                           P_TIPO_DESCUENTO_CONV    VARCHAR2,
                           P_DESCUENTO_CONV         NUMBER,
                           P_MONTO_RC_EXCESO        NUMBER,
                           P_PRIMA_EXENTA           NUMBER,
                           P_MONTO_COB_OPC          NUMBER,
                           P_TIPO_DESCUENTO_DATABSS VARCHAR2,
                           P_DESCUENTO_DATABSS      VARCHAR2,
                           P_COD_DOCUM_MAE          VARCHAR2,
                           P_COD_CONV               VARCHAR2,
                           P_TIPO_DESCUENTO_FIJO    VARCHAR2,
                           P_DESCUENTO_FIJO         VARCHAR2,
                           P_COD_MODALIDAD          VARCHAR2,
                           P_PRIMA                  OUT VARCHAR2,
                           P_PRIMA_TOTAL            OUT VARCHAR2,
                           P_DESC                   OUT VARCHAR2,
                           P_PORC_DESC              OUT VARCHAR2,
                           P_RECAR                  OUT VARCHAR2,
                           P_PORC_RECAR             OUT VARCHAR2);

  PROCEDURE P_DATOS_VEH_COTIZACION(P_COD_MARCA      VARCHAR2,
                                   P_COD_MODELO     VARCHAR2,
                                   P_COD_SUB_MODELO VARCHAR2,
                                   P_USO_VEH        VARCHAR2,
                                   P_COD_RAMO       OUT VARCHAR2,
                                   P_COD_TIP_VEHI   OUT VARCHAR2,
                                   P_ERROR          OUT VARCHAR2);

  PROCEDURE P_LLAMA_SISGEN(P_COD_DOCUM_ASEG  VARCHAR2,
                           P_COD_DOCUM_TOMAD VARCHAR2,
                           P_NUM_MATRICULA   VARCHAR2,
                           P_CANT_SINIESTROS OUT VARCHAR2,
                           P_MONT_SINIESTROS OUT VARCHAR2);

  PROCEDURE P_NOM_MODALIDAD(P_COD_MODALIDAD IN NUMBER,
                            P_NOM_MODALIDAD OUT VARCHAR2);

  PROCEDURE p_nom_modalidad_especial(p_cod_modalidad IN NUMBER,
                                     p_nom_modalidad OUT VARCHAR2);

  PROCEDURE P_TRAE_PLANES(P_COD_DOCUM VARCHAR2, P_PLANES OUT TYCURSOR);

  PROCEDURE P_BUSCA_SEXO(P_COD_CIA   VARCHAR2,
                         P_TIP_DOCUM VARCHAR2,
                         P_COD_DOCUM VARCHAR2,
                         P_SEXO      OUT VARCHAR2);

  PROCEDURE P_BUSCA_RANGO_EDAD(P_EDAD VARCHAR2, P_RANGO_EDAD OUT VARCHAR2);

  PROCEDURE P_BUSCA_EDAD(P_COD_CIA   VARCHAR2,
                         P_TIP_DOCUM VARCHAR2,
                         P_COD_DOCUM VARCHAR2,
                         P_FEC_NACIM DATE,
                         P_EDAD      OUT VARCHAR2);

  PROCEDURE P_DATOS_VEHICULO(P_NUM_MATRICULA  VARCHAR2,
                             P_NOM_COT        OUT VARCHAR2,
                             P_APE_PAT_COT    OUT VARCHAR2,
                             P_APE_MAT_COT    OUT VARCHAR2,
                             P_RUT_COT        OUT VARCHAR2,
                             P_DIR_COT        OUT VARCHAR2,
                             P_COMUNA_COT     OUT VARCHAR2,
                             P_CIUDAD_COT     OUT VARCHAR2,
                             P_REGION_COT     OUT VARCHAR2,
                             P_ANIO           OUT VARCHAR2,
                             P_NRO_CHASIS     OUT VARCHAR2,
                             P_NRO_MOTOR      OUT VARCHAR2,
                             P_COD_COLOR      OUT VARCHAR2,
                             P_NOM_COLOR      OUT VARCHAR2,
                             P_COD_MARCA      OUT VARCHAR2,
                             P_NOM_MARCA      OUT VARCHAR2,
                             P_COD_MODELO     OUT VARCHAR2,
                             P_NOM_MODELO     OUT VARCHAR2,
                             P_COD_SUB_MODELO OUT VARCHAR2,
                             P_NOM_SUB_MODELO OUT VARCHAR2,
                             P_TIP_VEHI       OUT VARCHAR2,
                             P_EDAD           OUT VARCHAR2,
                             P_SEXO           OUT VARCHAR2,
                             P_ID             OUT VARCHAR2,
                             P_ERROR          OUT VARCHAR2);

  PROCEDURE P_TRAE_DATA_OV_VEHICULO(P_NUM_MATRICULA  VARCHAR2,
                                    P_NOM_COT        OUT VARCHAR2,
                                    P_APE_PAT_COT    OUT VARCHAR2,
                                    P_APE_MAT_COT    OUT VARCHAR2,
                                    P_RUT_COT        OUT VARCHAR2,
                                    P_DIR_COT        OUT VARCHAR2,
                                    P_COMUNA_COT     OUT VARCHAR2,
                                    P_CIUDAD_COT     OUT VARCHAR2,
                                    P_REGION_COT     OUT VARCHAR2,
                                    P_ANIO           OUT VARCHAR2,
                                    P_NRO_CHASIS     OUT VARCHAR2,
                                    P_NRO_MOTOR      OUT VARCHAR2,
                                    P_COD_COLOR      OUT VARCHAR2,
                                    P_NOM_COLOR      OUT VARCHAR2,
                                    P_COD_MARCA      OUT VARCHAR2,
                                    P_NOM_MARCA      OUT VARCHAR2,
                                    P_COD_MODELO     OUT VARCHAR2,
                                    P_NOM_MODELO     OUT VARCHAR2,
                                    P_COD_SUB_MODELO OUT VARCHAR2,
                                    P_NOM_SUB_MODELO OUT VARCHAR2,
                                    P_TIP_VEHI       OUT VARCHAR2,
                                    P_ERROR          OUT VARCHAR2);

  PROCEDURE P_TRAE_DATA_RVM(P_NUM_MATRICULA  VARCHAR2,
                            P_NOM_COT        OUT VARCHAR2,
                            P_APE_PAT_COT    OUT VARCHAR2,
                            P_APE_MAT_COT    OUT VARCHAR2,
                            P_RUT_COT        OUT VARCHAR2,
                            P_DIR_COT        OUT VARCHAR2,
                            P_COMUNA_COT     OUT VARCHAR2,
                            P_CIUDAD_COT     OUT VARCHAR2,
                            P_REGION_COT     OUT VARCHAR2,
                            P_ANIO           OUT VARCHAR2,
                            P_NRO_CHASIS     OUT VARCHAR2,
                            P_NRO_MOTOR      OUT VARCHAR2,
                            P_COD_COLOR      OUT VARCHAR2,
                            P_NOM_COLOR      OUT VARCHAR2,
                            P_COD_MARCA      OUT VARCHAR2,
                            P_NOM_MARCA      OUT VARCHAR2,
                            P_COD_MODELO     OUT VARCHAR2,
                            P_NOM_MODELO     OUT VARCHAR2,
                            P_COD_SUB_MODELO OUT VARCHAR2,
                            P_NOM_SUB_MODELO OUT VARCHAR2,
                            P_TIP_VEHI       OUT VARCHAR2,
                            P_ERROR          OUT VARCHAR2);

  PROCEDURE P_GRABA_COTIZACION(P_COD_DOCUM      VARCHAR2,
                               P_COD_DOCUM_ASEG VARCHAR2,
                               P_NUM_MATRICULA  VARCHAR2,
                               P_ID             VARCHAR2,
                               P_STRING         VARCHAR2,
                               P_COD_RAMO       VARCHAR2,
                               P_MONTO_RC       VARCHAR2,
                               P_EDAD_CONDUCTOR VARCHAR2,
                               P_SEXO_CONDUCTOR VARCHAR2,
                               P_RC_EXCESO      VARCHAR2,
                               P_FACT48         VARCHAR2,
                               P_CONVENIO       VARCHAR2,
                               P_COB_OPC        VARCHAR2,
                               P_MCA_MEL        VARCHAR2,
                               P_NUM_COTIZACION IN OUT VARCHAR2,
                               P_ERROR          OUT VARCHAR2);

  PROCEDURE P_GRABA_MODALIDAD(P_COD_DOCUM      VARCHAR2,
                              P_COD_DOCUM_ASEG VARCHAR2,
                              P_NUM_MATRICULA  VARCHAR2,
                              P_COD_MODALIDAD  NUMBER,
                              P_PRIMA_NETA     NUMBER,
                              P_DESC           VARCHAR2,
                              P_ID             VARCHAR2,
                              P_COD_RAMO       IN VARCHAR2,
                              P_NUM_COTIZACION IN OUT VARCHAR2,
                              P_ERROR          OUT VARCHAR2);

  PROCEDURE P_IMPRIME_COTIZACION(P_NUM_COTIZACION VARCHAR2,
                                 P_NOM_FIC        OUT VARCHAR2,
                                 P_ERROR          OUT VARCHAR2);

  PROCEDURE P_SISGEN(P_COD_DOCUM_ASEG   VARCHAR2,
                     P_COD_DOCUM_TOMAD  VARCHAR2,
                     P_NUM_MATRICULA    VARCHAR2,
                     P_MONTO_SINIESTROS OUT NUMBER,
                     P_CANT_SINIESTRO   OUT NUMBER,
                     P_ERROR            OUT VARCHAR2);

  PROCEDURE P_DATOS_TERCERO(P_COD_DOCUM   VARCHAR2,
                            P_NOM_TERCERO OUT VARCHAR2,
                            P_APE_PATERNO OUT VARCHAR2,
                            P_APE_MATERNO OUT VARCHAR2,
                            P_EDAD        OUT VARCHAR2,
                            P_SEXO        OUT VARCHAR2,
                            P_ERROR       OUT VARCHAR2);

  PROCEDURE P_GRABA_DATOS_VEH(P_NUM_MATRICULA  VARCHAR2,
                              P_COD_DOCUM      VARCHAR2,
                              P_COD_MARCA      NUMBER,
                              P_COD_MODELO     NUMBER,
                              P_COD_SUB_MODELO NUMBER,
                              P_ANIO_FAB       VARCHAR2,
                              P_ID             IN OUT VARCHAR2,
                              P_ERROR          OUT VARCHAR2);

  PROCEDURE P_GRABA_MODALIDAD_EMITE(P_COD_DOCUM      VARCHAR2,
                                    P_COD_DOCUM_ASEG VARCHAR2,
                                    P_NUM_MATRICULA  VARCHAR2,
                                    P_COD_MODALIDAD  NUMBER,
                                    P_PRIMA_NETA     NUMBER,
                                    P_DESC           VARCHAR2,
                                    P_ID             NUMBER,
                                    P_COD_RAMO       VARCHAR2,
                                    P_MONTO_RC       VARCHAR2,
                                    P_EDAD_CONDUCTOR VARCHAR2,
                                    P_SEXO_CONDUCTOR VARCHAR2,
                                    P_RC_EXCESO      VARCHAR2,
                                    P_FACT48         VARCHAR2,
                                    P_CONVENIO       VARCHAR2,
                                    P_COB_OPC        VARCHAR2,
                                    P_MCA_MEL        VARCHAR2,
                                    P_NUM_COTIZACION IN OUT VARCHAR2,
                                    P_ERROR          OUT VARCHAR2);

  PROCEDURE P_GENERA_XML(P_COD_DOCUM_MAE        VARCHAR2,
                         P_COD_DOCUM_ASEG       VARCHAR2,
                         P_COD_DOCUM_TOMAD      VARCHAR2,
                         P_NUM_COTIZACION       VARCHAR2,
                         P_COD_PLAN_PAGO        VARCHAR2,
                         P_IND_INSP             VARCHAR2,
                         P_FEC_VIG_INI          VARCHAR2,
                         P_DIA_PAGO             VARCHAR2,
                         P_FORMA_PAGO           VARCHAR2,
                         P_CODBANCO             VARCHAR2,
                         P_CODTARJETA           VARCHAR2,
                         P_NROTARJETA           VARCHAR2,
                         P_MESTARJETA           VARCHAR2,
                         P_ANIOTARJETA          VARCHAR2,
                         P_SUPLANTA             VARCHAR2,
                         P_COD_RAMO             OUT VARCHAR2,
                         P_MEL_XML_POL_P2000030 OUT CLOB,
                         P_MEL_XML_POL_P2000031 OUT CLOB,
                         P_MEL_XML_POL_P2000020 OUT CLOB,
                         P_MEL_XML_POL_P2000040 OUT CLOB,
                         P_MEL_XML_POL_P2000060 OUT CLOB,
                         P_MEL_XML_POL_P1001331 OUT CLOB,
                         P_ERROR                OUT VARCHAR2);

  PROCEDURE P_VALIDA_NUM_MATRICULA(VAL_NUM_MATRICULA IN VARCHAR2,
                                   P_ERROR           OUT VARCHAR2);

  PROCEDURE P_BUSCA_PERDIDA_TOTAL(P_NUM_MATRICULA VARCHAR2,
                                  P_PERDIDA_TOTAL OUT VARCHAR2);

  PROCEDURE P_VALIDA_PERDIDA_TOTAL_CIA(P_NUM_MATRICULA     VARCHAR2,
                                       P_PERDIDA_TOTAL_CIA OUT BOOLEAN);

  PROCEDURE P_BUSCA_RC_EXCESO(P_COD_RAMO      VARCHAR2,
                              P_COD_COB       VARCHAR2,
                              P_COD_MODALIDAD VARCHAR2,
                              P_COD_DOCUM     VARCHAR2,
                              P_COD_CONV      VARCHAR2,
                              P_MONTO         OUT NUMBER);

  PROCEDURE P_IMPRIME_PAT(P_NUM_COTIZACION VARCHAR2,
                          P_NOM_FIC        OUT VARCHAR2,
                          P_ERROR          OUT VARCHAR2);

  PROCEDURE P_ENVIA_CORREO(P_NUM_COTIZACION IN VARCHAR2,
                           P_PARA           IN VARCHAR2,
                           P_REPLY_TO       IN VARCHAR2,
                           P_CC_TO          IN VARCHAR2,
                           P_ASUNTO         IN VARCHAR2,
                           P_MENSAJE        IN VARCHAR2,
                           P_RUTA_LOGO      IN VARCHAR2,
                           P_RUTA_FILE      IN VARCHAR2,
                           P_ERROR          OUT VARCHAR2);

  PROCEDURE P_UPDATE_COT_POL(P_NUM_COTIZACION VARCHAR2,
                             P_NUM_POLIZA     VARCHAR2,
                             P_ERROR          OUT VARCHAR2);

  PROCEDURE P_VALIDA_INSPECCION(P_NUM_MATRICULA        VARCHAR2,
                                P_COD_DOCUM_INSP       VARCHAR2,
                                P_COD_RAMO             VARCHAR2,
                                P_CONV                 VARCHAR2,
                                P_NUM_INSPEC           OUT VARCHAR2,
                                P_STATUS               OUT VARCHAR2,
                                P_EXISTE_INSPECTOR_TER OUT VARCHAR2,
                                P_FECHA_INSPECCION     OUT VARCHAR2,
                                P_MCA_VENCIDA          OUT VARCHAR2,
                                P_ERROR                OUT VARCHAR2);

  PROCEDURE P_ASIGNA_INSPECCION(P_NUM_COTIZACION VARCHAR2,
                                P_NUM_INSPECCION VARCHAR2,
                                P_ERROR          OUT VARCHAR2);

  PROCEDURE P_TRAE_OPCIONES(P_COD_CONV VARCHAR2, P_OPCIONES OUT TYCURSOR);

  PROCEDURE P_VALIDA_SUPLANTA(P_COD_DOCUM VARCHAR2,
                              P_RESPUESTA OUT VARCHAR2);

  PROCEDURE P_CUENTA_HABILITADA(P_COD_DOCUM CTR_CUENTAS.COD_DOCUM %TYPE,
                                P_EXISTE    OUT CTR_CUENTAS.TIPO %TYPE);

  PROCEDURE P_TRAE_COD_DOCUM_CONVENIO(P_NUM_COTIZACION VARCHAR2,
                                      P_COD_DOCUM_MAE  OUT VARCHAR2,
                                      P_COD_CONV       OUT VARCHAR2);

  PROCEDURE P_CARGA_DATOS_COTIZACION(P_NUM_COTIZACION VARCHAR2,
                                     P_DATOS          OUT TYCURSOR);

  PROCEDURE P_DATOS_VEHICULO_ID(P_ID             VARCHAR2,
                                P_NOM_COT        OUT VARCHAR2,
                                P_APE_PAT_COT    OUT VARCHAR2,
                                P_APE_MAT_COT    OUT VARCHAR2,
                                P_RUT_COT        OUT VARCHAR2,
                                P_DIR_COT        OUT VARCHAR2,
                                P_COMUNA_COT     OUT VARCHAR2,
                                P_CIUDAD_COT     OUT VARCHAR2,
                                P_REGION_COT     OUT VARCHAR2,
                                P_ANIO           OUT VARCHAR2,
                                P_NRO_CHASIS     OUT VARCHAR2,
                                P_NRO_MOTOR      OUT VARCHAR2,
                                P_COD_COLOR      OUT VARCHAR2,
                                P_NOM_COLOR      OUT VARCHAR2,
                                P_COD_MARCA      OUT VARCHAR2,
                                P_NOM_MARCA      OUT VARCHAR2,
                                P_COD_MODELO     OUT VARCHAR2,
                                P_NOM_MODELO     OUT VARCHAR2,
                                P_COD_SUB_MODELO OUT VARCHAR2,
                                P_NOM_SUB_MODELO OUT VARCHAR2,
                                P_TIP_VEHI       OUT VARCHAR2,
                                P_EDAD           OUT VARCHAR2,
                                P_SEXO           OUT VARCHAR2,
                                P_ERROR          OUT VARCHAR2);

  PROCEDURE P_VALIDA_PATENTE_VEH(VAL_NUM_MATRICULA IN OV_VEHICULO.NUM_MATRICULA %TYPE,
                                 VAL_ID            OUT OV_VEHICULO.ID %TYPE,
                                 P_ERROR           OUT VARCHAR2);

  PROCEDURE P_VALIDA_VEH_PLAN_VIGENTE(P_COD_DOCUM_ASEG        IN VARCHAR2,
                                      P_COD_MARCA             IN VARCHAR2,
                                      P_COD_MODELO            IN VARCHAR2,
                                      P_COD_SUB_MODELO        IN VARCHAR2,
                                      P_COD_CONV              IN VARCHAR2,
                                      P_RC_EXCESO             IN VARCHAR2,
                                      P_MCA_VIGENTE           OUT VARCHAR2,
                                      P_COD_MODALIDAD_VIGENTE OUT VARCHAR2,
                                      P_COD_RAMO              OUT VARCHAR2,
                                      P_IMP_PRIMA_NETA        OUT VARCHAR2,
                                      P_IMP_PRIMA_TOTAL       OUT VARCHAR2);

  PROCEDURE P_TRAE_TIPO_VEHICULO(P_COD_MARCA      VARCHAR2,
                                 P_COD_MODELO     VARCHAR2,
                                 P_COD_SUB_MODELO VARCHAR2,
                                 P_USO_VEH        VARCHAR2,
                                 P_COD_RAMO       OUT VARCHAR2,
                                 P_COD_TIP_VEHI   OUT VARCHAR2,
                                 P_NOM_TIP_VEHI   OUT VARCHAR2,
                                 P_ERROR          OUT VARCHAR2);

  PROCEDURE P_TRAE_PLANES_PAGO_PAT(P_COD_CIA IN NUMBER,
                                   P_CURSOR  OUT TYCURSOR,
                                   P_ERROR   OUT VARCHAR2);

  PROCEDURE P_GRABA_DATOS_VEH_EMISION(P_ID         NUMBER,
                                      P_COD_COLOR  NUMBER,
                                      P_NRO_MOTOR  VARCHAR2,
                                      P_NRO_CHASIS VARCHAR2,
                                      P_ERROR      OUT VARCHAR2);

  PROCEDURE P_BUSCA_COB_OPC(P_COD_RAMO      VARCHAR2,
                            P_COD_COB       VARCHAR2,
                            P_COD_MODALIDAD VARCHAR2,
                            P_COD_DOCUM     VARCHAR2,
                            P_COD_CONV      VARCHAR2,
                            P_MONTO         OUT NUMBER,
                            P_MONTO_CONV    OUT NUMBER);

  PROCEDURE P_GRABA_COB_OPC(P_NUM_COTIZACION VARCHAR2, P_COD_COB VARCHAR2);

  PROCEDURE P_GET_LISTA_CUADRO_COM(P_COD_DOCUM        VARCHAR2,
                                   P_CONV             VARCHAR2,
                                   P_MCA_CUADRO       OUT VARCHAR2,
                                   P_LISTA_CUADRO_COM OUT SYS_REFCURSOR);

  PROCEDURE P_GET_PRIMA_CUADRO_COM(P_PRIMA_NETA    NUMBER,
                                   P_DESC_NETA     VARCHAR2,
                                   P_CUADRO_COM    VARCHAR2,
                                   P_COD_MODALIDAD NUMBER,
                                   P_COD_DOCUM     VARCHAR2,
                                   P_CONV          VARCHAR2,
                                   P_COD_RAMO      VARCHAR2,
                                   P_PRIMA         OUT VARCHAR2,
                                   P_PRIMA_TOTAL   OUT VARCHAR2,
                                   P_DESC          OUT VARCHAR2,
                                   P_PORC_DESC     OUT VARCHAR2,
                                   P_RECAR         OUT VARCHAR2,
                                   P_PORC_RECAR    OUT VARCHAR2);

  PROCEDURE P_GRABA_COMISION(P_NUM_COTIZACION VARCHAR2,
                             P_COD_CUADRO_COM VARCHAR2,
                             P_ERROR          OUT VARCHAR2);

  PROCEDURE P_TRAE_PLANES_PAGO_RIPLEY(P_COD_CIA IN NUMBER,
                                      P_CURSOR  OUT SYS_REFCURSOR,
                                      P_ERROR   OUT VARCHAR2);

  PROCEDURE P_VALIDA_MCA_MEL(P_COD_DOCUM      VARCHAR2,
                             P_COD_CONV       VARCHAR2,
                             P_VALIDA_MCA_MEL OUT VARCHAR2,
                             P_MCA_MEL        OUT VARCHAR2);

  PROCEDURE P_MONTO_COB_EXENTA(P_COD_RAMO      VARCHAR2,
                               P_COD_MODALIDAD VARCHAR2,
                               P_MONTO_EXENTA  OUT NUMBER);

  procedure P_DATOS_AUTOMORA(P_COD_DOCUM      VARCHAR2,
                             P_NOM_AUTOMOTORA OUT VARCHAR2);

  PROCEDURE P_GRABA_DATOS_FACTURA(P_NUM_COTIZACION       VARCHAR2,
                                  P_NUM_FACTURA          VARCHAR2,
                                  P_FEC_FACTURA          VARCHAR2,
                                  P_COD_DOCUM_AUTOMOTORA VARCHAR2,
                                  P_NOM_AUTOMORA         VARCHAR2,
                                  P_ERROR                OUT VARCHAR2);

  PROCEDURE P_TRAE_DATOS_FACTURA(P_NUM_COTIZACION       VARCHAR2,
                                 P_NUM_FACTURA          OUT VARCHAR2,
                                 P_FEC_FACTURA          OUT VARCHAR2,
                                 P_COD_DOCUM_AUTOMOTORA OUT VARCHAR2,
                                 P_NOM_AUTOMORA         OUT VARCHAR2);

  PROCEDURE P_TRAE_DEDUCIBLE_MODALIDAD(P_COD_RAMO      VARCHAR2,
                                       P_COD_MODALIDAD VARCHAR2,
                                       P_DEDUCIBLE     OUT VARCHAR2,
                                       P_ERROR         OUT VARCHAR2);

  PROCEDURE P_NOM_MODALIDAD_FANTASIA(P_COD_MODALIDAD IN NUMBER,
                                     P_NOM_MODALIDAD OUT VARCHAR2,
                                     P_DEDUCIBLE     OUT VARCHAR2);

  PROCEDURE P_UPD_SISGEN_COTIZACION(p_num_cotizacion   IN VARCHAR2,
                                    p_cant_siniestros  IN NUMBER,
                                    p_monto_siniestros IN NUMBER,
                                    p_error            OUT VARCHAR2);

  PROCEDURE P_TRAE_PLANES_PAGO_COMPARA(p_cod_cia IN NUMBER,
                                       tip_pago  in VARCHAR2,
                                       p_cursor  OUT tyCursor,
                                       p_error   OUT VARCHAR2);

  PROCEDURE P_GET_PRIMA_SIN_CUADRO_COM(P_PRIMA_NETA            NUMBER,
                                       P_DESC_NETA             VARCHAR2,
                                       P_CUADRO_COM            VARCHAR2,
                                       P_COD_MODALIDAD         NUMBER,
                                       P_COD_DOCUM             VARCHAR2,
                                       P_CONV                  VARCHAR2,
                                       P_COD_RAMO              VARCHAR2,
                                       P_PRIMA_NETA_SIN_CUADRO OUT VARCHAR2);

  PROCEDURE P_GRABA_RESPUESTAS(P_NUM_COTIZACION VARCHAR2,
                               P_HIJOS          VARCHAR2,
                               P_FRANQUICIA     VARCHAR2,
                               P_DANOS          VARCHAR2,
                               P_ERROR          OUT VARCHAR2);

  PROCEDURE P_IMPRIME_COTIZACION2(P_NUM_COTIZACION VARCHAR2,
                                  P_NUM_CUOTAS_PAT NUMBER,
                                  P_NOM_FIC        OUT VARCHAR2,
                                  P_ERROR          OUT VARCHAR2);

  PROCEDURE P_BUSCA_MONTO_COB_CONV_OPC(P_COD_RAMO      VARCHAR2,
                                       P_COD_COB       VARCHAR2,
                                       P_COD_MODALIDAD VARCHAR2,
                                       P_COD_DOCUM     VARCHAR2,
                                       P_COD_CONV      VARCHAR2,
                                       P_MONTO         OUT NUMBER);

  PROCEDURE P_BUSCA_SUMA_ASEG_COB_CONV(P_COD_RAMO      VARCHAR2,
                                       P_COD_COB       VARCHAR2,
                                       P_COD_MODALIDAD VARCHAR2,
                                       P_COD_DOCUM     VARCHAR2,
                                       P_COD_CONV      VARCHAR2,
                                       P_SUMA_ASEG     OUT NUMBER);

  PROCEDURE P_BUSCA_COB_CONV_OPC(P_COD_RAMO      VARCHAR2,
                                 P_COD_MODALIDAD VARCHAR2,
                                 P_COD_DOCUM     VARCHAR2,
                                 P_COD_CONV      VARCHAR2,
                                 P_COB           OUT VARCHAR2);

  PROCEDURE P_IMPRIME_COTIZACION2_ANTIGUO(P_NUM_COTIZACION VARCHAR2,
                                          P_NUM_CUOTAS_PAT NUMBER,
                                          P_NOM_FIC        OUT VARCHAR2,
                                          P_ERROR          OUT VARCHAR2);

  PROCEDURE P_CALCULA_PRIMAS_CON_FECHAS(P_COD_DOCUM_MAE          VARCHAR2,
                                        P_COD_DOCUM_ASEG         VARCHAR2,
                                        P_COD_MARCA              NUMBER,
                                        P_COD_MODELO             NUMBER,
                                        P_COD_SUB_MODELO         NUMBER,
                                        P_ANTIG_VEH              VARCHAR2,
                                        P_COD_MODALIDAD          NUMBER,
                                        P_NUM_MATRICULA          VARCHAR2,
                                        P_MONTO_RC               VARCHAR2,
                                        P_EDAD                   VARCHAR2,
                                        P_SEXO                   VARCHAR2,
                                        P_CANT_SINIESTROS        VARCHAR2,
                                        P_MONTO_SINIESTROS       VARCHAR2,
                                        P_RC_EXCESO              VARCHAR2,
                                        P_CONV                   VARCHAR2,
                                        P_COB_OPC                VARCHAR2,
                                        P_MCA_MEL                VARCHAR2,
                                        P_TIPO_DESCUENTO_DATABSS VARCHAR2,
                                        P_DESCUENTO_DATABSS      VARCHAR2,
                                        P_FECHA_INI_VIGENCIA     VARCHAR2,
                                        P_FECHA_FIN_VIGENCIA     VARCHAR2,
                                        P_PRIMA                  OUT VARCHAR2,
                                        P_PRIMA_TOTAL            OUT VARCHAR2,
                                        P_DESC                   OUT VARCHAR2,
                                        P_PORC_DESC              OUT VARCHAR2,
                                        P_RECAR                  OUT VARCHAR2,
                                        P_PORC_RECAR             OUT VARCHAR2,
                                        P_COD_RAMO               IN OUT VARCHAR2,
                                        P_ERROR                  OUT VARCHAR2);

  PROCEDURE P_LLAMA_EM_P_999DV0005_FECHAS(P_COD_RAMO             VARCHAR2,
                                          P_COD_MODALIDAD        VARCHAR2,
                                          P_COD_MARCA            VARCHAR2,
                                          P_COD_MODELO           VARCHAR2,
                                          P_ANIO_VEH             VARCHAR2,
                                          P_ANTIG_VEH            VARCHAR2,
                                          P_VAL_SUB_MODELO       VARCHAR2,
                                          P_NUM_MATRICULA        VARCHAR2,
                                          P_TIP_DOCUM            VARCHAR2,
                                          P_COD_DOCUM_ASEG       VARCHAR2,
                                          P_COD_AGT              VARCHAR2,
                                          P_COD_NIVEL3           VARCHAR2,
                                          P_MONTO_RC             VARCHAR2,
                                          P_SEXO                 VARCHAR2,
                                          P_RANGO_EDAD_CONDUCTOR VARCHAR2,
                                          P_EDAD                 VARCHAR2,
                                          P_MONTO_SINIESTROS     VARCHAR2,
                                          P_CANT_SINIESTROS      VARCHAR2,
                                          P_PERDIDA_TOTAL        VARCHAR2,
                                          P_MCA_MEL              VARCHAR2,
                                          P_FECHA_INI_VIGENCIA   VARCHAR2,
                                          P_FECHA_FIN_VIGENCIA   VARCHAR2,
                                          P_PRIMA_PROPUESTA      OUT VARCHAR2,
                                          P_TIPO_DESC            OUT VARCHAR2,
                                          P_DESCUENTO            OUT VARCHAR2);

  PROCEDURE P_GRABA_COTIZACION_FECHAS(P_COD_DOCUM      VARCHAR2,
                                      P_COD_DOCUM_ASEG VARCHAR2,
                                      P_NUM_MATRICULA  VARCHAR2,
                                      P_ID             VARCHAR2,
                                      P_STRING         VARCHAR2,
                                      P_COD_RAMO       VARCHAR2,
                                      P_MONTO_RC       VARCHAR2,
                                      P_EDAD_CONDUCTOR VARCHAR2,
                                      P_SEXO_CONDUCTOR VARCHAR2,
                                      P_RC_EXCESO      VARCHAR2,
                                      P_FACT48         VARCHAR2,
                                      P_CONVENIO       VARCHAR2,
                                      P_COB_OPC        VARCHAR2,
                                      P_MCA_MEL        VARCHAR2,
                                      P_FECHA_INI_VIG  VARCHAR2,
                                      P_FECHA_FIN_VIG  VARCHAR2,
                                     /* p_CAPITAL_ENDOSADO IN VARCHAR2,
                                      P_COD_TIP_ENDOSADO IN VARCHAR2,*/
                                      P_NUM_COTIZACION IN OUT VARCHAR2,
                                      P_ERROR          OUT VARCHAR2);

  PROCEDURE P_GRABA_MODALIDAD_EMITE_FECHAS(P_COD_DOCUM      VARCHAR2,
                                           P_COD_DOCUM_ASEG VARCHAR2,
                                           P_NUM_MATRICULA  VARCHAR2,
                                           P_FECHA_INI_VIG  VARCHAR2,
                                           P_FECHA_FIN_VIG  VARCHAR2,
                                           P_COD_MODALIDAD  NUMBER,
                                           P_PRIMA_NETA     NUMBER,
                                           P_DESC           VARCHAR2,
                                           P_ID             NUMBER,
                                           P_COD_RAMO       VARCHAR2,
                                           P_MONTO_RC       VARCHAR2,
                                           P_EDAD_CONDUCTOR VARCHAR2,
                                           P_SEXO_CONDUCTOR VARCHAR2,
                                           P_RC_EXCESO      VARCHAR2,
                                           P_FACT48         VARCHAR2,
                                           P_CONVENIO       VARCHAR2,
                                           P_COB_OPC        VARCHAR2,
                                           P_MCA_MEL        VARCHAR2,
                                           P_NUM_COTIZACION IN OUT VARCHAR2,
                                           P_ERROR          OUT VARCHAR2);

  PROCEDURE P_GRABA_DATOS_SISGEN(P_COD_DOCUM_ASEG    VARCHAR2,
                                 P_COD_DOCUM_TOMADOR VARCHAR2,
                                 P_NUM_MATRICULA     VARCHAR2,
                                 P_NUM_COTIZACION    VARCHAR2,
                                 P_ERROR             OUT VARCHAR2);

  procedure P_VALIDA_POLIZA(P_NUM_POLIZA VARCHAR2, P_ERROR OUT VARCHAR2);

  PROCEDURE P_UPD_REGISTRO_CABECERA(P_NUM_INSPEC IN VARCHAR2,
                                    P_POLIZA     IN VARCHAR2,
                                    P_ERROR      OUT VARCHAR2);

  PROCEDURE P_VALIDA_INSPECCION_MOTOR(P_NUM_MOTOR            VARCHAR2,
                                      P_COD_DOCUM_INSP       VARCHAR2,
                                      P_COD_RAMO             VARCHAR2,
                                      P_CONV                 VARCHAR2,
                                      P_NUM_INSPEC           OUT VARCHAR2,
                                      P_STATUS               OUT VARCHAR2,
                                      P_EXISTE_INSPECTOR_TER OUT VARCHAR2,
                                      P_FECHA_INSPECCION     OUT VARCHAR2,
                                      P_MCA_VENCIDA          OUT VARCHAR2,
                                      P_ERROR                OUT VARCHAR2);
                                      
                                      
PROCEDURE P_VERIFICA_TARIFA(P_COD_CONVENIO IN VARCHAR2,
                              P_COD_MARCA    IN NUMBER,
                              P_COD_MODELO   IN NUMBER,
                              P_ERROR      OUT VARCHAR2);
                              
 PROCEDURE P_EVALUA_RESTRICCION(
                     P_COD_DOCUM IN VARCHAR2,
                     P_DESCUENTO OUT VARCHAR2,
                     P_COMISION OUT VARCHAR2,
                     P_INSPECCION OUT VARCHAR2,
                     P_ERROR OUT VARCHAR2);
                     
PROCEDURE P_TRAE_OPCIONES_RESTRICCION(
                     P_COD_CONV VARCHAR2, 
                     P_OPCIONES OUT TYCURSOR);
                     
end mel_k_vehiculo;
/
create or replace package body mel_k_vehiculo is

  PROCEDURE P_CALCULA_PRIMAS(P_COD_DOCUM_MAE          VARCHAR2,
                             P_COD_DOCUM_ASEG         VARCHAR2,
                             P_COD_MARCA              NUMBER,
                             P_COD_MODELO             NUMBER,
                             P_COD_SUB_MODELO         NUMBER,
                             P_ANTIG_VEH              VARCHAR2,
                             P_COD_MODALIDAD          NUMBER,
                             P_NUM_MATRICULA          VARCHAR2,
                             P_MONTO_RC               VARCHAR2,
                             P_EDAD                   VARCHAR2,
                             P_SEXO                   VARCHAR2,
                             P_CANT_SINIESTROS        VARCHAR2,
                             P_MONTO_SINIESTROS       VARCHAR2,
                             P_RC_EXCESO              VARCHAR2,
                             P_CONV                   VARCHAR2,
                             P_COB_OPC                VARCHAR2,
                             P_MCA_MEL                VARCHAR2,
                             P_TIPO_DESCUENTO_DATABSS VARCHAR2,
                             P_DESCUENTO_DATABSS      VARCHAR2,
                             P_PRIMA                  OUT VARCHAR2,
                             P_PRIMA_TOTAL            OUT VARCHAR2,
                             P_DESC                   OUT VARCHAR2,
                             P_PORC_DESC              OUT VARCHAR2,
                             P_RECAR                  OUT VARCHAR2,
                             P_PORC_RECAR             OUT VARCHAR2,
                             P_COD_RAMO               IN OUT VARCHAR2,
                             P_ERROR                  OUT VARCHAR2) IS
  
    CURSOR COD_AGT(V_COD_MAE VARCHAR2) IS
      SELECT A.COD_AGT, A.COD_EJECUTIVO, A.COD_NIVEL3, A.TIP_AGT
        FROM A1001332@OVPRO_PRD A
       WHERE A.COD_CIA = 1
         AND (A.TIP_DOCUM = 'RUT' OR A.TIP_DOCUM = 'DIR')
         AND A.COD_DOCUM = V_COD_MAE
         AND A.COD_ACT_TERCERO = 2
         AND A.COD_CALIDAD = 1
         AND A.MCA_INH = 'N'
         AND A.FEC_VALIDEZ = (SELECT MAX(FEC_VALIDEZ)
                                FROM A1001332@OVPRO_PRD
                               WHERE COD_CIA = 1
                                 AND COD_AGT = A.COD_AGT);
  
    R_COD_AGT COD_AGT %ROWTYPE;
  
    CURSOR C_DESCUENTO(L_COD_DOCUM VARCHAR2) IS
      SELECT T.PORC_DCTO, T.TIPO_DESC
        FROM MEL_DESCUENTOS T
       WHERE T.COD_DOCUM = L_COD_DOCUM
         AND T.COD_CONV IS NULL
         AND MCA_INH = 'N';
  
    CURSOR C_DESCUENTO_CONV(L_CONV VARCHAR2) IS
      SELECT T.PORC_DCTO, T.TIPO_DESC
        FROM MEL_DESCUENTOS T
       WHERE T.COD_CONV = L_CONV
         AND MCA_INH = 'N';
  
    R_DESCUENTO C_DESCUENTO%ROWTYPE;
  
    --
    CURSOR c_cod_modalidad IS
    --
      SELECT t.cod_plan_real
        FROM mel_planes_veh_ficticios t
       WHERE t.cod_plan = p_cod_modalidad
         and t.mca_inh = 'N';
    --
    l_existe BOOLEAN;
    --
    CURSOR c_recargo IS
    --
      SELECT T.PORC_DCTO, T.TIPO_DESC
        FROM mel_planes_veh_ficticios t
       WHERE t.cod_plan = p_cod_modalidad
         and t.mca_inh = 'N'
         and t.porc_dcto is not null;
    --
    CURSOR c_recargo_fijo IS
    --
      SELECT T.Tipo_Dcto_Fijo, T.Dcto_Fijo
        FROM mel_planes_veh_ficticios t
       WHERE t.cod_plan = p_cod_modalidad
         and t.Mca_Inh_Dcto_Fijo = 'N'
         and t.Dcto_Fijo is not null;
    --
    l_existe_recargo               BOOLEAN;
    l_existe_recargo_fijo          BOOLEAN;
    l_recargo                      c_recargo%RowTYPE;
    l_recargo_fijo                 c_recargo_fijo%RowTYPE;
    l_descuento_conv_ficticio      NUMBER := 0;
    l_tipo_descuento_conv_ficticio VARCHAR2(2);
    --
  
    L_PRIMA_PROPUESTA      NUMBER;
    P_TIPO_DESC            VARCHAR2(2);
    P_DESCUENTO            VARCHAR2(20);
    PRIMA                  NUMBER;
    IVA                    NUMBER;
    PRIMA_TOTAL            NUMBER;
    COD_TIP_VEHI           VARCHAR(5);
    PRIMA_MINIMA           NUMBER;
    DESCUENTO              NUMBER;
    DESCUENTO_CONV         NUMBER := 0;
    TIPO_DESCUENTO_CONV    VARCHAR2(2);
    L_RANGO_EDAD_CONDUCTOR VARCHAR2(10);
    L_PERDIDA_TOTAL        VARCHAR2(20);
    L_MONTO_RC_EXCESO      NUMBER;
    L_ANTIG_VEH            NUMBER;
    L_ANTIG_VEH_MAX        NUMBER;
    MESSAGE                VARCHAR2(3000);
    L_EXISTE_DCTO          BOOLEAN;
    L_RECARGO_DATABSS      NUMBER;
  
    PRIMA_EXENTA NUMBER;
  
    L_COD_MODALIDAD VARCHAR2(10);
  
    L_MONTO_COB      NUMBER;
    L_MONTO_COB_CONV NUMBER;
  
    L_NUM_POLIZA_GRUPO VARCHAR2(20);
    L_NUM_CONTRATO     VARCHAR2(20);
  
    L_TIPO_DESCUENTO_FIJO VARCHAR2(2);
    L_DESCUENTO_FIJO      VARCHAR2(20);
  
  BEGIN
    --
    OPEN c_cod_modalidad;
    FETCH c_cod_modalidad
      INTO l_cod_modalidad;
    l_existe := c_cod_modalidad%FOUND;
    CLOSE c_cod_modalidad;
    --
    IF NOT l_existe THEN
      --
      l_cod_modalidad := p_cod_modalidad;
      --
    ELSE
      --
      OPEN c_recargo;
      FETCH c_recargo
        into l_recargo;
      l_existe_recargo := c_recargo%FOUND;
      CLOSE c_recargo;
    
      if l_existe_recargo then
        l_descuento_conv_ficticio      := l_recargo.PORC_DCTO;
        l_tipo_descuento_conv_ficticio := l_recargo.TIPO_DESC;
      end if;
      --
      OPEN c_recargo_fijo;
      FETCH c_recargo_fijo
        into l_recargo_fijo;
      l_existe_recargo_fijo := c_recargo_fijo%FOUND;
      CLOSE c_recargo_fijo;
    
      if l_existe_recargo_fijo then
        L_TIPO_DESCUENTO_FIJO := l_recargo_fijo.tipo_dcto_fijo;
        L_DESCUENTO_FIJO      := l_recargo_fijo.dcto_fijo;
      end if;
    
      --
    END IF;
    --
  
    if ValidaSuspension('VEH_LIVIANOS') then
    
      P_ERROR := '1010';
    
    else
    
      OPEN COD_AGT(P_COD_DOCUM_MAE);
      FETCH COD_AGT
        INTO R_COD_AGT;
      CLOSE COD_AGT;
    
      IF P_COD_RAMO IS NULL THEN
      
        /* CASE
        WHEN P_CONV LIKE 'RIPLEY%' THEN
          P_COD_RAMO := '808';
        WHEN P_CONV = 'WILLIS' THEN
          P_COD_RAMO := '808';
        WHEN P_CONV = 'ESCOLARBIANUAL' THEN
          P_COD_RAMO := '808';
        ELSE*/
        P_DATOS_VEH_COTIZACION(P_COD_MARCA,
                               P_COD_MODELO,
                               P_COD_SUB_MODELO,
                               'P',
                               P_COD_RAMO,
                               COD_TIP_VEHI,
                               P_ERROR);
      
        --END CASE;
      
      END IF;
    
      L_ANTIG_VEH := TO_CHAR(SYSDATE, 'YYYY') - P_ANTIG_VEH;
    
      IF L_ANTIG_VEH < 0 THEN
        L_ANTIG_VEH := 0;
      END IF;
    
      IF P_NUM_MATRICULA != 'A/D' THEN
      
        P_BUSCA_PERDIDA_TOTAL(P_NUM_MATRICULA, L_PERDIDA_TOTAL);
      
      ELSE
      
        L_PERDIDA_TOTAL := 'N';
      
      END IF;
    
      P_BUSCA_RANGO_EDAD(P_EDAD, L_RANGO_EDAD_CONDUCTOR);
    
      P_ERROR := '0';
    
      PRIMA_MINIMA := 0.1;
    
      IF P_CONV IS NULL THEN
      
        OPEN C_DESCUENTO(P_COD_DOCUM_MAE);
        FETCH C_DESCUENTO
          INTO R_DESCUENTO;
        L_EXISTE_DCTO := C_DESCUENTO%FOUND;
        CLOSE C_DESCUENTO;
      
      ELSE
      
        OPEN C_DESCUENTO_CONV(P_CONV);
        FETCH C_DESCUENTO_CONV
          INTO R_DESCUENTO;
        L_EXISTE_DCTO := C_DESCUENTO_CONV%FOUND;
        CLOSE C_DESCUENTO_CONV;
      
      END IF;
    
      IF L_EXISTE_DCTO THEN
        DESCUENTO_CONV      := R_DESCUENTO.PORC_DCTO;
        TIPO_DESCUENTO_CONV := R_DESCUENTO.TIPO_DESC;
      END IF;
    
      IF l_existe_recargo THEN
        DESCUENTO_CONV      := l_descuento_conv_ficticio;
        TIPO_DESCUENTO_CONV := l_tipo_descuento_conv_ficticio;
      END IF;
    
      CASE P_COD_DOCUM_MAE
        WHEN '774724206' THEN
          IF P_CONV = 'RIPLEYBI' THEN
          
            IF (l_cod_modalidad IN ('8120', '8123', '8125', '8121') AND
               P_EDAD < 35) THEN
            
              P_ERROR := '1001';
            
            ELSE
            
              IF (l_cod_modalidad != '8910' AND P_CANT_SINIESTROS > 3) THEN
              
                P_ERROR := '1002';
              
                /*            ELSE IF (l_cod_modalidad = '8915' AND P_CANT_SINIESTROS > 2) THEN
                  P_ERROR := '1002';
                */
              ELSE
              
                mel_p_veh_limites_anti(p_cod_docum_mae,
                                       p_conv,
                                       l_cod_modalidad,
                                       l_antig_veh_max);
              
                /*IF ((L_ANTIG_VEH IN (13, 14, 15) AND
                l_cod_modalidad NOT IN ('8900', '8910')) OR
                (L_ANTIG_VEH = 15 AND l_cod_modalidad NOT IN ('8910'))) THEN*/
              
                IF L_ANTIG_VEH > L_ANTIG_VEH_MAX THEN
                
                  P_ERROR := '1003';
                
                ELSE
                
                  L_COD_MODALIDAD := SUBSTR(l_cod_modalidad, 1, 4);
                
                  P_BUSCA_RC_EXCESO(P_COD_RAMO,
                                    P_RC_EXCESO,
                                    L_COD_MODALIDAD,
                                    P_COD_DOCUM_MAE,
                                    P_CONV,
                                    L_MONTO_RC_EXCESO);
                
                  TRN_K_GLOBAL.BORRA_TODAS@OVPRO_PRD;
                
                  /*CASE SUBSTR(l_cod_modalidad, 5, 1)
                                      WHEN 1 THEN
                                        L_MONTO_COB_OPC := 0.94;
                                        IF L_COD_MODALIDAD = '8300' THEN
                                          TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('NUM_POLIZA_GRUPO',
                                                                        '49702');
                                        END IF;
                                        IF L_COD_MODALIDAD = '8303' THEN
                                          TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('NUM_POLIZA_GRUPO',
                                                                        '49702');
                                        END IF;
                                        IF L_COD_MODALIDAD = '8305' THEN
                                          TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('NUM_POLIZA_GRUPO',
                                                                        '49702');
                                        END IF;
                                        IF L_COD_MODALIDAD = '8310' THEN
                                          TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('NUM_POLIZA_GRUPO',
                                                                        '49702');
                                        END IF;
                                      WHEN 2 THEN
                                        L_MONTO_COB_OPC := 1.88;
                                        IF L_COD_MODALIDAD = '8300' THEN
                                          TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('NUM_POLIZA_GRUPO',
                                                                        '49701');
                                        END IF;
                                        IF L_COD_MODALIDAD = '8303' THEN
                                          TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('NUM_POLIZA_GRUPO',
                                                                        '49701');
                                        END IF;
                                        IF L_COD_MODALIDAD = '8305' THEN
                                          TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('NUM_POLIZA_GRUPO',
                                                                        '49701');
                                        END IF;
                                        IF L_COD_MODALIDAD = '8310' THEN
                                          TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('NUM_POLIZA_GRUPO',
                                                                        '49701');
                                        END IF;
                                    END CASE;
                  */
                  --TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('NUM_POLIZA_GRUPO', '88809');
                
                  mel_p_num_pol_grupo(1,
                                      801,
                                      P_COD_DOCUM_MAE,
                                      P_CONV,
                                      l_cod_modalidad,
                                      L_NUM_POLIZA_GRUPO,
                                      L_NUM_CONTRATO);
                
                  IF L_NUM_POLIZA_GRUPO IS NOT NULL THEN
                  
                    TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('NUM_POLIZA_GRUPO',
                                                  L_NUM_POLIZA_GRUPO);
                  
                    TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('NUM_CONTRATO',
                                                  L_NUM_CONTRATO);
                  
                  END IF;
                
                  mel_p_scoring(P_COD_DOCUM_ASEG,
                                P_NUM_MATRICULA,
                                P_COD_RAMO,
                                l_cod_modalidad);
                
                  P_BUSCA_COB_OPC(P_COD_RAMO,
                                  P_COB_OPC,
                                  l_cod_modalidad,
                                  P_COD_DOCUM_MAE,
                                  P_CONV,
                                  L_MONTO_COB,
                                  L_MONTO_COB_CONV);
                
                  P_MONTO_COB_EXENTA(P_COD_RAMO,
                                     l_cod_modalidad,
                                     PRIMA_EXENTA);
                
                  P_LLAMA_EM_P_999DV0005(P_COD_RAMO,
                                         L_COD_MODALIDAD,
                                         P_COD_MARCA,
                                         P_COD_MODELO,
                                         P_ANTIG_VEH,
                                         L_ANTIG_VEH,
                                         '1000',
                                         P_NUM_MATRICULA,
                                         'RUT',
                                         P_COD_DOCUM_ASEG,
                                         R_COD_AGT.COD_AGT,
                                         R_COD_AGT.COD_NIVEL3,
                                         P_MONTO_RC,
                                         P_SEXO,
                                         L_RANGO_EDAD_CONDUCTOR,
                                         P_EDAD,
                                         P_MONTO_SINIESTROS,
                                         P_CANT_SINIESTROS,
                                         L_PERDIDA_TOTAL,
                                         P_MCA_MEL,
                                         L_PRIMA_PROPUESTA,
                                         P_TIPO_DESC,
                                         P_DESCUENTO);
                
                  P_CUADRA_PRIMA(L_PRIMA_PROPUESTA,
                                 P_TIPO_DESC,
                                 P_DESCUENTO,
                                 PRIMA_MINIMA,
                                 TIPO_DESCUENTO_CONV,
                                 DESCUENTO_CONV,
                                 L_MONTO_RC_EXCESO,
                                 PRIMA_EXENTA,
                                 L_MONTO_COB - L_MONTO_COB_CONV,
                                 P_TIPO_DESCUENTO_DATABSS,
                                 P_DESCUENTO_DATABSS,
                                 P_COD_DOCUM_MAE,
                                 P_CONV,
                                 L_TIPO_DESCUENTO_FIJO,
                                 L_DESCUENTO_FIJO,
                                 l_cod_modalidad,
                                 P_PRIMA,
                                 P_PRIMA_TOTAL,
                                 P_DESC,
                                 P_PORC_DESC,
                                 P_RECAR,
                                 P_PORC_RECAR);
                
                  INSERT INTO MEL_VEH_BITACORA_COT
                  VALUES
                    (l_cod_modalidad,
                     P_COD_MARCA,
                     P_COD_MODELO,
                     P_COD_SUB_MODELO,
                     P_NUM_MATRICULA,
                     L_ANTIG_VEH,
                     P_ANTIG_VEH,
                     P_COD_DOCUM_ASEG,
                     P_SEXO,
                     P_EDAD,
                     P_MONTO_SINIESTROS,
                     P_CANT_SINIESTROS,
                     P_TIPO_DESCUENTO_DATABSS,
                     P_DESCUENTO_DATABSS,
                     P_COD_DOCUM_MAE,
                     P_CONV,
                     P_MCA_MEL,
                     P_COD_RAMO,
                     P_COB_OPC,
                     P_RC_EXCESO,
                     P_MONTO_RC,
                     L_RECARGO_DATABSS,
                     PRIMA_EXENTA,
                     L_PRIMA_PROPUESTA,
                     P_TIPO_DESC,
                     P_DESCUENTO,
                     P_PRIMA,
                     IVA,
                     P_PRIMA_TOTAL,
                     SYSDATE);
                  COMMIT;
                
                END IF;
              
              END IF;
            
            END IF;
          
          ELSE
          
            IF (l_cod_modalidad IN ('8120', '8123', '8125', '8121') AND
               P_EDAD < 35) THEN
            
              P_ERROR := '1001';
            
            ELSE
            
              IF (l_cod_modalidad != '8910' AND P_CANT_SINIESTROS > 3) THEN
              
                P_ERROR := '1002';
              
              ELSE
              
                mel_p_veh_limites_anti(p_cod_docum_mae,
                                       p_conv,
                                       l_cod_modalidad,
                                       l_antig_veh_max);
              
                /*IF ((L_ANTIG_VEH IN (13, 14, 15) AND
                l_cod_modalidad NOT IN ('8900', '8910')) OR
                (L_ANTIG_VEH = 15 AND l_cod_modalidad NOT IN ('8910'))) THEN*/
              
                IF L_ANTIG_VEH > L_ANTIG_VEH_MAX THEN
                
                  P_ERROR := '1003';
                
                ELSIF P_COD_MODALIDAD = '8915' AND L_ANTIG_VEH < 13 THEN
                  P_ERROR := '1003';
                
                ELSE
                
                  P_BUSCA_RC_EXCESO(P_COD_RAMO,
                                    P_RC_EXCESO,
                                    l_cod_modalidad,
                                    P_COD_DOCUM_MAE,
                                    P_CONV,
                                    L_MONTO_RC_EXCESO);
                
                  TRN_K_GLOBAL.BORRA_TODAS@OVPRO_PRD;
                
                  mel_p_num_pol_grupo(1,
                                      801,
                                      P_COD_DOCUM_MAE,
                                      P_CONV,
                                      l_cod_modalidad,
                                      L_NUM_POLIZA_GRUPO,
                                      L_NUM_CONTRATO);
                
                  IF L_NUM_POLIZA_GRUPO IS NOT NULL THEN
                  
                    TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('NUM_POLIZA_GRUPO',
                                                  L_NUM_POLIZA_GRUPO);
                  
                    TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('NUM_CONTRATO',
                                                  L_NUM_CONTRATO);
                  
                  END IF;
                
                  mel_p_scoring(P_COD_DOCUM_ASEG,
                                P_NUM_MATRICULA,
                                P_COD_RAMO,
                                l_cod_modalidad);
                
                  P_BUSCA_COB_OPC(P_COD_RAMO,
                                  P_COB_OPC,
                                  l_cod_modalidad,
                                  P_COD_DOCUM_MAE,
                                  P_CONV,
                                  L_MONTO_COB,
                                  L_MONTO_COB_CONV);
                
                  P_MONTO_COB_EXENTA(P_COD_RAMO,
                                     l_cod_modalidad,
                                     PRIMA_EXENTA);
                
                  P_LLAMA_EM_P_999DV0005(P_COD_RAMO,
                                         l_cod_modalidad,
                                         P_COD_MARCA,
                                         P_COD_MODELO,
                                         P_ANTIG_VEH,
                                         L_ANTIG_VEH,
                                         '1000',
                                         P_NUM_MATRICULA,
                                         'RUT',
                                         P_COD_DOCUM_ASEG,
                                         R_COD_AGT.COD_AGT,
                                         R_COD_AGT.COD_NIVEL3,
                                         P_MONTO_RC,
                                         P_SEXO,
                                         L_RANGO_EDAD_CONDUCTOR,
                                         P_EDAD,
                                         P_MONTO_SINIESTROS,
                                         P_CANT_SINIESTROS,
                                         L_PERDIDA_TOTAL,
                                         P_MCA_MEL,
                                         L_PRIMA_PROPUESTA,
                                         P_TIPO_DESC,
                                         P_DESCUENTO);
                
                  P_CUADRA_PRIMA(L_PRIMA_PROPUESTA,
                                 P_TIPO_DESC,
                                 P_DESCUENTO,
                                 PRIMA_MINIMA,
                                 TIPO_DESCUENTO_CONV,
                                 DESCUENTO_CONV,
                                 L_MONTO_RC_EXCESO,
                                 PRIMA_EXENTA,
                                 L_MONTO_COB - L_MONTO_COB_CONV,
                                 P_TIPO_DESCUENTO_DATABSS,
                                 P_DESCUENTO_DATABSS,
                                 P_COD_DOCUM_MAE,
                                 P_CONV,
                                 L_TIPO_DESCUENTO_FIJO,
                                 L_DESCUENTO_FIJO,
                                 l_cod_modalidad,
                                 P_PRIMA,
                                 P_PRIMA_TOTAL,
                                 P_DESC,
                                 P_PORC_DESC,
                                 P_RECAR,
                                 P_PORC_RECAR);
                
                  INSERT INTO MEL_VEH_BITACORA_COT
                  VALUES
                    (l_cod_modalidad,
                     P_COD_MARCA,
                     P_COD_MODELO,
                     P_COD_SUB_MODELO,
                     P_NUM_MATRICULA,
                     L_ANTIG_VEH,
                     P_ANTIG_VEH,
                     P_COD_DOCUM_ASEG,
                     P_SEXO,
                     P_EDAD,
                     P_MONTO_SINIESTROS,
                     P_CANT_SINIESTROS,
                     P_TIPO_DESCUENTO_DATABSS,
                     P_DESCUENTO_DATABSS,
                     P_COD_DOCUM_MAE,
                     P_CONV,
                     P_MCA_MEL,
                     P_COD_RAMO,
                     P_COB_OPC,
                     P_RC_EXCESO,
                     P_MONTO_RC,
                     L_RECARGO_DATABSS,
                     PRIMA_EXENTA,
                     L_PRIMA_PROPUESTA,
                     P_TIPO_DESC,
                     P_DESCUENTO,
                     P_PRIMA,
                     IVA,
                     P_PRIMA_TOTAL,
                     SYSDATE);
                  COMMIT;
                
                  /*
                    INSERT INTO MEL_VEH_BITACORA_COT
                    VALUES
                      (l_cod_modalidad,
                       P_COD_MARCA,
                       P_COD_MODELO,
                       P_NUM_MATRICULA,
                       P_COD_DOCUM_MAE,
                       P_MONTO_SINIESTROS || '-' || P_CANT_SINIESTROS || '-' ||
                       P_ANTIG_VEH || '-' || L_ANTIG_VEH,
                       L_PRIMA_PROPUESTA,
                       L_PRIMA_PROPUESTA,
                       P_TIPO_DESC,
                       P_DESCUENTO,
                       P_PRIMA,
                       IVA || '-' || PRIMA_EXENTA,
                       P_PRIMA_TOTAL,
                       0,
                       0,
                       0,
                       0,
                       P_COD_DOCUM_ASEG,
                       P_COD_SUB_MODELO,
                       SYSDATE,
                       P_SEXO || '-' || P_EDAD || ' -/ ' || P_COB_OPC);
                    COMMIT;
                  */
                
                  IF NOT L_EXISTE_DCTO THEN
                  
                    IF P_DESC < 0 THEN
                      P_DESC := 0;
                    END IF;
                  
                  END IF;
                
                END IF;
              
              END IF;
            
            END IF;
          
          END IF;
        
        ELSE
        
          IF (l_cod_modalidad IN ('8120', '8123', '8125', '8121') AND
             P_EDAD < 35) THEN
            P_ERROR := '1001';
          
          ELSE
          
            IF (l_cod_modalidad IN ('8915') AND P_CANT_SINIESTROS >= 3) THEN
              P_ERROR := '1002';
            END IF;
          
            IF (l_cod_modalidad != '8910' AND P_CANT_SINIESTROS > 3) THEN
            
              P_ERROR := '1002';
            
            ELSE
            
              mel_p_veh_limites_anti(p_cod_docum_mae,
                                     p_conv,
                                     l_cod_modalidad,
                                     l_antig_veh_max);
            
              /*IF ((L_ANTIG_VEH IN (13, 14, 15) AND
              l_cod_modalidad NOT IN ('8900', '8910')) OR
              (L_ANTIG_VEH = 15 AND l_cod_modalidad NOT IN ('8910'))) THEN*/
            
              IF L_ANTIG_VEH > L_ANTIG_VEH_MAX THEN
              
                P_ERROR := '1003';
              
              ELSE
              
                P_BUSCA_RC_EXCESO(P_COD_RAMO,
                                  P_RC_EXCESO,
                                  l_cod_modalidad,
                                  P_COD_DOCUM_MAE,
                                  P_CONV,
                                  L_MONTO_RC_EXCESO);
              
                TRN_K_GLOBAL.BORRA_TODAS@OVPRO_PRD;
              
                mel_p_num_pol_grupo(1,
                                    801,
                                    P_COD_DOCUM_MAE,
                                    P_CONV,
                                    l_cod_modalidad,
                                    L_NUM_POLIZA_GRUPO,
                                    L_NUM_CONTRATO);
              
                IF L_NUM_POLIZA_GRUPO IS NOT NULL THEN
                
                  TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('NUM_POLIZA_GRUPO',
                                                L_NUM_POLIZA_GRUPO);
                
                  TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('NUM_CONTRATO',
                                                L_NUM_CONTRATO);
                
                END IF;
              
                mel_p_scoring(P_COD_DOCUM_ASEG,
                              P_NUM_MATRICULA,
                              P_COD_RAMO,
                              l_cod_modalidad);
              
                P_BUSCA_COB_OPC(P_COD_RAMO,
                                P_COB_OPC,
                                l_cod_modalidad,
                                P_COD_DOCUM_MAE,
                                P_CONV,
                                L_MONTO_COB,
                                L_MONTO_COB_CONV);
              
                P_MONTO_COB_EXENTA(P_COD_RAMO,
                                   l_cod_modalidad,
                                   PRIMA_EXENTA);
              
                P_LLAMA_EM_P_999DV0005(P_COD_RAMO,
                                       l_cod_modalidad,
                                       P_COD_MARCA,
                                       P_COD_MODELO,
                                       P_ANTIG_VEH,
                                       L_ANTIG_VEH,
                                       '1000',
                                       P_NUM_MATRICULA,
                                       'RUT',
                                       P_COD_DOCUM_ASEG,
                                       R_COD_AGT.COD_AGT,
                                       R_COD_AGT.COD_NIVEL3,
                                       P_MONTO_RC,
                                       P_SEXO,
                                       L_RANGO_EDAD_CONDUCTOR,
                                       P_EDAD,
                                       P_MONTO_SINIESTROS,
                                       P_CANT_SINIESTROS,
                                       L_PERDIDA_TOTAL,
                                       P_MCA_MEL,
                                       L_PRIMA_PROPUESTA,
                                       P_TIPO_DESC,
                                       P_DESCUENTO);
              
                P_CUADRA_PRIMA(L_PRIMA_PROPUESTA,
                               P_TIPO_DESC,
                               P_DESCUENTO,
                               PRIMA_MINIMA,
                               TIPO_DESCUENTO_CONV,
                               DESCUENTO_CONV,
                               L_MONTO_RC_EXCESO,
                               PRIMA_EXENTA,
                               L_MONTO_COB - L_MONTO_COB_CONV,
                               P_TIPO_DESCUENTO_DATABSS,
                               P_DESCUENTO_DATABSS,
                               P_COD_DOCUM_MAE,
                               P_CONV,
                               L_TIPO_DESCUENTO_FIJO,
                               L_DESCUENTO_FIJO,
                               l_cod_modalidad,
                               P_PRIMA,
                               P_PRIMA_TOTAL,
                               P_DESC,
                               P_PORC_DESC,
                               P_RECAR,
                               P_PORC_RECAR);
              
                INSERT INTO MEL_VEH_BITACORA_COT
                VALUES
                  (l_cod_modalidad,
                   P_COD_MARCA,
                   P_COD_MODELO,
                   P_COD_SUB_MODELO,
                   P_NUM_MATRICULA,
                   L_ANTIG_VEH,
                   P_ANTIG_VEH,
                   P_COD_DOCUM_ASEG,
                   P_SEXO,
                   P_EDAD,
                   P_MONTO_SINIESTROS,
                   P_CANT_SINIESTROS,
                   P_TIPO_DESCUENTO_DATABSS,
                   P_DESCUENTO_DATABSS,
                   P_COD_DOCUM_MAE,
                   P_CONV,
                   P_MCA_MEL,
                   P_COD_RAMO,
                   P_COB_OPC,
                   P_RC_EXCESO,
                   P_MONTO_RC,
                   L_RECARGO_DATABSS,
                   PRIMA_EXENTA,
                   L_PRIMA_PROPUESTA,
                   P_TIPO_DESC,
                   P_DESCUENTO,
                   P_PRIMA,
                   IVA,
                   P_PRIMA_TOTAL,
                   SYSDATE);
                COMMIT;
              
                /*
                  INSERT INTO MEL_VEH_BITACORA_COT
                  VALUES
                    (l_cod_modalidad,
                     P_COD_MARCA,
                     P_COD_MODELO,
                     P_NUM_MATRICULA,
                     P_COD_DOCUM_MAE,
                     P_MONTO_SINIESTROS || '-' || P_CANT_SINIESTROS || '-' ||
                     P_ANTIG_VEH || '-' || L_ANTIG_VEH,
                     L_PRIMA_PROPUESTA,
                     L_PRIMA_PROPUESTA,
                     P_TIPO_DESC,
                     P_DESCUENTO,
                     P_PRIMA,
                     IVA || '-' || PRIMA_EXENTA,
                     P_PRIMA_TOTAL,
                     0,
                     0,
                     0,
                     0,
                     P_COD_DOCUM_ASEG,
                     P_COD_SUB_MODELO,
                     SYSDATE,
                     P_SEXO || '-' || P_EDAD || ' -/ ' || P_COB_OPC);
                  COMMIT;
                */
              
                IF NOT L_EXISTE_DCTO THEN
                   P_DESC := 0;
                   /*
                   IF P_DESC < 0 THEN
                      P_DESC := 0;
                   END IF;
                   */
                
                END IF;
              
              END IF;
            
            END IF;
          
          END IF;
        
      END CASE;
    
      /* IF P_ERROR != '0' THEN
        OV.P_ENVIA_MAIL_HTML('OV@MAPFRE.CL',
                             'GERARDO.PEREZ@MAPFRE.CL',
                             'ERROR EN COTIZADOR DE VEHICULOS LIVIANOS - COTIZAR',
                             P_ERROR);
      END IF;*/
    
      P_DESC       := TRIM(TO_CHAR(0, '990.99'));
      P_PORC_DESC  := ROUND(50, 2);
      P_RECAR      := TRIM(TO_CHAR(0, '990.99'));
      P_PORC_RECAR := ROUND(0, 2);
    
    end if;
  
  EXCEPTION
    WHEN OTHERS THEN
      P_ERROR := SUBSTR(SQLERRM, 0, 99);
      /*MESSAGE := '<BR><STRONG> ' || SQLERRM || '</STRONG><BR>' ||
      '<BR><STRONG>COD_RAMO: </STRONG>' || P_COD_RAMO ||
      '<BR><STRONG>COD_DOCUM: </STRONG>' || P_COD_DOCUM_MAE ||
      '<BR><STRONG>COD_DOCUM_ASEG : </STRONG>' ||
      P_COD_DOCUM_ASEG || '<BR><STRONG>COD_MARCA: </STRONG>' ||
      P_COD_MARCA || ' -- ' ||
      EA_F_NOM_MARCA_TRN@OVPRO_PRD(1, P_COD_MARCA, '') ||
      '<BR><STRONG>COD_MODELO :</STRONG>' || P_COD_MODELO ||
      ' -- ' || EA_F_NOM_MODELO_TRN@OVPRO_PRD(1,
                                              P_COD_MARCA,
                                              P_COD_MODELO,
                                              '') ||
      '<BR><STRONG>COD_SUB_MODELO : </STRONG>' ||
      P_COD_SUB_MODELO || ' -- ' ||
      EA_F_NOM_SUB_MODELO@OVPRO_PRD(1,
                                    P_COD_MARCA,
                                    P_COD_MODELO,
                                    P_COD_SUB_MODELO,
                                    '') ||
      '<BR><STRONG>ANIO_FAB :</STRONG>' || P_ANTIG_VEH ||
      '<BR><STRONG>COD_MODALIDAD :</STRONG>' || l_cod_modalidad ||
      '<BR><STRONG>NUM_MATRICULA: </STRONG>' || P_NUM_MATRICULA ||
      '<BR><STRONG>CANTIDAD SINIESTROS :</STRONG>' ||
      P_CANT_SINIESTROS ||
      '<BR><STRONG>MONTO SINIESTROS :</STRONG>' ||
      P_MONTO_SINIESTROS || '<BR><STRONG>SEXO :</STRONG>' ||
      P_SEXO || '<BR><STRONG>EDAD :</STRONG>' || P_EDAD ||
      '<BR><STRONG>MONTO RC :</STRONG>' || P_MONTO_RC ||
      '<BR><STRONG>RC EXCESO :</STRONG>' || P_RC_EXCESO ||
      '<BR>';*/
    /*OV.P_ENVIA_MAIL_HTML('OV@MAPFRE.CL',
    'GERARDO.PEREZ@MAPFRE.CL',
    'ERROR EN COTIZADOR DE VEHICULOS LIVIANOS - COTIZAR',
    MESSAGE);*/
  
  END P_CALCULA_PRIMAS;

  /************************************/

  PROCEDURE P_LLAMA_EM_P_999DV0005(P_COD_RAMO             VARCHAR2,
                                   P_COD_MODALIDAD        VARCHAR2,
                                   P_COD_MARCA            VARCHAR2,
                                   P_COD_MODELO           VARCHAR2,
                                   P_ANIO_VEH             VARCHAR2,
                                   P_ANTIG_VEH            VARCHAR2,
                                   P_VAL_SUB_MODELO       VARCHAR2,
                                   P_NUM_MATRICULA        VARCHAR2,
                                   P_TIP_DOCUM            VARCHAR2,
                                   P_COD_DOCUM_ASEG       VARCHAR2,
                                   P_COD_AGT              VARCHAR2,
                                   P_COD_NIVEL3           VARCHAR2,
                                   P_MONTO_RC             VARCHAR2,
                                   P_SEXO                 VARCHAR2,
                                   P_RANGO_EDAD_CONDUCTOR VARCHAR2,
                                   P_EDAD                 VARCHAR2,
                                   P_MONTO_SINIESTROS     VARCHAR2,
                                   P_CANT_SINIESTROS      VARCHAR2,
                                   P_PERDIDA_TOTAL        VARCHAR2,
                                   P_MCA_MEL              VARCHAR2,
                                   P_PRIMA_PROPUESTA      OUT VARCHAR2,
                                   P_TIPO_DESC            OUT VARCHAR2,
                                   P_DESCUENTO            OUT VARCHAR2) IS
  
    L_SEXO                 VARCHAR2(10);
    L_EDAD                 VARCHAR2(10);
    L_RANGO_EDAD_CONDUCTOR VARCHAR2(10);
  
  BEGIN
  
    IF P_SEXO = 9 THEN
      L_SEXO := '1'; -- SI ES JURIDICO, SE ASUME COMO HOMBRE DE 30 A?OS. MANTIS 48788
      L_EDAD := '30';
      P_BUSCA_RANGO_EDAD(L_EDAD, L_RANGO_EDAD_CONDUCTOR);
    ELSE
      L_SEXO                 := P_SEXO;
      L_EDAD                 := P_EDAD;
      L_RANGO_EDAD_CONDUCTOR := P_RANGO_EDAD_CONDUCTOR;
    END IF;
  
    TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('COD_CIA', 1);
    TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('COD_RAMO', P_COD_RAMO);
    TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('DVCOD_MODALIDAD', P_COD_MODALIDAD);
    TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('DVCOD_MARCA', P_COD_MARCA);
    TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('DVCOD_MODELO', P_COD_MODELO);
    TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('DVANIO_SUB_MODELO', P_ANIO_VEH);
    TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('DVANTIG_VEH', P_ANTIG_VEH);
    TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('DVVAL_SUB_MODELO', P_VAL_SUB_MODELO);
    TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('DVNUM_MATRICULA', P_NUM_MATRICULA);
    TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('TIP_DOCUM', P_TIP_DOCUM);
    TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('COD_DOCUM', P_COD_DOCUM_ASEG);
    TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('VIA_EMISION', P_MCA_MEL);
    TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('DVMCA_MEL', 'S');
    TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('DVIMP_PRIMA_PROPUESTA', 0);
    --TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('MCA_MEL', P_MCA_MEL);
    TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('MCA_MEL', 'S');
    TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('TIP_MVTO_BATCH', '3');
    TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('FEC_EFEC_SPTO',
                                  TO_CHAR(SYSDATE, 'DDMMYYYY'));
    TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('FEC_VCTO_SPTO',
                                  TO_CHAR(ADD_MONTHS(sysdate, 12),
                                          'DDMMYYYY'));
  
    TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('TIP_SPTO', 'XX');
  
    TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('COD_AGT', P_COD_AGT);
    TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('COD_NIVEL3', P_COD_NIVEL3);
  
    TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('DVMONTO_RC', P_MONTO_RC);
    TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('DVMCA_SEXO', L_SEXO);
    TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('DVRANGO_EDAD', L_RANGO_EDAD_CONDUCTOR);
    TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('DVEDAD_COND', L_EDAD);
  
    TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('MONTO_SNTROS', P_MONTO_SINIESTROS);
    TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('CANT_SNTROS', P_CANT_SINIESTROS);
  
    TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('DVPERD_TOTAL', P_PERDIDA_TOTAL);
  
    TRON2000.EM_P_999DV0005_MCL@OVPRO_PRD;
  
    P_PRIMA_PROPUESTA := TRN_K_GLOBAL.DEVUELVE@OVPRO_PRD('DVIMP_PRIMA_PROPUESTA');
  
    P_TIPO_DESC := TRN_K_GLOBAL.DEVUELVE@OVPRO_PRD('TIPO_DCTO_S');
    P_DESCUENTO := TRN_K_GLOBAL.DEVUELVE@OVPRO_PRD('DCTO_SISGEN');
  
    IF P_DESCUENTO IS NULL THEN
      P_DESCUENTO := 0;
    END IF;
  
  END P_LLAMA_EM_P_999DV0005;

  /************************************/

  PROCEDURE P_CUADRA_PRIMA(P_PRIMA_PROPUESTA        NUMBER,
                           P_TIPO_DESC              VARCHAR2,
                           P_DESCUENTO              VARCHAR2,
                           P_PRIMA_MINIMA           NUMBER,
                           P_TIPO_DESCUENTO_CONV    VARCHAR2,
                           P_DESCUENTO_CONV         NUMBER,
                           P_MONTO_RC_EXCESO        NUMBER,
                           P_PRIMA_EXENTA           NUMBER,
                           P_MONTO_COB_OPC          NUMBER,
                           P_TIPO_DESCUENTO_DATABSS VARCHAR2,
                           P_DESCUENTO_DATABSS      VARCHAR2,
                           P_COD_DOCUM_MAE          VARCHAR2,
                           P_COD_CONV               VARCHAR2,
                           P_TIPO_DESCUENTO_FIJO    VARCHAR2,
                           P_DESCUENTO_FIJO         VARCHAR2,
                           P_COD_MODALIDAD          VARCHAR2,
                           P_PRIMA                  OUT VARCHAR2,
                           P_PRIMA_TOTAL            OUT VARCHAR2,
                           P_DESC                   OUT VARCHAR2,
                           P_PORC_DESC              OUT VARCHAR2,
                           P_RECAR                  OUT VARCHAR2,
                           P_PORC_RECAR             OUT VARCHAR2) IS
  
    PRIMA             NUMBER;
    IVA               NUMBER;
    L_RECARGO_DATABSS NUMBER;
    DESCUENTO         NUMBER;
    PRIMA_TOTAL       NUMBER;
  
    CURSOR C_DESCUENTO_FIJO(L_COD_DOCUM VARCHAR2) IS
      SELECT T.DCTO_FIJO, T.TIPO_DCTO_FIJO
        FROM MEL_DESCUENTOS T
       WHERE T.COD_DOCUM = L_COD_DOCUM
         AND T.COD_CONV IS NULL
         AND T.MCA_INH = 'N'
         AND T.MCA_INH_DCTO_FIJO = 'N';
  
    CURSOR C_DESCUENTO_FIJO_CONV(L_CONV VARCHAR2) IS
      SELECT T.DCTO_FIJO, T.TIPO_DCTO_FIJO
        FROM MEL_DESCUENTOS T
       WHERE T.COD_CONV = L_CONV
         AND MCA_INH = 'N'
         AND T.MCA_INH_DCTO_FIJO = 'N';
  
    R_DESCUENTO_FIJO C_DESCUENTO_FIJO_CONV%ROWTYPE;
    L_EXISTE_DCTO    BOOLEAN;
  
    DESCUENTO_CONV_FIJO      NUMBER := 0;
    TIPO_DESCUENTO_CONV_FIJO VARCHAR2(2);
  
    L_TIPO_DESCUENTO_DATABSS VARCHAR2(10);
    L_DESCUENTO_DATABSS      VARCHAR2(10);
  
  BEGIN
  
    PRIMA := ROUND(P_PRIMA_PROPUESTA + P_MONTO_RC_EXCESO + P_MONTO_COB_OPC,
                   2);
    IVA   := ROUND(DC_F_IVA_VIGENTE());
  
    IF P_TIPO_DESCUENTO_DATABSS IS NULL THEN
      L_TIPO_DESCUENTO_DATABSS := '0';
    ELSE
      L_TIPO_DESCUENTO_DATABSS := P_TIPO_DESCUENTO_DATABSS;
    END IF;
  
    IF P_DESCUENTO_DATABSS IS NULL THEN
      L_DESCUENTO_DATABSS := '0';
    ELSE
      L_DESCUENTO_DATABSS := P_DESCUENTO_DATABSS;
    END IF;
  
    L_RECARGO_DATABSS := ROUND((L_DESCUENTO_DATABSS) * PRIMA *
                               L_TIPO_DESCUENTO_DATABSS,
                               2);
  
    PRIMA := PRIMA + L_RECARGO_DATABSS;
  
    P_PRIMA := TRIM(TO_CHAR(PRIMA, '990.99'));
  
    IF P_TIPO_DESC != -1 THEN
    
      P_DESC := TRIM(TO_CHAR(0, '990.99'));
    
      DESCUENTO := ROUND((P_DESCUENTO) * P_PRIMA_PROPUESTA * P_TIPO_DESC, 2);
    
      P_RECAR := TRIM(TO_CHAR(DESCUENTO, '990.99'));
    
      PRIMA_TOTAL := ROUND((PRIMA + DESCUENTO - P_PRIMA_EXENTA) * IVA / 100 +
                           (PRIMA + DESCUENTO),
                           2);
    
      P_PRIMA_TOTAL := TRIM(TO_CHAR(PRIMA_TOTAL, '990.99'));
    
      P_PORC_DESC  := ROUND(0, 2);
      P_PORC_RECAR := TRIM(TO_CHAR(P_DESCUENTO * 100));
    
      PRIMA   := PRIMA + DESCUENTO;
      P_PRIMA := TRIM(TO_CHAR(PRIMA, '990.99'));
    
    ELSE
    
      P_RECAR   := TRIM(TO_CHAR(0, '990.99'));
      DESCUENTO := ROUND((P_DESCUENTO / 2) * P_PRIMA_PROPUESTA *
                         P_TIPO_DESC,
                         2);
      P_DESC    := TRIM(TO_CHAR(DESCUENTO, '990.99'));
    
      PRIMA_TOTAL := ROUND((PRIMA + DESCUENTO - P_PRIMA_EXENTA) * IVA / 100 +
                           (PRIMA + DESCUENTO),
                           2);
    
      --PRIMA   := PRIMA + DESCUENTO;    
      -- P_PRIMA := TRIM(TO_CHAR(PRIMA, '990.99'));                     
    
      --P_IVA := TRIM(TO_CHAR((PRIMA + DESCUENTO) * IVA / 100, '990.99'));
    
      IF (PRIMA + DESCUENTO) > P_PRIMA_MINIMA THEN
      
        PRIMA   := PRIMA + DESCUENTO;
        P_PRIMA := TRIM(TO_CHAR(PRIMA, '990.99'));
      
        P_PRIMA_TOTAL := TRIM(TO_CHAR(PRIMA_TOTAL, '990.99'));
      
        P_PORC_DESC := TRIM(TO_CHAR((P_DESCUENTO / 2) * 100));
      
        P_PORC_RECAR := ROUND(0, 2);
      
      ELSE
      
        P_RECAR   := TRIM(TO_CHAR(0, '990.99'));
        DESCUENTO := 0;
      
        P_DESC := TRIM(TO_CHAR(DESCUENTO, '990.99'));
      
        PRIMA   := P_PRIMA_MINIMA;
        P_PRIMA := TRIM(TO_CHAR(PRIMA, '990.99'));
      
        --P_IVA := TRIM(TO_CHAR((PRIMA + DESCUENTO) * IVA / 100, '990.99'));
      
        PRIMA_TOTAL := ROUND((PRIMA + DESCUENTO - P_PRIMA_EXENTA) * IVA / 100 +
                             (PRIMA + DESCUENTO),
                             2);
      
        P_PRIMA_TOTAL := TRIM(TO_CHAR(PRIMA_TOTAL, '990.99'));
      
        P_PORC_DESC := TRIM(TO_CHAR((P_DESCUENTO / 2) * 100));
      
        P_PORC_RECAR := ROUND(0, 2);
      
      END IF;
    
    END IF;
  
    /******* DESCUENTO Y RECARGO POR CONVENIO ******/
    IF P_TIPO_DESCUENTO_CONV = '1' AND P_DESCUENTO_CONV != 0 THEN
    
      DESCUENTO := ROUND((P_DESCUENTO_CONV) * P_PRIMA_PROPUESTA *
                         P_TIPO_DESCUENTO_CONV,
                         2);
    
      P_RECAR := TRIM(TO_CHAR(DESCUENTO, '990.99'));
    
      PRIMA_TOTAL := ROUND((PRIMA + DESCUENTO - P_PRIMA_EXENTA) * IVA / 100 +
                           (PRIMA + DESCUENTO),
                           2);
    
      P_PRIMA_TOTAL := TRIM(TO_CHAR(PRIMA_TOTAL, '990.99'));
    
      P_PORC_DESC  := ROUND(0, 2);
      P_PORC_RECAR := TRIM(TO_CHAR(P_DESCUENTO * 100));
    
      PRIMA   := PRIMA + DESCUENTO;
      P_PRIMA := TRIM(TO_CHAR(PRIMA, '990.99'));
    
    END IF;
  
    IF P_TIPO_DESCUENTO_CONV = '-1' AND P_DESCUENTO_CONV != 0 THEN
    
      P_RECAR   := TRIM(TO_CHAR(0, '990.99'));
      DESCUENTO := ROUND((P_DESCUENTO_CONV) * P_PRIMA_PROPUESTA *
                         P_TIPO_DESCUENTO_CONV,
                         2);
      P_DESC    := TRIM(TO_CHAR(DESCUENTO, '990.99'));
    
      PRIMA_TOTAL := ROUND((PRIMA + DESCUENTO - P_PRIMA_EXENTA) * IVA / 100 +
                           (PRIMA + DESCUENTO),
                           2);
    
      --P_IVA := TRIM(TO_CHAR((PRIMA + DESCUENTO) * IVA / 100, '990.99'));
    
      IF (PRIMA + DESCUENTO) > P_PRIMA_MINIMA THEN
      
        --
      
        P_PRIMA := TRIM(TO_CHAR(PRIMA + DESCUENTO, '990.99'));
      
        P_PRIMA_TOTAL := TRIM(TO_CHAR(PRIMA_TOTAL, '990.99'));
      
        P_PORC_DESC := TRIM(TO_CHAR((P_DESCUENTO_CONV) * 100));
      
        P_PORC_RECAR := ROUND(0, 2);
      
        PRIMA := PRIMA + DESCUENTO;
      
      ELSE
      
        P_RECAR   := TRIM(TO_CHAR(0, '990.99'));
        DESCUENTO := 0;
        P_DESC    := TRIM(TO_CHAR(DESCUENTO, '990.99'));
      
        --P_IVA := TRIM(TO_CHAR((PRIMA + DESCUENTO) * IVA / 100, '990.99'));      
      
        PRIMA   := P_PRIMA_MINIMA;
        P_PRIMA := TRIM(TO_CHAR(PRIMA, '990.99'));
      
        PRIMA_TOTAL := ROUND((PRIMA + DESCUENTO - P_PRIMA_EXENTA) * IVA / 100 +
                             (PRIMA + DESCUENTO),
                             2);
      
        P_PRIMA_TOTAL := TRIM(TO_CHAR(PRIMA_TOTAL, '990.99'));
      
        P_PORC_DESC := TRIM(TO_CHAR((P_DESCUENTO_CONV) * 100));
      
        P_PORC_RECAR := ROUND(0, 2);
      
      END IF;
    
    END IF;
    /*********/
  
    /**********DESCUENTO Y RECARGO POR MONTO FIJO *********/
    IF P_COD_CONV IS NULL THEN
    
      OPEN C_DESCUENTO_FIJO(P_COD_DOCUM_MAE);
      FETCH C_DESCUENTO_FIJO
        INTO R_DESCUENTO_FIJO;
      L_EXISTE_DCTO := C_DESCUENTO_FIJO%FOUND;
      CLOSE C_DESCUENTO_FIJO;
    
    ELSE
    
      OPEN C_DESCUENTO_FIJO_CONV(P_COD_CONV);
      FETCH C_DESCUENTO_FIJO_CONV
        INTO R_DESCUENTO_FIJO;
      L_EXISTE_DCTO := C_DESCUENTO_FIJO_CONV%FOUND;
      CLOSE C_DESCUENTO_FIJO_CONV;
    
    END IF;
  
    IF L_EXISTE_DCTO THEN
    
      DESCUENTO_CONV_FIJO      := R_DESCUENTO_FIJO.DCTO_FIJO;
      TIPO_DESCUENTO_CONV_FIJO := R_DESCUENTO_FIJO.TIPO_DCTO_FIJO;
    
      IF TIPO_DESCUENTO_CONV_FIJO = '1' AND DESCUENTO_CONV_FIJO != 0 THEN
      
        DESCUENTO := ROUND(DESCUENTO_CONV_FIJO, 2);
      
        P_RECAR := TRIM(TO_CHAR(DESCUENTO, '990.99'));
      
        PRIMA_TOTAL := ROUND((PRIMA + DESCUENTO - P_PRIMA_EXENTA) * IVA / 100 +
                             (PRIMA + DESCUENTO),
                             2);
      
        P_PRIMA_TOTAL := TRIM(TO_CHAR(PRIMA_TOTAL, '990.99'));
      
        P_PORC_DESC  := ROUND(0, 2);
        P_PORC_RECAR := TRIM(TO_CHAR(P_DESCUENTO * 100));
      
        PRIMA   := PRIMA + DESCUENTO;
        P_PRIMA := TRIM(TO_CHAR(PRIMA, '990.99'));
      
      END IF;
    
      IF TIPO_DESCUENTO_CONV_FIJO = '-1' AND DESCUENTO_CONV_FIJO != 0 THEN
      
        P_RECAR   := TRIM(TO_CHAR(0, '990.99'));
        DESCUENTO := ROUND(DESCUENTO_CONV_FIJO * TIPO_DESCUENTO_CONV_FIJO,
                           2);
        P_DESC    := TRIM(TO_CHAR(DESCUENTO, '990.99'));
      
        PRIMA_TOTAL := ROUND((PRIMA + DESCUENTO - P_PRIMA_EXENTA) * IVA / 100 +
                             (PRIMA + DESCUENTO),
                             2);
      
        IF (PRIMA + DESCUENTO) > P_PRIMA_MINIMA THEN
        
          P_PRIMA := TRIM(TO_CHAR(PRIMA + DESCUENTO, '990.99'));
        
          P_PRIMA_TOTAL := TRIM(TO_CHAR(PRIMA_TOTAL, '990.99'));
        
          P_PORC_DESC := TRIM(TO_CHAR((P_DESCUENTO_CONV) * 100));
        
          P_PORC_RECAR := ROUND(0, 2);
        
        ELSE
        
          P_RECAR   := TRIM(TO_CHAR(0, '990.99'));
          DESCUENTO := 0;
          P_DESC    := TRIM(TO_CHAR(DESCUENTO, '990.99'));
        
          PRIMA   := P_PRIMA_MINIMA;
          P_PRIMA := TRIM(TO_CHAR(PRIMA, '990.99'));
        
          PRIMA_TOTAL := ROUND((PRIMA + DESCUENTO - P_PRIMA_EXENTA) * IVA / 100 +
                               (PRIMA + DESCUENTO),
                               2);
        
          P_PRIMA_TOTAL := TRIM(TO_CHAR(PRIMA_TOTAL, '990.99'));
        
          P_PORC_DESC := TRIM(TO_CHAR((P_DESCUENTO_CONV) * 100));
        
          P_PORC_RECAR := ROUND(0, 2);
        
        END IF;
      
      END IF;
    
    END IF;
  
    /*****************************************/
  
    IF P_TIPO_DESCUENTO_FIJO IS NOT NULL AND P_DESCUENTO_FIJO IS NOT NULL THEN
    
      DESCUENTO_CONV_FIJO      := P_DESCUENTO_FIJO;
      TIPO_DESCUENTO_CONV_FIJO := P_TIPO_DESCUENTO_FIJO;
    
      IF TIPO_DESCUENTO_CONV_FIJO = '1' AND DESCUENTO_CONV_FIJO != 0 THEN
      
        DESCUENTO := ROUND(DESCUENTO_CONV_FIJO, 2);
      
        P_RECAR := TRIM(TO_CHAR(DESCUENTO, '990.99'));
      
        PRIMA_TOTAL := ROUND((PRIMA + DESCUENTO - P_PRIMA_EXENTA) * IVA / 100 +
                             (PRIMA + DESCUENTO),
                             2);
      
        P_PRIMA_TOTAL := TRIM(TO_CHAR(PRIMA_TOTAL, '990.99'));
      
        P_PORC_DESC  := ROUND(0, 2);
        P_PORC_RECAR := TRIM(TO_CHAR(P_DESCUENTO * 100));
      
        PRIMA   := PRIMA + DESCUENTO;
        P_PRIMA := TRIM(TO_CHAR(PRIMA, '990.99'));
      
      END IF;
    
      IF TIPO_DESCUENTO_CONV_FIJO = '-1' AND DESCUENTO_CONV_FIJO != 0 THEN
      
        P_RECAR   := TRIM(TO_CHAR(0, '990.99'));
        DESCUENTO := ROUND(DESCUENTO_CONV_FIJO * TIPO_DESCUENTO_CONV_FIJO,
                           2);
        P_DESC    := TRIM(TO_CHAR(DESCUENTO, '990.99'));
      
        PRIMA_TOTAL := ROUND((PRIMA + DESCUENTO - P_PRIMA_EXENTA) * IVA / 100 +
                             (PRIMA + DESCUENTO),
                             2);
      
        IF (PRIMA + DESCUENTO) > P_PRIMA_MINIMA THEN
        
          P_PRIMA := TRIM(TO_CHAR(PRIMA + DESCUENTO, '990.99'));
        
          P_PRIMA_TOTAL := TRIM(TO_CHAR(PRIMA_TOTAL, '990.99'));
        
          P_PORC_DESC := TRIM(TO_CHAR((P_DESCUENTO_CONV) * 100));
        
          P_PORC_RECAR := ROUND(0, 2);
        
        ELSE
        
          P_RECAR   := TRIM(TO_CHAR(0, '990.99'));
          DESCUENTO := 0;
          P_DESC    := TRIM(TO_CHAR(DESCUENTO, '990.99'));
        
          PRIMA   := P_PRIMA_MINIMA;
          P_PRIMA := TRIM(TO_CHAR(PRIMA, '990.99'));
        
          PRIMA_TOTAL := ROUND((PRIMA + DESCUENTO - P_PRIMA_EXENTA) * IVA / 100 +
                               (PRIMA + DESCUENTO),
                               2);
        
          P_PRIMA_TOTAL := TRIM(TO_CHAR(PRIMA_TOTAL, '990.99'));
        
          P_PORC_DESC := TRIM(TO_CHAR((P_DESCUENTO_CONV) * 100));
        
          P_PORC_RECAR := ROUND(0, 2);
        
        END IF;
      
      END IF;
    
    END IF;
  
    /****PRIMA MINIMA RIPLEY DE TUS AMORES****/
  
    IF P_COD_CONV IN ('RIPLEYUC', 'RIPLEYCC', 'RIPLEYUCHILE') THEN
      CASE P_COD_MODALIDAD
        WHEN 8000 THEN
          IF PRIMA + DESCUENTO < 14 THEN
            PRIMA         := 14;
            DESCUENTO     := 0;
            P_PRIMA       := TRIM(TO_CHAR(PRIMA, '990.99'));
            PRIMA_TOTAL   := ROUND((PRIMA + DESCUENTO - P_PRIMA_EXENTA) * IVA / 100 +
                                   (PRIMA + DESCUENTO),
                                   2);
            P_PRIMA_TOTAL := TRIM(TO_CHAR(PRIMA_TOTAL, '990.99'));
            P_PORC_DESC   := TRIM(TO_CHAR((P_DESCUENTO_CONV) * 100));
            P_PORC_RECAR  := ROUND(0, 2);
          END IF;
        WHEN 8003 THEN
          IF PRIMA + DESCUENTO < 12 THEN
            PRIMA         := 12;
            DESCUENTO     := 0;
            P_PRIMA       := TRIM(TO_CHAR(PRIMA, '990.99'));
            PRIMA_TOTAL   := ROUND((PRIMA + DESCUENTO - P_PRIMA_EXENTA) * IVA / 100 +
                                   (PRIMA + DESCUENTO),
                                   2);
            P_PRIMA_TOTAL := TRIM(TO_CHAR(PRIMA_TOTAL, '990.99'));
            P_PORC_DESC   := TRIM(TO_CHAR((P_DESCUENTO_CONV) * 100));
            P_PORC_RECAR  := ROUND(0, 2);
          END IF;
        WHEN 8005 THEN
          IF PRIMA + DESCUENTO < 10 THEN
            PRIMA         := 10;
            DESCUENTO     := 0;
            P_PRIMA       := TRIM(TO_CHAR(PRIMA, '990.99'));
            PRIMA_TOTAL   := ROUND((PRIMA + DESCUENTO - P_PRIMA_EXENTA) * IVA / 100 +
                                   (PRIMA + DESCUENTO),
                                   2);
            P_PRIMA_TOTAL := TRIM(TO_CHAR(PRIMA_TOTAL, '990.99'));
            P_PORC_DESC   := TRIM(TO_CHAR((P_DESCUENTO_CONV) * 100));
            P_PORC_RECAR  := ROUND(0, 2);
          END IF;
        WHEN 8010 THEN
          IF PRIMA + DESCUENTO < 9 THEN
            PRIMA         := 9;
            DESCUENTO     := 0;
            P_PRIMA       := TRIM(TO_CHAR(PRIMA, '990.99'));
            PRIMA_TOTAL   := ROUND((PRIMA + DESCUENTO - P_PRIMA_EXENTA) * IVA / 100 +
                                   (PRIMA + DESCUENTO),
                                   2);
            P_PRIMA_TOTAL := TRIM(TO_CHAR(PRIMA_TOTAL, '990.99'));
            P_PORC_DESC   := TRIM(TO_CHAR((P_DESCUENTO_CONV) * 100));
            P_PORC_RECAR  := ROUND(0, 2);
          END IF;
      END CASE;
    
    END IF;
  
    /*****************************************/
  
  END P_CUADRA_PRIMA;

  /************************************/

  PROCEDURE P_DATOS_VEH_COTIZACION(P_COD_MARCA      VARCHAR2,
                                   P_COD_MODELO     VARCHAR2,
                                   P_COD_SUB_MODELO VARCHAR2,
                                   P_USO_VEH        VARCHAR2,
                                   P_COD_RAMO       OUT VARCHAR2,
                                   P_COD_TIP_VEHI   OUT VARCHAR2,
                                   P_ERROR          OUT VARCHAR2) IS
  
    CURSOR C_TIP_VEHI(v_cod_sub_modelo varchar2) IS
      SELECT T.COD_TIP_VEHI
        FROM A2100420@OVPRO_PRD T
       WHERE T.COD_MARCA = P_COD_MARCA
         AND T.COD_MODELO = P_COD_MODELO
         AND T.COD_SUB_MODELO = v_cod_sub_modelo
         AND T.FEC_VALIDEZ = (SELECT MAX(B.FEC_VALIDEZ)
                                FROM A2100420@OVPRO_PRD B
                               WHERE B.COD_MARCA = T.COD_MARCA
                                 AND B.COD_MODELO = T.COD_MODELO
                                 AND B.COD_SUB_MODELO = T.COD_SUB_MODELO
                                 AND B.MCA_INH = 'N');
  
    L_TIP_VEHI C_TIP_VEHI%ROWTYPE;
    L_EXISTE   BOOLEAN;
    L_USO_VEHI NUMBER;
  
    CURSOR C_SUB_MODELO IS
      SELECT SMOD.COD_SUB_MODELO COD_SUB_MODELO
        FROM A2100420@OVPRO_PRD SMOD, A2100420@OVPRO_PRD C
       WHERE SMOD.COD_CIA = 1
         AND SMOD.COD_MARCA = P_COD_MARCA
         AND SMOD.COD_MODELO = P_COD_MODELO
         AND C.COD_CIA = SMOD.COD_CIA
         AND C.COD_MARCA = SMOD.COD_MARCA
         AND C.COD_MODELO = SMOD.COD_MODELO
         AND C.COD_SUB_MODELO = SMOD.COD_SUB_MODELO
         AND C.COD_TIP_VEHI <= 6
         and c.mca_inh = 'N'
         AND SMOD.fec_VALIDEZ =
             (select max(b.fec_VALIDEZ)
                from A2100420@OVPRO_PRD b
               where SMOD.COD_CIA = b.COD_CIA
                 AND SMOD.COD_SUB_MODELO = b.COD_SUB_MODELO
                 AND SMOD.COD_MARCA = b.COD_MARCA
                 AND SMOD.COD_MODELO = b.COD_MODELO)
         AND ROWNUM = 1;
  
    L_COD_SUB_MODELO VARCHAR2(50);
  
  BEGIN
  
    IF UPPER(P_USO_VEH) = 'P' THEN
      L_USO_VEHI := 1;
    ELSE
      L_USO_VEHI := 5;
    END IF;
  
    IF P_COD_SUB_MODELO IS NULL OR P_COD_SUB_MODELO = 0 THEN
    
      OPEN C_SUB_MODELO;
      FETCH C_SUB_MODELO
        INTO L_COD_SUB_MODELO;
      CLOSE C_SUB_MODELO;
    
    ELSE
    
      L_COD_SUB_MODELO := P_COD_SUB_MODELO;
    
    END IF;
  
    OPEN C_TIP_VEHI(L_COD_SUB_MODELO);
    FETCH C_TIP_VEHI
      INTO L_TIP_VEHI;
    L_EXISTE := C_TIP_VEHI%FOUND;
    CLOSE C_TIP_VEHI;
  
    IF NOT L_EXISTE THEN
      IF L_USO_VEHI = 1 THEN
        P_COD_RAMO := 801;
      ELSE
        P_COD_RAMO := 901;
      END IF;
    ELSE
      P_COD_TIP_VEHI := L_TIP_VEHI.COD_TIP_VEHI;
      P_COD_RAMO     := F_COD_RAMO_VEHICULO(L_USO_VEHI, P_COD_TIP_VEHI);
    END IF;
  
  EXCEPTION
    WHEN OTHERS THEN
      P_ERROR := SQLCODE;
    
  END P_DATOS_VEH_COTIZACION;

  /************************************/

  PROCEDURE P_LLAMA_SISGEN(P_COD_DOCUM_ASEG  VARCHAR2,
                           P_COD_DOCUM_TOMAD VARCHAR2,
                           P_NUM_MATRICULA   VARCHAR2,
                           P_CANT_SINIESTROS OUT VARCHAR2,
                           P_MONT_SINIESTROS OUT VARCHAR2) IS
  
    LO_ERROR_ASEG            NUMBER;
    LO_ERROR_TOMAD           NUMBER;
    P_MONTO_SINIESTROS_ASEG  NUMBER;
    P_CANT_SINIESTRO_ASEG    NUMBER;
    P_MONTO_SINIESTROS_TOMAD NUMBER;
    P_CANT_SINIESTRO_TOMAD   NUMBER;
    L_NUM_MATRICULA          VARCHAR2(10);
  
  BEGIN
  
    P_CANT_SINIESTROS := 0;
    P_MONT_SINIESTROS := 0;
    L_NUM_MATRICULA   := '';
  
    /*IF P_NUM_MATRICULA IS NOT NULL AND P_NUM_MATRICULA != 'A/D' THEN
      L_NUM_MATRICULA := P_NUM_MATRICULA;
    END IF;*/
  
    IF P_COD_DOCUM_ASEG != P_COD_DOCUM_TOMAD THEN
    
      MEL_K_SINIESTRALIDAD.P_SINIESTRALIDAD_PRIMAS_PAQ(P_COD_DOCUM_ASEG,
                                                       L_NUM_MATRICULA,
                                                       P_MONTO_SINIESTROS_ASEG,
                                                       P_CANT_SINIESTRO_ASEG,
                                                       LO_ERROR_ASEG);
    
      MEL_K_SINIESTRALIDAD.P_SINIESTRALIDAD_PRIMAS_PAQ(P_COD_DOCUM_TOMAD,
                                                       L_NUM_MATRICULA,
                                                       P_MONTO_SINIESTROS_TOMAD,
                                                       P_CANT_SINIESTRO_TOMAD,
                                                       LO_ERROR_TOMAD);
    
      IF P_MONTO_SINIESTROS_ASEG > P_MONTO_SINIESTROS_TOMAD THEN
        P_CANT_SINIESTROS := P_CANT_SINIESTRO_TOMAD;
        P_MONT_SINIESTROS := P_MONTO_SINIESTROS_ASEG;
      ELSE
        P_CANT_SINIESTROS := P_CANT_SINIESTRO_TOMAD;
        P_MONT_SINIESTROS := P_MONTO_SINIESTROS_TOMAD;
      END IF;
    
    ELSE
    
      MEL_K_SINIESTRALIDAD.P_SINIESTRALIDAD_PRIMAS_PAQ(P_COD_DOCUM_ASEG,
                                                       L_NUM_MATRICULA,
                                                       P_MONTO_SINIESTROS_ASEG,
                                                       P_CANT_SINIESTRO_ASEG,
                                                       LO_ERROR_ASEG);
    
      P_CANT_SINIESTROS := P_CANT_SINIESTRO_ASEG;
      P_MONT_SINIESTROS := P_MONTO_SINIESTROS_ASEG;
    
    END IF;
  
  END P_LLAMA_SISGEN;

  /************************************/

  PROCEDURE P_NOM_MODALIDAD(P_COD_MODALIDAD IN NUMBER,
                            P_NOM_MODALIDAD OUT VARCHAR2) IS
  
    CURSOR C_NOM_MODALIDAD IS
      SELECT DISTINCT B.NOM_MODALIDAD
        FROM A1002090@OVPRO_PRD A, G2990004@OVPRO_PRD B
       WHERE A.COD_RAMO IN (801, 802, 803, 808, 809, 820)
         AND B.COD_MODALIDAD = P_COD_MODALIDAD
         AND B.COD_CIA = A.COD_CIA
         AND B.COD_MODALIDAD = A.COD_MODALIDAD
       ORDER BY B.NOM_MODALIDAD;
  
    CURSOR C_NOM_MODALIDAD_2(L_COD_MOD VARCHAR2) IS
      SELECT DISTINCT B.NOM_MODALIDAD
        FROM A1002090@OVPRO_PRD A, G2990004@OVPRO_PRD B
       WHERE A.COD_RAMO IN (801, 802, 803, 808, 809, 820)
         AND B.COD_MODALIDAD = L_COD_MOD
         AND B.COD_CIA = A.COD_CIA
         AND B.COD_MODALIDAD = A.COD_MODALIDAD
       ORDER BY B.NOM_MODALIDAD;
  
    L_COD_MODALIDAD VARCHAR2(10);
    L_NOM_MODALIDAD VARCHAR2(50);
  
  BEGIN
  
    IF P_COD_MODALIDAD IN
       (83002, 83032, 83001, 83031, 83051, 83101, 83052, 83102) THEN
    
      L_COD_MODALIDAD := SUBSTR(P_COD_MODALIDAD, 1, 4);
    
      OPEN C_NOM_MODALIDAD_2(L_COD_MODALIDAD);
      FETCH C_NOM_MODALIDAD_2
        INTO L_NOM_MODALIDAD;
      CLOSE C_NOM_MODALIDAD_2;
    
      CASE SUBSTR(P_COD_MODALIDAD, 5, 1)
        WHEN 1 THEN
          L_NOM_MODALIDAD := L_NOM_MODALIDAD || ' ANUAL';
        WHEN 2 THEN
          L_NOM_MODALIDAD := L_NOM_MODALIDAD || ' BIANUAL';
      END CASE;
    
      P_NOM_MODALIDAD := L_NOM_MODALIDAD;
    
    ELSE
    
      OPEN C_NOM_MODALIDAD;
      FETCH C_NOM_MODALIDAD
        INTO P_NOM_MODALIDAD;
      CLOSE C_NOM_MODALIDAD;
    
    END IF;
  
  END P_NOM_MODALIDAD;

  /************************************/

  PROCEDURE p_nom_modalidad_especial(p_cod_modalidad IN NUMBER,
                                     p_nom_modalidad OUT VARCHAR2) IS
    --
    CURSOR c_nom_modalidad IS
    --
      SELECT t.nom_modalidad
        FROM mel_planes_veh_ficticios t
       WHERE t.cod_plan = p_cod_modalidad;
    --
    l_existe BOOLEAN;
    --
  BEGIN
    --
    OPEN c_nom_modalidad;
    FETCH c_nom_modalidad
      INTO p_nom_modalidad;
    l_existe := c_nom_modalidad%FOUND;
    CLOSE c_nom_modalidad;
    --
    IF NOT l_existe THEN
      --
      mel_k_vehiculo.p_nom_modalidad(p_cod_modalidad, p_nom_modalidad);
      --
    END IF;
    --
  END p_nom_modalidad_especial;

  /************************************/

  PROCEDURE P_TRAE_PLANES(P_COD_DOCUM VARCHAR2, P_PLANES OUT TYCURSOR) IS
  
    CURSOR C_VALIDA_EXISTE IS
      SELECT 1
        FROM MEL_PLANES_VEH_USUARIOS M
       WHERE M.COD_DOCUM = P_COD_DOCUM
         AND MCA_INH = 'N';
    R_VALIDA_EXISTE C_VALIDA_EXISTE%ROWTYPE;
    
    -- valido si es de AMUNATEGUI --
    CURSOR C_VALIDA_AMUNATEGUI IS
      SELECT 1 
        FROM A1001332@ovpro_prd A 
       WHERE A.COD_CIA = 1
         AND A.TIP_DOCUM = 'RUT'
         AND A.COD_DOCUM = P_COD_DOCUM
         AND A.cod_nivel3 = '6003';
    R_VALIDA_AMUNATEGUI C_VALIDA_AMUNATEGUI%ROWTYPE;
  
    L_EXISTE BOOLEAN;
    L_EXISTE_AMUNATEGUI BOOLEAN;
  
  BEGIN
    --
    OPEN c_valida_existe;
    FETCH c_valida_existe
      INTO r_valida_existe;
        l_existe := c_valida_existe%FOUND;
     CLOSE c_valida_existe;
     ---
    OPEN c_valida_amunategui;
    FETCH c_valida_amunategui
      INTO r_valida_amunategui;
    l_existe_amunategui := c_valida_amunategui%FOUND;
    CLOSE c_valida_amunategui;
    
    IF l_existe_amunategui THEN
      OPEN p_planes FOR
           SELECT m.cod_plan,
               (SELECT v.abrev_plan
                  FROM mel_planes_veh v
                 WHERE v.cod_plan = m.cod_plan) abrev,
               m.orden
          FROM mel_planes_veh_usuarios m
         WHERE m.cod_docum = 'AMUNATEGUI'
           AND m.mca_inh = 'N'
         ORDER BY orden, cod_plan ASC;
         -- esto lo mando gerardo
    ELSE
      --
      IF l_existe THEN
        --
        OPEN p_planes FOR
          SELECT m.cod_plan,
                 (SELECT v.abrev_plan
                    FROM mel_planes_veh v
                   WHERE v.cod_plan = m.cod_plan) abrev,
                 m.orden
            FROM mel_planes_veh_usuarios m
           WHERE m.cod_docum = nvl(p_cod_docum, 'MEL')
             AND m.mca_inh = 'N'
          UNION
          SELECT f.cod_plan,
                 (SELECT v.abrev_plan
                    FROM mel_planes_veh v
                   WHERE v.cod_plan = f.cod_plan_real) abrev,
                 f.orden
            FROM mel_planes_veh_ficticios f
           WHERE f.cod_docum = nvl(p_cod_docum, 'MEL')
             AND f.mca_inh = 'N'
           order by orden;
        --
      ELSE
        --
        OPEN p_planes FOR
          SELECT m.cod_plan,
                 (SELECT v.abrev_plan
                    FROM mel_planes_veh v
                   WHERE v.cod_plan = m.cod_plan) abrev,
                 m.orden
            FROM mel_planes_veh_usuarios m
           WHERE m.cod_docum = 'MEL'
             AND m.mca_inh = 'N'
           ORDER BY orden, cod_plan ASC;
        --
      END IF;
      --
     END IF;
  
  END P_TRAE_PLANES;

  /************************************/

  PROCEDURE P_BUSCA_SEXO(P_COD_CIA   VARCHAR2,
                         P_TIP_DOCUM VARCHAR2,
                         P_COD_DOCUM VARCHAR2,
                         P_SEXO      OUT VARCHAR2) IS
  
  BEGIN
  
    P_SEXO := '1';
  
    TRN_K_GLOBAL.BORRA_TODAS@OVPRO_PRD;
  
    TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('TIP_SPTO', 'XX');
    TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('DVMCA_MEL', 'S');
  
    TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('COD_CIA', P_COD_CIA);
    TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('TIP_DOCUM', P_TIP_DOCUM);
    TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('COD_DOCUM', P_COD_DOCUM);
  
    TRON2000.EA_P_999DV0020_MCL@OVPRO_PRD;
  
    P_SEXO := TRN_K_GLOBAL.DEVUELVE@OVPRO_PRD('VAL_CAMPO');
  
  EXCEPTION
    WHEN OTHERS THEN
      P_SEXO := '1';
    
  END P_BUSCA_SEXO;

  /************************************/

  PROCEDURE P_BUSCA_RANGO_EDAD(P_EDAD VARCHAR2, P_RANGO_EDAD OUT VARCHAR2) IS
  
  BEGIN
  
    TRN_K_GLOBAL.BORRA_TODAS@OVPRO_PRD;
  
    TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('COD_CIA', 1);
  
    TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('DVEDAD_COND', P_EDAD);
  
    TRON2000.EA_P_999DV0026_MCL@OVPRO_PRD;
  
    P_RANGO_EDAD := TRN_K_GLOBAL.DEVUELVE@OVPRO_PRD('VAL_CAMPO');
  
  EXCEPTION
    WHEN OTHERS THEN
      P_RANGO_EDAD := '1';
    
  END P_BUSCA_RANGO_EDAD;

  /************************************/

  PROCEDURE P_BUSCA_EDAD(P_COD_CIA   VARCHAR2,
                         P_TIP_DOCUM VARCHAR2,
                         P_COD_DOCUM VARCHAR2,
                         P_FEC_NACIM DATE,
                         P_EDAD      OUT VARCHAR2) IS
  
  BEGIN
  
    TRN_K_GLOBAL.BORRA_TODAS@OVPRO_PRD;
  
    TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('TIP_SPTO', 'XX');
    TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('DVMCA_MEL', 'S');
  
    TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('COD_CIA', P_COD_CIA);
    TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('TIP_DOCUM', P_TIP_DOCUM);
    TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('COD_DOCUM', P_COD_DOCUM);
    TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('FEC_NACIMIENTO',
                                  TO_CHAR(P_FEC_NACIM, 'DDMMYYYY'));
  
    TRON2000.EA_P_999DV0022_MCL@OVPRO_PRD;
  
    P_EDAD := TRN_K_GLOBAL.DEVUELVE@OVPRO_PRD('VAL_CAMPO');
  
  EXCEPTION
    WHEN OTHERS THEN
      P_EDAD := '';
    
  END P_BUSCA_EDAD;

  /************************************/

  PROCEDURE P_DATOS_VEHICULO(P_NUM_MATRICULA  VARCHAR2,
                             P_NOM_COT        OUT VARCHAR2,
                             P_APE_PAT_COT    OUT VARCHAR2,
                             P_APE_MAT_COT    OUT VARCHAR2,
                             P_RUT_COT        OUT VARCHAR2,
                             P_DIR_COT        OUT VARCHAR2,
                             P_COMUNA_COT     OUT VARCHAR2,
                             P_CIUDAD_COT     OUT VARCHAR2,
                             P_REGION_COT     OUT VARCHAR2,
                             P_ANIO           OUT VARCHAR2,
                             P_NRO_CHASIS     OUT VARCHAR2,
                             P_NRO_MOTOR      OUT VARCHAR2,
                             P_COD_COLOR      OUT VARCHAR2,
                             P_NOM_COLOR      OUT VARCHAR2,
                             P_COD_MARCA      OUT VARCHAR2,
                             P_NOM_MARCA      OUT VARCHAR2,
                             P_COD_MODELO     OUT VARCHAR2,
                             P_NOM_MODELO     OUT VARCHAR2,
                             P_COD_SUB_MODELO OUT VARCHAR2,
                             P_NOM_SUB_MODELO OUT VARCHAR2,
                             P_TIP_VEHI       OUT VARCHAR2,
                             P_EDAD           OUT VARCHAR2,
                             P_SEXO           OUT VARCHAR2,
                             P_ID             OUT VARCHAR2,
                             P_ERROR          OUT VARCHAR2) IS
  
    L_ID    NUMBER;
    L_BLOCK VARCHAR2(2);
  
  BEGIN
  
    IF P_NUM_MATRICULA != 'A/D' THEN
    
      P_VALIDA_PATENTE_VEH(P_NUM_MATRICULA, L_ID, P_ERROR);
    
      P_TRAE_DATA_OV_VEHICULO(P_NUM_MATRICULA,
                              P_NOM_COT,
                              P_APE_PAT_COT,
                              P_APE_MAT_COT,
                              P_RUT_COT,
                              P_DIR_COT,
                              P_COMUNA_COT,
                              P_CIUDAD_COT,
                              P_REGION_COT,
                              P_ANIO,
                              P_NRO_CHASIS,
                              P_NRO_MOTOR,
                              P_COD_COLOR,
                              P_NOM_COLOR,
                              P_COD_MARCA,
                              P_NOM_MARCA,
                              P_COD_MODELO,
                              P_NOM_MODELO,
                              P_COD_SUB_MODELO,
                              P_NOM_SUB_MODELO,
                              P_TIP_VEHI,
                              P_ERROR);
    
      --L_ID := '0';
    
      IF L_ID = '0' OR P_ERROR != '0' THEN
      
        P_TRAE_DATA_RVM(P_NUM_MATRICULA,
                        P_NOM_COT,
                        P_APE_PAT_COT,
                        P_APE_MAT_COT,
                        P_RUT_COT,
                        P_DIR_COT,
                        P_COMUNA_COT,
                        P_CIUDAD_COT,
                        P_REGION_COT,
                        P_ANIO,
                        P_NRO_CHASIS,
                        P_NRO_MOTOR,
                        P_COD_COLOR,
                        P_NOM_COLOR,
                        P_COD_MARCA,
                        P_NOM_MARCA,
                        P_COD_MODELO,
                        P_NOM_MODELO,
                        P_COD_SUB_MODELO,
                        P_NOM_SUB_MODELO,
                        P_TIP_VEHI,
                        P_ERROR);
      
        IF P_ERROR != '0' THEN
        
          L_ID := OV.F_GET_ID_OV_VEHICULO();
        
          INSERT INTO OV_VEHICULO
            (NUM_MATRICULA,
             COD_MARCA,
             COD_MODELO,
             COD_SUB_MODELO,
             ANO_FAB,
             COD_COLOR,
             NRO_CHASIS,
             NRO_MOTOR,
             COD_TIP_VEHI,
             COD_DOCUM,
             ID)
          VALUES
            (P_NUM_MATRICULA,
             P_COD_MARCA,
             P_COD_MODELO,
             P_COD_SUB_MODELO,
             P_ANIO,
             P_COD_COLOR,
             P_NRO_CHASIS,
             P_NRO_MOTOR,
             P_TIP_VEHI,
             P_RUT_COT,
             L_ID);
        
          COMMIT;
        
        END IF;
      
      END IF;
    
      P_ID := L_ID;
    
      P_DATOS_TERCERO(P_RUT_COT,
                      P_NOM_COT,
                      P_APE_PAT_COT,
                      P_APE_MAT_COT,
                      P_EDAD,
                      P_SEXO,
                      P_ERROR);
    
      COMMIT;
    
      OV_K_RENOVACION.P_CONSULTA_BLOQUEO(P_RUT_COT, L_BLOCK);
    
      IF L_BLOCK = 'S' THEN
      
        P_RUT_COT     := '';
        P_NOM_COT     := '';
        P_APE_PAT_COT := '';
        P_APE_MAT_COT := '';
      
      END IF;
    
    END IF;
  
  END P_DATOS_VEHICULO;

  /************************************/

  PROCEDURE P_TRAE_DATA_OV_VEHICULO(P_NUM_MATRICULA  VARCHAR2,
                                    P_NOM_COT        OUT VARCHAR2,
                                    P_APE_PAT_COT    OUT VARCHAR2,
                                    P_APE_MAT_COT    OUT VARCHAR2,
                                    P_RUT_COT        OUT VARCHAR2,
                                    P_DIR_COT        OUT VARCHAR2,
                                    P_COMUNA_COT     OUT VARCHAR2,
                                    P_CIUDAD_COT     OUT VARCHAR2,
                                    P_REGION_COT     OUT VARCHAR2,
                                    P_ANIO           OUT VARCHAR2,
                                    P_NRO_CHASIS     OUT VARCHAR2,
                                    P_NRO_MOTOR      OUT VARCHAR2,
                                    P_COD_COLOR      OUT VARCHAR2,
                                    P_NOM_COLOR      OUT VARCHAR2,
                                    P_COD_MARCA      OUT VARCHAR2,
                                    P_NOM_MARCA      OUT VARCHAR2,
                                    P_COD_MODELO     OUT VARCHAR2,
                                    P_NOM_MODELO     OUT VARCHAR2,
                                    P_COD_SUB_MODELO OUT VARCHAR2,
                                    P_NOM_SUB_MODELO OUT VARCHAR2,
                                    P_TIP_VEHI       OUT VARCHAR2,
                                    P_ERROR          OUT VARCHAR2) IS
  
    CURSOR D_VEHICULO IS
    /*SELECT NVL(C.COD_MARCA, 0) COD_MARCA,
                             NVL(C.COD_MODELO, 0) COD_MODELO,
                             NVL(C.COD_SUB_MODELO, 0) COD_SUB_MODELO,
                             C.ANO_FAB,
                             NVL(C.COD_COLOR, 0) COD_COLOR,
                             C.NRO_CHASIS,
                             C.NRO_MOTOR,
                             NVL(C.COD_TIP_VEHI, 0) COD_TIP_VEHI,
                             C.COD_DOCUM
                        FROM OV_VEHICULO C
                       WHERE C.NUM_MATRICULA = P_NUM_MATRICULA*/
      SELECT NVL(C.COD_MARCA, 0) COD_MARCA,
             NVL(C.COD_MODELO, 0) COD_MODELO,
             NVL(C.COD_SUB_MODELO, 0) COD_SUB_MODELO,
             NVL(G.AA_VEH, C.ANO_FAB) ANO_FAB,
             NVL((SELECT C.COD_COLOR
                   FROM A2100800@OVPRO_PRD C
                  WHERE UPPER(C.NOM_COLOR) = UPPER(G.COLOR)),
                 0) COD_COLOR,
             NVL(G.COLOR, 0) P_NOM_COLOR,
             NVL(G.NRO_CHASIS, C.NRO_CHASIS) NRO_CHASIS,
             NVL(G.NRO_MOTOR, C.NRO_MOTOR) NRO_MOTOR,
             NVL(C.COD_TIP_VEHI, 0) COD_TIP_VEHI,
             NVL(CONCAT(G.RUT, G.DV), C.COD_DOCUM) COD_DOCUM
        FROM OV_VEHICULO C
        FULL OUTER JOIN G2109005_MCL@OVPRO_PRD G
          ON C.NUM_MATRICULA = G.PATENTE
       WHERE C.NUM_MATRICULA = P_NUM_MATRICULA;
  
    R_VEHICULO D_VEHICULO %ROWTYPE;
  
    CURSOR D_TERCERO(L_COD_DOCUM VARCHAR2) IS
      SELECT B.COD_DOCUM,
             B.NOM_TERCERO NOMBRE,
             B.APE_PATERNO APE_PATERNO,
             B.APE_MATERNO APE_MATERNO,
             B.DIR_TERCERO,
             B.COD_ESTADO,
             NVL(B.COD_PROV, 0) COD_PROV,
             NVL(B.COD_LOCALIDAD, 0) COD_LOCALIDAD
        FROM OV_TERCERO B
       WHERE B.COD_DOCUM = L_COD_DOCUM;
  
    R_TERCERO D_TERCERO %ROWTYPE;
  
    V_ERROR VARCHAR2(100);
  
    CURSOR COLOR(V_COD_COLOR A2100800.COD_COLOR %TYPE) IS
      SELECT NOM_COLOR
        FROM A2100800@OVPRO_PRD
       WHERE COD_COLOR = V_COD_COLOR;
  
    CURSOR P_MARCA(V_MARCA A2100400.COD_MARCA %TYPE) IS
      SELECT DISTINCT (B.NOM_MARCA), A.COD_MARCA
        FROM G2009039_EUR@OVPRO_PRD A, A2100400@OVPRO_PRD B
       WHERE A.COD_CIA = 1
         AND A.COD_CIA = B.COD_CIA
         AND A.COD_MARCA = V_MARCA
         AND A.COD_MARCA = B.COD_MARCA
         AND B.MCA_INH = 'N'
         AND B.NOM_MARCA != 'PORSCHE'
       ORDER BY B.NOM_MARCA;
  
    R_MARCA P_MARCA%ROWTYPE;
  
    CURSOR P_MODELO(V_MARCA  A2100400.COD_MARCA %TYPE,
                    V_MODELO A2100410.COD_MODELO%TYPE) IS
      SELECT DISTINCT A.COD_MODELO, B.NOM_MODELO
        FROM G2009039_EUR@OVPRO_PRD A,
             A2100410@OVPRO_PRD     B,
             A2100420@OVPRO_PRD     C
       WHERE A.COD_CIA = 1
         AND A.COD_MARCA = V_MARCA
         AND A.COD_MODELO = V_MODELO
         AND A.COD_CIA = B.COD_CIA
         AND A.COD_MARCA = B.COD_MARCA
         AND A.COD_MODELO = B.COD_MODELO
         AND C.COD_CIA = A.COD_CIA
         AND C.COD_MARCA = A.COD_MARCA
         AND C.COD_MODELO = A.COD_MODELO
         AND C.COD_TIP_VEHI <= 6
         AND C.MCA_INH = 'N'
         AND B.MCA_INH = 'N'
       ORDER BY NOM_MODELO;
  
    R_MODELO P_MODELO%ROWTYPE;
  
    CURSOR P_SUB_MODELOS(V_MARCA      A2100400.COD_MARCA %TYPE,
                         V_MODELO     A2100410.COD_MODELO%TYPE,
                         V_SUB_MODELO A2100420.COD_SUB_MODELO%TYPE) IS
      SELECT SMOD.COD_SUB_MODELO COD_SUB_MODELO,
             SMOD.NOM_SUB_MODELO NOM_SUB_MODELO
        FROM A2100420@OVPRO_PRD SMOD, A2100420@OVPRO_PRD C
       WHERE SMOD.COD_CIA = 1
         AND SMOD.COD_MARCA = V_MARCA
         AND SMOD.COD_MODELO = V_MODELO
         AND SMOD.COD_SUB_MODELO = V_SUB_MODELO
         AND C.COD_CIA = SMOD.COD_CIA
         AND C.COD_MARCA = SMOD.COD_MARCA
         AND C.COD_MODELO = SMOD.COD_MODELO
         AND C.COD_SUB_MODELO = SMOD.COD_SUB_MODELO
         AND C.COD_TIP_VEHI <= 6
         AND C.MCA_INH = 'N'
         AND SMOD.FEC_VALIDEZ =
             (SELECT MAX(B.FEC_VALIDEZ)
                FROM A2100420@OVPRO_PRD B
               WHERE SMOD.COD_CIA = B.COD_CIA
                 AND SMOD.COD_SUB_MODELO = B.COD_SUB_MODELO
                 AND SMOD.COD_MARCA = B.COD_MARCA
                 AND SMOD.COD_MODELO = B.COD_MODELO);
  
    R_SUB_MODELOS P_SUB_MODELOS%ROWTYPE;
  
    L_EXISTE BOOLEAN;
  
  BEGIN
  
    OPEN D_VEHICULO;
    FETCH D_VEHICULO
      INTO R_VEHICULO;
    L_EXISTE := D_VEHICULO%FOUND;
    CLOSE D_VEHICULO;
  
    IF L_EXISTE THEN
    
      OPEN D_TERCERO(R_VEHICULO.COD_DOCUM);
      FETCH D_TERCERO
        INTO R_TERCERO;
      --L_EXISTE := D_TERCERO%FOUND;
      CLOSE D_TERCERO;
    
      P_NOM_COT     := R_TERCERO.NOMBRE;
      P_APE_PAT_COT := R_TERCERO.APE_PATERNO;
      P_APE_MAT_COT := R_TERCERO.APE_MATERNO;
      P_RUT_COT     := R_VEHICULO.COD_DOCUM;
      P_DIR_COT     := R_TERCERO.DIR_TERCERO;
      P_ANIO        := R_VEHICULO.ANO_FAB;
      P_NRO_CHASIS  := TRIM(R_VEHICULO.NRO_CHASIS);
      P_NRO_MOTOR   := TRIM(R_VEHICULO.NRO_MOTOR);
      P_TIP_VEHI    := R_VEHICULO.COD_TIP_VEHI;
    
      OPEN COLOR(R_VEHICULO.COD_COLOR);
      FETCH COLOR
        INTO P_NOM_COLOR;
      CLOSE COLOR;
    
      P_COD_COLOR      := R_VEHICULO.COD_COLOR;
      P_COD_MARCA      := R_VEHICULO.COD_MARCA;
      P_COD_MODELO     := R_VEHICULO.COD_MODELO;
      P_COD_SUB_MODELO := R_VEHICULO.COD_SUB_MODELO;
    
      -- SE DECODIFICA LA MARCA,MODELO Y SUBMODELO
    
      OPEN P_MARCA(P_COD_MARCA);
      FETCH P_MARCA
        INTO R_MARCA;
      CLOSE P_MARCA;
    
      P_NOM_MARCA := R_MARCA.NOM_MARCA;
    
      --
    
      OPEN P_MODELO(P_COD_MARCA, P_COD_MODELO);
      FETCH P_MODELO
        INTO R_MODELO;
      CLOSE P_MODELO;
    
      P_NOM_MODELO := R_MODELO.NOM_MODELO;
    
      --
    
      OPEN P_SUB_MODELOS(P_COD_MARCA, P_COD_MODELO, P_COD_SUB_MODELO);
      FETCH P_SUB_MODELOS
        INTO R_SUB_MODELOS;
      CLOSE P_SUB_MODELOS;
    
      P_NOM_SUB_MODELO := R_SUB_MODELOS.NOM_SUB_MODELO;
    
      /*
      NOMBRE_MODELOS(R_VEHICULO.COD_MARCA,
                     R_VEHICULO.COD_MODELO,
                     R_VEHICULO.COD_SUB_MODELO,
                     P_NOM_MARCA,
                     P_NOM_MODELO,
                     P_NOM_SUB_MODELO);*/
    
      -- SE OBTIENEN LOS NOMBRES DE CIUDAD,COMUNA Y REGION
      NOMBRE_LOCALIDADES(R_TERCERO.COD_LOCALIDAD,
                         R_TERCERO.COD_PROV,
                         P_COMUNA_COT,
                         P_CIUDAD_COT,
                         P_REGION_COT,
                         V_ERROR);
    
      P_ERROR := '0';
    
    ELSE
    
      P_ERROR := 1000;
    
    END IF;
  END P_TRAE_DATA_OV_VEHICULO;

  /************************************/

  PROCEDURE P_TRAE_DATA_RVM(P_NUM_MATRICULA  VARCHAR2,
                            P_NOM_COT        OUT VARCHAR2,
                            P_APE_PAT_COT    OUT VARCHAR2,
                            P_APE_MAT_COT    OUT VARCHAR2,
                            P_RUT_COT        OUT VARCHAR2,
                            P_DIR_COT        OUT VARCHAR2,
                            P_COMUNA_COT     OUT VARCHAR2,
                            P_CIUDAD_COT     OUT VARCHAR2,
                            P_REGION_COT     OUT VARCHAR2,
                            P_ANIO           OUT VARCHAR2,
                            P_NRO_CHASIS     OUT VARCHAR2,
                            P_NRO_MOTOR      OUT VARCHAR2,
                            P_COD_COLOR      OUT VARCHAR2,
                            P_NOM_COLOR      OUT VARCHAR2,
                            P_COD_MARCA      OUT VARCHAR2,
                            P_NOM_MARCA      OUT VARCHAR2,
                            P_COD_MODELO     OUT VARCHAR2,
                            P_NOM_MODELO     OUT VARCHAR2,
                            P_COD_SUB_MODELO OUT VARCHAR2,
                            P_NOM_SUB_MODELO OUT VARCHAR2,
                            P_TIP_VEHI       OUT VARCHAR2,
                            P_ERROR          OUT VARCHAR2) IS
  
    CURSOR D_VEHICULO IS
      SELECT NVL(C.COD_MARCA, 0) COD_MARCA,
             NVL(C.COD_MODELO, 0) COD_MODELO,
             NVL(C.COD_SUBMODELO, 0) COD_SUB_MODELO,
             C.AA_VEH,
             --NVL(C.COD_COLOR, 0) COD_COLOR,
             NVL((SELECT G.COD_COLOR
                   FROM A2100800@OVPRO_PRD G
                  WHERE UPPER(G.NOM_COLOR) = UPPER(C.COLOR)),
                 0) COD_COLOR,
             C.NRO_CHASIS,
             C.NRO_MOTOR,
             NVL(C.COD_TIP_VEHI, 0) COD_TIP_VEHI,
             C.COD_DOCUM,
             C.NOM_TERCERO NOMBRE,
             C.APE1_TERCERO APE_PATERNO,
             C.APE2_TERCERO APE_MATERNO,
             C.DIRECCION,
             C.COD_ESTADO,
             NVL(C.COD_PROV, 0) COD_PROV,
             NVL(C.COD_LOCALIDAD, 0) COD_LOCALIDAD
        FROM TRON2000.G2109005_MCL@OVPRO_PRD C
       WHERE C.PATENTE = P_NUM_MATRICULA;
  
    R_VEHICULO D_VEHICULO %ROWTYPE;
  
    V_ERROR VARCHAR2(100);
  
    CURSOR COLOR(V_COD_COLOR A2100800.COD_COLOR %TYPE) IS
      SELECT NOM_COLOR
        FROM A2100800@OVPRO_PRD
       WHERE COD_COLOR = V_COD_COLOR;
  
    CURSOR P_MARCA(V_MARCA A2100400.COD_MARCA %TYPE) IS
      SELECT DISTINCT (B.NOM_MARCA), A.COD_MARCA
        FROM G2009039_EUR@OVPRO_PRD A, A2100400@OVPRO_PRD B
       WHERE A.COD_CIA = 1
         AND A.COD_CIA = B.COD_CIA
         AND A.COD_MARCA = V_MARCA
         AND A.COD_MARCA = B.COD_MARCA
         AND B.MCA_INH = 'N'
         AND B.NOM_MARCA != 'PORSCHE'
       ORDER BY B.NOM_MARCA;
  
    R_MARCA P_MARCA%ROWTYPE;
  
    CURSOR P_MODELO(V_MARCA  A2100400.COD_MARCA %TYPE,
                    V_MODELO A2100410.COD_MODELO%TYPE) IS
      SELECT DISTINCT A.COD_MODELO, B.NOM_MODELO
        FROM G2009039_EUR@OVPRO_PRD A,
             A2100410@OVPRO_PRD     B,
             A2100420@OVPRO_PRD     C
       WHERE A.COD_CIA = 1
         AND A.COD_MARCA = V_MARCA
         AND A.COD_MODELO = V_MODELO
         AND A.COD_CIA = B.COD_CIA
         AND A.COD_MARCA = B.COD_MARCA
         AND A.COD_MODELO = B.COD_MODELO
         AND C.COD_CIA = A.COD_CIA
         AND C.COD_MARCA = A.COD_MARCA
         AND C.COD_MODELO = A.COD_MODELO
         AND C.COD_TIP_VEHI <= 6
         AND C.MCA_INH = 'N'
         AND B.MCA_INH = 'N'
       ORDER BY NOM_MODELO;
  
    R_MODELO P_MODELO%ROWTYPE;
  
    CURSOR P_SUB_MODELOS(V_MARCA      A2100400.COD_MARCA %TYPE,
                         V_MODELO     A2100410.COD_MODELO%TYPE,
                         V_SUB_MODELO A2100420.COD_SUB_MODELO%TYPE) IS
      SELECT SMOD.COD_SUB_MODELO COD_SUB_MODELO,
             SMOD.NOM_SUB_MODELO NOM_SUB_MODELO
        FROM A2100420@OVPRO_PRD SMOD, A2100420@OVPRO_PRD C
       WHERE SMOD.COD_CIA = 1
         AND SMOD.COD_MARCA = V_MARCA
         AND SMOD.COD_MODELO = V_MODELO
         AND SMOD.COD_SUB_MODELO = V_SUB_MODELO
         AND C.COD_CIA = SMOD.COD_CIA
         AND C.COD_MARCA = SMOD.COD_MARCA
         AND C.COD_MODELO = SMOD.COD_MODELO
         AND C.COD_SUB_MODELO = SMOD.COD_SUB_MODELO
         AND C.COD_TIP_VEHI <= 6
         AND C.MCA_INH = 'N'
         AND SMOD.FEC_VALIDEZ =
             (SELECT MAX(B.FEC_VALIDEZ)
                FROM A2100420@OVPRO_PRD B
               WHERE SMOD.COD_CIA = B.COD_CIA
                 AND SMOD.COD_SUB_MODELO = B.COD_SUB_MODELO
                 AND SMOD.COD_MARCA = B.COD_MARCA
                 AND SMOD.COD_MODELO = B.COD_MODELO);
  
    R_SUB_MODELOS P_SUB_MODELOS%ROWTYPE;
  
    L_EXISTE BOOLEAN;
  
  BEGIN
  
    OPEN D_VEHICULO;
    FETCH D_VEHICULO
      INTO R_VEHICULO;
    L_EXISTE := D_VEHICULO%FOUND;
    CLOSE D_VEHICULO;
  
    IF L_EXISTE THEN
    
      P_NOM_COT     := R_VEHICULO.NOMBRE;
      P_APE_PAT_COT := R_VEHICULO.APE_PATERNO;
      P_APE_MAT_COT := R_VEHICULO.APE_MATERNO;
      P_RUT_COT     := R_VEHICULO.COD_DOCUM;
      P_DIR_COT     := R_VEHICULO.DIRECCION;
      P_ANIO        := R_VEHICULO.AA_VEH;
      P_NRO_CHASIS  := TRIM(R_VEHICULO.NRO_CHASIS);
      P_NRO_MOTOR   := TRIM(R_VEHICULO.NRO_MOTOR);
      P_TIP_VEHI    := R_VEHICULO.COD_TIP_VEHI;
    
      OPEN COLOR(R_VEHICULO.COD_COLOR);
      FETCH COLOR
        INTO P_NOM_COLOR;
      CLOSE COLOR;
    
      P_COD_COLOR      := R_VEHICULO.COD_COLOR;
      P_COD_MARCA      := R_VEHICULO.COD_MARCA;
      P_COD_MODELO     := R_VEHICULO.COD_MODELO;
      P_COD_SUB_MODELO := R_VEHICULO.COD_SUB_MODELO;
    
      OPEN P_MARCA(P_COD_MARCA);
      FETCH P_MARCA
        INTO R_MARCA;
      CLOSE P_MARCA;
    
      P_NOM_MARCA := R_MARCA.NOM_MARCA;
    
      OPEN P_MODELO(P_COD_MARCA, P_COD_MODELO);
      FETCH P_MODELO
        INTO R_MODELO;
      CLOSE P_MODELO;
    
      P_NOM_MODELO := R_MODELO.NOM_MODELO;
    
      OPEN P_SUB_MODELOS(P_COD_MARCA, P_COD_MODELO, P_COD_SUB_MODELO);
      FETCH P_SUB_MODELOS
        INTO R_SUB_MODELOS;
      CLOSE P_SUB_MODELOS;
    
      P_NOM_SUB_MODELO := R_SUB_MODELOS.NOM_SUB_MODELO;
    
      NOMBRE_LOCALIDADES(R_VEHICULO.COD_LOCALIDAD,
                         R_VEHICULO.COD_PROV,
                         P_COMUNA_COT,
                         P_CIUDAD_COT,
                         P_REGION_COT,
                         V_ERROR);
    
      P_ERROR := '0';
    
    ELSE
    
      P_ERROR := 1000;
    
    END IF;
  END P_TRAE_DATA_RVM;

  /************************************/

  PROCEDURE P_GRABA_COTIZACION(P_COD_DOCUM      VARCHAR2,
                               P_COD_DOCUM_ASEG VARCHAR2,
                               P_NUM_MATRICULA  VARCHAR2,
                               P_ID             VARCHAR2,
                               P_STRING         VARCHAR2,
                               P_COD_RAMO       VARCHAR2,
                               P_MONTO_RC       VARCHAR2,
                               P_EDAD_CONDUCTOR VARCHAR2,
                               P_SEXO_CONDUCTOR VARCHAR2,
                               P_RC_EXCESO      VARCHAR2,
                               P_FACT48         VARCHAR2,
                               P_CONVENIO       VARCHAR2,
                               P_COB_OPC        VARCHAR2,
                               P_MCA_MEL        VARCHAR2,
                               P_NUM_COTIZACION IN OUT VARCHAR2,
                               P_ERROR          OUT VARCHAR2) IS
  
    DATOS_COT       VARCHAR2(3000);
    L_COD_MODALIDAD VARCHAR2(3000);
    PRIMA_NETA      VARCHAR2(3000);
    DESCUENTO       VARCHAR2(3000);
  
    CURSOR C_FEC_ACTU_COTIZACION IS
      SELECT C.FEC_ACTU
        FROM MEL_CAB_COTIZACION@OVPRO_PRD C
       WHERE C.NUM_COTIZACION = P_NUM_COTIZACION;
  
    R_FEC_ACTU_COTIZACION C_FEC_ACTU_COTIZACION%ROWTYPE;
  
    CURSOR C_VALIDA_CUPON IS
      select 1
        from mel_bolsa_descuentos
       where num_cotizacion = P_NUM_COTIZACION;
  
    R_VALIDA_CUPON C_VALIDA_CUPON%ROWTYPE;
    L_EXISTE_CUPON BOOLEAN;
    L_ERROR        VARCHAR2(100);
  
  BEGIN
  
    P_ERROR := '0';
  
    L_COD_MODALIDAD := '';
    PRIMA_NETA      := '';
  
    OPEN C_VALIDA_CUPON;
    FETCH C_VALIDA_CUPON
      INTO R_VALIDA_CUPON;
    L_EXISTE_CUPON := C_VALIDA_CUPON%FOUND;
    CLOSE C_VALIDA_CUPON;
  
    BEGIN
    
      IF NOT L_EXISTE_CUPON THEN
      
        UPDATE MEL_VEH_COTIZACION@OVPRO_PRD
           SET NUM_COTIZACION = '99' || SUBSTR(NUM_COTIZACION, 3, 11)
         WHERE NUM_COTIZACION = P_NUM_COTIZACION;
        COMMIT;
      
      END IF;
    
    EXCEPTION
      WHEN OTHERS THEN
        DBMS_OUTPUT.put_line(P_NUM_COTIZACION);
      
    END;
  
    FOR X IN 1 .. LENGTH(P_STRING) LOOP
    
      IF (SUBSTR(P_STRING, X, 1) != '|') THEN
      
        DATOS_COT := DATOS_COT || SUBSTR(P_STRING, X, 1);
      
      ELSE
      
        FOR Y IN 1 .. LENGTH(DATOS_COT) + 1 LOOP
        
          IF (SUBSTR(DATOS_COT, Y, 1) != '$') THEN
          
            L_COD_MODALIDAD := L_COD_MODALIDAD || SUBSTR(DATOS_COT, Y, 1);
          ELSE
          
            FOR Z IN Y + 1 .. LENGTH(DATOS_COT) + 1 LOOP
            
              IF (SUBSTR(DATOS_COT, Z, 1) != '#') THEN
              
                PRIMA_NETA := PRIMA_NETA || SUBSTR(DATOS_COT, Z, 1);
              ELSE
              
                DESCUENTO := DESCUENTO ||
                             SUBSTR(DATOS_COT, Z + 1, LENGTH(DATOS_COT));
              
                P_GRABA_MODALIDAD(P_COD_DOCUM,
                                  P_COD_DOCUM_ASEG,
                                  P_NUM_MATRICULA,
                                  TO_NUMBER(L_COD_MODALIDAD),
                                  TO_NUMBER(PRIMA_NETA),
                                  DESCUENTO,
                                  P_ID,
                                  P_COD_RAMO,
                                  P_NUM_COTIZACION,
                                  P_ERROR);
              
                UPDATE MEL_VEH_COTIZACION@OVPRO_PRD
                   SET MONTO_RC = P_MONTO_RC
                 WHERE NUM_COTIZACION = P_NUM_COTIZACION
                   AND COD_MODALIDAD = L_COD_MODALIDAD;
              
                UPDATE MEL_VEH_COTIZACION@OVPRO_PRD
                   SET EDAD_CONDUCTOR = P_EDAD_CONDUCTOR
                 WHERE NUM_COTIZACION = P_NUM_COTIZACION;
              
                UPDATE MEL_VEH_COTIZACION@OVPRO_PRD
                   SET ANOS_SIN_SINI = P_SEXO_CONDUCTOR
                 WHERE NUM_COTIZACION = P_NUM_COTIZACION;
              
                IF L_COD_MODALIDAD IN (8120, 8123, 8125, 8121) THEN
                
                  IF P_RC_EXCESO = '0' THEN
                  
                    UPDATE MEL_VEH_COTIZACION@OVPRO_PRD
                       SET MONTO_DM = '8202'
                     WHERE NUM_COTIZACION = P_NUM_COTIZACION
                       AND COD_MODALIDAD = L_COD_MODALIDAD;
                  ELSE
                  
                    UPDATE MEL_VEH_COTIZACION@OVPRO_PRD
                       SET MONTO_DM = P_RC_EXCESO
                     WHERE NUM_COTIZACION = P_NUM_COTIZACION
                       AND COD_MODALIDAD = L_COD_MODALIDAD;
                  
                  END IF;
                
                ELSE
                
                  UPDATE MEL_VEH_COTIZACION@OVPRO_PRD
                     SET MONTO_DM = P_RC_EXCESO
                   WHERE NUM_COTIZACION = P_NUM_COTIZACION
                     AND COD_MODALIDAD = L_COD_MODALIDAD;
                  COMMIT;
                
                END IF;
              
                UPDATE MEL_VEH_COTIZACION@OVPRO_PRD
                   SET FACTURA_48 = P_FACT48
                 WHERE NUM_COTIZACION = P_NUM_COTIZACION;
              
                UPDATE MEL_VEH_COTIZACION@OVPRO_PRD
                   SET COD_DOCUM_BEN = P_CONVENIO
                 WHERE NUM_COTIZACION = P_NUM_COTIZACION;
              
                UPDATE MEL_CAB_COTIZACION@OVPRO_PRD
                   SET COD_DOCUM_PAG = P_CONVENIO
                 WHERE NUM_COTIZACION = P_NUM_COTIZACION;
              
                UPDATE MEL_VEH_COTIZACION@OVPRO_PRD
                   SET MCA_MEL = P_MCA_MEL
                 WHERE NUM_COTIZACION = P_NUM_COTIZACION;
              
                IF R_FEC_ACTU_COTIZACION.FEC_ACTU IS NOT NULL THEN
                
                  UPDATE MEL_VEH_COTIZACION@OVPRO_PRD
                     SET FEC_ACTU = R_FEC_ACTU_COTIZACION.FEC_ACTU
                   WHERE NUM_COTIZACION = P_NUM_COTIZACION;
                
                END IF;
              
                COMMIT;
              
                EXIT;
              
              END IF;
            
            END LOOP;
          
            EXIT;
          
          END IF;
        END LOOP;
      
        DATOS_COT       := '';
        L_COD_MODALIDAD := '';
        PRIMA_NETA      := '';
        DESCUENTO       := '';
      
      END IF;
    
    END LOOP;
  
    P_GRABA_COB_OPC(P_NUM_COTIZACION, P_COB_OPC);
  
    /*  UPDATE MEL_VEH_COTIZACION@OVPRO_PRD
         SET VALOR_REFERENCIAL = P_VAL_SUB_MODELO
       WHERE NUM_COTIZACION = P_NUM_COTIZACION;
    */
    --|8003$18,21#-2,70|8005$15,17#-2,25
  
    --P_GUARDA_COT(P_COD_DOCUM,P_NUM_MATRICULA,P_COD_MODALIDAD,P_PRIMA_TOTAL,P_DESC,P_ID,P_NUM_COTIZACION,P_ERROR);
    /*
    UPDATE MEL_VEH_COTIZACION
    SET SEL_EMITIR = 'S'
    WHERE NUM_COTIZACION = P_NUM_COTIZACION
    AND COD_MODALIDAD = P_COD_MODALIDAD;*/
  
    P_GRABA_DATOS_SISGEN(P_COD_DOCUM_ASEG,
                         P_COD_DOCUM_ASEG,
                         P_NUM_MATRICULA,
                         P_NUM_COTIZACION,
                         L_ERROR);
  
    P_GRABA_RESPUESTAS(P_NUM_COTIZACION, 'N', 'N', 'N', L_ERROR);
  
  END P_GRABA_COTIZACION;

  /************************************/

  PROCEDURE P_GRABA_MODALIDAD(P_COD_DOCUM      VARCHAR2,
                              P_COD_DOCUM_ASEG VARCHAR2,
                              P_NUM_MATRICULA  VARCHAR2,
                              P_COD_MODALIDAD  NUMBER,
                              P_PRIMA_NETA     NUMBER,
                              P_DESC           VARCHAR2,
                              P_ID             VARCHAR2,
                              P_COD_RAMO       IN VARCHAR2,
                              P_NUM_COTIZACION IN OUT VARCHAR2,
                              P_ERROR          OUT VARCHAR2) IS
  
    CURSOR C_DATOS_VEH IS
      SELECT NVL(C.COD_MARCA, 0) COD_MARCA,
             NVL(C.COD_MODELO, 0) COD_MODELO,
             NVL(C.COD_SUB_MODELO, 0) COD_SUB_MODELO
        FROM OV_VEHICULO C
       WHERE C.ID = P_ID;
  
    R_DATOS_VEH C_DATOS_VEH%ROWTYPE;
  
    CURSOR C_DATOS_CUENTA IS
      SELECT COD_DOCUM_MAESTRO
        FROM (SELECT COD_DOCUM_MAESTRO
                FROM CTR_CUENTAS
               WHERE COD_DOCUM = P_COD_DOCUM
              UNION
              SELECT COD_DOCUM_MAESTRO
                FROM PWC_USUARIOS
               WHERE COD_DOCUM = P_COD_DOCUM)
       WHERE ROWNUM = 1;
    /* SELECT COD_DOCUM_MAESTRO
     FROM CTR_CUENTAS
    WHERE COD_DOCUM = P_COD_DOCUM;*/
  
    R_DATOS_CUENTA C_DATOS_CUENTA%ROWTYPE;
  
    /* CURSOR C_COD_RAMO_TARIFICADO(L_COD_MARCA NUMBER, L_COD_MODELO NUMBER) IS
      SELECT DISTINCT COD_RAMO
        FROM G2009901_MCL@OVPRO_PRD
       WHERE COD_CIA = 1
         AND COD_MARCA = L_COD_MARCA
         AND COD_MODELO = L_COD_MODELO;
    
    R_COD_RAMO_TARIFICADO C_COD_RAMO_TARIFICADO%ROWTYPE;*/
  
    L_COD_RAMO NUMBER;
    /*
    L_COD_RAMO_TARIF VARCHAR2(3);*/
  
    PRIMA_BRUTA NUMBER;
  
    PRIMA_NETA NUMBER;
  
    P_DESCUENTO NUMBER;
    P_RECARGO   NUMBER;
  
    --L_ID NUMBER;
  
    PRIMA_EXENTA NUMBER;
  
    CURSOR C_VALIDA_CUPON IS
      select 1
        from mel_bolsa_descuentos
       where num_cotizacion = P_NUM_COTIZACION;
  
    R_VALIDA_CUPON C_VALIDA_CUPON%ROWTYPE;
    L_EXISTE_CUPON BOOLEAN;
  
  BEGIN
  
    P_ERROR := '0';
  
    OPEN C_DATOS_VEH;
    FETCH C_DATOS_VEH
      INTO R_DATOS_VEH;
    CLOSE C_DATOS_VEH;
  
    OPEN C_DATOS_CUENTA;
    FETCH C_DATOS_CUENTA
      INTO R_DATOS_CUENTA;
    CLOSE C_DATOS_CUENTA;
  
    OPEN C_VALIDA_CUPON;
    FETCH C_VALIDA_CUPON
      INTO R_VALIDA_CUPON;
    L_EXISTE_CUPON := C_VALIDA_CUPON%FOUND;
    CLOSE C_VALIDA_CUPON;
  
    /*OPEN C_COD_RAMO_TARIFICADO(R_DATOS_VEH.COD_MARCA,
                               R_DATOS_VEH.COD_MODELO);
    FETCH C_COD_RAMO_TARIFICADO
      INTO R_COD_RAMO_TARIFICADO;
    CLOSE C_COD_RAMO_TARIFICADO;*/
  
    L_COD_RAMO := P_COD_RAMO;
  
    /*L_COD_RAMO_TARIF := R_COD_RAMO_TARIFICADO.COD_RAMO;
    
    IF L_COD_RAMO_TARIF != P_COD_RAMO THEN
      L_COD_RAMO := L_COD_RAMO_TARIF;
    END IF;*/
  
    IF L_EXISTE_CUPON THEN
    
      PRIMA_NETA := P_PRIMA_NETA;
    
    ELSE
    
      IF SUBSTR(P_DESC, 0, 1) = '-' THEN
      
        P_DESCUENTO := TO_NUMBER(SUBSTR(P_DESC, 1, LENGTH(P_DESC)));
        P_RECARGO   := 0;
      
        PRIMA_NETA := P_PRIMA_NETA + TO_NUMBER(P_DESCUENTO);
        --PRIMA_NETA := P_PRIMA_NETA;
      
      ELSE
        -- FDR:
        -- P_RECARGO   := TO_NUMBER(SUBSTR(P_DESC, 1, LENGTH(P_DESC)));
        P_RECARGO   := 2;
        P_DESCUENTO := 0;
      
        PRIMA_NETA := P_PRIMA_NETA + TO_NUMBER(P_RECARGO);
        --PRIMA_NETA := P_PRIMA_NETA;
      
      END IF;
    
      IF P_NUM_COTIZACION IS NULL THEN
      
        OV_K_NUM_COTIZACION_EUR.P_NUM_COTIZACION_EUR(L_COD_RAMO,
                                                     TO_CHAR(SYSDATE,
                                                             'YYYY'),
                                                     P_NUM_COTIZACION);
      
      END IF;
    
      PRIMA_EXENTA := 0;
    
      P_MONTO_COB_EXENTA(P_COD_RAMO, P_COD_MODALIDAD, PRIMA_EXENTA);
    
      PRIMA_BRUTA := PRIMA_NETA + ROUND((((PRIMA_NETA - PRIMA_EXENTA) *
                                        DC_F_IVA_VIGENTE()) / 100),
                                        2);
    
      /* PRIMA_BRUTA := PRIMA_NETA +
      ROUND(((DC_F_IVA_VIGENTE() * PRIMA_NETA) / 100), 2);*/
    
      /*OV_K_VEHICULOS.P_VALIDA_PATENTE_VEH(SUBSTR(P_NUM_MATRICULA, 3, 4),
      SUBSTR(P_NUM_MATRICULA, 0, 2),
      L_ID,
      P_ERROR);*/
    
      P_ERROR := '0';
    
      UPDATE MEL_VEH_COTIZACION@OVPRO_PRD
         SET IMP_PRIMA_NETA  = PRIMA_NETA,
             IMP_PRIMA_BRUTA = PRIMA_BRUTA,
             DESCUENTO       = P_DESCUENTO,
             RECARGO         = P_RECARGO,
             --FEC_ACTU        = SYSDATE,
             COD_RAMO      = L_COD_RAMO,
             NUM_MATRICULA = P_NUM_MATRICULA,
             ID            = P_ID
       WHERE NUM_COTIZACION = P_NUM_COTIZACION
         AND COD_MODALIDAD = P_COD_MODALIDAD;
    
      IF SQL%NOTFOUND THEN
      
        INSERT INTO MEL_VEH_COTIZACION@OVPRO_PRD
          (NUM_COTIZACION,
           COD_DOCUM_ASEG,
           COD_MODALIDAD,
           NUM_MATRICULA,
           IMP_PRIMA_NETA,
           IMP_PRIMA_BRUTA,
           DESCUENTO,
           RECARGO,
           COD_RAMO,
           FEC_ACTU,
           ID)
        VALUES
          (P_NUM_COTIZACION,
           P_COD_DOCUM_ASEG,
           P_COD_MODALIDAD,
           P_NUM_MATRICULA,
           PRIMA_NETA,
           PRIMA_BRUTA,
           P_DESCUENTO,
           P_RECARGO,
           P_COD_RAMO,
           SYSDATE,
           P_ID);
      
      END IF;
    
      COMMIT;
    
      UPDATE MEL_CAB_COTIZACION@OVPRO_PRD
         SET IMP_PRIMA_NETA  = PRIMA_NETA,
             IMP_PRIMA_BRUTA = PRIMA_BRUTA,
             --FEC_ACTU        = SYSDATE,
             COD_RAMO       = L_COD_RAMO,
             COD_DOCUM_ASEG = P_COD_DOCUM_ASEG,
             COD_DOCUM_PROP = P_COD_DOCUM_ASEG,
             COD_DOCUM      = P_COD_DOCUM,
             COD_DOCUM_MAE  = R_DATOS_CUENTA.COD_DOCUM_MAESTRO,
             TIP_ESTADO     = 1
       WHERE COD_CIA = 1
         AND NUM_COTIZACION = P_NUM_COTIZACION;
    
      IF SQL%NOTFOUND THEN
      
        INSERT INTO MEL_CAB_COTIZACION@OVPRO_PRD
          (COD_CIA,
           COD_RAMO,
           NUM_COTIZACION,
           COD_DOCUM_MAE,
           COD_DOCUM,
           COD_DOCUM_PROP,
           COD_DOCUM_ASEG,
           FEC_ACTU,
           TIP_ESTADO,
           IMP_PRIMA_NETA,
           IMP_PRIMA_BRUTA)
        VALUES
          (1,
           L_COD_RAMO,
           P_NUM_COTIZACION,
           R_DATOS_CUENTA.COD_DOCUM_MAESTRO,
           P_COD_DOCUM,
           P_COD_DOCUM_ASEG,
           P_COD_DOCUM_ASEG,
           SYSDATE,
           1,
           PRIMA_NETA,
           PRIMA_BRUTA);
      
      END IF;
    
      COMMIT;
    
    END IF;
  
  END P_GRABA_MODALIDAD;

  /************************************/

  PROCEDURE P_IMPRIME_COTIZACION(P_NUM_COTIZACION VARCHAR2,
                                 P_NOM_FIC        OUT VARCHAR2,
                                 P_ERROR          OUT VARCHAR2) IS
  
    L_NOM_FICHERO VARCHAR2(45);
    L_ID_FICHERO  UTL_FILE.FILE_TYPE;
    L_DIRECTORIO  VARCHAR2(255);
    /* V_MARCA          VARCHAR2(255);
    V_MODELO         VARCHAR2(255);
    V_SUBMODELO      VARCHAR2(255);
    V_NOM_USO        VARCHAR2(255);
    P_TEXTO          VARCHAR2(255);
    L_ADICIONALES    VARCHAR2(255);*/
    L_ABR_FORMULARIO VARCHAR2(45);
  
    V_NOM_TERCERO  VARCHAR2(100);
    V_APE1_TERCERO VARCHAR2(100);
    V_APE2_TERCERO VARCHAR2(100);
    V_ERROR        VARCHAR2(100);
  
    --L_COD_DESG G2000180.COD_DESGLOSE%TYPE;
  
    /* COD_COB             VARCHAR2(1000);
    IMP_ACUMULADO_ANUAL VARCHAR2(100);
    IMP_SPTO            VARCHAR2(10);
    IMP_ANUAL           VARCHAR2(100);
    L_CONT              NUMBER(4);
    L_IVA_PRIMA         VARCHAR2(10);
    L_PRIMA_FINAL       VARCHAR2(10);*/
  
    /*L_EXISTE      BOOLEAN;
    L_EXISTE_DESG BOOLEAN;
    IMP_SPTO_N    VARCHAR2(10);*/
  
    /*SUM_IMP_SPTO    VARCHAR2(1000);
    SUM_IVA_PRIMA   VARCHAR2(1000);
    SUM_PRIMA_FINAL VARCHAR2(1000);
    TOTAL_PRIMAS    VARCHAR2(1000);
    
    P_VALORES_COB VARCHAR2(1000);*/
  
    V_SISGEN VARCHAR2(1);
  
    CURSOR C_DATA_COTIZACION(PC_NUM_COTIZACION VARCHAR2) IS
      SELECT A.NUM_COTIZACION,
             A.COD_DOCUM_ASEG,
             A.COD_DOCUM_MAE,
             FEC_ACTU,
             COD_PLAN
        FROM MEL_CAB_COTIZACION@OVPRO_PRD A
       WHERE A.COD_CIA = 1
         AND A.NUM_COTIZACION = P_NUM_COTIZACION;
  
    R_DATA_COTIZACION C_DATA_COTIZACION%ROWTYPE;
  
    CURSOR C_COTIZACIONES IS
      SELECT num_cotizacion,
             num_matricula,
             cod_modalidad,
             cod_docum_aseg,
             cod_docum_ben,
             imp_prima_neta,
             imp_prima_bruta,
             fec_actu,
             deducible,
             cod_ramo,
             monto_rc,
             monto_dm,
             monto_lc,
             monto_comp,
             asistencia,
             prima,
             anos_sin_sini,
             contacto_inspecc,
             valor_referencial,
             cod_uso_vehi,
             factura_48,
             mca_mod_prima,
             estado,
             id,
             mca_inspeccion,
             cod_comuna,
             sel_emitir,
             iva,
             descuento,
             recargo,
             cod_docum_suplanta,
             edad_conductor,
             cod_cuadro_com,
             mca_mel,
             cant_siniestros,
             monto_siniestros,
             monto_cuota,
             mca_pagado,
             mca_hijos,
             mca_franquicia,
             mca_danospre
        FROM MEL_VEH_COTIZACION@OVPRO_PRD A
       WHERE A.NUM_COTIZACION = P_NUM_COTIZACION
       ORDER BY A.IMP_PRIMA_BRUTA DESC;
  
    CURSOR C_COBERTURAS(L_COD_MODALIDAD VARCHAR2) IS
      SELECT *
        FROM MEL_VEH_TABLA_COBERTURAS T
       WHERE COD_MODALIDAD = L_COD_MODALIDAD
         AND MCA_INH = 'N';
  
    CURSOR C_NOM_CORREDOR IS
      SELECT NOM_TERCERO || ' ' || APE1_TERCERO || ' ' || APE2_TERCERO NOM_CORREDOR
        FROM A1001399@OVPRO_PRD
       WHERE COD_CIA = 1
         AND TIP_DOCUM = 'RUT'
         AND COD_DOCUM = (SELECT COD_DOCUM_MAE
                            FROM TRON2000.MEL_CAB_COTIZACION@OVPRO_PRD T
                           WHERE T.NUM_COTIZACION = P_NUM_COTIZACION
                             AND ROWNUM < 2)
         AND ROWNUM < 2;
  
    R_NOM_CORREDOR C_NOM_CORREDOR%ROWTYPE;
  
    CURSOR C_NOM_TERCERO(P_RUT VARCHAR2) IS
      SELECT NOM_TERCERO, APE1_TERCERO
        FROM A1001399@OVPRO_PRD
       WHERE COD_CIA = 1
         AND TIP_DOCUM IN ('RUT', 'DIR')
         AND COD_DOCUM = P_RUT;
  
    R_NOM_TERCERO C_NOM_TERCERO%ROWTYPE;
  
    CURSOR C_MODALIDAD(P_COD_MODALIDAD NUMBER) IS
      SELECT DISTINCT B.NOM_MODALIDAD
        FROM A1002090@OVPRO_PRD A, G2990004@OVPRO_PRD B
       WHERE A.COD_RAMO IN (801, 802, 803, 808)
         AND B.COD_MODALIDAD >= 8000
         AND B.COD_CIA = A.COD_CIA
         AND B.COD_MODALIDAD = A.COD_MODALIDAD
         AND B.COD_MODALIDAD = P_COD_MODALIDAD;
  
    V_NOM_MODALIDAD VARCHAR2(100);
    CONTADOR        NUMBER;
    CONTADOR_PAT    NUMBER;
  
    CURSOR NOMBRES(L_MAR NUMBER, L_MOD NUMBER, L_SUBMOD NUMBER) IS
      SELECT A.NOM_MARCA, B.NOM_MODELO, C.NOM_SUB_MODELO
        FROM A2100400@OVPRO_PRD A,
             A2100410@OVPRO_PRD B,
             A2100420@OVPRO_PRD C
       WHERE A.COD_CIA = 1
         AND A.COD_CIA = B.COD_CIA
         AND A.COD_CIA = C.COD_CIA
         AND A.MCA_INH = 'N'
         AND A.MCA_INH = B.MCA_INH
         AND A.MCA_INH = C.MCA_INH
         AND A.COD_MARCA = L_MAR
         AND A.COD_MARCA = B.COD_MARCA
         AND A.COD_MARCA = C.COD_MARCA
         AND B.COD_MODELO = L_MOD
         AND B.COD_MODELO = C.COD_MODELO
         AND C.COD_SUB_MODELO = L_SUBMOD;
  
    R_NOMBRES NOMBRES %ROWTYPE;
  
    CURSOR C_VEH_COTIZACIONES IS
      SELECT num_cotizacion,
             num_matricula,
             cod_modalidad,
             cod_docum_aseg,
             cod_docum_ben,
             imp_prima_neta,
             imp_prima_bruta,
             fec_actu,
             deducible,
             cod_ramo,
             monto_rc,
             monto_dm,
             monto_lc,
             monto_comp,
             asistencia,
             prima,
             anos_sin_sini,
             contacto_inspecc,
             valor_referencial,
             cod_uso_vehi,
             factura_48,
             mca_mod_prima,
             estado,
             id,
             mca_inspeccion,
             cod_comuna,
             sel_emitir,
             iva,
             descuento,
             recargo,
             cod_docum_suplanta,
             edad_conductor,
             cod_cuadro_com,
             mca_mel,
             cant_siniestros,
             monto_siniestros,
             monto_cuota,
             mca_pagado,
             mca_hijos,
             mca_franquicia,
             mca_danospre
        FROM MEL_VEH_COTIZACION@OVPRO_PRD A
       WHERE A.NUM_COTIZACION = P_NUM_COTIZACION;
  
    R_VEH_COTIZACIONES C_VEH_COTIZACIONES%ROWTYPE;
  
    CURSOR VEHICULO(V_ID VARCHAR2) IS
      SELECT *
        FROM OV_VEHICULO
       WHERE ID = V_ID
         AND ROWNUM < 2;
  
    R_VEHICULO VEHICULO%ROWTYPE;
  
    CURSOR C_TRAE_CONDUCTORES(L_EDAD_CONDUCTOR VARCHAR2) IS
      SELECT *
        FROM MEL_VEH_DESC_CONDUCTOR
       WHERE TIP_CONDUCTOR = L_EDAD_CONDUCTOR;
  
    R_TRAE_CONDUCTORES C_TRAE_CONDUCTORES%ROWTYPE;
  
    CURSOR C_COD_AGT(PC_NUM_COTIZACION VARCHAR2) IS
      SELECT COD_AGT
        FROM A1001332@OVPRO_PRD A
       WHERE A.COD_CIA = 1
         AND A.TIP_DOCUM = 'RUT'
         AND A.COD_DOCUM = (SELECT COD_DOCUM_MAE
                              FROM TRON2000.MEL_CAB_COTIZACION@OVPRO_PRD T
                             WHERE T.NUM_COTIZACION = P_NUM_COTIZACION
                               AND ROWNUM < 2);
  
    R_COD_AGT C_COD_AGT%ROWTYPE;
  
    CURSOR C_COMISION(L_CUADRO_COM VARCHAR2, L_COD_MODALIDAD VARCHAR2) IS
      SELECT PORC_COM
        FROM MEL_VEH_COMISION T
       WHERE COD_CUADRO_COM = L_CUADRO_COM
         AND COD_MODALIDAD = L_COD_MODALIDAD
         AND MCA_INH = 'N';
  
    R_COMISION C_COMISION%ROWTYPE;
  
    V_VALOR_CUOTA        VARCHAR2(20);
    V_TXT_EDAD_CONDUCTOR VARCHAR2(60);
  
    V_IMP_NETO             VARCHAR2(20);
    V_INT_IMPTO            VARCHAR2(20);
    V_VAL_CUOTA_NETA       VARCHAR2(20);
    V_VAL_CUOTA_IMPTO      VARCHAR2(20);
    L_RANGO_EDAD_CONDUCTOR VARCHAR2(20);
    FLAG_CLAUSULA          NUMBER;
  
    FLAG_FLEX      VARCHAR2(2);
    FLAG_BALANCE   VARCHAR2(2);
    FLAG_MASTER    VARCHAR2(2);
    FLAG_ELEMENTAL VARCHAR2(2);
  
    L_NUM_POLIZA_GRUPO VARCHAR2(20);
    L_NUM_CONTRATO     VARCHAR2(20);
    L_MCA_EXPRESS      VARCHAR2(10);
    L_MCA_SEXO         VARCHAR2(10);
    L_MCA_DESCUENTO    VARCHAR2(10);
    L_TIPO_DESC        VARCHAR2(10);
    L_VALOR_DESC       VARCHAR2(10);
  
  BEGIN
  
    P_IMPRIME_COTIZACION2(P_NUM_COTIZACION, 12, P_NOM_FIC, P_ERROR);
  
    /********************************************************************/
    /*
    OPEN C_DATA_COTIZACION(P_NUM_COTIZACION);
    FETCH C_DATA_COTIZACION
      INTO R_DATA_COTIZACION;
    CLOSE C_DATA_COTIZACION;
    
    OPEN C_COD_AGT(P_NUM_COTIZACION);
    FETCH C_COD_AGT
      INTO R_COD_AGT;
    CLOSE C_COD_AGT;
    
    OPEN C_NOM_CORREDOR;
    FETCH C_NOM_CORREDOR
      INTO R_NOM_CORREDOR;
    CLOSE C_NOM_CORREDOR;
    
    OPEN C_NOM_TERCERO(R_DATA_COTIZACION.COD_DOCUM_ASEG);
    FETCH C_NOM_TERCERO
      INTO R_NOM_TERCERO;
    CLOSE C_NOM_TERCERO;
    
    OPEN C_VEH_COTIZACIONES;
    FETCH C_VEH_COTIZACIONES
      INTO R_VEH_COTIZACIONES;
    CLOSE C_VEH_COTIZACIONES;
    
    OPEN VEHICULO(R_VEH_COTIZACIONES.ID);
    FETCH VEHICULO
      INTO R_VEHICULO;
    CLOSE VEHICULO;
    
    OPEN NOMBRES(R_VEHICULO.COD_MARCA,
                 R_VEHICULO.COD_MODELO,
                 R_VEHICULO.COD_SUB_MODELO);
    FETCH NOMBRES
      INTO R_NOMBRES;
    CLOSE NOMBRES;
    
    mel_p_num_pol_grupo(1,
                        801,
                        R_DATA_COTIZACION.COD_DOCUM_MAE,
                        R_VEH_COTIZACIONES.COD_DOCUM_BEN,
                        R_DATA_COTIZACION.COD_PLAN,
                        L_NUM_POLIZA_GRUPO,
                        L_NUM_CONTRATO);
    
    MEL_K_TERCERO_TRN.P_TRAE_NOM_ASEGURADO(R_DATA_COTIZACION.COD_DOCUM_ASEG,
                                           V_NOM_TERCERO,
                                           V_APE1_TERCERO,
                                           V_APE2_TERCERO,
                                           V_ERROR);
    
    CASE R_VEH_COTIZACIONES.COD_DOCUM_BEN
      WHEN 'RIPLEY' THEN
        L_ABR_FORMULARIO := 'COTIZ_VEH_RIPLEY';
      WHEN 'RIPLEYBI' THEN
        L_ABR_FORMULARIO := 'COTIZ_VEH_RIPLEY';
      WHEN 'RIPLEYFUNC' THEN
        L_ABR_FORMULARIO := 'COTIZ_VEH_RIPLEY';
        --WHEN 'RIPLEYCALL' THEN
      WHEN 'RIPLEYDESCU   ' THEN
        L_ABR_FORMULARIO := 'COTIZ_VEH_RIPLEY';
      WHEN 'RIPLEYCC' THEN
        L_ABR_FORMULARIO := 'COTIZ_VEH_RIPLEY_ASIST';
      WHEN 'RIPLEYUC' THEN
        L_ABR_FORMULARIO := 'COTIZ_VEH_RIPLEY_ASIST';
      WHEN 'RIPLEYUCHILE' THEN
        L_ABR_FORMULARIO := 'COTIZ_VEH_RIPLEY_ASIST';
      WHEN 'RIPLEYXBOX' THEN
        L_ABR_FORMULARIO := 'COTIZ_VEH_RIPLEY_ASIST';
      WHEN 'RIPLEYDIANINO' THEN
        L_ABR_FORMULARIO := 'COTIZ_VEH_RIPLEY_ASIST';
      WHEN 'RIPLEYCOR' THEN
        L_ABR_FORMULARIO := 'COTIZ_VEH_RIPLEY_ASIST';
      WHEN 'RIPLEYFUNC' THEN
        L_ABR_FORMULARIO := 'COTIZ_VEH_RIPLEY_ASIST';
      WHEN 'ESCOLARBIANUAL' THEN
        L_ABR_FORMULARIO := 'COTIZ_VEH_RIPLEY_ASIST';
      WHEN 'WILLIS' THEN
        L_ABR_FORMULARIO := 'COTIZ_VEH_WILLIS';
      WHEN '789967806' THEN
        \*BICE*\
        L_ABR_FORMULARIO := 'COTIZ_VEH_CLIC';
      WHEN '777215604' THEN
        \* GRUNFELD *\
        L_ABR_FORMULARIO := 'C_VEH_GRUNFELD';
      ELSE
        L_ABR_FORMULARIO := 'COTIZ_VEH';
    END CASE;
    
    --L_ABR_FORMULARIO := 'COTIZ_VEH';
    
    \* IF R_COD_AGT.COD_AGT = '42173' THEN
      L_ABR_FORMULARIO := 'COTIZ_VEH_CLIC';
    END IF;*\
    
    -- L_DIRECTORIO     := '/AP/LIS/FPATH';
    
    L_DIRECTORIO  := 'DPATH';
    L_NOM_FICHERO := 'VEH_COT_' || P_NUM_COTIZACION || '.DAT';
    P_NOM_FIC     := 'VEH_COT_' || P_NUM_COTIZACION || '.PDF';
    
    l_id_fichero := UTL_FILE.FOPEN(l_directorio, l_nom_fichero, 'w');
    
    UTL_FILE.PUTF(l_id_fichero,
                  '<job> ' || l_abr_formulario ||
                  ' -C -gpdf -pagcount -outputD:\inetpub\PDF\' || p_nom_fic || '\n');
    
    IF R_VEH_COTIZACIONES.MCA_MEL = 'S' THEN
      P_GRABA_DAT(' <glb> TIPOCOT ',
                  '(PARA EMISION ELECTRONICA)',
                  L_ID_FICHERO);
    ELSE
      P_GRABA_DAT(' <glb> TIPOCOT ',
                  '(PARA EMISION EN OFICINA MAPFRE)',
                  L_ID_FICHERO);
    END IF;
    
    --17.JULIO.2014 CJSS COTIZACION O PRPUESTA SI ES EXPRESS
    IF R_VEH_COTIZACIONES.NUM_MATRICULA = 'A/D' AND
       R_VEH_COTIZACIONES.FACTURA_48 = '0' THEN
      P_GRABA_DAT(' <glb> COT_O_PROP ', 'PROPUESTA DE', L_ID_FICHERO);
      P_GRABA_DAT(' <glb> SUBTITULO_DOC ',
                  'Validez de la Propuesta : 10 dias corridos (MEL)',
                  L_ID_FICHERO);
    ELSIF R_VEH_COTIZACIONES.COD_DOCUM_BEN = 'RIPLEYALTIRO' THEN
      P_GRABA_DAT(' <glb> COT_O_PROP ', 'PROPUESTA DE', L_ID_FICHERO);
      P_GRABA_DAT(' <glb> SUBTITULO_DOC ',
                  'Validez de la Propuesta : 10 dias corridos (MEL)',
                  L_ID_FICHERO);
    ELSIF R_VEH_COTIZACIONES.COD_DOCUM_BEN = 'RIPLEYEMP' THEN
      P_GRABA_DAT(' <glb> COT_O_PROP ', 'PROPUESTA DE', L_ID_FICHERO);
      P_GRABA_DAT(' <glb> SUBTITULO_DOC ',
                  'Validez de la Propuesta : 10 dias corridos (MEL)',
                  L_ID_FICHERO);
    ELSIF R_VEH_COTIZACIONES.COD_DOCUM_BEN = 'RIPLEYFUNC' THEN
      P_GRABA_DAT(' <glb> COT_O_PROP ', 'PROPUESTA DE', L_ID_FICHERO);
      P_GRABA_DAT(' <glb> SUBTITULO_DOC ',
                  'Validez de la Propuesta : 10 dias corridos (MEL)',
                  L_ID_FICHERO);
    ELSE
      P_GRABA_DAT(' <glb> COT_O_PROP ', 'COTIZACION DE', L_ID_FICHERO);
      P_GRABA_DAT(' <glb> SUBTITULO_DOC ',
                  'Validez de la Cotizacion : 10 dias corridos (MEL)',
                  L_ID_FICHERO);
    END IF;
    
    \*CJSS INLUIR NOMBRE DE CONVENIO EN CASOS RIPLEY*\
    IF R_VEH_COTIZACIONES.COD_DOCUM_BEN IS NOT NULL THEN
      P_GRABA_DAT(' <glb> NOM_CONVENIO ',
                  'CONVENIO :' || R_VEH_COTIZACIONES.COD_DOCUM_BEN,
                  L_ID_FICHERO);
    END IF;
    
    --P_GRABA_DAT(' <glb> TIPOCOT ', '', L_ID_FICHERO);
    P_GRABA_DAT(' <glb> NUM_COTIZ ', P_NUM_COTIZACION, L_ID_FICHERO);
    P_GRABA_DAT(' <glb> NOM_ASEG ', V_NOM_TERCERO, L_ID_FICHERO);
    P_GRABA_DAT(' <glb> APE_ASEG ',
                V_APE1_TERCERO || ' ' || V_APE2_TERCERO,
                L_ID_FICHERO);
    P_GRABA_DAT(' <fld> RUT_ASEG ',
                REPLACE(EM_F_EDITA_COD_DOCUM(R_DATA_COTIZACION.COD_DOCUM_ASEG),
                        ',',
                        '.'),
                L_ID_FICHERO);
    P_GRABA_DAT(' <fld> MARCA ',
                R_NOMBRES.NOM_MARCA || ' ' || R_NOMBRES.NOM_MODELO || ' ' ||
                R_NOMBRES.NOM_SUB_MODELO,
                L_ID_FICHERO);
    P_GRABA_DAT(' <fld> ANIO ', R_VEHICULO.ANO_FAB, L_ID_FICHERO);
    P_GRABA_DAT(' <fld> PATENTE', R_VEHICULO.NUM_MATRICULA, L_ID_FICHERO);
    P_GRABA_DAT(' <fld> MONTO_RC',
                R_VEH_COTIZACIONES.MONTO_RC,
                L_ID_FICHERO);
    
    P_GRABA_DAT(' <glb> NUM_POL_GRUPO ',
                R_VEH_COTIZACIONES.COD_DOCUM_BEN,
                L_ID_FICHERO);
    
    P_BUSCA_RANGO_EDAD(R_VEH_COTIZACIONES.EDAD_CONDUCTOR,
                       L_RANGO_EDAD_CONDUCTOR);
    
    OPEN C_TRAE_CONDUCTORES(L_RANGO_EDAD_CONDUCTOR);
    FETCH C_TRAE_CONDUCTORES
      INTO R_TRAE_CONDUCTORES;
    CLOSE C_TRAE_CONDUCTORES;
    
    V_TXT_EDAD_CONDUCTOR := R_VEH_COTIZACIONES.EDAD_CONDUCTOR;
    
    --Revisa si tiene sisgen
    
    IF R_VEH_COTIZACIONES.CANT_SINIESTROS > 0 THEN
      V_SISGEN := 'S';
    ELSE
      V_SISGEN := '';
    END IF;
    
    --   
    
    P_GRABA_DAT(' <fld> EDAD_COND', V_TXT_EDAD_CONDUCTOR, L_ID_FICHERO);
    
    CONTADOR       := 0;
    FLAG_CLAUSULA  := 0;
    FLAG_FLEX      := 0;
    FLAG_BALANCE   := 0;
    FLAG_MASTER    := 0;
    FLAG_ELEMENTAL := 0;
    
    FOR R_COTIZACIONES IN C_COTIZACIONES LOOP
    
      CONTADOR := CONTADOR + 1;
    
      IF CONTADOR <= 3 THEN
      
        \*OPEN C_MODALIDAD(R_COTIZACIONES.COD_MODALIDAD);
        FETCH C_MODALIDAD
          INTO V_NOM_MODALIDAD;
        CLOSE C_MODALIDAD;*\
      
        P_NOM_MODALIDAD(R_COTIZACIONES.COD_MODALIDAD, V_NOM_MODALIDAD);
      
        P_GRABA_DAT(' <fld> MOD_SEG_' || CONTADOR || ' ',
                    V_NOM_MODALIDAD,
                    L_ID_FICHERO);
      
        --- 24CUOTAS
      
        IF R_COTIZACIONES.COD_DOCUM_BEN IN ('RIPLEYBI', 'ESCOLARBIANUAL') THEN
        
          P_CALCULO_CUOTA_SIN_INTERES(24,
                                      R_COTIZACIONES.IMP_PRIMA_NETA,
                                      V_VALOR_CUOTA,
                                      V_ERROR);
        
          \*IF V_VALOR_CUOTA < 0.8 THEN
            V_VALOR_CUOTA := ' - ';
          END IF;*\
        
          P_GRABA_DAT('<fld> VALOR_CTA_24' || CONTADOR || ' ',
                      V_VALOR_CUOTA,
                      L_ID_FICHERO);
        
        END IF;
      
        --- 12CUOTAS
      
        IF R_COTIZACIONES.COD_DOCUM_BEN IN
           ('RIPLEY',
            'RIPLEYBI',
            'RIPLEYFUNC',
            'RIPLEYDESCU',
            'ESCOLARBIANUAL') THEN
        
          P_CALCULO_CUOTA_SIN_INTERES(12,
                                      R_COTIZACIONES.IMP_PRIMA_NETA,
                                      V_VALOR_CUOTA,
                                      V_ERROR);
        
        ELSE
        
          MEL_K_COBRANZA.P_CALCULO_CUOTA(12,
                                         R_COTIZACIONES.IMP_PRIMA_NETA,
                                         0,
                                         R_COTIZACIONES.COD_RAMO,
                                         'GD',
                                         '25',
                                         V_IMP_NETO,
                                         V_INT_IMPTO,
                                         V_VAL_CUOTA_NETA,
                                         V_VAL_CUOTA_IMPTO,
                                         V_VALOR_CUOTA,
                                         V_ERROR);
        
        END IF;
      
        \*IF V_VALOR_CUOTA < 0.8 THEN
          V_VALOR_CUOTA := ' - ';
        END IF;*\
      
        P_GRABA_DAT('<fld> VALOR_CTA_12' || CONTADOR || ' ',
                    V_VALOR_CUOTA,
                    L_ID_FICHERO);
      
        --- 10 CUOTAS
      
        MEL_K_COBRANZA.P_CALCULO_CUOTA(10,
                                       R_COTIZACIONES.IMP_PRIMA_NETA,
                                       0,
                                       R_COTIZACIONES.COD_RAMO,
                                       'GD',
                                       '25',
                                       V_IMP_NETO,
                                       V_INT_IMPTO,
                                       V_VAL_CUOTA_NETA,
                                       V_VAL_CUOTA_IMPTO,
                                       V_VALOR_CUOTA,
                                       V_ERROR);
      
        \*IF V_VALOR_CUOTA < 0.8 THEN
          V_VALOR_CUOTA := ' - ';
        END IF;*\
      
        P_GRABA_DAT('<fld> VALOR_CTA_10' || CONTADOR || ' ',
                    V_VALOR_CUOTA,
                    L_ID_FICHERO);
      
        --- 8 CUOTAS
      
        MEL_K_COBRANZA.P_CALCULO_CUOTA(8,
                                       R_COTIZACIONES.IMP_PRIMA_NETA,
                                       0,
                                       R_COTIZACIONES.COD_RAMO,
                                       'GD',
                                       '25',
                                       V_IMP_NETO,
                                       V_INT_IMPTO,
                                       V_VAL_CUOTA_NETA,
                                       V_VAL_CUOTA_IMPTO,
                                       V_VALOR_CUOTA,
                                       V_ERROR);
      
        \*IF V_VALOR_CUOTA < 0.8 THEN
          V_VALOR_CUOTA := ' - ';
        END IF;*\
      
        P_GRABA_DAT('<fld> VALOR_CTA_8' || CONTADOR || ' ',
                    V_VALOR_CUOTA,
                    L_ID_FICHERO);
      
        --- 6 CUOTAS
      
        MEL_K_COBRANZA.P_CALCULO_CUOTA(6,
                                       R_COTIZACIONES.IMP_PRIMA_NETA,
                                       0,
                                       R_COTIZACIONES.COD_RAMO,
                                       'GD',
                                       '25',
                                       V_IMP_NETO,
                                       V_INT_IMPTO,
                                       V_VAL_CUOTA_NETA,
                                       V_VAL_CUOTA_IMPTO,
                                       V_VALOR_CUOTA,
                                       V_ERROR);
      
        \*IF V_VALOR_CUOTA < 0.8 THEN
          V_VALOR_CUOTA := ' - ';
        END IF;*\
      
        P_GRABA_DAT('<fld> VALOR_CTA_6' || CONTADOR || ' ',
                    V_VALOR_CUOTA,
                    L_ID_FICHERO);
      
        --- 3 CUOTAS
      
        MEL_K_COBRANZA.P_CALCULO_CUOTA(3,
                                       R_COTIZACIONES.IMP_PRIMA_NETA,
                                       0,
                                       R_COTIZACIONES.COD_RAMO,
                                       'GD',
                                       '25',
                                       V_IMP_NETO,
                                       V_INT_IMPTO,
                                       V_VAL_CUOTA_NETA,
                                       V_VAL_CUOTA_IMPTO,
                                       V_VALOR_CUOTA,
                                       V_ERROR);
      
        \*IF V_VALOR_CUOTA < 0.8 THEN
          V_VALOR_CUOTA := ' - ';
        END IF;*\
      
        P_GRABA_DAT('<fld> VALOR_CTA_3' || CONTADOR || ' ',
                    V_VALOR_CUOTA,
                    L_ID_FICHERO);
      
        -- PRIMA TOTAL
      
        P_GRABA_DAT('<fld> PAG_CONTAD_' || CONTADOR || ' ',
                    R_COTIZACIONES.IMP_PRIMA_BRUTA,
                    L_ID_FICHERO);
      
        \***************    CON PAT      *********************************************************\
      
        CONTADOR_PAT := CONTADOR + 3;
      
        P_GRABA_DAT(' <fld> MOD_SEG_' || CONTADOR_PAT || ' ',
                    V_NOM_MODALIDAD,
                    L_ID_FICHERO);
      
        --- 12CUOTAS
      
        MEL_K_COBRANZA.P_CALCULO_CUOTA(12,
                                       R_COTIZACIONES.IMP_PRIMA_NETA,
                                       0,
                                       R_COTIZACIONES.COD_RAMO,
                                       'TA',
                                       '25',
                                       V_IMP_NETO,
                                       V_INT_IMPTO,
                                       V_VAL_CUOTA_NETA,
                                       V_VAL_CUOTA_IMPTO,
                                       V_VALOR_CUOTA,
                                       V_ERROR);
      
        \*IF V_VALOR_CUOTA < 0.8 THEN
          V_VALOR_CUOTA := ' - ';
        END IF;*\
      
        P_GRABA_DAT('<fld> VALOR_CTA_12' || CONTADOR_PAT || ' ',
                    V_VALOR_CUOTA,
                    L_ID_FICHERO);
      
        --- 10 CUOTAS
      
        MEL_K_COBRANZA.P_CALCULO_CUOTA(10,
                                       R_COTIZACIONES.IMP_PRIMA_NETA,
                                       0,
                                       R_COTIZACIONES.COD_RAMO,
                                       'TA',
                                       '25',
                                       V_IMP_NETO,
                                       V_INT_IMPTO,
                                       V_VAL_CUOTA_NETA,
                                       V_VAL_CUOTA_IMPTO,
                                       V_VALOR_CUOTA,
                                       V_ERROR);
      
        \*IF V_VALOR_CUOTA < 0.8 THEN
          V_VALOR_CUOTA := ' - ';
        END IF;*\
      
        P_GRABA_DAT('<fld> VALOR_CTA_10' || CONTADOR_PAT || ' ',
                    V_VALOR_CUOTA,
                    L_ID_FICHERO);
      
        --- 8 CUOTAS
      
        MEL_K_COBRANZA.P_CALCULO_CUOTA(8,
                                       R_COTIZACIONES.IMP_PRIMA_NETA,
                                       0,
                                       R_COTIZACIONES.COD_RAMO,
                                       'TA',
                                       '25',
                                       V_IMP_NETO,
                                       V_INT_IMPTO,
                                       V_VAL_CUOTA_NETA,
                                       V_VAL_CUOTA_IMPTO,
                                       V_VALOR_CUOTA,
                                       V_ERROR);
      
        \*IF V_VALOR_CUOTA < 0.8 THEN
          V_VALOR_CUOTA := ' - ';
        END IF;*\
      
        P_GRABA_DAT('<fld> VALOR_CTA_8' || CONTADOR_PAT || ' ',
                    V_VALOR_CUOTA,
                    L_ID_FICHERO);
      
        --- 6 CUOTAS
      
        MEL_K_COBRANZA.P_CALCULO_CUOTA(6,
                                       R_COTIZACIONES.IMP_PRIMA_NETA,
                                       0,
                                       R_COTIZACIONES.COD_RAMO,
                                       'TA',
                                       '25',
                                       V_IMP_NETO,
                                       V_INT_IMPTO,
                                       V_VAL_CUOTA_NETA,
                                       V_VAL_CUOTA_IMPTO,
                                       V_VALOR_CUOTA,
                                       V_ERROR);
      
        \*IF V_VALOR_CUOTA < 0.8 THEN
          V_VALOR_CUOTA := ' - ';
        END IF;*\
      
        P_GRABA_DAT('<fld> VALOR_CTA_6' || CONTADOR_PAT || ' ',
                    V_VALOR_CUOTA,
                    L_ID_FICHERO);
      
        --- 3 CUOTAS
      
        MEL_K_COBRANZA.P_CALCULO_CUOTA(3,
                                       R_COTIZACIONES.IMP_PRIMA_NETA,
                                       0,
                                       R_COTIZACIONES.COD_RAMO,
                                       'TA',
                                       '25',
                                       V_IMP_NETO,
                                       V_INT_IMPTO,
                                       V_VAL_CUOTA_NETA,
                                       V_VAL_CUOTA_IMPTO,
                                       V_VALOR_CUOTA,
                                       V_ERROR);
      
        \*IF V_VALOR_CUOTA < 0.8 THEN
          V_VALOR_CUOTA := ' - ';
        END IF;*\
      
        P_GRABA_DAT('<fld> VALOR_CTA_3' || CONTADOR_PAT || ' ',
                    V_VALOR_CUOTA,
                    L_ID_FICHERO);
      
        -- PRIMA TOTAL
      
        P_GRABA_DAT('<fld> PAG_CONTAD_' || CONTADOR_PAT || ' ',
                    R_COTIZACIONES.IMP_PRIMA_BRUTA,
                    L_ID_FICHERO);
      
        \*********************************************************************************************\
      
      END IF;
    
      CASE
        WHEN R_COTIZACIONES.COD_MODALIDAD IN (8000, 8003, 8005, 8010) THEN
          IF FLAG_FLEX = 0 THEN
            P_GRABA_DAT(' <fld> NOM_MODAL_' || CONTADOR || ' ',
                        'FLEX',
                        L_ID_FICHERO);
            FLAG_FLEX := 1;
          
            FOR R_COBERTURAS IN C_COBERTURAS(R_COTIZACIONES.COD_MODALIDAD) LOOP
            
              IF R_COBERTURAS.ID_COBERTURA IN
                 ('RC_1800', 'RC_4300', 'DVEXT', 'AM') THEN
                CASE
                  WHEN R_COBERTURAS.ID_COBERTURA = 'RC_1800' AND
                       R_COTIZACIONES.MONTO_DM = '8200' THEN
                    P_GRABA_DAT(' <fld> ' || R_COBERTURAS.ID_COBERTURA || '_' ||
                                CONTADOR || ' ',
                                'INCLUIDO',
                                L_ID_FICHERO);
                  WHEN R_COBERTURAS.ID_COBERTURA = 'RC_4300' AND
                       R_COTIZACIONES.MONTO_DM = '8201' THEN
                    P_GRABA_DAT(' <fld> ' || R_COBERTURAS.ID_COBERTURA || '_' ||
                                CONTADOR || ' ',
                                'INCLUIDO',
                                L_ID_FICHERO);
                  WHEN R_COBERTURAS.ID_COBERTURA = 'DVEXT' AND
                       R_COTIZACIONES.DEDUCIBLE = '8105' THEN
                    P_GRABA_DAT(' <fld> ' || R_COBERTURAS.ID_COBERTURA || '_' ||
                                CONTADOR || ' ',
                                'INCLUIDO',
                                L_ID_FICHERO);
                  WHEN R_COBERTURAS.ID_COBERTURA LIKE 'AM%' AND
                       R_COTIZACIONES.MONTO_LC = '8133' THEN
                    IF R_COTIZACIONES.MCA_MEL = 'S' THEN
                      P_GRABA_DAT(' <fld> ' || R_COBERTURAS.ID_COBERTURA || '_' ||
                                  CONTADOR || ' ',
                                  'Auto Reemplazo Sin Limite',
                                  L_ID_FICHERO);
                    ELSE
                      P_GRABA_DAT(' <fld> ' || R_COBERTURAS.ID_COBERTURA || '_' ||
                                  CONTADOR || ' ',
                                  'Auto Reemplazo 5 dias',
                                  L_ID_FICHERO);
                    END IF;
                  ELSE
                    P_GRABA_DAT(' <fld> ' || R_COBERTURAS.ID_COBERTURA || '_' ||
                                CONTADOR || ' ',
                                '',
                                L_ID_FICHERO);
                END CASE;
              
              ELSE
              
                IF R_COBERTURAS.TEXTO_COBERTURA IS NULL THEN
                
                  P_GRABA_DAT(' <fld> ' || R_COBERTURAS.ID_COBERTURA || '_' ||
                              CONTADOR || ' ',
                              'SI',
                              L_ID_FICHERO);
                ELSE
                  P_GRABA_DAT(' <fld> ' || R_COBERTURAS.ID_COBERTURA || '_' ||
                              CONTADOR || ' ',
                              R_COBERTURAS.TEXTO_COBERTURA,
                              L_ID_FICHERO);
                END IF;
              
              END IF;
            
            END LOOP;
          END IF;
        WHEN R_COTIZACIONES.COD_MODALIDAD IN (8120, 8123, 8125, 8121) THEN
          IF FLAG_MASTER = 0 THEN
            P_GRABA_DAT(' <fld> NOM_MODAL_' || CONTADOR || ' ',
                        'MASTER',
                        L_ID_FICHERO);
            FLAG_MASTER := 1;
          
            FOR R_COBERTURAS IN C_COBERTURAS(R_COTIZACIONES.COD_MODALIDAD) LOOP
            
              IF R_COBERTURAS.ID_COBERTURA IN
                 ('RC_1800', 'RC_4300', 'DVEXT', 'AM') THEN
                CASE
                  WHEN R_COBERTURAS.ID_COBERTURA = 'RC_1800' AND
                       R_COTIZACIONES.MONTO_DM = '8200' THEN
                    P_GRABA_DAT(' <fld> ' || R_COBERTURAS.ID_COBERTURA || '_' ||
                                CONTADOR || ' ',
                                'INCLUIDO',
                                L_ID_FICHERO);
                  WHEN R_COBERTURAS.ID_COBERTURA = 'RC_4300' AND
                       R_COTIZACIONES.MONTO_DM = '8201' THEN
                    P_GRABA_DAT(' <fld> ' || R_COBERTURAS.ID_COBERTURA || '_' ||
                                CONTADOR || ' ',
                                'INCLUIDO',
                                L_ID_FICHERO);
                  WHEN R_COBERTURAS.ID_COBERTURA = 'DVEXT' AND
                       R_COTIZACIONES.DEDUCIBLE = '8105' THEN
                    P_GRABA_DAT(' <fld> ' || R_COBERTURAS.ID_COBERTURA || '_' ||
                                CONTADOR || ' ',
                                'INCLUIDO',
                                L_ID_FICHERO);
                  WHEN R_COBERTURAS.ID_COBERTURA LIKE 'AM%' AND
                       R_COTIZACIONES.MONTO_LC = '8133' THEN
                    IF R_COTIZACIONES.MCA_MEL = 'S' THEN
                      P_GRABA_DAT(' <fld> ' || R_COBERTURAS.ID_COBERTURA || '_' ||
                                  CONTADOR || ' ',
                                  'Auto Reemplazo Sin Limite',
                                  L_ID_FICHERO);
                    ELSE
                      P_GRABA_DAT(' <fld> ' || R_COBERTURAS.ID_COBERTURA || '_' ||
                                  CONTADOR || ' ',
                                  'Auto Reemplazo 5 dias',
                                  L_ID_FICHERO);
                    END IF;
                  ELSE
                    P_GRABA_DAT(' <fld> ' || R_COBERTURAS.ID_COBERTURA || '_' ||
                                CONTADOR || ' ',
                                '',
                                L_ID_FICHERO);
                END CASE;
              
              ELSE
              
                IF R_COBERTURAS.TEXTO_COBERTURA IS NULL THEN
                
                  P_GRABA_DAT(' <fld> ' || R_COBERTURAS.ID_COBERTURA || '_' ||
                              CONTADOR || ' ',
                              'SI',
                              L_ID_FICHERO);
                ELSE
                  P_GRABA_DAT(' <fld> ' || R_COBERTURAS.ID_COBERTURA || '_' ||
                              CONTADOR || ' ',
                              R_COBERTURAS.TEXTO_COBERTURA,
                              L_ID_FICHERO);
                END IF;
              
              END IF;
            
            END LOOP;
          
          END IF;
        WHEN R_COTIZACIONES.COD_MODALIDAD = 8900 THEN
          IF FLAG_BALANCE = 0 THEN
            P_GRABA_DAT(' <fld> NOM_MODAL_' || CONTADOR || ' ',
                        'BALANCE',
                        L_ID_FICHERO);
            FLAG_BALANCE := 1;
            FOR R_COBERTURAS IN C_COBERTURAS(R_COTIZACIONES.COD_MODALIDAD) LOOP
            
              IF R_COBERTURAS.ID_COBERTURA IN
                 ('RC_1800', 'RC_4300', 'DVEXT', 'AM') THEN
                CASE
                  WHEN R_COBERTURAS.ID_COBERTURA = 'RC_1800' AND
                       R_COTIZACIONES.MONTO_DM = '8200' THEN
                    P_GRABA_DAT(' <fld> ' || R_COBERTURAS.ID_COBERTURA || '_' ||
                                CONTADOR || ' ',
                                'INCLUIDO',
                                L_ID_FICHERO);
                  WHEN R_COBERTURAS.ID_COBERTURA = 'RC_4300' AND
                       R_COTIZACIONES.MONTO_DM = '8201' THEN
                    P_GRABA_DAT(' <fld> ' || R_COBERTURAS.ID_COBERTURA || '_' ||
                                CONTADOR || ' ',
                                'INCLUIDO',
                                L_ID_FICHERO);
                  WHEN R_COBERTURAS.ID_COBERTURA = 'DVEXT' AND
                       R_COTIZACIONES.DEDUCIBLE = '8105' THEN
                    P_GRABA_DAT(' <fld> ' || R_COBERTURAS.ID_COBERTURA || '_' ||
                                CONTADOR || ' ',
                                'INCLUIDO',
                                L_ID_FICHERO);
                    \*IF R_COTIZACIONES.DEDUCIBLE = '8105' THEN
                    P_GRABA_DAT(' <fld> ' || R_COBERTURAS.ID_COBERTURA || '_' ||
                                CONTADOR || ' ',
                                'INCLUIDO',
                                L_ID_FICHERO);*\
                  ELSE
                    P_GRABA_DAT(' <fld> ' || R_COBERTURAS.ID_COBERTURA || '_' ||
                                CONTADOR || ' ',
                                '',
                                L_ID_FICHERO);
                END CASE;
              
              ELSE
              
                IF R_COBERTURAS.TEXTO_COBERTURA IS NULL THEN
                
                  P_GRABA_DAT(' <fld> ' || R_COBERTURAS.ID_COBERTURA || '_' ||
                              CONTADOR || ' ',
                              'SI',
                              L_ID_FICHERO);
                ELSE
                  P_GRABA_DAT(' <fld> ' || R_COBERTURAS.ID_COBERTURA || '_' ||
                              CONTADOR || ' ',
                              R_COBERTURAS.TEXTO_COBERTURA,
                              L_ID_FICHERO);
                END IF;
              
              END IF;
            
            END LOOP;
          END IF;
        WHEN R_COTIZACIONES.COD_MODALIDAD = 8910 THEN
          IF FLAG_ELEMENTAL = 0 THEN
            P_GRABA_DAT(' <fld> NOM_MODAL_' || CONTADOR || ' ',
                        'ELEMENTAL',
                        L_ID_FICHERO);
            FLAG_ELEMENTAL := 1;
          
            FOR R_COBERTURAS IN C_COBERTURAS(R_COTIZACIONES.COD_MODALIDAD) LOOP
            
              IF R_COBERTURAS.ID_COBERTURA IN
                 ('RC_1800', 'RC_4300', 'DVEXT') THEN
                CASE
                  WHEN R_COBERTURAS.ID_COBERTURA = 'RC_1800' AND
                       R_COTIZACIONES.MONTO_DM = '8200' THEN
                    P_GRABA_DAT(' <fld> ' || R_COBERTURAS.ID_COBERTURA || '_' ||
                                CONTADOR || ' ',
                                'INCLUIDO',
                                L_ID_FICHERO);
                  WHEN R_COBERTURAS.ID_COBERTURA = 'RC_4300' AND
                       R_COTIZACIONES.MONTO_DM = '8201' THEN
                    P_GRABA_DAT(' <fld> ' || R_COBERTURAS.ID_COBERTURA || '_' ||
                                CONTADOR || ' ',
                                'INCLUIDO',
                                L_ID_FICHERO);
                  WHEN R_COBERTURAS.ID_COBERTURA = 'DVEXT' AND
                       R_COTIZACIONES.DEDUCIBLE = '8105' THEN
                    P_GRABA_DAT(' <fld> ' || R_COBERTURAS.ID_COBERTURA || '_' ||
                                CONTADOR || ' ',
                                'INCLUIDO',
                                L_ID_FICHERO);
                  ELSE
                    P_GRABA_DAT(' <fld> ' || R_COBERTURAS.ID_COBERTURA || '_' ||
                                CONTADOR || ' ',
                                '',
                                L_ID_FICHERO);
                END CASE;
              
              ELSE
              
                IF R_COBERTURAS.TEXTO_COBERTURA IS NULL THEN
                
                  P_GRABA_DAT(' <fld> ' || R_COBERTURAS.ID_COBERTURA || '_' ||
                              CONTADOR || ' ',
                              'SI',
                              L_ID_FICHERO);
                ELSE
                  P_GRABA_DAT(' <fld> ' || R_COBERTURAS.ID_COBERTURA || '_' ||
                              CONTADOR || ' ',
                              R_COBERTURAS.TEXTO_COBERTURA,
                              L_ID_FICHERO);
                END IF;
              
              END IF;
            
            END LOOP;
          
          END IF;
        
        ELSE
        
          DBMS_OUTPUT.PUT_LINE('NADA');
          \*CONTADOR := CONTADOR - 1;*\
      
      END CASE;
    
      IF R_COTIZACIONES.COD_MODALIDAD IN
         (8000, 8003, 8005, 8010, 8015, 8120, 8123, 8125, 8121, 8900) THEN
      
        IF R_COTIZACIONES.MCA_MEL = 'S' THEN
        
          P_GRABA_DAT('<fld> AUTOREM',
                      'En caso de perdida total se otorgara auto de reemplazo sin limite con copago de $5000 diarios.
                     En caso de da?o parcial se otorgara auto de reemplazo sin limite con copago de $5000 diarios',
                      L_ID_FICHERO);
        
        ELSE
        
          P_GRABA_DAT('<fld> AUTOREM',
                      'En caso de perdida total se otorgara auto de reemplazo sin limite con copago de $5000 diarios.
                     En caso de da?o parcial se otorgara auto de reemplazo con tope de 5 dias con copago de $5000 diarios',
                      L_ID_FICHERO);
        
        END IF;
      
      END IF;
    
      IF V_TXT_EDAD_CONDUCTOR >= 35 AND
         R_COTIZACIONES.COD_MODALIDAD IN (8120, 8123, 8125, 8121) THEN
      
        IF FLAG_CLAUSULA = 0 THEN
        
          P_GRABA_DAT('<fld> NOM_CLAUSULA', 'CONDUCT+35', L_ID_FICHERO);
          P_GRABA_DAT('<fld> CLAUSULA',
                      'Esta poliza ha sido suscrita y el riesgo ha sido aceptado por la compa?ia de seguros, sobre la base que el conductor  es mayor de 35 a?os, si en caso de siniestro el conductor  sea menor  a esta edad, las partes  acuerdan expresamente que se aplicara un deducible adicional al contratado  voluntariamente, ascendente a el 10% de la perdida con un minimo de UF. 20.- en todo y cada siniestro (Condicion aplica solo a Plan Master).',
                      L_ID_FICHERO);
          FLAG_CLAUSULA := 1;
        
        END IF;
      
      END IF;
    
      IF R_COTIZACIONES.ASISTENCIA = '1' THEN
      
        P_GRABA_DAT('<fld> EXGARAGE',
                    'Rige exclusividad de garage para el vehiculo informado',
                    L_ID_FICHERO);
      
      END IF;
    
      IF R_COTIZACIONES.COD_MODALIDAD IN
         (8000, 8003, 8005, 8010, 8015, 8120, 8123, 8125, 8121) THEN
      
        IF R_COTIZACIONES.MONTO_LC = '8133' THEN
        
          IF R_COTIZACIONES.MCA_MEL = 'S' THEN
          
            P_GRABA_DAT('<fld> ASISTENCIA',
                        'Incluye auto de reemplazo sin limite(solo emision electronica en Mapfre En Linea)',
                        L_ID_FICHERO);
          
            \*ELSE
            
            P_GRABA_DAT('<fld> ASISTENCIA',
                        'Incluye 5 dias de auto de reemplazo.',
                        L_ID_FICHERO);*\
          
          END IF;
        
        END IF;
      
      END IF;
    
      IF R_COTIZACIONES.DEDUCIBLE = '8105' THEN
      
        P_GRABA_DAT('<fld> EXTRANJERO',
                    'Incluye cobertura de da?os al vehiculo durante viaje al extranjero',
                    L_ID_FICHERO);
      
      END IF;
    
      IF R_COTIZACIONES.FACTURA_48 = '0' AND
         R_VEH_COTIZACIONES.NUM_MATRICULA = 'A/D' THEN
      
        L_MCA_EXPRESS := 'EX';
      
      ELSE
      
        L_MCA_EXPRESS := '';
      
      END IF;
    
      \*********** SEXO **********\
      IF R_COTIZACIONES.anos_sin_sini = '0' THEN
      
        L_MCA_SEXO := 'F';
      
      ELSE
      
        L_MCA_SEXO := 'M';
      
      END IF;
    
      P_TRAE_DESC_COTIZACION(P_NUM_COTIZACION, L_TIPO_DESC, L_VALOR_DESC);
    
      IF R_COTIZACIONES.COD_CUADRO_COM IS NOT NULL THEN
      
        OPEN C_COMISION(R_COTIZACIONES.COD_CUADRO_COM,
                        R_COTIZACIONES.COD_MODALIDAD);
        FETCH C_COMISION
          INTO R_COMISION;
        CLOSE C_COMISION;
      
        P_GRABA_DAT('<fld> MONTOCOMISION',
                    R_COMISION.PORC_COM || ' - E:' || V_TXT_EDAD_CONDUCTOR || ' ' ||
                    V_SISGEN || ' ' || L_MCA_EXPRESS || ' ' || L_MCA_SEXO || ' ' ||
                    L_TIPO_DESC || ' ' || L_VALOR_DESC,
                    L_ID_FICHERO);
      
        \*    P_GRABA_DAT('<fld> COMISION',
        'POLIZA DE EMISION EXCLUSIVA EN MAPFRE EN LINEA',
        L_ID_FICHERO);*\
      ELSE
        P_GRABA_DAT('<fld> MONTOCOMISION',
                    'E:' || V_TXT_EDAD_CONDUCTOR || ' ' || V_SISGEN || ' ' ||
                    L_MCA_EXPRESS || ' ' || L_MCA_SEXO || ' ' ||
                    L_TIPO_DESC || ' ' || L_VALOR_DESC,
                    L_ID_FICHERO);
      END IF;
    
      IF R_COTIZACIONES.MCA_MEL = 'S' THEN
      
        P_GRABA_DAT('<fld> COMISION',
                    '*******************  POLIZA DE EMISION EXCLUSIVA EN MAPFRE EN LINEA  *******************',
                    L_ID_FICHERO);
      END IF;
    
      IF R_COTIZACIONES.MCA_MEL = 'N' THEN
      
        P_GRABA_DAT('<fld> COMISION',
                    '*********************  POLIZA DE EMISION EXCLUSIVA OFICINA MAPFRE  *********************',
                    L_ID_FICHERO);
      END IF;
    
    END LOOP;
    
    P_GRABA_DAT(' <fld> NOM_CORREDOR',
                R_NOM_CORREDOR.NOM_CORREDOR,
                L_ID_FICHERO);
    
    P_GRABA_DAT(' <fld> FEC_ACTUAL',
                TO_CHAR(R_DATA_COTIZACION.FEC_ACTU, 'DD') || ' DE ' ||
                RTRIM(TO_CHAR(R_DATA_COTIZACION.FEC_ACTU,
                              'MONTH',
                              'NLS_DATE_LANGUAGE = SPANISH')) || ' DE ' ||
                TO_CHAR(R_DATA_COTIZACION.FEC_ACTU, 'YYYY'),
                L_ID_FICHERO);
    
    IF (L_ABR_FORMULARIO = 'COTIZ_VEH_RIPLEY' \* or
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            L_ABR_FORMULARIO = 'COTIZ_VEH'*\
       ) THEN
      IF ((R_VEHICULO.COD_MARCA = '340' AND
         R_VEHICULO.COD_MODELO IN
         ('30', '35', '47', '113', '49', '50', '122', '52', 117, '53')) OR
         (R_VEHICULO.COD_MARCA = '520' AND
         R_VEHICULO.COD_MODELO IN ('80',
                                     '135',
                                     '98',
                                     '99',
                                     '100',
                                     '101',
                                     '102',
                                     '133',
                                     '130',
                                     '131',
                                     '103',
                                     '133')) OR
         (R_VEHICULO.COD_MARCA = '375' AND
         R_VEHICULO.COD_MODELO IN ('175', '101', '200')) OR
         (R_VEHICULO.COD_MARCA = '535' AND
         R_VEHICULO.COD_MODELO IN ('91', '177', '165')) OR
         (R_VEHICULO.COD_MARCA = '550' AND
         R_VEHICULO.COD_MODELO IN ('75', '150', '177')) OR
         (R_VEHICULO.COD_MARCA = '220' AND R_VEHICULO.COD_MODELO IN ('37'))) THEN
      
        P_GRABA_DAT('<NPG>', '', L_ID_FICHERO);
      
      END IF;
    
    END IF;
    
    IF R_VEH_COTIZACIONES.MCA_MEL != 'S' THEN
    
      IF ((R_VEHICULO.COD_MARCA = '340' AND
         R_VEHICULO.COD_MODELO IN
         ('30', '35', '47', '113', '49', '50', '122', '52', 117, '53')) OR
         (R_VEHICULO.COD_MARCA = '520' AND
         R_VEHICULO.COD_MODELO IN ('80',
                                     '135',
                                     '98',
                                     '99',
                                     '100',
                                     '101',
                                     '102',
                                     '133',
                                     '130',
                                     '131',
                                     '103',
                                     '133')) OR
         (R_VEHICULO.COD_MARCA = '375' AND
         R_VEHICULO.COD_MODELO IN ('175', '101', '200')) OR
         (R_VEHICULO.COD_MARCA = '535' AND
         R_VEHICULO.COD_MODELO IN ('91', '177', '165')) OR
         (R_VEHICULO.COD_MARCA = '550' AND
         R_VEHICULO.COD_MODELO IN ('75', '150', '177')) OR
         (R_VEHICULO.COD_MARCA = '220' AND R_VEHICULO.COD_MODELO IN ('37'))) THEN
      
        P_GRABA_DAT('<NPG>', '', L_ID_FICHERO);
      
      END IF;
    
    END IF;
    
    UTL_FILE.FCLOSE(L_ID_FICHERO);
    
    COMMIT;*/
  
  EXCEPTION
    WHEN UTL_FILE.INTERNAL_ERROR THEN
      RAISE_APPLICATION_ERROR(-20000, 'ERROR INTERNO (UTL_FILE)');
    WHEN UTL_FILE.INVALID_FILEHANDLE THEN
      RAISE_APPLICATION_ERROR(-20000,
                              'MANEJADOR FICHERO INVALIDO (UTL_FILE)');
    WHEN UTL_FILE.INVALID_MODE THEN
      RAISE_APPLICATION_ERROR(-20000, 'MODO INVALIDO (UTL_FILE)');
    WHEN UTL_FILE.INVALID_OPERATION THEN
      RAISE_APPLICATION_ERROR(-20000, 'OPERACION INVALIDA (UTL_FILE)');
    WHEN UTL_FILE.INVALID_PATH THEN
      RAISE_APPLICATION_ERROR(-20000,
                              'DIRECTORIO O FICHERO NO ACCESIBLE (UTL_FILE)');
    WHEN UTL_FILE.WRITE_ERROR THEN
      RAISE_APPLICATION_ERROR(-20000, 'ERROR DE ESCRITURA (UTL_FILE)');
    WHEN OTHERS THEN
      P_ERROR := SQLERRM;
  END P_IMPRIME_COTIZACION;

  /******************************/

  PROCEDURE P_SISGEN(P_COD_DOCUM_ASEG   VARCHAR2,
                     P_COD_DOCUM_TOMAD  VARCHAR2,
                     P_NUM_MATRICULA    VARCHAR2,
                     P_MONTO_SINIESTROS OUT NUMBER,
                     P_CANT_SINIESTRO   OUT NUMBER,
                     P_ERROR            OUT VARCHAR2) IS
  
    P_MONTO_SINIESTROS_ASEG  NUMBER;
    P_MONTO_SINIESTROS_TOMAD NUMBER;
    P_CANT_SINIESTRO_ASEG    NUMBER;
    P_CANT_SINIESTRO_TOMAD   NUMBER;
  
  BEGIN
  
    IF P_COD_DOCUM_ASEG != P_COD_DOCUM_TOMAD THEN
    
      OV.MEL_K_SINIESTRALIDAD.P_SINIESTRALIDAD_PRIMAS_PAQ(P_COD_DOCUM_ASEG,
                                                          P_NUM_MATRICULA,
                                                          P_MONTO_SINIESTROS_ASEG,
                                                          P_CANT_SINIESTRO_ASEG,
                                                          P_ERROR);
    
      OV.MEL_K_SINIESTRALIDAD.P_SINIESTRALIDAD_PRIMAS_PAQ(P_COD_DOCUM_TOMAD,
                                                          P_NUM_MATRICULA,
                                                          P_MONTO_SINIESTROS_TOMAD,
                                                          P_CANT_SINIESTRO_TOMAD,
                                                          P_ERROR);
    
      IF P_MONTO_SINIESTROS_ASEG > P_MONTO_SINIESTROS_TOMAD THEN
        P_MONTO_SINIESTROS := P_MONTO_SINIESTROS_ASEG;
        P_CANT_SINIESTRO   := P_CANT_SINIESTRO_ASEG;
      ELSE
        P_MONTO_SINIESTROS := P_MONTO_SINIESTROS_TOMAD;
        P_CANT_SINIESTRO   := P_CANT_SINIESTRO_TOMAD;
      END IF;
    
    ELSE
    
      OV.MEL_K_SINIESTRALIDAD.P_SINIESTRALIDAD_PRIMAS_PAQ(P_COD_DOCUM_ASEG,
                                                          P_NUM_MATRICULA,
                                                          P_MONTO_SINIESTROS_ASEG,
                                                          P_CANT_SINIESTRO_ASEG,
                                                          P_ERROR);
    
      P_MONTO_SINIESTROS := P_MONTO_SINIESTROS_ASEG;
      P_CANT_SINIESTRO   := P_CANT_SINIESTRO_ASEG;
    
    END IF;
  
    /*IF P_ERROR != 0 THEN
    
      OV.P_ENVIA_MAIL_HTML('OV@MAPFRE.CL',
                           'GERARDO.PEREZ@MAPFRE.CL',
                           'ERROR EN COTIZADOR DE VEHICULOS LIVIANOS - SISGEN',
                            P_ERROR || '.' || P_COD_DOCUM_ASEG || '-' || P_COD_DOCUM_TOMAD || '-' || P_NUM_MATRICULA );
    
    END IF;*/
  
  EXCEPTION
    WHEN OTHERS THEN
      P_ERROR := SUBSTR(SQLERRM, 0, 99);
      /*OV.P_ENVIA_MAIL_HTML('OV@MAPFRE.CL',
                             'GERARDO.PEREZ@MAPFRE.CL',
                             'ERROR EN COTIZADOR DE VEHICULOS LIVIANOS - SISGEN',
                              P_ERROR || '.' || P_COD_DOCUM_ASEG || '-' || P_COD_DOCUM_TOMAD || '-' || P_NUM_MATRICULA);
      */
  END P_SISGEN;

  /******************************/

  PROCEDURE P_DATOS_TERCERO(P_COD_DOCUM   VARCHAR2,
                            P_NOM_TERCERO OUT VARCHAR2,
                            P_APE_PATERNO OUT VARCHAR2,
                            P_APE_MATERNO OUT VARCHAR2,
                            P_EDAD        OUT VARCHAR2,
                            P_SEXO        OUT VARCHAR2,
                            P_ERROR       OUT VARCHAR2) IS
  
    P_FEC_NACIM   DATE;
    P_SEMAFORO    NUMBER;
    L_NOM_TERCERO VARCHAR2(100);
    L_APE_PATERNO VARCHAR2(100);
    L_APE_MATERNO VARCHAR2(100);
  
  BEGIN
  
    P_ERROR := '0';
  
    MEL_K_TERCERO_TRN.P_TRAE_NOM_ASEGURADO(P_COD_DOCUM,
                                           P_NOM_TERCERO,
                                           P_APE_PATERNO,
                                           P_APE_MATERNO,
                                           P_ERROR);
  
    TRN_K_GLOBAL.BORRA_TODAS@OVPRO_PRD;
  
    TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('COD_CIA', 1);
  
    TRON2000.EA_P_OBTIENE_DATOS_TERC_MCL@OVPRO_PRD(P_COD_DOCUM,
                                                   L_APE_PATERNO,
                                                   L_APE_MATERNO,
                                                   L_NOM_TERCERO,
                                                   P_FEC_NACIM,
                                                   P_SEXO,
                                                   P_SEMAFORO);
    COMMIT;
  
    IF P_ERROR != 'OK' THEN
    
      P_NOM_TERCERO := L_NOM_TERCERO;
      P_APE_PATERNO := L_APE_PATERNO;
      P_APE_MATERNO := L_APE_MATERNO;
    
    ELSE
    
      P_ERROR := '0';
    
    END IF;
  
    P_BUSCA_EDAD('1', 'RUT', P_COD_DOCUM, P_FEC_NACIM, P_EDAD);
    COMMIT;
  
    IF P_EDAD < 18 OR P_EDAD IS NULL THEN
      P_EDAD := 18;
    END IF;
  
    P_BUSCA_SEXO('1', 'RUT', P_COD_DOCUM, P_SEXO);
    COMMIT;
  
  EXCEPTION
    WHEN OTHERS THEN
      P_ERROR := SUBSTR(SQLERRM, 0, 99);
    
  END P_DATOS_TERCERO;

  /******************************/

  PROCEDURE P_GRABA_DATOS_VEH(P_NUM_MATRICULA  VARCHAR2,
                              P_COD_DOCUM      VARCHAR2,
                              P_COD_MARCA      NUMBER,
                              P_COD_MODELO     NUMBER,
                              P_COD_SUB_MODELO NUMBER,
                              P_ANIO_FAB       VARCHAR2,
                              P_ID             IN OUT VARCHAR2,
                              P_ERROR          OUT VARCHAR2) IS
  
    CURSOR EXISTE IS
      SELECT ID FROM OV_VEHICULO WHERE NUM_MATRICULA = P_NUM_MATRICULA;
  
    EXISTE_VEH BOOLEAN;
    DAT        NUMBER;
  
    CURSOR TIP_VEHI(V_COD_SUB_MODELO VARCHAR2) IS
      SELECT T.COD_TIP_VEHI
        FROM A2100420@OVPRO_PRD T
       WHERE T.COD_MARCA = P_COD_MARCA
         AND T.COD_MODELO = P_COD_MODELO
         AND T.COD_SUB_MODELO = V_COD_SUB_MODELO
         AND T.FEC_VALIDEZ = (SELECT MAX(B.FEC_VALIDEZ)
                                FROM A2100420@OVPRO_PRD B
                               WHERE B.COD_MARCA = T.COD_MARCA
                                 AND B.COD_MODELO = T.COD_MODELO
                                 AND B.COD_SUB_MODELO = T.COD_SUB_MODELO
                                 AND B.MCA_INH = 'N');
  
    L_TIP_VEH NUMBER;
  
    CURSOR C_SUB_MODELO IS
      SELECT SMOD.COD_SUB_MODELO COD_SUB_MODELO
        FROM A2100420@OVPRO_PRD SMOD, A2100420@OVPRO_PRD C
       WHERE SMOD.COD_CIA = 1
         AND SMOD.COD_MARCA = P_COD_MARCA
         AND SMOD.COD_MODELO = P_COD_MODELO
         AND C.COD_CIA = SMOD.COD_CIA
         AND C.COD_MARCA = SMOD.COD_MARCA
         AND C.COD_MODELO = SMOD.COD_MODELO
         AND C.COD_SUB_MODELO = SMOD.COD_SUB_MODELO
         AND C.COD_TIP_VEHI <= 6
         and c.mca_inh = 'N'
         AND SMOD.fec_VALIDEZ =
             (select max(b.fec_VALIDEZ)
                from A2100420@OVPRO_PRD b
               where SMOD.COD_CIA = b.COD_CIA
                 AND SMOD.COD_SUB_MODELO = b.COD_SUB_MODELO
                 AND SMOD.COD_MARCA = b.COD_MARCA
                 AND SMOD.COD_MODELO = b.COD_MODELO)
         AND ROWNUM = 1;
  
    L_EXISTE         BOOLEAN;
    L_USO_VEHI       NUMBER;
    L_COD_SUB_MODELO VARCHAR2(10);
  
  BEGIN
  
    P_ERROR := '0';
  
    IF P_COD_SUB_MODELO IS NULL OR P_COD_SUB_MODELO = 0 THEN
    
      L_USO_VEHI := 1;
    
      OPEN C_SUB_MODELO;
      FETCH C_SUB_MODELO
        INTO L_COD_SUB_MODELO;
      CLOSE C_SUB_MODELO;
    
    ELSE
    
      L_COD_SUB_MODELO := P_COD_SUB_MODELO;
    
    END IF;
  
    /*IF P_NUM_MATRICULA != 'A/D' THEN
          OPEN EXISTE;
          FETCH EXISTE
            INTO DAT;
          EXISTE_VEH := EXISTE%FOUND;
          CLOSE EXISTE;
        ELSE
          EXISTE_VEH := FALSE;
        END IF;
    */
    OPEN TIP_VEHI(L_COD_SUB_MODELO);
    FETCH TIP_VEHI
      INTO L_TIP_VEH;
    CLOSE TIP_VEHI;
  
    IF P_ID IS NOT NULL THEN
    
      UPDATE OV_VEHICULO
         SET COD_MARCA      = P_COD_MARCA,
             COD_MODELO     = P_COD_MODELO,
             COD_SUB_MODELO = L_COD_SUB_MODELO,
             ANO_FAB        = P_ANIO_FAB,
             COD_TIP_VEHI   = L_TIP_VEH,
             NUM_MATRICULA  = P_NUM_MATRICULA
       WHERE ID = P_ID;
    
      --P_ID := DAT;
    
      COMMIT;
    
    ELSE
    
      P_ID := OV.F_GET_ID_OV_VEHICULO();
    
      INSERT INTO OV_VEHICULO
        (COD_MARCA,
         COD_MODELO,
         COD_SUB_MODELO,
         ANO_FAB,
         NUM_MATRICULA,
         COD_DOCUM,
         ID,
         COD_TIP_VEHI,
         FEC_ACTU)
      VALUES
        (P_COD_MARCA,
         P_COD_MODELO,
         L_COD_SUB_MODELO,
         P_ANIO_FAB,
         P_NUM_MATRICULA,
         P_COD_DOCUM,
         P_ID,
         L_TIP_VEH,
         SYSDATE);
    
    END IF;
  
    COMMIT;
  
  EXCEPTION
    WHEN OTHERS THEN
      P_ERROR := SUBSTR(SQLERRM, 0, 99);
    
  END P_GRABA_DATOS_VEH;

  /**************************/

  PROCEDURE P_GRABA_MODALIDAD_EMITE(P_COD_DOCUM      VARCHAR2,
                                    P_COD_DOCUM_ASEG VARCHAR2,
                                    P_NUM_MATRICULA  VARCHAR2,
                                    P_COD_MODALIDAD  NUMBER,
                                    P_PRIMA_NETA     NUMBER,
                                    P_DESC           VARCHAR2,
                                    P_ID             NUMBER,
                                    P_COD_RAMO       VARCHAR2,
                                    P_MONTO_RC       VARCHAR2,
                                    P_EDAD_CONDUCTOR VARCHAR2,
                                    P_SEXO_CONDUCTOR VARCHAR2,
                                    P_RC_EXCESO      VARCHAR2,
                                    P_FACT48         VARCHAR2,
                                    P_CONVENIO       VARCHAR2,
                                    P_COB_OPC        VARCHAR2,
                                    P_MCA_MEL        VARCHAR2,
                                    P_NUM_COTIZACION IN OUT VARCHAR2,
                                    P_ERROR          OUT VARCHAR2) IS
  
  BEGIN
  
    P_ERROR := '0';
  
    P_GRABA_MODALIDAD(P_COD_DOCUM,
                      P_COD_DOCUM_ASEG,
                      P_NUM_MATRICULA,
                      TO_NUMBER(P_COD_MODALIDAD),
                      TO_NUMBER(P_PRIMA_NETA),
                      P_DESC,
                      P_ID,
                      P_COD_RAMO,
                      P_NUM_COTIZACION,
                      P_ERROR);
  
    UPDATE MEL_VEH_COTIZACION@OVPRO_PRD
       SET SEL_EMITIR = ''
     WHERE NUM_COTIZACION = P_NUM_COTIZACION;
    COMMIT;
  
    UPDATE MEL_VEH_COTIZACION@OVPRO_PRD
       SET SEL_EMITIR = 'S'
     WHERE NUM_COTIZACION = P_NUM_COTIZACION
       AND COD_MODALIDAD = P_COD_MODALIDAD;
  
    UPDATE MEL_VEH_COTIZACION@OVPRO_PRD
       SET MONTO_RC = P_MONTO_RC
     WHERE NUM_COTIZACION = P_NUM_COTIZACION;
  
    UPDATE MEL_CAB_COTIZACION@OVPRO_PRD
       SET COD_PLAN = P_COD_MODALIDAD
     WHERE COD_CIA = 1
       AND NUM_COTIZACION = P_NUM_COTIZACION;
  
    UPDATE MEL_VEH_COTIZACION@OVPRO_PRD
       SET VALOR_REFERENCIAL = '1000'
     WHERE NUM_COTIZACION = P_NUM_COTIZACION;
  
    UPDATE MEL_VEH_COTIZACION@OVPRO_PRD
       SET EDAD_CONDUCTOR = P_EDAD_CONDUCTOR
     WHERE NUM_COTIZACION = P_NUM_COTIZACION;
  
    UPDATE MEL_VEH_COTIZACION@OVPRO_PRD
       SET ANOS_SIN_SINI = P_SEXO_CONDUCTOR
     WHERE NUM_COTIZACION = P_NUM_COTIZACION;
  
    IF P_COD_MODALIDAD IN (8120, 8123, 8125, 8121) THEN
    
      IF P_RC_EXCESO = '0' THEN
      
        UPDATE MEL_VEH_COTIZACION@OVPRO_PRD
           SET MONTO_DM = '8202'
         WHERE NUM_COTIZACION = P_NUM_COTIZACION
           AND COD_MODALIDAD = P_COD_MODALIDAD;
        COMMIT;
      ELSE
      
        UPDATE MEL_VEH_COTIZACION@OVPRO_PRD
           SET MONTO_DM = P_RC_EXCESO
         WHERE NUM_COTIZACION = P_NUM_COTIZACION
           AND COD_MODALIDAD = P_COD_MODALIDAD;
        COMMIT;
      
      END IF;
    
    ELSE
    
      UPDATE MEL_VEH_COTIZACION@OVPRO_PRD
         SET MONTO_DM = P_RC_EXCESO
       WHERE NUM_COTIZACION = P_NUM_COTIZACION
         AND COD_MODALIDAD = P_COD_MODALIDAD;
      COMMIT;
    
    END IF;
  
    UPDATE MEL_VEH_COTIZACION@OVPRO_PRD
       SET FACTURA_48 = P_FACT48
     WHERE NUM_COTIZACION = P_NUM_COTIZACION;
    COMMIT;
  
    UPDATE MEL_VEH_COTIZACION@OVPRO_PRD
       SET COD_DOCUM_BEN = P_CONVENIO
     WHERE NUM_COTIZACION = P_NUM_COTIZACION;
    COMMIT;
  
    UPDATE MEL_CAB_COTIZACION@OVPRO_PRD
       SET COD_DOCUM_PAG = P_CONVENIO
     WHERE NUM_COTIZACION = P_NUM_COTIZACION;
    COMMIT;
  
    UPDATE MEL_VEH_COTIZACION@OVPRO_PRD
       SET MCA_MEL = P_MCA_MEL
     WHERE NUM_COTIZACION = P_NUM_COTIZACION;
    COMMIT;
  
    P_GRABA_COB_OPC(P_NUM_COTIZACION, P_COB_OPC);
  
  END P_GRABA_MODALIDAD_EMITE;

  /****************************/

  PROCEDURE P_GENERA_XML(P_COD_DOCUM_MAE        VARCHAR2,
                         P_COD_DOCUM_ASEG       VARCHAR2,
                         P_COD_DOCUM_TOMAD      VARCHAR2,
                         P_NUM_COTIZACION       VARCHAR2,
                         P_COD_PLAN_PAGO        VARCHAR2,
                         P_IND_INSP             VARCHAR2,
                         P_FEC_VIG_INI          VARCHAR2,
                         P_DIA_PAGO             VARCHAR2,
                         P_FORMA_PAGO           VARCHAR2,
                         P_CODBANCO             VARCHAR2,
                         P_CODTARJETA           VARCHAR2,
                         P_NROTARJETA           VARCHAR2,
                         P_MESTARJETA           VARCHAR2,
                         P_ANIOTARJETA          VARCHAR2,
                         P_SUPLANTA             VARCHAR2,
                         P_COD_RAMO             OUT VARCHAR2,
                         P_MEL_XML_POL_P2000030 OUT CLOB,
                         P_MEL_XML_POL_P2000031 OUT CLOB,
                         P_MEL_XML_POL_P2000020 OUT CLOB,
                         P_MEL_XML_POL_P2000040 OUT CLOB,
                         P_MEL_XML_POL_P2000060 OUT CLOB,
                         P_MEL_XML_POL_P1001331 OUT CLOB,
                         P_ERROR                OUT VARCHAR2) IS
  
    P_CAMPO             VARCHAR2(80);
    P_VAL_CAMPO         VARCHAR2(100);
    L_COD_ASEGURAMIENTO VARCHAR2(10);
    P_TIP_NIVEL         VARCHAR2(80);
    P_NUM_RIESGO        VARCHAR2(80);
    X                   NUMBER;
    L_SUMA_ASEG         NUMBER;
    P_MEL_XML_POL       CLOB;
    L_COD_PLAN          VARCHAR2(10);
  
    CURSOR C_GET_PARAM_XML(L_NOM_TABLA VARCHAR2) IS
      SELECT *
        FROM MEL_XML_TABLAS@OVPRO_PRD
       WHERE NOM_TABLA = L_NOM_TABLA
         AND MCA_INH = 'N'
         AND (COD_CIA = 1 OR COD_CIA = 9)
         AND (COD_RAMO = 800 OR COD_RAMO = 999)
       ORDER BY MCA_FIJO ASC;
  
    -- SE SELECCIONA EL CODIGO AGENTE
    CURSOR COD_AGT(V_COD_MAE VARCHAR2) IS
      SELECT A.COD_AGT, A.COD_EJECUTIVO, A.COD_NIVEL3, A.TIP_AGT
        FROM A1001332@OVPRO_PRD A
       WHERE A.COD_CIA = 1
         AND (A.TIP_DOCUM = 'RUT' OR A.TIP_DOCUM = 'DIR')
         AND A.COD_DOCUM = V_COD_MAE
         AND A.COD_ACT_TERCERO = 2
         AND A.COD_CALIDAD = 1
         AND A.MCA_INH = 'N'
         AND A.FEC_VALIDEZ = (SELECT MAX(F.FEC_VALIDEZ)
                                FROM A1001332@OVPRO_PRD F
                               WHERE F.COD_AGT = A.COD_AGT
                                 AND F.COD_CIA = 1);
  
    C_COD_AGT COD_AGT %ROWTYPE;
    /*
      CURSOR COMISION(V_COD_AGT A1001332.COD_AGT %TYPE) IS
        SELECT A.COD_CUADRO_COM
          FROM A1001342@OVPRO_PRD A
         WHERE A.COD_CIA = 1
           AND A.COD_AGT = V_COD_AGT
           AND A.COD_TRATAMIENTO = 'A'
           AND A.MCA_INH = 'N'
           AND A.FEC_VALIDEZ = (SELECT MAX(B.FEC_VALIDEZ)
                                  FROM A1001342@OVPRO_PRD B
                                 WHERE B.COD_CIA = A.COD_CIA
                                   AND B.COD_AGT = A.COD_AGT
                                   AND B.COD_TRATAMIENTO = A.COD_TRATAMIENTO
                                   AND B.MCA_INH = A.MCA_INH
                                   AND B.COD_CUADRO_COM NOT IN (0, 1, 10)
                                   AND ROWNUM < 2);
    */
  
    --NALILLO 30.03.2016
    CURSOR C_TIP_COD_AGT(l_cod_agt varchar2) IS
      SELECT TIP_AGT
        FROM A1001332@OVPRO_PRD a
       WHERE a.cod_agt = l_cod_agt
         and a.cod_calidad = 1
         and a.mca_inh = 'N'
         and a.fec_validez = (select max(fec_validez)
                                from a1001332@ovpro_prd
                               where cod_agt = a.cod_agt);
    --NALILLO 30.03.2016
    CURSOR COMISION(l_cod_agt varchar2) IS
      SELECT A.COD_CUADRO_COM
        FROM A1001342@OVPRO_PRD A
       WHERE A.COD_CIA = 1
         AND A.COD_AGT = l_cod_agt
         AND A.COD_TRATAMIENTO = 'A'
         AND A.MCA_INH = 'N'
         AND A.COD_CUADRO_COM NOT IN (1, 10, 37)
         AND A.FEC_VALIDEZ = (SELECT MAX(B.FEC_VALIDEZ)
                                FROM A1001342@OVPRO_PRD B
                               WHERE B.COD_CIA = A.COD_CIA
                                 AND B.COD_AGT = A.COD_AGT
                                 AND B.COD_TRATAMIENTO = A.COD_TRATAMIENTO
                                 AND B.MCA_INH = A.MCA_INH
                                 AND ROWNUM < 2)
         AND EXISTS (SELECT 1
                from a1001750@ovpro_prd p
               where p.cod_cia = 1
                 and p.cod_ramo = 809
                 AND p.cod_cuadro_com = A.COD_CUADRO_COM)
         AND EXISTS (SELECT 1
                FROM A2109015_MCL@ovpro_prd B
               WHERE B.cod_cia = 1
                 AND B.cod_ramo IN (809)
                 AND B.COD_CUADRO_COM = A.COD_CUADRO_COM
                 AND B.cod_modalidad = 8915
                 AND B.cod_agt IN (l_cod_agt, 99999)
                 AND B.mca_mel = 'X'
                 AND B.mca_inh = 'N');
    -----            
  
    CURSOR COBERTURAS(V_COD_RAMO VARCHAR2, V_COD_MODALIDAD VARCHAR2) IS
      SELECT A.COD_COB, A.MCA_OBLIGATORIO
        FROM A1002090@OVPRO_PRD A, G2990004@OVPRO_PRD B
       WHERE A.COD_RAMO = V_COD_RAMO
         AND A.COD_MODALIDAD = V_COD_MODALIDAD
         AND B.COD_CIA = A.COD_CIA
         AND B.COD_MODALIDAD = A.COD_MODALIDAD
       ORDER BY A.COD_RAMO, A.COD_MODALIDAD;
  
    L_COD_CUADRO_COM A1001342.COD_CUADRO_COM %TYPE;
  
    CURSOR C_DATOS_COT_CAB IS
      SELECT *
        FROM MEL_CAB_COTIZACION@OVPRO_PRD
       WHERE NUM_COTIZACION = P_NUM_COTIZACION;
  
    R_DATOS_COT_CAB C_DATOS_COT_CAB%ROWTYPE;
  
    CURSOR C_DATOS_COT_VEH IS
      SELECT num_cotizacion,
             num_matricula,
             cod_modalidad,
             cod_docum_aseg,
             cod_docum_ben,
             imp_prima_neta,
             imp_prima_bruta,
             fec_actu,
             deducible,
             cod_ramo,
             monto_rc,
             monto_dm,
             monto_lc,
             monto_comp,
             asistencia,
             prima,
             anos_sin_sini,
             contacto_inspecc,
             valor_referencial,
             cod_uso_vehi,
             factura_48,
             mca_mod_prima,
             estado,
             id,
             mca_inspeccion,
             cod_comuna,
             sel_emitir,
             iva,
             descuento,
             recargo,
             cod_docum_suplanta,
             edad_conductor,
             cod_cuadro_com,
             mca_mel,
             --cant_siniestros,
             --monto_siniestros,
             monto_cuota,
             mca_pagado,
             mca_hijos,
             mca_franquicia,
             mca_danospre,
             fec_efec_spto,
             fec_vcto_spto
        FROM MEL_VEH_COTIZACION@OVPRO_PRD
       WHERE NUM_COTIZACION = P_NUM_COTIZACION
         AND SEL_EMITIR = 'S';
  
    R_DATOS_COT_VEH C_DATOS_COT_VEH%ROWTYPE;
  
    CURSOR C_DATOS_VEH(L_ID VARCHAR2) IS
      SELECT * FROM OV_VEHICULO WHERE ID = L_ID;
  
    R_DATOS_VEH C_DATOS_VEH%ROWTYPE;
  
    CURSOR C_DATOS_NOM_TERCERO_TRN(PC_COD_DOCUM A1001399.COD_DOCUM%TYPE) IS
      SELECT *
        FROM A1001399@OVPRO_PRD
       WHERE COD_CIA = 1
         AND (TIP_DOCUM = 'RUT' OR TIP_DOCUM = 'DIR')
         AND COD_DOCUM = PC_COD_DOCUM;
  
    R_DATOS_NOM_TERCERO_TRN C_DATOS_NOM_TERCERO_TRN%ROWTYPE;
  
    CURSOR C_DATOS_TERCERO_TRN(PC_COD_DOCUM A1001331.COD_DOCUM%TYPE) IS
      SELECT *
        FROM A1001331@OVPRO_PRD
       WHERE COD_CIA = 1
         AND (TIP_DOCUM = 'RUT' OR TIP_DOCUM = 'DIR')
         AND COD_DOCUM = PC_COD_DOCUM;
  
    R_DATOS_TERCERO_TRN C_DATOS_TERCERO_TRN%ROWTYPE;
  
    CURSOR C_LOCALIDAD(L_COD_PROV VARCHAR2, L_COD_LOCALIDAD VARCHAR2) IS
      SELECT RTRIM(NOM_LOCALIDAD) NOM_LOCALIDAD
        FROM A1000102@OVPRO_PRD
       WHERE COD_PAIS = 'CHI'
         AND COD_PROV = L_COD_PROV
         AND COD_LOCALIDAD = L_COD_LOCALIDAD
       ORDER BY NOM_LOCALIDAD;
  
    CURSOR C_NOM_OFICINA_ENTIDAD IS
      SELECT COD_OFICINA
        FROM A5020910@OVPRO_PRD
       WHERE COD_ENTIDAD = P_CODBANCO;
  
    R_NOM_OFICINA_ENTIDAD C_NOM_OFICINA_ENTIDAD%ROWTYPE;
  
    --
    CURSOR c_cod_modalidad(pc_cod_modalidad VARCHAR2,
                           pc_cod_docum_mae VARCHAR2) IS
    --
      SELECT t.cod_plan_real
        FROM mel_planes_veh_ficticios t
       WHERE t.cod_plan = pc_cod_modalidad
         AND t.cod_docum_mae = pc_cod_docum_mae;
    --
    CURSOR c_cod_cuadro_com(pc_cod_modalidad VARCHAR2,
                            pc_cod_docum_mae VARCHAR2) IS
    --
      SELECT t.cod_cuadro_com
        FROM mel_planes_veh_ficticios t
       WHERE t.cod_plan_real = pc_cod_modalidad
         AND t.cod_docum_mae = pc_cod_docum_mae;
    --
    l_existe        BOOLEAN;
    l_cod_modalidad VARCHAR2(10);
    --
  
    CURSOR C_VALIDA_OPCION(l_conv varchar2) IS
      SELECT A.* FROM MEL_VEH_ADMIN A WHERE A.COD_CONV = l_conv;
  
    R_VALIDA_OPCION C_VALIDA_OPCION%ROWTYPE;
  
    VALOR VARCHAR2(35);
  
    NUM_FOLIO              NUMBER(10);
    L_TIP_GESTOR           VARCHAR2(5);
    L_COD_GESTOR           VARCHAR2(255);
    V_COD_RAMO             NUMBER;
    DIA_PAGO               NUMBER;
    L_MONTO_RC_EXCESO      NUMBER;
    L_MONTO_RC_EXCESO_CONV NUMBER;
    L_MONTO_RC_EXCESO2     NUMBER;
    L_RANGO_EDAD_CONDUCTOR VARCHAR2(10);
  
    L_NUM_FACTURA          VARCHAR2(50);
    L_FEC_FACTURA          VARCHAR2(30);
    L_COD_DOCUM_AUTOMOTORA VARCHAR2(50);
    L_NOM_AUTOMOTORA       VARCHAR2(50);
    L_COD_CUADRO_COM_CUPON VARCHAR2(10);
  
    L_NUM_POLIZA_GRUPO      VARCHAR2(20);
    L_NUM_CONTRATO          VARCHAR2(20);
    L_COD_CUADRO_COM_DIRECT A1001342.COD_CUADRO_COM %TYPE;
    L_COD_NIVEL3            A2000030.COD_NIVEL3 %TYPE;
  
    l_error_vigencia EXCEPTION;
  
    /*****/
  
    L_COD_AGT       NUMBER;
    L_COD_NIVEL1    NUMBER;
    L_COD_NIVEL2    NUMBER;
    L_COD_EJECUTIVO NUMBER;
  
    L_COD_FRACC_PAGO  NUMBER;
    L_FEC_EFEC_POLIZA DATE;
    L_FEC_VCTO_POLIZA DATE;
    L_FEC_EFEC_SPTO   DATE;
    L_FEC_VCTO_SPTO   DATE;
  
    l_tip_agt varchar2(2);
    /****/
  
  BEGIN
  
    IF round(to_date(P_FEC_VIG_INI, 'dd/MM/yyyy') - (trunc(sysdate - 4))) < 0 THEN
    
      RAISE l_error_vigencia;
    
    END IF;
  
    TRN_K_GLOBAL.BORRA_TODAS@OVPRO_PRD;
  
    TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('COD_CIA', 1);
  
    --NUM_FOLIO := EM_F_CORRELATIVO_FOLIO_MCL@OVPRO_PRD;
    NUM_FOLIO := '0';
  
    UPDATE MEL_CAB_COTIZACION@OVPRO_PRD
       SET COD_DOCUM_PROP = P_COD_DOCUM_TOMAD,
           COD_DOCUM_ASEG = P_COD_DOCUM_ASEG
     WHERE NUM_COTIZACION = P_NUM_COTIZACION;
    COMMIT;
  
    OPEN C_DATOS_COT_CAB;
    FETCH C_DATOS_COT_CAB
      INTO R_DATOS_COT_CAB;
    CLOSE C_DATOS_COT_CAB;
  
    OPEN C_DATOS_COT_VEH;
    FETCH C_DATOS_COT_VEH
      INTO R_DATOS_COT_VEH;
    CLOSE C_DATOS_COT_VEH;
  
    OPEN C_DATOS_VEH(R_DATOS_COT_VEH.ID);
    FETCH C_DATOS_VEH
      INTO R_DATOS_VEH;
    CLOSE C_DATOS_VEH;
  
    OPEN C_VALIDA_OPCION(R_DATOS_COT_CAB.COD_DOCUM_PAG);
    FETCH C_VALIDA_OPCION
      INTO R_VALIDA_OPCION;
    CLOSE C_VALIDA_OPCION;
  
    P_COD_RAMO := R_DATOS_COT_CAB.COD_RAMO;
  
    OPEN COD_AGT(P_COD_DOCUM_MAE);
    FETCH COD_AGT
      INTO C_COD_AGT;
    CLOSE COD_AGT;
  
    L_COD_AGT       := C_COD_AGT.COD_AGT;
    L_COD_EJECUTIVO := C_COD_AGT.COD_EJECUTIVO;
  
    L_COD_FRACC_PAGO := P_COD_PLAN_PAGO;
  
    IF R_DATOS_COT_VEH.COD_DOCUM_BEN IN ('RIPLEYBI', 'ESCOLARBIANUAL') THEN
      L_COD_PLAN := SUBSTR(R_DATOS_COT_VEH.COD_MODALIDAD, 1, 4);
    ELSE
      --     
      l_cod_plan := R_DATOS_COT_VEH.COD_MODALIDAD;
      --
      OPEN c_cod_modalidad(l_cod_plan, r_datos_cot_cab.cod_docum_mae);
      FETCH c_cod_modalidad
        INTO l_cod_modalidad;
      l_existe := c_cod_modalidad%FOUND;
      CLOSE c_cod_modalidad;
      --
      IF l_existe THEN
        --
        l_cod_plan := l_cod_modalidad;
        --
      END IF;
      --
    END IF;
  
    mel_p_num_pol_grupo(1,
                        801,
                        R_DATOS_COT_CAB.COD_DOCUM_MAE,
                        R_DATOS_COT_VEH.COD_DOCUM_BEN,
                        R_DATOS_COT_VEH.COD_MODALIDAD,
                        L_NUM_POLIZA_GRUPO,
                        L_NUM_CONTRATO);
  
    --NALILLO 30.03.2016 :SOLUCIONAR COMISION AUTOANTIGUO
    OPEN C_TIP_COD_AGT(c_cod_agt.COD_AGT);
    FETCH C_TIP_COD_AGT
      INTO l_tip_agt;
    CLOSE C_TIP_COD_AGT;
  
    IF (l_tip_agt = 6 AND R_DATOS_COT_VEH.COD_DOCUM_BEN = 'AUTOANTIGUO') THEN
      OPEN COMISION(c_cod_agt.COD_AGT);
      FETCH COMISION
        INTO l_cod_cuadro_com;
      CLOSE COMISION;
    
    ELSE
    
      p_direct_sucursal(1,
                        801,
                        c_cod_agt.cod_agt,
                        R_DATOS_COT_VEH.COD_DOCUM_BEN,
                        l_cod_nivel3,
                        L_COD_CUADRO_COM_DIRECT);
    
      --  mel_p_cod_cuadro_com(P_NUM_COTIZACION, L_COD_CUADRO_COM_CUPON);
    
      /*    IF L_COD_CUADRO_COM_CUPON IS NOT NULL THEN
      
        L_COD_CUADRO_COM := L_COD_CUADRO_COM_CUPON;
      
      ELSE*/
    
      IF L_COD_CUADRO_COM_DIRECT IS NOT NULL THEN
      
        L_COD_CUADRO_COM := L_COD_CUADRO_COM_DIRECT;
      
      ELSE
      
        IF R_DATOS_COT_VEH.COD_CUADRO_COM IS NOT NULL THEN
        
          L_COD_CUADRO_COM := R_DATOS_COT_VEH.COD_CUADRO_COM;
        
        ELSE
        
          IF P_SUPLANTA = 'N' THEN
          
            P_GET_CUADRO_COM_AGT(1,
                                 C_COD_AGT.COD_AGT,
                                 R_DATOS_COT_CAB.COD_RAMO,
                                 L_COD_PLAN,
                                 R_DATOS_COT_VEH.COD_DOCUM_SUPLANTA,
                                 L_COD_CUADRO_COM);
          
            IF R_DATOS_COT_VEH.COD_DOCUM_BEN = 'WEBDIRECTO' THEN
            
              p_direct_sucursal(1,
                                801,
                                '80446',
                                'WEBDIRECTOC',
                                l_cod_nivel3,
                                L_COD_CUADRO_COM_DIRECT);
            
            END IF;
          
          ELSE
          
            L_COD_CUADRO_COM := 13;
          
          END IF;
        
          /* IF P_COD_DOCUM_MAE = '76213750K' THEN
          
            L_COD_CUADRO_COM := 49;
          
          END IF;
          
          IF P_COD_DOCUM_MAE = '774724206' THEN
          
            L_COD_CUADRO_COM := 97;
          
          END IF;
          
          IF P_COD_DOCUM_MAE = '777215604' THEN
          
            L_COD_CUADRO_COM := 91;
          
          END IF;*/
        
        END IF;
      
      END IF;
    
    END IF;
  
    --  END IF;
  
    OPEN C_NOM_OFICINA_ENTIDAD;
    FETCH C_NOM_OFICINA_ENTIDAD
      INTO R_NOM_OFICINA_ENTIDAD;
    CLOSE C_NOM_OFICINA_ENTIDAD;
  
    /*******************************/
    CASE P_FORMA_PAGO
      WHEN 'GD' THEN
        L_TIP_GESTOR := 'GD';
        L_COD_GESTOR := C_COD_AGT.COD_NIVEL3;
        --L_COD_GESTOR := '6008';
      
        MEL_P_INSERTA_MEL_PAGO(1,
                               P_NUM_COTIZACION,
                               L_TIP_GESTOR,
                               P_COD_PLAN_PAGO, -- GAPEREZ  03/10/2018
                               '',
                               '',
                               '',
                               '',
                               '',
                               '',
                               '',
                               '',
                               L_COD_GESTOR);
      
      WHEN 'TA' THEN
        L_TIP_GESTOR := 'TA';
      
        L_COD_GESTOR := '00010320'; /** COMODIN **/
      
        MEL_P_INSERTA_MEL_PAGO(1,
                               P_NUM_COTIZACION,
                               L_TIP_GESTOR,
                               P_COD_PLAN_PAGO, -- GAPEREZ  03/10/2018
                               p_dia_pago,
                               P_CODTARJETA,
                               P_NROTARJETA,
                               P_MESTARJETA,
                               P_ANIOTARJETA,
                               P_CODBANCO,
                               '',
                               '',
                               L_COD_GESTOR);
      
        TRN_K_GLOBAL.BORRA_TODAS@OVPRO_PRD;
        TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('COD_CIA', 1);
      
        TRON2000.MEL_P_GENERA_MANDATO@OVPRO_PRD(P_FORMA_PAGO, /*   P_TIP_MANDATO */
                                                '', /*   P_COD_ENTIDAD */
                                                P_CODTARJETA, /*   P_TIP_TARJETA */
                                                P_CODBANCO, /*   P_COD_TARJETA */
                                                P_NROTARJETA, /*   P_NUM_CTA_TJT */
                                                TO_DATE('01' ||
                                                        P_MESTARJETA ||
                                                        P_ANIOTARJETA,
                                                        'DDMMYYYY'), /*   P_FEC_VIG_FIN */
                                                P_DIA_PAGO,
                                                P_COD_DOCUM_ASEG, /*   P_COD_DOCUM */
                                                P_COD_DOCUM_TOMAD, /*   P_COD_DOCUM_PAGO */
                                                '');
        COMMIT;
      WHEN 'DB' THEN
        L_TIP_GESTOR := 'DB';
      
        L_COD_GESTOR := '00010320'; /** COMODIN **/
      
        MEL_P_INSERTA_MEL_PAGO(1,
                               P_NUM_COTIZACION,
                               L_TIP_GESTOR,
                               P_COD_PLAN_PAGO, -- GAPEREZ  03/10/2018
                               p_dia_pago,
                               '',
                               '',
                               '',
                               '',
                               P_CODBANCO,
                               P_NROTARJETA,
                               1,
                               L_COD_GESTOR);
      
        TRN_K_GLOBAL.BORRA_TODAS@OVPRO_PRD;
        TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('COD_CIA', 1);
      
        TRON2000.MEL_P_GENERA_MANDATO@OVPRO_PRD(P_FORMA_PAGO, /*   P_TIP_MANDATO */
                                                P_CODBANCO, /*   P_COD_ENTIDAD */
                                                '1', /*   P_TIP_TARJETA */
                                                '', /*   P_COD_TARJETA */
                                                P_NROTARJETA, /*   P_NUM_CTA_TJT */
                                                '', /*   P_FEC_VIG_FIN */
                                                P_DIA_PAGO,
                                                P_COD_DOCUM_ASEG, /*   P_COD_DOCUM */
                                                P_COD_DOCUM_TOMAD, /*   P_COD_DOCUM_PAGO */
                                                '');
        COMMIT;
      
    END CASE;
  
    /* VALIDA EL DIA DE PAGO INGRESADO, EN CASO DE NO EXISTIR, LO INSERTA */
  
    DIA_PAGO := P_DIA_PAGO;
  
    MEL_K_COBRANZA.P_VALIDA_DIA_PAGO(P_COD_DOCUM_TOMAD,
                                     C_COD_AGT.COD_NIVEL3,
                                     DIA_PAGO);
  
    /**************************************************************************/
  
    P_TRAE_DATOS_FACTURA(P_NUM_COTIZACION,
                         L_NUM_FACTURA,
                         L_FEC_FACTURA,
                         L_COD_DOCUM_AUTOMOTORA,
                         L_NOM_AUTOMOTORA);
  
    /***************************************************************************/
    --
    IF l_existe THEN
      --
      OPEN c_cod_cuadro_com(l_cod_plan, r_datos_cot_cab.cod_docum_mae);
      FETCH c_cod_cuadro_com
        INTO l_cod_cuadro_com;
      CLOSE c_cod_cuadro_com;
      --
    END IF;
    --
  
    /******/
  
    p_trae_datos_fijos_emision(P_COD_DOCUM_MAE,
                               R_DATOS_COT_VEH.COD_DOCUM_BEN,
                               R_DATOS_COT_CAB.COD_RAMO,
                               L_COD_AGT,
                               L_COD_CUADRO_COM,
                               L_COD_NIVEL3,
                               L_COD_EJECUTIVO,
                               L_NUM_POLIZA_GRUPO,
                               L_NUM_CONTRATO,
                               L_COD_FRACC_PAGO,
                               L_FEC_EFEC_POLIZA,
                               L_FEC_VCTO_POLIZA,
                               L_FEC_EFEC_SPTO,
                               L_FEC_VCTO_SPTO);
  
    /*****/
  
    P_MEL_XML_POL_P2000030 := P_MEL_XML_POL_P2000030 ||
                              '<TABLE NAME="P2000030">';
    P_MEL_XML_POL_P2000030 := P_MEL_XML_POL_P2000030 || '<ROWSET>';
    P_MEL_XML_POL_P2000030 := P_MEL_XML_POL_P2000030 || '<ROW NUM="1">';
  
    FOR R_GET_PARAM_XML IN C_GET_PARAM_XML('P2000030') LOOP
    
      IF (R_GET_PARAM_XML.MCA_FIJO = 'N') THEN
      
        CASE R_GET_PARAM_XML.NOM_CAMPO_ABRE
        
          WHEN '<COD_RAMO>' THEN
          
            P_MEL_XML_POL_P2000030 := P_MEL_XML_POL_P2000030 ||
                                      R_GET_PARAM_XML.NOM_CAMPO_ABRE ||
                                      R_DATOS_COT_CAB.COD_RAMO ||
                                      R_GET_PARAM_XML.NOM_CAMPO_CIERRA || '';
          
          WHEN '<COD_CUADRO_COM>' THEN
          
            P_MEL_XML_POL_P2000030 := P_MEL_XML_POL_P2000030 ||
                                      R_GET_PARAM_XML.NOM_CAMPO_ABRE ||
                                      L_COD_CUADRO_COM ||
                                      R_GET_PARAM_XML.NOM_CAMPO_CIERRA || '';
          
          WHEN '<COD_AGT>' THEN
          
            P_MEL_XML_POL_P2000030 := P_MEL_XML_POL_P2000030 ||
                                      R_GET_PARAM_XML.NOM_CAMPO_ABRE ||
                                      L_COD_AGT ||
                                      R_GET_PARAM_XML.NOM_CAMPO_CIERRA || '';
          
          WHEN '<PCT_AGT>' THEN
          
            P_MEL_XML_POL_P2000030 := P_MEL_XML_POL_P2000030 ||
                                      R_GET_PARAM_XML.NOM_CAMPO_ABRE ||
                                      '100' ||
                                      R_GET_PARAM_XML.NOM_CAMPO_CIERRA || '';
          
          WHEN '<TIP_GESTOR>' THEN
          
            P_MEL_XML_POL_P2000030 := P_MEL_XML_POL_P2000030 ||
                                      R_GET_PARAM_XML.NOM_CAMPO_ABRE ||
                                      L_TIP_GESTOR ||
                                      R_GET_PARAM_XML.NOM_CAMPO_CIERRA || '';
          
          WHEN '<COD_GESTOR>' THEN
          
            P_MEL_XML_POL_P2000030 := P_MEL_XML_POL_P2000030 ||
                                      R_GET_PARAM_XML.NOM_CAMPO_ABRE ||
                                      L_COD_GESTOR ||
                                      R_GET_PARAM_XML.NOM_CAMPO_CIERRA || '';
          
          WHEN '<COD_DOCUM>' THEN
          
            P_MEL_XML_POL_P2000030 := P_MEL_XML_POL_P2000030 ||
                                      R_GET_PARAM_XML.NOM_CAMPO_ABRE ||
                                      R_DATOS_COT_CAB.COD_DOCUM_PROP ||
                                      R_GET_PARAM_XML.NOM_CAMPO_CIERRA || '';
          
          WHEN '<COD_EJECUTIVO>' THEN
          
            P_MEL_XML_POL_P2000030 := P_MEL_XML_POL_P2000030 ||
                                      R_GET_PARAM_XML.NOM_CAMPO_ABRE ||
                                      L_COD_EJECUTIVO ||
                                      R_GET_PARAM_XML.NOM_CAMPO_CIERRA || '';
          
          WHEN '<FEC_EFEC_POLIZA>' THEN
          
            IF L_FEC_EFEC_POLIZA IS NOT NULL THEN
            
              P_MEL_XML_POL_P2000030 := P_MEL_XML_POL_P2000030 ||
                                        R_GET_PARAM_XML.NOM_CAMPO_ABRE ||
                                        TO_CHAR(L_FEC_EFEC_POLIZA,
                                                'DD/MM/YYYY') ||
                                        R_GET_PARAM_XML.NOM_CAMPO_CIERRA || '';
            
            ELSE
            
              IF R_DATOS_COT_VEH.FEC_EFEC_SPTO IS NOT NULL AND
                 R_DATOS_COT_VEH.FEC_VCTO_SPTO IS NOT NULL THEN
                P_MEL_XML_POL_P2000030 := P_MEL_XML_POL_P2000030 ||
                                          R_GET_PARAM_XML.NOM_CAMPO_ABRE ||
                                          TO_CHAR(R_DATOS_COT_VEH.FEC_EFEC_SPTO,
                                                  'DD/MM/YYYY') ||
                                          R_GET_PARAM_XML.NOM_CAMPO_CIERRA || '';
              ELSE
                P_MEL_XML_POL_P2000030 := P_MEL_XML_POL_P2000030 ||
                                          R_GET_PARAM_XML.NOM_CAMPO_ABRE ||
                                          P_FEC_VIG_INI ||
                                          R_GET_PARAM_XML.NOM_CAMPO_CIERRA || '';
              END IF;
            
            END IF;
          
          WHEN '<FEC_VCTO_POLIZA>' THEN
          
            IF L_FEC_VCTO_POLIZA IS NOT NULL THEN
            
              P_MEL_XML_POL_P2000030 := P_MEL_XML_POL_P2000030 ||
                                        R_GET_PARAM_XML.NOM_CAMPO_ABRE ||
                                        TO_CHAR(L_FEC_VCTO_POLIZA,
                                                'DD/MM/YYYY') ||
                                        R_GET_PARAM_XML.NOM_CAMPO_CIERRA || '';
            
            ELSE
            
              IF R_DATOS_COT_VEH.COD_DOCUM_BEN IN
                 ('RIPLEYBI', 'ESCOLARBIANUAL') AND
                 SUBSTR(R_DATOS_COT_VEH.COD_MODALIDAD, 5, 1) = '2' THEN
              
                P_MEL_XML_POL_P2000030 := P_MEL_XML_POL_P2000030 ||
                                          R_GET_PARAM_XML.NOM_CAMPO_ABRE ||
                                          TO_CHAR(TO_DATE(P_FEC_VIG_INI,
                                                          'DD/MM/YYYY') + 730,
                                                  'DD/MM/YYYY') ||
                                          R_GET_PARAM_XML.NOM_CAMPO_CIERRA || '';
              ELSE
              
                IF R_VALIDA_OPCION.OPC_MASVIGENCIA = 'S' THEN
                
                  IF R_DATOS_COT_VEH.FEC_EFEC_SPTO IS NOT NULL AND
                     R_DATOS_COT_VEH.FEC_VCTO_SPTO IS NOT NULL THEN
                    P_MEL_XML_POL_P2000030 := P_MEL_XML_POL_P2000030 ||
                                              R_GET_PARAM_XML.NOM_CAMPO_ABRE ||
                                              TO_CHAR(R_DATOS_COT_VEH.FEC_VCTO_SPTO,
                                                      'DD/MM/YYYY') ||
                                              R_GET_PARAM_XML.NOM_CAMPO_CIERRA || '';
                  ELSE
                    P_MEL_XML_POL_P2000030 := P_MEL_XML_POL_P2000030 ||
                                              R_GET_PARAM_XML.NOM_CAMPO_ABRE ||
                                              TO_CHAR(ADD_MONTHS(TO_DATE(P_FEC_VIG_INI,
                                                                         'DD/MM/YYYY'),
                                                                 R_VALIDA_OPCION.OPC_MESESVIGENCIA),
                                                      'DD/MM/YYYY') ||
                                              R_GET_PARAM_XML.NOM_CAMPO_CIERRA || '';
                  END IF;
                ELSE
                  IF R_DATOS_COT_VEH.FEC_EFEC_SPTO IS NOT NULL AND
                     R_DATOS_COT_VEH.FEC_VCTO_SPTO IS NOT NULL THEN
                    P_MEL_XML_POL_P2000030 := P_MEL_XML_POL_P2000030 ||
                                              R_GET_PARAM_XML.NOM_CAMPO_ABRE ||
                                              TO_CHAR(R_DATOS_COT_VEH.FEC_VCTO_SPTO,
                                                      'DD/MM/YYYY') ||
                                              R_GET_PARAM_XML.NOM_CAMPO_CIERRA || '';
                  ELSE
                    P_MEL_XML_POL_P2000030 := P_MEL_XML_POL_P2000030 ||
                                              R_GET_PARAM_XML.NOM_CAMPO_ABRE ||
                                              TO_CHAR(ADD_MONTHS(TO_DATE(P_FEC_VIG_INI,
                                                                         'DD/MM/YYYY'),
                                                                 12),
                                                      'DD/MM/YYYY') ||
                                              R_GET_PARAM_XML.NOM_CAMPO_CIERRA || '';
                  END IF;
                
                END IF;
              END IF;
            
            END IF;
          
          WHEN '<FEC_EFEC_SPTO>' THEN
          
            IF L_FEC_EFEC_SPTO IS NOT NULL THEN
            
              P_MEL_XML_POL_P2000030 := P_MEL_XML_POL_P2000030 ||
                                        R_GET_PARAM_XML.NOM_CAMPO_ABRE ||
                                        TO_CHAR(L_FEC_EFEC_SPTO,
                                                'DD/MM/YYYY') ||
                                        R_GET_PARAM_XML.NOM_CAMPO_CIERRA || '';
            
            ELSE
            
              IF R_DATOS_COT_VEH.FEC_EFEC_SPTO IS NOT NULL AND
                 R_DATOS_COT_VEH.FEC_VCTO_SPTO IS NOT NULL THEN
                P_MEL_XML_POL_P2000030 := P_MEL_XML_POL_P2000030 ||
                                          R_GET_PARAM_XML.NOM_CAMPO_ABRE ||
                                          TO_CHAR(R_DATOS_COT_VEH.FEC_EFEC_SPTO,
                                                  'DD/MM/YYYY') ||
                                          R_GET_PARAM_XML.NOM_CAMPO_CIERRA || '';
              ELSE
                P_MEL_XML_POL_P2000030 := P_MEL_XML_POL_P2000030 ||
                                          R_GET_PARAM_XML.NOM_CAMPO_ABRE ||
                                          P_FEC_VIG_INI ||
                                          R_GET_PARAM_XML.NOM_CAMPO_CIERRA || '';
              END IF;
            
            END IF;
          
          WHEN '<FEC_VCTO_SPTO>' THEN
          
            IF L_FEC_VCTO_SPTO IS NOT NULL THEN
            
              P_MEL_XML_POL_P2000030 := P_MEL_XML_POL_P2000030 ||
                                        R_GET_PARAM_XML.NOM_CAMPO_ABRE ||
                                        TO_CHAR(L_FEC_VCTO_SPTO,
                                                'DD/MM/YYYY') ||
                                        R_GET_PARAM_XML.NOM_CAMPO_CIERRA || '';
            
            ELSE
            
              IF R_DATOS_COT_VEH.COD_DOCUM_BEN IN
                 ('RIPLEYBI', 'ESCOLARBIANUAL') AND
                 SUBSTR(R_DATOS_COT_VEH.COD_MODALIDAD, 5, 1) = '2' THEN
              
                P_MEL_XML_POL_P2000030 := P_MEL_XML_POL_P2000030 ||
                                          R_GET_PARAM_XML.NOM_CAMPO_ABRE ||
                                          TO_CHAR(TO_DATE(P_FEC_VIG_INI,
                                                          'DD/MM/YYYY') + 730,
                                                  'DD/MM/YYYY') ||
                                          R_GET_PARAM_XML.NOM_CAMPO_CIERRA || '';
              ELSE
              
                IF R_VALIDA_OPCION.OPC_MASVIGENCIA = 'S' THEN
                  IF R_DATOS_COT_VEH.FEC_EFEC_SPTO IS NOT NULL AND
                     R_DATOS_COT_VEH.FEC_VCTO_SPTO IS NOT NULL THEN
                    P_MEL_XML_POL_P2000030 := P_MEL_XML_POL_P2000030 ||
                                              R_GET_PARAM_XML.NOM_CAMPO_ABRE ||
                                              TO_CHAR(R_DATOS_COT_CAB.FEC_VIG_FIN,
                                                      'DD/MM/YYYY') ||
                                              R_GET_PARAM_XML.NOM_CAMPO_CIERRA || '';
                  ELSE
                    P_MEL_XML_POL_P2000030 := P_MEL_XML_POL_P2000030 ||
                                              R_GET_PARAM_XML.NOM_CAMPO_ABRE ||
                                              TO_CHAR(ADD_MONTHS(TO_DATE(P_FEC_VIG_INI,
                                                                         'DD/MM/YYYY'),
                                                                 R_VALIDA_OPCION.OPC_MESESVIGENCIA),
                                                      'DD/MM/YYYY') ||
                                              R_GET_PARAM_XML.NOM_CAMPO_CIERRA || '';
                  END IF;
                
                ELSE
                  IF R_DATOS_COT_VEH.FEC_EFEC_SPTO IS NOT NULL AND
                     R_DATOS_COT_VEH.FEC_VCTO_SPTO IS NOT NULL THEN
                    P_MEL_XML_POL_P2000030 := P_MEL_XML_POL_P2000030 ||
                                              R_GET_PARAM_XML.NOM_CAMPO_ABRE ||
                                              TO_CHAR(R_DATOS_COT_VEH.FEC_VCTO_SPTO,
                                                      'DD/MM/YYYY') ||
                                              R_GET_PARAM_XML.NOM_CAMPO_CIERRA || '';
                  ELSE
                  
                    P_MEL_XML_POL_P2000030 := P_MEL_XML_POL_P2000030 ||
                                              R_GET_PARAM_XML.NOM_CAMPO_ABRE ||
                                              TO_CHAR(ADD_MONTHS(TO_DATE(P_FEC_VIG_INI,
                                                                         'DD/MM/YYYY'),
                                                                 12),
                                                      'DD/MM/YYYY') ||
                                              R_GET_PARAM_XML.NOM_CAMPO_CIERRA || '';
                  END IF;
                END IF;
              
              END IF;
            
            END IF;
          
          WHEN '<FEC_VALIDEZ>' THEN
          
            P_MEL_XML_POL_P2000030 := P_MEL_XML_POL_P2000030 ||
                                      R_GET_PARAM_XML.NOM_CAMPO_ABRE ||
                                      TO_CHAR(SYSDATE, 'DD/MM/YYYY') ||
                                      R_GET_PARAM_XML.NOM_CAMPO_CIERRA || '';
          
          WHEN '<FEC_EMISION>' THEN
          
            P_MEL_XML_POL_P2000030 := P_MEL_XML_POL_P2000030 ||
                                      R_GET_PARAM_XML.NOM_CAMPO_ABRE ||
                                      TO_CHAR(SYSDATE, 'DD/MM/YYYY') ||
                                      R_GET_PARAM_XML.NOM_CAMPO_CIERRA || '';
          
          WHEN '<FEC_EMISION_SPTO>' THEN
          
            P_MEL_XML_POL_P2000030 := P_MEL_XML_POL_P2000030 ||
                                      R_GET_PARAM_XML.NOM_CAMPO_ABRE ||
                                      TO_CHAR(SYSDATE, 'DD/MM/YYYY') ||
                                      R_GET_PARAM_XML.NOM_CAMPO_CIERRA || '';
          
          WHEN '<FEC_AUTORIZACION>' THEN
          
            P_MEL_XML_POL_P2000030 := P_MEL_XML_POL_P2000030 ||
                                      R_GET_PARAM_XML.NOM_CAMPO_ABRE ||
                                      TO_CHAR(SYSDATE, 'DD/MM/YYYY') ||
                                      R_GET_PARAM_XML.NOM_CAMPO_CIERRA || '';
          
          WHEN '<FEC_ACTU>' THEN
          
            P_MEL_XML_POL_P2000030 := P_MEL_XML_POL_P2000030 ||
                                      R_GET_PARAM_XML.NOM_CAMPO_ABRE ||
                                      TO_CHAR(SYSDATE, 'DD/MM/YYYY') ||
                                      R_GET_PARAM_XML.NOM_CAMPO_CIERRA || '';
          
          WHEN '<COD_FRACC_PAGO>' THEN
          
            P_MEL_XML_POL_P2000030 := P_MEL_XML_POL_P2000030 ||
                                      R_GET_PARAM_XML.NOM_CAMPO_ABRE ||
                                      L_COD_FRACC_PAGO ||
                                      R_GET_PARAM_XML.NOM_CAMPO_CIERRA || '';
          
          WHEN '<IMP_CUOTA_INICIAL>' THEN
          
            P_MEL_XML_POL_P2000030 := P_MEL_XML_POL_P2000030 ||
                                      R_GET_PARAM_XML.NOM_CAMPO_ABRE ||
                                      DIA_PAGO ||
                                      R_GET_PARAM_XML.NOM_CAMPO_CIERRA || '';
          
          WHEN '<COD_ORG>' THEN
          
            IF C_COD_AGT.COD_AGT = 20508 THEN
            
              P_MEL_XML_POL_P2000030 := P_MEL_XML_POL_P2000030 ||
                                        R_GET_PARAM_XML.NOM_CAMPO_ABRE ||
                                        R_GET_PARAM_XML.VAL_CAMPO ||
                                        R_GET_PARAM_XML.NOM_CAMPO_CIERRA || '';
            
            END IF;
          
            IF C_COD_AGT.COD_AGT = 20607 THEN
            
              P_MEL_XML_POL_P2000030 := P_MEL_XML_POL_P2000030 ||
                                        R_GET_PARAM_XML.NOM_CAMPO_ABRE ||
                                        '20349' ||
                                        R_GET_PARAM_XML.NOM_CAMPO_CIERRA || '';
            
            END IF;
          
          WHEN '<COD_ASESOR>' THEN
          
            IF C_COD_AGT.COD_AGT = 20508 THEN
            
              P_MEL_XML_POL_P2000030 := P_MEL_XML_POL_P2000030 ||
                                        R_GET_PARAM_XML.NOM_CAMPO_ABRE ||
                                        R_GET_PARAM_XML.VAL_CAMPO ||
                                        R_GET_PARAM_XML.NOM_CAMPO_CIERRA || '';
            
            END IF;
          
            IF C_COD_AGT.COD_AGT = 20607 THEN
            
              P_MEL_XML_POL_P2000030 := P_MEL_XML_POL_P2000030 ||
                                        R_GET_PARAM_XML.NOM_CAMPO_ABRE ||
                                        '20349' ||
                                        R_GET_PARAM_XML.NOM_CAMPO_CIERRA || '';
            
            END IF;
          
          WHEN '<NUM_POLIZA_GRUPO>' THEN
          
            P_MEL_XML_POL_P2000030 := P_MEL_XML_POL_P2000030 ||
                                      R_GET_PARAM_XML.NOM_CAMPO_ABRE ||
                                      L_NUM_POLIZA_GRUPO ||
                                      R_GET_PARAM_XML.NOM_CAMPO_CIERRA || '';
          
          WHEN '<NUM_CONTRATO>' THEN
          
            P_MEL_XML_POL_P2000030 := P_MEL_XML_POL_P2000030 ||
                                      R_GET_PARAM_XML.NOM_CAMPO_ABRE ||
                                      L_NUM_CONTRATO ||
                                      R_GET_PARAM_XML.NOM_CAMPO_CIERRA || '';
          
          WHEN '<COD_NIVEL3>' THEN
          
            P_MEL_XML_POL_P2000030 := P_MEL_XML_POL_P2000030 ||
                                      R_GET_PARAM_XML.NOM_CAMPO_ABRE || '' ||
                                      L_COD_NIVEL3 ||
                                      R_GET_PARAM_XML.NOM_CAMPO_CIERRA || '';
        END CASE;
      
      ELSE
      
        P_MEL_XML_POL_P2000030 := P_MEL_XML_POL_P2000030 ||
                                  R_GET_PARAM_XML.NOM_CAMPO_ABRE ||
                                  R_GET_PARAM_XML.VAL_CAMPO ||
                                  R_GET_PARAM_XML.NOM_CAMPO_CIERRA || '';
      
      END IF;
    
    END LOOP;
  
    P_MEL_XML_POL_P2000030 := P_MEL_XML_POL_P2000030 || '</ROW>';
    P_MEL_XML_POL_P2000030 := P_MEL_XML_POL_P2000030 || '</ROWSET>';
    P_MEL_XML_POL_P2000030 := P_MEL_XML_POL_P2000030 || '</TABLE>';
  
    /************************************************************************************************************/
  
    P_MEL_XML_POL_P2000031 := P_MEL_XML_POL_P2000031 ||
                              '<TABLE NAME="P2000031">';
    P_MEL_XML_POL_P2000031 := P_MEL_XML_POL_P2000031 || '<ROWSET>';
    P_MEL_XML_POL_P2000031 := P_MEL_XML_POL_P2000031 || '<ROW NUM="1">';
  
    FOR R_GET_PARAM_XML IN C_GET_PARAM_XML('P2000031') LOOP
    
      IF (R_GET_PARAM_XML.MCA_FIJO = 'N') THEN
      
        CASE R_GET_PARAM_XML.NOM_CAMPO_ABRE
        
          WHEN '<COD_MODALIDAD>' THEN
          
            P_MEL_XML_POL_P2000031 := P_MEL_XML_POL_P2000031 ||
                                      R_GET_PARAM_XML.NOM_CAMPO_ABRE ||
                                      L_COD_PLAN ||
                                      R_GET_PARAM_XML.NOM_CAMPO_CIERRA || '';
          
          WHEN '<FEC_EFEC_RIESGO>' THEN
            IF R_DATOS_COT_VEH.FEC_EFEC_SPTO IS NULL AND
               R_DATOS_COT_VEH.FEC_VCTO_SPTO IS NULL THEN
              P_MEL_XML_POL_P2000031 := P_MEL_XML_POL_P2000031 ||
                                        R_GET_PARAM_XML.NOM_CAMPO_ABRE ||
                                        P_FEC_VIG_INI ||
                                        R_GET_PARAM_XML.NOM_CAMPO_CIERRA || '';
            ELSE
              P_MEL_XML_POL_P2000031 := P_MEL_XML_POL_P2000031 ||
                                        R_GET_PARAM_XML.NOM_CAMPO_ABRE ||
                                        TO_CHAR(R_DATOS_COT_VEH.FEC_EFEC_SPTO,
                                                'DD/MM/YYYY') ||
                                        R_GET_PARAM_XML.NOM_CAMPO_CIERRA || '';
            END IF;
          
          WHEN '<FEC_VCTO_RIESGO>' THEN
          
            IF R_DATOS_COT_VEH.COD_DOCUM_BEN IN
               ('RIPLEYBI', 'ESCOLARBIANUAL') AND
               SUBSTR(R_DATOS_COT_VEH.COD_MODALIDAD, 5, 1) = '2' THEN
            
              P_MEL_XML_POL_P2000031 := P_MEL_XML_POL_P2000031 ||
                                        R_GET_PARAM_XML.NOM_CAMPO_ABRE ||
                                        TO_CHAR(ADD_MONTHS(TO_DATE(P_FEC_VIG_INI,
                                                                   'DD/MM/YYYY'),
                                                           24),
                                                'DD/MM/YYYY') ||
                                        R_GET_PARAM_XML.NOM_CAMPO_CIERRA || '';
            ELSE
            
              IF R_VALIDA_OPCION.OPC_MASVIGENCIA = 'S' THEN
              
                IF R_DATOS_COT_VEH.FEC_EFEC_SPTO IS NULL AND
                   R_DATOS_COT_VEH.FEC_VCTO_SPTO IS NULL THEN
                  P_MEL_XML_POL_P2000031 := P_MEL_XML_POL_P2000031 ||
                                            R_GET_PARAM_XML.NOM_CAMPO_ABRE ||
                                            TO_CHAR(ADD_MONTHS(TO_DATE(P_FEC_VIG_INI,
                                                                       'DD/MM/YYYY'),
                                                               R_VALIDA_OPCION.OPC_MESESVIGENCIA),
                                                    'DD/MM/YYYY') ||
                                            R_GET_PARAM_XML.NOM_CAMPO_CIERRA || '';
                ELSE
                  P_MEL_XML_POL_P2000031 := P_MEL_XML_POL_P2000031 ||
                                            R_GET_PARAM_XML.NOM_CAMPO_ABRE ||
                                            TO_CHAR(R_DATOS_COT_VEH.FEC_VCTO_SPTO,
                                                    'DD/MM/YYYY') ||
                                            R_GET_PARAM_XML.NOM_CAMPO_CIERRA || '';
                END IF;
              
              ELSE
                IF R_DATOS_COT_VEH.FEC_EFEC_SPTO IS NULL AND
                   R_DATOS_COT_VEH.FEC_VCTO_SPTO IS NULL THEN
                  P_MEL_XML_POL_P2000031 := P_MEL_XML_POL_P2000031 ||
                                            R_GET_PARAM_XML.NOM_CAMPO_ABRE ||
                                            TO_CHAR(ADD_MONTHS(TO_DATE(P_FEC_VIG_INI,
                                                                       'DD/MM/YYYY'),
                                                               12),
                                                    'DD/MM/YYYY') ||
                                            R_GET_PARAM_XML.NOM_CAMPO_CIERRA || '';
                ELSE
                  P_MEL_XML_POL_P2000031 := P_MEL_XML_POL_P2000031 ||
                                            R_GET_PARAM_XML.NOM_CAMPO_ABRE ||
                                            TO_CHAR(R_DATOS_COT_VEH.FEC_VCTO_SPTO,
                                                    'DD/MM/YYYY') ||
                                            R_GET_PARAM_XML.NOM_CAMPO_CIERRA || '';
                
                END IF;
              
              END IF;
            
            END IF;
          
          WHEN '<NOM_RIESGO>' THEN
          
            P_MEL_XML_POL_P2000031 := P_MEL_XML_POL_P2000031 ||
                                      R_GET_PARAM_XML.NOM_CAMPO_ABRE || 'X' ||
                                      R_GET_PARAM_XML.NOM_CAMPO_CIERRA || '';
          
        END CASE;
      
      ELSE
      
        P_MEL_XML_POL_P2000031 := P_MEL_XML_POL_P2000031 ||
                                  R_GET_PARAM_XML.NOM_CAMPO_ABRE ||
                                  R_GET_PARAM_XML.VAL_CAMPO ||
                                  R_GET_PARAM_XML.NOM_CAMPO_CIERRA || '';
      
      END IF;
    
    END LOOP;
  
    P_MEL_XML_POL_P2000031 := P_MEL_XML_POL_P2000031 || '</ROW>';
    P_MEL_XML_POL_P2000031 := P_MEL_XML_POL_P2000031 || '</ROWSET>';
    P_MEL_XML_POL_P2000031 := P_MEL_XML_POL_P2000031 || '</TABLE>';
  
    /************************************************************************************************************/
  
    P_MEL_XML_POL_P2000020 := P_MEL_XML_POL_P2000020 ||
                              '<TABLE NAME="P2000020">';
    P_MEL_XML_POL_P2000020 := P_MEL_XML_POL_P2000020 || '<ROWSET>';
  
    FOR X IN 1 .. 33 LOOP
    
      P_MEL_XML_POL_P2000020 := P_MEL_XML_POL_P2000020 || '<ROW NUM="' || X || '">';
    
      FOR R_GET_PARAM_XML IN C_GET_PARAM_XML('P2000020') LOOP
      
        IF (R_GET_PARAM_XML.MCA_FIJO = 'N') THEN
        
          IF (X = 1) THEN
          
            P_CAMPO := 'COD_USO_VEHI';
            IF (R_DATOS_COT_CAB.COD_RAMO IN (801, 802, 803, 808)) THEN
              P_VAL_CAMPO         := 1;
              L_COD_ASEGURAMIENTO := 0;
            ELSE
              P_VAL_CAMPO         := 5;
              L_COD_ASEGURAMIENTO := 0;
            END IF;
          
          END IF;
        
          IF (X = 2) THEN
          
            P_CAMPO     := 'ANIO_SUB_MODELO';
            P_VAL_CAMPO := R_DATOS_VEH.ANO_FAB;
          
          END IF;
        
          IF (X = 3) THEN
          
            P_CAMPO     := 'COD_MARCA';
            P_VAL_CAMPO := R_DATOS_VEH.COD_MARCA;
          
          END IF;
        
          IF (X = 4) THEN
          
            P_CAMPO     := 'COD_MODELO';
            P_VAL_CAMPO := R_DATOS_VEH.COD_MODELO;
          
          END IF;
        
          IF (X = 5) THEN
          
            P_CAMPO     := 'COD_SUB_MODELO';
            P_VAL_CAMPO := R_DATOS_VEH.COD_SUB_MODELO;
          
          END IF;
        
          IF (X = 6) THEN
          
            P_CAMPO     := 'COD_TIP_VEHI';
            P_VAL_CAMPO := R_DATOS_VEH.COD_TIP_VEHI;
          
          END IF;
        
          IF (X = 7) THEN
          
            P_CAMPO     := 'COD_MODALIDAD';
            P_VAL_CAMPO := L_COD_PLAN;
          
          END IF;
        
          IF (X = 8) THEN
          
            P_CAMPO := 'NUM_MATRICULA';
          
            P_VAL_CAMPO := R_DATOS_VEH.NUM_MATRICULA;
          
          END IF;
        
          IF (X = 9) THEN
          
            /* P_CAMPO     := 'COD_MOD_ASEGURAMIENTO';
            P_VAL_CAMPO := L_COD_ASEGURAMIENTO;*/
          
            P_CAMPO := 'COD_MOD_ASEGURAMIENTO';
          
            IF C_COD_AGT.COD_AGT IN (41235) THEN
              P_VAL_CAMPO := '1';
            ELSE
              IF C_COD_AGT.COD_AGT IN (41215) THEN
                IF L_COD_PLAN != 8880 THEN
                  P_VAL_CAMPO := '0';
                ELSE
                  P_VAL_CAMPO := '1';
                END IF;
              ELSE
                P_VAL_CAMPO := L_COD_ASEGURAMIENTO;
              END IF;
            END IF;
          
          END IF;
        
          IF (X = 10) THEN
          
            P_CAMPO     := 'MCA_EXENTO';
            P_VAL_CAMPO := 'N';
          
          END IF;
        
          IF (X = 11) THEN
          
            P_BUSCA_RC_EXCESO(P_COD_RAMO,
                              R_DATOS_COT_VEH.MONTO_DM,
                              L_COD_PLAN,
                              R_DATOS_COT_CAB.COD_DOCUM,
                              R_DATOS_COT_CAB.COD_DOCUM_PAG,
                              L_MONTO_RC_EXCESO2);
          
            P_BUSCA_COB_OPC(P_COD_RAMO,
                            R_DATOS_COT_VEH.MONTO_DM || '|' ||
                            R_DATOS_COT_VEH.DEDUCIBLE || '|',
                            L_COD_PLAN,
                            R_DATOS_COT_CAB.COD_DOCUM,
                            R_DATOS_COT_CAB.COD_DOCUM_PAG,
                            L_MONTO_RC_EXCESO,
                            L_MONTO_RC_EXCESO_CONV);
          
            P_CAMPO     := 'IMP_PRIMA_PROPUESTA';
            P_VAL_CAMPO := REPLACE(ROUND(R_DATOS_COT_VEH.IMP_PRIMA_NETA -
                                         L_MONTO_RC_EXCESO -
                                         (L_MONTO_RC_EXCESO_CONV) -
                                         L_MONTO_RC_EXCESO2,
                                         2),
                                   ',',
                                   '.');
          
          END IF;
        
          IF (X = 12) THEN
          
            P_CAMPO     := 'MCA_MEL';
            P_VAL_CAMPO := 'S';
          
          END IF;
        
          IF (X = 13) THEN
          
            P_CAMPO     := 'NUM_SERIE';
            P_VAL_CAMPO := UPPER(R_DATOS_VEH.NRO_CHASIS);
          
          END IF;
        
          IF (X = 14) THEN
          
            P_CAMPO     := 'NUM_MOTOR';
            P_VAL_CAMPO := UPPER(R_DATOS_VEH.NRO_MOTOR);
          
          END IF;
        
          IF (X = 15) THEN
          
            P_CAMPO := 'MCA_IND_INSP';
          
            IF P_IND_INSP IN ('C', 'B') THEN
              P_VAL_CAMPO := 'P';
            ELSE
              P_VAL_CAMPO := 'P';
            END IF;
          
          END IF;
        
          IF (X = 16) THEN
          
            P_CAMPO     := 'NUM_FOLIO';
            P_VAL_CAMPO := NUM_FOLIO;
          
          END IF;
        
          IF (X = 17) THEN
          
            P_CAMPO     := 'NUM_PROPUESTA_OV';
            P_VAL_CAMPO := P_NUM_COTIZACION;
          
          END IF;
        
          IF (X = 18) THEN
          
            P_CAMPO     := 'COD_COLOR';
            P_VAL_CAMPO := R_DATOS_VEH.COD_COLOR;
          
          END IF;
        
          IF (X = 19) THEN
          
            P_CAMPO     := 'VAL_SUB_MODELO';
            P_VAL_CAMPO := R_DATOS_COT_VEH.VALOR_REFERENCIAL;
          
          END IF;
        
          IF (X = 20) THEN
          
            P_CAMPO := 'MCA_RC_COMPRENSIVA';
          
            P_VAL_CAMPO := 'S';
          
          END IF;
        
          IF (X = 21) THEN
          
            P_CAMPO := 'COD_RELACION';
          
            IF R_DATOS_COT_CAB.COD_DOCUM_ASEG <>
               R_DATOS_COT_CAB.COD_DOCUM_PROP THEN
              P_VAL_CAMPO := '1';
            ELSE
              P_VAL_CAMPO := '0';
            END IF;
          
          END IF;
        
          IF (X = 22) THEN
          
            P_CAMPO     := 'MONTO_RC';
            P_VAL_CAMPO := R_DATOS_COT_VEH.MONTO_RC;
          
          END IF;
        
          IF (X = 23) THEN
          
            P_CAMPO     := 'EDAD_COND';
            P_VAL_CAMPO := R_DATOS_COT_VEH.EDAD_CONDUCTOR;
          
          END IF;
        
          IF (X = 24) THEN
          
            P_CAMPO     := 'MCA_SEXO';
            P_VAL_CAMPO := R_DATOS_COT_VEH.ANOS_SIN_SINI;
          
          END IF;
        
          IF (X = 25) THEN
          
            P_BUSCA_RANGO_EDAD(R_DATOS_COT_VEH.EDAD_CONDUCTOR,
                               L_RANGO_EDAD_CONDUCTOR);
          
            P_CAMPO     := 'RANGO_EDAD';
            P_VAL_CAMPO := L_RANGO_EDAD_CONDUCTOR;
          
          END IF;
        
          IF (X = 26) THEN
          
            P_CAMPO := 'MCA_VEHICULO_NUEVO';
          
            IF (R_DATOS_COT_VEH.FACTURA_48 = '1') THEN
              P_VAL_CAMPO := 'S';
            ELSE
              P_VAL_CAMPO := 'N';
            END IF;
          
          END IF;
        
          IF (X = 27) THEN
          
            P_CAMPO := 'MCA_EXCLUSIVIDAD_GARAGE';
          
            IF (R_DATOS_COT_VEH.ASISTENCIA = '1') THEN
              P_VAL_CAMPO := 'S';
            ELSE
              P_VAL_CAMPO := 'N';
            END IF;
          
          END IF;
        
          IF (X = 28) THEN
          
            P_CAMPO := 'MCA_ASIST_10DIAS';
          
            IF (R_DATOS_COT_VEH.MONTO_LC = '8133' AND
               R_DATOS_COT_VEH.MCA_MEL = 'S') THEN
              P_VAL_CAMPO := 'S';
            ELSE
              P_VAL_CAMPO := 'N';
            END IF;
          
          END IF;
        
          IF (X = 29) THEN
          
            P_CAMPO := 'NRO_FACTURA';
          
            IF (L_NUM_FACTURA IS NULL) THEN
              P_VAL_CAMPO := '';
            ELSE
              P_VAL_CAMPO := L_NUM_FACTURA;
            END IF;
          
          END IF;
        
          IF (X = 30) THEN
          
            P_CAMPO := 'FECHA_FACTURA';
          
            IF (L_FEC_FACTURA IS NULL) THEN
              P_VAL_CAMPO := '';
            ELSE
              P_VAL_CAMPO := L_FEC_FACTURA;
            END IF;
          
          END IF;
        
          IF (X = 31) THEN
          
            P_CAMPO := 'MCA_HIJOS';
          
            IF (R_DATOS_COT_VEH.MCA_HIJOS IS NULL) THEN
              P_VAL_CAMPO := '';
            ELSE
              P_VAL_CAMPO := R_DATOS_COT_VEH.MCA_HIJOS;
            END IF;
          
          END IF;
        
          IF (X = 32) THEN
          
            P_CAMPO := 'MCA_INTER_FRANQ';
          
            IF (R_DATOS_COT_VEH.MCA_FRANQUICIA IS NULL) THEN
              P_VAL_CAMPO := '';
            ELSE
              P_VAL_CAMPO := R_DATOS_COT_VEH.MCA_FRANQUICIA;
            END IF;
          
          END IF;
        
          IF (X = 33) THEN
          
            P_CAMPO := 'MCA_DANOSPRE';
          
            IF (R_DATOS_COT_VEH.MCA_DANOSPRE IS NULL) THEN
              P_VAL_CAMPO := '';
            ELSE
              P_VAL_CAMPO := R_DATOS_COT_VEH.MCA_DANOSPRE;
            END IF;
          
          END IF;
        
          IF P_CAMPO NOT IN ('MCA_MEL', 'NUM_FOLIO', 'NUM_PROPUESTA_OV') THEN
            P_TIP_NIVEL := '2';
          ELSE
            P_TIP_NIVEL := '1';
          END IF;
        
          IF P_CAMPO IN ('NUM_FOLIO', 'NUM_PROPUESTA_OV', 'MCA_MEL') THEN
            P_NUM_RIESGO := 0;
          ELSE
            P_NUM_RIESGO := 1;
          END IF;
        
          CASE R_GET_PARAM_XML.NOM_CAMPO_ABRE
          
            WHEN '<COD_CAMPO>' THEN
            
              P_MEL_XML_POL_P2000020 := P_MEL_XML_POL_P2000020 ||
                                        R_GET_PARAM_XML.NOM_CAMPO_ABRE ||
                                        P_CAMPO ||
                                        R_GET_PARAM_XML.NOM_CAMPO_CIERRA || '';
            
            WHEN '<VAL_CAMPO>' THEN
            
              P_MEL_XML_POL_P2000020 := P_MEL_XML_POL_P2000020 ||
                                        R_GET_PARAM_XML.NOM_CAMPO_ABRE ||
                                        SUBSTR(P_VAL_CAMPO, 0, 80) ||
                                        R_GET_PARAM_XML.NOM_CAMPO_CIERRA || '';
            
            WHEN '<VAL_COR_CAMPO>' THEN
            
              P_MEL_XML_POL_P2000020 := P_MEL_XML_POL_P2000020 ||
                                        R_GET_PARAM_XML.NOM_CAMPO_ABRE ||
                                        SUBSTR(P_VAL_CAMPO, 0, 10) ||
                                        R_GET_PARAM_XML.NOM_CAMPO_CIERRA || '';
            
            WHEN '<COD_RAMO>' THEN
            
              P_MEL_XML_POL_P2000020 := P_MEL_XML_POL_P2000020 ||
                                        R_GET_PARAM_XML.NOM_CAMPO_ABRE ||
                                        R_DATOS_COT_CAB.COD_RAMO ||
                                        R_GET_PARAM_XML.NOM_CAMPO_CIERRA || '';
            
            WHEN '<TIP_NIVEL>' THEN
            
              P_MEL_XML_POL_P2000020 := P_MEL_XML_POL_P2000020 ||
                                        R_GET_PARAM_XML.NOM_CAMPO_ABRE ||
                                        P_TIP_NIVEL ||
                                        R_GET_PARAM_XML.NOM_CAMPO_CIERRA || '';
            
            WHEN '<NUM_RIESGO>' THEN
            
              P_MEL_XML_POL_P2000020 := P_MEL_XML_POL_P2000020 ||
                                        R_GET_PARAM_XML.NOM_CAMPO_ABRE ||
                                        P_NUM_RIESGO ||
                                        R_GET_PARAM_XML.NOM_CAMPO_CIERRA || '';
            
          END CASE;
        
        ELSE
        
          P_MEL_XML_POL_P2000020 := P_MEL_XML_POL_P2000020 ||
                                    R_GET_PARAM_XML.NOM_CAMPO_ABRE ||
                                    R_GET_PARAM_XML.VAL_CAMPO ||
                                    R_GET_PARAM_XML.NOM_CAMPO_CIERRA || '';
        
        END IF;
      
      END LOOP;
    
      P_MEL_XML_POL_P2000020 := P_MEL_XML_POL_P2000020 || '</ROW>';
    
    END LOOP;
  
    P_MEL_XML_POL_P2000020 := P_MEL_XML_POL_P2000020 || '</ROWSET>';
    P_MEL_XML_POL_P2000020 := P_MEL_XML_POL_P2000020 || '</TABLE>';
  
    /************************************************************************************************************/
  
    P_MEL_XML_POL_P2000040 := P_MEL_XML_POL_P2000040 ||
                              '<TABLE NAME="P2000040">';
    P_MEL_XML_POL_P2000040 := P_MEL_XML_POL_P2000040 || '<ROWSET>';
  
    X := 1;
  
    L_SUMA_ASEG := '1000';
  
    IF (R_DATOS_COT_CAB.COD_DOCUM_MAE = '774724206') THEN
      V_COD_RAMO := 808;
    ELSE
      V_COD_RAMO := R_DATOS_COT_CAB.COD_RAMO;
    END IF;
  
    FOR C_COBERTURAS IN COBERTURAS(V_COD_RAMO, L_COD_PLAN) LOOP
    
      /*IF C_COBERTURAS.MCA_OBLIGATORIO = 'S' OR
      (R_DATOS_COT_VEH.COD_MODALIDAD IN
      ('8003', '8005', '8010', '8120', '8900') AND
      C_COBERTURAS.COD_COB IN ('6300', '6303')) THEN*/
    
      IF C_COBERTURAS.COD_COB NOT IN (8200, 8201, 8202, 8203, 8133, 8105) THEN
      
        P_MEL_XML_POL_P2000040 := P_MEL_XML_POL_P2000040 || '<ROW NUM="' || X || '">';
      
        L_SUMA_ASEG := '1000';
      
        FOR R_GET_PARAM_XML IN C_GET_PARAM_XML('P2000040') LOOP
        
          IF (R_GET_PARAM_XML.MCA_FIJO = 'N') THEN
          
            IF (R_GET_PARAM_XML.NOM_CAMPO_ABRE = '<SUMA_ASEG>') THEN
            
              IF (C_COBERTURAS.MCA_OBLIGATORIO = 'N' AND
                 C_COBERTURAS.COD_COB != 8102) THEN
              
                L_SUMA_ASEG := 0;
              
              END IF;
            
            END IF;
          
            IF (R_GET_PARAM_XML.NOM_CAMPO_ABRE = '<SUMA_ASEG>') THEN
            
              IF (C_COBERTURAS.COD_COB = 8109) THEN
              
                P_BUSCA_SUMA_ASEG_COB_CONV(P_COD_RAMO,
                                           C_COBERTURAS.COD_COB,
                                           L_COD_PLAN,
                                           R_DATOS_COT_CAB.COD_DOCUM,
                                           R_DATOS_COT_CAB.COD_DOCUM_PAG,
                                           L_SUMA_ASEG);
              
                IF L_SUMA_ASEG IS NULL THEN
                
                  L_SUMA_ASEG := '1000';
                
                END IF;
              
              END IF;
            
            END IF;
          
            IF (R_GET_PARAM_XML.NOM_CAMPO_ABRE = '<SUMA_ASEG>') THEN
            
              IF (C_COBERTURAS.COD_COB IN (6303, 6300)) THEN
              
                P_BUSCA_SUMA_ASEG_COB_CONV(P_COD_RAMO,
                                           C_COBERTURAS.COD_COB,
                                           L_COD_PLAN,
                                           R_DATOS_COT_CAB.COD_DOCUM,
                                           R_DATOS_COT_CAB.COD_DOCUM_PAG,
                                           L_SUMA_ASEG);
              
                IF L_SUMA_ASEG IS NULL THEN
                
                  L_SUMA_ASEG := '500';
                
                END IF;
              
              END IF;
            
            END IF;
          
            IF (C_COBERTURAS.COD_COB = 8106) THEN
            
              IF (R_GET_PARAM_XML.NOM_CAMPO_ABRE = '<SUMA_ASEG>') THEN
              
                P_BUSCA_SUMA_ASEG_COB_CONV(P_COD_RAMO,
                                           C_COBERTURAS.COD_COB,
                                           L_COD_PLAN,
                                           R_DATOS_COT_CAB.COD_DOCUM,
                                           R_DATOS_COT_CAB.COD_DOCUM_PAG,
                                           L_SUMA_ASEG);
              
                IF L_SUMA_ASEG IS NULL THEN
                
                  L_SUMA_ASEG := 50;
                
                END IF;
              
              END IF;
            
            END IF;
          
            IF (C_COBERTURAS.COD_COB = 8134) THEN
            
              IF (R_GET_PARAM_XML.NOM_CAMPO_ABRE = '<SUMA_ASEG>') THEN
              
                P_BUSCA_SUMA_ASEG_COB_CONV(P_COD_RAMO,
                                           C_COBERTURAS.COD_COB,
                                           L_COD_PLAN,
                                           R_DATOS_COT_CAB.COD_DOCUM,
                                           R_DATOS_COT_CAB.COD_DOCUM_PAG,
                                           L_SUMA_ASEG);
              
                IF L_SUMA_ASEG IS NULL THEN
                
                  L_SUMA_ASEG := 0;
                
                END IF;
              
              END IF;
            
            END IF;
          
            IF (C_COBERTURAS.COD_COB = 8118) THEN
            
              IF (R_GET_PARAM_XML.NOM_CAMPO_ABRE = '<SUMA_ASEG>') THEN
              
                P_BUSCA_SUMA_ASEG_COB_CONV(P_COD_RAMO,
                                           C_COBERTURAS.COD_COB,
                                           L_COD_PLAN,
                                           R_DATOS_COT_CAB.COD_DOCUM,
                                           R_DATOS_COT_CAB.COD_DOCUM_PAG,
                                           L_SUMA_ASEG);
              
                IF L_SUMA_ASEG IS NULL THEN
                
                  L_SUMA_ASEG := 0;
                
                END IF;
              
              END IF;
            
            END IF;
          
            IF (C_COBERTURAS.COD_COB IN (8112, 8114)) THEN
            
              P_BUSCA_SUMA_ASEG_COB_CONV(P_COD_RAMO,
                                         C_COBERTURAS.COD_COB,
                                         L_COD_PLAN,
                                         R_DATOS_COT_CAB.COD_DOCUM,
                                         R_DATOS_COT_CAB.COD_DOCUM_PAG,
                                         L_SUMA_ASEG);
            
              IF L_SUMA_ASEG IS NULL THEN
              
                L_SUMA_ASEG := R_DATOS_COT_VEH.MONTO_RC;
              
              END IF;
            
            END IF;
          
            IF (C_COBERTURAS.COD_COB = 8133) THEN
            
              P_BUSCA_SUMA_ASEG_COB_CONV(P_COD_RAMO,
                                         C_COBERTURAS.COD_COB,
                                         L_COD_PLAN,
                                         R_DATOS_COT_CAB.COD_DOCUM,
                                         R_DATOS_COT_CAB.COD_DOCUM_PAG,
                                         L_SUMA_ASEG);
            
              IF L_SUMA_ASEG IS NULL THEN
              
                L_SUMA_ASEG := 0;
              
              END IF;
            
            END IF;
          
            IF (C_COBERTURAS.COD_COB = 8151) THEN
            
              P_BUSCA_SUMA_ASEG_COB_CONV(P_COD_RAMO,
                                         C_COBERTURAS.COD_COB,
                                         L_COD_PLAN,
                                         R_DATOS_COT_CAB.COD_DOCUM,
                                         R_DATOS_COT_CAB.COD_DOCUM_PAG,
                                         L_SUMA_ASEG);
            
              IF L_SUMA_ASEG IS NULL THEN
              
                L_SUMA_ASEG := 0;
              
              END IF;
            
            END IF;
          
            IF (C_COBERTURAS.COD_COB = 8115) THEN
            
              P_BUSCA_SUMA_ASEG_COB_CONV(P_COD_RAMO,
                                         C_COBERTURAS.COD_COB,
                                         L_COD_PLAN,
                                         R_DATOS_COT_CAB.COD_DOCUM,
                                         R_DATOS_COT_CAB.COD_DOCUM_PAG,
                                         L_SUMA_ASEG);
            
              IF L_SUMA_ASEG IS NULL THEN
              
                L_SUMA_ASEG := R_DATOS_COT_VEH.MONTO_RC;
              
              END IF;
            
            END IF;
          
            IF (C_COBERTURAS.COD_COB = 8116) THEN
            
              P_BUSCA_SUMA_ASEG_COB_CONV(P_COD_RAMO,
                                         C_COBERTURAS.COD_COB,
                                         L_COD_PLAN,
                                         R_DATOS_COT_CAB.COD_DOCUM,
                                         R_DATOS_COT_CAB.COD_DOCUM_PAG,
                                         L_SUMA_ASEG);
            
              IF L_SUMA_ASEG IS NULL THEN
              
                L_SUMA_ASEG := R_DATOS_COT_VEH.MONTO_RC;
              
              END IF;
            
            END IF;
          
            IF (C_COBERTURAS.COD_COB = 8142) THEN
            
              P_BUSCA_SUMA_ASEG_COB_CONV(P_COD_RAMO,
                                         C_COBERTURAS.COD_COB,
                                         L_COD_PLAN,
                                         R_DATOS_COT_CAB.COD_DOCUM,
                                         R_DATOS_COT_CAB.COD_DOCUM_PAG,
                                         L_SUMA_ASEG);
            
              IF L_SUMA_ASEG IS NULL THEN
              
                L_SUMA_ASEG := 0;
              
              END IF;
            
            END IF;
          
            CASE R_GET_PARAM_XML.NOM_CAMPO_ABRE
            
              WHEN '<COD_COB>' THEN
              
                P_MEL_XML_POL_P2000040 := P_MEL_XML_POL_P2000040 ||
                                          R_GET_PARAM_XML.NOM_CAMPO_ABRE ||
                                          C_COBERTURAS.COD_COB ||
                                          R_GET_PARAM_XML.NOM_CAMPO_CIERRA || '';
              
              WHEN '<SUMA_ASEG>' THEN
              
                IF C_COBERTURAS.COD_COB = 8102 THEN
                  P_MEL_XML_POL_P2000040 := P_MEL_XML_POL_P2000040 ||
                                            R_GET_PARAM_XML.NOM_CAMPO_ABRE ||
                                           --TO_NUMBER(L_SUMA_ASEG) * 0.1 ||
                                            50 ||
                                            R_GET_PARAM_XML.NOM_CAMPO_CIERRA || '';
                ELSE
                  P_MEL_XML_POL_P2000040 := P_MEL_XML_POL_P2000040 ||
                                            R_GET_PARAM_XML.NOM_CAMPO_ABRE ||
                                            L_SUMA_ASEG ||
                                            R_GET_PARAM_XML.NOM_CAMPO_CIERRA || '';
                END IF;
              
              WHEN '<SUMA_ASEG_SPTO>' THEN
              
                P_MEL_XML_POL_P2000040 := P_MEL_XML_POL_P2000040 ||
                                          R_GET_PARAM_XML.NOM_CAMPO_ABRE || '0' ||
                                          R_GET_PARAM_XML.NOM_CAMPO_CIERRA || '';
              
              WHEN '<COD_FRANQUICIA>' THEN
              
                IF C_COBERTURAS.COD_COB IN (8100, 8102, 8103, 8104) THEN
                
                  CASE L_COD_PLAN
                    WHEN '8005' THEN
                      P_MEL_XML_POL_P2000040 := P_MEL_XML_POL_P2000040 ||
                                                '<COD_FRANQUICIA>8</COD_FRANQUICIA>';
                    WHEN '8125' THEN
                      P_MEL_XML_POL_P2000040 := P_MEL_XML_POL_P2000040 ||
                                                '<COD_FRANQUICIA>8</COD_FRANQUICIA>';
                    WHEN '8010' THEN
                      P_MEL_XML_POL_P2000040 := P_MEL_XML_POL_P2000040 ||
                                                '<COD_FRANQUICIA>10</COD_FRANQUICIA>';
                    WHEN '8121' THEN
                      P_MEL_XML_POL_P2000040 := P_MEL_XML_POL_P2000040 ||
                                                '<COD_FRANQUICIA>10</COD_FRANQUICIA>';
                    WHEN '8000' THEN
                      P_MEL_XML_POL_P2000040 := P_MEL_XML_POL_P2000040 ||
                                                '<COD_FRANQUICIA>1</COD_FRANQUICIA>';
                    WHEN '8120' THEN
                      P_MEL_XML_POL_P2000040 := P_MEL_XML_POL_P2000040 ||
                                                '<COD_FRANQUICIA>1</COD_FRANQUICIA>';
                    WHEN '8003' THEN
                      P_MEL_XML_POL_P2000040 := P_MEL_XML_POL_P2000040 ||
                                                '<COD_FRANQUICIA>7</COD_FRANQUICIA>';
                    WHEN '8123' THEN
                      P_MEL_XML_POL_P2000040 := P_MEL_XML_POL_P2000040 ||
                                                '<COD_FRANQUICIA>7</COD_FRANQUICIA>';
                    ELSE
                      P_MEL_XML_POL_P2000040 := P_MEL_XML_POL_P2000040 ||
                                                '<COD_FRANQUICIA></COD_FRANQUICIA>';
                  END CASE;
                ELSE
                  P_MEL_XML_POL_P2000040 := P_MEL_XML_POL_P2000040 ||
                                            '<COD_FRANQUICIA></COD_FRANQUICIA>';
                END IF;
              
              WHEN '<COD_RAMO>' THEN
              
                P_MEL_XML_POL_P2000040 := P_MEL_XML_POL_P2000040 ||
                                          R_GET_PARAM_XML.NOM_CAMPO_ABRE ||
                                          R_DATOS_COT_CAB.COD_RAMO ||
                                          R_GET_PARAM_XML.NOM_CAMPO_CIERRA || '';
              
            END CASE;
          
          ELSE
          
            P_MEL_XML_POL_P2000040 := P_MEL_XML_POL_P2000040 ||
                                      R_GET_PARAM_XML.NOM_CAMPO_ABRE ||
                                      R_GET_PARAM_XML.VAL_CAMPO ||
                                      R_GET_PARAM_XML.NOM_CAMPO_CIERRA || '';
          
          END IF;
        
        END LOOP;
      
        X := X + 1;
      
        P_MEL_XML_POL_P2000040 := P_MEL_XML_POL_P2000040 || '</ROW>';
      
      ELSE
        /*************/
        /*RC*/
        IF R_DATOS_COT_VEH.MONTO_DM = C_COBERTURAS.COD_COB THEN
        
          P_MEL_XML_POL_P2000040 := P_MEL_XML_POL_P2000040 || '<ROW NUM="' || X || '">';
        
          IF C_COBERTURAS.COD_COB = 8200 THEN
            L_SUMA_ASEG := 1800;
          ELSE
            L_SUMA_ASEG := 4300;
          END IF;
          
          IF C_COBERTURAS.COD_COB = 8202 THEN
            L_SUMA_ASEG := 1500;
          ELSE
            L_SUMA_ASEG := 4000;
          END IF;
        
          FOR R_GET_PARAM_XML IN C_GET_PARAM_XML('P2000040') LOOP
          
            IF (R_GET_PARAM_XML.MCA_FIJO = 'N') THEN
            
              CASE R_GET_PARAM_XML.NOM_CAMPO_ABRE
              
                WHEN '<COD_COB>' THEN
                
                  P_MEL_XML_POL_P2000040 := P_MEL_XML_POL_P2000040 ||
                                            R_GET_PARAM_XML.NOM_CAMPO_ABRE ||
                                            C_COBERTURAS.COD_COB ||
                                            R_GET_PARAM_XML.NOM_CAMPO_CIERRA || '';
                
                WHEN '<SUMA_ASEG>' THEN
                
                  P_MEL_XML_POL_P2000040 := P_MEL_XML_POL_P2000040 ||
                                            R_GET_PARAM_XML.NOM_CAMPO_ABRE ||
                                            L_SUMA_ASEG ||
                                            R_GET_PARAM_XML.NOM_CAMPO_CIERRA || '';
                
                WHEN '<SUMA_ASEG_SPTO>' THEN
                
                  P_MEL_XML_POL_P2000040 := P_MEL_XML_POL_P2000040 ||
                                            R_GET_PARAM_XML.NOM_CAMPO_ABRE || '0' ||
                                            R_GET_PARAM_XML.NOM_CAMPO_CIERRA || '';
                
                WHEN '<COD_FRANQUICIA>' THEN
                
                  /*                IF C_COBERTURAS.COD_COB IN (8100, 8102, 8103, 8104) THEN
                  
                  CASE R_DATOS_COT_VEH.COD_MODALIDAD
                    WHEN '8050' THEN
                      P_MEL_XML_POL_P2000040 := P_MEL_XML_POL_P2000040 ||
                                                '<COD_FRANQUICIA>155</COD_FRANQUICIA>';
                    WHEN '8005' THEN
                      P_MEL_XML_POL_P2000040 := P_MEL_XML_POL_P2000040 ||
                                                '<COD_FRANQUICIA>8</COD_FRANQUICIA>';
                    WHEN '8010' THEN
                      P_MEL_XML_POL_P2000040 := P_MEL_XML_POL_P2000040 ||
                                                '<COD_FRANQUICIA>10</COD_FRANQUICIA>';
                    WHEN '8100' THEN
                      P_MEL_XML_POL_P2000040 := P_MEL_XML_POL_P2000040 ||
                                                '<COD_FRANQUICIA>156</COD_FRANQUICIA>';
                    WHEN '8000' THEN
                      P_MEL_XML_POL_P2000040 := P_MEL_XML_POL_P2000040 ||
                                                '<COD_FRANQUICIA>1</COD_FRANQUICIA>';
                    WHEN '8003' THEN
                      P_MEL_XML_POL_P2000040 := P_MEL_XML_POL_P2000040 ||
                                                '<COD_FRANQUICIA>7</COD_FRANQUICIA>';
                    WHEN '8015' THEN
                      P_MEL_XML_POL_P2000040 := P_MEL_XML_POL_P2000040 ||
                                                '<COD_FRANQUICIA>11</COD_FRANQUICIA>';
                    ELSE
                      P_MEL_XML_POL_P2000040 := P_MEL_XML_POL_P2000040 ||
                                                '<COD_FRANQUICIA></COD_FRANQUICIA>';
                  END CASE;ELSE*/
                  P_MEL_XML_POL_P2000040 := P_MEL_XML_POL_P2000040 ||
                                            '<COD_FRANQUICIA></COD_FRANQUICIA>';
                  /*END IF;*/
              
                WHEN '<COD_RAMO>' THEN
                
                  P_MEL_XML_POL_P2000040 := P_MEL_XML_POL_P2000040 ||
                                            R_GET_PARAM_XML.NOM_CAMPO_ABRE ||
                                            R_DATOS_COT_CAB.COD_RAMO ||
                                            R_GET_PARAM_XML.NOM_CAMPO_CIERRA || '';
                
              END CASE;
            
            ELSE
            
              P_MEL_XML_POL_P2000040 := P_MEL_XML_POL_P2000040 ||
                                        R_GET_PARAM_XML.NOM_CAMPO_ABRE ||
                                        R_GET_PARAM_XML.VAL_CAMPO ||
                                        R_GET_PARAM_XML.NOM_CAMPO_CIERRA || '';
            
            END IF;
          
          END LOOP;
        
          X := X + 1;
        
          P_MEL_XML_POL_P2000040 := P_MEL_XML_POL_P2000040 || '</ROW>';
        
          /*************/
        
        END IF;
      
        /*EXCLUSIVIDAD GARAGE*/
        /*
          IF R_DATOS_COT_VEH_COMUN.MONTO_LC = C_COBERTURAS.COD_COB THEN
        
            P_MEL_XML_POL_P2000040 := P_MEL_XML_POL_P2000040 ||
                                      '<ROW NUM="' || X || '">';
        
            L_SUMA_ASEG := 700;
        
            FOR R_GET_PARAM_XML IN C_GET_PARAM_XML('P2000040') LOOP
        
              IF (R_GET_PARAM_XML.MCA_FIJO = 'N') THEN
        
                CASE R_GET_PARAM_XML.NOM_CAMPO_ABRE
        
                  WHEN '<COD_COB>' THEN
        
                    P_MEL_XML_POL_P2000040 := P_MEL_XML_POL_P2000040 ||
                                              R_GET_PARAM_XML.NOM_CAMPO_ABRE ||
                                              C_COBERTURAS.COD_COB ||
                                              R_GET_PARAM_XML.NOM_CAMPO_CIERRA || '';
        
                  WHEN '<SUMA_ASEG>' THEN
        
                    P_MEL_XML_POL_P2000040 := P_MEL_XML_POL_P2000040 ||
                                              R_GET_PARAM_XML.NOM_CAMPO_ABRE ||
                                              L_SUMA_ASEG ||
                                              R_GET_PARAM_XML.NOM_CAMPO_CIERRA || '';
        
                  WHEN '<SUMA_ASEG_SPTO>' THEN
        
                    P_MEL_XML_POL_P2000040 := P_MEL_XML_POL_P2000040 ||
                                              R_GET_PARAM_XML.NOM_CAMPO_ABRE || '0' ||
                                              R_GET_PARAM_XML.NOM_CAMPO_CIERRA || '';
        
                  WHEN '<COD_FRANQUICIA>' THEN
        
                    P_MEL_XML_POL_P2000040 := P_MEL_XML_POL_P2000040 ||
                                              '<COD_FRANQUICIA></COD_FRANQUICIA>';
        
                  WHEN '<COD_RAMO>' THEN
        
                    P_MEL_XML_POL_P2000040 := P_MEL_XML_POL_P2000040 ||
                                              R_GET_PARAM_XML.NOM_CAMPO_ABRE ||
                                              R_DATOS_COT_CAB.COD_RAMO ||
                                              R_GET_PARAM_XML.NOM_CAMPO_CIERRA || '';
        
                  WHEN '<NUM_RIESGO>' THEN
        
                    P_MEL_XML_POL_P2000040 := P_MEL_XML_POL_P2000040 ||
                                              R_GET_PARAM_XML.NOM_CAMPO_ABRE || R ||
                                              R_GET_PARAM_XML.NOM_CAMPO_CIERRA || '';
        
                END CASE;
        
              ELSE
        
                P_MEL_XML_POL_P2000040 := P_MEL_XML_POL_P2000040 ||
                                          R_GET_PARAM_XML.NOM_CAMPO_ABRE ||
                                          R_GET_PARAM_XML.VAL_CAMPO ||
                                          R_GET_PARAM_XML.NOM_CAMPO_CIERRA || '';
        
              END IF;
        
            END LOOP;
        
            X := X + 1;
        
            P_MEL_XML_POL_P2000040 := P_MEL_XML_POL_P2000040 || '</ROW>';
        
            \*************\
        
          END IF;
        */
        /*ASISTENCIA ADICIONAL*/
        IF R_DATOS_COT_VEH.MONTO_LC = C_COBERTURAS.COD_COB THEN
        
          P_MEL_XML_POL_P2000040 := P_MEL_XML_POL_P2000040 || '<ROW NUM="' || X || '">';
        
          L_SUMA_ASEG := 0;
        
          FOR R_GET_PARAM_XML IN C_GET_PARAM_XML('P2000040') LOOP
          
            IF (R_GET_PARAM_XML.MCA_FIJO = 'N') THEN
            
              CASE R_GET_PARAM_XML.NOM_CAMPO_ABRE
              
                WHEN '<COD_COB>' THEN
                
                  P_MEL_XML_POL_P2000040 := P_MEL_XML_POL_P2000040 ||
                                            R_GET_PARAM_XML.NOM_CAMPO_ABRE ||
                                            C_COBERTURAS.COD_COB ||
                                            R_GET_PARAM_XML.NOM_CAMPO_CIERRA || '';
                
                WHEN '<SUMA_ASEG>' THEN
                
                  P_MEL_XML_POL_P2000040 := P_MEL_XML_POL_P2000040 ||
                                            R_GET_PARAM_XML.NOM_CAMPO_ABRE ||
                                            L_SUMA_ASEG ||
                                            R_GET_PARAM_XML.NOM_CAMPO_CIERRA || '';
                
                WHEN '<SUMA_ASEG_SPTO>' THEN
                
                  P_MEL_XML_POL_P2000040 := P_MEL_XML_POL_P2000040 ||
                                            R_GET_PARAM_XML.NOM_CAMPO_ABRE || '0' ||
                                            R_GET_PARAM_XML.NOM_CAMPO_CIERRA || '';
                
                WHEN '<COD_FRANQUICIA>' THEN
                
                  P_MEL_XML_POL_P2000040 := P_MEL_XML_POL_P2000040 ||
                                            '<COD_FRANQUICIA></COD_FRANQUICIA>';
                
                WHEN '<COD_RAMO>' THEN
                
                  P_MEL_XML_POL_P2000040 := P_MEL_XML_POL_P2000040 ||
                                            R_GET_PARAM_XML.NOM_CAMPO_ABRE ||
                                            R_DATOS_COT_CAB.COD_RAMO ||
                                            R_GET_PARAM_XML.NOM_CAMPO_CIERRA || '';
                
                WHEN '<NUM_RIESGO>' THEN
                
                  P_MEL_XML_POL_P2000040 := P_MEL_XML_POL_P2000040 ||
                                            R_GET_PARAM_XML.NOM_CAMPO_ABRE || --R ||
                                            R_GET_PARAM_XML.NOM_CAMPO_CIERRA || '';
                
              END CASE;
            
            ELSE
            
              P_MEL_XML_POL_P2000040 := P_MEL_XML_POL_P2000040 ||
                                        R_GET_PARAM_XML.NOM_CAMPO_ABRE ||
                                        R_GET_PARAM_XML.VAL_CAMPO ||
                                        R_GET_PARAM_XML.NOM_CAMPO_CIERRA || '';
            
            END IF;
          
          END LOOP;
        
          X := X + 1;
        
          P_MEL_XML_POL_P2000040 := P_MEL_XML_POL_P2000040 || '</ROW>';
        
          /*************/
        
        END IF;
      
        /*VIAJE AL EXTRANJERO*/
        IF R_DATOS_COT_VEH.DEDUCIBLE = C_COBERTURAS.COD_COB THEN
        
          P_MEL_XML_POL_P2000040 := P_MEL_XML_POL_P2000040 || '<ROW NUM="' || X || '">';
        
          L_SUMA_ASEG := '1000';
        
          FOR R_GET_PARAM_XML IN C_GET_PARAM_XML('P2000040') LOOP
          
            IF (R_GET_PARAM_XML.MCA_FIJO = 'N') THEN
            
              CASE R_GET_PARAM_XML.NOM_CAMPO_ABRE
              
                WHEN '<COD_COB>' THEN
                
                  P_MEL_XML_POL_P2000040 := P_MEL_XML_POL_P2000040 ||
                                            R_GET_PARAM_XML.NOM_CAMPO_ABRE ||
                                            C_COBERTURAS.COD_COB ||
                                            R_GET_PARAM_XML.NOM_CAMPO_CIERRA || '';
                
                WHEN '<SUMA_ASEG>' THEN
                
                  P_MEL_XML_POL_P2000040 := P_MEL_XML_POL_P2000040 ||
                                            R_GET_PARAM_XML.NOM_CAMPO_ABRE ||
                                            L_SUMA_ASEG ||
                                            R_GET_PARAM_XML.NOM_CAMPO_CIERRA || '';
                
                WHEN '<SUMA_ASEG_SPTO>' THEN
                
                  P_MEL_XML_POL_P2000040 := P_MEL_XML_POL_P2000040 ||
                                            R_GET_PARAM_XML.NOM_CAMPO_ABRE || '0' ||
                                            R_GET_PARAM_XML.NOM_CAMPO_CIERRA || '';
                
                WHEN '<COD_FRANQUICIA>' THEN
                
                  P_MEL_XML_POL_P2000040 := P_MEL_XML_POL_P2000040 ||
                                            '<COD_FRANQUICIA></COD_FRANQUICIA>';
                
                WHEN '<COD_RAMO>' THEN
                
                  P_MEL_XML_POL_P2000040 := P_MEL_XML_POL_P2000040 ||
                                            R_GET_PARAM_XML.NOM_CAMPO_ABRE ||
                                            R_DATOS_COT_CAB.COD_RAMO ||
                                            R_GET_PARAM_XML.NOM_CAMPO_CIERRA || '';
                
                WHEN '<NUM_RIESGO>' THEN
                
                  P_MEL_XML_POL_P2000040 := P_MEL_XML_POL_P2000040 ||
                                            R_GET_PARAM_XML.NOM_CAMPO_ABRE || --R ||
                                            R_GET_PARAM_XML.NOM_CAMPO_CIERRA || '';
                
              END CASE;
            
            ELSE
            
              P_MEL_XML_POL_P2000040 := P_MEL_XML_POL_P2000040 ||
                                        R_GET_PARAM_XML.NOM_CAMPO_ABRE ||
                                        R_GET_PARAM_XML.VAL_CAMPO ||
                                        R_GET_PARAM_XML.NOM_CAMPO_CIERRA || '';
            
            END IF;
          
          END LOOP;
        
          X := X + 1;
        
          P_MEL_XML_POL_P2000040 := P_MEL_XML_POL_P2000040 || '</ROW>';
        
          /*************/
        
        END IF;
      
      END IF;
    
    END LOOP;
  
    P_MEL_XML_POL_P2000040 := P_MEL_XML_POL_P2000040 || '</ROWSET>';
    P_MEL_XML_POL_P2000040 := P_MEL_XML_POL_P2000040 || '</TABLE>';
  
    /****************************************************************************************/
  
    P_MEL_XML_POL_P2000060 := P_MEL_XML_POL_P2000060 ||
                              '<TABLE NAME="P2000060">';
    P_MEL_XML_POL_P2000060 := P_MEL_XML_POL_P2000060 || '<ROWSET>';
    P_MEL_XML_POL_P2000060 := P_MEL_XML_POL_P2000060 || '<ROW NUM="1">';
  
    FOR R_GET_PARAM_XML IN C_GET_PARAM_XML('P2000060') LOOP
    
      IF R_GET_PARAM_XML.MCA_FIJO = 'N' THEN
      
        CASE R_GET_PARAM_XML.NOM_CAMPO_ABRE
        
          WHEN '<COD_DOCUM>' THEN
          
            P_MEL_XML_POL_P2000060 := P_MEL_XML_POL_P2000060 ||
                                      R_GET_PARAM_XML.NOM_CAMPO_ABRE ||
                                      R_DATOS_COT_CAB.COD_DOCUM_ASEG ||
                                      R_GET_PARAM_XML.NOM_CAMPO_CIERRA || '';
          
        END CASE;
      
      ELSE
      
        P_MEL_XML_POL_P2000060 := P_MEL_XML_POL_P2000060 ||
                                  R_GET_PARAM_XML.NOM_CAMPO_ABRE ||
                                  R_GET_PARAM_XML.VAL_CAMPO ||
                                  R_GET_PARAM_XML.NOM_CAMPO_CIERRA || '';
      
      END IF;
    
    END LOOP;
  
    P_MEL_XML_POL_P2000060 := P_MEL_XML_POL_P2000060 || '</ROW>';
    P_MEL_XML_POL_P2000060 := P_MEL_XML_POL_P2000060 || '</ROWSET>';
    P_MEL_XML_POL_P2000060 := P_MEL_XML_POL_P2000060 || '</TABLE>';
  
    /***************************************************************************************/
  
    OPEN C_DATOS_NOM_TERCERO_TRN(R_DATOS_COT_CAB.COD_DOCUM_ASEG);
    FETCH C_DATOS_NOM_TERCERO_TRN
      INTO R_DATOS_NOM_TERCERO_TRN;
    CLOSE C_DATOS_NOM_TERCERO_TRN;
  
    OPEN C_DATOS_TERCERO_TRN(R_DATOS_COT_CAB.COD_DOCUM_ASEG);
    FETCH C_DATOS_TERCERO_TRN
      INTO R_DATOS_TERCERO_TRN;
    CLOSE C_DATOS_TERCERO_TRN;
  
    P_MEL_XML_POL_P1001331 := P_MEL_XML_POL_P1001331 ||
                              '<TABLE NAME="P1001331">';
    P_MEL_XML_POL_P1001331 := P_MEL_XML_POL_P1001331 || '<ROWSET>';
    P_MEL_XML_POL_P1001331 := P_MEL_XML_POL_P1001331 || '<ROW NUM="1">';
  
    FOR R_P1001331_XML IN C_GET_PARAM_XML('P1001331') LOOP
    
      IF R_P1001331_XML.MCA_FIJO = 'N' THEN
      
        CASE R_P1001331_XML.NOM_CAMPO_ABRE
        
          WHEN '<FEC_TRATAMIENTO>' THEN
          
            P_MEL_XML_POL_P1001331 := P_MEL_XML_POL_P1001331 ||
                                      R_P1001331_XML.NOM_CAMPO_ABRE ||
                                      TO_CHAR(SYSDATE, 'DD/MM/YYYY') ||
                                      R_P1001331_XML.NOM_CAMPO_CIERRA || '';
          
          WHEN '<COD_DOCUM>' THEN
          
            P_MEL_XML_POL_P1001331 := P_MEL_XML_POL_P1001331 ||
                                      R_P1001331_XML.NOM_CAMPO_ABRE ||
                                      R_DATOS_COT_CAB.COD_DOCUM_ASEG ||
                                      R_P1001331_XML.NOM_CAMPO_CIERRA || '';
          
          WHEN '<APE1_TERCERO>' THEN
          
            P_MEL_XML_POL_P1001331 := P_MEL_XML_POL_P1001331 ||
                                      R_P1001331_XML.NOM_CAMPO_ABRE ||
                                      R_DATOS_NOM_TERCERO_TRN.APE1_TERCERO ||
                                      R_P1001331_XML.NOM_CAMPO_CIERRA || '';
          
          WHEN '<APE2_TERCERO>' THEN
          
            P_MEL_XML_POL_P1001331 := P_MEL_XML_POL_P1001331 ||
                                      R_P1001331_XML.NOM_CAMPO_ABRE ||
                                      R_DATOS_NOM_TERCERO_TRN.APE2_TERCERO ||
                                      R_P1001331_XML.NOM_CAMPO_CIERRA || '';
          
          WHEN '<COD_ACT_TERCERO>' THEN
            P_MEL_XML_POL_P1001331 := P_MEL_XML_POL_P1001331 ||
                                      R_P1001331_XML.NOM_CAMPO_ABRE || '1' ||
                                      R_P1001331_XML.NOM_CAMPO_CIERRA || '';
          
          WHEN '<NOM_TERCERO>' THEN
            P_MEL_XML_POL_P1001331 := P_MEL_XML_POL_P1001331 ||
                                      R_P1001331_XML.NOM_CAMPO_ABRE ||
                                      R_DATOS_NOM_TERCERO_TRN.NOM_TERCERO ||
                                      R_P1001331_XML.NOM_CAMPO_CIERRA || '';
          
          WHEN '<NOM_LOCALIDAD>' THEN
            OPEN C_LOCALIDAD(R_DATOS_TERCERO_TRN.COD_PROV,
                             R_DATOS_TERCERO_TRN.COD_LOCALIDAD);
            FETCH C_LOCALIDAD
              INTO VALOR;
            CLOSE C_LOCALIDAD;
          
            P_MEL_XML_POL_P1001331 := P_MEL_XML_POL_P1001331 ||
                                      R_P1001331_XML.NOM_CAMPO_ABRE ||
                                      VALOR ||
                                      R_P1001331_XML.NOM_CAMPO_CIERRA || '';
          
          WHEN '<COD_PROV>' THEN
            P_MEL_XML_POL_P1001331 := P_MEL_XML_POL_P1001331 ||
                                      R_P1001331_XML.NOM_CAMPO_ABRE ||
                                      R_DATOS_TERCERO_TRN.COD_PROV ||
                                      R_P1001331_XML.NOM_CAMPO_CIERRA || '';
          
          WHEN '<TIP_DOMICILIO_COM>' THEN
            P_MEL_XML_POL_P1001331 := P_MEL_XML_POL_P1001331 ||
                                      R_P1001331_XML.NOM_CAMPO_ABRE || '2' ||
                                      R_P1001331_XML.NOM_CAMPO_CIERRA || '';
          
          WHEN '<NOM_DOMICILIO1>' THEN
            P_MEL_XML_POL_P1001331 := P_MEL_XML_POL_P1001331 ||
                                      R_P1001331_XML.NOM_CAMPO_ABRE ||
                                      R_DATOS_TERCERO_TRN.NOM_DOMICILIO1 ||
                                      R_P1001331_XML.NOM_CAMPO_CIERRA || '';
          
          WHEN '<NOM_DOMICILIO1_COM>' THEN
            P_MEL_XML_POL_P1001331 := P_MEL_XML_POL_P1001331 ||
                                      R_P1001331_XML.NOM_CAMPO_ABRE ||
                                      R_DATOS_TERCERO_TRN.NOM_DOMICILIO1 ||
                                      R_P1001331_XML.NOM_CAMPO_CIERRA || '';
          
          WHEN '<COD_LOCALIDAD_COM>' THEN
            P_MEL_XML_POL_P1001331 := P_MEL_XML_POL_P1001331 ||
                                      R_P1001331_XML.NOM_CAMPO_ABRE ||
                                      R_DATOS_TERCERO_TRN.COD_LOCALIDAD ||
                                      R_P1001331_XML.NOM_CAMPO_CIERRA || '';
          
          WHEN '<COD_LOCALIDAD>' THEN
            P_MEL_XML_POL_P1001331 := P_MEL_XML_POL_P1001331 ||
                                      R_P1001331_XML.NOM_CAMPO_ABRE ||
                                      R_DATOS_TERCERO_TRN.COD_LOCALIDAD ||
                                      R_P1001331_XML.NOM_CAMPO_CIERRA || '';
          
          WHEN '<COD_ESTADO_COM>' THEN
            P_MEL_XML_POL_P1001331 := P_MEL_XML_POL_P1001331 ||
                                      R_P1001331_XML.NOM_CAMPO_ABRE ||
                                      R_DATOS_TERCERO_TRN.COD_ESTADO ||
                                      R_P1001331_XML.NOM_CAMPO_CIERRA || '';
          
          WHEN '<COD_ESTADO>' THEN
            P_MEL_XML_POL_P1001331 := P_MEL_XML_POL_P1001331 ||
                                      R_P1001331_XML.NOM_CAMPO_ABRE ||
                                      R_DATOS_TERCERO_TRN.COD_ESTADO ||
                                      R_P1001331_XML.NOM_CAMPO_CIERRA || '';
          
          WHEN '<FEC_NACIMIENTO>' THEN
            P_MEL_XML_POL_P1001331 := P_MEL_XML_POL_P1001331 ||
                                      R_P1001331_XML.NOM_CAMPO_ABRE ||
                                      TO_CHAR(R_DATOS_TERCERO_TRN.FEC_NACIMIENTO,
                                              'DD/MM/YYYY') ||
                                      R_P1001331_XML.NOM_CAMPO_CIERRA || '';
          
          WHEN '<COD_PROV_COM>' THEN
            P_MEL_XML_POL_P1001331 := P_MEL_XML_POL_P1001331 ||
                                      R_P1001331_XML.NOM_CAMPO_ABRE ||
                                      R_DATOS_TERCERO_TRN.COD_PROV ||
                                      R_P1001331_XML.NOM_CAMPO_CIERRA || '';
          
          WHEN '<NOM_LOCALIDAD_COM>' THEN
            OPEN C_LOCALIDAD(R_DATOS_TERCERO_TRN.COD_PROV,
                             R_DATOS_TERCERO_TRN.COD_LOCALIDAD);
            FETCH C_LOCALIDAD
              INTO VALOR;
            CLOSE C_LOCALIDAD;
          
            P_MEL_XML_POL_P1001331 := P_MEL_XML_POL_P1001331 ||
                                      R_P1001331_XML.NOM_CAMPO_ABRE ||
                                      VALOR ||
                                      R_P1001331_XML.NOM_CAMPO_CIERRA || '';
          
          WHEN '<TLF_NUMERO>' THEN
            P_MEL_XML_POL_P1001331 := P_MEL_XML_POL_P1001331 ||
                                      R_P1001331_XML.NOM_CAMPO_ABRE ||
                                      R_DATOS_TERCERO_TRN.TLF_NUMERO ||
                                      R_P1001331_XML.NOM_CAMPO_CIERRA || '';
          
          WHEN '<TIP_DOMICILIO>' THEN
            P_MEL_XML_POL_P1001331 := P_MEL_XML_POL_P1001331 ||
                                      R_P1001331_XML.NOM_CAMPO_ABRE || '1' ||
                                      R_P1001331_XML.NOM_CAMPO_CIERRA || '';
          
          when '<TXT_AUX1>' then
            p_mel_xml_pol_p1001331 := p_mel_xml_pol_p1001331 ||
                                      r_P1001331_xml.nom_campo_abre ||
                                      R_DATOS_TERCERO_TRN.TXT_AUX1 ||
                                      r_P1001331_xml.nom_campo_cierra || '';
          
          when '<TXT_AUX2>' then
            p_mel_xml_pol_p1001331 := p_mel_xml_pol_p1001331 ||
                                      r_P1001331_xml.nom_campo_abre ||
                                      R_DATOS_TERCERO_TRN.TXT_AUX2 ||
                                      r_P1001331_xml.nom_campo_cierra || '';
          
          when '<EMAIL>' then
            p_mel_xml_pol_p1001331 := p_mel_xml_pol_p1001331 ||
                                      r_P1001331_xml.nom_campo_abre ||
                                      R_DATOS_TERCERO_TRN.Email ||
                                      r_P1001331_xml.nom_campo_cierra || '';
          
        END CASE;
      
      ELSE
      
        P_MEL_XML_POL_P1001331 := P_MEL_XML_POL_P1001331 ||
                                  R_P1001331_XML.NOM_CAMPO_ABRE ||
                                  R_P1001331_XML.VAL_CAMPO ||
                                  R_P1001331_XML.NOM_CAMPO_CIERRA || '';
      END IF;
    
    END LOOP;
  
    P_MEL_XML_POL_P1001331 := P_MEL_XML_POL_P1001331 || '</ROW>';
  
    IF R_DATOS_COT_CAB.COD_DOCUM_ASEG <> R_DATOS_COT_CAB.COD_DOCUM_PROP THEN
    
      OPEN C_DATOS_NOM_TERCERO_TRN(R_DATOS_COT_CAB.COD_DOCUM_PROP);
      FETCH C_DATOS_NOM_TERCERO_TRN
        INTO R_DATOS_NOM_TERCERO_TRN;
      CLOSE C_DATOS_NOM_TERCERO_TRN;
    
      OPEN C_DATOS_TERCERO_TRN(R_DATOS_COT_CAB.COD_DOCUM_PROP);
      FETCH C_DATOS_TERCERO_TRN
        INTO R_DATOS_TERCERO_TRN;
      CLOSE C_DATOS_TERCERO_TRN;
    
      P_MEL_XML_POL_P1001331 := P_MEL_XML_POL_P1001331 || '<ROW NUM="2">';
    
      FOR R_P1001331_XML IN C_GET_PARAM_XML('P1001331') LOOP
      
        IF R_P1001331_XML.MCA_FIJO = 'N' THEN
        
          CASE R_P1001331_XML.NOM_CAMPO_ABRE
          
            WHEN '<FEC_TRATAMIENTO>' THEN
            
              P_MEL_XML_POL_P1001331 := P_MEL_XML_POL_P1001331 ||
                                        R_P1001331_XML.NOM_CAMPO_ABRE ||
                                        TO_CHAR(SYSDATE, 'DD/MM/YYYY') ||
                                        R_P1001331_XML.NOM_CAMPO_CIERRA || '';
            
            WHEN '<COD_DOCUM>' THEN
            
              P_MEL_XML_POL_P1001331 := P_MEL_XML_POL_P1001331 ||
                                        R_P1001331_XML.NOM_CAMPO_ABRE ||
                                        R_DATOS_TERCERO_TRN.COD_DOCUM ||
                                        R_P1001331_XML.NOM_CAMPO_CIERRA || '';
            
            WHEN '<APE1_TERCERO>' THEN
            
              P_MEL_XML_POL_P1001331 := P_MEL_XML_POL_P1001331 ||
                                        R_P1001331_XML.NOM_CAMPO_ABRE ||
                                        R_DATOS_NOM_TERCERO_TRN.APE1_TERCERO ||
                                        R_P1001331_XML.NOM_CAMPO_CIERRA || '';
            
            WHEN '<APE2_TERCERO>' THEN
            
              P_MEL_XML_POL_P1001331 := P_MEL_XML_POL_P1001331 ||
                                        R_P1001331_XML.NOM_CAMPO_ABRE ||
                                        R_DATOS_NOM_TERCERO_TRN.APE2_TERCERO ||
                                        R_P1001331_XML.NOM_CAMPO_CIERRA || '';
            
            WHEN '<COD_ACT_TERCERO>' THEN
              P_MEL_XML_POL_P1001331 := P_MEL_XML_POL_P1001331 ||
                                        R_P1001331_XML.NOM_CAMPO_ABRE || '1' ||
                                        R_P1001331_XML.NOM_CAMPO_CIERRA || '';
            
            WHEN '<NOM_TERCERO>' THEN
              P_MEL_XML_POL_P1001331 := P_MEL_XML_POL_P1001331 ||
                                        R_P1001331_XML.NOM_CAMPO_ABRE ||
                                        R_DATOS_NOM_TERCERO_TRN.NOM_TERCERO ||
                                        R_P1001331_XML.NOM_CAMPO_CIERRA || '';
            
            WHEN '<NOM_LOCALIDAD>' THEN
              OPEN C_LOCALIDAD(R_DATOS_TERCERO_TRN.COD_PROV,
                               R_DATOS_TERCERO_TRN.COD_LOCALIDAD);
              FETCH C_LOCALIDAD
                INTO VALOR;
              CLOSE C_LOCALIDAD;
            
              P_MEL_XML_POL_P1001331 := P_MEL_XML_POL_P1001331 ||
                                        R_P1001331_XML.NOM_CAMPO_ABRE ||
                                        VALOR ||
                                        R_P1001331_XML.NOM_CAMPO_CIERRA || '';
            
            WHEN '<COD_PROV>' THEN
              P_MEL_XML_POL_P1001331 := P_MEL_XML_POL_P1001331 ||
                                        R_P1001331_XML.NOM_CAMPO_ABRE ||
                                        R_DATOS_TERCERO_TRN.COD_PROV ||
                                        R_P1001331_XML.NOM_CAMPO_CIERRA || '';
            
            WHEN '<TIP_DOMICILIO_COM>' THEN
              P_MEL_XML_POL_P1001331 := P_MEL_XML_POL_P1001331 ||
                                        R_P1001331_XML.NOM_CAMPO_ABRE ||
                                        R_DATOS_TERCERO_TRN.NOM_DOMICILIO1 ||
                                        R_P1001331_XML.NOM_CAMPO_CIERRA || '';
            
            WHEN '<NOM_DOMICILIO1>' THEN
              P_MEL_XML_POL_P1001331 := P_MEL_XML_POL_P1001331 ||
                                        R_P1001331_XML.NOM_CAMPO_ABRE ||
                                        R_DATOS_TERCERO_TRN.NOM_DOMICILIO1 ||
                                        R_P1001331_XML.NOM_CAMPO_CIERRA || '';
            
            WHEN '<NOM_DOMICILIO1_COM>' THEN
              P_MEL_XML_POL_P1001331 := P_MEL_XML_POL_P1001331 ||
                                        R_P1001331_XML.NOM_CAMPO_ABRE ||
                                        R_DATOS_TERCERO_TRN.NOM_DOMICILIO1 ||
                                        R_P1001331_XML.NOM_CAMPO_CIERRA || '';
            
            WHEN '<COD_LOCALIDAD_COM>' THEN
              P_MEL_XML_POL_P1001331 := P_MEL_XML_POL_P1001331 ||
                                        R_P1001331_XML.NOM_CAMPO_ABRE ||
                                        R_DATOS_TERCERO_TRN.COD_LOCALIDAD ||
                                        R_P1001331_XML.NOM_CAMPO_CIERRA || '';
            
            WHEN '<COD_LOCALIDAD>' THEN
              P_MEL_XML_POL_P1001331 := P_MEL_XML_POL_P1001331 ||
                                        R_P1001331_XML.NOM_CAMPO_ABRE ||
                                        R_DATOS_TERCERO_TRN.COD_LOCALIDAD ||
                                        R_P1001331_XML.NOM_CAMPO_CIERRA || '';
            
            WHEN '<COD_ESTADO_COM>' THEN
              P_MEL_XML_POL_P1001331 := P_MEL_XML_POL_P1001331 ||
                                        R_P1001331_XML.NOM_CAMPO_ABRE ||
                                        R_DATOS_TERCERO_TRN.COD_ESTADO ||
                                        R_P1001331_XML.NOM_CAMPO_CIERRA || '';
            
            WHEN '<COD_ESTADO>' THEN
              P_MEL_XML_POL_P1001331 := P_MEL_XML_POL_P1001331 ||
                                        R_P1001331_XML.NOM_CAMPO_ABRE ||
                                        R_DATOS_TERCERO_TRN.COD_ESTADO ||
                                        R_P1001331_XML.NOM_CAMPO_CIERRA || '';
            
            WHEN '<FEC_NACIMIENTO>' THEN
              P_MEL_XML_POL_P1001331 := P_MEL_XML_POL_P1001331 ||
                                        R_P1001331_XML.NOM_CAMPO_ABRE ||
                                        TO_CHAR(R_DATOS_TERCERO_TRN.FEC_NACIMIENTO,
                                                'DD/MM/YYYY') ||
                                        R_P1001331_XML.NOM_CAMPO_CIERRA || '';
            
            WHEN '<COD_PROV_COM>' THEN
              P_MEL_XML_POL_P1001331 := P_MEL_XML_POL_P1001331 ||
                                        R_P1001331_XML.NOM_CAMPO_ABRE ||
                                        R_DATOS_TERCERO_TRN.COD_PROV ||
                                        R_P1001331_XML.NOM_CAMPO_CIERRA || '';
            
            WHEN '<NOM_LOCALIDAD_COM>' THEN
              P_MEL_XML_POL_P1001331 := P_MEL_XML_POL_P1001331 ||
                                        R_P1001331_XML.NOM_CAMPO_ABRE ||
                                        R_DATOS_TERCERO_TRN.TLF_NUMERO ||
                                        R_P1001331_XML.NOM_CAMPO_CIERRA || '';
            
            WHEN '<TLF_NUMERO>' THEN
              P_MEL_XML_POL_P1001331 := P_MEL_XML_POL_P1001331 ||
                                        R_P1001331_XML.NOM_CAMPO_ABRE ||
                                        R_DATOS_TERCERO_TRN.TLF_NUMERO ||
                                        R_P1001331_XML.NOM_CAMPO_CIERRA || '';
            
            WHEN '<TIP_DOMICILIO>' THEN
              P_MEL_XML_POL_P1001331 := P_MEL_XML_POL_P1001331 ||
                                        R_P1001331_XML.NOM_CAMPO_ABRE || '1' ||
                                        R_P1001331_XML.NOM_CAMPO_CIERRA || '';
            
            when '<TXT_AUX1>' then
              p_mel_xml_pol_p1001331 := p_mel_xml_pol_p1001331 ||
                                        r_P1001331_xml.nom_campo_abre ||
                                        R_DATOS_TERCERO_TRN.TXT_AUX1 ||
                                        r_P1001331_xml.nom_campo_cierra || '';
            
            when '<TXT_AUX2>' then
              p_mel_xml_pol_p1001331 := p_mel_xml_pol_p1001331 ||
                                        r_P1001331_xml.nom_campo_abre ||
                                        R_DATOS_TERCERO_TRN.TXT_AUX2 ||
                                        r_P1001331_xml.nom_campo_cierra || '';
            
            when '<EMAIL>' then
              p_mel_xml_pol_p1001331 := p_mel_xml_pol_p1001331 ||
                                        r_P1001331_xml.nom_campo_abre ||
                                        R_DATOS_TERCERO_TRN.Email ||
                                        r_P1001331_xml.nom_campo_cierra || '';
            
          END CASE;
        
        ELSE
        
          P_MEL_XML_POL_P1001331 := P_MEL_XML_POL_P1001331 ||
                                    R_P1001331_XML.NOM_CAMPO_ABRE ||
                                    R_P1001331_XML.VAL_CAMPO ||
                                    R_P1001331_XML.NOM_CAMPO_CIERRA || '';
        END IF;
      
      END LOOP;
    
      P_MEL_XML_POL_P1001331 := P_MEL_XML_POL_P1001331 || '</ROW>';
    
    END IF;
  
    P_MEL_XML_POL_P1001331 := P_MEL_XML_POL_P1001331 || '</ROWSET>';
    P_MEL_XML_POL_P1001331 := P_MEL_XML_POL_P1001331 || '</TABLE>';
  
    /**********************************************************************************/
  
    P_MEL_XML_POL_P2000030 := REPLACE(P_MEL_XML_POL_P2000030, '&', '&#x26;');
    P_MEL_XML_POL_P2000031 := REPLACE(P_MEL_XML_POL_P2000031, '&', '&#x26;');
    P_MEL_XML_POL_P2000020 := REPLACE(P_MEL_XML_POL_P2000020, '&', '&#x26;');
    P_MEL_XML_POL_P2000040 := REPLACE(P_MEL_XML_POL_P2000040, '&', '&#x26;');
    P_MEL_XML_POL_P2000060 := REPLACE(P_MEL_XML_POL_P2000060, '&', '&#x26;');
    P_MEL_XML_POL_P1001331 := REPLACE(P_MEL_XML_POL_P1001331, '&', '&#x26;');
    P_MEL_XML_POL_P1001331 := REPLACE(P_MEL_XML_POL_P1001331, '?', '&#xB0;');
  
    P_MEL_XML_POL := '<XML ACCION="P" COD_RAMO="' ||
                     R_DATOS_COT_CAB.COD_RAMO || '" NUM_POLIZA="">';
  
    P_MEL_XML_POL := P_MEL_XML_POL || P_MEL_XML_POL_P2000030 ||
                     P_MEL_XML_POL_P2000031 || P_MEL_XML_POL_P2000020 ||
                     P_MEL_XML_POL_P2000040 || P_MEL_XML_POL_P2000060 ||
                     P_MEL_XML_POL_P1001331 || '</XML>';
  
    INSERT INTO TEMP_TABLA
    VALUES
      (P_MEL_XML_POL, P_NUM_COTIZACION, SYSDATE);
    COMMIT;
  
    P_ERROR := 'N';
  
  EXCEPTION
    WHEN l_error_vigencia THEN
      P_ERROR := 1000;
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE(SQLERRM);
      P_ERROR := SQLERRM;
    
  END P_GENERA_XML;
  ---
  --NALILLO: 24.05.2017 : MODIFICACION A VALIDACION DE POLIZA VIGENTE
  --                      SE CREA FUNCION F_ESTADO_POLIZA()  
  PROCEDURE P_VALIDA_NUM_MATRICULA(VAL_NUM_MATRICULA in VARCHAR2,
                                   P_ERROR           OUT varchar2) IS
  
    CURSOR C_POLIZAS IS
      SELECT *
        FROM (SELECT B.COD_CIA, B.NUM_POLIZA, B.NUM_SPTO
                FROM A2000020_801@ovpro_prd B
               WHERE B.COD_CIA = 1
                 AND B.COD_CAMPO = 'NUM_MATRICULA'
                 AND B.VAL_COR_CAMPO = UPPER(VAL_NUM_MATRICULA)
                 AND B.MCA_BAJA_RIESGO = 'N'
                 AND B.NUM_SPTO =
                     (SELECT MAX(A.NUM_SPTO)
                        FROM A2000020_801@ovpro_prd A
                       WHERE A.COD_CIA = 1
                         AND A.COD_CAMPO = 'NUM_MATRICULA'
                         AND A.VAL_COR_CAMPO = B.VAL_COR_CAMPO
                         AND A.MCA_BAJA_RIESGO = 'N'
                         AND A.NUM_POLIZA = B.NUM_POLIZA)
              UNION
              SELECT B.COD_CIA, B.NUM_POLIZA, NUM_SPTO
                FROM A2000020_802@ovpro_prd B
               WHERE B.COD_CIA = 1
                 AND B.COD_CAMPO = 'NUM_MATRICULA'
                 AND B.VAL_COR_CAMPO = UPPER(VAL_NUM_MATRICULA)
                 AND B.MCA_BAJA_RIESGO = 'N'
                 AND B.NUM_SPTO =
                     (SELECT MAX(A.NUM_SPTO)
                        FROM A2000020_802@ovpro_prd A
                       WHERE A.COD_CIA = 1
                         AND A.COD_CAMPO = 'NUM_MATRICULA'
                         AND A.VAL_COR_CAMPO = B.VAL_COR_CAMPO
                         AND A.MCA_BAJA_RIESGO = 'N'
                         AND A.NUM_POLIZA = B.NUM_POLIZA)
              UNION
              SELECT B.COD_CIA, B.NUM_POLIZA, NUM_SPTO
                FROM A2000020_803@ovpro_prd B
               WHERE B.COD_CIA = 1
                 AND B.COD_CAMPO = 'NUM_MATRICULA'
                 AND B.VAL_COR_CAMPO = UPPER(VAL_NUM_MATRICULA)
                 AND B.MCA_BAJA_RIESGO = 'N'
                 AND B.NUM_SPTO =
                     (SELECT MAX(A.NUM_SPTO)
                        FROM A2000020_803@ovpro_prd A
                       WHERE A.COD_CIA = 1
                         AND A.COD_CAMPO = 'NUM_MATRICULA'
                         AND A.VAL_COR_CAMPO = B.VAL_COR_CAMPO
                         AND A.MCA_BAJA_RIESGO = 'N'
                         AND A.NUM_POLIZA = B.NUM_POLIZA)
              UNION
              SELECT B.COD_CIA, B.NUM_POLIZA, NUM_SPTO
                FROM A2000020_804@ovpro_prd B
               WHERE B.COD_CIA = 1
                 AND B.COD_CAMPO = 'NUM_MATRICULA'
                 AND B.VAL_COR_CAMPO = UPPER(VAL_NUM_MATRICULA)
                 AND B.MCA_BAJA_RIESGO = 'N'
                 AND B.NUM_SPTO =
                     (SELECT MAX(A.NUM_SPTO)
                        FROM A2000020_804@ovpro_prd A
                       WHERE A.COD_CIA = 1
                         AND A.COD_CAMPO = 'NUM_MATRICULA'
                         AND A.VAL_COR_CAMPO = B.VAL_COR_CAMPO
                         AND A.MCA_BAJA_RIESGO = 'N'
                         AND A.NUM_POLIZA = B.NUM_POLIZA)
              UNION
              SELECT B.COD_CIA, B.NUM_POLIZA, NUM_SPTO
                FROM A2000020_808@ovpro_prd B
               WHERE B.COD_CIA = 1
                 AND B.COD_CAMPO = 'NUM_MATRICULA'
                 AND B.VAL_COR_CAMPO = UPPER(VAL_NUM_MATRICULA)
                 AND B.MCA_BAJA_RIESGO = 'N'
                 AND B.NUM_SPTO =
                     (SELECT MAX(A.NUM_SPTO)
                        FROM A2000020_808@ovpro_prd A
                       WHERE A.COD_CIA = 1
                         AND A.COD_CAMPO = 'NUM_MATRICULA'
                         AND A.VAL_COR_CAMPO = B.VAL_COR_CAMPO
                         AND A.MCA_BAJA_RIESGO = 'N'
                         AND A.NUM_POLIZA = B.NUM_POLIZA)
              UNION
              SELECT B.COD_CIA, B.NUM_POLIZA, NUM_SPTO
                FROM A2000020_809@ovpro_prd B
               WHERE B.COD_CIA = 1
                 AND B.COD_CAMPO = 'NUM_MATRICULA'
                 AND B.VAL_COR_CAMPO = UPPER(VAL_NUM_MATRICULA)
                 AND B.MCA_BAJA_RIESGO = 'N'
                 AND B.NUM_SPTO =
                     (SELECT MAX(A.NUM_SPTO)
                        FROM A2000020_809@ovpro_prd A
                       WHERE A.COD_CIA = 1
                         AND A.COD_CAMPO = 'NUM_MATRICULA'
                         AND A.VAL_COR_CAMPO = B.VAL_COR_CAMPO
                         AND A.MCA_BAJA_RIESGO = 'N'
                         AND A.NUM_POLIZA = B.NUM_POLIZA)
              UNION
              SELECT B.COD_CIA, B.NUM_POLIZA, NUM_SPTO
                FROM A2000020_820@ovpro_prd B
               WHERE B.COD_CIA = 1
                 AND B.COD_CAMPO = 'NUM_MATRICULA'
                 AND B.VAL_COR_CAMPO = UPPER(VAL_NUM_MATRICULA)
                 AND B.MCA_BAJA_RIESGO = 'N'
                 AND B.NUM_SPTO =
                     (SELECT MAX(A.NUM_SPTO)
                        FROM A2000020_820@ovpro_prd A
                       WHERE A.COD_CIA = 1
                         AND A.COD_CAMPO = 'NUM_MATRICULA'
                         AND A.VAL_COR_CAMPO = B.VAL_COR_CAMPO
                         AND A.MCA_BAJA_RIESGO = 'N'
                         AND A.NUM_POLIZA = B.NUM_POLIZA)
              UNION
              SELECT B.COD_CIA, B.NUM_POLIZA, NUM_SPTO
                FROM A2000020_901@ovpro_prd B
               WHERE B.COD_CIA = 1
                 AND B.COD_CAMPO = 'NUM_MATRICULA'
                 AND B.VAL_COR_CAMPO = UPPER(VAL_NUM_MATRICULA)
                 AND B.MCA_BAJA_RIESGO = 'N'
                 AND B.NUM_SPTO =
                     (SELECT MAX(A.NUM_SPTO)
                        FROM A2000020_901@ovpro_prd A
                       WHERE A.COD_CIA = 1
                         AND A.COD_CAMPO = 'NUM_MATRICULA'
                         AND A.VAL_COR_CAMPO = B.VAL_COR_CAMPO
                         AND A.MCA_BAJA_RIESGO = 'N'
                         AND A.NUM_POLIZA = B.NUM_POLIZA)
              UNION
              SELECT B.COD_CIA, B.NUM_POLIZA, NUM_SPTO
                FROM A2000020_902@ovpro_prd B
               WHERE B.COD_CIA = 1
                 AND B.COD_CAMPO = 'NUM_MATRICULA'
                 AND B.VAL_COR_CAMPO = UPPER(VAL_NUM_MATRICULA)
                 AND B.MCA_BAJA_RIESGO = 'N'
                 AND B.NUM_SPTO =
                     (SELECT MAX(A.NUM_SPTO)
                        FROM A2000020_902@ovpro_prd A
                       WHERE A.COD_CIA = 1
                         AND A.COD_CAMPO = 'NUM_MATRICULA'
                         AND A.VAL_COR_CAMPO = B.VAL_COR_CAMPO
                         AND A.MCA_BAJA_RIESGO = 'N'
                         AND A.NUM_POLIZA = B.NUM_POLIZA)
              UNION
              SELECT B.COD_CIA, B.NUM_POLIZA, NUM_SPTO
                FROM A2000020_830@ovpro_prd B
               WHERE B.COD_CIA = 1
                 AND B.COD_CAMPO = 'NUM_MATRICULA'
                 AND B.VAL_COR_CAMPO = UPPER(VAL_NUM_MATRICULA)
                 AND B.MCA_BAJA_RIESGO = 'N'
                 AND B.NUM_SPTO =
                     (SELECT MAX(A.NUM_SPTO)
                        FROM A2000020_830@ovpro_prd A
                       WHERE A.COD_CIA = 1
                         AND A.COD_CAMPO = 'NUM_MATRICULA'
                         AND A.VAL_COR_CAMPO = B.VAL_COR_CAMPO
                         AND A.MCA_BAJA_RIESGO = 'N'
                         AND A.NUM_POLIZA = B.NUM_POLIZA));
  
    regs_polizas C_POLIZAS%rowtype;
  
    L_PERDIDA_CIA   BOOLEAN;
    L_BLOQ_CIA      VARCHAR2(2);
    L_ESTADO_POLIZA VARCHAR2(50);
    L_CANT          NUMBER := 0;
  
    --PATENTES DE VEHICULOS REMATADOS POR EL MERCADO ASEGURADOR
    CURSOR c_a2109018(pc_cod_cia       a2109018_mcl.cod_cia@OVPRO_PRD%TYPE,
                      pc_num_matricula a2109018_mcl.matricula@OVPRO_PRD%TYPE) IS
    --
      SELECT matricula
        FROM A2109018_mcl@OVPRO_PRD
       WHERE cod_cia = pc_cod_cia
         AND matricula = pc_num_matricula
         AND mca_inh = 'N';
    --
    reg_g2109018 c_a2109018%ROWTYPE;
  
  BEGIN
  
    /*******  EXISTE POLIZA VIGENTE PARA LA PATENTE? *******/
    FOR regs_polizas IN c_polizas LOOP
      L_ESTADO_POLIZA := F_ESTADO_POLIZA(1,
                                         regs_polizas.num_poliza,
                                         regs_polizas.Num_Spto);
      IF L_ESTADO_POLIZA = 'DOCUMENTO VIGENTE' THEN
        L_CANT := L_CANT + 1;
      END IF;
    END LOOP;
    IF L_CANT > 0 THEN
      P_ERROR := 'S';
    ELSE
      P_ERROR := 'N';
    END IF;
  
    /*******  EXISTE PERDIDA TOTAL CIA *******/
    P_VALIDA_PERDIDA_TOTAL_CIA(VAL_NUM_MATRICULA, L_PERDIDA_CIA);
  
    IF L_PERDIDA_CIA THEN
      P_ERROR := 'P';
    END IF;
  
    /*******  VALIDA BLOQUEO EN CIA ******/
    P_VALIDA_PATENTE_BLOQUEADA(VAL_NUM_MATRICULA, L_BLOQ_CIA);
  
    IF L_BLOQ_CIA != 'N' THEN
      P_ERROR := 'P';
    END IF;
  
    --VEHICULOS REMATADOS POR EL MERCADO ASEGURADOR
    OPEN c_a2109018(1, VAL_NUM_MATRICULA);
    FETCH c_a2109018
      INTO reg_g2109018;
    IF c_a2109018%FOUND THEN
      P_ERROR := 'P';
    END IF;
    CLOSE c_a2109018;
  
  END P_VALIDA_NUM_MATRICULA;
  ---
  /* PROCEDURE P_VALIDA_NUM_MATRICULA(VAL_NUM_MATRICULA in VARCHAR2,
                                     P_ERROR           OUT varchar2) IS
    
     CURSOR EXISTE_TRON_2 IS
      SELECT COUNT(*)
      FROM (SELECT B.COD_CIA, B.NUM_POLIZA, B.NUM_SPTO
             FROM A2000020_801@ovpro_prd B
            WHERE B.COD_CIA = 1
              AND B.COD_CAMPO = 'NUM_MATRICULA'
              AND B.VAL_COR_CAMPO = UPPER(VAL_NUM_MATRICULA)
              AND B.MCA_BAJA_RIESGO = 'N'
           UNION
           SELECT B.COD_CIA,B.NUM_POLIZA, B.NUM_SPTO   
             FROM A2000020_802@ovpro_prd B
           WHERE B.COD_CIA = 1
              AND B.COD_CAMPO = 'NUM_MATRICULA'
              AND B.VAL_COR_CAMPO = UPPER(VAL_NUM_MATRICULA)
              AND B.MCA_BAJA_RIESGO = 'N'
           UNION
           SELECT B.COD_CIA,B.NUM_POLIZA, B.NUM_SPTO
             FROM A2000020_803@ovpro_prd B
            WHERE B.COD_CIA = 1
              AND B.COD_CAMPO = 'NUM_MATRICULA'
              AND B.VAL_COR_CAMPO = UPPER(VAL_NUM_MATRICULA)
              AND B.MCA_BAJA_RIESGO = 'N'
           UNION
           SELECT B.COD_CIA,B.NUM_POLIZA, B.NUM_SPTO
             FROM A2000020_804@ovpro_prd B
            WHERE B.COD_CIA = 1
              AND B.COD_CAMPO = 'NUM_MATRICULA'
              AND B.VAL_COR_CAMPO = UPPER(VAL_NUM_MATRICULA)
              AND B.MCA_BAJA_RIESGO = 'N'
           UNION
           SELECT B.COD_CIA,B.NUM_POLIZA, B.NUM_SPTO
             FROM A2000020_808@ovpro_prd B
            WHERE B.COD_CIA = 1
              AND B.COD_CAMPO = 'NUM_MATRICULA'
              AND B.VAL_COR_CAMPO = UPPER(VAL_NUM_MATRICULA)
              AND B.MCA_BAJA_RIESGO = 'N'
           UNION
           SELECT B.COD_CIA,B.NUM_POLIZA, B.NUM_SPTO
             FROM A2000020_809@ovpro_prd B
            WHERE B.COD_CIA = 1
              AND B.COD_CAMPO = 'NUM_MATRICULA'
              AND B.VAL_COR_CAMPO = UPPER(VAL_NUM_MATRICULA)
              AND B.MCA_BAJA_RIESGO = 'N'
           UNION
           SELECT B.COD_CIA,B.NUM_POLIZA, B.NUM_SPTO
             FROM A2000020_820@ovpro_prd B
            WHERE B.COD_CIA = 1
              AND B.COD_CAMPO = 'NUM_MATRICULA'
              AND B.VAL_COR_CAMPO = UPPER(VAL_NUM_MATRICULA)
              AND B.MCA_BAJA_RIESGO = 'N'
           UNION
           SELECT B.COD_CIA,B.NUM_POLIZA, B.NUM_SPTO
             FROM A2000020_901@ovpro_prd B
           WHERE B.COD_CIA = 1
              AND B.COD_CAMPO = 'NUM_MATRICULA'
              AND B.VAL_COR_CAMPO = UPPER(VAL_NUM_MATRICULA)
              AND B.MCA_BAJA_RIESGO = 'N'
           UNION
           SELECT B.COD_CIA,B.NUM_POLIZA, B.NUM_SPTO
             FROM A2000020_902@ovpro_prd B
            WHERE B.COD_CIA = 1
              AND B.COD_CAMPO = 'NUM_MATRICULA'
              AND B.VAL_COR_CAMPO = UPPER(VAL_NUM_MATRICULA)
              AND B.MCA_BAJA_RIESGO = 'N') B, --TODAS LAS POLIZAS DEL RIESGO VIGENTE
          A2000030@OVPRO_PRD A
     WHERE B.cod_cia = 1
       AND B.COD_CIA = A.COD_CIA
       AND B.NUM_POLIZA = A.NUM_POLIZA
       AND B.NUM_SPTO = A.NUM_SPTO
       --SE OBTIENE EL MAXIMO SUPLEMENTO DE LA POLIZA
       AND a.num_spto = (select MAX(c.num_spto) -- MAXIMO SUPLEMENTO
                           from a2000030@OVPRO_PRD c
                          where c.cod_cia = a.cod_cia
                            and c.num_poliza = a.num_poliza) 
      --SE PREGUNTA POR LAS MARCAS DEL MAX. SUPLEMENTO
       AND a.mca_poliza_anulada = 'N' --QUE LA POLIZA NO ESTE ANULADA
       AND a.fec_vcto_spto >= sysdate --QUE LA FECHA DE VALIDEZ SEA MAYOR O IGUAL A HOY
       AND a.mca_spto_anulado = 'N'   --QUE EL SUPLEMENTO NO SE ENCUENTRE ANULADO
       AND a.mca_spto_tmp = 'N'       --NO SE QUE MARCA ES
       AND A.cod_ramo in (801, 802, 803, 804, 808, 809, 808, 820, 901,902);
  
  \*   SELECT COUNT(*)
    FROM A2000030@OVPRO_PRD a
  WHERE a.cod_cia = 1
      --SE OBTIENE LA POLIZA
     and a.num_poliza in (SELECT NUM_POLIZA
                           FROM A2000020_801@ovpro_prd B
                          WHERE B.COD_CIA = 1
                            AND B.COD_CAMPO = 'NUM_MATRICULA'
                            AND B.VAL_COR_CAMPO = UPPER(VAL_NUM_MATRICULA)
                            AND B.MCA_BAJA_RIESGO = 'N'
                         UNION
                         SELECT A.NUM_POLIZA
                           FROM A2000020_802@ovpro_prd A
                          WHERE A.COD_CAMPO = 'NUM_MATRICULA'
                            AND A.VAL_COR_CAMPO = UPPER(VAL_NUM_MATRICULA)
                            AND A.MCA_BAJA_RIESGO = 'N'
                         UNION
                         SELECT A.NUM_POLIZA
                           FROM A2000020_803@ovpro_prd A
                          WHERE A.COD_CAMPO = 'NUM_MATRICULA'
                            AND A.VAL_COR_CAMPO = UPPER(VAL_NUM_MATRICULA)
                            AND A.MCA_BAJA_RIESGO = 'N'
                         UNION
                         SELECT A.NUM_POLIZA
                           FROM A2000020_808@ovpro_prd A
                          WHERE A.COD_CAMPO = 'NUM_MATRICULA'
                            AND A.VAL_COR_CAMPO = UPPER(VAL_NUM_MATRICULA)
                            AND A.MCA_BAJA_RIESGO = 'N'
                         UNION
                         SELECT A.NUM_POLIZA
                           FROM A2000020_809@ovpro_prd A
                          WHERE A.COD_CAMPO = 'NUM_MATRICULA'
                            AND A.VAL_COR_CAMPO = UPPER(VAL_NUM_MATRICULA)
                            AND A.MCA_BAJA_RIESGO = 'N'
                         UNION
                         SELECT A.NUM_POLIZA
                           FROM A2000020_820@ovpro_prd A
                          WHERE A.COD_CAMPO = 'NUM_MATRICULA'
                            AND A.VAL_COR_CAMPO = UPPER(VAL_NUM_MATRICULA)
                            AND A.MCA_BAJA_RIESGO = 'N'
                         UNION
                         SELECT A.NUM_POLIZA
                           FROM A2000020_901@ovpro_prd A
                          WHERE A.COD_CAMPO = 'NUM_MATRICULA'
                            AND A.VAL_COR_CAMPO = UPPER(VAL_NUM_MATRICULA)
                            AND A.MCA_BAJA_RIESGO = 'N'
                         UNION
                         SELECT A.NUM_POLIZA
                           FROM A2000020_902@ovpro_prd A
                          WHERE A.COD_CAMPO = 'NUM_MATRICULA'
                            AND A.VAL_COR_CAMPO = UPPER(VAL_NUM_MATRICULA)
                            AND A.MCA_BAJA_RIESGO = 'N')
     and a.cod_ramo in (801, 802, 803, 808, 809, 808, 820, 901,902)
     --SE OBTIENE EL MAXIMO SUPLEMENTO DE LA POLIZA
     and a.num_spto = (select MAX(c.num_spto) -- MAXIMO SUPLEMENTO
                         from a2000030@OVPRO_PRD c
                        where c.cod_cia = a.cod_cia
                          and c.num_poliza = a.num_poliza) 
    --SE PREGUNTA POR LAS MARCAS DEL ULTIMO SUPLEMENTO
     and a.mca_poliza_anulada = 'N' --QUE LA POLIZA NO ESTE ANULADA
     and a.fec_vcto_spto >= sysdate --QUE LA FECHA DE VALIDEZ SEA MAYOR O IGUAL A HOY
     and a.mca_spto_anulado = 'N'   --QUE EL SUPLEMENTO NO SE ENCUENTRE ANULADO
     and a.mca_spto_tmp = 'N' ;
  
  *\
     
      CURSOR EXISTE_TRON IS
        SELECT COUNT(*)
          FROM (SELECT 1
                  FROM A2000020_801@OVPRO_PRD A
                 WHERE A.COD_CAMPO = 'NUM_MATRICULA'
                   AND A.VAL_COR_CAMPO = UPPER(VAL_NUM_MATRICULA)
                   AND A.MCA_BAJA_RIESGO = 'N'
                   AND A.NUM_SPTO =
                       (SELECT MAX(B.NUM_SPTO)
                          FROM A2000020_801@OVPRO_PRD B
                         WHERE B.COD_CIA = 1
                           AND B.COD_CAMPO = 'NUM_MATRICULA'
                           AND B.VAL_CAMPO = A.VAL_COR_CAMPO
                           AND B.NUM_POLIZA = A.NUM_POLIZA)
                   AND A.NUM_POLIZA =
                       (SELECT C.NUM_POLIZA
                          FROM A2000030@OVPRO_PRD C
                         WHERE C.COD_CIA = A.COD_CIA
                           AND C.MCA_SPTO_ANULADO = 'N'
                           AND C.MCA_POLIZA_ANULADA = 'N'
                           AND C.NUM_POLIZA = A.NUM_POLIZA
                           AND C.NUM_SPTO = A.NUM_SPTO
                           AND C.FEC_VCTO_SPTO > SYSDATE)
                   AND A.NUM_SPTO = (SELECT MAX(C.NUM_SPTO)
                                       FROM A2000030@OVPRO_PRD C
                                      WHERE C.COD_CIA = A.COD_CIA
                                        AND C.NUM_POLIZA = A.NUM_POLIZA
                                        AND C.MCA_SPTO_ANULADO = 'N'
                                        AND C.MCA_SPTO_TMP = 'N')
                UNION
                SELECT 1
                  FROM A2000020_802@OVPRO_PRD A
                 WHERE A.COD_CAMPO = 'NUM_MATRICULA'
                   AND A.VAL_COR_CAMPO = UPPER(VAL_NUM_MATRICULA)
                   AND A.MCA_BAJA_RIESGO = 'N'
                   AND A.NUM_SPTO =
                       (SELECT MAX(B.NUM_SPTO)
                          FROM A2000020_802@OVPRO_PRD B
                         WHERE B.COD_CIA = 1
                           AND B.COD_CAMPO = 'NUM_MATRICULA'
                           AND B.VAL_CAMPO = A.VAL_COR_CAMPO
                           AND B.NUM_POLIZA = A.NUM_POLIZA)
                   AND A.NUM_POLIZA =
                       (SELECT C.NUM_POLIZA
                          FROM A2000030@OVPRO_PRD C
                         WHERE C.COD_CIA = A.COD_CIA
                           AND C.MCA_SPTO_ANULADO = 'N'
                           AND C.MCA_POLIZA_ANULADA = 'N'
                           AND C.NUM_POLIZA = A.NUM_POLIZA
                           AND C.NUM_SPTO = A.NUM_SPTO
                           AND C.FEC_VCTO_SPTO > SYSDATE)
                   AND A.NUM_SPTO = (SELECT MAX(C.NUM_SPTO)
                                       FROM A2000030@OVPRO_PRD C
                                      WHERE C.COD_CIA = A.COD_CIA
                                        AND C.NUM_POLIZA = A.NUM_POLIZA
                                        AND C.MCA_SPTO_ANULADO = 'N'
                                        AND C.MCA_SPTO_TMP = 'N')
                UNION
                SELECT 1
                  FROM A2000020_803@OVPRO_PRD A
                 WHERE A.COD_CAMPO = 'NUM_MATRICULA'
                   AND A.VAL_COR_CAMPO = UPPER(VAL_NUM_MATRICULA)
                   AND A.MCA_BAJA_RIESGO = 'N'
                   AND A.NUM_SPTO =
                       (SELECT MAX(B.NUM_SPTO)
                          FROM A2000020_803@OVPRO_PRD B
                         WHERE B.COD_CIA = 1
                           AND B.COD_CAMPO = 'NUM_MATRICULA'
                           AND B.VAL_CAMPO = A.VAL_COR_CAMPO
                           AND B.NUM_POLIZA = A.NUM_POLIZA)
                   AND A.NUM_POLIZA =
                       (SELECT C.NUM_POLIZA
                          FROM A2000030@OVPRO_PRD C
                         WHERE C.COD_CIA = A.COD_CIA
                           AND C.MCA_SPTO_ANULADO = 'N'
                           AND C.MCA_POLIZA_ANULADA = 'N'
                           AND C.NUM_POLIZA = A.NUM_POLIZA
                           AND C.NUM_SPTO = A.NUM_SPTO
                           AND C.FEC_VCTO_SPTO > SYSDATE)
                   AND A.NUM_SPTO = (SELECT MAX(C.NUM_SPTO)
                                       FROM A2000030@OVPRO_PRD C
                                      WHERE C.COD_CIA = A.COD_CIA
                                        AND C.NUM_POLIZA = A.NUM_POLIZA
                                        AND C.MCA_SPTO_ANULADO = 'N'
                                        AND C.MCA_SPTO_TMP = 'N')
                UNION
                SELECT 1
                  FROM A2000020_804@OVPRO_PRD A
                 WHERE A.COD_CAMPO = 'NUM_MATRICULA'
                   AND A.VAL_COR_CAMPO = UPPER(VAL_NUM_MATRICULA)
                   AND A.MCA_BAJA_RIESGO = 'N'
                   AND A.NUM_SPTO =
                       (SELECT MAX(B.NUM_SPTO)
                          FROM A2000020_804@OVPRO_PRD B
                         WHERE B.COD_CIA = 1
                           AND B.COD_CAMPO = 'NUM_MATRICULA'
                           AND B.VAL_CAMPO = A.VAL_COR_CAMPO
                           AND B.NUM_POLIZA = A.NUM_POLIZA)
                   AND A.NUM_POLIZA =
                       (SELECT C.NUM_POLIZA
                          FROM A2000030@OVPRO_PRD C
                         WHERE C.COD_CIA = A.COD_CIA
                           AND C.MCA_SPTO_ANULADO = 'N'
                           AND C.MCA_POLIZA_ANULADA = 'N'
                           AND C.NUM_POLIZA = A.NUM_POLIZA
                           AND C.NUM_SPTO = A.NUM_SPTO
                           AND C.FEC_VCTO_SPTO > SYSDATE)
                   AND A.NUM_SPTO = (SELECT MAX(C.NUM_SPTO)
                                       FROM A2000030@OVPRO_PRD C
                                      WHERE C.COD_CIA = A.COD_CIA
                                        AND C.NUM_POLIZA = A.NUM_POLIZA
                                        AND C.MCA_SPTO_ANULADO = 'N'
                                        AND C.MCA_SPTO_TMP = 'N')                        
                UNION
                SELECT 1
                  FROM A2000020_809@OVPRO_PRD A
                 WHERE A.COD_CAMPO = 'NUM_MATRICULA'
                   AND A.VAL_COR_CAMPO = UPPER(VAL_NUM_MATRICULA)
                   AND A.MCA_BAJA_RIESGO = 'N'
                   AND A.NUM_SPTO =
                       (SELECT MAX(B.NUM_SPTO)
                          FROM A2000020_809@OVPRO_PRD B
                         WHERE B.COD_CIA = 1
                           AND B.COD_CAMPO = 'NUM_MATRICULA'
                           AND B.VAL_CAMPO = A.VAL_COR_CAMPO
                           AND B.NUM_POLIZA = A.NUM_POLIZA)
                   AND A.NUM_POLIZA =
                       (SELECT C.NUM_POLIZA
                          FROM A2000030@OVPRO_PRD C
                         WHERE C.COD_CIA = A.COD_CIA
                           AND C.MCA_SPTO_ANULADO = 'N'
                           AND C.MCA_POLIZA_ANULADA = 'N'
                           AND C.NUM_POLIZA = A.NUM_POLIZA
                           AND C.NUM_SPTO = A.NUM_SPTO
                           AND C.FEC_VCTO_SPTO > SYSDATE)
                   AND A.NUM_SPTO = (SELECT MAX(C.NUM_SPTO)
                                       FROM A2000030@OVPRO_PRD C
                                      WHERE C.COD_CIA = A.COD_CIA
                                        AND C.NUM_POLIZA = A.NUM_POLIZA
                                        AND C.MCA_SPTO_ANULADO = 'N'
                                        AND C.MCA_SPTO_TMP = 'N')
                UNION
                SELECT 1
                  FROM A2000020_901@OVPRO_PRD A
                 WHERE A.COD_CAMPO = 'NUM_MATRICULA'
                   AND A.VAL_COR_CAMPO = UPPER(VAL_NUM_MATRICULA)
                   AND A.MCA_BAJA_RIESGO = 'N'
                   AND A.NUM_SPTO =
                       (SELECT MAX(B.NUM_SPTO)
                          FROM A2000020_901@OVPRO_PRD B
                         WHERE B.COD_CIA = 1
                           AND B.COD_CAMPO = 'NUM_MATRICULA'
                           AND B.VAL_CAMPO = A.VAL_COR_CAMPO
                           AND B.NUM_POLIZA = A.NUM_POLIZA)
                   AND A.NUM_POLIZA =
                       (SELECT C.NUM_POLIZA
                          FROM A2000030@OVPRO_PRD C
                         WHERE C.COD_CIA = A.COD_CIA
                           AND C.MCA_SPTO_ANULADO = 'N'
                           AND C.MCA_POLIZA_ANULADA = 'N'
                           AND C.NUM_POLIZA = A.NUM_POLIZA
                           AND C.NUM_SPTO = A.NUM_SPTO
                           AND C.FEC_VCTO_SPTO > SYSDATE)
                   AND A.NUM_SPTO = (SELECT MAX(C.NUM_SPTO)
                                       FROM A2000030@OVPRO_PRD C
                                      WHERE C.COD_CIA = A.COD_CIA
                                        AND C.NUM_POLIZA = A.NUM_POLIZA
                                        AND C.MCA_SPTO_ANULADO = 'N'
                                        AND C.MCA_SPTO_TMP = 'N')
                UNION
                SELECT 1
                  FROM A2000020_902@OVPRO_PRD A
                 WHERE A.COD_CAMPO = 'NUM_MATRICULA'
                   AND A.VAL_COR_CAMPO = UPPER(VAL_NUM_MATRICULA)
                   AND A.MCA_BAJA_RIESGO = 'N'
                   AND A.NUM_SPTO =
                       (SELECT MAX(B.NUM_SPTO)
                          FROM A2000020_902@OVPRO_PRD B
                         WHERE B.COD_CIA = 1
                           AND B.COD_CAMPO = 'NUM_MATRICULA'
                           AND B.VAL_CAMPO = A.VAL_COR_CAMPO
                           AND B.NUM_POLIZA = A.NUM_POLIZA)
                   AND A.NUM_POLIZA =
                       (SELECT C.NUM_POLIZA
                          FROM A2000030@OVPRO_PRD C
                         WHERE C.COD_CIA = A.COD_CIA
                           AND C.MCA_SPTO_ANULADO = 'N'
                           AND C.MCA_POLIZA_ANULADA = 'N'
                           AND C.NUM_POLIZA = A.NUM_POLIZA
                           AND C.NUM_SPTO = A.NUM_SPTO
                           AND C.FEC_VCTO_SPTO > SYSDATE)
                   AND A.NUM_SPTO = (SELECT MAX(C.NUM_SPTO)
                                       FROM A2000030@OVPRO_PRD C
                                      WHERE C.COD_CIA = A.COD_CIA
                                        AND C.NUM_POLIZA = A.NUM_POLIZA
                                        AND C.MCA_SPTO_ANULADO = 'N'
                                        AND C.MCA_SPTO_TMP = 'N')
                UNION
                SELECT 1
                  FROM A2000020_808@OVPRO_PRD A
                 WHERE A.COD_CAMPO = 'NUM_MATRICULA'
                   AND A.VAL_COR_CAMPO = UPPER(VAL_NUM_MATRICULA)
                   AND A.MCA_BAJA_RIESGO = 'N'
                   AND A.NUM_SPTO =
                       (SELECT MAX(B.NUM_SPTO)
                          FROM A2000020_808@OVPRO_PRD B
                         WHERE B.COD_CIA = 1
                           AND B.COD_CAMPO = 'NUM_MATRICULA'
                           AND B.VAL_CAMPO = A.VAL_COR_CAMPO
                           AND B.NUM_POLIZA = A.NUM_POLIZA)
                   AND A.NUM_POLIZA =
                       (SELECT C.NUM_POLIZA
                          FROM A2000030@OVPRO_PRD C
                         WHERE C.COD_CIA = A.COD_CIA
                           AND C.MCA_SPTO_ANULADO = 'N'
                           AND C.MCA_POLIZA_ANULADA = 'N'
                           AND C.NUM_POLIZA = A.NUM_POLIZA
                           AND C.NUM_SPTO = A.NUM_SPTO
                           AND C.FEC_VCTO_SPTO > SYSDATE)
                   AND A.NUM_SPTO = (SELECT MAX(C.NUM_SPTO)
                                       FROM A2000030@OVPRO_PRD C
                                      WHERE C.COD_CIA = A.COD_CIA
                                        AND C.NUM_POLIZA = A.NUM_POLIZA
                                        AND C.MCA_SPTO_ANULADO = 'N'
                                        AND C.MCA_SPTO_TMP = 'N')
                UNION
                SELECT 1
                  FROM A2000020_820@OVPRO_PRD A
                 WHERE A.COD_CAMPO = 'NUM_MATRICULA'
                   AND A.VAL_COR_CAMPO = UPPER(VAL_NUM_MATRICULA)
                   AND A.MCA_BAJA_RIESGO = 'N'
                   AND A.NUM_SPTO =
                       (SELECT MAX(B.NUM_SPTO)
                          FROM A2000020_820@OVPRO_PRD B
                         WHERE B.COD_CIA = 1
                           AND B.COD_CAMPO = 'NUM_MATRICULA'
                           AND B.VAL_CAMPO = A.VAL_COR_CAMPO
                           AND B.NUM_POLIZA = A.NUM_POLIZA)
                   AND A.NUM_POLIZA =
                       (SELECT C.NUM_POLIZA
                          FROM A2000030@OVPRO_PRD C
                         WHERE C.COD_CIA = A.COD_CIA
                           AND C.MCA_SPTO_ANULADO = 'N'
                           AND C.MCA_POLIZA_ANULADA = 'N'
                           AND C.NUM_POLIZA = A.NUM_POLIZA
                           AND C.NUM_SPTO = A.NUM_SPTO
                           AND C.FEC_VCTO_SPTO > SYSDATE)
                   AND A.NUM_SPTO = (SELECT MAX(C.NUM_SPTO)
                                       FROM A2000030@OVPRO_PRD C
                                      WHERE C.COD_CIA = A.COD_CIA
                                        AND C.NUM_POLIZA = A.NUM_POLIZA
                                        AND C.MCA_SPTO_ANULADO = 'N'
                                        AND C.MCA_SPTO_TMP = 'N'));
    
      CURSOR VALIDA_POLIZA IS
        SELECT a.num_poliza
          FROM A2000020@OVPRO_PRD e,
               A2000030@OVPRO_PRD a,
               a1001399@OVPRO_PRD b
         WHERE e.val_cor_campo = VAL_NUM_MATRICULA
           and e.cod_campo = 'NUM_MATRICULA'
           and e.mca_vigente = 'S'
           and e.cod_cia = 1
           and e.num_riesgo =
               (select MAX(j.num_riesgo)
                  from a2000020@OVPRO_PRD j
                 where j.val_cor_campo = VAL_NUM_MATRICULA
                   and j.cod_campo = 'NUM_MATRICULA'
                   and j.mca_vigente = 'S'
                   and j.cod_cia = 1
                   and j.num_poliza = e.num_poliza)
           and a.cod_cia = e.COD_CIA
           and a.num_poliza = e.num_poliza
           and a.mca_poliza_anulada = 'N'
              --and a.mca_provisional = 'N'
           and a.fec_vcto_spto >= sysdate
           and a.mca_spto_anulado = 'N'
           and a.mca_spto_tmp = 'N'
           and a.cod_ramo in (801, 802, 803, 808, 809, 808, 820, 901,902, 804)
           and a.num_spto = (select MAX(c.num_spto)
                               from a2000030@OVPRO_PRD c
                              where c.cod_cia = a.cod_cia
                                and c.num_poliza = a.num_poliza
                                and c.mca_spto_anulado = 'N'
                                and c.mca_spto_tmp = 'N')
           and b.cod_cia = 1
           AND b.tip_docum = a.tip_docum
           and b.cod_docum = a.cod_docum;
    
      EXISTE_DATO     BOOLEAN;
      EXISTE_TRONADOR NUMBER;    
      EXISTE_TRONADOR_2 NUMBER;
      
      c_valida_poliza VALIDA_POLIZA %ROWTYPE;
    
      L_PERDIDA_CIA BOOLEAN;
      L_BLOQ_CIA    VARCHAR2(2);
    
      --PATENTES DE VEHICULOS REMATADOS POR EL MERCADO ASEGURADOR
      CURSOR c_a2109018(pc_cod_cia       a2109018_mcl.cod_cia@OVPRO_PRD%TYPE,
                        pc_num_matricula a2109018_mcl.matricula@OVPRO_PRD%TYPE) IS
      --
        SELECT matricula
          FROM A2109018_mcl@OVPRO_PRD
         WHERE cod_cia = pc_cod_cia
           AND matricula = pc_num_matricula
           AND mca_inh = 'N';
      --
      reg_g2109018 c_a2109018%ROWTYPE;
    
    BEGIN
    
      \*********  EXISTE POLIZA VIGENTE EN LA CIA  ***********\
    
      OPEN EXISTE_TRON;
      FETCH EXISTE_TRON
        INTO EXISTE_TRONADOR;
      CLOSE EXISTE_TRON;
    
      IF (EXISTE_TRONADOR > 0) THEN
      
        OPEN VALIDA_POLIZA;
        FETCH VALIDA_POLIZA
          INTO c_valida_poliza;
        EXISTE_DATO := VALIDA_POLIZA%FOUND;
        CLOSE VALIDA_POLIZA;
      
        IF EXISTE_DATO THEN
          P_ERROR := 'S';
        ELSE
          P_ERROR := 'N';
        END IF;
      
      ELSE
        P_ERROR := 'N';
      END IF;
      
      IF P_ERROR = 'N' THEN
      
      OPEN EXISTE_TRON_2;
      FETCH EXISTE_TRON_2
        INTO EXISTE_TRONADOR_2;
      CLOSE EXISTE_TRON_2;
    
      IF (EXISTE_TRONADOR_2 > 0) THEN
         P_ERROR := 'S';
      END IF;
  
      END IF;
      \********************\
    
      \*******  EXISTE PERDIDA TOTAL CIA *******\
    
      P_VALIDA_PERDIDA_TOTAL_CIA(VAL_NUM_MATRICULA, L_PERDIDA_CIA);
    
      IF L_PERDIDA_CIA THEN
        P_ERROR := 'P';
      END IF;
    
      \*********\
    
      \*******  VALIDA BLOQUEO EN CIA ******\
      P_VALIDA_PATENTE_BLOQUEADA(VAL_NUM_MATRICULA, L_BLOQ_CIA);
    
      IF L_BLOQ_CIA != 'N' THEN
        P_ERROR := 'P';
      END IF;
      \*********\
    
      --VEHICULOS REMATADOS POR EL MERCADO ASEGURADOR
      OPEN c_a2109018(1, VAL_NUM_MATRICULA);
      FETCH c_a2109018
        INTO reg_g2109018;
      IF c_a2109018%FOUND THEN
        P_ERROR := 'P';
      END IF;
      CLOSE c_a2109018;
    
    END P_VALIDA_NUM_MATRICULA;
  */
  /**************************************/

  /* PROCEDURE P_VALIDA_NUM_MATRICULA_ANTIGUO(VAL_NUM_MATRICULA IN VARCHAR2,
                                   P_ERROR           OUT VARCHAR2) IS
  
    CURSOR EXISTE_TRON IS
      SELECT COUNT(*)
        FROM (SELECT 1
                FROM A2000020_801@OVPRO_PRD A
               WHERE A.VAL_COR_CAMPO = VAL_NUM_MATRICULA
                 AND A.COD_CAMPO = 'NUM_MATRICULA'
                 AND A.MCA_VIGENTE = 'S'
                 AND A.MCA_BAJA_RIESGO = 'N'
                 AND A.NUM_POLIZA IN
                     (SELECT NUM_POLIZA
                        FROM A2000030@OVPRO_PRD B
                       WHERE B.COD_CIA = 1
                         AND B.NUM_POLIZA = A.NUM_POLIZA
                         AND B.NUM_SPTO =
                             (SELECT MAX(C.NUM_SPTO)
                                FROM A2000030@OVPRO_PRD C
                               WHERE B.COD_CIA = C.COD_CIA
                                 AND C.NUM_POLIZA = B.NUM_POLIZA)
                         AND B.MCA_POLIZA_ANULADA = 'N'
                         AND B.FEC_VCTO_SPTO > SYSDATE)
              UNION
              SELECT 1
                FROM A2000020_802@OVPRO_PRD A
               WHERE A.VAL_COR_CAMPO = VAL_NUM_MATRICULA
                 AND A.COD_CAMPO = 'NUM_MATRICULA'
                 AND A.MCA_VIGENTE = 'S'
                 AND A.MCA_BAJA_RIESGO = 'N'
                 AND A.NUM_POLIZA IN
                     (SELECT NUM_POLIZA
                        FROM A2000030@OVPRO_PRD B
                       WHERE B.COD_CIA = 1
                         AND B.NUM_POLIZA = A.NUM_POLIZA
                         AND B.NUM_SPTO =
                             (SELECT MAX(C.NUM_SPTO)
                                FROM A2000030@OVPRO_PRD C
                               WHERE B.COD_CIA = C.COD_CIA
                                 AND C.NUM_POLIZA = B.NUM_POLIZA)
                         AND B.MCA_POLIZA_ANULADA = 'N'
                         AND B.FEC_VCTO_SPTO > SYSDATE)
              UNION
              SELECT 1
                FROM A2000020_803@OVPRO_PRD A
               WHERE A.VAL_COR_CAMPO = VAL_NUM_MATRICULA
                 AND A.COD_CAMPO = 'NUM_MATRICULA'
                 AND A.MCA_VIGENTE = 'S'
                 AND A.MCA_BAJA_RIESGO = 'N'
                 AND A.NUM_POLIZA IN
                     (SELECT NUM_POLIZA
                        FROM A2000030@OVPRO_PRD B
                       WHERE B.COD_CIA = 1
                         AND B.NUM_POLIZA = A.NUM_POLIZA
                         AND B.NUM_SPTO =
                             (SELECT MAX(C.NUM_SPTO)
                                FROM A2000030@OVPRO_PRD C
                               WHERE B.COD_CIA = C.COD_CIA
                                 AND C.NUM_POLIZA = B.NUM_POLIZA)
                         AND B.MCA_POLIZA_ANULADA = 'N'
                         AND B.FEC_VCTO_SPTO > SYSDATE)
              UNION
              SELECT 1
                FROM A2000020_901@OVPRO_PRD A
               WHERE A.VAL_COR_CAMPO = VAL_NUM_MATRICULA
                 AND A.COD_CAMPO = 'NUM_MATRICULA'
                 AND A.MCA_VIGENTE = 'S'
                 AND A.MCA_BAJA_RIESGO = 'N'
                 AND A.NUM_POLIZA IN
                     (SELECT NUM_POLIZA
                        FROM A2000030@OVPRO_PRD B
                       WHERE B.COD_CIA = 1
                         AND B.NUM_POLIZA = A.NUM_POLIZA
                         AND B.NUM_SPTO =
                             (SELECT MAX(C.NUM_SPTO)
                                FROM A2000030@OVPRO_PRD C
                               WHERE B.COD_CIA = C.COD_CIA
                                 AND C.NUM_POLIZA = B.NUM_POLIZA)
                         AND B.MCA_POLIZA_ANULADA = 'N'
                         AND B.FEC_VCTO_SPTO > SYSDATE)
              UNION
              SELECT 1
                FROM A2000020_902@OVPRO_PRD A
               WHERE A.VAL_COR_CAMPO = VAL_NUM_MATRICULA
                 AND A.COD_CAMPO = 'NUM_MATRICULA'
                 AND A.MCA_VIGENTE = 'S'
                 AND A.MCA_BAJA_RIESGO = 'N'
                 AND A.NUM_POLIZA IN
                     (SELECT NUM_POLIZA
                        FROM A2000030@OVPRO_PRD B
                       WHERE B.COD_CIA = 1
                         AND B.NUM_POLIZA = A.NUM_POLIZA
                         AND B.NUM_SPTO =
                             (SELECT MAX(C.NUM_SPTO)
                                FROM A2000030@OVPRO_PRD C
                               WHERE B.COD_CIA = C.COD_CIA
                                 AND C.NUM_POLIZA = B.NUM_POLIZA)
                         AND B.MCA_POLIZA_ANULADA = 'N'
                         AND B.FEC_VCTO_SPTO > SYSDATE)
              UNION
              SELECT 1
                FROM A2000020_808@OVPRO_PRD A
               WHERE A.VAL_COR_CAMPO = VAL_NUM_MATRICULA
                 AND A.COD_CAMPO = 'NUM_MATRICULA'
                 AND A.MCA_VIGENTE = 'S'
                 AND A.MCA_BAJA_RIESGO = 'N'
                 AND A.NUM_POLIZA IN
                     (SELECT NUM_POLIZA
                        FROM A2000030@OVPRO_PRD B
                       WHERE B.COD_CIA = 1
                         AND B.NUM_POLIZA = A.NUM_POLIZA
                         AND B.NUM_SPTO =
                             (SELECT MAX(C.NUM_SPTO)
                                FROM A2000030@OVPRO_PRD C
                               WHERE B.COD_CIA = C.COD_CIA
                                 AND C.NUM_POLIZA = B.NUM_POLIZA)
                         AND B.MCA_POLIZA_ANULADA = 'N'
                         AND B.FEC_VCTO_SPTO > SYSDATE)
              UNION
              SELECT 1
                FROM A2000020_809@OVPRO_PRD A
               WHERE A.VAL_COR_CAMPO = VAL_NUM_MATRICULA
                 AND A.COD_CAMPO = 'NUM_MATRICULA'
                 AND A.MCA_VIGENTE = 'S'
                 AND A.MCA_BAJA_RIESGO = 'N'
                 AND A.NUM_POLIZA IN
                     (SELECT NUM_POLIZA
                        FROM A2000030@OVPRO_PRD B
                       WHERE B.COD_CIA = 1
                         AND B.NUM_POLIZA = A.NUM_POLIZA
                         AND B.NUM_SPTO =
                             (SELECT MAX(C.NUM_SPTO)
                                FROM A2000030@OVPRO_PRD C
                               WHERE B.COD_CIA = C.COD_CIA
                                 AND C.NUM_POLIZA = B.NUM_POLIZA)
                         AND B.MCA_POLIZA_ANULADA = 'N'
                         AND B.FEC_VCTO_SPTO > SYSDATE));
  
    CURSOR VALIDA_POLIZA IS
      SELECT A.NUM_POLIZA
        FROM A2000020@OVPRO_PRD E,
             A2000030@OVPRO_PRD A,
             A1001399@OVPRO_PRD B
       WHERE E.VAL_COR_CAMPO = VAL_NUM_MATRICULA
         AND E.COD_CAMPO = 'NUM_MATRICULA'
         AND E.MCA_VIGENTE = 'S'
         AND E.COD_CIA = 1
         AND E.NUM_RIESGO =
             (SELECT MAX(J.NUM_RIESGO)
                FROM A2000020@OVPRO_PRD J
               WHERE J.VAL_COR_CAMPO = VAL_NUM_MATRICULA
                 AND J.COD_CAMPO = 'NUM_MATRICULA'
                 AND J.MCA_VIGENTE = 'S'
                 AND J.COD_CIA = 1
                 AND J.NUM_POLIZA = E.NUM_POLIZA)
         AND A.COD_CIA = E.COD_CIA
         AND A.NUM_POLIZA = E.NUM_POLIZA
         AND A.MCA_POLIZA_ANULADA = 'N'
            --AND A.MCA_PROVISIONAL = 'N'
         AND A.FEC_VCTO_SPTO >= SYSDATE
         AND A.MCA_SPTO_ANULADO = 'N'
         AND A.MCA_SPTO_TMP = 'N'
         AND A.COD_RAMO IN (801, 802, 803, 901, 902, 808)
         AND A.NUM_SPTO = (SELECT MAX(C.NUM_SPTO)
                             FROM A2000030@OVPRO_PRD C
                            WHERE C.COD_CIA = A.COD_CIA
                              AND C.NUM_POLIZA = A.NUM_POLIZA
                              AND C.MCA_SPTO_ANULADO = 'N'
                              AND C.MCA_SPTO_TMP = 'N')
         AND B.COD_CIA = 1
         AND B.TIP_DOCUM = A.TIP_DOCUM
         AND B.COD_DOCUM = A.COD_DOCUM;
  
    EXISTE_DATO     BOOLEAN;
    EXISTE_TRONADOR NUMBER;
    C_VALIDA_POLIZA VALIDA_POLIZA %ROWTYPE;
  
    L_PERDIDA_CIA BOOLEAN;
  
    CURSOR c_a2109018(pc_cod_cia       a2109018_mcl.cod_cia@ovpro_prd%TYPE,
                      pc_num_matricula a2109018_mcl.matricula@ovpro_prd%TYPE) IS
    --
      SELECT matricula
        FROM A2109018_mcl@ovpro_prd
       WHERE cod_cia = pc_cod_cia
         AND matricula = pc_num_matricula
         AND mca_inh = 'N';
    --
    reg_g2109018 c_a2109018%ROWTYPE;
  
  BEGIN
  
    /*********  EXISTE POLIZA VIGENTE EN LA CIA  **********
  
    OPEN EXISTE_TRON;
    FETCH EXISTE_TRON
      INTO EXISTE_TRONADOR;
    CLOSE EXISTE_TRON;
  
    IF (EXISTE_TRONADOR > 0) THEN
    
      OPEN VALIDA_POLIZA;
      FETCH VALIDA_POLIZA
        INTO C_VALIDA_POLIZA;
      EXISTE_DATO := VALIDA_POLIZA%FOUND;
      CLOSE VALIDA_POLIZA;
    
      IF EXISTE_DATO THEN
        P_ERROR := 'S';
      ELSE
        P_ERROR := 'N';
      END IF;
    
    ELSE
      P_ERROR := 'N';
    END IF;
  
    /********************/

  /*******  EXISTE PERDIDA TOTAL CIA ******
  
    P_VALIDA_PERDIDA_TOTAL_CIA(VAL_NUM_MATRICULA, L_PERDIDA_CIA);
  
    IF L_PERDIDA_CIA THEN
      P_ERROR := 'P';
    END IF;
  
    /********
  
    OPEN c_a2109018(1, VAL_NUM_MATRICULA);
    FETCH c_a2109018
      INTO reg_g2109018;
    IF c_a2109018%FOUND THEN
      P_ERROR := 'P';
    END IF;
    CLOSE c_a2109018;
  
  END P_VALIDA_NUM_MATRICULA_ANTIGUO;
  */

  /**************************************/

  PROCEDURE P_BUSCA_PERDIDA_TOTAL(P_NUM_MATRICULA VARCHAR2,
                                  P_PERDIDA_TOTAL OUT VARCHAR2) IS
  
  BEGIN
  
    P_PERDIDA_TOTAL := 'N';
  
    MEL_K_SINIESTRALIDAD.P_XML_PATENTE_PERDIDA(P_NUM_MATRICULA,
                                               P_PERDIDA_TOTAL);
  
    TRN_K_GLOBAL.BORRA_TODAS@OVPRO_PRD;
  
    TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('DVPERD_TOTAL', NULL);
  
    P_PERDIDA_TOTAL := EA_F_SINIESTRO_PTOTAL_MCL@OVPRO_PRD(P_NUM_MATRICULA);
  
    --P_PERDIDA_TOTAL := '0';
  
  END P_BUSCA_PERDIDA_TOTAL;

  /**************************************/

  PROCEDURE P_VALIDA_PERDIDA_TOTAL_CIA(P_NUM_MATRICULA     VARCHAR2,
                                       P_PERDIDA_TOTAL_CIA OUT BOOLEAN) IS
  BEGIN
  
    TRN_K_GLOBAL.BORRA_TODAS@OVPRO_PRD;
  
    TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('COD_CIA', 1);
  
    P_PERDIDA_TOTAL_CIA := EM_F_ES_PERDIDA_TOTAL@OVPRO_PRD(P_NUM_MATRICULA);
  
  END P_VALIDA_PERDIDA_TOTAL_CIA;

  /**************************************/

  PROCEDURE P_BUSCA_RC_EXCESO(P_COD_RAMO      VARCHAR2,
                              P_COD_COB       VARCHAR2,
                              P_COD_MODALIDAD VARCHAR2,
                              P_COD_DOCUM     VARCHAR2,
                              P_COD_CONV      VARCHAR2,
                              P_MONTO         OUT NUMBER) IS
  
    L_MONTO number;
  
  BEGIN
  
    P_MONTO := 0;
  
    IF P_COD_COB != '0' THEN
    
      IF (P_COD_COB = '8200' or P_COD_COB = '8202') AND
         P_COD_MODALIDAD IN (8000, 8003, 8005, 8010, 8900, 8910) THEN
      
        P_BUSCA_MONTO_COB_CONV_OPC(P_COD_RAMO,
                                   P_COD_COB,
                                   P_COD_MODALIDAD,
                                   P_COD_DOCUM,
                                   P_COD_CONV,
                                   L_MONTO);
      
        IF L_MONTO IS NOT NULL THEN
        
          P_MONTO := P_MONTO + L_MONTO;
        
        ELSE
        
          P_MONTO := 1;
        
        END IF;
      
      END IF;
    
      IF (P_COD_COB = '8201' or P_COD_COB = '8203') AND
         P_COD_MODALIDAD IN (8000, 8003, 8005, 8010, 8900, 8910) THEN
      
        P_BUSCA_MONTO_COB_CONV_OPC(P_COD_RAMO,
                                   P_COD_COB,
                                   P_COD_MODALIDAD,
                                   P_COD_DOCUM,
                                   P_COD_CONV,
                                   L_MONTO);
      
        IF L_MONTO IS NOT NULL THEN
        
          P_MONTO := P_MONTO + L_MONTO;
        
        ELSE
        
          P_MONTO := 1.8;
        
        END IF;
      
      END IF;
    
      IF (P_COD_COB = '8200' or P_COD_COB = '8202') AND
         P_COD_MODALIDAD IN (8120, 8123, 8125, 8121) THEN
      
        P_BUSCA_MONTO_COB_CONV_OPC(P_COD_RAMO,
                                   P_COD_COB,
                                   P_COD_MODALIDAD,
                                   P_COD_DOCUM,
                                   P_COD_CONV,
                                   L_MONTO);
      
        IF L_MONTO IS NOT NULL THEN
        
          P_MONTO := P_MONTO + L_MONTO;
        
        ELSE
        
          P_MONTO := 0;
        
        END IF;
      
      END IF;
    
      IF (P_COD_COB = '8201' or P_COD_COB = '8203') AND
         P_COD_MODALIDAD IN (8120, 8123, 8125, 8121) THEN
      
        P_BUSCA_MONTO_COB_CONV_OPC(P_COD_RAMO,
                                   P_COD_COB,
                                   P_COD_MODALIDAD,
                                   P_COD_DOCUM,
                                   P_COD_CONV,
                                   L_MONTO);
      
        IF L_MONTO IS NOT NULL THEN
        
          P_MONTO := P_MONTO + L_MONTO;
        
        ELSE
        
          P_MONTO := 0.8;
        
        END IF;
      
      END IF;
    
      /* IF P_COD_COB = '8105' AND
         P_COD_MODALIDAD IN
         (8000, 8003, 8005, 8010, 8120, 8123, 8125, 8121, 8900) THEN
      
        P_MONTO := 2;
      
      END IF;*/
    
      /*TRN_K_GLOBAL.BORRA_TODAS@OVPRO_PRD;
      
      TRN_K_GLOBAL.BORRA_TODAS@OVPRO_PRD;
      
      P_MONTO := EM_F_DEV_PRIMA_FIJA_MCL@OVPRO_PRD(P_COD_RAMO,
                                                   P_COD_COB,
                                                   P_COD_MODALIDAD);*/
    
    ELSE
    
      P_MONTO := 0;
    
    END IF;
  
  END P_BUSCA_RC_EXCESO;

  /**************************************/

  PROCEDURE P_IMPRIME_PAT(P_NUM_COTIZACION VARCHAR2,
                          P_NOM_FIC        OUT VARCHAR2,
                          P_ERROR          OUT VARCHAR2)
  
   IS
  
    ----------------------------------------- CURSOR DE BUSQUEDA PARA LOS CLIENTES ------------------------------------
  
    CURSOR C_DATA IS
      SELECT A.COD_DOCUM_PROP COD_DOCUM_PROP,
             B.NUM_MANDATO,
             B.DIA_CARGO DIA_PAGO,
             B.TIP_TARJETA COD_TARJETA,
             B.NUM_CTA_TJT NUM_TARJETA,
             TO_CHAR(B.FEC_VIG_FIN, 'MM') MES_VENC,
             TO_CHAR(B.FEC_VIG_FIN, 'YYYY') ANIO_VENC,
             B.COD_ENTIDAD
        FROM MEL_CAB_COTIZACION@OVPRO_PRD A, A5029711_EUR@OVPRO_PRD B
       WHERE A.NUM_COTIZACION = P_NUM_COTIZACION
         AND A.COD_DOCUM_PROP = COD_DOCUM_MDT
         AND B.ESTADO IN ('V', 'I')
         AND ROWNUM < 2
         AND B.TIP_MANDATO = 'TA'
       ORDER BY B.FEC_ACTU DESC;
  
    R_DATA C_DATA%ROWTYPE;
  
    CURSOR TERCERO(P_RUT VARCHAR2) IS
      SELECT *
        FROM A1001399@OVPRO_PRD
       WHERE COD_CIA = 1
         AND TIP_DOCUM = 'RUT'
         AND COD_DOCUM = P_RUT;
  
    R_TERCERO TERCERO%ROWTYPE;
  
    CURSOR DATA_TERCERO(P_RUT VARCHAR2) IS
      SELECT V.NOM_DOMICILIO1,
             (SELECT B.NOM_ESTADO
                FROM TRON2000.A1000104@OVPRO_PRD B
               WHERE B.COD_PAIS = 'CHI'
                 AND B.COD_ESTADO = V.COD_ESTADO) REGION,
             (SELECT C.NOM_PROV
                FROM TRON2000.A1000100@OVPRO_PRD C
               WHERE C.COD_PAIS = 'CHI'
                 AND C.COD_ESTADO = V.COD_ESTADO
                 AND C.COD_PROV = V.COD_PROV) CIUDAD,
             (SELECT A.NOM_LOCALIDAD
                FROM TRON2000.A1000102@OVPRO_PRD A
               WHERE A.COD_PAIS = 'CHI'
                 AND A.COD_LOCALIDAD = V.COD_LOCALIDAD
                 AND A.COD_PROV = V.COD_PROV) COMUNA,
             V.TLF_NUMERO
        FROM A1001331@OVPRO_PRD V
       WHERE V.COD_CIA = 1
         AND V.TIP_DOCUM = 'RUT'
         AND V.COD_DOCUM = P_RUT;
  
    R_DATA_TERCERO DATA_TERCERO%ROWTYPE;
  
    ------------------------------------------- CURSOR DE  BUSQUEDA PARA LOS MANDATOS ----------------------------------------
  
    /*CURSOR C_MANDATO(PC_COD_DOCUM A5029711_EUR.COD_DOCUM_MDT%TYPE) IS
           SELECT TO_CHAR(FEC_VIG_FIN,'DD/MM/YYYY') FEC_VIG_FIN
           FROM   A5029711_EUR
    WHERE  COD_DOCUM_MDT=PC_COD_DOCUM AND ESTADO<>'I';*/
  
    ------------------------------------------------ CURSOR DE BUSQUEDA PARA LOS BANCOS --------------------------------------
  
    CURSOR C_BANCOS(PC_COD_BANCOS A5029711_EUR.COD_ENTIDAD%TYPE) IS
      SELECT DISTINCT A5029711_EUR.COD_ENTIDAD, A5020900.NOM_ENTIDAD
        FROM TRON2000.A5020900@OVPRO_PRD     A5020900,
             TRON2000.A5029711_EUR@OVPRO_PRD A5029711_EUR
       WHERE A5029711_EUR.COD_ENTIDAD = A5020900.COD_ENTIDAD
         AND ((A5029711_EUR.COD_CIA = 1) AND
             (A5029711_EUR.TIP_MANDATO = 'BA') AND
             (A5029711_EUR.ESTADO IN ('I', 'V')) AND
             (A5029711_EUR.COD_ENTIDAD = PC_COD_BANCOS));
  
    --------------------------------------------------- CURSOR DE BUSQUEDA DE TIPO DE CUENTAS ----------------------------------
  
    /* CURSOR C_TIP_CUENTA(PC_TIP_CUENTA A5029712_EUR.TIP_CUENTA%TYPE) IS
           SELECT TIP_CUENTA, DSC_CUENTA
           FROM   A5029712_EUR
    WHERE  TIP_CUENTA=1;       */
  
    ---------------------------------------------------- CURSODR DE BUSQUEDA PARA LOS TIPOS DE TARJETAS -------------------------
  
    /*  CURSOR C_TIP_TARJETA(PC_TIP_PARJETA A5020021.TIP_TARJETA%TYPE) IS
          SELECT TIP_TARJETA, NOM_TIP_TARJETA
            FROM A5020021@OVPRO_PRD
           WHERE TIP_DEBITO <> 'D'
             AND TIP_TARJETA = '3';
    */
    ---------------------------------------------------- CURSOR DE BUSQUEDA PARA EL ESTADO --------------------------------------
  
    /*  CURSOR C_COD_ESTADO(PC_COD_ESTADO A1000104.COD_ESTADO%TYPE) IS
    SELECT COD_PAIS, COD_ESTADO, NOM_ESTADO
      FROM A1000104@OVPRO_PRD
     WHERE COD_ESTADO = 1
       AND COD_PAIS = 'CHI';*/
  
    ---------------------------------------------------- CURSOR DE BUSQUEDA DE LAS PROVINCIAS ----------------------------------
  
    /*CURSOR C_COD_PROVINCIA(PC_COD_PROVINCIA A1000100.COD_PROV%TYPE) IS
    SELECT COD_PAIS, COD_ESTADO, COD_PROV, NOM_PROV
      FROM A1000100@OVPRO_PRD
     WHERE COD_PAIS = 'CHI'
       AND COD_ESTADO = 1
       AND COD_PROV = 67;*/
  
    ----------------------------------------------------- CURSOR DE BUSQUEDA DE LA LOCALIDAD -----------------------------------
  
    /* CURSOR C_COD_LOCALIDAD(PC_COD_LOCALIDAD A1000102.COD_LOCALIDAD%TYPE) IS
    SELECT COD_PAIS, COD_LOCALIDAD, COD_PROV, NOM_LOCALIDAD
      FROM A1000102@OVPRO_PRD
     WHERE COD_LOCALIDAD = '1'
       AND COD_PROV = 67
       AND COD_PAIS = 'CHI';*/
  
    --------------------------------------------------------------- FIN DE LOS CURSORES -----------------------------------------
  
    L_NOM_FICHERO VARCHAR2(45);
    L_ID_FICHERO  UTL_FILE.FILE_TYPE;
    L_NOM_FIC     VARCHAR2(45);
    L_DIRECTORIO  VARCHAR2(10);
    V_NOM_BANCO   VARCHAR2(200);
    V_COD_ENTIDAD NUMERIC;
  
  BEGIN
  
    P_ERROR := 'N';
  
    OPEN C_DATA;
    FETCH C_DATA
      INTO R_DATA;
    CLOSE C_DATA;
  
    OPEN C_BANCOS(R_DATA.COD_ENTIDAD);
    FETCH C_BANCOS
      INTO V_COD_ENTIDAD, V_NOM_BANCO;
    CLOSE C_BANCOS;
  
    L_DIRECTORIO := 'D:\LIS';
  
    L_NOM_FICHERO := 'PAT_' || P_NUM_COTIZACION || '.DAT';
    L_NOM_FIC     := 'PAT_' || P_NUM_COTIZACION || '.PDF';
    L_ID_FICHERO  := UTL_FILE.FOPEN(L_DIRECTORIO, L_NOM_FICHERO, 'W');
  
    UTL_FILE.PUTF(L_ID_FICHERO,
                  '<job> PAT_GEN -C -gpdf -pagcount -PWO:ov9i -PERM:PRINT -outputD:\Inetpub\PDF\' ||
                  L_NOM_FIC || '\n');
    UTL_FILE.PUTF(L_ID_FICHERO, '<reformat> no\n');
  
    OPEN DATA_TERCERO(R_DATA.COD_DOCUM_PROP);
    FETCH DATA_TERCERO
      INTO R_DATA_TERCERO;
    CLOSE DATA_TERCERO;
  
    OPEN TERCERO(R_DATA.COD_DOCUM_PROP);
    FETCH TERCERO
      INTO R_TERCERO;
    CLOSE TERCERO;
  
    P_GRABA_DAT('<GLB> PAT_FOL ', R_DATA.NUM_MANDATO, L_ID_FICHERO);
    P_GRABA_DAT('<GLB> PAT_NOM ',
                R_TERCERO.NOM_TERCERO || ' ' || R_TERCERO.APE1_TERCERO || ' ' ||
                R_TERCERO.APE2_TERCERO,
                L_ID_FICHERO);
    P_GRABA_DAT('<GLB> PAT_DIRECCION ',
                R_DATA_TERCERO.NOM_DOMICILIO1 || ', ' ||
                R_DATA_TERCERO.COMUNA || ', ' || R_DATA_TERCERO.CIUDAD || ', ' ||
                R_DATA_TERCERO.REGION,
                L_ID_FICHERO);
    P_GRABA_DAT('<GLB> PAT_FONO ', R_DATA_TERCERO.TLF_NUMERO, L_ID_FICHERO);
    P_GRABA_DAT('<GLB> PAT_RUT ',
                TRIM(FORMATEA_RUT(R_TERCERO.COD_DOCUM)),
                L_ID_FICHERO);
    P_GRABA_DAT('<GLB> PAT_TJT ', R_DATA.NUM_TARJETA, L_ID_FICHERO);
    P_GRABA_DAT('<GLB> PAT_MES ', R_DATA.MES_VENC, L_ID_FICHERO);
    P_GRABA_DAT('<GLB> PAT_ANO ', R_DATA.ANIO_VENC, L_ID_FICHERO);
  
    IF (R_DATA.COD_TARJETA = 1) THEN
      P_GRABA_DAT('<GLB> PAT_VISA ', 'X', L_ID_FICHERO);
    ELSE
      IF (R_DATA.COD_TARJETA = 2) THEN
        P_GRABA_DAT('<GLB> PAT_MASTERCARD ', 'X', L_ID_FICHERO);
      ELSE
        IF (R_DATA.COD_TARJETA = 3) THEN
          P_GRABA_DAT('<GLB> PAT_MAGNA ', 'X', L_ID_FICHERO);
        ELSE
          IF (R_DATA.COD_TARJETA = 4) THEN
            P_GRABA_DAT('<GLB> PAT_AMERICAN ', 'X', L_ID_FICHERO);
          ELSE
            IF (R_DATA.COD_TARJETA = 5) THEN
              P_GRABA_DAT('<GLB> PAT_DINERS ', 'X', L_ID_FICHERO);
            END IF;
          END IF;
        END IF;
      END IF;
    END IF;
    P_GRABA_DAT('<GLB> PAT_PESOS ', 'X', L_ID_FICHERO);
  
    UTL_FILE.FCLOSE(L_ID_FICHERO);
  
    P_NOM_FIC := L_NOM_FIC;
  
  END P_IMPRIME_PAT;

  /**************************************/

  PROCEDURE P_ENVIA_CORREO(P_NUM_COTIZACION IN VARCHAR2,
                           P_PARA           IN VARCHAR2,
                           P_REPLY_TO       IN VARCHAR2,
                           P_CC_TO          IN VARCHAR2,
                           P_ASUNTO         IN VARCHAR2,
                           P_MENSAJE        IN VARCHAR2,
                           P_RUTA_LOGO      IN VARCHAR2,
                           P_RUTA_FILE      IN VARCHAR2,
                           P_ERROR          OUT VARCHAR2)
  
   IS
  
    CURSOR C_URL IS
      SELECT VALOR FROM CTR_PARAMETROS WHERE NOMBRE = 'WEBSERVER';
  
    CURSOR C_ASEGU_PRD IS
      SELECT COD_DOCUM_ASEG
        FROM MEL_CAB_COTIZACION@OVPRO_PRD
       WHERE NUM_COTIZACION = P_NUM_COTIZACION;
  
    CURSOR C_TRAE_HMTL_CORREO IS
      SELECT * FROM MEL_HTML M WHERE M.COD_RAMO = '801';
  
    R_TRAE_HMTL_CORREO C_TRAE_HMTL_CORREO%ROWTYPE;
  
    L_MESSAGE         CLOB;
    L_URL             VARCHAR2(100);
    L_FROM_NAME       VARCHAR2(100) := 'OV@MAPFRE.CL';
    L_NOM_ARCH        VARCHAR2(100);
    L_ERROR           VARCHAR2(300);
    L_COD_DOCUM_ASEG  VARCHAR2(20);
    L_NOM_ASEG        VARCHAR2(80);
    L_APE1_ASEG       VARCHAR2(30);
    L_APE2_ASEG       VARCHAR2(30);
    L_TEXTO_ESTIMADO  VARCHAR2(200);
    L_TEXTO_PROPOSITO VARCHAR2(5000);
    L_TEXTO_DESCARGA  VARCHAR2(5000);
  
  BEGIN
  
    P_ERROR := 'OK';
  
    OPEN C_URL;
    FETCH C_URL
      INTO L_URL;
    CLOSE C_URL;
  
    L_TEXTO_PROPOSITO := 'ENVIAMOS UNA COPIA DE LA SIMULACION DE SEGURO MAPFRE PARA VEHICULOS PARTICULARES';
    L_TEXTO_DESCARGA  := 'LA SIMULACION';
    --L_SOPORTE := 'SI';
  
    OPEN C_ASEGU_PRD;
    FETCH C_ASEGU_PRD
      INTO L_COD_DOCUM_ASEG;
    CLOSE C_ASEGU_PRD;
  
    MEL_K_TERCERO_TRN.P_TRAE_NOM_ASEGURADO(P_COD_DOCUM_ASEG => L_COD_DOCUM_ASEG,
                                           P_NOM_TERCERO    => L_NOM_ASEG,
                                           P_APE1_TERCERO   => L_APE1_ASEG,
                                           P_APE2_TERCERO   => L_APE2_ASEG,
                                           P_ERROR          => L_ERROR);
  
    L_TEXTO_ESTIMADO := L_NOM_ASEG || ' ' || L_APE1_ASEG || ' ' ||
                        L_APE2_ASEG;
  
    --P_IMPRIME_COTIZACION(P_NUM_COTIZACION, L_NOM_ARCH, P_ERROR);
  
    L_NOM_ARCH := P_RUTA_FILE;
  
    OPEN C_TRAE_HMTL_CORREO;
    FETCH C_TRAE_HMTL_CORREO
      INTO R_TRAE_HMTL_CORREO;
    CLOSE C_TRAE_HMTL_CORREO;
  
    L_MESSAGE := R_TRAE_HMTL_CORREO.HTML;
  
    L_MESSAGE := REPLACE(L_MESSAGE, 'NOMBRES_ASEG', L_TEXTO_ESTIMADO);
  
    L_MESSAGE := REPLACE(L_MESSAGE, 'TEXTO_EMAIL', L_TEXTO_PROPOSITO);
  
    L_MESSAGE := REPLACE(L_MESSAGE,
                         'MENSAJE_ADJUNTO',
                         'MENSAJE ADJUNTO: ' || P_MENSAJE);
  
    L_MESSAGE := REPLACE(L_MESSAGE, 'TEXTO_DESCARGA', L_TEXTO_DESCARGA);
  
    L_MESSAGE := REPLACE(L_MESSAGE,
                         'LINK_PDF',
                         L_URL || 'PDF/' || L_NOM_ARCH);
  
    --ENVIO DE CORREO DE CONTROL, SIN COPIA AL CORREDOR
    /*    OV.P_ENVIA_MAIL_HTML_REPLY(FROM_NAME => L_FROM_NAME,
    TO_NAME   => 'GAPEREZ@MAPFRE.CL',
    REPLY_TO  => P_REPLY_TO,
    SUBJECT   => P_ASUNTO,
    MESSAGE   => L_MESSAGE);*/
  
    OV.P_ENVIA_MAIL_HTML_REPLY(FROM_NAME => L_FROM_NAME,
                               TO_NAME   => P_PARA,
                               REPLY_TO  => P_REPLY_TO,
                               SUBJECT   => P_ASUNTO,
                               MESSAGE   => L_MESSAGE);
  
    IF P_CC_TO IS NOT NULL THEN
      OV.P_ENVIA_MAIL_HTML_REPLY(FROM_NAME => L_FROM_NAME,
                                 TO_NAME   => P_CC_TO,
                                 REPLY_TO  => P_REPLY_TO,
                                 SUBJECT   => P_ASUNTO,
                                 MESSAGE   => L_MESSAGE);
    END IF;
  
  EXCEPTION
    WHEN OTHERS THEN
      P_ERROR := SUBSTR(SQLERRM, 1, 200);
  END P_ENVIA_CORREO;

  /**************************************/

  PROCEDURE P_UPDATE_COT_POL(P_NUM_COTIZACION VARCHAR2,
                             P_NUM_POLIZA     VARCHAR2,
                             P_ERROR          OUT VARCHAR2) IS
  
    CURSOR C_DATOS_COT IS
      SELECT num_cotizacion,
             num_matricula,
             cod_modalidad,
             cod_docum_aseg,
             cod_docum_ben,
             imp_prima_neta,
             imp_prima_bruta,
             fec_actu,
             deducible,
             cod_ramo,
             monto_rc,
             monto_dm,
             monto_lc,
             monto_comp,
             asistencia,
             prima,
             anos_sin_sini,
             contacto_inspecc,
             valor_referencial,
             cod_uso_vehi,
             factura_48,
             mca_mod_prima,
             estado,
             id,
             mca_inspeccion,
             cod_comuna,
             sel_emitir,
             iva,
             descuento,
             recargo,
             cod_docum_suplanta,
             edad_conductor,
             cod_cuadro_com,
             mca_mel,
             --cant_siniestros,
             --monto_siniestros,
             monto_cuota,
             mca_pagado
        FROM MEL_VEH_COTIZACION@OVPRO_PRD
       WHERE NUM_COTIZACION = P_NUM_COTIZACION
         AND SEL_EMITIR = 'S';
  
    R_DATOS_COT C_DATOS_COT%ROWTYPE;
  
    CURSOR C_DATOS_CAB IS
      SELECT *
        FROM MEL_CAB_COTIZACION@OVPRO_PRD
       WHERE NUM_COTIZACION = P_NUM_COTIZACION;
  
    R_DATOS_CAB C_DATOS_CAB%ROWTYPE;
  
    CURSOR C_A2000020 IS
      SELECT VAL_CAMPO
        FROM A2000020@OVPRO_PRD
       WHERE COD_CIA = 1
         AND NUM_POLIZA = P_NUM_POLIZA
         AND COD_CAMPO = 'MCA_IND_INSP';
  
    L_VALOR VARCHAR2(5);
  
  BEGIN
  
    P_ERROR := '0';
  
    OPEN C_DATOS_COT;
    FETCH C_DATOS_COT
      INTO R_DATOS_COT;
    CLOSE C_DATOS_COT;
  
    OPEN C_DATOS_CAB;
    FETCH C_DATOS_CAB
      INTO R_DATOS_CAB;
    CLOSE C_DATOS_CAB;
  
    UPDATE MEL_CAB_COTIZACION@OVPRO_PRD
       SET NUM_POLIZA = P_NUM_POLIZA, TIP_ESTADO = 3, FEC_ACTU = SYSDATE
     WHERE NUM_COTIZACION = P_NUM_COTIZACION;
    COMMIT;
  
    IF R_DATOS_COT.CONTACTO_INSPECC IS NOT NULL THEN
    
      UPDATE A2000801@OVPRO_PRD
         SET NUM_POLIZA = P_NUM_POLIZA, NUM_RIESGO = 1
       WHERE NUM_INSPEC = R_DATOS_COT.CONTACTO_INSPECC;
      COMMIT;
    
    END IF;
  
    OPEN C_A2000020;
    FETCH C_A2000020
      INTO L_VALOR;
    CLOSE C_A2000020;
  
    IF L_VALOR = 'N' AND R_DATOS_COT.CONTACTO_INSPECC IS NULL THEN
    
      DELETE A2000265@OVPRO_PRD
       WHERE COD_CIA = 1
         AND NUM_POLIZA = P_NUM_POLIZA
         AND COD_CLAUSULA IN ('801INSPE02', '801INSPE01');
      COMMIT;
    
      INSERT INTO A2000265@OVPRO_PRD
      VALUES
        (1, P_NUM_POLIZA, 0, 0, 0, 1, '801INSPE02',null);
      COMMIT;
    
      --UPDATE A2000265@OVPRO_PRD SET COD_CLAUSULA = '801INSPE02' WHERE COD_CIA=1 AND NUM_POLIZA=P_NUM_POLIZA;
      COMMIT;
    
    END IF;
  
    IF L_VALOR = 'N' AND R_DATOS_COT.CONTACTO_INSPECC IS NOT NULL THEN
    
      DELETE A2000265@OVPRO_PRD
       WHERE COD_CIA = 1
         AND NUM_POLIZA = P_NUM_POLIZA
         AND COD_CLAUSULA IN ('801INSPE02', '801INSPE01',null);
      COMMIT;
    
      INSERT INTO A2000265@OVPRO_PRD
      VALUES
        (1, P_NUM_POLIZA, 0, 0, 0, 1, '801INSPE01',null);
    
      --UPDATE A2000265@OVPRO_PRD SET COD_CLAUSULA = '801INSPE01' WHERE COD_CIA=1 AND NUM_POLIZA=P_NUM_POLIZA;
      COMMIT;
    
    END IF;
  
    UPDATE MEL_BOLSA_DESCUENTOS D
       SET D.NUM_POLIZA = P_NUM_POLIZA
     WHERE D.NUM_COTIZACION = P_NUM_COTIZACION;
    COMMIT;
    /*  
    UPDATE MEL_BOLSA_COMISION S
       SET S.NUM_POLIZA = P_NUM_POLIZA
     WHERE S.NUM_COTIZACION = P_NUM_COTIZACION;
    COMMIT;
    */
    --FMOUAT
    UPDATE A2009928_MCL@ovpro_prd S
       SET S.NUM_POLIZA = P_NUM_POLIZA
     WHERE S.NUM_COTIZACION = P_NUM_COTIZACION;
    COMMIT;
  
  END P_UPDATE_COT_POL;

  /**************************************/

  PROCEDURE P_VALIDA_INSPECCION(P_NUM_MATRICULA        VARCHAR2,
                                P_COD_DOCUM_INSP       VARCHAR2,
                                P_COD_RAMO             VARCHAR2,
                                P_CONV                 VARCHAR2,
                                P_NUM_INSPEC           OUT VARCHAR2,
                                P_STATUS               OUT VARCHAR2,
                                P_EXISTE_INSPECTOR_TER OUT VARCHAR2,
                                P_FECHA_INSPECCION     OUT VARCHAR2,
                                P_MCA_VENCIDA          OUT VARCHAR2,
                                P_ERROR                OUT VARCHAR2) IS
    CURSOR C_INSPECCION is
      select num_inspec
        from A2000802@OVPRO_PRD b
       where b.cod_cia = 1
         and b.cod_campo = 'NUM_MATRICULA'
         and b.val_campo = P_NUM_MATRICULA
         and exists (select 1
                from a2000801@OVPRO_PRD a
               where a.fec_rea_inspec >= trunc(sysdate - 30)
                 and a.num_inspec = b.num_inspec
                 and a.num_poliza is null
                 and a.tip_status in (2, 6));
  
    l_existe boolean;
    p_existe number;
  
    CURSOR C_FECHA_INSPECCION(l_num_inspec varchar2) is
      select fec_rea_inspec
        from a2000801@OVPRO_PRD a
       where cod_cia = 1
         and num_inspec = l_num_inspec;
  
    R_FECHA_INSPECCION C_FECHA_INSPECCION%ROWTYPE;
  
    CURSOR C_VALIDA_OPCION(l_conv varchar2) IS
      SELECT A.OPC_INSP_EXPRESS
        FROM MEL_VEH_ADMIN A
       WHERE A.COD_CONV = l_conv;
  
    R_VALIDA_OPCION C_VALIDA_OPCION%ROWTYPE;
  
  BEGIN
  
    P_ERROR := '0';
  
    IF P_NUM_MATRICULA != 'A/D' THEN
    
      open C_INSPECCION;
      fetch C_INSPECCION
        into p_existe;
      l_existe := C_INSPECCION%found;
      close C_INSPECCION;
    
      if l_existe then
      
        Open C_FECHA_INSPECCION(p_existe);
        fetch C_FECHA_INSPECCION
          into R_FECHA_INSPECCION;
        CLOSE C_FECHA_INSPECCION;
      
        P_NUM_INSPEC := p_existe;
      
        P_FECHA_INSPECCION := R_FECHA_INSPECCION.FEC_REA_INSPEC;
      
        IF R_FECHA_INSPECCION.FEC_REA_INSPEC >= trunc(sysdate - 30) THEN
          P_MCA_VENCIDA := 'NO';
        ELSE
          P_MCA_VENCIDA := 'SI';
        
        END IF;
      
      end if;
    
    ELSE
    
      P_STATUS := '0';
      P_ERROR  := '0';
    
    END IF;
  
    P_MCA_VENCIDA := 'NO';
  
    OV.MEL_K_INSPECCION.P_EXISTE_INSPECTOR(P_COD_DOCUM_INSP,
                                           P_COD_RAMO,
                                           P_EXISTE_INSPECTOR_TER);
  
    IF P_EXISTE_INSPECTOR_TER = 'SI' THEN
    
      if P_CONV is null then
        OPEN C_VALIDA_OPCION(P_COD_DOCUM_INSP);
      else
        OPEN C_VALIDA_OPCION(P_CONV);
      end if;
    
      FETCH C_VALIDA_OPCION
        INTO R_VALIDA_OPCION;
      CLOSE C_VALIDA_OPCION;
    
      IF R_VALIDA_OPCION.OPC_INSP_EXPRESS = 'S' THEN
      
        P_EXISTE_INSPECTOR_TER := 'SI';
      
      ELSE
      
        P_EXISTE_INSPECTOR_TER := 'NO';
      
      END IF;
    
    END IF;
  
  END P_VALIDA_INSPECCION;

  /**************************************/

  PROCEDURE P_ASIGNA_INSPECCION(P_NUM_COTIZACION VARCHAR2,
                                P_NUM_INSPECCION VARCHAR2,
                                P_ERROR          OUT VARCHAR2) IS
  
  BEGIN
  
    P_ERROR := '0';
  
    UPDATE MEL_VEH_COTIZACION@OVPRO_PRD
       SET CONTACTO_INSPECC = TO_CHAR(P_NUM_INSPECCION)
     WHERE NUM_COTIZACION = P_NUM_COTIZACION
       AND SEL_EMITIR = 'S';
    COMMIT;
  
  END P_ASIGNA_INSPECCION;

  /*************************************/

  PROCEDURE P_TRAE_OPCIONES(P_COD_CONV VARCHAR2, P_OPCIONES OUT TYCURSOR) IS
  
  BEGIN
   
    OPEN P_OPCIONES FOR
      SELECT *
        FROM MEL_VEH_ADMIN M
       WHERE M.COD_CONV = UPPER(P_COD_CONV)
         AND M.MCA_INH = 'N';

  END P_TRAE_OPCIONES;
  
  
  /*-----------------------------------------------
  FDR TRAE OPCIONES SI EXISTE OCNVENION EN AMIUNATEGUI
  ---------------- */
  PROCEDURE P_TRAE_OPCIONES_RESTRICCION(P_COD_CONV VARCHAR2, P_OPCIONES OUT TYCURSOR) IS
  
  BEGIN
  
    OPEN P_OPCIONES FOR
      SELECT M.*, M.rowid 
        FROM MEL_VEH_ADMIN M
       WHERE M.COD_CONV = UPPER(P_COD_CONV);

  END P_TRAE_OPCIONES_RESTRICCION;

  /*-----------------------------------------------
  FDR
  -----------------------------------------------*/

  PROCEDURE P_VALIDA_SUPLANTA(P_COD_DOCUM VARCHAR2,
                              P_RESPUESTA OUT VARCHAR2) IS
  
    CURSOR C_VALIDA_SUPLANTA IS
      SELECT 1
        FROM OV.MEL_ADMIN_COTIZADOR_VEH M
       WHERE M.COD_DOCUM = P_COD_DOCUM
         AND M.IDGRUPO IN (24, 28, 52)
         AND M.MCA_SUPLANTA = 'S';
  
    R_VALIDA_SUPLANTA C_VALIDA_SUPLANTA%ROWTYPE;
    L_EXISTE          BOOLEAN;
  
  BEGIN
  
    OPEN C_VALIDA_SUPLANTA;
    FETCH C_VALIDA_SUPLANTA
      INTO R_VALIDA_SUPLANTA;
    L_EXISTE := C_VALIDA_SUPLANTA%FOUND;
    CLOSE C_VALIDA_SUPLANTA;
  
    IF L_EXISTE THEN
      P_RESPUESTA := 'SI';
    ELSE
      P_RESPUESTA := 'NO';
    END IF;
  
  END P_VALIDA_SUPLANTA;

  /********************************/

  PROCEDURE P_CUENTA_HABILITADA(P_COD_DOCUM CTR_CUENTAS.COD_DOCUM %TYPE,
                                P_EXISTE    OUT CTR_CUENTAS.TIPO %TYPE) IS
  
    CURSOR C_HABILITADA(PC_COD_DOCUM CTR_CUENTAS.COD_DOCUM %TYPE) IS
      SELECT A.COD_DOCUM
        FROM CTR_CUENTAS A, CTR_CUENTAS B
       WHERE A.COD_DOCUM = PC_COD_DOCUM
         AND A.HABILITADO = 1
         AND B.COD_DOCUM = A.COD_DOCUM_MAESTRO
         AND B.HABILITADO = 1;
  
    L_COD_DOCUM CTR_CUENTAS.COD_DOCUM %TYPE;
    L_EXISTE    BOOLEAN;
  
  BEGIN
  
    OPEN C_HABILITADA(P_COD_DOCUM);
    FETCH C_HABILITADA
      INTO L_COD_DOCUM;
    L_EXISTE := C_HABILITADA%FOUND;
    CLOSE C_HABILITADA;
  
    IF L_EXISTE THEN
      P_EXISTE := 'S';
    ELSE
      P_EXISTE := 'N';
    END IF;
  
  END P_CUENTA_HABILITADA;

  PROCEDURE P_TRAE_COD_DOCUM_CONVENIO(P_NUM_COTIZACION VARCHAR2,
                                      P_COD_DOCUM_MAE  OUT VARCHAR2,
                                      P_COD_CONV       OUT VARCHAR2) IS
    CURSOR C_COD_DOCUM_COT IS
      SELECT DISTINCT C.COD_DOCUM_MAE, V.COD_DOCUM_BEN CONVENIO
        FROM MEL_CAB_COTIZACION@OVPRO_PRD C, MEL_VEH_COTIZACION@OVPRO_PRD V
       WHERE V.NUM_COTIZACION = P_NUM_COTIZACION
         AND C.NUM_COTIZACION = P_NUM_COTIZACION;
  
    R_COD_DOCUM_COT C_COD_DOCUM_COT%ROWTYPE;
  
  BEGIN
  
    OPEN C_COD_DOCUM_COT;
    FETCH C_COD_DOCUM_COT
      INTO R_COD_DOCUM_COT;
    CLOSE C_COD_DOCUM_COT;
  
    P_COD_DOCUM_MAE := R_COD_DOCUM_COT.COD_DOCUM_MAE;
    P_COD_CONV      := R_COD_DOCUM_COT.CONVENIO;
  
  END P_TRAE_COD_DOCUM_CONVENIO;

  PROCEDURE P_CARGA_DATOS_COTIZACION(P_NUM_COTIZACION VARCHAR2,
                                     P_DATOS          OUT TYCURSOR) IS
  
  BEGIN
  
    /*insert into temp_tabla
          (num_cotizacion, fecha)
        values
          (P_NUM_COTIZACION, sysdate);
        COMMIT;
    */
    OPEN P_DATOS FOR
      SELECT M.num_cotizacion,
             M.num_matricula,
             M.cod_modalidad,
             M.cod_docum_aseg,
             M.cod_docum_ben,
             M.imp_prima_neta,
             M.imp_prima_bruta,
             M.fec_actu,
             M.deducible,
             M.cod_ramo,
             M.monto_rc,
             M.monto_dm,
             M.monto_lc,
             M.monto_comp,
             M.asistencia,
             M.prima,
             M.anos_sin_sini,
             M.contacto_inspecc,
             M.valor_referencial,
             M.cod_uso_vehi,
             M.factura_48,
             M.mca_mod_prima,
             M.estado,
             M.id,
             M.mca_inspeccion,
             M.cod_comuna,
             M.sel_emitir,
             M.iva,
             TRIM(TO_CHAR(nvl(M.DESCUENTO, 0), '990.99')) descuento,
             TRIM(TO_CHAR(nvl(M.RECARGO, 0), '990.99')) recargo,
             M.cod_docum_suplanta,
             M.edad_conductor,
             M.cod_cuadro_com,
             M.mca_mel,
             --M.cant_siniestros,
             --M.monto_siniestros,
             M.monto_cuota,
             M.mca_pagado,
             M.MCA_HIJOS,
             M.MCA_FRANQUICIA,
             M.MCA_DANOSPRE,
             C.*,
             V.NUM_MATRICULA,
             ((nvl(M.DESCUENTO * -1, 0))) +
             (nvl(M.RECARGO * -1, 0) + M.IMP_PRIMA_NETA) IMP_PRIMA_NETA_REC,
             rtrim(to_char(M.FEC_ACTU,
                           'DD-MON-YY',
                           'NLS_DATE_LANGUAGE = spanish')) FECHA_COT
        FROM MEL_VEH_COTIZACION@OVPRO_PRD M,
             OV_VEHICULO                  V,
             MEL_CAB_COTIZACION@OVPRO_PRD C
       WHERE M.NUM_COTIZACION = P_NUM_COTIZACION
         AND M.NUM_COTIZACION = C.NUM_COTIZACION
         AND M.ID = V.ID
       ORDER BY M.COD_MODALIDAD, M.FEC_ACTU DESC;
  
  END P_CARGA_DATOS_COTIZACION;

  PROCEDURE P_DATOS_VEHICULO_ID(P_ID             VARCHAR2,
                                P_NOM_COT        OUT VARCHAR2,
                                P_APE_PAT_COT    OUT VARCHAR2,
                                P_APE_MAT_COT    OUT VARCHAR2,
                                P_RUT_COT        OUT VARCHAR2,
                                P_DIR_COT        OUT VARCHAR2,
                                P_COMUNA_COT     OUT VARCHAR2,
                                P_CIUDAD_COT     OUT VARCHAR2,
                                P_REGION_COT     OUT VARCHAR2,
                                P_ANIO           OUT VARCHAR2,
                                P_NRO_CHASIS     OUT VARCHAR2,
                                P_NRO_MOTOR      OUT VARCHAR2,
                                P_COD_COLOR      OUT VARCHAR2,
                                P_NOM_COLOR      OUT VARCHAR2,
                                P_COD_MARCA      OUT VARCHAR2,
                                P_NOM_MARCA      OUT VARCHAR2,
                                P_COD_MODELO     OUT VARCHAR2,
                                P_NOM_MODELO     OUT VARCHAR2,
                                P_COD_SUB_MODELO OUT VARCHAR2,
                                P_NOM_SUB_MODELO OUT VARCHAR2,
                                P_TIP_VEHI       OUT VARCHAR2,
                                P_EDAD           OUT VARCHAR2,
                                P_SEXO           OUT VARCHAR2,
                                P_ERROR          OUT VARCHAR2) IS
  
    CURSOR D_VEHICULO IS
      SELECT NVL(C.COD_MARCA, 0) COD_MARCA,
             NVL(C.COD_MODELO, 0) COD_MODELO,
             NVL(C.COD_SUB_MODELO, 0) COD_SUB_MODELO,
             C.ANO_FAB,
             NVL(C.COD_COLOR, 0) COD_COLOR,
             C.NRO_CHASIS,
             C.NRO_MOTOR,
             NVL(C.COD_TIP_VEHI, 0) COD_TIP_VEHI,
             C.COD_DOCUM
        FROM OV_VEHICULO C
       WHERE C.ID = P_ID;
  
    R_VEHICULO D_VEHICULO %ROWTYPE;
  
    CURSOR D_TERCERO(L_COD_DOCUM VARCHAR2) IS
      SELECT B.COD_DOCUM,
             B.NOM_TERCERO NOMBRE,
             B.APE_PATERNO APE_PATERNO,
             B.APE_MATERNO APE_MATERNO,
             B.DIR_TERCERO,
             B.COD_ESTADO,
             NVL(B.COD_PROV, 0) COD_PROV,
             NVL(B.COD_LOCALIDAD, 0) COD_LOCALIDAD
        FROM OV_TERCERO B
       WHERE B.COD_DOCUM = L_COD_DOCUM;
  
    R_TERCERO D_TERCERO %ROWTYPE;
  
    V_ERROR VARCHAR2(100);
  
    CURSOR COLOR(V_COD_COLOR A2100800.COD_COLOR %TYPE) IS
      SELECT NOM_COLOR
        FROM A2100800@OVPRO_PRD
       WHERE COD_COLOR = V_COD_COLOR;
  
    CURSOR P_MARCA(V_MARCA A2100400.COD_MARCA %TYPE) IS
      SELECT DISTINCT (B.NOM_MARCA), A.COD_MARCA
        FROM G2009039_EUR@OVPRO_PRD A, A2100400@OVPRO_PRD B
       WHERE A.COD_CIA = 1
         AND A.COD_CIA = B.COD_CIA
         AND A.COD_MARCA = V_MARCA
         AND A.COD_MARCA = B.COD_MARCA
         AND B.MCA_INH = 'N'
         AND B.NOM_MARCA != 'PORSCHE'
       ORDER BY B.NOM_MARCA;
  
    R_MARCA P_MARCA%ROWTYPE;
  
    CURSOR P_MODELO(V_MARCA  A2100400.COD_MARCA %TYPE,
                    V_MODELO A2100410.COD_MODELO%TYPE) IS
    /*SELECT DISTINCT A.COD_MODELO, B.NOM_MODELO
                        FROM G2009039_EUR@OVPRO_PRD A,
                             A2100410@OVPRO_PRD     B,
                             A2100420@OVPRO_PRD     C
                       WHERE A.COD_CIA = 1
                         AND A.COD_MARCA = V_MARCA
                         AND A.COD_MODELO = V_MODELO
                         AND A.COD_CIA = B.COD_CIA
                         AND A.COD_MARCA = B.COD_MARCA
                         AND A.COD_MODELO = B.COD_MODELO
                         AND C.COD_CIA = A.COD_CIA
                         AND C.COD_MARCA = A.COD_MARCA
                         AND C.COD_MODELO = A.COD_MODELO
                         AND C.COD_TIP_VEHI <= 6
                         AND C.MCA_INH = 'N'
                         AND B.MCA_INH = 'N'
                       ORDER BY NOM_MODELO*/
      SELECT DISTINCT A.COD_MODELO, A.NOM_MODELO
        FROM --G2009039_EUR@OVPRO_PRD A--,
             A2100410@OVPRO_PRD A,
             A2100420@OVPRO_PRD C
       WHERE A.COD_CIA = 1
         AND A.COD_MARCA = V_MARCA
         AND A.COD_MODELO = V_MODELO
            -- AND A.COD_CIA = B.COD_CIA
            --      AND A.COD_MARCA = B.COD_MARCA
            ---         AND A.COD_MODELO = B.COD_MODELO
         AND C.COD_CIA = A.COD_CIA
         AND C.COD_MARCA = A.COD_MARCA
         AND C.COD_MODELO = A.COD_MODELO
         AND C.COD_TIP_VEHI <= 6
         AND C.MCA_INH = 'N'
      --  AND B.MCA_INH = 'N'     
       ORDER BY NOM_MODELO;
  
    R_MODELO P_MODELO%ROWTYPE;
  
    CURSOR P_SUB_MODELOS(V_MARCA      A2100400.COD_MARCA %TYPE,
                         V_MODELO     A2100410.COD_MODELO%TYPE,
                         V_SUB_MODELO A2100420.COD_SUB_MODELO%TYPE) IS
      SELECT SMOD.COD_SUB_MODELO COD_SUB_MODELO,
             SMOD.NOM_SUB_MODELO NOM_SUB_MODELO
        FROM A2100420@OVPRO_PRD SMOD, A2100420@OVPRO_PRD C
       WHERE SMOD.COD_CIA = 1
         AND SMOD.COD_MARCA = V_MARCA
         AND SMOD.COD_MODELO = V_MODELO
         AND SMOD.COD_SUB_MODELO = V_SUB_MODELO
         AND C.COD_CIA = SMOD.COD_CIA
         AND C.COD_MARCA = SMOD.COD_MARCA
         AND C.COD_MODELO = SMOD.COD_MODELO
         AND C.COD_SUB_MODELO = SMOD.COD_SUB_MODELO
         AND C.COD_TIP_VEHI <= 6
         AND C.MCA_INH = 'N'
         AND SMOD.FEC_VALIDEZ =
             (SELECT MAX(B.FEC_VALIDEZ)
                FROM A2100420@OVPRO_PRD B
               WHERE SMOD.COD_CIA = B.COD_CIA
                 AND SMOD.COD_SUB_MODELO = B.COD_SUB_MODELO
                 AND SMOD.COD_MARCA = B.COD_MARCA
                 AND SMOD.COD_MODELO = B.COD_MODELO);
  
    R_SUB_MODELOS P_SUB_MODELOS%ROWTYPE;
  
    L_EXISTE BOOLEAN;
  
  BEGIN
  
    OPEN D_VEHICULO;
    FETCH D_VEHICULO
      INTO R_VEHICULO;
    CLOSE D_VEHICULO;
  
    OPEN D_TERCERO(R_VEHICULO.COD_DOCUM);
    FETCH D_TERCERO
      INTO R_TERCERO;
    --L_EXISTE := D_TERCERO%FOUND;
    CLOSE D_TERCERO;
  
    P_NOM_COT     := R_TERCERO.NOMBRE;
    P_APE_PAT_COT := R_TERCERO.APE_PATERNO;
    P_APE_MAT_COT := R_TERCERO.APE_MATERNO;
    P_RUT_COT     := R_VEHICULO.COD_DOCUM;
    P_DIR_COT     := R_TERCERO.DIR_TERCERO;
    P_ANIO        := R_VEHICULO.ANO_FAB;
    P_NRO_CHASIS  := R_VEHICULO.NRO_CHASIS;
    P_NRO_MOTOR   := R_VEHICULO.NRO_MOTOR;
    P_TIP_VEHI    := R_VEHICULO.COD_TIP_VEHI;
  
    OPEN COLOR(R_VEHICULO.COD_COLOR);
    FETCH COLOR
      INTO P_NOM_COLOR;
    CLOSE COLOR;
  
    P_COD_COLOR      := R_VEHICULO.COD_COLOR;
    P_COD_MARCA      := R_VEHICULO.COD_MARCA;
    P_COD_MODELO     := R_VEHICULO.COD_MODELO;
    P_COD_SUB_MODELO := R_VEHICULO.COD_SUB_MODELO;
  
    -- SE DECODIFICA LA MARCA,MODELO Y SUBMODELO
  
    OPEN P_MARCA(P_COD_MARCA);
    FETCH P_MARCA
      INTO R_MARCA;
    CLOSE P_MARCA;
  
    P_NOM_MARCA := R_MARCA.NOM_MARCA;
  
    --
  
    OPEN P_MODELO(P_COD_MARCA, P_COD_MODELO);
    FETCH P_MODELO
      INTO R_MODELO;
    CLOSE P_MODELO;
  
    P_NOM_MODELO := R_MODELO.NOM_MODELO;
  
    --
  
    OPEN P_SUB_MODELOS(P_COD_MARCA, P_COD_MODELO, P_COD_SUB_MODELO);
    FETCH P_SUB_MODELOS
      INTO R_SUB_MODELOS;
    CLOSE P_SUB_MODELOS;
  
    P_NOM_SUB_MODELO := R_SUB_MODELOS.NOM_SUB_MODELO;
  
    /*
    NOMBRE_MODELOS(R_VEHICULO.COD_MARCA,
                   R_VEHICULO.COD_MODELO,
                   R_VEHICULO.COD_SUB_MODELO,
                   P_NOM_MARCA,
                   P_NOM_MODELO,
                   P_NOM_SUB_MODELO);*/
  
    -- SE OBTIENEN LOS NOMBRES DE CIUDAD,COMUNA Y REGION
    NOMBRE_LOCALIDADES(R_TERCERO.COD_LOCALIDAD,
                       R_TERCERO.COD_PROV,
                       P_COMUNA_COT,
                       P_CIUDAD_COT,
                       P_REGION_COT,
                       V_ERROR);
  
  END P_DATOS_VEHICULO_ID;

  PROCEDURE P_VALIDA_PATENTE_VEH(VAL_NUM_MATRICULA IN OV_VEHICULO.NUM_MATRICULA %TYPE,
                                 VAL_ID            OUT OV_VEHICULO.ID %TYPE,
                                 P_ERROR           OUT VARCHAR2) IS
  
    CURSOR EXISTE IS
      SELECT ID FROM OV_VEHICULO WHERE NUM_MATRICULA = VAL_NUM_MATRICULA;
  
    EXISTE_DATO     BOOLEAN;
    DAT             NUMBER;
    EXISTE_TRONADOR NUMBER;
  
  BEGIN
    -- SE VALIDA SI EXISTE EN OV_VEHICULO
    OPEN EXISTE;
    FETCH EXISTE
      INTO DAT;
    EXISTE_DATO := EXISTE%FOUND;
    CLOSE EXISTE;
  
    IF (EXISTE_DATO) THEN
      P_ERROR := 'S';
      VAL_ID  := TO_CHAR(DAT);
    
    ELSE
      P_ERROR := 'N';
      VAL_ID  := 0;
    END IF;
  
  END P_VALIDA_PATENTE_VEH;

  PROCEDURE P_VALIDA_VEH_PLAN_VIGENTE(P_COD_DOCUM_ASEG        IN VARCHAR2,
                                      P_COD_MARCA             IN VARCHAR2,
                                      P_COD_MODELO            IN VARCHAR2,
                                      P_COD_SUB_MODELO        IN VARCHAR2,
                                      P_COD_CONV              IN VARCHAR2,
                                      P_RC_EXCESO             IN VARCHAR2,
                                      P_MCA_VIGENTE           OUT VARCHAR2,
                                      P_COD_MODALIDAD_VIGENTE OUT VARCHAR2,
                                      P_COD_RAMO              OUT VARCHAR2,
                                      P_IMP_PRIMA_NETA        OUT VARCHAR2,
                                      P_IMP_PRIMA_TOTAL       OUT VARCHAR2) IS
  
    CURSOR C_POLIZA_COD_DOCUM IS
      SELECT *
        FROM A2000060@OVPRO_PRD A
       WHERE COD_CIA = 1
         AND TIP_DOCUM = 'RUT'
         AND COD_DOCUM = P_COD_DOCUM_ASEG
         AND EXISTS (SELECT 1
                FROM A2000030@OVPRO_PRD
               WHERE COD_CIA = 1
                 AND NUM_POLIZA = A.NUM_POLIZA
                 AND NUM_SPTO =
                     (SELECT MAX(NUM_SPTO)
                        FROM A2000030@OVPRO_PRD
                       WHERE COD_CIA = 1
                         AND NUM_POLIZA = A.NUM_POLIZA)
                 AND COD_RAMO + 0 IN (801, 802, 803, 808)
                 AND FEC_VCTO_SPTO >= TRUNC(SYSDATE)
                 AND MCA_POLIZA_ANULADA = 'N'
                 AND TIP_SPTO IN ('XX', 'RF')
                 AND MCA_SPTO_ANULADO <> 'S'
                 AND MCA_VIGENTE = 'S')
         AND MCA_BAJA = 'N'
         AND MCA_VIGENTE = 'S';
  
    CURSOR C_DATOS_POLIZA(L_NUM_POLIZA VARCHAR2) IS
      SELECT COD_CAMPO,
             VAL_CAMPO,
             NUM_SPTO,
             NUM_RIESGO,
             NUM_POLIZA,
             COD_RAMO
        FROM A2000020@OVPRO_PRD A
       WHERE A.COD_CIA = 1
         AND A.NUM_POLIZA = L_NUM_POLIZA
         AND A.COD_CAMPO IN ('COD_MODALIDAD')
         AND A.MCA_VIGENTE = 'S'
         AND A.MCA_BAJA_RIESGO = 'N'
         AND A.NUM_SPTO =
             (SELECT MAX(C.NUM_SPTO)
                FROM A2000030@OVPRO_PRD C
               WHERE C.COD_CIA = A.COD_CIA
                 AND C.NUM_POLIZA = A.NUM_POLIZA
                 AND C.TIP_SPTO IN ('XX', 'RF')
                 AND C.MCA_SPTO_ANULADO <> 'S'
                 AND C.NUM_SPTO =
                     (SELECT MAX(M.NUM_SPTO)
                        FROM TRON2000.A2000020@OVPRO_PRD M
                       WHERE M.COD_CIA = 1
                         AND M.NUM_POLIZA = A.NUM_POLIZA
                         AND M.COD_CAMPO IN ('COD_MODALIDAD')
                         AND M.MCA_VIGENTE = 'S'
                         AND M.MCA_BAJA_RIESGO = 'N'));
  
    CURSOR C_DATOS_VEH_POLIZA(L_NUM_POLIZA VARCHAR2) IS
      SELECT COD_CAMPO, VAL_CAMPO
        FROM A2000020@OVPRO_PRD A
       WHERE A.COD_CIA = 1
         AND A.NUM_POLIZA = L_NUM_POLIZA
         AND A.COD_CAMPO IN ('COD_MARCA', 'COD_MODELO', 'COD_SUB_MODELO')
         AND A.MCA_VIGENTE = 'S'
         AND A.MCA_BAJA_RIESGO = 'N'
       ORDER BY A.NUM_SPTO ASC;
  
    CURSOR C_A2100170(L_COD_CIA    VARCHAR2,
                      L_NUM_POLIZA VARCHAR2,
                      L_NUM_SPTO   VARCHAR2,
                      L_NUM_RIESGO VARCHAR2) IS
      SELECT NVL(SUM(IMP_SPTO), 0) AS L_PRIMA_SPTO, NUM_SPTO
        FROM A2100170@OVPRO_PRD A
       WHERE A.COD_CIA = L_COD_CIA
         AND A.NUM_POLIZA = L_NUM_POLIZA
            --AND NUM_SPTO >= L_NUM_SPTO
            --       AND    NUM_SPTO   < PI_NUM_SPTO
         AND A.NUM_RIESGO = L_NUM_RIESGO
         AND A.COD_ECO = 1
         AND A.NUM_SPTO = (SELECT MAX(M.NUM_SPTO)
                             FROM TRON2000.A2000020@OVPRO_PRD M
                            WHERE M.COD_CIA = 1
                              AND M.NUM_POLIZA = A.NUM_POLIZA
                              AND M.COD_CAMPO IN ('IMP_PRIMA_PROPUESTA')
                              AND M.MCA_VIGENTE = 'S'
                              AND M.MCA_BAJA_RIESGO = 'N')
       GROUP BY NUM_SPTO;
    REG_A2100170 C_A2100170%ROWTYPE;
  
    L_COD_MODALIDAD  VARCHAR2(10);
    L_COD_MARCA      VARCHAR2(10);
    L_COD_MODELO     VARCHAR2(10);
    L_COD_SUB_MODELO VARCHAR2(10);
    C_PLANES         SYS_REFCURSOR;
  
    MCA_MODALIDAD VARCHAR2(1);
  
    L_COD_PLAN VARCHAR2(10);
    L_ABREV    VARCHAR2(30);
    L_ORDEN    VARCHAR2(30);
  
    L_PRIMA_SPTO NUMBER;
    PO_PRIMA_ANT NUMBER;
  
    P_NUM_POLIZA VARCHAR2(20);
    P_NUM_SPTO   VARCHAR2(20);
    P_NUM_RIESGO VARCHAR2(20);
  
    IVA NUMBER;
  
    L_MONTO_RC_EXCESO NUMBER;
  
  BEGIN
  
    P_MCA_VIGENTE := 'N';
  
    FOR R_POLIZA_COD_DOCUM IN C_POLIZA_COD_DOCUM LOOP
    
      FOR R_DATOS_POLIZA IN C_DATOS_POLIZA(R_POLIZA_COD_DOCUM.NUM_POLIZA) LOOP
      
        CASE R_DATOS_POLIZA.COD_CAMPO
          WHEN 'COD_MODALIDAD' THEN
            L_COD_MODALIDAD := R_DATOS_POLIZA.VAL_CAMPO;
        END CASE;
      
        P_NUM_POLIZA := R_DATOS_POLIZA.NUM_POLIZA;
        P_NUM_RIESGO := R_DATOS_POLIZA.NUM_RIESGO;
        P_NUM_SPTO   := R_DATOS_POLIZA.NUM_SPTO;
        P_COD_RAMO   := R_DATOS_POLIZA.COD_RAMO;
      
      END LOOP;
    
      FOR R_DATOS_VEH_POLIZA IN C_DATOS_VEH_POLIZA(R_POLIZA_COD_DOCUM.NUM_POLIZA) LOOP
      
        CASE R_DATOS_VEH_POLIZA.COD_CAMPO
          WHEN 'COD_MARCA' THEN
            L_COD_MARCA := R_DATOS_VEH_POLIZA.VAL_CAMPO;
          WHEN 'COD_MODELO' THEN
            L_COD_MODELO := R_DATOS_VEH_POLIZA.VAL_CAMPO;
          WHEN 'COD_SUB_MODELO' THEN
            L_COD_SUB_MODELO := R_DATOS_VEH_POLIZA.VAL_CAMPO;
        END CASE;
      
      END LOOP;
    
      IF (L_COD_MARCA = P_COD_MARCA AND L_COD_MODELO = P_COD_MODELO /* AND
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                L_COD_SUB_MODELO = P_COD_SUB_MODELO*/
         ) THEN
        --open C_PLANES;
        P_TRAE_PLANES(nvl(P_COD_CONV, 'S/C'), C_PLANES);
        LOOP
          FETCH C_PLANES
            INTO L_COD_PLAN, L_ABREV, L_ORDEN;
        
          IF L_COD_MODALIDAD = L_COD_PLAN THEN
          
            IVA := ROUND(DC_F_IVA_VIGENTE());
          
            FOR REG_A2100170 IN C_A2100170(1,
                                           P_NUM_POLIZA,
                                           P_NUM_SPTO,
                                           P_NUM_RIESGO) LOOP
            
              L_PRIMA_SPTO := 0;
              L_PRIMA_SPTO := REG_A2100170.L_PRIMA_SPTO;
              PO_PRIMA_ANT := NVL(PO_PRIMA_ANT, 0) + L_PRIMA_SPTO;
            
            END LOOP;
          
            P_BUSCA_RC_EXCESO(P_COD_RAMO,
                              P_RC_EXCESO,
                              L_COD_MODALIDAD,
                              '',
                              '',
                              L_MONTO_RC_EXCESO);
          
            P_MCA_VIGENTE           := 'S';
            P_COD_MODALIDAD_VIGENTE := L_COD_PLAN;
            P_IMP_PRIMA_NETA        := TRIM(TO_CHAR(ROUND(PO_PRIMA_ANT +
                                                          +L_MONTO_RC_EXCESO,
                                                          2),
                                                    '990.99'));
          
            P_IMP_PRIMA_TOTAL := TRIM(TO_CHAR(ROUND(P_IMP_PRIMA_NETA * IVA / 100 +
                                                    (P_IMP_PRIMA_NETA),
                                                    2),
                                              '990.99'));
            EXIT;
          
          END IF;
        
          EXIT WHEN C_PLANES%NOTFOUND;
        END LOOP;
        PO_PRIMA_ANT := 0;
      
        /*IF C_PLANES%FOUND THEN
        
          LOOP
            FETCH C_PLANES
              INTO L_COD_PLAN, L_ABREV;
          
            IF L_COD_MODALIDAD = L_COD_PLAN THEN
            
              IVA := ROUND(DC_F_IVA_VIGENTE());
            
              FOR REG_A2100170 IN C_A2100170(1,
                                             P_NUM_POLIZA,
                                             P_NUM_SPTO,
                                             P_NUM_RIESGO) LOOP
              
                L_PRIMA_SPTO := 0;
                L_PRIMA_SPTO := REG_A2100170.L_PRIMA_SPTO;
                PO_PRIMA_ANT := NVL(PO_PRIMA_ANT, 0) + L_PRIMA_SPTO;
              
              END LOOP;
            
              P_BUSCA_RC_EXCESO(P_COD_RAMO,
                                P_RC_EXCESO,
                                L_COD_MODALIDAD,
                                '',
                                '',
                                L_MONTO_RC_EXCESO);
            
              P_MCA_VIGENTE           := 'S';
              P_COD_MODALIDAD_VIGENTE := L_COD_PLAN;
              P_IMP_PRIMA_NETA        := TRIM(TO_CHAR(ROUND(PO_PRIMA_ANT +
                                                            +L_MONTO_RC_EXCESO,
                                                            2),
                                                      '990.99'));
            
              P_IMP_PRIMA_TOTAL := TRIM(TO_CHAR(ROUND(P_IMP_PRIMA_NETA * IVA / 100 +
                                                      (P_IMP_PRIMA_NETA),
                                                      2),
                                                '990.99'));
              EXIT;
            
            END IF;
          
            EXIT WHEN C_PLANES%NOTFOUND;
          
          END LOOP;
        
        END IF;*/
      
      END IF;
    
    END LOOP;
  
  END P_VALIDA_VEH_PLAN_VIGENTE;

  PROCEDURE P_TRAE_TIPO_VEHICULO(P_COD_MARCA      VARCHAR2,
                                 P_COD_MODELO     VARCHAR2,
                                 P_COD_SUB_MODELO VARCHAR2,
                                 P_USO_VEH        VARCHAR2,
                                 P_COD_RAMO       OUT VARCHAR2,
                                 P_COD_TIP_VEHI   OUT VARCHAR2,
                                 P_NOM_TIP_VEHI   OUT VARCHAR2,
                                 P_ERROR          OUT VARCHAR2) IS
  
    CURSOR C_TIP_VEHI IS
      SELECT T.COD_TIP_VEHI
        FROM A2100420@OVPRO_PRD T
       WHERE T.COD_MARCA = P_COD_MARCA
         AND T.COD_MODELO = P_COD_MODELO
         AND T.COD_SUB_MODELO = P_COD_SUB_MODELO
         AND T.FEC_VALIDEZ = (SELECT MAX(B.FEC_VALIDEZ)
                                FROM A2100420@OVPRO_PRD B
                               WHERE B.COD_MARCA = T.COD_MARCA
                                 AND B.COD_MODELO = T.COD_MODELO
                                 AND B.COD_SUB_MODELO = T.COD_SUB_MODELO
                                 AND B.MCA_INH = 'N');
  
    L_TIP_VEHI C_TIP_VEHI%ROWTYPE;
    L_EXISTE   BOOLEAN;
    L_USO_VEHI NUMBER;
  
    CURSOR C_NOM_TIP_VEHI(L_COD_TIP_VEHI VARCHAR2) IS
      SELECT MARCA
        FROM OV_SOAP_VEH_TIPOS T
       WHERE COD_TIP_VEHI = L_COD_TIP_VEHI;
  
    R_NOM_TIP_VEHI C_NOM_TIP_VEHI%ROWTYPE;
  
  BEGIN
  
    IF UPPER(P_USO_VEH) = 'P' THEN
      L_USO_VEHI := 1;
    ELSE
      L_USO_VEHI := 5;
    END IF;
  
    OPEN C_TIP_VEHI;
    FETCH C_TIP_VEHI
      INTO L_TIP_VEHI;
    L_EXISTE := C_TIP_VEHI%FOUND;
    CLOSE C_TIP_VEHI;
  
    OPEN C_NOM_TIP_VEHI(L_TIP_VEHI.COD_TIP_VEHI);
    FETCH C_NOM_TIP_VEHI
      INTO R_NOM_TIP_VEHI;
    CLOSE C_NOM_TIP_VEHI;
  
    P_NOM_TIP_VEHI := R_NOM_TIP_VEHI.MARCA;
  
  EXCEPTION
    WHEN OTHERS THEN
      P_ERROR := SQLCODE;
    
  END P_TRAE_TIPO_VEHICULO;

  PROCEDURE P_TRAE_PLANES_PAGO_PAT(P_COD_CIA IN NUMBER,
                                   P_CURSOR  OUT TYCURSOR,
                                   P_ERROR   OUT VARCHAR2) IS
  
  BEGIN
  
    P_ERROR := '0';
  
    OPEN P_CURSOR FOR
      SELECT COD_FRACC_PAGO NUM_CUOTAS, NOM_FRACC_PAGO
        FROM A1001402@OVPRO_PRD
       WHERE COD_FRACC_PAGO IN (3, 4, 6, 8, 10, 12)
         AND COD_CIA = P_COD_CIA
       ORDER BY NUM_CUOTAS;
  
    P_ERROR := 'OK';
  EXCEPTION
    WHEN OTHERS THEN
      P_ERROR := SUBSTR(SQLERRM, 0, 200);
  END P_TRAE_PLANES_PAGO_PAT;

  PROCEDURE P_GRABA_DATOS_VEH_EMISION(P_ID         NUMBER,
                                      P_COD_COLOR  NUMBER,
                                      P_NRO_MOTOR  VARCHAR2,
                                      P_NRO_CHASIS VARCHAR2,
                                      P_ERROR      OUT VARCHAR2) IS
  
  BEGIN
  
    P_ERROR := '0';
  
    UPDATE OV_VEHICULO
       SET COD_COLOR  = P_COD_COLOR,
           NRO_MOTOR  = P_NRO_MOTOR,
           NRO_CHASIS = P_NRO_CHASIS
     WHERE ID = P_ID;
    COMMIT;
  
  EXCEPTION
    WHEN OTHERS THEN
      P_ERROR := SUBSTR(SQLERRM, 0, 99);
    
  END P_GRABA_DATOS_VEH_EMISION;

  PROCEDURE P_BUSCA_COB_OPC(P_COD_RAMO      VARCHAR2,
                            P_COD_COB       VARCHAR2,
                            P_COD_MODALIDAD VARCHAR2,
                            P_COD_DOCUM     VARCHAR2,
                            P_COD_CONV      VARCHAR2,
                            P_MONTO         OUT NUMBER,
                            P_MONTO_CONV    OUT NUMBER) IS
  
    DATOS_COB VARCHAR2(3000);
    L_MONTO   NUMBER;
  
  BEGIN
  
    P_MONTO      := 0;
    P_MONTO_CONV := 0;
  
    IF P_COD_COB IS NOT NULL THEN
    
      FOR X IN 1 .. LENGTH(P_COD_COB) LOOP
      
        IF (SUBSTR(P_COD_COB, X, 1) != '|') THEN
        
          DATOS_COB := DATOS_COB || SUBSTR(P_COD_COB, X, 1);
        
        ELSE
        
          IF DATOS_COB = '8105' THEN
          
            P_MONTO := P_MONTO + 0.01;
          
          END IF;
        
          IF DATOS_COB = '8133' THEN
          
            P_MONTO := P_MONTO + 0;
          
          END IF;
        
          IF DATOS_COB = 'EXGA' THEN
          
            P_MONTO := P_MONTO + 0;
          
            TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('DVMCA_EXCLUSIVIDAD_GARAGE', 'S');
          
          END IF;
        
          /*IF P_COD_MODALIDAD NOT IN ('9020') THEN
          
            IF DATOS_COB = '8105' THEN
          
              P_MONTO := P_MONTO + 2.5;
          
            END IF;
          
          END IF;*/
        
          DATOS_COB := '';
        
        END IF;
      
      END LOOP;
    
    END IF;
  
    IF P_COD_COB IS NOT NULL THEN
    
      FOR X IN 1 .. LENGTH(P_COD_COB) LOOP
      
        IF (SUBSTR(P_COD_COB, X, 1) != '|') THEN
        
          DATOS_COB := DATOS_COB || SUBSTR(P_COD_COB, X, 1);
        
        ELSE
        
          P_BUSCA_MONTO_COB_CONV_OPC(P_COD_RAMO,
                                     DATOS_COB,
                                     P_COD_MODALIDAD,
                                     P_COD_DOCUM,
                                     P_COD_CONV,
                                     L_MONTO);
        
          IF L_MONTO IS NULL THEN
          
            P_MONTO_CONV := P_MONTO_CONV + 0;
          
          ELSE
          
            P_MONTO_CONV := P_MONTO_CONV + L_MONTO;
          
          END IF;
        
          DATOS_COB := '';
        
        END IF;
      
      END LOOP;
    
    END IF;
  
  END P_BUSCA_COB_OPC;

  PROCEDURE P_GRABA_COB_OPC(P_NUM_COTIZACION VARCHAR2, P_COD_COB VARCHAR2) IS
  
    DATOS_COB VARCHAR2(3000);
  
    CURSOR C_DATOS_COT_VEH IS
      SELECT num_cotizacion,
             num_matricula,
             cod_modalidad,
             cod_docum_aseg,
             cod_docum_ben,
             imp_prima_neta,
             imp_prima_bruta,
             fec_actu,
             deducible,
             cod_ramo,
             monto_rc,
             monto_dm,
             monto_lc,
             monto_comp,
             asistencia,
             prima,
             anos_sin_sini,
             contacto_inspecc,
             valor_referencial,
             cod_uso_vehi,
             factura_48,
             mca_mod_prima,
             estado,
             id,
             mca_inspeccion,
             cod_comuna,
             sel_emitir,
             iva,
             descuento,
             recargo,
             cod_docum_suplanta,
             edad_conductor,
             cod_cuadro_com,
             mca_mel,
             --cant_siniestros,
             --monto_siniestros,
             monto_cuota,
             mca_pagado,
             mca_hijos,
             mca_franquicia,
             mca_danospre
        FROM MEL_VEH_COTIZACION@OVPRO_PRD
       WHERE NUM_COTIZACION = P_NUM_COTIZACION;
  
    R_DATOS_COT_VEH C_DATOS_COT_VEH%ROWTYPE;
  
    CURSOR C_DATOS_COT_CAB IS
      SELECT *
        FROM MEL_CAB_COTIZACION@OVPRO_PRD
       WHERE NUM_COTIZACION = P_NUM_COTIZACION;
  
    R_DATOS_COT_CAB C_DATOS_COT_CAB%ROWTYPE;
  
    L_COD_COB VARCHAR2(1000);
  
  BEGIN
  
    OPEN C_DATOS_COT_VEH;
    FETCH C_DATOS_COT_VEH
      INTO R_DATOS_COT_VEH;
    CLOSE C_DATOS_COT_VEH;
  
    OPEN C_DATOS_COT_CAB;
    FETCH C_DATOS_COT_CAB
      INTO R_DATOS_COT_CAB;
    CLOSE C_DATOS_COT_CAB;
  
    P_BUSCA_COB_CONV_OPC(R_DATOS_COT_CAB.Cod_Ramo,
                         R_DATOS_COT_VEH.COD_MODALIDAD,
                         R_DATOS_COT_CAB.COD_DOCUM,
                         R_DATOS_COT_VEH.COD_DOCUM_BEN,
                         L_COD_COB);
  
    L_COD_COB := L_COD_COB || P_COD_COB;
  
    IF L_COD_COB IS NOT NULL THEN
    
      FOR X IN 1 .. LENGTH(L_COD_COB) LOOP
      
        IF (SUBSTR(L_COD_COB, X, 1) != '|') THEN
        
          DATOS_COB := DATOS_COB || SUBSTR(L_COD_COB, X, 1);
        
        ELSE
        
          IF DATOS_COB = '8105' THEN
          
            UPDATE MEL_VEH_COTIZACION@OVPRO_PRD
               SET DEDUCIBLE = DATOS_COB
             WHERE NUM_COTIZACION = P_NUM_COTIZACION;
            COMMIT;
          
          END IF;
        
          IF DATOS_COB = '8133' THEN
          
            UPDATE MEL_VEH_COTIZACION@OVPRO_PRD
               SET MONTO_LC = DATOS_COB
             WHERE NUM_COTIZACION = P_NUM_COTIZACION;
            COMMIT;
          
          END IF;
        
          IF DATOS_COB = '8200' THEN
          
            UPDATE MEL_VEH_COTIZACION@OVPRO_PRD
               SET MONTO_DM = '8200'
             WHERE NUM_COTIZACION = P_NUM_COTIZACION;
            COMMIT;
          
          END IF;
          
          IF DATOS_COB = '8202' THEN
          
            UPDATE MEL_VEH_COTIZACION@OVPRO_PRD
               SET MONTO_DM = '8202'
             WHERE NUM_COTIZACION = P_NUM_COTIZACION;
            COMMIT;
          
          END IF;
        
          IF DATOS_COB = 'EXGA' THEN
          
            UPDATE MEL_VEH_COTIZACION@OVPRO_PRD
               SET ASISTENCIA = '1'
             WHERE NUM_COTIZACION = P_NUM_COTIZACION;
            COMMIT;
          
          END IF;
        
          DATOS_COB := '';
        
        END IF;
      
      END LOOP;
    
    END IF;
  
  END P_GRABA_COB_OPC;

  PROCEDURE P_GET_LISTA_CUADRO_COM(P_COD_DOCUM        VARCHAR2,
                                   P_CONV             VARCHAR2,
                                   P_MCA_CUADRO       OUT VARCHAR2,
                                   P_LISTA_CUADRO_COM OUT SYS_REFCURSOR) IS
  
    CURSOR C_VALIDA_COMIS_MEL IS
      SELECT 1
        FROM MEL_VEH_COMISION T
       WHERE T.COD_DOCUM = P_COD_DOCUM
         AND T.COD_CONV IS NULL
         AND MCA_INH = 'N';
  
    R_VALIDA_COMIS_MEL C_VALIDA_COMIS_MEL%ROWTYPE;
  
    CURSOR C_VALIDA_GAP(L_COD_DOCUM CTR_CUENTAS.COD_DOCUM%TYPE) IS
      SELECT 1
        FROM CTR_CUENTAS
       WHERE COD_DOCUM = L_COD_DOCUM
         AND IDGRUPO = 24;
  
    R_VALIDA_GAP C_VALIDA_GAP%ROWTYPE;
    L_ES_GAP     BOOLEAN;
  
    C_PLANES             SYS_REFCURSOR;
    MCA_MODALIDAD        VARCHAR2(1);
    L_COD_CUADRO         VARCHAR2(10);
    L_ABREV              VARCHAR2(30);
    L_EXISTE             BOOLEAN;
    L_VALIDA_COMIS_MEL   BOOLEAN;
    L_SQL                VARCHAR2(1000);
    P_LISTA_CUADRO_COM_2 SYS_REFCURSOR;
  
  BEGIN
  
    OPEN C_VALIDA_GAP(P_COD_DOCUM);
    FETCH C_VALIDA_GAP
      INTO R_VALIDA_GAP;
    L_ES_GAP := C_VALIDA_GAP%FOUND;
    CLOSE C_VALIDA_GAP;
  
    IF L_ES_GAP THEN
    
      P_MCA_CUADRO := 'N';
      OPEN P_LISTA_CUADRO_COM FOR
        SELECT 1, 1 FROM DUAL;
    ELSE
    
      IF P_CONV IS NOT NULL THEN
      
        OPEN P_LISTA_CUADRO_COM FOR
          SELECT M.COD_CUADRO_COM, M.PORC_COM
            FROM MEL_VEH_COMISION M
           WHERE M.COD_CONV = P_CONV
             AND M.MCA_INH = 'N'
             AND COD_MODALIDAD = 8000
           ORDER BY COD_CUADRO_COM, PORC_COM ASC;
        OPEN P_LISTA_CUADRO_COM_2 FOR
          SELECT M.COD_CUADRO_COM, M.PORC_COM
            FROM MEL_VEH_COMISION M
           WHERE M.COD_CONV = P_CONV
             AND M.MCA_INH = 'N'
             AND COD_MODALIDAD = 8000
           ORDER BY COD_CUADRO_COM, PORC_COM ASC;
      
        LOOP
          FETCH P_LISTA_CUADRO_COM
            INTO L_COD_CUADRO, L_ABREV;
          L_EXISTE := P_LISTA_CUADRO_COM%FOUND;
          EXIT;
        END LOOP;
        /*
        IF P_LISTA_CUADRO_COM_2%ROWCOUNT != 1 THEN
        
          OPEN P_LISTA_CUADRO_COM FOR
            SELECT M.COD_CUADRO_COM, M.PORC_COM
              FROM MEL_VEH_COMISION M
             WHERE COD_CONV = 'MEL'
               AND COD_DOCUM IS NULL
               AND M.MCA_INH = 'N'
               AND COD_MODALIDAD = 8000
             ORDER BY COD_CUADRO_COM, PORC_COM ASC;
          OPEN P_LISTA_CUADRO_COM_2 FOR
            SELECT M.COD_CUADRO_COM, M.PORC_COM
              FROM MEL_VEH_COMISION M
             WHERE COD_CONV = 'MEL'
               AND COD_DOCUM IS NULL
               AND M.MCA_INH = 'N'
               AND COD_MODALIDAD = 8000
             ORDER BY COD_CUADRO_COM, PORC_COM ASC;
        
          LOOP
            FETCH P_LISTA_CUADRO_COM_2
              INTO L_COD_CUADRO, L_ABREV;
            L_EXISTE := P_LISTA_CUADRO_COM_2%FOUND;
            EXIT;
          END LOOP;
        
        END IF;*/
      
        IF L_EXISTE THEN
          P_MCA_CUADRO := 'S';
        ELSE
          P_MCA_CUADRO := 'N';
          OPEN P_LISTA_CUADRO_COM FOR
            SELECT 1, 1 FROM DUAL;
        END IF;
      
      ELSE
      
        /************* VALIDA SI TIENE COMISION ESPECIAL *************/
        OPEN C_VALIDA_COMIS_MEL;
        FETCH C_VALIDA_COMIS_MEL
          INTO R_VALIDA_COMIS_MEL;
        L_VALIDA_COMIS_MEL := C_VALIDA_COMIS_MEL%FOUND;
        CLOSE C_VALIDA_COMIS_MEL;
      
        IF NOT L_VALIDA_COMIS_MEL THEN
        
          OPEN P_LISTA_CUADRO_COM FOR
            SELECT M.COD_CUADRO_COM, M.PORC_COM
              FROM MEL_VEH_COMISION M
             WHERE COD_CONV = 'MEL'
               AND COD_DOCUM IS NULL
               AND M.MCA_INH = 'N'
               AND COD_MODALIDAD = 8000
             ORDER BY COD_CUADRO_COM, PORC_COM ASC;
          OPEN P_LISTA_CUADRO_COM_2 FOR
            SELECT M.COD_CUADRO_COM, M.PORC_COM
              FROM MEL_VEH_COMISION M
             WHERE COD_CONV = 'MEL'
               AND COD_DOCUM IS NULL
               AND M.MCA_INH = 'N'
               AND COD_MODALIDAD = 8000
             ORDER BY COD_CUADRO_COM, PORC_COM ASC;
        
        ELSE
        
          OPEN P_LISTA_CUADRO_COM FOR
            SELECT M.COD_CUADRO_COM, M.PORC_COM
              FROM MEL_VEH_COMISION M
             WHERE M.COD_DOCUM = P_COD_DOCUM
               AND M.MCA_INH = 'N'
               AND COD_MODALIDAD = 8000
             ORDER BY COD_CUADRO_COM, PORC_COM ASC;
          OPEN P_LISTA_CUADRO_COM_2 FOR
            SELECT M.COD_CUADRO_COM, M.PORC_COM
              FROM MEL_VEH_COMISION M
             WHERE M.COD_DOCUM = P_COD_DOCUM
               AND M.MCA_INH = 'N'
               AND COD_MODALIDAD = 8000
             ORDER BY COD_CUADRO_COM, PORC_COM ASC;
        
        END IF;
      
        LOOP
          FETCH P_LISTA_CUADRO_COM_2
            INTO L_COD_CUADRO, L_ABREV;
          L_EXISTE := P_LISTA_CUADRO_COM_2%FOUND;
          EXIT;
        END LOOP;
      
        IF L_EXISTE THEN
          P_MCA_CUADRO := 'S';
        ELSE
          P_MCA_CUADRO := 'N';
          OPEN P_LISTA_CUADRO_COM FOR
            SELECT 1, 1 FROM DUAL;
        END IF;
      
      END IF;
    
    END IF;
  
  END P_GET_LISTA_CUADRO_COM;

  PROCEDURE P_GET_PRIMA_CUADRO_COM(P_PRIMA_NETA    NUMBER,
                                   P_DESC_NETA     VARCHAR2,
                                   P_CUADRO_COM    VARCHAR2,
                                   P_COD_MODALIDAD NUMBER,
                                   P_COD_DOCUM     VARCHAR2,
                                   P_CONV          VARCHAR2,
                                   P_COD_RAMO      VARCHAR2,
                                   P_PRIMA         OUT VARCHAR2,
                                   P_PRIMA_TOTAL   OUT VARCHAR2,
                                   P_DESC          OUT VARCHAR2,
                                   P_PORC_DESC     OUT VARCHAR2,
                                   P_RECAR         OUT VARCHAR2,
                                   P_PORC_RECAR    OUT VARCHAR2) IS
  
    CURSOR C_COMISION IS
      SELECT FACTOR_TARIFA
        FROM MEL_VEH_COMISION T
       WHERE COD_CUADRO_COM = P_CUADRO_COM
         AND COD_MODALIDAD = P_COD_MODALIDAD
         AND COD_DOCUM = P_COD_DOCUM
         AND MCA_INH = 'N';
  
    CURSOR C_COMISION_CONV IS
      SELECT FACTOR_TARIFA
        FROM MEL_VEH_COMISION T
       WHERE COD_CUADRO_COM = P_CUADRO_COM
         AND COD_MODALIDAD = P_COD_MODALIDAD
         AND COD_CONV = P_CONV
         AND MCA_INH = 'N';
  
    CURSOR C_COMISION_MEL IS
      SELECT FACTOR_TARIFA
        FROM MEL_VEH_COMISION T
       WHERE COD_CUADRO_COM = P_CUADRO_COM
         AND COD_MODALIDAD = P_COD_MODALIDAD
         AND COD_CONV = 'MEL'
         AND COD_DOCUM IS NULL
         AND MCA_INH = 'N';
  
    CURSOR C_VALIDA_COMIS_MEL IS
      SELECT 1
        FROM MEL_VEH_COMISION T
       WHERE T.COD_DOCUM = P_COD_DOCUM
            --AND T.COD_CONV = 'MEL'
         AND T.COD_CONV IS NULL
         AND MCA_INH = 'N';
  
    R_VALIDA_COMIS_MEL C_VALIDA_COMIS_MEL%ROWTYPE;
  
    L_VALIDA_COMIS_MEL BOOLEAN;
  
    L_VALIDA_COMIS_MEL_DEF BOOLEAN;
  
    R_COMISION C_COMISION%ROWTYPE;
  
    L_PRIMA          NUMBER;
    L_PRIMA_COMISION NUMBER;
  
    P_DESCUENTO NUMBER;
    P_RECARGO   NUMBER;
  
    PRIMA_EXENTA NUMBER;
  
  BEGIN
  
    /*    INSERT INTO TEMP_TABLA S
      (S.RESULT, S.NUM_COTIZACION, S.FECHA)
    VALUES
      (P_PRIMA_NETA || '-' || P_DESC_NETA || '-' || P_CUADRO_COM || '-' ||
       P_COD_MODALIDAD || '-' || P_COD_DOCUM || '-' || P_CONV || '-' ||
       P_COD_RAMO,
       'CUADRO',
       SYSDATE);
    COMMIT;*/
  
    IF P_CONV IS NOT NULL THEN
    
      OPEN C_COMISION_CONV;
      FETCH C_COMISION_CONV
        INTO R_COMISION;
      L_VALIDA_COMIS_MEL_DEF := C_COMISION_CONV%FOUND;
      CLOSE C_COMISION_CONV;
    
      IF NOT L_VALIDA_COMIS_MEL_DEF THEN
      
        OPEN C_COMISION_MEL;
        FETCH C_COMISION_MEL
          INTO R_COMISION;
        CLOSE C_COMISION_MEL;
      
      END IF;
    
    ELSE
    
      OPEN C_VALIDA_COMIS_MEL;
      FETCH C_VALIDA_COMIS_MEL
        INTO R_VALIDA_COMIS_MEL;
      L_VALIDA_COMIS_MEL := C_VALIDA_COMIS_MEL%FOUND;
      CLOSE C_VALIDA_COMIS_MEL;
    
      IF NOT L_VALIDA_COMIS_MEL THEN
      
        OPEN C_COMISION_MEL;
        FETCH C_COMISION_MEL
          INTO R_COMISION;
        CLOSE C_COMISION_MEL;
      
      ELSE
      
        OPEN C_COMISION;
        FETCH C_COMISION
          INTO R_COMISION;
        L_VALIDA_COMIS_MEL_DEF := C_COMISION%FOUND;
        CLOSE C_COMISION;
      
        IF NOT L_VALIDA_COMIS_MEL_DEF THEN
        
          OPEN C_COMISION_MEL;
          FETCH C_COMISION_MEL
            INTO R_COMISION;
          CLOSE C_COMISION_MEL;
        
        END IF;
      
      END IF;
    
    END IF;
  
    L_PRIMA := ROUND(P_PRIMA_NETA * R_COMISION.FACTOR_TARIFA, 2);
  
    IF SUBSTR(P_DESC_NETA, 0, 1) = '-' THEN
    
      P_DESCUENTO := ROUND((P_DESC_NETA / 100) * L_PRIMA, 2);
      P_RECAR     := TRIM(TO_CHAR(0, '990.99'));
      P_RECARGO   := 0;
    
      P_PORC_DESC := TRIM(TO_CHAR(P_DESC_NETA));
    
      P_PORC_RECAR := ROUND(0, 2);
    
      P_DESC := TRIM(TO_CHAR(P_DESCUENTO, '990.99'));
    
      P_PRIMA := TRIM(TO_CHAR(L_PRIMA, '990.99'));
    
    ELSE
    
      P_RECARGO   := ROUND((P_DESC_NETA / 100) * L_PRIMA, 2);
      P_RECAR     := TRIM(TO_CHAR(P_RECARGO, '990.99'));
      P_DESCUENTO := 0;
    
      P_PORC_DESC := ROUND(0, 2);
    
      P_PORC_RECAR := TRIM(TO_CHAR(P_DESC_NETA));
    
      P_DESC := TRIM(TO_CHAR(0, '990.99'));
    
      P_PRIMA := TRIM(TO_CHAR(L_PRIMA, '990.99'));
    
    END IF;
  
    P_MONTO_COB_EXENTA(P_COD_RAMO, P_COD_MODALIDAD, PRIMA_EXENTA);
  
    P_PRIMA_TOTAL := P_PRIMA + TO_NUMBER(P_RECARGO) +
                     ROUND(((DC_F_IVA_VIGENTE() *
                           (P_PRIMA + TO_NUMBER(P_RECARGO) - PRIMA_EXENTA)) / 100),
                           2);
  
  END P_GET_PRIMA_CUADRO_COM;

  PROCEDURE P_GRABA_COMISION(P_NUM_COTIZACION VARCHAR2,
                             P_COD_CUADRO_COM VARCHAR2,
                             P_ERROR          OUT VARCHAR2) IS
  
  BEGIN
  
    IF P_COD_CUADRO_COM IS NOT NULL THEN
    
      UPDATE MEL_VEH_COTIZACION@OVPRO_PRD M
         SET M.COD_CUADRO_COM = P_COD_CUADRO_COM
       WHERE M.NUM_COTIZACION = P_NUM_COTIZACION;
      COMMIT;
    
    ELSE
    
      UPDATE MEL_VEH_COTIZACION@OVPRO_PRD M
         SET M.COD_CUADRO_COM = NULL
       WHERE M.NUM_COTIZACION = P_NUM_COTIZACION;
      COMMIT;
    
    END IF;
  
  END P_GRABA_COMISION;

  PROCEDURE P_TRAE_PLANES_PAGO_RIPLEY(P_COD_CIA IN NUMBER,
                                      P_CURSOR  OUT SYS_REFCURSOR,
                                      P_ERROR   OUT VARCHAR2) IS
  
  BEGIN
  
    P_ERROR := '0';
  
    OPEN P_CURSOR FOR
      SELECT COD_FRACC_PAGO NUM_CUOTAS, NOM_FRACC_PAGO
        FROM A1001402@OVPRO_PRD
       WHERE COD_FRACC_PAGO IN (13, 15)
         AND COD_CIA = P_COD_CIA
       ORDER BY NUM_CUOTAS;
  
    P_ERROR := 'OK';
  EXCEPTION
    WHEN OTHERS THEN
      P_ERROR := SUBSTR(SQLERRM, 0, 200);
  END P_TRAE_PLANES_PAGO_RIPLEY;

  PROCEDURE P_TRAE_PLANES_PAGO_COMPARA(p_cod_cia IN NUMBER,
                                       tip_pago  in VARCHAR2,
                                       p_cursor  OUT tyCursor,
                                       p_error   OUT VARCHAR2) IS
  
  BEGIN
  
    p_error := '0';
  
    if tip_pago = 'DB' then
    
      OPEN p_cursor FOR
        SELECT cod_fracc_pago NUM_CUOTAS, NOM_FRACC_PAGO
          FROM A1001402@OVPRO_PRD
         WHERE cod_fracc_pago IN (83, 89)
           AND cod_cia = p_cod_cia
         ORDER BY num_cuotas;
    
    else
    
      OPEN p_cursor FOR
        SELECT cod_fracc_pago NUM_CUOTAS, NOM_FRACC_PAGO
          FROM A1001402@OVPRO_PRD
         WHERE cod_fracc_pago IN (13, 3, 4, 6, 8, 10, 87, 58)
           AND cod_cia = p_cod_cia
         ORDER BY num_cuotas;
    
    end if;
  
    p_error := 'OK';
  EXCEPTION
    WHEN OTHERS THEN
      p_error := substr(SQLERRM, 0, 200);
  END P_TRAE_PLANES_PAGO_COMPARA;

  /*****************************************************************/

  PROCEDURE P_VALIDA_MCA_MEL(P_COD_DOCUM      VARCHAR2,
                             P_COD_CONV       VARCHAR2,
                             P_VALIDA_MCA_MEL OUT VARCHAR2,
                             P_MCA_MEL        OUT VARCHAR2) IS
  
    CURSOR C_VALIDA_AGENTE IS
      SELECT 1
        FROM CTR_CUENTAS
       WHERE COD_DOCUM = P_COD_DOCUM
         AND IDGRUPO IN (10, 11, 24, 28, 52);
  
    R_VALIDA_AGENTE C_VALIDA_AGENTE%ROWTYPE;
    L_EXISTE        BOOLEAN;
  
  BEGIN
  
    if P_COD_CONV IS NULL THEN
    
      OPEN C_VALIDA_AGENTE;
      FETCH C_VALIDA_AGENTE
        INTO R_VALIDA_AGENTE;
      L_EXISTE := C_VALIDA_AGENTE%FOUND;
      CLOSE C_VALIDA_AGENTE;
    
      IF L_EXISTE THEN
      
        P_VALIDA_MCA_MEL := 'S';
        P_MCA_MEL        := '';
      
      ELSE
      
        P_VALIDA_MCA_MEL := 'N';
        P_MCA_MEL        := 'S';
      
      END IF;
    
    ELSE
    
      P_VALIDA_MCA_MEL := 'N';
      P_MCA_MEL        := 'S';
    
    END IF;
  
  END P_VALIDA_MCA_MEL;


  -- FDR
  PROCEDURE P_MONTO_COB_EXENTA(P_COD_RAMO      VARCHAR2,
                               P_COD_MODALIDAD VARCHAR2,
                               P_MONTO_EXENTA  OUT NUMBER) IS
  
    CURSOR C_BUSCA_MONTO(L_COD_COB VARCHAR2) IS
      select imp_prima
        from tron2000.G2009910_MCL@OVPRO_PRD t
       where cod_ramo = P_COD_RAMO
         and cod_cob = L_COD_COB
         and cod_modalidad = P_COD_MODALIDAD
         and cod_cia = 1;
  
    R_BUSCA_MONTO C_BUSCA_MONTO%ROWTYPE;
    L_EXISTE      BOOLEAN;
  
  BEGIN
  
    P_MONTO_EXENTA := 0;
  
    OPEN C_BUSCA_MONTO('6300');
    FETCH C_BUSCA_MONTO
      INTO R_BUSCA_MONTO;
    L_EXISTE := C_BUSCA_MONTO%FOUND;
    CLOSE C_BUSCA_MONTO;
  
    IF L_EXISTE THEN
      P_MONTO_EXENTA := P_MONTO_EXENTA + R_BUSCA_MONTO.IMP_PRIMA;
    ELSE
      P_MONTO_EXENTA := 0;
    END IF;
  
  END P_MONTO_COB_EXENTA;

  procedure P_DATOS_AUTOMORA(P_COD_DOCUM      VARCHAR2,
                             P_NOM_AUTOMOTORA OUT VARCHAR2) IS
  
    CURSOR C_EXISTE_AUTOMOTORA IS
      Select *
        from a1001390@ovpro_prd
       where cod_cia = 1
         and tip_docum in ('RUT', 'DIR')
         and cod_docum = P_COD_DOCUM
         and cod_act_tercero = 17;
  
    R_EXISTE_AUTOMOTORA C_EXISTE_AUTOMOTORA%ROWTYPE;
  
    CURSOR c_tercero IS
      SELECT nom_tercero, ape1_tercero, ape2_tercero
        FROM a1001399@OVPRO_PRD
       WHERE cod_cia = 1
         AND TIP_DOCUM = 'RUT'
         AND cod_docum = P_COD_DOCUM;
  
    R_TERCERO c_tercero%ROWTYPE;
  
    CURSOR C_EXISTE_TALLER IS
      Select *
        from a1001390@ovpro_prd
       where cod_cia = 1
         and tip_docum in ('RUT', 'DIR')
         and cod_docum = P_COD_DOCUM
         and cod_act_tercero = 17;
  
    R_EXISTE_TALLER C_EXISTE_TALLER%ROWTYPE;
  
    l_existe        boolean;
    l_existe_taller boolean;
  
  BEGIN
  
    OPEN C_EXISTE_AUTOMOTORA;
    FETCH C_EXISTE_AUTOMOTORA
      INTO R_EXISTE_AUTOMOTORA;
    l_existe := C_EXISTE_AUTOMOTORA%FOUND;
    CLOSE C_EXISTE_AUTOMOTORA;
  
    if l_existe then
    
      open c_tercero;
      fetch c_tercero
        into R_TERCERO;
      close c_tercero;
    
      P_NOM_AUTOMOTORA := R_TERCERO.NOM_TERCERO;
    
    else
    
      OPEN C_EXISTE_TALLER;
      FETCH C_EXISTE_TALLER
        INTO R_EXISTE_TALLER;
      l_existe_taller := C_EXISTE_TALLER%FOUND;
      CLOSE C_EXISTE_TALLER;
    
      if l_existe_taller then
      
        open c_tercero;
        fetch c_tercero
          into R_TERCERO;
        close c_tercero;
      
        P_NOM_AUTOMOTORA := R_TERCERO.NOM_TERCERO;
      
      end if;
    
    end if;
  
  END P_DATOS_AUTOMORA;

  PROCEDURE P_GRABA_DATOS_FACTURA(P_NUM_COTIZACION       VARCHAR2,
                                  P_NUM_FACTURA          VARCHAR2,
                                  P_FEC_FACTURA          VARCHAR2,
                                  P_COD_DOCUM_AUTOMOTORA VARCHAR2,
                                  P_NOM_AUTOMORA         VARCHAR2,
                                  P_ERROR                OUT VARCHAR2) IS
  
  BEGIN
  
    P_ERROR := '0';
  
    UPDATE MEL_VEH_FACTURA
       SET NUM_FACTURA          = P_NUM_FACTURA,
           FECHA_FACTURA        = TO_DATE(P_FEC_FACTURA, 'DD-MM-YYYY'),
           COD_DOCUM_AUTOMOTORA = P_COD_DOCUM_AUTOMOTORA,
           NOM_AUTOMOTORA       = SUBSTR(P_NOM_AUTOMORA, 1, 50)
     WHERE NUM_COTIZACION = P_NUM_COTIZACION;
  
    IF SQL%NOTFOUND THEN
    
      INSERT INTO MEL_VEH_FACTURA
        (NUM_COTIZACION,
         NUM_FACTURA,
         COD_DOCUM_AUTOMOTORA,
         NOM_AUTOMOTORA,
         FECHA_FACTURA,
         FEC_ACTU)
      VALUES
        (P_NUM_COTIZACION,
         P_NUM_FACTURA,
         P_COD_DOCUM_AUTOMOTORA,
         SUBSTR(P_NOM_AUTOMORA, 1, 50),
         TO_DATE(P_FEC_FACTURA, 'DD-MM-YYYY'),
         SYSDATE);
    
    END IF;
  
    COMMIT;
  
    /**********************A1001390*********************/
  
    UPDATE TRON2000.A1001390@OVPRO_PRD
       SET COD_CIA         = 1,
           TIP_DOCUM       = 'RUT',
           COD_DOCUM       = P_COD_DOCUM_AUTOMOTORA,
           COD_ACT_TERCERO = 1,
           COD_USR         = 'OVIRTUAL',
           FEC_ACTU        = SYSDATE,
           COD_TERCERO     = 1,
           TIP_DOCUM_PADRE = 'RUT',
           COD_DOCUM_PADRE = P_COD_DOCUM_AUTOMOTORA
     WHERE COD_CIA = 1
       AND TIP_DOCUM = 'RUT'
       AND COD_DOCUM = P_COD_DOCUM_AUTOMOTORA
       AND COD_ACT_TERCERO = 87;
  
    IF SQL%NOTFOUND THEN
    
      INSERT INTO TRON2000.A1001390@OVPRO_PRD
      VALUES
        (1,
         'RUT',
         P_COD_DOCUM_AUTOMOTORA,
         1,
         'OVIRTUAL',
         SYSDATE,
         87,
         'RUT',
         P_COD_DOCUM_AUTOMOTORA);
    
    END IF;
  
  EXCEPTION
    WHEN OTHERS THEN
      P_ERROR := SUBSTR(SQLERRM, 0, 99);
    
  END P_GRABA_DATOS_FACTURA;

  PROCEDURE P_TRAE_DATOS_FACTURA(P_NUM_COTIZACION       VARCHAR2,
                                 P_NUM_FACTURA          OUT VARCHAR2,
                                 P_FEC_FACTURA          OUT VARCHAR2,
                                 P_COD_DOCUM_AUTOMOTORA OUT VARCHAR2,
                                 P_NOM_AUTOMORA         OUT VARCHAR2) IS
  
    CURSOR C_DATOS_FACTURA IS
      SELECT *
        FROM MEL_VEH_FACTURA F
       WHERE F.NUM_COTIZACION = P_NUM_COTIZACION;
  
    R_DATOS_FACTURA C_DATOS_FACTURA%ROWTYPE;
  
  BEGIN
  
    OPEN C_DATOS_FACTURA;
    FETCH C_DATOS_FACTURA
      INTO R_DATOS_FACTURA;
    CLOSE C_DATOS_FACTURA;
  
    P_NUM_FACTURA          := R_DATOS_FACTURA.NUM_FACTURA;
    P_FEC_FACTURA          := TO_CHAR(R_DATOS_FACTURA.FECHA_FACTURA,
                                      'DDMMYYYY');
    P_COD_DOCUM_AUTOMOTORA := R_DATOS_FACTURA.COD_DOCUM_AUTOMOTORA;
    P_NOM_AUTOMORA         := R_DATOS_FACTURA.NOM_AUTOMOTORA;
  
  END P_TRAE_DATOS_FACTURA;

  PROCEDURE P_TRAE_DEDUCIBLE_MODALIDAD(P_COD_RAMO      VARCHAR2,
                                       P_COD_MODALIDAD VARCHAR2,
                                       P_DEDUCIBLE     OUT VARCHAR2,
                                       P_ERROR         OUT VARCHAR2) IS
  
    CURSOR c_deducible(pc_cod_modalidad VARCHAR2) IS
      SELECT val_franquicia
        FROM a2100700@ovpro_prd
       WHERE cod_cia = 1
         AND cod_franquicia =
             (SELECT DISTINCT cod_franquicia
                FROM tron2000.g2009920_mcl@ovpro_prd t
               WHERE cod_cia = 1
                 AND cod_ramo IN (p_cod_ramo, 999)
                 AND cod_modalidad = pc_cod_modalidad)
         AND cod_mon = 91;
  
    R_DEDUCIBLE C_DEDUCIBLE%ROWTYPE;
    l_existe    boolean;
  
    --
    CURSOR c_cod_modalidad IS
    --
      SELECT t.cod_plan_real
        FROM mel_planes_veh_ficticios t
       WHERE t.cod_plan = p_cod_modalidad;
    --
    l_existe_mod BOOLEAN;
    --
    l_cod_modalidad VARCHAR2(10);
    --
  
  BEGIN
  
    --
    OPEN c_cod_modalidad;
    FETCH c_cod_modalidad
      INTO l_cod_modalidad;
    l_existe_mod := c_cod_modalidad%FOUND;
    CLOSE c_cod_modalidad;
    --
    IF NOT l_existe_mod THEN
      --
      l_cod_modalidad := p_cod_modalidad;
      --
    END IF;
    --  
    P_ERROR := 0;
  
    OPEN c_deducible(l_cod_modalidad);
    FETCH c_deducible
      INTO r_deducible;
    l_existe := c_deducible%FOUND;
    CLOSE c_deducible;
  
    if l_existe then
      P_DEDUCIBLE := R_DEDUCIBLE.val_franquicia;
    else
      P_DEDUCIBLE := 'S/I';
      P_ERROR     := 1000;
      OV.P_ENVIA_MAIL_HTML('OV@MAPFRE.CL',
                           'GERARDO.PEREZ@MAPFRE.CL',
                           'ERROR EN COTIZADOR DE VEHICULOS LIVIANOS - SIN DEDUCIBLE',
                           P_ERROR || '-' || P_COD_RAMO || '-' ||
                           P_COD_MODALIDAD);
    end if;
  
  EXCEPTION
    WHEN OTHERS THEN
      P_ERROR := SUBSTR(SQLERRM, 0, 99);
      OV.P_ENVIA_MAIL_HTML('OV@MAPFRE.CL',
                           'GERARDO.PEREZ@MAPFRE.CL',
                           'ERROR EN COTIZADOR DE VEHICULOS LIVIANOS - SIN DEDUCIBLE',
                           P_ERROR || '-' || P_COD_RAMO || '-' ||
                           P_COD_MODALIDAD);
    
  END P_TRAE_DEDUCIBLE_MODALIDAD;

  PROCEDURE P_NOM_MODALIDAD_FANTASIA(P_COD_MODALIDAD IN NUMBER,
                                     P_NOM_MODALIDAD OUT VARCHAR2,
                                     P_DEDUCIBLE     OUT VARCHAR2) IS
  
    CURSOR C_NOM_MODALIDAD IS
      SELECT B.NOM_MODALIDAD_FANTASIA, B.DEDUCIBLE
        FROM MEL_VEH_NOM_PLANES B
       WHERE B.COD_CIA = 1
         AND B.COD_RAMO IN (801, 802, 803, 808, 809)
         AND B.COD_MODALIDAD = P_COD_MODALIDAD
         AND B.MCA_INH = 'N'
       ORDER BY nom_modalidad_fantasia;
  
    R_NOM_MODALIDAD C_NOM_MODALIDAD%ROWTYPE;
  
  BEGIN
  
    OPEN C_NOM_MODALIDAD;
    FETCH C_NOM_MODALIDAD
      INTO R_NOM_MODALIDAD;
    CLOSE C_NOM_MODALIDAD;
  
    P_NOM_MODALIDAD := R_NOM_MODALIDAD.NOM_MODALIDAD_FANTASIA;
    P_DEDUCIBLE     := R_NOM_MODALIDAD.DEDUCIBLE;
  
  END P_NOM_MODALIDAD_FANTASIA;

  PROCEDURE P_UPD_SISGEN_COTIZACION(P_NUM_COTIZACION   IN VARCHAR2,
                                    P_CANT_SINIESTROS  IN NUMBER,
                                    P_MONTO_SINIESTROS IN NUMBER,
                                    P_ERROR            OUT VARCHAR2) IS
  
  BEGIN
  
    P_ERROR := '0';
  
    UPDATE MEL_VEH_COTIZACION@OVPRO_PRD
       SET CANT_SINIESTROS  = P_CANT_SINIESTROS,
           MONTO_SINIESTROS = P_MONTO_SINIESTROS
     WHERE NUM_COTIZACION = P_NUM_COTIZACION;
  
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      P_ERROR := '1001';
    
  END P_UPD_SISGEN_COTIZACION;

  PROCEDURE P_GET_PRIMA_SIN_CUADRO_COM(P_PRIMA_NETA            NUMBER,
                                       P_DESC_NETA             VARCHAR2,
                                       P_CUADRO_COM            VARCHAR2,
                                       P_COD_MODALIDAD         NUMBER,
                                       P_COD_DOCUM             VARCHAR2,
                                       P_CONV                  VARCHAR2,
                                       P_COD_RAMO              VARCHAR2,
                                       P_PRIMA_NETA_SIN_CUADRO OUT VARCHAR2) IS
  
    CURSOR C_COMISION IS
      SELECT FACTOR_TARIFA
        FROM MEL_VEH_COMISION T
       WHERE COD_CUADRO_COM = P_CUADRO_COM
         AND COD_MODALIDAD = P_COD_MODALIDAD
         AND COD_DOCUM = P_COD_DOCUM
         AND MCA_INH = 'N';
  
    CURSOR C_COMISION_CONV IS
      SELECT FACTOR_TARIFA
        FROM MEL_VEH_COMISION T
       WHERE COD_CUADRO_COM = P_CUADRO_COM
         AND COD_MODALIDAD = P_COD_MODALIDAD
         AND COD_CONV = P_CONV
         AND MCA_INH = 'N';
  
    CURSOR C_COMISION_MEL IS
      SELECT FACTOR_TARIFA
        FROM MEL_VEH_COMISION T
       WHERE COD_CUADRO_COM = P_CUADRO_COM
         AND COD_MODALIDAD = P_COD_MODALIDAD
         AND COD_CONV = 'MEL'
         AND COD_DOCUM IS NULL
         AND MCA_INH = 'N';
  
    CURSOR C_VALIDA_COMIS_MEL IS
      SELECT 1
        FROM MEL_VEH_COMISION T
       WHERE T.COD_DOCUM = P_COD_DOCUM
            --AND T.COD_CONV = 'MEL'
         AND T.COD_CONV IS NULL
         AND MCA_INH = 'N';
  
    R_VALIDA_COMIS_MEL C_VALIDA_COMIS_MEL%ROWTYPE;
  
    L_VALIDA_COMIS_MEL BOOLEAN;
  
    R_COMISION C_COMISION%ROWTYPE;
  
    L_PRIMA          NUMBER;
    L_PRIMA_COMISION NUMBER;
  
    P_DESCUENTO NUMBER;
    P_RECARGO   NUMBER;
  
    PRIMA_EXENTA NUMBER;
  
  BEGIN
  
    /*    INSERT INTO TEMP_TABLA S
      (S.RESULT, S.NUM_COTIZACION, S.FECHA)
    VALUES
      (P_PRIMA_NETA || '-' || P_DESC_NETA || '-' || P_CUADRO_COM || '-' ||
       P_COD_MODALIDAD || '-' || P_COD_DOCUM || '-' || P_CONV || '-' ||
       P_COD_RAMO,
       'CUADRO',
       SYSDATE);
    COMMIT;*/
  
    IF P_CONV IS NOT NULL THEN
    
      OPEN C_COMISION_CONV;
      FETCH C_COMISION_CONV
        INTO R_COMISION;
      CLOSE C_COMISION_CONV;
    
    ELSE
    
      OPEN C_VALIDA_COMIS_MEL;
      FETCH C_VALIDA_COMIS_MEL
        INTO R_VALIDA_COMIS_MEL;
      L_VALIDA_COMIS_MEL := C_VALIDA_COMIS_MEL%FOUND;
      CLOSE C_VALIDA_COMIS_MEL;
    
      IF NOT L_VALIDA_COMIS_MEL THEN
      
        OPEN C_COMISION_MEL;
        FETCH C_COMISION_MEL
          INTO R_COMISION;
        CLOSE C_COMISION_MEL;
      
      ELSE
      
        OPEN C_COMISION;
        FETCH C_COMISION
          INTO R_COMISION;
        CLOSE C_COMISION;
      
      END IF;
    
    END IF;
  
    L_PRIMA := ROUND(P_PRIMA_NETA / R_COMISION.FACTOR_TARIFA, 2);
  
    IF SUBSTR(P_DESC_NETA, 0, 1) = '-' THEN
    
      /*      P_DESCUENTO := ROUND((P_DESC_NETA / 100) * L_PRIMA, 2);
      P_RECAR     := TRIM(TO_CHAR(0, '990.99'));
      P_RECARGO   := 0;
      
      P_PORC_DESC := TRIM(TO_CHAR(P_DESC_NETA));
      
      P_PORC_RECAR := ROUND(0, 2);
      
      P_DESC := TRIM(TO_CHAR(P_DESCUENTO, '990.99'));*/
    
      P_PRIMA_NETA_SIN_CUADRO := TRIM(TO_CHAR(L_PRIMA, '990.99'));
    
    ELSE
    
      /*P_RECARGO   := ROUND((P_DESC_NETA / 100) * L_PRIMA, 2);
      P_RECAR     := TRIM(TO_CHAR(P_RECARGO, '990.99'));
      P_DESCUENTO := 0;
      
      P_PORC_DESC := ROUND(0, 2);
      
      P_PORC_RECAR := TRIM(TO_CHAR(P_DESC_NETA));
      
      P_DESC := TRIM(TO_CHAR(0, '990.99'));*/
    
      P_PRIMA_NETA_SIN_CUADRO := TRIM(TO_CHAR(L_PRIMA, '990.99'));
    
    END IF;
    /*
    P_MONTO_COB_EXENTA(P_COD_RAMO, P_COD_MODALIDAD, PRIMA_EXENTA);
    
    P_PRIMA_TOTAL := P_PRIMA + TO_NUMBER(P_RECARGO) +
                     ROUND(((DC_F_IVA_VIGENTE() *
                           (P_PRIMA + TO_NUMBER(P_RECARGO) - PRIMA_EXENTA)) / 100),
                           2);*/
  
  END P_GET_PRIMA_SIN_CUADRO_COM;

  PROCEDURE P_GRABA_RESPUESTAS(P_NUM_COTIZACION VARCHAR2,
                               P_HIJOS          VARCHAR2,
                               P_FRANQUICIA     VARCHAR2,
                               P_DANOS          VARCHAR2,
                               P_ERROR          OUT VARCHAR2) IS
  
  BEGIN
  
    P_ERROR := '';
  
    UPDATE MEL_VEH_COTIZACION@OVPRO_PRD M
       SET M.MCA_HIJOS      = P_HIJOS,
           M.MCA_FRANQUICIA = P_FRANQUICIA,
           M.MCA_DANOSPRE   = P_DANOS
     WHERE M.NUM_COTIZACION = P_NUM_COTIZACION;
    COMMIT;
  
  EXCEPTION
    WHEN OTHERS THEN
    
      P_ERROR := 'Problemas al actualizar el registro';
    
  END P_GRABA_RESPUESTAS;

  /*************************************/

  PROCEDURE P_IMPRIME_COTIZACION2(P_NUM_COTIZACION VARCHAR2,
                                  P_NUM_CUOTAS_PAT NUMBER,
                                  P_NOM_FIC        OUT VARCHAR2,
                                  P_ERROR          OUT VARCHAR2) IS
  
    L_NOM_FICHERO VARCHAR2(45);
    L_ID_FICHERO  UTL_FILE.FILE_TYPE;
    L_DIRECTORIO  VARCHAR2(255);
    /* V_MARCA          VARCHAR2(255);
    V_MODELO         VARCHAR2(255);
    V_SUBMODELO      VARCHAR2(255);
    V_NOM_USO        VARCHAR2(255);
    P_TEXTO          VARCHAR2(255);
    L_ADICIONALES    VARCHAR2(255);*/
    L_ABR_FORMULARIO VARCHAR2(45);
  
    V_NOM_TERCERO  VARCHAR2(100);
    V_APE1_TERCERO VARCHAR2(100);
    V_APE2_TERCERO VARCHAR2(100);
    V_ERROR        VARCHAR2(100);
  
    --L_COD_DESG G2000180.COD_DESGLOSE%TYPE;
  
    /* COD_COB             VARCHAR2(1000);
    IMP_ACUMULADO_ANUAL VARCHAR2(100);
    IMP_SPTO            VARCHAR2(10);
    IMP_ANUAL           VARCHAR2(100);
    L_CONT              NUMBER(4);
    L_IVA_PRIMA         VARCHAR2(10);
    L_PRIMA_FINAL       VARCHAR2(10);*/
  
    /*L_EXISTE      BOOLEAN;
    L_EXISTE_DESG BOOLEAN;
    IMP_SPTO_N    VARCHAR2(10);*/
  
    /*SUM_IMP_SPTO    VARCHAR2(1000);
    SUM_IVA_PRIMA   VARCHAR2(1000);
    SUM_PRIMA_FINAL VARCHAR2(1000);
    TOTAL_PRIMAS    VARCHAR2(1000);
    
    P_VALORES_COB VARCHAR2(1000);*/
  
    V_SISGEN VARCHAR2(1);
  
    CURSOR C_DATA_COTIZACION(PC_NUM_COTIZACION VARCHAR2) IS
      SELECT A.NUM_COTIZACION,
             A.COD_DOCUM_ASEG,
             A.COD_DOCUM_MAE,
             FEC_ACTU,
             COD_PLAN
        FROM MEL_CAB_COTIZACION@OVPRO_PRD A
       WHERE A.COD_CIA = 1
         AND A.NUM_COTIZACION = P_NUM_COTIZACION;
  
    R_DATA_COTIZACION C_DATA_COTIZACION%ROWTYPE;
  
    CURSOR C_COTIZACIONES IS
      SELECT num_cotizacion,
             num_matricula,
             cod_modalidad,
             cod_docum_aseg,
             cod_docum_ben,
             imp_prima_neta,
             imp_prima_bruta,
             fec_actu,
             fec_efec_spto,
             fec_vcto_spto,
             deducible,
             cod_ramo,
             monto_rc,
             monto_dm,
             monto_lc,
             monto_comp,
             asistencia,
             prima,
             anos_sin_sini,
             contacto_inspecc,
             valor_referencial,
             cod_uso_vehi,
             factura_48,
             mca_mod_prima,
             estado,
             id,
             mca_inspeccion,
             cod_comuna,
             sel_emitir,
             iva,
             descuento,
             recargo,
             cod_docum_suplanta,
             edad_conductor,
             cod_cuadro_com,
             mca_mel,
             cant_siniestros,
             monto_siniestros,
             monto_cuota,
             mca_pagado,
             mca_hijos,
             mca_franquicia,
             mca_danospre
        FROM MEL_VEH_COTIZACION@OVPRO_PRD A
       WHERE A.NUM_COTIZACION = P_NUM_COTIZACION
       ORDER BY A.IMP_PRIMA_BRUTA DESC;
  
    CURSOR C_COBERTURAS(L_COD_MODALIDAD VARCHAR2) IS
      SELECT *
        FROM MEL_VEH_TABLA_COBERTURAS T
       WHERE COD_MODALIDAD = L_COD_MODALIDAD
         AND MCA_INH = 'N';
  
    CURSOR C_NOM_CORREDOR IS
      SELECT NOM_TERCERO || ' ' || APE1_TERCERO || ' ' || APE2_TERCERO NOM_CORREDOR,
             R.NOM_NIVEL3
        FROM A1001399@OVPRO_PRD T,
             A1001332@OVPRO_PRD Q,
             A1000702@OVPRO_PRD R
       WHERE T.COD_CIA = 1
         AND T.TIP_DOCUM = 'RUT'
         AND T.COD_DOCUM = (SELECT COD_DOCUM_MAE
                              FROM TRON2000.MEL_CAB_COTIZACION@OVPRO_PRD T
                             WHERE T.NUM_COTIZACION = P_NUM_COTIZACION
                               AND ROWNUM < 2)
         AND T.COD_CIA = Q.COD_CIA
         AND T.TIP_DOCUM = Q.TIP_DOCUM
         AND T.COD_DOCUM = Q.COD_DOCUM
         AND Q.COD_CIA = R.COD_CIA
         AND Q.COD_NIVEL3 = R.COD_NIVEL3
         AND Q.COD_ACT_TERCERO = 2
         AND Q.COD_CALIDAD = 1
         AND Q.MCA_INH = 'N'
         AND Q.FEC_VALIDEZ = (SELECT MAX(F.FEC_VALIDEZ)
                                FROM A1001332@OVPRO_PRD F
                               WHERE F.COD_AGT = Q.COD_AGT
                                 AND F.COD_CIA = 1)
         AND ROWNUM < 2;
  
    R_NOM_CORREDOR C_NOM_CORREDOR%ROWTYPE;
  
    CURSOR C_NOM_TERCERO(P_RUT VARCHAR2) IS
      SELECT NOM_TERCERO, APE1_TERCERO
        FROM A1001399@OVPRO_PRD
       WHERE COD_CIA = 1
         AND TIP_DOCUM IN ('RUT', 'DIR')
         AND COD_DOCUM = P_RUT;
  
    R_NOM_TERCERO C_NOM_TERCERO%ROWTYPE;
  
    CURSOR C_MODALIDAD(P_COD_MODALIDAD NUMBER) IS
      SELECT DISTINCT B.NOM_MODALIDAD
        FROM A1002090@OVPRO_PRD A, G2990004@OVPRO_PRD B
       WHERE A.COD_RAMO IN (801, 802, 803, 808)
         AND B.COD_MODALIDAD >= 8000
         AND B.COD_CIA = A.COD_CIA
         AND B.COD_MODALIDAD = A.COD_MODALIDAD
         AND B.COD_MODALIDAD = P_COD_MODALIDAD;
  
    V_NOM_MODALIDAD VARCHAR2(100);
    CONTADOR        NUMBER;
    CONTADOR_PAT    NUMBER;
  
    CURSOR NOMBRES(L_MAR NUMBER, L_MOD NUMBER, L_SUBMOD NUMBER) IS
      SELECT A.NOM_MARCA, B.NOM_MODELO, C.NOM_SUB_MODELO
        FROM A2100400@OVPRO_PRD A,
             A2100410@OVPRO_PRD B,
             A2100420@OVPRO_PRD C
       WHERE A.COD_CIA = 1
         AND A.COD_CIA = B.COD_CIA
         AND A.COD_CIA = C.COD_CIA
         AND A.MCA_INH = 'N'
         AND A.MCA_INH = B.MCA_INH
         AND A.MCA_INH = C.MCA_INH
         AND A.COD_MARCA = L_MAR
         AND A.COD_MARCA = B.COD_MARCA
         AND A.COD_MARCA = C.COD_MARCA
         AND B.COD_MODELO = L_MOD
         AND B.COD_MODELO = C.COD_MODELO
         AND C.COD_SUB_MODELO = L_SUBMOD;
  
    R_NOMBRES NOMBRES %ROWTYPE;
  
    CURSOR C_VEH_COTIZACIONES IS
      SELECT num_cotizacion,
             num_matricula,
             cod_modalidad,
             cod_docum_aseg,
             cod_docum_ben,
             imp_prima_neta,
             imp_prima_bruta,
             fec_actu,
             fec_efec_spto,
             fec_vcto_spto,
             deducible,
             cod_ramo,
             monto_rc,
             monto_dm,
             monto_lc,
             monto_comp,
             asistencia,
             prima,
             anos_sin_sini,
             contacto_inspecc,
             valor_referencial,
             cod_uso_vehi,
             factura_48,
             mca_mod_prima,
             estado,
             id,
             mca_inspeccion,
             cod_comuna,
             sel_emitir,
             iva,
             descuento,
             recargo,
             cod_docum_suplanta,
             edad_conductor,
             cod_cuadro_com,
             mca_mel,
             cant_siniestros,
             monto_siniestros,
             monto_cuota,
             mca_pagado,
             mca_hijos,
             mca_franquicia,
             mca_danospre
        FROM MEL_VEH_COTIZACION@OVPRO_PRD A
       WHERE A.NUM_COTIZACION = P_NUM_COTIZACION;
  
    R_VEH_COTIZACIONES C_VEH_COTIZACIONES%ROWTYPE;
  
    CURSOR VEHICULO(V_ID VARCHAR2) IS
      SELECT *
        FROM OV_VEHICULO
       WHERE ID = V_ID
         AND ROWNUM < 2;
  
    R_VEHICULO VEHICULO%ROWTYPE;
  
    CURSOR C_TRAE_CONDUCTORES(L_EDAD_CONDUCTOR VARCHAR2) IS
      SELECT *
        FROM MEL_VEH_DESC_CONDUCTOR
       WHERE TIP_CONDUCTOR = L_EDAD_CONDUCTOR;
  
    R_TRAE_CONDUCTORES C_TRAE_CONDUCTORES%ROWTYPE;
  
    CURSOR C_COD_AGT(PC_NUM_COTIZACION VARCHAR2) IS
      SELECT COD_AGT
        FROM A1001332@OVPRO_PRD A
       WHERE A.COD_CIA = 1
         AND A.TIP_DOCUM = 'RUT'
         AND A.COD_DOCUM = (SELECT COD_DOCUM_MAE
                              FROM TRON2000.MEL_CAB_COTIZACION@OVPRO_PRD T
                             WHERE T.NUM_COTIZACION = P_NUM_COTIZACION
                               AND ROWNUM < 2);
  
    R_COD_AGT C_COD_AGT%ROWTYPE;
  
    CURSOR C_COMISION(L_CUADRO_COM VARCHAR2, L_COD_MODALIDAD VARCHAR2) IS
      SELECT PORC_COM
        FROM MEL_VEH_COMISION T
       WHERE COD_CUADRO_COM = L_CUADRO_COM
         AND COD_MODALIDAD = L_COD_MODALIDAD
         AND MCA_INH = 'N';
  
    R_COMISION C_COMISION%ROWTYPE;
  
    CURSOR C_NOM_CUOTA IS
      SELECT NOM_FRACC_PAGO
        FROM A1001402@OVPRO_PRD
       WHERE cod_fracc_pago = P_NUM_CUOTAS_PAT
         AND cod_cia = 1;
  
    R_NOM_CUOTA C_NOM_CUOTA%ROWTYPE;
  
    V_VALOR_CUOTA        VARCHAR2(20);
    V_TXT_EDAD_CONDUCTOR VARCHAR2(60);
  
    V_IMP_NETO             VARCHAR2(20);
    V_INT_IMPTO            VARCHAR2(20);
    V_VAL_CUOTA_NETA       VARCHAR2(20);
    V_VAL_CUOTA_IMPTO      VARCHAR2(20);
    L_RANGO_EDAD_CONDUCTOR VARCHAR2(20);
    FLAG_CLAUSULA          NUMBER;
  
    FLAG_FLEX      VARCHAR2(2);
    FLAG_BALANCE   VARCHAR2(2);
    FLAG_MASTER    VARCHAR2(2);
    FLAG_ELEMENTAL VARCHAR2(2);
  
    L_NUM_POLIZA_GRUPO VARCHAR2(20);
    L_NUM_CONTRATO     VARCHAR2(20);
    L_MCA_EXPRESS      VARCHAR2(10);
    L_MCA_SEXO         VARCHAR2(10);
    L_MCA_DESCUENTO    VARCHAR2(10);
    L_TIPO_DESC        VARCHAR2(10);
    L_VALOR_DESC       VARCHAR2(10);
  
  BEGIN
  
    /********************************************************************/
  
    OPEN C_DATA_COTIZACION(P_NUM_COTIZACION);
    FETCH C_DATA_COTIZACION
      INTO R_DATA_COTIZACION;
    CLOSE C_DATA_COTIZACION;
  
    OPEN C_COD_AGT(P_NUM_COTIZACION);
    FETCH C_COD_AGT
      INTO R_COD_AGT;
    CLOSE C_COD_AGT;
  
    OPEN C_NOM_CORREDOR;
    FETCH C_NOM_CORREDOR
      INTO R_NOM_CORREDOR;
    CLOSE C_NOM_CORREDOR;
  
    OPEN C_NOM_TERCERO(R_DATA_COTIZACION.COD_DOCUM_ASEG);
    FETCH C_NOM_TERCERO
      INTO R_NOM_TERCERO;
    CLOSE C_NOM_TERCERO;
  
    OPEN C_VEH_COTIZACIONES;
    FETCH C_VEH_COTIZACIONES
      INTO R_VEH_COTIZACIONES;
    CLOSE C_VEH_COTIZACIONES;
  
    OPEN VEHICULO(R_VEH_COTIZACIONES.ID);
    FETCH VEHICULO
      INTO R_VEHICULO;
    CLOSE VEHICULO;
  
    OPEN NOMBRES(R_VEHICULO.COD_MARCA,
                 R_VEHICULO.COD_MODELO,
                 R_VEHICULO.COD_SUB_MODELO);
    FETCH NOMBRES
      INTO R_NOMBRES;
    CLOSE NOMBRES;
  
    OPEN C_NOM_CUOTA;
    FETCH C_NOM_CUOTA
      INTO R_NOM_CUOTA;
    CLOSE C_NOM_CUOTA;
  
    mel_p_num_pol_grupo(1,
                        801,
                        R_DATA_COTIZACION.COD_DOCUM_MAE,
                        R_VEH_COTIZACIONES.COD_DOCUM_BEN,
                        R_DATA_COTIZACION.COD_PLAN,
                        L_NUM_POLIZA_GRUPO,
                        L_NUM_CONTRATO);
  
    MEL_K_TERCERO_TRN.P_TRAE_NOM_ASEGURADO(R_DATA_COTIZACION.COD_DOCUM_ASEG,
                                           V_NOM_TERCERO,
                                           V_APE1_TERCERO,
                                           V_APE2_TERCERO,
                                           V_ERROR);
  
    CASE R_VEH_COTIZACIONES.COD_DOCUM_BEN
      WHEN 'RIPLEY' THEN
        L_ABR_FORMULARIO := 'COTIZ_VEH_RIPLEY';
      WHEN 'RIPLEYBI' THEN
        L_ABR_FORMULARIO := 'COTIZ_VEH_RIPLEY';
      WHEN 'RIPLEYFUNC' THEN
        L_ABR_FORMULARIO := 'COTIZ_VEH_RIPLEY';
        --WHEN 'RIPLEYCALL' THEN
      WHEN 'RIPLEYDESCU' THEN
        L_ABR_FORMULARIO := 'COTIZ_VEH_RIPLEY';
      WHEN 'RIPLEYCC' THEN
        L_ABR_FORMULARIO := 'COTIZ_VEH_RIPLEY_ASIST';
      WHEN 'RIPLEYUC' THEN
        L_ABR_FORMULARIO := 'COTIZ_VEH_RIPLEY_ASIST';
      WHEN 'RIPLEYUCHILE' THEN
        L_ABR_FORMULARIO := 'COTIZ_VEH_RIPLEY_ASIST';
      WHEN 'RIPLEYXBOX' THEN
        L_ABR_FORMULARIO := 'COTIZ_VEH_RIPLEY_ASIST';
      WHEN 'RIPLEYDIANINO' THEN
        L_ABR_FORMULARIO := 'COTIZ_VEH_RIPLEY_ASIST';
      WHEN 'RIPLEYCOR' THEN
        L_ABR_FORMULARIO := 'COTIZ_VEH_RIPLEY_ASIST';
      WHEN 'RIPLEYFUNC' THEN
        L_ABR_FORMULARIO := 'COTIZ_VEH_RIPLEY_ASIST';
      WHEN 'ESCOLARBIANUAL' THEN
        L_ABR_FORMULARIO := 'COTIZ_VEH_RIPLEY_ASIST';
      WHEN 'WEBVENTA' THEN
        L_ABR_FORMULARIO := 'COTIZ_VEH_WEBDIRECTO';
      
      /* HMB 05-08-2019 GALLAGHER */
      WHEN 'GALLAGHER_NVA' THEN
        L_ABR_FORMULARIO := 'COTIZ_VEH_GALLAGHER'; 
      -- fin HMB 
      
      WHEN 'WILLIS' THEN
        L_ABR_FORMULARIO := 'COTIZ_VEH_WILLIS';
      WHEN '789967806' THEN
        /*BICE*/
        L_ABR_FORMULARIO := 'COTIZ_VEH_CLIC';
      WHEN '777215604' THEN
        /* GRUNFELD */
        L_ABR_FORMULARIO := 'C_VEH_GRUNFELD';
      ELSE
        IF R_VEH_COTIZACIONES.MCA_MEL = 'S' THEN
          IF R_VEH_COTIZACIONES.FEC_EFEC_SPTO IS NOT NULL AND
             R_VEH_COTIZACIONES.FEC_VCTO_SPTO IS NOT NULL THEN
            L_ABR_FORMULARIO := 'COTIZ_VEH_FEC_VIG';
          ELSE
            L_ABR_FORMULARIO := 'COTIZ_VEH';
          END IF;
        ELSE
          L_ABR_FORMULARIO := 'COTIZ_VEH_TW';
        END IF;
    END CASE;
  
    --L_ABR_FORMULARIO := 'COTIZ_VEH';
  
    /* IF R_COD_AGT.COD_AGT = '42173' THEN
      L_ABR_FORMULARIO := 'COTIZ_VEH_CLIC';
    END IF;*/
  
    -- L_DIRECTORIO     := '/AP/LIS/FPATH';
  
    L_DIRECTORIO  := 'DPATH';
    L_NOM_FICHERO := 'VEH_COT_' || P_NUM_COTIZACION || '.DAT';
    P_NOM_FIC     := 'VEH_COT_' || P_NUM_COTIZACION || '.PDF';
  
    l_id_fichero := UTL_FILE.FOPEN(l_directorio, l_nom_fichero, 'w');
  
    UTL_FILE.PUTF(l_id_fichero,
                  '<job> ' || l_abr_formulario ||
                  ' -C -gpdf -pagcount -outputD:\inetpub\PDF\' || p_nom_fic || '\n');
  
    IF R_VEH_COTIZACIONES.MCA_MEL = 'S' THEN
      P_GRABA_DAT(' <glb> TIPOCOT ',
                  '(PARA EMISION ELECTRONICA)',
                  L_ID_FICHERO);
    ELSE
      P_GRABA_DAT(' <glb> TIPOCOT ',
                  '(PARA EMISION EN OFICINA MAPFRE)',
                  L_ID_FICHERO);
    END IF;
  
    /*CJSS FECHAS DE VIGENCIA VARIABLE */
    IF R_VEH_COTIZACIONES.FEC_EFEC_SPTO IS NOT NULL AND
       R_VEH_COTIZACIONES.FEC_VCTO_SPTO IS NOT NULL THEN
      P_GRABA_DAT(' <glb> FECHA_INI_VIG ',
                  TO_CHAR(R_VEH_COTIZACIONES.FEC_EFEC_SPTO, 'DD/MM/YYYY'),
                  L_ID_FICHERO);
      P_GRABA_DAT(' <glb> FECHA_VCTO_VIG ',
                  TO_CHAR(R_VEH_COTIZACIONES.FEC_VCTO_SPTO, 'DD/MM/YYYY'),
                  L_ID_FICHERO);
    
      /* CANTIDAD DE DIAS EN LA COTIZACION */
      P_GRABA_DAT(' <glb> CANT_DIAS ',
                  R_VEH_COTIZACIONES.FEC_VCTO_SPTO -
                  R_VEH_COTIZACIONES.FEC_EFEC_SPTO,
                  L_ID_FICHERO);
    
    END IF;
  
    /* 15-JULIO-2014 CJSS ENCABEZADO TITULO FORMULARIO PROPUESTA O COTIZACION??? */
    IF R_VEH_COTIZACIONES.NUM_MATRICULA = 'A/D' AND
       R_VEH_COTIZACIONES.FACTURA_48 = '0' THEN
      P_GRABA_DAT(' <glb> COT_O_PROP ', 'PROPUESTA DE', L_ID_FICHERO);
      P_GRABA_DAT(' <glb> SUBTITULO_DOC ',
                  'Validez de la Propuesta : 10 dias corridos (MEL)',
                  L_ID_FICHERO);
    ELSIF R_VEH_COTIZACIONES.COD_DOCUM_BEN = 'RIPLEYALTIRO' THEN
      P_GRABA_DAT(' <glb> COT_O_PROP ', 'PROPUESTA DE', L_ID_FICHERO);
      P_GRABA_DAT(' <glb> SUBTITULO_DOC ',
                  'Validez de la Propuesta : 10 dias corridos (MEL)',
                  L_ID_FICHERO);
    ELSIF R_VEH_COTIZACIONES.COD_DOCUM_BEN = 'RIPLEYEMP' THEN
      P_GRABA_DAT(' <glb> COT_O_PROP ', 'PROPUESTA DE', L_ID_FICHERO);
      P_GRABA_DAT(' <glb> SUBTITULO_DOC ',
                  'Validez de la Propuesta : 10 dias corridos (MEL)',
                  L_ID_FICHERO);
    ELSIF R_VEH_COTIZACIONES.COD_DOCUM_BEN = 'RIPLEYFUNC' THEN
      P_GRABA_DAT(' <glb> COT_O_PROP ', 'PROPUESTA DE', L_ID_FICHERO);
      P_GRABA_DAT(' <glb> SUBTITULO_DOC ',
                  'Validez de la Propuesta : 10 dias corridos (MEL)',
                  L_ID_FICHERO);
    ELSE
      P_GRABA_DAT(' <glb> COT_O_PROP ', 'SIMULACION DE', L_ID_FICHERO);
      P_GRABA_DAT(' <glb> SUBTITULO_DOC ',
                  'Validez de la Simulacion : 10 dias corridos (MEL)',
                  L_ID_FICHERO);
    END IF;
  
    /*CJSS INCLUIR NOMBRE DE CONVENIO */
    IF R_VEH_COTIZACIONES.COD_DOCUM_BEN IS NOT NULL THEN
      P_GRABA_DAT(' <glb> NOM_CONVENIO ',
                  'CONVENIO: ' || R_VEH_COTIZACIONES.COD_DOCUM_BEN,
                  L_ID_FICHERO);
    END IF;
  
    --P_GRABA_DAT(' <glb> TIPOCOT ', '', L_ID_FICHERO);
    P_GRABA_DAT(' <glb> NUM_COTIZ ', P_NUM_COTIZACION, L_ID_FICHERO);
    P_GRABA_DAT(' <glb> NOM_ASEG ',
                V_NOM_TERCERO || ' ' || V_APE1_TERCERO || ' ' ||
                V_APE2_TERCERO,
                L_ID_FICHERO);
    /*P_GRABA_DAT(' <glb> APE_ASEG ',
    V_APE1_TERCERO || ' ' || V_APE2_TERCERO,
    L_ID_FICHERO);*/
    P_GRABA_DAT(' <fld> RUT_ASEG ',
                REPLACE(EM_F_EDITA_COD_DOCUM(R_DATA_COTIZACION.COD_DOCUM_ASEG),
                        ',',
                        '.'),
                L_ID_FICHERO);
    P_GRABA_DAT(' <fld> MARCA ',
                R_NOMBRES.NOM_MARCA || ' ' || R_NOMBRES.NOM_MODELO || ' ' ||
                R_NOMBRES.NOM_SUB_MODELO || ' ' || R_VEHICULO.ANO_FAB ||
                ' Patente ' || R_VEHICULO.NUM_MATRICULA,
                L_ID_FICHERO);
    /*P_GRABA_DAT(' <fld> ANIO ', R_VEHICULO.ANO_FAB, L_ID_FICHERO);
    P_GRABA_DAT(' <fld> PATENTE', R_VEHICULO.NUM_MATRICULA, L_ID_FICHERO);*/
    P_GRABA_DAT(' <fld> MONTO_RC',
                R_VEH_COTIZACIONES.MONTO_RC,
                L_ID_FICHERO);
  
    P_GRABA_DAT(' <glb> NUM_POL_GRUPO ',
                R_VEH_COTIZACIONES.COD_DOCUM_BEN,
                L_ID_FICHERO);
  
    P_BUSCA_RANGO_EDAD(R_VEH_COTIZACIONES.EDAD_CONDUCTOR,
                       L_RANGO_EDAD_CONDUCTOR);
  
    OPEN C_TRAE_CONDUCTORES(L_RANGO_EDAD_CONDUCTOR);
    FETCH C_TRAE_CONDUCTORES
      INTO R_TRAE_CONDUCTORES;
    CLOSE C_TRAE_CONDUCTORES;
  
    V_TXT_EDAD_CONDUCTOR := R_VEH_COTIZACIONES.EDAD_CONDUCTOR;
  
    --Revisa si tiene sisgen
  
    IF R_VEH_COTIZACIONES.CANT_SINIESTROS > 0 THEN
      V_SISGEN := 'S';
    ELSE
      V_SISGEN := '';
    END IF;
  
    --   
  
    P_GRABA_DAT(' <fld> EDAD_COND', V_TXT_EDAD_CONDUCTOR, L_ID_FICHERO);
  
    CONTADOR       := 0;
    FLAG_CLAUSULA  := 0;
    FLAG_FLEX      := 0;
    FLAG_BALANCE   := 0;
    FLAG_MASTER    := 0;
    FLAG_ELEMENTAL := 0;
  
    FOR R_COTIZACIONES IN C_COTIZACIONES LOOP
    
      CONTADOR := CONTADOR + 1;
    
      IF CONTADOR <= 12 THEN
      
        /*OPEN C_MODALIDAD(R_COTIZACIONES.COD_MODALIDAD);
        FETCH C_MODALIDAD
          INTO V_NOM_MODALIDAD;
        CLOSE C_MODALIDAD;*/
      
        P_NOM_MODALIDAD(R_COTIZACIONES.COD_MODALIDAD, V_NOM_MODALIDAD);
      
        --- 12CUOTAS
      
        MEL_K_COBRANZA.P_CALCULO_CUOTA(P_NUM_CUOTAS_PAT,
                                       R_COTIZACIONES.IMP_PRIMA_NETA,
                                       0,
                                       R_COTIZACIONES.COD_RAMO,
                                       'TA',
                                       '25',
                                       V_IMP_NETO,
                                       V_INT_IMPTO,
                                       V_VAL_CUOTA_NETA,
                                       V_VAL_CUOTA_IMPTO,
                                       V_VALOR_CUOTA,
                                       V_ERROR);
      
        /*IF V_VALOR_CUOTA < 0.8 THEN
          V_VALOR_CUOTA := ' - ';
        END IF;*/
      
        P_GRABA_DAT('<fld> VALOR_CTA_' || R_COTIZACIONES.COD_MODALIDAD || ' ',
                    V_VALOR_CUOTA,
                    L_ID_FICHERO);
      
        -- PRIMA TOTAL
      
        P_GRABA_DAT('<fld> PAG_CONTAD_' || R_COTIZACIONES.COD_MODALIDAD || ' ',
                    R_COTIZACIONES.IMP_PRIMA_BRUTA,
                    L_ID_FICHERO);
      
        MEL_K_COBRANZA.P_CALCULO_CUOTA(P_NUM_CUOTAS_PAT,
                                       R_COTIZACIONES.IMP_PRIMA_NETA,
                                       0,
                                       R_COTIZACIONES.COD_RAMO,
                                       'GD',
                                       '25',
                                       V_IMP_NETO,
                                       V_INT_IMPTO,
                                       V_VAL_CUOTA_NETA,
                                       V_VAL_CUOTA_IMPTO,
                                       V_VALOR_CUOTA,
                                       V_ERROR);
      
        P_GRABA_DAT('<fld> VALOR_AVISO_' || R_COTIZACIONES.COD_MODALIDAD || ' ',
                    V_VALOR_CUOTA,
                    L_ID_FICHERO);
      
        IF (R_COTIZACIONES.MCA_HIJOS = 'S') THEN
          P_GRABA_DAT('<fld> HIJOS_ASEG',
                      'Asegurado con hijos',
                      L_ID_FICHERO);
        ELSE
          P_GRABA_DAT('<fld> HIJOS_ASEG',
                      'Asegurado sin hijos',
                      L_ID_FICHERO);
        END IF;
      
        IF (R_COTIZACIONES.MCA_FRANQUICIA = 'S') THEN
          P_GRABA_DAT('<fld> FRANQUICIA',
                      'Con franquicia aduanera',
                      L_ID_FICHERO);
        ELSE
          P_GRABA_DAT('<fld> FRANQUICIA',
                      'Sin franquicia aduanera',
                      L_ID_FICHERO);
        END IF;
      
        P_GRABA_DAT('<fld> NUM_CUOTAS',
                    R_NOM_CUOTA.NOM_FRACC_PAGO,
                    L_ID_FICHERO);
      
        /*********************************************************************************************/
      
      END IF;
    
      CASE
        WHEN R_COTIZACIONES.COD_MODALIDAD IN (8000, 8003, 8005, 8010) THEN
          IF FLAG_FLEX = 0 THEN
          
            FLAG_FLEX := 1;
          
            FOR R_COBERTURAS IN C_COBERTURAS(R_COTIZACIONES.COD_MODALIDAD) LOOP
            
              IF R_COBERTURAS.ID_COBERTURA IN
                 ('RC_1800', 'RC_4300', 'DVEXT', 'AM') THEN
                CASE
                  WHEN R_COBERTURAS.ID_COBERTURA = 'RC_1800' AND
                       (R_COTIZACIONES.MONTO_DM = '8200' or R_COTIZACIONES.MONTO_DM = '8202') THEN
                    P_GRABA_DAT(' <fld> ' || R_COBERTURAS.ID_COBERTURA || '_1',
                                'Si',
                                L_ID_FICHERO);
                  WHEN R_COBERTURAS.ID_COBERTURA = 'RC_4300' AND
                       (R_COTIZACIONES.MONTO_DM = '8201' or R_COTIZACIONES.MONTO_DM = '8203') THEN
                    P_GRABA_DAT(' <fld> ' || R_COBERTURAS.ID_COBERTURA || '_1',
                                'Si',
                                L_ID_FICHERO);
                  WHEN R_COBERTURAS.ID_COBERTURA = 'DVEXT' AND
                       R_COTIZACIONES.DEDUCIBLE = '8105' THEN
                    P_GRABA_DAT(' <fld> ' || R_COBERTURAS.ID_COBERTURA || '_1',
                                'Si',
                                L_ID_FICHERO);
                    /*WHEN R_COBERTURAS.ID_COBERTURA LIKE 'AM%' AND
                       R_COTIZACIONES.MONTO_LC = '8133' THEN
                    IF R_COTIZACIONES.MCA_MEL = 'S' THEN
                      P_GRABA_DAT(' <fld> ' || R_COBERTURAS.ID_COBERTURA || '_' ||
                                  CONTADOR || ' ',
                                  'Auto Reemplazo Sin Limite',
                                  L_ID_FICHERO);
                    ELSE
                      P_GRABA_DAT(' <fld> ' || R_COBERTURAS.ID_COBERTURA || '_' ||
                                  CONTADOR || ' ',
                                  'Auto Reemplazo 5 dias',
                                  L_ID_FICHERO);
                    END IF;*/
                  ELSE
                    P_GRABA_DAT(' <fld> ' || R_COBERTURAS.ID_COBERTURA || '_1',
                                '-',
                                L_ID_FICHERO);
                END CASE;
              
              ELSE
              
                IF R_COBERTURAS.TEXTO_COBERTURA IS NULL THEN
                
                  P_GRABA_DAT(' <fld> ' || R_COBERTURAS.ID_COBERTURA || '_' ||
                              CONTADOR || ' ',
                              'SI',
                              L_ID_FICHERO);
                ELSE
                  P_GRABA_DAT(' <fld> ' || R_COBERTURAS.ID_COBERTURA || '_' ||
                              CONTADOR || ' ',
                              R_COBERTURAS.TEXTO_COBERTURA,
                              L_ID_FICHERO);
                END IF;
              
              END IF;
            
            END LOOP;
          END IF;
        WHEN R_COTIZACIONES.COD_MODALIDAD IN (8120, 8123, 8125, 8121) THEN
          IF FLAG_MASTER = 0 THEN
          
            FLAG_MASTER := 1;
          
            FOR R_COBERTURAS IN C_COBERTURAS(R_COTIZACIONES.COD_MODALIDAD) LOOP
            
              IF R_COBERTURAS.ID_COBERTURA IN
                 ('RC_1800', 'RC_4300', 'DVEXT', 'AM') THEN
                CASE
                  WHEN R_COBERTURAS.ID_COBERTURA = 'RC_1800' AND
                       (R_COTIZACIONES.MONTO_DM = '8200' or R_COTIZACIONES.MONTO_DM = '8202')THEN
                    P_GRABA_DAT(' <fld> ' || R_COBERTURAS.ID_COBERTURA || '_2',
                                'Si',
                                L_ID_FICHERO);
                  WHEN R_COBERTURAS.ID_COBERTURA = 'RC_4300' AND
                       (R_COTIZACIONES.MONTO_DM = '8201' or R_COTIZACIONES.MONTO_DM = '8203' )THEN
                    P_GRABA_DAT(' <fld> ' || R_COBERTURAS.ID_COBERTURA || '_2',
                                'Si',
                                L_ID_FICHERO);
                  WHEN R_COBERTURAS.ID_COBERTURA = 'DVEXT' AND
                       R_COTIZACIONES.DEDUCIBLE = '8105' THEN
                    P_GRABA_DAT(' <fld> ' || R_COBERTURAS.ID_COBERTURA || '_2',
                                'Si',
                                L_ID_FICHERO);
                    /*WHEN R_COBERTURAS.ID_COBERTURA LIKE 'AM%' AND
                       R_COTIZACIONES.MONTO_LC = '8133' THEN
                    IF R_COTIZACIONES.MCA_MEL = 'S' THEN
                      P_GRABA_DAT(' <fld> ' || R_COBERTURAS.ID_COBERTURA || '_' ||
                                  CONTADOR || ' ',
                                  'Auto Reemplazo Sin Limite',
                                  L_ID_FICHERO);
                    ELSE
                      P_GRABA_DAT(' <fld> ' || R_COBERTURAS.ID_COBERTURA || '_' ||
                                  CONTADOR || ' ',
                                  'Auto Reemplazo 5 dias',
                                  L_ID_FICHERO);
                    END IF;*/
                  ELSE
                    P_GRABA_DAT(' <fld> ' || R_COBERTURAS.ID_COBERTURA || '_2',
                                '-',
                                L_ID_FICHERO);
                END CASE;
              
              ELSE
              
                IF R_COBERTURAS.TEXTO_COBERTURA IS NULL THEN
                
                  P_GRABA_DAT(' <fld> ' || R_COBERTURAS.ID_COBERTURA || '_' ||
                              CONTADOR || ' ',
                              'SI',
                              L_ID_FICHERO);
                ELSE
                  P_GRABA_DAT(' <fld> ' || R_COBERTURAS.ID_COBERTURA || '_' ||
                              CONTADOR || ' ',
                              R_COBERTURAS.TEXTO_COBERTURA,
                              L_ID_FICHERO);
                END IF;
              
              END IF;
            
            END LOOP;
          
          END IF;
        WHEN R_COTIZACIONES.COD_MODALIDAD = 8900 THEN
          IF FLAG_BALANCE = 0 THEN
          
            FLAG_BALANCE := 1;
            FOR R_COBERTURAS IN C_COBERTURAS(R_COTIZACIONES.COD_MODALIDAD) LOOP
            
              IF R_COBERTURAS.ID_COBERTURA IN
                 ('RC_1800', 'RC_4300', 'DVEXT', 'AM') THEN
                CASE
                  WHEN R_COBERTURAS.ID_COBERTURA = 'RC_1800' AND
                       (R_COTIZACIONES.MONTO_DM = '8200' or R_COTIZACIONES.MONTO_DM = '8202') THEN
                    P_GRABA_DAT(' <fld> ' || R_COBERTURAS.ID_COBERTURA || '_3',
                                'Si',
                                L_ID_FICHERO);
                  WHEN R_COBERTURAS.ID_COBERTURA = 'RC_4300' AND
                       (R_COTIZACIONES.MONTO_DM = '8201' or R_COTIZACIONES.MONTO_DM = '8202') THEN
                    P_GRABA_DAT(' <fld> ' || R_COBERTURAS.ID_COBERTURA || '_3',
                                'Si',
                                L_ID_FICHERO);
                  WHEN R_COBERTURAS.ID_COBERTURA = 'DVEXT' AND
                       R_COTIZACIONES.DEDUCIBLE = '8105' THEN
                    P_GRABA_DAT(' <fld> ' || R_COBERTURAS.ID_COBERTURA || '_3',
                                'Si',
                                L_ID_FICHERO);
                    /*IF R_COTIZACIONES.DEDUCIBLE = '8105' THEN
                    P_GRABA_DAT(' <fld> ' || R_COBERTURAS.ID_COBERTURA || '_' ||
                                CONTADOR || ' ',
                                'INCLUIDO',
                                L_ID_FICHERO);*/
                  ELSE
                    P_GRABA_DAT(' <fld> ' || R_COBERTURAS.ID_COBERTURA || '_3',
                                '-',
                                L_ID_FICHERO);
                END CASE;
              
              ELSE
              
                IF R_COBERTURAS.TEXTO_COBERTURA IS NULL THEN
                
                  P_GRABA_DAT(' <fld> ' || R_COBERTURAS.ID_COBERTURA || '_' ||
                              CONTADOR || ' ',
                              'SI',
                              L_ID_FICHERO);
                ELSE
                  P_GRABA_DAT(' <fld> ' || R_COBERTURAS.ID_COBERTURA || '_' ||
                              CONTADOR || ' ',
                              R_COBERTURAS.TEXTO_COBERTURA,
                              L_ID_FICHERO);
                END IF;
              
              END IF;
            
            END LOOP;
          END IF;
        WHEN R_COTIZACIONES.COD_MODALIDAD = 8910 THEN
          IF FLAG_ELEMENTAL = 0 THEN
          
            FLAG_ELEMENTAL := 1;
          
            FOR R_COBERTURAS IN C_COBERTURAS(R_COTIZACIONES.COD_MODALIDAD) LOOP
            
              IF R_COBERTURAS.ID_COBERTURA IN
                 ('RC_1800', 'RC_4300', 'DVEXT') THEN
                CASE
                  WHEN R_COBERTURAS.ID_COBERTURA = 'RC_1800' AND
                       (R_COTIZACIONES.MONTO_DM = '8200' or R_COTIZACIONES.MONTO_DM = '8202' )  THEN
                    P_GRABA_DAT(' <fld> ' || R_COBERTURAS.ID_COBERTURA || '_4',
                                'Si',
                                L_ID_FICHERO);
                  WHEN R_COBERTURAS.ID_COBERTURA = 'RC_4300' AND
                       (R_COTIZACIONES.MONTO_DM = '8201' or R_COTIZACIONES.MONTO_DM = '8203') THEN
                    P_GRABA_DAT(' <fld> ' || R_COBERTURAS.ID_COBERTURA || '_4',
                                'Si',
                                L_ID_FICHERO);
                  WHEN R_COBERTURAS.ID_COBERTURA = 'DVEXT' AND
                       R_COTIZACIONES.DEDUCIBLE = '8105' THEN
                    P_GRABA_DAT(' <fld> ' || R_COBERTURAS.ID_COBERTURA || '_4',
                                'Si',
                                L_ID_FICHERO);
                  ELSE
                    P_GRABA_DAT(' <fld> ' || R_COBERTURAS.ID_COBERTURA || '_4',
                                '-',
                                L_ID_FICHERO);
                END CASE;
              
              ELSE
              
                IF R_COBERTURAS.TEXTO_COBERTURA IS NULL THEN
                
                  P_GRABA_DAT(' <fld> ' || R_COBERTURAS.ID_COBERTURA || '_' ||
                              CONTADOR || ' ',
                              'SI',
                              L_ID_FICHERO);
                ELSE
                  P_GRABA_DAT(' <fld> ' || R_COBERTURAS.ID_COBERTURA || '_' ||
                              CONTADOR || ' ',
                              R_COBERTURAS.TEXTO_COBERTURA,
                              L_ID_FICHERO);
                END IF;
              
              END IF;
            
            END LOOP;
          
          END IF;
        
        ELSE
        
          DBMS_OUTPUT.PUT_LINE('NADA');
          /*CONTADOR := CONTADOR - 1;*/
      
      END CASE;
    
      IF R_COTIZACIONES.COD_MODALIDAD IN
         (8000, 8003, 8005, 8010, 8015, 8120, 8123, 8125, 8121, 8900) THEN
      
        IF R_COTIZACIONES.MCA_MEL = 'S' THEN
        
          P_GRABA_DAT('<fld> AUTOREM',
                      'En caso de perdida total se otorgara auto de reemplazo sin limite con copago de $5000 diarios.
                     En caso de da?o parcial se otorgara auto de reemplazo sin limite con copago de $5000 diarios',
                      L_ID_FICHERO);
        
        ELSE
        
          P_GRABA_DAT('<fld> AUTOREM',
                      'En caso de perdida total se otorgara auto de reemplazo sin limite con copago de $5000 diarios.
                     En caso de da?o parcial se otorgara auto de reemplazo con tope de 5 dias con copago de $5000 diarios',
                      L_ID_FICHERO);
        
        END IF;
      
      END IF;
    
      IF V_TXT_EDAD_CONDUCTOR >= 35 AND
         R_COTIZACIONES.COD_MODALIDAD IN (8120, 8123, 8125, 8121) THEN
      
        IF FLAG_CLAUSULA = 0 THEN
        
          P_GRABA_DAT('<fld> NOM_CLAUSULA', 'CONDUCT+35', L_ID_FICHERO);
          P_GRABA_DAT('<fld> CLAUSULA',
                      'Esta poliza ha sido suscrita y el riesgo ha sido aceptado por la compa?ia de seguros, sobre la base que el conductor  es mayor de 35 a?os, si en caso de siniestro el conductor  sea menor  a esta edad, las partes  acuerdan expresamente que se aplicara un deducible adicional al contratado  voluntariamente, ascendente a el 10% de la perdida con un minimo de UF. 20.- en todo y cada siniestro (Condicion aplica solo a Plan Master).',
                      L_ID_FICHERO);
          FLAG_CLAUSULA := 1;
        
        END IF;
      
      END IF;
    
      IF R_COTIZACIONES.ASISTENCIA = '1' THEN
      
        P_GRABA_DAT('<fld> EXGARAGE', 'Si', L_ID_FICHERO);
      ELSE
        P_GRABA_DAT('<fld> EXGARAGE', '-', L_ID_FICHERO);
      
      END IF;
    
      IF R_COTIZACIONES.COD_MODALIDAD IN
         (8000, 8003, 8005, 8010, 8015, 8120, 8123, 8125, 8121) THEN
      
        IF R_COTIZACIONES.MONTO_LC = '8133' THEN
        
          IF R_COTIZACIONES.MCA_MEL = 'S' THEN
          
            P_GRABA_DAT('<fld> ASISTENCIA',
                        'Incluye auto de reemplazo sin limite(solo emision electronica en Mapfre En Linea)',
                        L_ID_FICHERO);
          
            /*ELSE
            
            P_GRABA_DAT('<fld> ASISTENCIA',
                        'Incluye 5 dias de auto de reemplazo.',
                        L_ID_FICHERO);*/
          
          END IF;
        
        END IF;
      
      END IF;
    
      IF R_COTIZACIONES.DEDUCIBLE = '8105' THEN
      
        P_GRABA_DAT('<fld> EXTRANJERO',
                    'Incluye cobertura de da?os al vehiculo durante viaje al extranjero',
                    L_ID_FICHERO);
      
      END IF;
    
      IF R_COTIZACIONES.FACTURA_48 = '0' AND
         R_VEH_COTIZACIONES.NUM_MATRICULA = 'A/D' THEN
      
        L_MCA_EXPRESS := 'EX';
      
      ELSE
      
        L_MCA_EXPRESS := '';
      
      END IF;
    
      /*********** SEXO **********/
      IF R_COTIZACIONES.anos_sin_sini = '0' THEN
      
        L_MCA_SEXO := 'F';
      
      ELSE
      
        L_MCA_SEXO := 'M';
      
      END IF;
    
      P_TRAE_DESC_COTIZACION(P_NUM_COTIZACION, L_TIPO_DESC, L_VALOR_DESC);
    
      IF R_COTIZACIONES.COD_CUADRO_COM IS NOT NULL THEN
      
        OPEN C_COMISION(R_COTIZACIONES.COD_CUADRO_COM,
                        R_COTIZACIONES.COD_MODALIDAD);
        FETCH C_COMISION
          INTO R_COMISION;
        CLOSE C_COMISION;
      
        P_GRABA_DAT('<fld> MONTOCOMISION',
                    R_COMISION.PORC_COM || ' - E:' || V_TXT_EDAD_CONDUCTOR || ' ' ||
                    V_SISGEN || ' ' || L_MCA_EXPRESS || ' ' || L_MCA_SEXO || ' ' ||
                    L_TIPO_DESC || ' ' || L_VALOR_DESC,
                    L_ID_FICHERO);
      
        /*    P_GRABA_DAT('<fld> COMISION',
        'POLIZA DE EMISION EXCLUSIVA EN MAPFRE EN LINEA',
        L_ID_FICHERO);*/
      ELSE
        P_GRABA_DAT('<fld> MONTOCOMISION',
                    'E:' || V_TXT_EDAD_CONDUCTOR || ' ' || V_SISGEN || ' ' ||
                    L_MCA_EXPRESS || ' ' || L_MCA_SEXO || ' ' ||
                    L_TIPO_DESC || ' ' || L_VALOR_DESC,
                    L_ID_FICHERO);
      END IF;
    
      IF R_COTIZACIONES.MCA_MEL = 'S' THEN
      
        P_GRABA_DAT('<fld> COMISION',
                    '*******************  POLIZA DE EMISION EXCLUSIVA EN MAPFRE EN LINEA  *******************',
                    L_ID_FICHERO);
      END IF;
    
      IF R_COTIZACIONES.MCA_MEL = 'N' THEN
      
        P_GRABA_DAT('<fld> COMISION',
                    '*********************  POLIZA DE EMISION EXCLUSIVA OFICINA MAPFRE  *********************',
                    L_ID_FICHERO);
      END IF;
    
    END LOOP;
  
    P_GRABA_DAT(' <glb> NOM_CORREDOR',
                R_NOM_CORREDOR.NOM_CORREDOR,
                L_ID_FICHERO);
  
    P_GRABA_DAT(' <fld> SUCURSAL', R_NOM_CORREDOR.NOM_NIVEL3, L_ID_FICHERO);
  
    P_GRABA_DAT(' <fld> FEC_ACTUAL',
                TO_CHAR(R_DATA_COTIZACION.FEC_ACTU, 'DD') || ' DE ' ||
                RTRIM(TO_CHAR(R_DATA_COTIZACION.FEC_ACTU,
                              'MONTH',
                              'NLS_DATE_LANGUAGE = SPANISH')) || ' DE ' ||
                TO_CHAR(R_DATA_COTIZACION.FEC_ACTU, 'YYYY'),
                L_ID_FICHERO);
  
    IF (L_ABR_FORMULARIO = 'COTIZ_VEH_RIPLEY' /* or
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 L_ABR_FORMULARIO = 'COTIZ_VEH'*/
       ) THEN
      IF ((R_VEHICULO.COD_MARCA = '340' AND
         R_VEHICULO.COD_MODELO IN
         ('30', '35', '47', '113', '49', '50', '122', '52', 117, '53')) OR
         (R_VEHICULO.COD_MARCA = '520' AND
         R_VEHICULO.COD_MODELO IN ('80',
                                     '135',
                                     '98',
                                     '99',
                                     '100',
                                     '101',
                                     '102',
                                     '133',
                                     '130',
                                     '131',
                                     '103',
                                     '133')) OR
         (R_VEHICULO.COD_MARCA = '375' AND
         R_VEHICULO.COD_MODELO IN ('175', '101', '200')) OR
         (R_VEHICULO.COD_MARCA = '535' AND
         R_VEHICULO.COD_MODELO IN ('91', '177', '165')) OR
         (R_VEHICULO.COD_MARCA = '550' AND
         R_VEHICULO.COD_MODELO IN ('75', '150', '177')) OR
         (R_VEHICULO.COD_MARCA = '220' AND R_VEHICULO.COD_MODELO IN ('37'))) THEN
      
        P_GRABA_DAT('<NPG>', '', L_ID_FICHERO);
      
      END IF;
    
    END IF;
  
    IF R_VEH_COTIZACIONES.MCA_MEL != 'S' THEN
    
      IF ((R_VEHICULO.COD_MARCA = '340' AND
         R_VEHICULO.COD_MODELO IN
         ('30', '35', '47', '113', '49', '50', '122', '52', 117, '53')) OR
         (R_VEHICULO.COD_MARCA = '520' AND
         R_VEHICULO.COD_MODELO IN ('80',
                                     '135',
                                     '98',
                                     '99',
                                     '100',
                                     '101',
                                     '102',
                                     '133',
                                     '130',
                                     '131',
                                     '103',
                                     '133')) OR
         (R_VEHICULO.COD_MARCA = '375' AND
         R_VEHICULO.COD_MODELO IN ('175', '101', '200')) OR
         (R_VEHICULO.COD_MARCA = '535' AND
         R_VEHICULO.COD_MODELO IN ('91', '177', '165')) OR
         (R_VEHICULO.COD_MARCA = '550' AND
         R_VEHICULO.COD_MODELO IN ('75', '150', '177')) OR
         (R_VEHICULO.COD_MARCA = '220' AND R_VEHICULO.COD_MODELO IN ('37'))) THEN
      
        P_GRABA_DAT('<NPG>', '', L_ID_FICHERO);
      
      END IF;
    
    END IF;
  
    P_GRABA_DAT('<NPG>', '', L_ID_FICHERO);
    P_GRABA_DAT('<NPG>', '', L_ID_FICHERO);
    P_GRABA_DAT('<NPG>', '', L_ID_FICHERO);
    P_GRABA_DAT('<NPG>', '', L_ID_FICHERO);
    P_GRABA_DAT('<NPG>', '', L_ID_FICHERO);
    P_GRABA_DAT('<NPG>', '', L_ID_FICHERO);
    UTL_FILE.FCLOSE(L_ID_FICHERO);
  
    COMMIT;
  
  EXCEPTION
    WHEN UTL_FILE.INTERNAL_ERROR THEN
      RAISE_APPLICATION_ERROR(-20000, 'ERROR INTERNO (UTL_FILE)');
    WHEN UTL_FILE.INVALID_FILEHANDLE THEN
      RAISE_APPLICATION_ERROR(-20000,
                              'MANEJADOR FICHERO INVALIDO (UTL_FILE)');
    WHEN UTL_FILE.INVALID_MODE THEN
      RAISE_APPLICATION_ERROR(-20000, 'MODO INVALIDO (UTL_FILE)');
    WHEN UTL_FILE.INVALID_OPERATION THEN
      RAISE_APPLICATION_ERROR(-20000, 'OPERACION INVALIDA (UTL_FILE)');
    WHEN UTL_FILE.INVALID_PATH THEN
      RAISE_APPLICATION_ERROR(-20000,
                              'DIRECTORIO O FICHERO NO ACCESIBLE (UTL_FILE)');
    WHEN UTL_FILE.WRITE_ERROR THEN
      RAISE_APPLICATION_ERROR(-20000, 'ERROR DE ESCRITURA (UTL_FILE)');
    WHEN OTHERS THEN
      P_ERROR := SQLERRM;
  END P_IMPRIME_COTIZACION2;

  /******************************/

  PROCEDURE P_BUSCA_MONTO_COB_CONV_OPC(P_COD_RAMO      VARCHAR2,
                                       P_COD_COB       VARCHAR2,
                                       P_COD_MODALIDAD VARCHAR2,
                                       P_COD_DOCUM     VARCHAR2,
                                       P_COD_CONV      VARCHAR2,
                                       P_MONTO         OUT NUMBER) IS
  
    DATOS_COB VARCHAR2(3000);
  
    CURSOR C_COBERTURAS_CONV IS
      SELECT COD_COB, SUMA_ASEG, MONTO_COB
        FROM MEL_COBERTURAS_CONV
       WHERE COD_CIA = 1
         AND COD_RAMO = P_COD_RAMO
         AND COD_DOCUM = P_COD_DOCUM
         AND COD_MODALIDAD IN (99999, P_COD_MODALIDAD)
         AND COD_CONV = P_COD_CONV
         AND cod_cob = P_COD_COB
         AND MCA_INH = 'N'
         AND MCA_SUMA_PRIMA = 'S';
  
  begin
  
    --P_MONTO := 0;
  
    FOR R_COBERTURAS_CONV IN C_COBERTURAS_CONV LOOP
    
      P_MONTO := P_MONTO + R_COBERTURAS_CONV.MONTO_COB;
    
    END LOOP;
  
  END P_BUSCA_MONTO_COB_CONV_OPC;

  PROCEDURE P_BUSCA_SUMA_ASEG_COB_CONV(P_COD_RAMO      VARCHAR2,
                                       P_COD_COB       VARCHAR2,
                                       P_COD_MODALIDAD VARCHAR2,
                                       P_COD_DOCUM     VARCHAR2,
                                       P_COD_CONV      VARCHAR2,
                                       P_SUMA_ASEG     OUT NUMBER) IS
  
    DATOS_COB VARCHAR2(3000);
  
    CURSOR C_COBERTURAS_CONV(L_COD_COB NUMBER) IS
      SELECT COD_COB, SUMA_ASEG
        FROM MEL_COBERTURAS_CONV
       WHERE COD_CIA = 1
         AND COD_RAMO = P_COD_RAMO
         AND COD_DOCUM = P_COD_DOCUM
         AND COD_MODALIDAD IN (99999, P_COD_MODALIDAD)
         AND COD_CONV = P_COD_CONV
         AND MCA_INH = 'N'
         AND COD_COB = L_COD_COB
         AND SUMA_ASEG IS NOT NULL;
  
    R_COBERTURAS_CONV C_COBERTURAS_CONV%ROWTYPE;
    L_EXISTE          BOOLEAN;
  
  begin
  
    OPEN C_COBERTURAS_CONV(P_COD_COB);
    FETCH C_COBERTURAS_CONV
      INTO R_COBERTURAS_CONV;
    L_EXISTE := C_COBERTURAS_CONV%FOUND;
    CLOSE C_COBERTURAS_CONV;
  
    IF L_EXISTE THEN
      P_SUMA_ASEG := R_COBERTURAS_CONV.SUMA_ASEG;
    END IF;
  
  END P_BUSCA_SUMA_ASEG_COB_CONV;

  PROCEDURE P_BUSCA_COB_CONV_OPC(P_COD_RAMO      VARCHAR2,
                                 P_COD_MODALIDAD VARCHAR2,
                                 P_COD_DOCUM     VARCHAR2,
                                 P_COD_CONV      VARCHAR2,
                                 P_COB           OUT VARCHAR2) IS
  
    DATOS_COB VARCHAR2(3000);
  
    CURSOR C_COBERTURAS_CONV IS
      SELECT COD_COB, SUMA_ASEG, MONTO_COB
        FROM MEL_COBERTURAS_CONV
       WHERE COD_CIA = 1
         AND COD_RAMO = P_COD_RAMO
         AND COD_DOCUM = P_COD_DOCUM
         AND COD_MODALIDAD IN (99999, P_COD_MODALIDAD)
         AND COD_CONV = P_COD_CONV
         AND MCA_INH = 'N';
  
  begin
  
    P_COB := '';
  
    FOR R_COBERTURAS_CONV IN C_COBERTURAS_CONV LOOP
    
      P_COB := P_COB || R_COBERTURAS_CONV.COD_COB || '|';
    
    END LOOP;
  
  END P_BUSCA_COB_CONV_OPC;

  PROCEDURE P_IMPRIME_COTIZACION2_ANTIGUO(P_NUM_COTIZACION VARCHAR2,
                                          P_NUM_CUOTAS_PAT NUMBER,
                                          P_NOM_FIC        OUT VARCHAR2,
                                          P_ERROR          OUT VARCHAR2) IS
  
    L_NOM_FICHERO    VARCHAR2(45);
    L_ID_FICHERO     UTL_FILE.FILE_TYPE;
    L_DIRECTORIO     VARCHAR2(255);
    L_ABR_FORMULARIO VARCHAR2(45);
    V_NOM_TERCERO    VARCHAR2(100);
    V_APE1_TERCERO   VARCHAR2(100);
    V_APE2_TERCERO   VARCHAR2(100);
    V_ERROR          VARCHAR2(100);
  
    --L_COD_DESG G2000180.COD_DESGLOSE%TYPE;
  
    /* COD_COB             VARCHAR2(1000);
    IMP_ACUMULADO_ANUAL VARCHAR2(100);
    IMP_SPTO            VARCHAR2(10);
    IMP_ANUAL           VARCHAR2(100);
    L_CONT              NUMBER(4);
    L_IVA_PRIMA         VARCHAR2(10);
    L_PRIMA_FINAL       VARCHAR2(10);*/
  
    /*L_EXISTE      BOOLEAN;
    L_EXISTE_DESG BOOLEAN;
    IMP_SPTO_N    VARCHAR2(10);*/
  
    /*SUM_IMP_SPTO    VARCHAR2(1000);
    SUM_IVA_PRIMA   VARCHAR2(1000);
    SUM_PRIMA_FINAL VARCHAR2(1000);
    TOTAL_PRIMAS    VARCHAR2(1000);
    
    P_VALORES_COB VARCHAR2(1000);*/
  
    V_SISGEN VARCHAR2(1);
  
    CURSOR C_DATA_COTIZACION(PC_NUM_COTIZACION VARCHAR2) IS
      SELECT A.NUM_COTIZACION,
             A.COD_DOCUM_ASEG,
             A.COD_DOCUM_MAE,
             FEC_ACTU,
             COD_PLAN
        FROM MEL_CAB_COTIZACION@OVPRO_PRD A
       WHERE A.COD_CIA = 1
         AND A.NUM_COTIZACION = P_NUM_COTIZACION;
  
    R_DATA_COTIZACION C_DATA_COTIZACION%ROWTYPE;
  
    CURSOR C_COTIZACIONES IS
      SELECT num_cotizacion,
             num_matricula,
             cod_modalidad,
             cod_docum_aseg,
             cod_docum_ben,
             imp_prima_neta,
             imp_prima_bruta,
             fec_actu,
             deducible,
             cod_ramo,
             monto_rc,
             monto_dm,
             monto_lc,
             monto_comp,
             asistencia,
             prima,
             anos_sin_sini,
             contacto_inspecc,
             valor_referencial,
             cod_uso_vehi,
             factura_48,
             mca_mod_prima,
             estado,
             id,
             mca_inspeccion,
             cod_comuna,
             sel_emitir,
             iva,
             descuento,
             recargo,
             cod_docum_suplanta,
             edad_conductor,
             cod_cuadro_com,
             mca_mel,
             cant_siniestros,
             monto_siniestros,
             monto_cuota,
             mca_pagado,
             mca_hijos,
             mca_franquicia,
             mca_danospre
        FROM MEL_VEH_COTIZACION@OVPRO_PRD A
       WHERE A.NUM_COTIZACION = P_NUM_COTIZACION
       ORDER BY A.IMP_PRIMA_BRUTA DESC;
  
    CURSOR C_COBERTURAS(L_COD_MODALIDAD VARCHAR2) IS
      SELECT *
        FROM MEL_VEH_TABLA_COBERTURAS T
       WHERE COD_MODALIDAD = L_COD_MODALIDAD
         AND MCA_INH = 'N';
  
    CURSOR C_NOM_CORREDOR IS
      SELECT NOM_TERCERO || ' ' || APE1_TERCERO || ' ' || APE2_TERCERO NOM_CORREDOR,
             R.NOM_NIVEL3
        FROM A1001399@OVPRO_PRD T,
             A1001332@OVPRO_PRD Q,
             A1000702@OVPRO_PRD R
       WHERE T.COD_CIA = 1
         AND T.TIP_DOCUM = 'RUT'
         AND T.COD_DOCUM = (SELECT COD_DOCUM_MAE
                              FROM TRON2000.MEL_CAB_COTIZACION@OVPRO_PRD T
                             WHERE T.NUM_COTIZACION = P_NUM_COTIZACION
                               AND ROWNUM < 2)
         AND T.COD_CIA = Q.COD_CIA
         AND T.TIP_DOCUM = Q.TIP_DOCUM
         AND T.COD_DOCUM = Q.COD_DOCUM
         AND Q.COD_CIA = R.COD_CIA
         AND Q.COD_NIVEL3 = R.COD_NIVEL3
         AND Q.COD_ACT_TERCERO = 2
         AND Q.COD_CALIDAD = 1
         AND Q.MCA_INH = 'N'
         AND Q.FEC_VALIDEZ = (SELECT MAX(F.FEC_VALIDEZ)
                                FROM A1001332@OVPRO_PRD F
                               WHERE F.COD_AGT = Q.COD_AGT
                                 AND F.COD_CIA = 1)
         AND ROWNUM < 2;
  
    R_NOM_CORREDOR C_NOM_CORREDOR%ROWTYPE;
  
    CURSOR C_NOM_TERCERO(P_RUT VARCHAR2) IS
      SELECT NOM_TERCERO, APE1_TERCERO
        FROM A1001399@OVPRO_PRD
       WHERE COD_CIA = 1
         AND TIP_DOCUM IN ('RUT', 'DIR')
         AND COD_DOCUM = P_RUT;
  
    R_NOM_TERCERO C_NOM_TERCERO%ROWTYPE;
  
    CURSOR C_MODALIDAD(P_COD_MODALIDAD NUMBER) IS
      SELECT DISTINCT B.NOM_MODALIDAD
        FROM A1002090@OVPRO_PRD A, G2990004@OVPRO_PRD B
       WHERE A.COD_RAMO IN (801, 802, 803, 808)
         AND B.COD_MODALIDAD >= 8000
         AND B.COD_CIA = A.COD_CIA
         AND B.COD_MODALIDAD = A.COD_MODALIDAD
         AND B.COD_MODALIDAD = P_COD_MODALIDAD;
  
    V_NOM_MODALIDAD VARCHAR2(100);
    CONTADOR        NUMBER;
    CONTADOR_PAT    NUMBER;
  
    CURSOR NOMBRES(L_MAR NUMBER, L_MOD NUMBER, L_SUBMOD NUMBER) IS
      SELECT A.NOM_MARCA, B.NOM_MODELO, C.NOM_SUB_MODELO
        FROM A2100400@OVPRO_PRD A,
             A2100410@OVPRO_PRD B,
             A2100420@OVPRO_PRD C
       WHERE A.COD_CIA = 1
         AND A.COD_CIA = B.COD_CIA
         AND A.COD_CIA = C.COD_CIA
         AND A.MCA_INH = 'N'
         AND A.MCA_INH = B.MCA_INH
         AND A.MCA_INH = C.MCA_INH
         AND A.COD_MARCA = L_MAR
         AND A.COD_MARCA = B.COD_MARCA
         AND A.COD_MARCA = C.COD_MARCA
         AND B.COD_MODELO = L_MOD
         AND B.COD_MODELO = C.COD_MODELO
         AND C.COD_SUB_MODELO = L_SUBMOD;
  
    R_NOMBRES NOMBRES %ROWTYPE;
  
    CURSOR C_VEH_COTIZACIONES IS
      SELECT num_cotizacion,
             num_matricula,
             cod_modalidad,
             cod_docum_aseg,
             cod_docum_ben,
             imp_prima_neta,
             imp_prima_bruta,
             fec_actu,
             deducible,
             cod_ramo,
             monto_rc,
             monto_dm,
             monto_lc,
             monto_comp,
             asistencia,
             prima,
             anos_sin_sini,
             contacto_inspecc,
             valor_referencial,
             cod_uso_vehi,
             factura_48,
             mca_mod_prima,
             estado,
             id,
             mca_inspeccion,
             cod_comuna,
             sel_emitir,
             iva,
             descuento,
             recargo,
             cod_docum_suplanta,
             edad_conductor,
             cod_cuadro_com,
             mca_mel,
             cant_siniestros,
             monto_siniestros,
             monto_cuota,
             mca_pagado,
             mca_hijos,
             mca_franquicia,
             mca_danospre
        FROM MEL_VEH_COTIZACION@OVPRO_PRD A
       WHERE A.NUM_COTIZACION = P_NUM_COTIZACION;
  
    R_VEH_COTIZACIONES C_VEH_COTIZACIONES%ROWTYPE;
  
    CURSOR VEHICULO(V_ID VARCHAR2) IS
      SELECT *
        FROM OV_VEHICULO
       WHERE ID = V_ID
         AND ROWNUM < 2;
  
    R_VEHICULO VEHICULO%ROWTYPE;
  
    CURSOR C_TRAE_CONDUCTORES(L_EDAD_CONDUCTOR VARCHAR2) IS
      SELECT *
        FROM MEL_VEH_DESC_CONDUCTOR
       WHERE TIP_CONDUCTOR = L_EDAD_CONDUCTOR;
  
    R_TRAE_CONDUCTORES C_TRAE_CONDUCTORES%ROWTYPE;
  
    CURSOR C_COD_AGT(PC_NUM_COTIZACION VARCHAR2) IS
      SELECT COD_AGT
        FROM A1001332@OVPRO_PRD A
       WHERE A.COD_CIA = 1
         AND A.TIP_DOCUM = 'RUT'
         AND A.COD_DOCUM = (SELECT COD_DOCUM_MAE
                              FROM TRON2000.MEL_CAB_COTIZACION@OVPRO_PRD T
                             WHERE T.NUM_COTIZACION = P_NUM_COTIZACION
                               AND ROWNUM < 2);
  
    R_COD_AGT C_COD_AGT%ROWTYPE;
  
    CURSOR C_COMISION(L_CUADRO_COM VARCHAR2, L_COD_MODALIDAD VARCHAR2) IS
      SELECT PORC_COM
        FROM MEL_VEH_COMISION T
       WHERE COD_CUADRO_COM = L_CUADRO_COM
         AND COD_MODALIDAD = L_COD_MODALIDAD
         AND MCA_INH = 'N';
  
    R_COMISION C_COMISION%ROWTYPE;
  
    CURSOR C_NOM_CUOTA IS
      SELECT NOM_FRACC_PAGO
        FROM A1001402@ovpro_prd
       WHERE cod_fracc_pago = P_NUM_CUOTAS_PAT
         AND cod_cia = 1;
  
    R_NOM_CUOTA C_NOM_CUOTA%ROWTYPE;
  
    V_VALOR_CUOTA        VARCHAR2(20);
    V_TXT_EDAD_CONDUCTOR VARCHAR2(60);
  
    V_IMP_NETO             VARCHAR2(20);
    V_INT_IMPTO            VARCHAR2(20);
    V_VAL_CUOTA_NETA       VARCHAR2(20);
    V_VAL_CUOTA_IMPTO      VARCHAR2(20);
    L_RANGO_EDAD_CONDUCTOR VARCHAR2(20);
    FLAG_CLAUSULA          NUMBER;
  
    FLAG_FLEX      VARCHAR2(2);
    FLAG_BALANCE   VARCHAR2(2);
    FLAG_MASTER    VARCHAR2(2);
    FLAG_ELEMENTAL VARCHAR2(2);
  
    L_NUM_POLIZA_GRUPO VARCHAR2(20);
    L_NUM_CONTRATO     VARCHAR2(20);
    L_MCA_EXPRESS      VARCHAR2(10);
    L_MCA_SEXO         VARCHAR2(10);
    L_MCA_DESCUENTO    VARCHAR2(10);
    L_TIPO_DESC        VARCHAR2(10);
    L_VALOR_DESC       VARCHAR2(10);
  
  BEGIN
  
    /********************************************************************/
  
    OPEN C_DATA_COTIZACION(P_NUM_COTIZACION);
    FETCH C_DATA_COTIZACION
      INTO R_DATA_COTIZACION;
    CLOSE C_DATA_COTIZACION;
  
    OPEN C_COD_AGT(P_NUM_COTIZACION);
    FETCH C_COD_AGT
      INTO R_COD_AGT;
    CLOSE C_COD_AGT;
  
    OPEN C_NOM_CORREDOR;
    FETCH C_NOM_CORREDOR
      INTO R_NOM_CORREDOR;
    CLOSE C_NOM_CORREDOR;
  
    OPEN C_NOM_TERCERO(R_DATA_COTIZACION.COD_DOCUM_ASEG);
    FETCH C_NOM_TERCERO
      INTO R_NOM_TERCERO;
    CLOSE C_NOM_TERCERO;
  
    OPEN C_VEH_COTIZACIONES;
    FETCH C_VEH_COTIZACIONES
      INTO R_VEH_COTIZACIONES;
    CLOSE C_VEH_COTIZACIONES;
  
    OPEN VEHICULO(R_VEH_COTIZACIONES.ID);
    FETCH VEHICULO
      INTO R_VEHICULO;
    CLOSE VEHICULO;
  
    OPEN NOMBRES(R_VEHICULO.COD_MARCA,
                 R_VEHICULO.COD_MODELO,
                 R_VEHICULO.COD_SUB_MODELO);
    FETCH NOMBRES
      INTO R_NOMBRES;
    CLOSE NOMBRES;
  
    OPEN C_NOM_CUOTA;
    FETCH C_NOM_CUOTA
      INTO R_NOM_CUOTA;
    CLOSE C_NOM_CUOTA;
  
    mel_p_num_pol_grupo(1,
                        801,
                        R_DATA_COTIZACION.COD_DOCUM_MAE,
                        R_VEH_COTIZACIONES.COD_DOCUM_BEN,
                        R_DATA_COTIZACION.COD_PLAN,
                        L_NUM_POLIZA_GRUPO,
                        L_NUM_CONTRATO);
  
    MEL_K_TERCERO_TRN.P_TRAE_NOM_ASEGURADO(R_DATA_COTIZACION.COD_DOCUM_ASEG,
                                           V_NOM_TERCERO,
                                           V_APE1_TERCERO,
                                           V_APE2_TERCERO,
                                           V_ERROR);
  
    CASE R_VEH_COTIZACIONES.COD_DOCUM_BEN
      WHEN 'RIPLEY' THEN
        L_ABR_FORMULARIO := 'COTIZ_VEH_RIPLEY';
      WHEN 'AUTOANTIGUO' THEN
        L_ABR_FORMULARIO := 'COTIZ_VEH_ANTIGUO';
      WHEN 'RIPLEYBI' THEN
        L_ABR_FORMULARIO := 'COTIZ_VEH_RIPLEY';
      WHEN 'RIPLEYFUNC' THEN
        L_ABR_FORMULARIO := 'COTIZ_VEH_RIPLEY';
        --WHEN 'RIPLEYCALL' THEN
      WHEN 'RIPLEYDESCU' THEN
        L_ABR_FORMULARIO := 'COTIZ_VEH_RIPLEY';
      WHEN 'RIPLEYCC' THEN
        L_ABR_FORMULARIO := 'COTIZ_VEH_RIPLEY_ASIST';
      WHEN 'RIPLEYUC' THEN
        L_ABR_FORMULARIO := 'COTIZ_VEH_RIPLEY_ASIST';
      WHEN 'RIPLEYUCHILE' THEN
        L_ABR_FORMULARIO := 'COTIZ_VEH_RIPLEY_ASIST';
      WHEN 'RIPLEYXBOX' THEN
        L_ABR_FORMULARIO := 'COTIZ_VEH_RIPLEY_ASIST';
      WHEN 'RIPLEYDIANINO' THEN
        L_ABR_FORMULARIO := 'COTIZ_VEH_RIPLEY_ASIST';
      WHEN 'RIPLEYCOR' THEN
        L_ABR_FORMULARIO := 'COTIZ_VEH_RIPLEY_ASIST';
      WHEN 'RIPLEYFUNC' THEN
        L_ABR_FORMULARIO := 'COTIZ_VEH_RIPLEY_ASIST';
      WHEN 'ESCOLARBIANUAL' THEN
        L_ABR_FORMULARIO := 'COTIZ_VEH_RIPLEY_ASIST';
      WHEN 'WILLIS' THEN
        L_ABR_FORMULARIO := 'COTIZ_VEH_WILLIS';
      WHEN '789967806' THEN
        /*BICE*/
        L_ABR_FORMULARIO := 'COTIZ_VEH_CLIC';
      WHEN '777215604' THEN
        /* GRUNFELD */
        L_ABR_FORMULARIO := 'C_VEH_GRUNFELD';
      ELSE
        IF R_VEH_COTIZACIONES.MCA_MEL = 'S' THEN
          L_ABR_FORMULARIO := 'COTIZ_VEH_ANTIGUO';
        ELSE
          L_ABR_FORMULARIO := 'COTIZ_VEH_ANTIGUO';
        END IF;
    END CASE;
  
    --L_ABR_FORMULARIO := 'COTIZ_VEH';
  
    /* IF R_COD_AGT.COD_AGT = '42173' THEN
      L_ABR_FORMULARIO := 'COTIZ_VEH_CLIC';
    END IF;*/
  
    -- L_DIRECTORIO     := '/AP/LIS/FPATH';
  
    L_DIRECTORIO  := 'DPATH';
    L_NOM_FICHERO := 'VEH_COT_' || P_NUM_COTIZACION || '.DAT';
    P_NOM_FIC     := 'VEH_COT_' || P_NUM_COTIZACION || '.PDF';
  
    l_id_fichero := UTL_FILE.FOPEN(l_directorio, l_nom_fichero, 'w');
  
    UTL_FILE.PUTF(l_id_fichero,
                  '<job> ' || l_abr_formulario ||
                  ' -C -gpdf -pagcount -outputD:\inetpub\PDF\' || p_nom_fic || '\n');
  
    IF R_VEH_COTIZACIONES.MCA_MEL = 'S' THEN
      P_GRABA_DAT(' <glb> TIPOCOT ',
                  '(PARA EMISION ELECTRONICA)',
                  L_ID_FICHERO);
    ELSE
      P_GRABA_DAT(' <glb> TIPOCOT ',
                  '(PARA EMISION EN OFICINA MAPFRE)',
                  L_ID_FICHERO);
    END IF;
  
    --P_GRABA_DAT(' <glb> TIPOCOT ', '', L_ID_FICHERO);
    P_GRABA_DAT(' <glb> NUM_COTIZ ', P_NUM_COTIZACION, L_ID_FICHERO);
    P_GRABA_DAT(' <glb> NOM_ASEG ',
                V_NOM_TERCERO || ' ' || V_APE1_TERCERO || ' ' ||
                V_APE2_TERCERO,
                L_ID_FICHERO);
    /*P_GRABA_DAT(' <glb> APE_ASEG ',
    V_APE1_TERCERO || ' ' || V_APE2_TERCERO,
    L_ID_FICHERO);*/
    P_GRABA_DAT(' <fld> RUT_ASEG ',
                REPLACE(EM_F_EDITA_COD_DOCUM(R_DATA_COTIZACION.COD_DOCUM_ASEG),
                        ',',
                        '.'),
                L_ID_FICHERO);
    P_GRABA_DAT(' <fld> MARCA ',
                R_NOMBRES.NOM_MARCA || ' ' || R_NOMBRES.NOM_MODELO || ' ' ||
                R_NOMBRES.NOM_SUB_MODELO || ' ' || R_VEHICULO.ANO_FAB ||
                ' Patente ' || R_VEHICULO.NUM_MATRICULA,
                L_ID_FICHERO);
    /*P_GRABA_DAT(' <fld> ANIO ', R_VEHICULO.ANO_FAB, L_ID_FICHERO);
    P_GRABA_DAT(' <fld> PATENTE', R_VEHICULO.NUM_MATRICULA, L_ID_FICHERO);*/
    P_GRABA_DAT(' <fld> MONTO_RC',
                R_VEH_COTIZACIONES.MONTO_RC,
                L_ID_FICHERO);
  
    P_GRABA_DAT(' <glb> NUM_POL_GRUPO ',
                R_VEH_COTIZACIONES.COD_DOCUM_BEN,
                L_ID_FICHERO);
  
    P_BUSCA_RANGO_EDAD(R_VEH_COTIZACIONES.EDAD_CONDUCTOR,
                       L_RANGO_EDAD_CONDUCTOR);
  
    OPEN C_TRAE_CONDUCTORES(L_RANGO_EDAD_CONDUCTOR);
    FETCH C_TRAE_CONDUCTORES
      INTO R_TRAE_CONDUCTORES;
    CLOSE C_TRAE_CONDUCTORES;
  
    V_TXT_EDAD_CONDUCTOR := R_VEH_COTIZACIONES.EDAD_CONDUCTOR;
  
    --Revisa si tiene sisgen
  
    IF R_VEH_COTIZACIONES.CANT_SINIESTROS > 0 THEN
      V_SISGEN := 'S';
    ELSE
      V_SISGEN := '';
    END IF;
  
    --   
  
    P_GRABA_DAT(' <fld> EDAD_COND', V_TXT_EDAD_CONDUCTOR, L_ID_FICHERO);
  
    CONTADOR       := 0;
    FLAG_CLAUSULA  := 0;
    FLAG_FLEX      := 0;
    FLAG_BALANCE   := 0;
    FLAG_MASTER    := 0;
    FLAG_ELEMENTAL := 0;
  
    FOR R_COTIZACIONES IN C_COTIZACIONES LOOP
    
      CONTADOR := CONTADOR + 1;
    
      IF CONTADOR <= 12 THEN
      
        /*OPEN C_MODALIDAD(R_COTIZACIONES.COD_MODALIDAD);
        FETCH C_MODALIDAD
          INTO V_NOM_MODALIDAD;
        CLOSE C_MODALIDAD;*/
      
        P_NOM_MODALIDAD(R_COTIZACIONES.COD_MODALIDAD, V_NOM_MODALIDAD);
      
        --- 12CUOTAS
      
        MEL_K_COBRANZA.P_CALCULO_CUOTA(P_NUM_CUOTAS_PAT,
                                       R_COTIZACIONES.IMP_PRIMA_NETA,
                                       0,
                                       R_COTIZACIONES.COD_RAMO,
                                       'TA',
                                       '25',
                                       V_IMP_NETO,
                                       V_INT_IMPTO,
                                       V_VAL_CUOTA_NETA,
                                       V_VAL_CUOTA_IMPTO,
                                       V_VALOR_CUOTA,
                                       V_ERROR);
      
        /*IF V_VALOR_CUOTA < 0.8 THEN
          V_VALOR_CUOTA := ' - ';
        END IF;*/
      
        P_GRABA_DAT('<fld> VALOR_CTA_' || R_COTIZACIONES.COD_MODALIDAD || ' ',
                    V_VALOR_CUOTA,
                    L_ID_FICHERO);
      
        -- PRIMA TOTAL
      
        P_GRABA_DAT('<fld> PAG_CONTAD_' || R_COTIZACIONES.COD_MODALIDAD || ' ',
                    trim(to_char(R_COTIZACIONES.IMP_PRIMA_BRUTA, '990.99')),
                    L_ID_FICHERO);
      
        MEL_K_COBRANZA.P_CALCULO_CUOTA(P_NUM_CUOTAS_PAT,
                                       R_COTIZACIONES.IMP_PRIMA_NETA,
                                       0,
                                       R_COTIZACIONES.COD_RAMO,
                                       'GD',
                                       '25',
                                       V_IMP_NETO,
                                       V_INT_IMPTO,
                                       V_VAL_CUOTA_NETA,
                                       V_VAL_CUOTA_IMPTO,
                                       V_VALOR_CUOTA,
                                       V_ERROR);
      
        P_GRABA_DAT('<fld> VALOR_AVISO_' || R_COTIZACIONES.COD_MODALIDAD || ' ',
                    V_VALOR_CUOTA,
                    L_ID_FICHERO);
      
        IF (R_COTIZACIONES.MCA_HIJOS = 'S') THEN
          P_GRABA_DAT('<fld> HIJOS_ASEG',
                      'Asegurado con hijos',
                      L_ID_FICHERO);
        ELSE
          P_GRABA_DAT('<fld> HIJOS_ASEG',
                      'Asegurado sin hijos',
                      L_ID_FICHERO);
        END IF;
      
        IF (R_COTIZACIONES.MCA_FRANQUICIA = 'S') THEN
          P_GRABA_DAT('<fld> FRANQUICIA',
                      'Con franquicia aduanera',
                      L_ID_FICHERO);
        ELSE
          P_GRABA_DAT('<fld> FRANQUICIA',
                      'Sin franquicia aduanera',
                      L_ID_FICHERO);
        END IF;
      
        P_GRABA_DAT('<fld> NUM_CUOTAS',
                    R_NOM_CUOTA.NOM_FRACC_PAGO,
                    L_ID_FICHERO);
      
        /*********************************************************************************************/
      
      END IF;
    
      CASE
        WHEN R_COTIZACIONES.COD_MODALIDAD IN (8000, 8003, 8005, 8010) THEN
          IF FLAG_FLEX = 0 THEN
          
            FLAG_FLEX := 1;
          
            FOR R_COBERTURAS IN C_COBERTURAS(R_COTIZACIONES.COD_MODALIDAD) LOOP
            
              IF R_COBERTURAS.ID_COBERTURA IN
                 ('RC_1800', 'RC_4300', 'DVEXT', 'AM') THEN
                CASE
                  WHEN R_COBERTURAS.ID_COBERTURA = 'RC_1800' AND
                       R_COTIZACIONES.MONTO_DM = '8200' THEN
                    P_GRABA_DAT(' <fld> ' || R_COBERTURAS.ID_COBERTURA || '_1',
                                'Si',
                                L_ID_FICHERO);
                  WHEN R_COBERTURAS.ID_COBERTURA = 'RC_4300' AND
                       R_COTIZACIONES.MONTO_DM = '8201' THEN
                    P_GRABA_DAT(' <fld> ' || R_COBERTURAS.ID_COBERTURA || '_1',
                                'Si',
                                L_ID_FICHERO);
                  WHEN R_COBERTURAS.ID_COBERTURA = 'DVEXT' AND
                       R_COTIZACIONES.DEDUCIBLE = '8105' THEN
                    P_GRABA_DAT(' <fld> ' || R_COBERTURAS.ID_COBERTURA || '_1',
                                'Si',
                                L_ID_FICHERO);
                    /*WHEN R_COBERTURAS.ID_COBERTURA LIKE 'AM%' AND
                       R_COTIZACIONES.MONTO_LC = '8133' THEN
                    IF R_COTIZACIONES.MCA_MEL = 'S' THEN
                      P_GRABA_DAT(' <fld> ' || R_COBERTURAS.ID_COBERTURA || '_' ||
                                  CONTADOR || ' ',
                                  'Auto Reemplazo Sin Limite',
                                  L_ID_FICHERO);
                    ELSE
                      P_GRABA_DAT(' <fld> ' || R_COBERTURAS.ID_COBERTURA || '_' ||
                                  CONTADOR || ' ',
                                  'Auto Reemplazo 5 dias',
                                  L_ID_FICHERO);
                    END IF;*/
                  ELSE
                    P_GRABA_DAT(' <fld> ' || R_COBERTURAS.ID_COBERTURA || '_1',
                                '-',
                                L_ID_FICHERO);
                END CASE;
              
              ELSE
              
                IF R_COBERTURAS.TEXTO_COBERTURA IS NULL THEN
                
                  P_GRABA_DAT(' <fld> ' || R_COBERTURAS.ID_COBERTURA || '_' ||
                              CONTADOR || ' ',
                              'SI',
                              L_ID_FICHERO);
                ELSE
                  P_GRABA_DAT(' <fld> ' || R_COBERTURAS.ID_COBERTURA || '_' ||
                              CONTADOR || ' ',
                              R_COBERTURAS.TEXTO_COBERTURA,
                              L_ID_FICHERO);
                END IF;
              
              END IF;
            
            END LOOP;
          END IF;
        WHEN R_COTIZACIONES.COD_MODALIDAD IN (8120, 8123, 8125, 8121) THEN
          IF FLAG_MASTER = 0 THEN
          
            FLAG_MASTER := 1;
          
            FOR R_COBERTURAS IN C_COBERTURAS(R_COTIZACIONES.COD_MODALIDAD) LOOP
            
              IF R_COBERTURAS.ID_COBERTURA IN
                 ('RC_1800', 'RC_4300', 'DVEXT', 'AM') THEN
                CASE
                  WHEN R_COBERTURAS.ID_COBERTURA = 'RC_1800' AND
                       R_COTIZACIONES.MONTO_DM = '8200' THEN
                    P_GRABA_DAT(' <fld> ' || R_COBERTURAS.ID_COBERTURA || '_2',
                                'Si',
                                L_ID_FICHERO);
                  WHEN R_COBERTURAS.ID_COBERTURA = 'RC_4300' AND
                       R_COTIZACIONES.MONTO_DM = '8201' THEN
                    P_GRABA_DAT(' <fld> ' || R_COBERTURAS.ID_COBERTURA || '_2',
                                'Si',
                                L_ID_FICHERO);
                  WHEN R_COBERTURAS.ID_COBERTURA = 'DVEXT' AND
                       R_COTIZACIONES.DEDUCIBLE = '8105' THEN
                    P_GRABA_DAT(' <fld> ' || R_COBERTURAS.ID_COBERTURA || '_2',
                                'Si',
                                L_ID_FICHERO);
                    /*WHEN R_COBERTURAS.ID_COBERTURA LIKE 'AM%' AND
                       R_COTIZACIONES.MONTO_LC = '8133' THEN
                    IF R_COTIZACIONES.MCA_MEL = 'S' THEN
                      P_GRABA_DAT(' <fld> ' || R_COBERTURAS.ID_COBERTURA || '_' ||
                                  CONTADOR || ' ',
                                  'Auto Reemplazo Sin Limite',
                                  L_ID_FICHERO);
                    ELSE
                      P_GRABA_DAT(' <fld> ' || R_COBERTURAS.ID_COBERTURA || '_' ||
                                  CONTADOR || ' ',
                                  'Auto Reemplazo 5 dias',
                                  L_ID_FICHERO);
                    END IF;*/
                  ELSE
                    P_GRABA_DAT(' <fld> ' || R_COBERTURAS.ID_COBERTURA || '_2',
                                '-',
                                L_ID_FICHERO);
                END CASE;
              
              ELSE
              
                IF R_COBERTURAS.TEXTO_COBERTURA IS NULL THEN
                
                  P_GRABA_DAT(' <fld> ' || R_COBERTURAS.ID_COBERTURA || '_' ||
                              CONTADOR || ' ',
                              'SI',
                              L_ID_FICHERO);
                ELSE
                  P_GRABA_DAT(' <fld> ' || R_COBERTURAS.ID_COBERTURA || '_' ||
                              CONTADOR || ' ',
                              R_COBERTURAS.TEXTO_COBERTURA,
                              L_ID_FICHERO);
                END IF;
              
              END IF;
            
            END LOOP;
          
          END IF;
        WHEN R_COTIZACIONES.COD_MODALIDAD = 8900 THEN
          IF FLAG_BALANCE = 0 THEN
          
            FLAG_BALANCE := 1;
            FOR R_COBERTURAS IN C_COBERTURAS(R_COTIZACIONES.COD_MODALIDAD) LOOP
            
              IF R_COBERTURAS.ID_COBERTURA IN
                 ('RC_1800', 'RC_4300', 'DVEXT', 'AM') THEN
                CASE
                  WHEN R_COBERTURAS.ID_COBERTURA = 'RC_1800' AND
                       R_COTIZACIONES.MONTO_DM = '8200' THEN
                    P_GRABA_DAT(' <fld> ' || R_COBERTURAS.ID_COBERTURA || '_3',
                                'Si',
                                L_ID_FICHERO);
                  WHEN R_COBERTURAS.ID_COBERTURA = 'RC_4300' AND
                       R_COTIZACIONES.MONTO_DM = '8201' THEN
                    P_GRABA_DAT(' <fld> ' || R_COBERTURAS.ID_COBERTURA || '_3',
                                'Si',
                                L_ID_FICHERO);
                  WHEN R_COBERTURAS.ID_COBERTURA = 'DVEXT' AND
                       R_COTIZACIONES.DEDUCIBLE = '8105' THEN
                    P_GRABA_DAT(' <fld> ' || R_COBERTURAS.ID_COBERTURA || '_3',
                                'Si',
                                L_ID_FICHERO);
                    /*IF R_COTIZACIONES.DEDUCIBLE = '8105' THEN
                    P_GRABA_DAT(' <fld> ' || R_COBERTURAS.ID_COBERTURA || '_' ||
                                CONTADOR || ' ',
                                'INCLUIDO',
                                L_ID_FICHERO);*/
                  ELSE
                    P_GRABA_DAT(' <fld> ' || R_COBERTURAS.ID_COBERTURA || '_3',
                                '-',
                                L_ID_FICHERO);
                END CASE;
              
              ELSE
              
                IF R_COBERTURAS.TEXTO_COBERTURA IS NULL THEN
                
                  P_GRABA_DAT(' <fld> ' || R_COBERTURAS.ID_COBERTURA || '_' ||
                              CONTADOR || ' ',
                              'SI',
                              L_ID_FICHERO);
                ELSE
                  P_GRABA_DAT(' <fld> ' || R_COBERTURAS.ID_COBERTURA || '_' ||
                              CONTADOR || ' ',
                              R_COBERTURAS.TEXTO_COBERTURA,
                              L_ID_FICHERO);
                END IF;
              
              END IF;
            
            END LOOP;
          END IF;
        WHEN R_COTIZACIONES.COD_MODALIDAD = 8910 THEN
          IF FLAG_ELEMENTAL = 0 THEN
          
            FLAG_ELEMENTAL := 1;
          
            FOR R_COBERTURAS IN C_COBERTURAS(R_COTIZACIONES.COD_MODALIDAD) LOOP
            
              IF R_COBERTURAS.ID_COBERTURA IN
                 ('RC_1800', 'RC_4300', 'DVEXT') THEN
                CASE
                  WHEN R_COBERTURAS.ID_COBERTURA = 'RC_1800' AND
                       R_COTIZACIONES.MONTO_DM = '8200' THEN
                    P_GRABA_DAT(' <fld> ' || R_COBERTURAS.ID_COBERTURA || '_4',
                                'Si',
                                L_ID_FICHERO);
                  WHEN R_COBERTURAS.ID_COBERTURA = 'RC_4300' AND
                       R_COTIZACIONES.MONTO_DM = '8201' THEN
                    P_GRABA_DAT(' <fld> ' || R_COBERTURAS.ID_COBERTURA || '_4',
                                'Si',
                                L_ID_FICHERO);
                  WHEN R_COBERTURAS.ID_COBERTURA = 'DVEXT' AND
                       R_COTIZACIONES.DEDUCIBLE = '8105' THEN
                    P_GRABA_DAT(' <fld> ' || R_COBERTURAS.ID_COBERTURA || '_4',
                                'Si',
                                L_ID_FICHERO);
                  ELSE
                    P_GRABA_DAT(' <fld> ' || R_COBERTURAS.ID_COBERTURA || '_4',
                                '-',
                                L_ID_FICHERO);
                END CASE;
              
              ELSE
              
                IF R_COBERTURAS.TEXTO_COBERTURA IS NULL THEN
                
                  P_GRABA_DAT(' <fld> ' || R_COBERTURAS.ID_COBERTURA || '_' ||
                              CONTADOR || ' ',
                              'SI',
                              L_ID_FICHERO);
                ELSE
                  P_GRABA_DAT(' <fld> ' || R_COBERTURAS.ID_COBERTURA || '_' ||
                              CONTADOR || ' ',
                              R_COBERTURAS.TEXTO_COBERTURA,
                              L_ID_FICHERO);
                END IF;
              
              END IF;
            
            END LOOP;
          
          END IF;
        
        ELSE
        
          DBMS_OUTPUT.PUT_LINE('NADA');
          /*CONTADOR := CONTADOR - 1;*/
      
      END CASE;
    
      IF R_COTIZACIONES.COD_MODALIDAD IN
         (8000, 8003, 8005, 8010, 8015, 8120, 8123, 8125, 8121, 8900) THEN
      
        IF R_COTIZACIONES.MCA_MEL = 'S' THEN
        
          P_GRABA_DAT('<fld> AUTOREM',
                      'En caso de perdida total se otorgara auto de reemplazo sin limite con copago de $5000 diarios.
                     En caso de da?o parcial se otorgara auto de reemplazo sin limite con copago de $5000 diarios',
                      L_ID_FICHERO);
        
        ELSE
        
          P_GRABA_DAT('<fld> AUTOREM',
                      'En caso de perdida total se otorgara auto de reemplazo sin limite con copago de $5000 diarios.
                     En caso de da?o parcial se otorgara auto de reemplazo con tope de 5 dias con copago de $5000 diarios',
                      L_ID_FICHERO);
        
        END IF;
      
      END IF;
    
      IF V_TXT_EDAD_CONDUCTOR >= 35 AND
         R_COTIZACIONES.COD_MODALIDAD IN (8120, 8123, 8125, 8121) THEN
      
        IF FLAG_CLAUSULA = 0 THEN
        
          P_GRABA_DAT('<fld> NOM_CLAUSULA', 'CONDUCT+35', L_ID_FICHERO);
          P_GRABA_DAT('<fld> CLAUSULA',
                      'Esta poliza ha sido suscrita y el riesgo ha sido aceptado por la compa?ia de seguros, sobre la base que el conductor  es mayor de 35 a?os, si en caso de siniestro el conductor  sea menor  a esta edad, las partes  acuerdan expresamente que se aplicara un deducible adicional al contratado  voluntariamente, ascendente a el 10% de la perdida con un minimo de UF. 20.- en todo y cada siniestro (Condicion aplica solo a Plan Master).',
                      L_ID_FICHERO);
          FLAG_CLAUSULA := 1;
        
        END IF;
      
      END IF;
    
      IF R_COTIZACIONES.ASISTENCIA = '1' THEN
      
        P_GRABA_DAT('<fld> EXGARAGE', 'Si', L_ID_FICHERO);
      ELSE
        P_GRABA_DAT('<fld> EXGARAGE', '-', L_ID_FICHERO);
      
      END IF;
    
      IF R_COTIZACIONES.COD_MODALIDAD IN
         (8000, 8003, 8005, 8010, 8015, 8120, 8123, 8125, 8121) THEN
      
        IF R_COTIZACIONES.MONTO_LC = '8133' THEN
        
          IF R_COTIZACIONES.MCA_MEL = 'S' THEN
          
            P_GRABA_DAT('<fld> ASISTENCIA',
                        'Incluye auto de reemplazo sin limite(solo emision electronica en Mapfre En Linea)',
                        L_ID_FICHERO);
          
            /*ELSE
            
            P_GRABA_DAT('<fld> ASISTENCIA',
                        'Incluye 5 dias de auto de reemplazo.',
                        L_ID_FICHERO);*/
          
          END IF;
        
        END IF;
      
      END IF;
    
      IF R_COTIZACIONES.DEDUCIBLE = '8105' THEN
      
        P_GRABA_DAT('<fld> EXTRANJERO',
                    'Incluye cobertura de da?os al vehiculo durante viaje al extranjero',
                    L_ID_FICHERO);
      
      END IF;
    
      IF R_COTIZACIONES.FACTURA_48 = '0' AND
         R_VEH_COTIZACIONES.NUM_MATRICULA = 'A/D' THEN
      
        L_MCA_EXPRESS := 'EX';
      
      ELSE
      
        L_MCA_EXPRESS := '';
      
      END IF;
    
      /*********** SEXO **********/
      IF R_COTIZACIONES.anos_sin_sini = '0' THEN
      
        L_MCA_SEXO := 'F';
      
      ELSE
      
        L_MCA_SEXO := 'M';
      
      END IF;
    
      P_TRAE_DESC_COTIZACION(P_NUM_COTIZACION, L_TIPO_DESC, L_VALOR_DESC);
    
      IF R_COTIZACIONES.COD_CUADRO_COM IS NOT NULL THEN
      
        OPEN C_COMISION(R_COTIZACIONES.COD_CUADRO_COM,
                        R_COTIZACIONES.COD_MODALIDAD);
        FETCH C_COMISION
          INTO R_COMISION;
        CLOSE C_COMISION;
      
        P_GRABA_DAT('<fld> MONTOCOMISION',
                    R_COMISION.PORC_COM || ' - E:' || V_TXT_EDAD_CONDUCTOR || ' ' ||
                    V_SISGEN || ' ' || L_MCA_EXPRESS || ' ' || L_MCA_SEXO || ' ' ||
                    L_TIPO_DESC || ' ' || L_VALOR_DESC,
                    L_ID_FICHERO);
      
        /*    P_GRABA_DAT('<fld> COMISION',
        'POLIZA DE EMISION EXCLUSIVA EN MAPFRE EN LINEA',
        L_ID_FICHERO);*/
      ELSE
        P_GRABA_DAT('<fld> MONTOCOMISION',
                    'E:' || V_TXT_EDAD_CONDUCTOR || ' ' || V_SISGEN || ' ' ||
                    L_MCA_EXPRESS || ' ' || L_MCA_SEXO || ' ' ||
                    L_TIPO_DESC || ' ' || L_VALOR_DESC,
                    L_ID_FICHERO);
      END IF;
    
      IF R_COTIZACIONES.MCA_MEL = 'S' THEN
      
        P_GRABA_DAT('<fld> COMISION',
                    '*******************  POLIZA DE EMISION EXCLUSIVA EN MAPFRE EN LINEA  *******************',
                    L_ID_FICHERO);
      END IF;
    
      IF R_COTIZACIONES.MCA_MEL = 'N' THEN
      
        P_GRABA_DAT('<fld> COMISION',
                    '*********************  POLIZA DE EMISION EXCLUSIVA OFICINA MAPFRE  *********************',
                    L_ID_FICHERO);
      END IF;
    
    END LOOP;
  
    P_GRABA_DAT(' <glb> NOM_CORREDOR',
                R_NOM_CORREDOR.NOM_CORREDOR,
                L_ID_FICHERO);
  
    P_GRABA_DAT(' <fld> SUCURSAL', R_NOM_CORREDOR.NOM_NIVEL3, L_ID_FICHERO);
  
    P_GRABA_DAT(' <fld> FEC_ACTUAL',
                TO_CHAR(R_DATA_COTIZACION.FEC_ACTU, 'DD') || ' DE ' ||
                RTRIM(TO_CHAR(R_DATA_COTIZACION.FEC_ACTU,
                              'MONTH',
                              'NLS_DATE_LANGUAGE = SPANISH')) || ' DE ' ||
                TO_CHAR(R_DATA_COTIZACION.FEC_ACTU, 'YYYY'),
                L_ID_FICHERO);
  
    IF (L_ABR_FORMULARIO = 'COTIZ_VEH_RIPLEY' /* or
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             L_ABR_FORMULARIO = 'COTIZ_VEH'*/
       ) THEN
      IF ((R_VEHICULO.COD_MARCA = '340' AND
         R_VEHICULO.COD_MODELO IN
         ('30', '35', '47', '113', '49', '50', '122', '52', 117, '53')) OR
         (R_VEHICULO.COD_MARCA = '520' AND
         R_VEHICULO.COD_MODELO IN ('80',
                                     '135',
                                     '98',
                                     '99',
                                     '100',
                                     '101',
                                     '102',
                                     '133',
                                     '130',
                                     '131',
                                     '103',
                                     '133')) OR
         (R_VEHICULO.COD_MARCA = '375' AND
         R_VEHICULO.COD_MODELO IN ('175', '101', '200')) OR
         (R_VEHICULO.COD_MARCA = '535' AND
         R_VEHICULO.COD_MODELO IN ('91', '177', '165')) OR
         (R_VEHICULO.COD_MARCA = '550' AND
         R_VEHICULO.COD_MODELO IN ('75', '150', '177')) OR
         (R_VEHICULO.COD_MARCA = '220' AND R_VEHICULO.COD_MODELO IN ('37'))) THEN
      
        P_GRABA_DAT('<NPG>', '', L_ID_FICHERO);
      
      END IF;
    
    END IF;
  
    IF R_VEH_COTIZACIONES.MCA_MEL != 'S' THEN
    
      IF ((R_VEHICULO.COD_MARCA = '340' AND
         R_VEHICULO.COD_MODELO IN
         ('30', '35', '47', '113', '49', '50', '122', '52', 117, '53')) OR
         (R_VEHICULO.COD_MARCA = '520' AND
         R_VEHICULO.COD_MODELO IN ('80',
                                     '135',
                                     '98',
                                     '99',
                                     '100',
                                     '101',
                                     '102',
                                     '133',
                                     '130',
                                     '131',
                                     '103',
                                     '133')) OR
         (R_VEHICULO.COD_MARCA = '375' AND
         R_VEHICULO.COD_MODELO IN ('175', '101', '200')) OR
         (R_VEHICULO.COD_MARCA = '535' AND
         R_VEHICULO.COD_MODELO IN ('91', '177', '165')) OR
         (R_VEHICULO.COD_MARCA = '550' AND
         R_VEHICULO.COD_MODELO IN ('75', '150', '177')) OR
         (R_VEHICULO.COD_MARCA = '220' AND R_VEHICULO.COD_MODELO IN ('37'))) THEN
      
        P_GRABA_DAT('<NPG>', '', L_ID_FICHERO);
      
      END IF;
    
    END IF;
  
    P_GRABA_DAT('<NPG>', '', L_ID_FICHERO);
    P_GRABA_DAT('<NPG>', '', L_ID_FICHERO);
  
    UTL_FILE.FCLOSE(L_ID_FICHERO);
  
    COMMIT;
  
  EXCEPTION
    WHEN UTL_FILE.INTERNAL_ERROR THEN
      RAISE_APPLICATION_ERROR(-20000, 'ERROR INTERNO (UTL_FILE)');
    WHEN UTL_FILE.INVALID_FILEHANDLE THEN
      RAISE_APPLICATION_ERROR(-20000,
                              'MANEJADOR FICHERO INVALIDO (UTL_FILE)');
    WHEN UTL_FILE.INVALID_MODE THEN
      RAISE_APPLICATION_ERROR(-20000, 'MODO INVALIDO (UTL_FILE)');
    WHEN UTL_FILE.INVALID_OPERATION THEN
      RAISE_APPLICATION_ERROR(-20000, 'OPERACION INVALIDA (UTL_FILE)');
    WHEN UTL_FILE.INVALID_PATH THEN
      RAISE_APPLICATION_ERROR(-20000,
                              'DIRECTORIO O FICHERO NO ACCESIBLE (UTL_FILE)');
    WHEN UTL_FILE.WRITE_ERROR THEN
      RAISE_APPLICATION_ERROR(-20000, 'ERROR DE ESCRITURA (UTL_FILE)');
    WHEN OTHERS THEN
      P_ERROR := SQLERRM;
  END P_IMPRIME_COTIZACION2_ANTIGUO;

  PROCEDURE P_CALCULA_PRIMAS_CON_FECHAS(P_COD_DOCUM_MAE          VARCHAR2,
                                        P_COD_DOCUM_ASEG         VARCHAR2,
                                        P_COD_MARCA              NUMBER,
                                        P_COD_MODELO             NUMBER,
                                        P_COD_SUB_MODELO         NUMBER,
                                        P_ANTIG_VEH              VARCHAR2,
                                        P_COD_MODALIDAD          NUMBER,
                                        P_NUM_MATRICULA          VARCHAR2,
                                        P_MONTO_RC               VARCHAR2,
                                        P_EDAD                   VARCHAR2,
                                        P_SEXO                   VARCHAR2,
                                        P_CANT_SINIESTROS        VARCHAR2,
                                        P_MONTO_SINIESTROS       VARCHAR2,
                                        P_RC_EXCESO              VARCHAR2,
                                        P_CONV                   VARCHAR2,
                                        P_COB_OPC                VARCHAR2,
                                        P_MCA_MEL                VARCHAR2,
                                        P_TIPO_DESCUENTO_DATABSS VARCHAR2,
                                        P_DESCUENTO_DATABSS      VARCHAR2,
                                        P_FECHA_INI_VIGENCIA     VARCHAR2,
                                        P_FECHA_FIN_VIGENCIA     VARCHAR2,
                                        P_PRIMA                  OUT VARCHAR2,
                                        P_PRIMA_TOTAL            OUT VARCHAR2,
                                        P_DESC                   OUT VARCHAR2,
                                        P_PORC_DESC              OUT VARCHAR2,
                                        P_RECAR                  OUT VARCHAR2,
                                        P_PORC_RECAR             OUT VARCHAR2,
                                        P_COD_RAMO               IN OUT VARCHAR2,
                                        P_ERROR                  OUT VARCHAR2) IS
  
    CURSOR COD_AGT(V_COD_MAE VARCHAR2) IS
      SELECT A.COD_AGT, A.COD_EJECUTIVO, A.COD_NIVEL3, A.TIP_AGT
        FROM A1001332@OVPRO_PRD A
       WHERE A.COD_CIA = 1
         AND (A.TIP_DOCUM = 'RUT' OR A.TIP_DOCUM = 'DIR')
         AND A.COD_DOCUM = V_COD_MAE
         AND A.COD_ACT_TERCERO = 2
         AND A.COD_CALIDAD = 1
         AND A.MCA_INH = 'N'
         AND A.FEC_VALIDEZ = (SELECT MAX(FEC_VALIDEZ)
                                FROM A1001332@OVPRO_PRD
                               WHERE COD_CIA = 1
                                 AND COD_AGT = A.COD_AGT);
  
    R_COD_AGT COD_AGT %ROWTYPE;
  
    CURSOR C_DESCUENTO(L_COD_DOCUM VARCHAR2) IS
      SELECT T.PORC_DCTO, T.TIPO_DESC
        FROM MEL_DESCUENTOS T
       WHERE T.COD_DOCUM = L_COD_DOCUM
         AND T.COD_CONV IS NULL
         AND MCA_INH = 'N';
  
    CURSOR C_DESCUENTO_CONV(L_CONV VARCHAR2) IS
      SELECT T.PORC_DCTO, T.TIPO_DESC
        FROM MEL_DESCUENTOS T
       WHERE T.COD_CONV = L_CONV
         AND MCA_INH = 'N';
  
    R_DESCUENTO C_DESCUENTO%ROWTYPE;
  
    --
    CURSOR c_cod_modalidad IS
    --
      SELECT t.cod_plan_real
        FROM mel_planes_veh_ficticios t
       WHERE t.cod_plan = p_cod_modalidad
         and t.mca_inh = 'N';
    --
    l_existe BOOLEAN;
    --
    CURSOR c_recargo IS
    --
      SELECT T.PORC_DCTO, T.TIPO_DESC
        FROM mel_planes_veh_ficticios t
       WHERE t.cod_plan = p_cod_modalidad
         and t.mca_inh = 'N'
         and t.porc_dcto is not null;
    --
    CURSOR c_recargo_fijo IS
    --
      SELECT T.Tipo_Dcto_Fijo, T.Dcto_Fijo
        FROM mel_planes_veh_ficticios t
       WHERE t.cod_plan = p_cod_modalidad
         and t.Mca_Inh_Dcto_Fijo = 'N'
         and t.Dcto_Fijo is not null;
    --
    l_existe_recargo               BOOLEAN;
    l_existe_recargo_fijo          BOOLEAN;
    l_recargo                      c_recargo%RowTYPE;
    l_recargo_fijo                 c_recargo_fijo%RowTYPE;
    l_descuento_conv_ficticio      NUMBER := 0;
    l_tipo_descuento_conv_ficticio VARCHAR2(2);
    --
  
    L_PRIMA_PROPUESTA      NUMBER;
    P_TIPO_DESC            VARCHAR2(2);
    P_DESCUENTO            VARCHAR2(20);
    PRIMA                  NUMBER;
    IVA                    NUMBER;
    PRIMA_TOTAL            NUMBER;
    COD_TIP_VEHI           VARCHAR(5);
    PRIMA_MINIMA           NUMBER;
    DESCUENTO              NUMBER;
    DESCUENTO_CONV         NUMBER := 0;
    TIPO_DESCUENTO_CONV    VARCHAR2(2);
    L_RANGO_EDAD_CONDUCTOR VARCHAR2(10);
    L_PERDIDA_TOTAL        VARCHAR2(20);
    L_MONTO_RC_EXCESO      NUMBER;
    L_ANTIG_VEH            NUMBER;
    L_ANTIG_VEH_MAX        NUMBER;
    MESSAGE                VARCHAR2(3000);
    L_EXISTE_DCTO          BOOLEAN;
    L_RECARGO_DATABSS      NUMBER;
  
    PRIMA_EXENTA NUMBER;
  
    L_COD_MODALIDAD VARCHAR2(10);
  
    L_MONTO_COB      NUMBER;
    L_MONTO_COB_CONV NUMBER;
  
    L_NUM_POLIZA_GRUPO VARCHAR2(20);
    L_NUM_CONTRATO     VARCHAR2(20);
  
    L_TIPO_DESCUENTO_FIJO VARCHAR2(2);
    L_DESCUENTO_FIJO      VARCHAR2(20);
  
  BEGIN
    --
    OPEN c_cod_modalidad;
    FETCH c_cod_modalidad
      INTO l_cod_modalidad;
    l_existe := c_cod_modalidad%FOUND;
    CLOSE c_cod_modalidad;
    --
    IF NOT l_existe THEN
      --
      l_cod_modalidad := p_cod_modalidad;
      --
    ELSE
      --
      OPEN c_recargo;
      FETCH c_recargo
        into l_recargo;
      l_existe_recargo := c_recargo%FOUND;
      CLOSE c_recargo;
    
      if l_existe_recargo then
        l_descuento_conv_ficticio      := l_recargo.PORC_DCTO;
        l_tipo_descuento_conv_ficticio := l_recargo.TIPO_DESC;
      end if;
      --
      OPEN c_recargo_fijo;
      FETCH c_recargo_fijo
        into l_recargo_fijo;
      l_existe_recargo_fijo := c_recargo_fijo%FOUND;
      CLOSE c_recargo_fijo;
    
      if l_existe_recargo_fijo then
        L_TIPO_DESCUENTO_FIJO := l_recargo_fijo.tipo_dcto_fijo;
        L_DESCUENTO_FIJO      := l_recargo_fijo.dcto_fijo;
      end if;
    
      --
    END IF;
    --
  
    if ValidaSuspension('VEH_LIVIANOS') then
    
      P_ERROR := '1010';
    
    else
    
      OPEN COD_AGT(P_COD_DOCUM_MAE);
      FETCH COD_AGT
        INTO R_COD_AGT;
      CLOSE COD_AGT;
    
      IF P_COD_RAMO IS NULL THEN
      
        CASE
          WHEN P_CONV LIKE 'RIPLEY%' THEN
            P_COD_RAMO := '808';
          WHEN P_CONV = 'WILLIS' THEN
            P_COD_RAMO := '808';
          WHEN P_CONV = 'ESCOLARBIANUAL' THEN
            P_COD_RAMO := '808';
          ELSE
            P_DATOS_VEH_COTIZACION(P_COD_MARCA,
                                   P_COD_MODELO,
                                   P_COD_SUB_MODELO,
                                   'P',
                                   P_COD_RAMO,
                                   COD_TIP_VEHI,
                                   P_ERROR);
          
        END CASE;
      
      END IF;
    
      L_ANTIG_VEH := TO_CHAR(SYSDATE, 'YYYY') - P_ANTIG_VEH;
    
      IF L_ANTIG_VEH < 0 THEN
        L_ANTIG_VEH := 0;
      END IF;
    
      IF P_NUM_MATRICULA != 'A/D' THEN
      
        P_BUSCA_PERDIDA_TOTAL(P_NUM_MATRICULA, L_PERDIDA_TOTAL);
      
      ELSE
      
        L_PERDIDA_TOTAL := 'N';
      
      END IF;
    
      P_BUSCA_RANGO_EDAD(P_EDAD, L_RANGO_EDAD_CONDUCTOR);
    
      P_ERROR := '0';
    
      PRIMA_MINIMA := 0.1;
    
      IF P_CONV IS NULL THEN
      
        OPEN C_DESCUENTO(P_COD_DOCUM_MAE);
        FETCH C_DESCUENTO
          INTO R_DESCUENTO;
        L_EXISTE_DCTO := C_DESCUENTO%FOUND;
        CLOSE C_DESCUENTO;
      
      ELSE
      
        OPEN C_DESCUENTO_CONV(P_CONV);
        FETCH C_DESCUENTO_CONV
          INTO R_DESCUENTO;
        L_EXISTE_DCTO := C_DESCUENTO_CONV%FOUND;
        CLOSE C_DESCUENTO_CONV;
      
      END IF;
    
      IF L_EXISTE_DCTO THEN
        DESCUENTO_CONV      := R_DESCUENTO.PORC_DCTO;
        TIPO_DESCUENTO_CONV := R_DESCUENTO.TIPO_DESC;
      END IF;
    
      IF l_existe_recargo THEN
        DESCUENTO_CONV      := l_descuento_conv_ficticio;
        TIPO_DESCUENTO_CONV := l_tipo_descuento_conv_ficticio;
      END IF;
    
      CASE P_COD_DOCUM_MAE
      
        WHEN '774724206' THEN
        
          IF P_CONV = 'RIPLEYBI' THEN
          
            IF (l_cod_modalidad IN ('8120', '8123', '8125', '8121') AND
               P_EDAD < 35) THEN
            
              P_ERROR := '1001';
            
            ELSE
            
              IF (l_cod_modalidad != '8910' AND P_CANT_SINIESTROS > 3) THEN
              
                P_ERROR := '1002';
              
              ELSE
              
                mel_p_veh_limites_anti(p_cod_docum_mae,
                                       p_conv,
                                       l_cod_modalidad,
                                       l_antig_veh_max);
              
                IF L_ANTIG_VEH > L_ANTIG_VEH_MAX THEN
                
                  P_ERROR := '1003';
                
                ELSE
                
                  L_COD_MODALIDAD := SUBSTR(l_cod_modalidad, 1, 4);
                
                  P_BUSCA_RC_EXCESO(P_COD_RAMO,
                                    P_RC_EXCESO,
                                    L_COD_MODALIDAD,
                                    P_COD_DOCUM_MAE,
                                    P_CONV,
                                    L_MONTO_RC_EXCESO);
                
                  TRN_K_GLOBAL.BORRA_TODAS@OVPRO_PRD;
                
                  mel_p_num_pol_grupo(1,
                                      801,
                                      P_COD_DOCUM_MAE,
                                      P_CONV,
                                      l_cod_modalidad,
                                      L_NUM_POLIZA_GRUPO,
                                      L_NUM_CONTRATO);
                
                  TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('NUM_POLIZA_GRUPO',
                                                L_NUM_POLIZA_GRUPO);
                
                  P_BUSCA_COB_OPC(P_COD_RAMO,
                                  P_COB_OPC,
                                  l_cod_modalidad,
                                  P_COD_DOCUM_MAE,
                                  P_CONV,
                                  L_MONTO_COB,
                                  L_MONTO_COB_CONV);
                
                  P_MONTO_COB_EXENTA(P_COD_RAMO,
                                     l_cod_modalidad,
                                     PRIMA_EXENTA);
                
                  P_LLAMA_EM_P_999DV0005(P_COD_RAMO,
                                         L_COD_MODALIDAD,
                                         P_COD_MARCA,
                                         P_COD_MODELO,
                                         P_ANTIG_VEH,
                                         L_ANTIG_VEH,
                                         '1000',
                                         P_NUM_MATRICULA,
                                         'RUT',
                                         P_COD_DOCUM_ASEG,
                                         R_COD_AGT.COD_AGT,
                                         R_COD_AGT.COD_NIVEL3,
                                         P_MONTO_RC,
                                         P_SEXO,
                                         L_RANGO_EDAD_CONDUCTOR,
                                         P_EDAD,
                                         P_MONTO_SINIESTROS,
                                         P_CANT_SINIESTROS,
                                         L_PERDIDA_TOTAL,
                                         P_MCA_MEL,
                                         L_PRIMA_PROPUESTA,
                                         P_TIPO_DESC,
                                         P_DESCUENTO);
                
                  P_CUADRA_PRIMA(L_PRIMA_PROPUESTA,
                                 P_TIPO_DESC,
                                 P_DESCUENTO,
                                 PRIMA_MINIMA,
                                 TIPO_DESCUENTO_CONV,
                                 DESCUENTO_CONV,
                                 L_MONTO_RC_EXCESO,
                                 PRIMA_EXENTA,
                                 L_MONTO_COB - L_MONTO_COB_CONV,
                                 P_TIPO_DESCUENTO_DATABSS,
                                 P_DESCUENTO_DATABSS,
                                 P_COD_DOCUM_MAE,
                                 P_CONV,
                                 L_TIPO_DESCUENTO_FIJO,
                                 L_DESCUENTO_FIJO,
                                 l_cod_modalidad,
                                 P_PRIMA,
                                 P_PRIMA_TOTAL,
                                 P_DESC,
                                 P_PORC_DESC,
                                 P_RECAR,
                                 P_PORC_RECAR);
                
                  INSERT INTO MEL_VEH_BITACORA_COT
                  VALUES
                    (l_cod_modalidad,
                     P_COD_MARCA,
                     P_COD_MODELO,
                     P_COD_SUB_MODELO,
                     P_NUM_MATRICULA,
                     L_ANTIG_VEH,
                     P_ANTIG_VEH,
                     P_COD_DOCUM_ASEG,
                     P_SEXO,
                     P_EDAD,
                     P_MONTO_SINIESTROS,
                     P_CANT_SINIESTROS,
                     P_TIPO_DESCUENTO_DATABSS,
                     P_DESCUENTO_DATABSS,
                     P_COD_DOCUM_MAE,
                     P_CONV,
                     P_MCA_MEL,
                     P_COD_RAMO,
                     P_COB_OPC,
                     P_RC_EXCESO,
                     P_MONTO_RC,
                     L_RECARGO_DATABSS,
                     PRIMA_EXENTA,
                     L_PRIMA_PROPUESTA,
                     P_TIPO_DESC,
                     P_DESCUENTO,
                     P_PRIMA,
                     IVA,
                     P_PRIMA_TOTAL,
                     SYSDATE);
                  COMMIT;
                
                END IF;
              
              END IF;
            
            END IF;
          
          ELSE
          
            IF (l_cod_modalidad IN ('8120', '8123', '8125', '8121') AND
               P_EDAD < 35) THEN
            
              P_ERROR := '1001';
            
            ELSE
            
              IF (l_cod_modalidad != '8910' AND P_CANT_SINIESTROS > 3) THEN
              
                P_ERROR := '1002';
              
              ELSE
              
                mel_p_veh_limites_anti(p_cod_docum_mae,
                                       p_conv,
                                       l_cod_modalidad,
                                       l_antig_veh_max);
              
                IF L_ANTIG_VEH > L_ANTIG_VEH_MAX THEN
                
                  P_ERROR := '1003';
                
                ELSE
                
                  P_BUSCA_RC_EXCESO(P_COD_RAMO,
                                    P_RC_EXCESO,
                                    l_cod_modalidad,
                                    P_COD_DOCUM_MAE,
                                    P_CONV,
                                    L_MONTO_RC_EXCESO);
                
                  TRN_K_GLOBAL.BORRA_TODAS@OVPRO_PRD;
                
                  mel_p_num_pol_grupo(1,
                                      801,
                                      P_COD_DOCUM_MAE,
                                      P_CONV,
                                      l_cod_modalidad,
                                      L_NUM_POLIZA_GRUPO,
                                      L_NUM_CONTRATO);
                
                  IF L_NUM_POLIZA_GRUPO IS NOT NULL THEN
                  
                    TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('NUM_POLIZA_GRUPO',
                                                  L_NUM_POLIZA_GRUPO);
                  
                  END IF;
                
                  P_BUSCA_COB_OPC(P_COD_RAMO,
                                  P_COB_OPC,
                                  l_cod_modalidad,
                                  P_COD_DOCUM_MAE,
                                  P_CONV,
                                  L_MONTO_COB,
                                  L_MONTO_COB_CONV);
                
                  P_MONTO_COB_EXENTA(P_COD_RAMO,
                                     l_cod_modalidad,
                                     PRIMA_EXENTA);
                
                  P_LLAMA_EM_P_999DV0005(P_COD_RAMO,
                                         l_cod_modalidad,
                                         P_COD_MARCA,
                                         P_COD_MODELO,
                                         P_ANTIG_VEH,
                                         L_ANTIG_VEH,
                                         '1000',
                                         P_NUM_MATRICULA,
                                         'RUT',
                                         P_COD_DOCUM_ASEG,
                                         R_COD_AGT.COD_AGT,
                                         R_COD_AGT.COD_NIVEL3,
                                         P_MONTO_RC,
                                         P_SEXO,
                                         L_RANGO_EDAD_CONDUCTOR,
                                         P_EDAD,
                                         P_MONTO_SINIESTROS,
                                         P_CANT_SINIESTROS,
                                         L_PERDIDA_TOTAL,
                                         P_MCA_MEL,
                                         L_PRIMA_PROPUESTA,
                                         P_TIPO_DESC,
                                         P_DESCUENTO);
                
                  P_CUADRA_PRIMA(L_PRIMA_PROPUESTA,
                                 P_TIPO_DESC,
                                 P_DESCUENTO,
                                 PRIMA_MINIMA,
                                 TIPO_DESCUENTO_CONV,
                                 DESCUENTO_CONV,
                                 L_MONTO_RC_EXCESO,
                                 PRIMA_EXENTA,
                                 L_MONTO_COB - L_MONTO_COB_CONV,
                                 P_TIPO_DESCUENTO_DATABSS,
                                 P_DESCUENTO_DATABSS,
                                 P_COD_DOCUM_MAE,
                                 P_CONV,
                                 L_TIPO_DESCUENTO_FIJO,
                                 L_DESCUENTO_FIJO,
                                 l_cod_modalidad,
                                 P_PRIMA,
                                 P_PRIMA_TOTAL,
                                 P_DESC,
                                 P_PORC_DESC,
                                 P_RECAR,
                                 P_PORC_RECAR);
                
                  INSERT INTO MEL_VEH_BITACORA_COT
                  VALUES
                    (l_cod_modalidad,
                     P_COD_MARCA,
                     P_COD_MODELO,
                     P_COD_SUB_MODELO,
                     P_NUM_MATRICULA,
                     L_ANTIG_VEH,
                     P_ANTIG_VEH,
                     P_COD_DOCUM_ASEG,
                     P_SEXO,
                     P_EDAD,
                     P_MONTO_SINIESTROS,
                     P_CANT_SINIESTROS,
                     P_TIPO_DESCUENTO_DATABSS,
                     P_DESCUENTO_DATABSS,
                     P_COD_DOCUM_MAE,
                     P_CONV,
                     P_MCA_MEL,
                     P_COD_RAMO,
                     P_COB_OPC,
                     P_RC_EXCESO,
                     P_MONTO_RC,
                     L_RECARGO_DATABSS,
                     PRIMA_EXENTA,
                     L_PRIMA_PROPUESTA,
                     P_TIPO_DESC,
                     P_DESCUENTO,
                     P_PRIMA,
                     IVA,
                     P_PRIMA_TOTAL,
                     SYSDATE);
                  COMMIT;
                
                  IF NOT L_EXISTE_DCTO THEN
                  
                    IF P_DESC < 0 THEN
                      P_DESC := 0;
                    END IF;
                  
                  END IF;
                
                END IF;
              
              END IF;
            
            END IF;
          
          END IF;
        
        ELSE
        
          IF (l_cod_modalidad IN ('8120', '8123', '8125', '8121') AND
             P_EDAD < 35) THEN
            P_ERROR := '1001';
          
          ELSE
          
            IF (l_cod_modalidad IN ('8915') AND P_CANT_SINIESTROS >= 3) THEN
              P_ERROR := '1002';
            END IF;
          
            IF (l_cod_modalidad != '8910' AND P_CANT_SINIESTROS > 3) THEN
            
              P_ERROR := '1002';
            
            ELSE
            
              mel_p_veh_limites_anti(p_cod_docum_mae,
                                     p_conv,
                                     l_cod_modalidad,
                                     l_antig_veh_max);
            
              IF L_ANTIG_VEH > L_ANTIG_VEH_MAX THEN
              
                P_ERROR := '1003';
              
              ELSE
              
                P_BUSCA_RC_EXCESO(P_COD_RAMO,
                                  P_RC_EXCESO,
                                  l_cod_modalidad,
                                  P_COD_DOCUM_MAE,
                                  P_CONV,
                                  L_MONTO_RC_EXCESO);
              
                TRN_K_GLOBAL.BORRA_TODAS@OVPRO_PRD;
              
                mel_p_num_pol_grupo(1,
                                    801,
                                    P_COD_DOCUM_MAE,
                                    P_CONV,
                                    l_cod_modalidad,
                                    L_NUM_POLIZA_GRUPO,
                                    L_NUM_CONTRATO);
              
                IF L_NUM_POLIZA_GRUPO IS NOT NULL THEN
                
                  TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('NUM_POLIZA_GRUPO',
                                                L_NUM_POLIZA_GRUPO);
                
                END IF;
              
                P_BUSCA_COB_OPC(P_COD_RAMO,
                                P_COB_OPC,
                                l_cod_modalidad,
                                P_COD_DOCUM_MAE,
                                P_CONV,
                                L_MONTO_COB,
                                L_MONTO_COB_CONV);
              
                P_MONTO_COB_EXENTA(P_COD_RAMO,
                                   l_cod_modalidad,
                                   PRIMA_EXENTA);
              
                P_LLAMA_EM_P_999DV0005_FECHAS(P_COD_RAMO,
                                              l_cod_modalidad,
                                              P_COD_MARCA,
                                              P_COD_MODELO,
                                              P_ANTIG_VEH,
                                              L_ANTIG_VEH,
                                              '1000',
                                              P_NUM_MATRICULA,
                                              'RUT',
                                              P_COD_DOCUM_ASEG,
                                              R_COD_AGT.COD_AGT,
                                              R_COD_AGT.COD_NIVEL3,
                                              P_MONTO_RC,
                                              P_SEXO,
                                              L_RANGO_EDAD_CONDUCTOR,
                                              P_EDAD,
                                              P_MONTO_SINIESTROS,
                                              P_CANT_SINIESTROS,
                                              L_PERDIDA_TOTAL,
                                              P_MCA_MEL,
                                              P_FECHA_INI_VIGENCIA,
                                              P_FECHA_FIN_VIGENCIA,
                                              L_PRIMA_PROPUESTA,
                                              P_TIPO_DESC,
                                              P_DESCUENTO);
              
                P_CUADRA_PRIMA(L_PRIMA_PROPUESTA,
                               P_TIPO_DESC,
                               P_DESCUENTO,
                               PRIMA_MINIMA,
                               TIPO_DESCUENTO_CONV,
                               DESCUENTO_CONV,
                               L_MONTO_RC_EXCESO,
                               PRIMA_EXENTA,
                               L_MONTO_COB - L_MONTO_COB_CONV,
                               P_TIPO_DESCUENTO_DATABSS,
                               P_DESCUENTO_DATABSS,
                               P_COD_DOCUM_MAE,
                               P_CONV,
                               L_TIPO_DESCUENTO_FIJO,
                               L_DESCUENTO_FIJO,
                               l_cod_modalidad,
                               P_PRIMA,
                               P_PRIMA_TOTAL,
                               P_DESC,
                               P_PORC_DESC,
                               P_RECAR,
                               P_PORC_RECAR);
              
                INSERT INTO MEL_VEH_BITACORA_COT
                VALUES
                  (l_cod_modalidad,
                   P_COD_MARCA,
                   P_COD_MODELO,
                   P_COD_SUB_MODELO,
                   P_NUM_MATRICULA,
                   L_ANTIG_VEH,
                   P_ANTIG_VEH,
                   P_COD_DOCUM_ASEG,
                   P_SEXO,
                   P_EDAD,
                   P_MONTO_SINIESTROS,
                   P_CANT_SINIESTROS,
                   P_TIPO_DESCUENTO_DATABSS,
                   P_DESCUENTO_DATABSS,
                   P_COD_DOCUM_MAE,
                   P_CONV,
                   P_MCA_MEL,
                   P_COD_RAMO,
                   P_COB_OPC,
                   P_RC_EXCESO,
                   P_MONTO_RC,
                   L_RECARGO_DATABSS,
                   PRIMA_EXENTA,
                   L_PRIMA_PROPUESTA,
                   P_TIPO_DESC,
                   P_DESCUENTO,
                   P_PRIMA,
                   IVA,
                   P_PRIMA_TOTAL,
                   SYSDATE);
                COMMIT;
              
                IF NOT L_EXISTE_DCTO THEN
                
                  IF P_DESC < 0 THEN
                    P_DESC := 0;
                  END IF;
                
                END IF;
              
              END IF;
            
            END IF;
          
          END IF;
        
      END CASE;
    
      P_DESC       := TRIM(TO_CHAR(0, '990.99'));
      P_PORC_DESC  := ROUND(50, 2);
      P_RECAR      := TRIM(TO_CHAR(0, '990.99'));
      P_PORC_RECAR := ROUND(0, 2);
    
    end if;
  
  EXCEPTION
    WHEN OTHERS THEN
      P_ERROR := SUBSTR(SQLERRM, 0, 99);
      MESSAGE := '<BR><STRONG> ' || SQLERRM || '</STRONG><BR>' ||
                 '<BR><STRONG>COD_RAMO: </STRONG>' || P_COD_RAMO ||
                 '<BR><STRONG>COD_DOCUM: </STRONG>' || P_COD_DOCUM_MAE ||
                 '<BR><STRONG>COD_DOCUM_ASEG : </STRONG>' ||
                 P_COD_DOCUM_ASEG || '<BR><STRONG>COD_MARCA: </STRONG>' ||
                 P_COD_MARCA || ' -- ' ||
                 EA_F_NOM_MARCA_TRN@OVPRO_PRD(1, P_COD_MARCA, '') ||
                 '<BR><STRONG>COD_MODELO :</STRONG>' || P_COD_MODELO ||
                 ' -- ' || EA_F_NOM_MODELO_TRN@OVPRO_PRD(1,
                                                         P_COD_MARCA,
                                                         P_COD_MODELO,
                                                         '') ||
                 '<BR><STRONG>COD_SUB_MODELO : </STRONG>' ||
                 P_COD_SUB_MODELO || ' -- ' ||
                 EA_F_NOM_SUB_MODELO@OVPRO_PRD(1,
                                               P_COD_MARCA,
                                               P_COD_MODELO,
                                               P_COD_SUB_MODELO,
                                               '') ||
                 '<BR><STRONG>ANIO_FAB :</STRONG>' || P_ANTIG_VEH ||
                 '<BR><STRONG>COD_MODALIDAD :</STRONG>' || l_cod_modalidad ||
                 '<BR><STRONG>NUM_MATRICULA: </STRONG>' || P_NUM_MATRICULA ||
                 '<BR><STRONG>CANTIDAD SINIESTROS :</STRONG>' ||
                 P_CANT_SINIESTROS ||
                 '<BR><STRONG>MONTO SINIESTROS :</STRONG>' ||
                 P_MONTO_SINIESTROS || '<BR><STRONG>SEXO :</STRONG>' ||
                 P_SEXO || '<BR><STRONG>EDAD :</STRONG>' || P_EDAD ||
                 '<BR><STRONG>MONTO RC :</STRONG>' || P_MONTO_RC ||
                 '<BR><STRONG>RC EXCESO :</STRONG>' || P_RC_EXCESO ||
                 '<BR>';
      OV.P_ENVIA_MAIL_HTML('OV@MAPFRE.CL',
                           'GERARDO.PEREZ@MAPFRE.CL',
                           'ERROR EN COTIZADOR DE VEHICULOS LIVIANOS - COTIZAR',
                           MESSAGE);
    
  END P_CALCULA_PRIMAS_CON_FECHAS;

  PROCEDURE P_LLAMA_EM_P_999DV0005_FECHAS(P_COD_RAMO             VARCHAR2,
                                          P_COD_MODALIDAD        VARCHAR2,
                                          P_COD_MARCA            VARCHAR2,
                                          P_COD_MODELO           VARCHAR2,
                                          P_ANIO_VEH             VARCHAR2,
                                          P_ANTIG_VEH            VARCHAR2,
                                          P_VAL_SUB_MODELO       VARCHAR2,
                                          P_NUM_MATRICULA        VARCHAR2,
                                          P_TIP_DOCUM            VARCHAR2,
                                          P_COD_DOCUM_ASEG       VARCHAR2,
                                          P_COD_AGT              VARCHAR2,
                                          P_COD_NIVEL3           VARCHAR2,
                                          P_MONTO_RC             VARCHAR2,
                                          P_SEXO                 VARCHAR2,
                                          P_RANGO_EDAD_CONDUCTOR VARCHAR2,
                                          P_EDAD                 VARCHAR2,
                                          P_MONTO_SINIESTROS     VARCHAR2,
                                          P_CANT_SINIESTROS      VARCHAR2,
                                          P_PERDIDA_TOTAL        VARCHAR2,
                                          P_MCA_MEL              VARCHAR2,
                                          P_FECHA_INI_VIGENCIA   VARCHAR2,
                                          P_FECHA_FIN_VIGENCIA   VARCHAR2,
                                          P_PRIMA_PROPUESTA      OUT VARCHAR2,
                                          P_TIPO_DESC            OUT VARCHAR2,
                                          P_DESCUENTO            OUT VARCHAR2) IS
  
    L_SEXO                 VARCHAR2(10);
    L_EDAD                 VARCHAR2(10);
    L_RANGO_EDAD_CONDUCTOR VARCHAR2(10);
  
  BEGIN
  
    IF P_SEXO = 9 THEN
      L_SEXO := '1'; -- SI ES JURIDICO, SE ASUME COMO HOMBRE DE 30 A?OS. MANTIS 48788
      L_EDAD := '30';
      P_BUSCA_RANGO_EDAD(L_EDAD, L_RANGO_EDAD_CONDUCTOR);
    ELSE
      L_SEXO                 := P_SEXO;
      L_EDAD                 := P_EDAD;
      L_RANGO_EDAD_CONDUCTOR := P_RANGO_EDAD_CONDUCTOR;
    END IF;
  
    TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('COD_CIA', 1);
    TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('COD_RAMO', P_COD_RAMO);
    TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('DVCOD_MODALIDAD', P_COD_MODALIDAD);
    TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('DVCOD_MARCA', P_COD_MARCA);
    TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('DVCOD_MODELO', P_COD_MODELO);
    TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('DVANIO_SUB_MODELO', P_ANIO_VEH);
    TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('DVANTIG_VEH', P_ANTIG_VEH);
    TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('DVVAL_SUB_MODELO', P_VAL_SUB_MODELO);
    TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('DVNUM_MATRICULA', P_NUM_MATRICULA);
    TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('TIP_DOCUM', P_TIP_DOCUM);
    TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('COD_DOCUM', P_COD_DOCUM_ASEG);
    TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('VIA_EMISION', P_MCA_MEL);
    TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('DVMCA_MEL', 'S');
    TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('DVIMP_PRIMA_PROPUESTA', 0);
    --TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('MCA_MEL', P_MCA_MEL);
    TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('MCA_MEL', 'S');
    TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('TIP_MVTO_BATCH', '3');
    TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('FEC_EFEC_SPTO', P_FECHA_INI_VIGENCIA);
    TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('FEC_VCTO_SPTO', P_FECHA_FIN_VIGENCIA);
  
    TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('TIP_SPTO', 'XX');
  
    TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('COD_AGT', P_COD_AGT);
    TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('COD_NIVEL3', P_COD_NIVEL3);
  
    TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('DVMONTO_RC', P_MONTO_RC);
    TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('DVMCA_SEXO', L_SEXO);
    TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('DVRANGO_EDAD', L_RANGO_EDAD_CONDUCTOR);
    TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('DVEDAD_COND', L_EDAD);
  
    TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('MONTO_SNTROS', P_MONTO_SINIESTROS);
    TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('CANT_SNTROS', P_CANT_SINIESTROS);
  
    TRN_K_GLOBAL.ASIGNA@OVPRO_PRD('DV_PERD_TOTAL', P_PERDIDA_TOTAL);
  
    TRON2000.EM_P_999DV0005_MCL@OVPRO_PRD;
  
    P_PRIMA_PROPUESTA := TRN_K_GLOBAL.DEVUELVE@OVPRO_PRD('DVIMP_PRIMA_PROPUESTA');
  
    P_TIPO_DESC := TRN_K_GLOBAL.DEVUELVE@OVPRO_PRD('TIPO_DCTO_S');
    P_DESCUENTO := TRN_K_GLOBAL.DEVUELVE@OVPRO_PRD('DCTO_SISGEN');
  
    IF P_DESCUENTO IS NULL THEN
      P_DESCUENTO := 0;
    END IF;
  
  END P_LLAMA_EM_P_999DV0005_FECHAS;

  PROCEDURE P_GRABA_COTIZACION_FECHAS(P_COD_DOCUM      VARCHAR2,
                                      P_COD_DOCUM_ASEG VARCHAR2,
                                      P_NUM_MATRICULA  VARCHAR2,
                                      P_ID             VARCHAR2,
                                      P_STRING         VARCHAR2,
                                      P_COD_RAMO       VARCHAR2,
                                      P_MONTO_RC       VARCHAR2,
                                      P_EDAD_CONDUCTOR VARCHAR2,
                                      P_SEXO_CONDUCTOR VARCHAR2,
                                      P_RC_EXCESO      VARCHAR2,
                                      P_FACT48         VARCHAR2,
                                      P_CONVENIO       VARCHAR2,
                                      P_COB_OPC        VARCHAR2,
                                      P_MCA_MEL        VARCHAR2,
                                      P_FECHA_INI_VIG  VARCHAR2,
                                      P_FECHA_FIN_VIG  VARCHAR2,
                                      
                                     /* p_CAPITAL_ENDOSADO IN VARCHAR2,
                                      P_COD_TIP_ENDOSADO IN VARCHAR2,*/
                                      
                                      P_NUM_COTIZACION IN OUT VARCHAR2,
                                      P_ERROR          OUT VARCHAR2) IS
  
    DATOS_COT       VARCHAR2(3000);
    L_COD_MODALIDAD VARCHAR2(3000);
    PRIMA_NETA      VARCHAR2(3000);
    DESCUENTO       VARCHAR2(3000);
  
    CURSOR C_FEC_ACTU_COTIZACION IS
      SELECT C.FEC_ACTU
        FROM MEL_CAB_COTIZACION@OVPRO_PRD C
       WHERE C.NUM_COTIZACION = P_NUM_COTIZACION;
  
    R_FEC_ACTU_COTIZACION C_FEC_ACTU_COTIZACION%ROWTYPE;
  
    CURSOR C_VALIDA_CUPON IS
      select 1
        from mel_bolsa_descuentos
       where num_cotizacion = P_NUM_COTIZACION;
  
    R_VALIDA_CUPON C_VALIDA_CUPON%ROWTYPE;
    L_EXISTE_CUPON BOOLEAN;
  
  BEGIN
  
    P_ERROR := '0';
  
    L_COD_MODALIDAD := '';
    PRIMA_NETA      := '';
  
    OPEN C_VALIDA_CUPON;
    FETCH C_VALIDA_CUPON
      INTO R_VALIDA_CUPON;
    L_EXISTE_CUPON := C_VALIDA_CUPON%FOUND;
    CLOSE C_VALIDA_CUPON;
  
    IF NOT L_EXISTE_CUPON THEN
    
      UPDATE MEL_VEH_COTIZACION@OVPRO_PRD
         SET NUM_COTIZACION = '99' || SUBSTR(NUM_COTIZACION, 3, 11)
       WHERE NUM_COTIZACION = P_NUM_COTIZACION;
      COMMIT;
    
    END IF;
  
    FOR X IN 1 .. LENGTH(P_STRING) LOOP
    
      IF (SUBSTR(P_STRING, X, 1) != '|') THEN
      
        DATOS_COT := DATOS_COT || SUBSTR(P_STRING, X, 1);
      
      ELSE
      
        FOR Y IN 1 .. LENGTH(DATOS_COT) + 1 LOOP
        
          IF (SUBSTR(DATOS_COT, Y, 1) != '$') THEN
          
            L_COD_MODALIDAD := L_COD_MODALIDAD || SUBSTR(DATOS_COT, Y, 1);
          ELSE
          
            FOR Z IN Y + 1 .. LENGTH(DATOS_COT) + 1 LOOP
            
              IF (SUBSTR(DATOS_COT, Z, 1) != '#') THEN
              
                PRIMA_NETA := PRIMA_NETA || SUBSTR(DATOS_COT, Z, 1);
              ELSE
              
                DESCUENTO := DESCUENTO ||
                             SUBSTR(DATOS_COT, Z + 1, LENGTH(DATOS_COT));
              
                P_GRABA_MODALIDAD(P_COD_DOCUM,
                                  P_COD_DOCUM_ASEG,
                                  P_NUM_MATRICULA,
                                  TO_NUMBER(L_COD_MODALIDAD),
                                  TO_NUMBER(PRIMA_NETA),
                                  DESCUENTO,
                                  P_ID,
                                  P_COD_RAMO,
                                  P_NUM_COTIZACION,
                                  P_ERROR);
              
                UPDATE MEL_VEH_COTIZACION@OVPRO_PRD
                   SET MONTO_RC = P_MONTO_RC
                 WHERE NUM_COTIZACION = P_NUM_COTIZACION
                   AND COD_MODALIDAD = L_COD_MODALIDAD;
              
                UPDATE MEL_VEH_COTIZACION@OVPRO_PRD
                   SET EDAD_CONDUCTOR = P_EDAD_CONDUCTOR
                 WHERE NUM_COTIZACION = P_NUM_COTIZACION;
              
                --CJSS
                UPDATE MEL_VEH_COTIZACION@OVPRO_PRD
                   SET FEC_EFEC_SPTO = TO_DATE(P_FECHA_INI_VIG, 'DDMMYYYY')
                 WHERE NUM_COTIZACION = P_NUM_COTIZACION;
              
                UPDATE MEL_VEH_COTIZACION@OVPRO_PRD
                   SET FEC_VCTO_SPTO = TO_DATE(P_FECHA_FIN_VIG, 'DDMMYYYY')
                 WHERE NUM_COTIZACION = P_NUM_COTIZACION;
                --CJSS
              
               ------
               
               
               --ENDOSADO--
              /*  UPDATE MEL_VEH_COTIZACION@OVPRO_PRD
                   SET CAPITAL_ENDOSADO = P_CAPITAL_ENDOSADO
                 WHERE NUM_COTIZACION = P_NUM_COTIZACION;
              
                UPDATE MEL_VEH_COTIZACION@OVPRO_PRD
                   SET COD_TIP_ENDOSADO = P_COD_TIP_ENDOSADO
                 WHERE NUM_COTIZACION = P_NUM_COTIZACION;*/
               
               
               
               
               
               
               
               -------
               
              
              
                UPDATE MEL_VEH_COTIZACION@OVPRO_PRD
                   SET ANOS_SIN_SINI = P_SEXO_CONDUCTOR
                 WHERE NUM_COTIZACION = P_NUM_COTIZACION;
              
                IF L_COD_MODALIDAD IN (8120, 8123, 8125, 8121) THEN
                
                  IF P_RC_EXCESO = '0' THEN
                  
                    UPDATE MEL_VEH_COTIZACION@OVPRO_PRD
                       SET MONTO_DM = '8202'
                     WHERE NUM_COTIZACION = P_NUM_COTIZACION
                       AND COD_MODALIDAD = L_COD_MODALIDAD;
                  ELSE
                  
                    UPDATE MEL_VEH_COTIZACION@OVPRO_PRD
                       SET MONTO_DM = P_RC_EXCESO
                     WHERE NUM_COTIZACION = P_NUM_COTIZACION
                       AND COD_MODALIDAD = L_COD_MODALIDAD;
                  
                  END IF;
                
                ELSE
                
                  UPDATE MEL_VEH_COTIZACION@OVPRO_PRD
                     SET MONTO_DM = P_RC_EXCESO
                   WHERE NUM_COTIZACION = P_NUM_COTIZACION
                     AND COD_MODALIDAD = L_COD_MODALIDAD;
                  COMMIT;
                
                END IF;
              
                UPDATE MEL_VEH_COTIZACION@OVPRO_PRD
                   SET FACTURA_48 = P_FACT48
                 WHERE NUM_COTIZACION = P_NUM_COTIZACION;
              
                UPDATE MEL_VEH_COTIZACION@OVPRO_PRD
                   SET COD_DOCUM_BEN = P_CONVENIO
                 WHERE NUM_COTIZACION = P_NUM_COTIZACION;
                -- CJSS
                UPDATE MEL_VEH_COTIZACION@OVPRO_PRD
                   SET FEC_EFEC_SPTO = TO_DATE(P_FECHA_INI_VIG, 'ddMMyyyy')
                 WHERE NUM_COTIZACION = P_NUM_COTIZACION;
              
                UPDATE MEL_VEH_COTIZACION@OVPRO_PRD
                   SET FEC_VCTO_SPTO = TO_DATE(P_FECHA_FIN_VIG, 'ddMMyyyy')
                 WHERE NUM_COTIZACION = P_NUM_COTIZACION;
              
                UPDATE MEL_CAB_COTIZACION@OVPRO_PRD
                   SET FEC_VIG_INI = TO_DATE(P_FECHA_INI_VIG, 'ddMMyyyy')
                 WHERE NUM_COTIZACION = P_NUM_COTIZACION;
              
                UPDATE MEL_CAB_COTIZACION@OVPRO_PRD
                   SET FEC_VIG_FIN = TO_DATE(P_FECHA_FIN_VIG, 'ddMMyyyy')
                 WHERE NUM_COTIZACION = P_NUM_COTIZACION;
                --CJSS
                
              ---ENDOSADO
                /*UPDATE MEL_VEH_COTIZACION@OVPRO_PRD
                   SET CAPITAL_ENDOSADO = P_CAPITAL_ENDOSADO
                 WHERE NUM_COTIZACION = P_NUM_COTIZACION;
              
                UPDATE MEL_VEH_COTIZACION@OVPRO_PRD
                   SET COD_TIP_ENDOSADO = P_COD_TIP_ENDOSADO
                 WHERE NUM_COTIZACION = P_NUM_COTIZACION;
                 
                  UPDATE MEL_CAB_COTIZACION@OVPRO_PRD
                   SET CAPITAL_ENDOSADO = P_CAPITAL_ENDOSADO
                 WHERE NUM_COTIZACION = P_NUM_COTIZACION;
              
                UPDATE MEL_CAB_COTIZACION@OVPRO_PRD
                   SET COD_TIP_ENDOSADO = P_COD_TIP_ENDOSADO
                 WHERE NUM_COTIZACION = P_NUM_COTIZACION;*/
                 
                 
                
                -----
                
                
                
                
                
                
              
                UPDATE MEL_CAB_COTIZACION@OVPRO_PRD
                   SET COD_DOCUM_PAG = P_CONVENIO
                 WHERE NUM_COTIZACION = P_NUM_COTIZACION;
              
                UPDATE MEL_VEH_COTIZACION@OVPRO_PRD
                   SET MCA_MEL = P_MCA_MEL
                 WHERE NUM_COTIZACION = P_NUM_COTIZACION;
              
                IF R_FEC_ACTU_COTIZACION.FEC_ACTU IS NOT NULL THEN
                
                  UPDATE MEL_VEH_COTIZACION@OVPRO_PRD
                     SET FEC_ACTU = R_FEC_ACTU_COTIZACION.FEC_ACTU
                   WHERE NUM_COTIZACION = P_NUM_COTIZACION;
                
                END IF;
              
                COMMIT;
              
                EXIT;
              
              END IF;
            
            END LOOP;
          
            EXIT;
          
          END IF;
        END LOOP;
      
        DATOS_COT       := '';
        L_COD_MODALIDAD := '';
        PRIMA_NETA      := '';
        DESCUENTO       := '';
      
      END IF;
    
    END LOOP;
  
    P_GRABA_COB_OPC(P_NUM_COTIZACION, P_COB_OPC);
  
    /*  UPDATE MEL_VEH_COTIZACION@OVPRO_PRD
         SET VALOR_REFERENCIAL = P_VAL_SUB_MODELO
       WHERE NUM_COTIZACION = P_NUM_COTIZACION;
    */
    --|8003$18,21#-2,70|8005$15,17#-2,25
  
    --P_GUARDA_COT(P_COD_DOCUM,P_NUM_MATRICULA,P_COD_MODALIDAD,P_PRIMA_TOTAL,P_DESC,P_ID,P_NUM_COTIZACION,P_ERROR);
    /*
    UPDATE MEL_VEH_COTIZACION
    SET SEL_EMITIR = 'S'
    WHERE NUM_COTIZACION = P_NUM_COTIZACION
    AND COD_MODALIDAD = P_COD_MODALIDAD;*/
  
  END P_GRABA_COTIZACION_FECHAS;

  PROCEDURE P_GRABA_MODALIDAD_EMITE_FECHAS(P_COD_DOCUM      VARCHAR2,
                                           P_COD_DOCUM_ASEG VARCHAR2,
                                           P_NUM_MATRICULA  VARCHAR2,
                                           P_FECHA_INI_VIG  VARCHAR2,
                                           P_FECHA_FIN_VIG  VARCHAR2,
                                           P_COD_MODALIDAD  NUMBER,
                                           P_PRIMA_NETA     NUMBER,
                                           P_DESC           VARCHAR2,
                                           P_ID             NUMBER,
                                           P_COD_RAMO       VARCHAR2,
                                           P_MONTO_RC       VARCHAR2,
                                           P_EDAD_CONDUCTOR VARCHAR2,
                                           P_SEXO_CONDUCTOR VARCHAR2,
                                           P_RC_EXCESO      VARCHAR2,
                                           P_FACT48         VARCHAR2,
                                           P_CONVENIO       VARCHAR2,
                                           P_COB_OPC        VARCHAR2,
                                           P_MCA_MEL        VARCHAR2,
                                           P_NUM_COTIZACION IN OUT VARCHAR2,
                                           P_ERROR          OUT VARCHAR2) IS
  
  BEGIN
  
    P_ERROR := '0';
  
    P_GRABA_MODALIDAD(P_COD_DOCUM,
                      P_COD_DOCUM_ASEG,
                      P_NUM_MATRICULA,
                      TO_NUMBER(P_COD_MODALIDAD),
                      TO_NUMBER(P_PRIMA_NETA),
                      P_DESC,
                      P_ID,
                      P_COD_RAMO,
                      P_NUM_COTIZACION,
                      P_ERROR);
  
    UPDATE MEL_VEH_COTIZACION@OVPRO_PRD
       SET SEL_EMITIR = ''
     WHERE NUM_COTIZACION = P_NUM_COTIZACION;
    COMMIT;
  
    UPDATE MEL_VEH_COTIZACION@OVPRO_PRD
       SET SEL_EMITIR = 'S'
     WHERE NUM_COTIZACION = P_NUM_COTIZACION
       AND COD_MODALIDAD = P_COD_MODALIDAD;
  
    UPDATE MEL_VEH_COTIZACION@OVPRO_PRD
       SET MONTO_RC = P_MONTO_RC
     WHERE NUM_COTIZACION = P_NUM_COTIZACION;
  
    /*CJSS*/
    UPDATE MEL_VEH_COTIZACION@OVPRO_PRD T
       SET FEC_EFEC_SPTO = TO_DATE(P_FECHA_INI_VIG, 'DD/MM/YYYY')
     WHERE NUM_COTIZACION = P_NUM_COTIZACION;
  
    UPDATE MEL_VEH_COTIZACION@OVPRO_PRD T
       SET FEC_VCTO_SPTO = TO_DATE(P_FECHA_FIN_VIG, 'DD/MM/YYYY')
     WHERE NUM_COTIZACION = P_NUM_COTIZACION;
    /* FIN */
  
    UPDATE MEL_CAB_COTIZACION@OVPRO_PRD
       SET COD_PLAN = P_COD_MODALIDAD
     WHERE COD_CIA = 1
       AND NUM_COTIZACION = P_NUM_COTIZACION;
  
    UPDATE MEL_VEH_COTIZACION@OVPRO_PRD
       SET VALOR_REFERENCIAL = '1000'
     WHERE NUM_COTIZACION = P_NUM_COTIZACION;
  
    UPDATE MEL_VEH_COTIZACION@OVPRO_PRD
       SET EDAD_CONDUCTOR = P_EDAD_CONDUCTOR
     WHERE NUM_COTIZACION = P_NUM_COTIZACION;
  
    UPDATE MEL_VEH_COTIZACION@OVPRO_PRD
       SET ANOS_SIN_SINI = P_SEXO_CONDUCTOR
     WHERE NUM_COTIZACION = P_NUM_COTIZACION;
  
    IF P_COD_MODALIDAD IN (8120, 8123, 8125, 8121) THEN
    
      IF P_RC_EXCESO = '0' THEN
      
        UPDATE MEL_VEH_COTIZACION@OVPRO_PRD
           SET MONTO_DM = '8202'
         WHERE NUM_COTIZACION = P_NUM_COTIZACION
           AND COD_MODALIDAD = P_COD_MODALIDAD;
        COMMIT;
      ELSE
      
        UPDATE MEL_VEH_COTIZACION@OVPRO_PRD
           SET MONTO_DM = P_RC_EXCESO
         WHERE NUM_COTIZACION = P_NUM_COTIZACION
           AND COD_MODALIDAD = P_COD_MODALIDAD;
        COMMIT;
      
      END IF;
    
    ELSE
    
      UPDATE MEL_VEH_COTIZACION@OVPRO_PRD
         SET MONTO_DM = P_RC_EXCESO
       WHERE NUM_COTIZACION = P_NUM_COTIZACION
         AND COD_MODALIDAD = P_COD_MODALIDAD;
      COMMIT;
    
    END IF;
  
    UPDATE MEL_VEH_COTIZACION@OVPRO_PRD
       SET FACTURA_48 = P_FACT48
     WHERE NUM_COTIZACION = P_NUM_COTIZACION;
    COMMIT;
  
    UPDATE MEL_VEH_COTIZACION@OVPRO_PRD
       SET COD_DOCUM_BEN = P_CONVENIO
     WHERE NUM_COTIZACION = P_NUM_COTIZACION;
    COMMIT;
  
    UPDATE MEL_CAB_COTIZACION@OVPRO_PRD
       SET COD_DOCUM_PAG = P_CONVENIO
     WHERE NUM_COTIZACION = P_NUM_COTIZACION;
    COMMIT;
  
    UPDATE MEL_VEH_COTIZACION@OVPRO_PRD
       SET MCA_MEL = P_MCA_MEL
     WHERE NUM_COTIZACION = P_NUM_COTIZACION;
    COMMIT;
  
    P_GRABA_COB_OPC(P_NUM_COTIZACION, P_COB_OPC);
  
  END P_GRABA_MODALIDAD_EMITE_FECHAS;

  PROCEDURE P_GRABA_DATOS_SISGEN(P_COD_DOCUM_ASEG    VARCHAR2,
                                 P_COD_DOCUM_TOMADOR VARCHAR2,
                                 P_NUM_MATRICULA     VARCHAR2,
                                 P_NUM_COTIZACION    VARCHAR2,
                                 P_ERROR             OUT VARCHAR2) is
  
    L_CANTIDAD_SINI NUMBER;
    L_MONTO_SINI    NUMBER;
  
  BEGIN
    P_ERROR := '0';
  
    P_SISGEN(P_COD_DOCUM_ASEG,
             P_COD_DOCUM_TOMADOR,
             P_NUM_MATRICULA,
             L_MONTO_SINI,
             L_CANTIDAD_SINI,
             P_ERROR);
  
    IF L_MONTO_SINI IS NULL THEN
      L_MONTO_SINI := 0;
    END IF;
  
    IF L_CANTIDAD_SINI IS NULL THEN
      L_CANTIDAD_SINI := 0;
    END IF;
  
    IF P_ERROR = 0 THEN
      begin
        INSERT INTO MEL_SISGEN_COTIZACION@ovpro_prd
          (NUM_COTIZACION,
           MONTO_SINIESTROS,
           CANT_SINIESTROS,
           NUM_MATRICULA,
           COD_DOCUM_ASEG,
           COD_DOCUM_TOMADOR)
        VALUES
          (P_NUM_COTIZACION,
           L_MONTO_SINI,
           L_CANTIDAD_SINI,
           P_NUM_MATRICULA,
           P_COD_DOCUM_ASEG,
           P_COD_DOCUM_TOMADOR);
        COMMIT;
      
      EXCEPTION
        WHEN OTHERS THEN
          P_ERROR := '0';
      END;
    END IF;
  
  EXCEPTION
    WHEN OTHERS THEN
      P_ERROR := SUBSTR(SQLERRM, 0, 99);
    
  END P_GRABA_DATOS_SISGEN;

  /************************************/

  procedure P_VALIDA_POLIZA(P_NUM_POLIZA VARCHAR2, P_ERROR OUT VARCHAR2) IS
  
    CURSOR C_DATOS IS
      SELECT A.mca_provisional
        FROM A2000030@OVPRO_PRD A
       WHERE COD_CIA = 1
         AND NUM_POLIZA = P_NUM_POLIZA;
  
    r_datos c_datos%rowtype;
  
    l_existe boolean;
  
  BEGIN
    trn_k_global.asigna@OVPRO_PRD('COD_CIA', 1);
    trn_k_global.asigna@OVPRO_PRD('NUM_POLIZA', P_NUM_POLIZA);
    tron2000.em_k_ct_mel2_mcl.p_libera_ct_mel@OVPRO_PRD;
  
    open c_datos;
    fetch c_datos
      into r_datos;
    l_existe := C_DATOS%found;
    close c_datos;
  
    if l_existe then
    
      if r_datos.mca_provisional = 'S' then
        p_error := 'POLIZA RETENIDA, CONTROL TECNICO';
      else
        p_error := '';
      end if;
    
    end if;
  
  END P_VALIDA_POLIZA;
  ----------------------------------------

  PROCEDURE P_UPD_REGISTRO_CABECERA(P_NUM_INSPEC IN VARCHAR2,
                                    P_POLIZA     IN VARCHAR2,
                                    P_ERROR      OUT VARCHAR2) IS
  BEGIN
    P_ERROR := '0';
  
    UPDATE a2000801@OVPRO_PRD
       SET NUM_POLIZA = P_POLIZA
     WHERE NUM_INSPEC = P_NUM_INSPEC;
    COMMIT;
  
  EXCEPTION
    WHEN OTHERS THEN
      P_ERROR := 'ERROR: ' || SQLCODE || ' -ERROR- ' || SQLERRM;
    
  END P_UPD_REGISTRO_CABECERA;

  PROCEDURE P_VALIDA_INSPECCION_MOTOR(P_NUM_MOTOR            VARCHAR2,
                                      P_COD_DOCUM_INSP       VARCHAR2,
                                      P_COD_RAMO             VARCHAR2,
                                      P_CONV                 VARCHAR2,
                                      P_NUM_INSPEC           OUT VARCHAR2,
                                      P_STATUS               OUT VARCHAR2,
                                      P_EXISTE_INSPECTOR_TER OUT VARCHAR2,
                                      P_FECHA_INSPECCION     OUT VARCHAR2,
                                      P_MCA_VENCIDA          OUT VARCHAR2,
                                      P_ERROR                OUT VARCHAR2) IS
    CURSOR C_INSPECCION is
      select num_inspec
        from A2000802@OVPRO_PRD b
       where b.cod_cia = 1
         and b.cod_campo = 'NUM_MOTOR'
         and b.val_campo = P_NUM_MOTOR
         and exists (select 1
                from a2000801@OVPRO_PRD a
               where (a.fec_rea_inspec >= trunc(sysdate - 30))
                 and a.num_inspec = b.num_inspec
                 and a.num_poliza is null
                 and a.tip_status in (2, 6));
  
    l_existe boolean;
    p_existe number;
  
    CURSOR C_FECHA_INSPECCION(l_num_inspec varchar2) is
      select fec_rea_inspec
        from a2000801@OVPRO_PRD a
       where cod_cia = 1
         and num_inspec = l_num_inspec;
  
    R_FECHA_INSPECCION C_FECHA_INSPECCION%ROWTYPE;
  
    CURSOR C_VALIDA_OPCION(l_conv varchar2) IS
      SELECT A.OPC_INSP_EXPRESS
        FROM MEL_VEH_ADMIN A
       WHERE A.COD_CONV = l_conv;
  
    R_VALIDA_OPCION C_VALIDA_OPCION%ROWTYPE;
  
  BEGIN
  
    P_ERROR := '0';
  
    IF P_NUM_MOTOR is not null THEN
    
      open C_INSPECCION;
      fetch C_INSPECCION
        into p_existe;
      l_existe := C_INSPECCION%found;
      close C_INSPECCION;
    
      if l_existe then
      
        Open C_FECHA_INSPECCION(p_existe);
        fetch C_FECHA_INSPECCION
          into R_FECHA_INSPECCION;
        CLOSE C_FECHA_INSPECCION;
      
        P_NUM_INSPEC := p_existe;
      
        P_FECHA_INSPECCION := R_FECHA_INSPECCION.FEC_REA_INSPEC;
      
        IF R_FECHA_INSPECCION.FEC_REA_INSPEC >= trunc(sysdate - 30) THEN
          P_MCA_VENCIDA := 'NO';
        ELSE
          P_MCA_VENCIDA := 'SI';
        
        END IF;
      
      end if;
    
    ELSE
    
      P_STATUS := '0';
      P_ERROR  := '0';
    
    END IF;
  
    P_MCA_VENCIDA := 'NO';
  
    OV.MEL_K_INSPECCION.P_EXISTE_INSPECTOR(P_COD_DOCUM_INSP,
                                           P_COD_RAMO,
                                           P_EXISTE_INSPECTOR_TER);
  
    IF P_EXISTE_INSPECTOR_TER = 'SI' THEN
    
      if P_CONV is null then
        OPEN C_VALIDA_OPCION(P_COD_DOCUM_INSP);
      else
        OPEN C_VALIDA_OPCION(P_CONV);
      end if;
    
      FETCH C_VALIDA_OPCION
        INTO R_VALIDA_OPCION;
      CLOSE C_VALIDA_OPCION;
    
      IF R_VALIDA_OPCION.OPC_INSP_EXPRESS = 'S' THEN
      
        P_EXISTE_INSPECTOR_TER := 'SI';
      
      ELSE
      
        P_EXISTE_INSPECTOR_TER := 'NO';
      
      END IF;
    
    END IF;
  
  END P_VALIDA_INSPECCION_MOTOR;
  
  
  PROCEDURE P_VERIFICA_TARIFA(P_COD_CONVENIO IN VARCHAR2,
                              P_COD_MARCA    IN NUMBER,
                              P_COD_MODELO   IN NUMBER,
                              P_ERROR      OUT VARCHAR2) IS
   
    CURSOR C_TARIFA IS
       select t.* from a2109001_mcl@OVDES_PRD t, conv_cot_vehiculo_cont@OVDES_PRD c
  where c.num_poliza_grupo = t.num_poliza_grupo
  and c.cod_convenio = P_COD_CONVENIO
  and t.cod_marca = P_COD_MARCA
  and t.cod_modelo = P_COD_MODELO
  and rownum = 1;
  --AND ROWCOUNT =1;
  
    R_TARIFA C_TARIFA%rowtype;
  
    l_existe boolean;    
    l_prueba varchar2(100);                       
                              
  BEGIN
    P_ERROR := '0';
    
   open C_TARIFA;
    fetch C_TARIFA
      into R_TARIFA;
    l_existe := C_TARIFA%found;
    close C_TARIFA;
    
    
  l_prueba := R_TARIFA.NUM_CONTRATO;

  if l_existe then
    P_ERROR:='0';
    ELSE 
    P_ERROR:='no tiene tarifa disponible';      
    end if;
  
  
  EXCEPTION
    WHEN OTHERS THEN
      P_ERROR := 'ERROR: ' || SQLCODE || ' -ERROR- ' || SQLERRM;
    
  END P_VERIFICA_TARIFA;
  
  
  
  --- FDR EVALUA PARA VEHICULOS AMUNATEGUI --
  PROCEDURE P_EVALUA_RESTRICCION(
                      P_COD_DOCUM IN VARCHAR2,
                     P_DESCUENTO OUT VARCHAR2,
                     P_COMISION OUT VARCHAR2,
                     P_INSPECCION OUT VARCHAR2,
                     P_ERROR OUT VARCHAR2) IS
                     
  
   
  BEGIN
    P_ERROR :='0';
    P_DESCUENTO := 'NO';
    P_COMISION := 'NO';
    P_INSPECCION := 'NO';
    
    
  SELECT 
  'SI','SI','SI' INTO P_DESCUENTO, P_COMISION, P_INSPECCION
    FROM A1001332@ovpro_prd A 
   WHERE A.COD_CIA = 1
     AND A.TIP_DOCUM = 'RUT'
     AND A.COD_DOCUM = P_COD_DOCUM
     and a.cod_nivel3 = '6003';
  
  EXCEPTION
    WHEN OTHERS THEN
      P_ERROR := 'ERROR: ' || SQLCODE || ' -ERROR- ' || SQLERRM;
    
  END P_EVALUA_RESTRICCION;
  
  
  
  

end mel_k_vehiculo;
/
