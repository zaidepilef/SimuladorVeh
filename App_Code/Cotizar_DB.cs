using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using MapfreMCL.oracle;
using Oracle.DataAccess.Client;

/// <summary>
/// Summary description for Cotizador_DB
/// </summary>
public class Cotiza_DB
{
    #region  Procedimiento para verificar si es de amunategui
    public DataRow EvaluaRestriccion_DB(string cod_docum, OracleConnection conn)
    {
        MCommand objComando = new MCommand();
        try
        {
            objComando.Connection = conn;
            objComando.CommandText = "MEL_K_VEHICULO.P_EVALUA_RESTRICCION";
            objComando.agregarINParametro("P_COD_DOCUM", OracleDbType.Varchar2, cod_docum);
            objComando.agregarOUTParametro("P_DESCUENTO", OracleDbType.Varchar2, 255);
            objComando.agregarOUTParametro("P_COMISION", OracleDbType.Varchar2, 255);
            objComando.agregarOUTParametro("P_INSPECCION", OracleDbType.Varchar2, 255);
            objComando.agregarOUTParametro("P_ERROR", OracleDbType.Varchar2, 255);
            return objComando.ejecutarRegistroSP();
        }
        catch (Exception ex)
        {
            throw new Exception("ERROR Cotizador.Cotizar_Fechas_DB : " + ex.Message);
        }
    }
    #endregion

    #region Cantidad de planes disponibles
    public DataSet CantPlanes_DB(string cod_docum, OracleConnection conexion)
    {
        MCommand objComando = new MCommand();

        try
        {
            objComando.Connection = conexion;

            objComando.CommandText = "MEL_K_VEHICULO.P_TRAE_PLANES";

            objComando.agregarINParametro("p_cod_docum", OracleDbType.Varchar2, cod_docum);
            objComando.agregarOUTParametro("p_planes", OracleDbType.RefCursor, 0);

            return objComando.ejecutarRefCursorSP();

        }
        catch (Exception ex)
        {
            throw new Exception("ERROR Cotizador.CantPlanes_DB : " + ex.Message);
        }
    }
    #endregion

    #region Procedimiento que calcula las primas
    public DataRow Cotizar_DB(string cod_ramo, string COD_DOCUM, string COD_DOCUM_ASEG, int COD_MARCA, int COD_MODELO, int COD_SUB_MODELO, int COD_MODALIDAD, string NUM_MATRICULA, string monto_rc, string edad, string sexo, string cant_siniestros, string monto_siniestros, string rc_exceso, string ANTIG_VEH, string COD_CONV, string COB_OPC, string MCA_MEL, string tipo_descuento_databusiness, string descuento_databusiness, OracleConnection conn)
    {
        MCommand objComando = new MCommand();
        try
        {
            objComando.Connection = conn;
            objComando.CommandText = "MEL_K_VEHICULO.P_CALCULA_PRIMAS";

            objComando.agregarINParametro("p_cod_docum_mae", OracleDbType.Varchar2, COD_DOCUM);
            objComando.agregarINParametro("p_cod_docum_aseg", OracleDbType.Varchar2, COD_DOCUM_ASEG);
            objComando.agregarINParametro("p_cod_marca", OracleDbType.Int32, COD_MARCA);
            objComando.agregarINParametro("p_cod_modelo", OracleDbType.Int32, COD_MODELO);
            objComando.agregarINParametro("p_cod_sub_modelo", OracleDbType.Int32, COD_SUB_MODELO);
            objComando.agregarINParametro("p_antig_veh", OracleDbType.Varchar2, ANTIG_VEH);
            objComando.agregarINParametro("p_cod_modalidad", OracleDbType.Int32, COD_MODALIDAD);
            objComando.agregarINParametro("p_num_matricula", OracleDbType.Varchar2, NUM_MATRICULA);
            objComando.agregarINParametro("p_monto_rc", OracleDbType.Varchar2, monto_rc);
            objComando.agregarINParametro("p_edad", OracleDbType.Varchar2, edad);
            objComando.agregarINParametro("p_sexo", OracleDbType.Varchar2, sexo);
            objComando.agregarINParametro("p_cant_siniestros", OracleDbType.Varchar2, cant_siniestros);
            objComando.agregarINParametro("p_monto_siniestros", OracleDbType.Varchar2, monto_siniestros);
            objComando.agregarINParametro("p_rc_exceso", OracleDbType.Varchar2, rc_exceso);
            objComando.agregarINParametro("p_conv", OracleDbType.Varchar2, COD_CONV);
            objComando.agregarINParametro("p_cob_opc", OracleDbType.Varchar2, COB_OPC);
            objComando.agregarINParametro("p_mca_mel", OracleDbType.Varchar2, MCA_MEL);
            objComando.agregarINParametro("p_tipo_descuento_databss", OracleDbType.Varchar2, tipo_descuento_databusiness);
            objComando.agregarINParametro("p_descuento_databss", OracleDbType.Varchar2, descuento_databusiness);

            objComando.agregarOUTParametro("p_prima", OracleDbType.Varchar2, 255);
            objComando.agregarOUTParametro("p_prima_total", OracleDbType.Varchar2, 255);
            objComando.agregarOUTParametro("p_desc", OracleDbType.Varchar2, 255);
            objComando.agregarOUTParametro("p_porc_desc", OracleDbType.Varchar2, 255);
            objComando.agregarOUTParametro("p_recar", OracleDbType.Varchar2, 255);
            objComando.agregarOUTParametro("p_porc_recar", OracleDbType.Varchar2, 255);
            objComando.agregarINOUTParametro("p_cod_ramo", OracleDbType.Varchar2, 15, cod_ramo);
            objComando.agregarOUTParametro("p_error", OracleDbType.Varchar2, 255);

            return objComando.ejecutarRegistroSP();

        }
        catch (Exception ex)
        {
            throw new Exception("ERROR Cotizador.Cotizar_DB : " + ex.Message);
        }
    }
    #endregion

    #region Procedimiento que calcula las primas con Rango de Fechas
    public DataRow Cotizar_Fechas_DB(string cod_ramo, string COD_DOCUM, string COD_DOCUM_ASEG, int COD_MARCA, int COD_MODELO, int COD_SUB_MODELO, int COD_MODALIDAD, string NUM_MATRICULA, string monto_rc, string edad, string sexo, string cant_siniestros, string monto_siniestros, string rc_exceso, string ANTIG_VEH, string COD_CONV, string COB_OPC, string FEC_INI_VIGENCIA, string FEC_FIN_VIGENCIA, string MCA_MEL, string tipo_descuento_databusiness, string descuento_databusiness, OracleConnection conn)
    {
        MCommand objComando = new MCommand();

        try
        {
            objComando.Connection = conn;

            objComando.CommandText = "MEL_K_VEHICULO.P_CALCULA_PRIMAS_CON_FECHAS";

            objComando.agregarINParametro("p_cod_docum_mae", OracleDbType.Varchar2, COD_DOCUM);
            objComando.agregarINParametro("p_cod_docum_aseg", OracleDbType.Varchar2, COD_DOCUM_ASEG);
            objComando.agregarINParametro("p_cod_marca", OracleDbType.Int32, COD_MARCA);
            objComando.agregarINParametro("p_cod_modelo", OracleDbType.Int32, COD_MODELO);
            objComando.agregarINParametro("p_cod_sub_modelo", OracleDbType.Int32, COD_SUB_MODELO);
            objComando.agregarINParametro("p_antig_veh", OracleDbType.Varchar2, ANTIG_VEH);
            objComando.agregarINParametro("p_cod_modalidad", OracleDbType.Int32, COD_MODALIDAD);
            objComando.agregarINParametro("p_num_matricula", OracleDbType.Varchar2, NUM_MATRICULA);
            objComando.agregarINParametro("p_monto_rc", OracleDbType.Varchar2, monto_rc);
            objComando.agregarINParametro("p_edad", OracleDbType.Varchar2, edad);
            objComando.agregarINParametro("p_sexo", OracleDbType.Varchar2, sexo);
            objComando.agregarINParametro("p_cant_siniestros", OracleDbType.Varchar2, cant_siniestros);
            objComando.agregarINParametro("p_monto_siniestros", OracleDbType.Varchar2, monto_siniestros);
            objComando.agregarINParametro("p_rc_exceso", OracleDbType.Varchar2, rc_exceso);
            objComando.agregarINParametro("p_conv", OracleDbType.Varchar2, COD_CONV);
            objComando.agregarINParametro("p_cob_opc", OracleDbType.Varchar2, COB_OPC);
            objComando.agregarINParametro("p_mca_mel", OracleDbType.Varchar2, MCA_MEL);
            objComando.agregarINParametro("p_tipo_descuento_databss", OracleDbType.Varchar2, tipo_descuento_databusiness);
            objComando.agregarINParametro("p_descuento_databss", OracleDbType.Varchar2, descuento_databusiness);
            objComando.agregarINParametro("p_fecha_ini_vigencia", OracleDbType.Varchar2, FEC_INI_VIGENCIA);
            objComando.agregarINParametro("p_fecha_fin_vigencia", OracleDbType.Varchar2, FEC_FIN_VIGENCIA);

            objComando.agregarOUTParametro("p_prima", OracleDbType.Varchar2, 255);
            objComando.agregarOUTParametro("p_prima_total", OracleDbType.Varchar2, 255);
            objComando.agregarOUTParametro("p_desc", OracleDbType.Varchar2, 255);
            objComando.agregarOUTParametro("p_porc_desc", OracleDbType.Varchar2, 255);
            objComando.agregarOUTParametro("p_recar", OracleDbType.Varchar2, 255);
            objComando.agregarOUTParametro("p_porc_recar", OracleDbType.Varchar2, 255);
            objComando.agregarINOUTParametro("p_cod_ramo", OracleDbType.Varchar2, 15, cod_ramo);
            objComando.agregarOUTParametro("p_error", OracleDbType.Varchar2, 255);

            return objComando.ejecutarRegistroSP();

        }
        catch (Exception ex)
        {
            throw new Exception("ERROR Cotizador.Cotizar_Fechas_DB : " + ex.Message);
        }
    }
    #endregion

    #region Procedimiento que trae nombre modalidad
    public DataRow NomModalidad_DB(int cod_modalidad, OracleConnection conexion)
    {
        MCommand objComando = new MCommand();
        try
        {
            objComando.Connection = conexion;
            objComando.CommandText = "MEL_K_VEHICULO.P_NOM_MODALIDAD";
            objComando.agregarINParametro("p_cod_modalidad", OracleDbType.Int32, cod_modalidad);
            objComando.agregarOUTParametro("p_nom_modalidad", OracleDbType.Varchar2, 255);
            return objComando.ejecutarRegistroSP();
        }
        catch (Exception ex)
        {
            throw new Exception("ERROR Cotizador.NomModalidad_DB : " + ex.Message);
        }
    }
    #endregion

    #region Procedimiento que trae nombre modalidad
    public DataRow PolizaExistente_DB(string num_matricula, OracleConnection conexion)
    {
        MCommand objComando = new MCommand();
        try
        {
            objComando.Connection = conexion;

            objComando.CommandText = "MEL_K_VEHICULO.P_VALIDA_NUM_MATRICULA";

            objComando.agregarINParametro("VAL_NUM_MATRICULA", OracleDbType.Varchar2, num_matricula);
            objComando.agregarOUTParametro("P_ERROR", OracleDbType.Varchar2, 1000);

            return objComando.ejecutarRegistroSP();

        }
        catch (Exception ex)
        {
            throw new Exception("ERROR Cotizador.PolizaExistente_DB : " + ex.Message);
        }
    }
    #endregion

    #region Procedimiento que llama al sisgen para 2 Rut, generalmente el asegurado y el tomador
    public DataRow PrimaTec_DB(string cod_docum_aseg, string cod_docum_tomad, string num_matricula, OracleConnection conexion)
    {
        MCommand objComando = new MCommand();
        try
        {
            objComando.Connection = conexion;

            objComando.CommandText = "MEL_K_VEHICULO.P_LLAMA_SISGEN";
            objComando.agregarINParametro("P_COD_DOCUM_ASEG", OracleDbType.Varchar2, cod_docum_aseg);
            objComando.agregarINParametro("P_COD_DOCUM_TOMAD", OracleDbType.Varchar2, cod_docum_tomad);
            objComando.agregarINParametro("P_NUM_MATRICULA", OracleDbType.Varchar2, num_matricula);
            objComando.agregarOUTParametro("P_PRIMA_TEC_MIN", OracleDbType.Single, 50);

            return objComando.ejecutarRegistroSP();
        }
        catch (Exception ex)
        {
            throw new Exception("ERROR Cotizador.PrimaTec_DB : " + ex.Message);
        }
    }
    #endregion

    #region Llamada al procedimiento que guarda las modalidades seleccionadas
    public DataRow GrabaCotizacion_DB(string COD_DOCUM, string COD_DOCUM_ASEG, string NUM_MATRICULA,
        string string_cot, string NUM_COTIZACION, string COD_RAMO, string monto_rc, string sexo, string edad,
        string rc_exceso, string ID, string fact_48, string convenio, string cob_opc, string MCA_MEL,
        string FEC_INI_VIG, string FEC_FIN_VIG, OracleConnection conn)
    {
        MCommand objComando = new MCommand();



        try
        {
            if (String.IsNullOrEmpty(FEC_INI_VIG) || String.IsNullOrEmpty(FEC_FIN_VIG))
            {
                objComando.Connection = conn;

                objComando.CommandText = "MEL_K_VEHICULO.P_GRABA_COTIZACION";

                objComando.agregarINParametro("P_COD_DOCUM", OracleDbType.Varchar2, COD_DOCUM);
                objComando.agregarINParametro("P_COD_DOCUM_ASEG", OracleDbType.Varchar2, COD_DOCUM_ASEG);
                objComando.agregarINParametro("P_NUM_MATRICULA", OracleDbType.Varchar2, NUM_MATRICULA);
                objComando.agregarINParametro("P_ID", OracleDbType.Varchar2, ID);
                objComando.agregarINParametro("P_STRING", OracleDbType.Varchar2, string_cot);
                objComando.agregarINParametro("P_COD_RAMO", OracleDbType.Varchar2, COD_RAMO);
                objComando.agregarINParametro("P_MONTO_RC", OracleDbType.Varchar2, monto_rc);
                objComando.agregarINParametro("P_EDAD_CONDUCTOR", OracleDbType.Varchar2, edad);
                objComando.agregarINParametro("P_SEXO_CONDUCTOR", OracleDbType.Varchar2, sexo);
                objComando.agregarINParametro("P_RC_EXCESO", OracleDbType.Varchar2, rc_exceso);
                objComando.agregarINParametro("P_FACT48", OracleDbType.Varchar2, fact_48);
                objComando.agregarINParametro("P_CONVENIO", OracleDbType.Varchar2, convenio);
                objComando.agregarINParametro("P_COB_OPC", OracleDbType.Varchar2, cob_opc);
                objComando.agregarINParametro("P_MCA_MEL", OracleDbType.Varchar2, MCA_MEL);
                objComando.agregarINOUTParametro("P_NUM_COTIZACION", OracleDbType.Varchar2, 15, NUM_COTIZACION);
                objComando.agregarOUTParametro("P_ERROR", OracleDbType.Varchar2, 255);

                return objComando.ejecutarRegistroSP();
            }
            else
            {
                objComando.Connection = conn;

                objComando.CommandText = "MEL_K_VEHICULO.P_GRABA_COTIZACION_FECHAS";

                objComando.agregarINParametro("P_COD_DOCUM", OracleDbType.Varchar2, COD_DOCUM);
                objComando.agregarINParametro("P_COD_DOCUM_ASEG", OracleDbType.Varchar2, COD_DOCUM_ASEG);
                objComando.agregarINParametro("P_NUM_MATRICULA", OracleDbType.Varchar2, NUM_MATRICULA);
                objComando.agregarINParametro("P_ID", OracleDbType.Varchar2, ID);
                objComando.agregarINParametro("P_STRING", OracleDbType.Varchar2, string_cot);
                objComando.agregarINParametro("P_COD_RAMO", OracleDbType.Varchar2, COD_RAMO);
                objComando.agregarINParametro("P_MONTO_RC", OracleDbType.Varchar2, monto_rc);
                objComando.agregarINParametro("P_EDAD_CONDUCTOR", OracleDbType.Varchar2, edad);
                objComando.agregarINParametro("P_SEXO_CONDUCTOR", OracleDbType.Varchar2, sexo);
                objComando.agregarINParametro("P_RC_EXCESO", OracleDbType.Varchar2, rc_exceso);
                objComando.agregarINParametro("P_FACT48", OracleDbType.Varchar2, fact_48);
                objComando.agregarINParametro("P_CONVENIO", OracleDbType.Varchar2, convenio);
                objComando.agregarINParametro("P_COB_OPC", OracleDbType.Varchar2, cob_opc);
                objComando.agregarINParametro("P_MCA_MEL", OracleDbType.Varchar2, MCA_MEL);
                objComando.agregarINParametro("P_FECHA_INI_VIG", OracleDbType.Varchar2, FEC_INI_VIG);
                objComando.agregarINParametro("P_FECHA_FIN_VIG", OracleDbType.Varchar2, FEC_FIN_VIG);

                objComando.agregarINOUTParametro("P_NUM_COTIZACION", OracleDbType.Varchar2, 15, NUM_COTIZACION);
                objComando.agregarOUTParametro("P_ERROR", OracleDbType.Varchar2, 255);

                return objComando.ejecutarRegistroSP();
            }
        }
        catch (Exception ex)
        {
            throw new Exception("ERROR Cotizador.GrabaCotizacion_DB : " + ex.Message);
        }
    }

    #endregion

    #region Llamada al procedimiento que guarda las modalidades seleccionadas

    public DataRow GrabaCotizacionEmite_DB(string COD_DOCUM, string COD_DOCUM_ASEG, string NUM_MATRICULA,
          string COD_MODALIDAD, decimal PRIMA_NETA, string DESC, string COD_RAMO, string MONTO_RC,
        string EDAD_CONDUCTOR, string SEXO_CONDUCTOR, string NUM_COTIZACION, string RC_EXCESO, string ID,
        string fact_48, string convenio, string cob_opc, string MCA_MEL, OracleConnection conn)
    {
        MCommand objComando = new MCommand();

        try
        {
            objComando.Connection = conn;

            objComando.CommandText = "MEL_K_VEHICULO.P_GRABA_MODALIDAD_EMITE";

            objComando.agregarINParametro("P_COD_DOCUM", OracleDbType.Varchar2, COD_DOCUM);
            objComando.agregarINParametro("P_COD_DOCUM_ASEG", OracleDbType.Varchar2, COD_DOCUM_ASEG);
            objComando.agregarINParametro("P_NUM_MATRICULA", OracleDbType.Varchar2, NUM_MATRICULA);
            objComando.agregarINParametro("P_COD_MODALIDAD", OracleDbType.Varchar2, COD_MODALIDAD);
            objComando.agregarINParametro("P_PRIMA_NETA", OracleDbType.Decimal, PRIMA_NETA);
            objComando.agregarINParametro("P_DESC", OracleDbType.Varchar2, DESC);
            objComando.agregarINParametro("P_ID", OracleDbType.Varchar2, ID);
            objComando.agregarINParametro("P_COD_RAMO", OracleDbType.Varchar2, COD_RAMO);
            objComando.agregarINParametro("P_MONTO_RC", OracleDbType.Varchar2, MONTO_RC);
            objComando.agregarINParametro("P_EDAD_CONDUCTOR", OracleDbType.Varchar2, EDAD_CONDUCTOR);
            objComando.agregarINParametro("P_SEXO_CONDUCTOR", OracleDbType.Varchar2, SEXO_CONDUCTOR);
            objComando.agregarINParametro("P_RC_EXCESO", OracleDbType.Varchar2, RC_EXCESO);
            objComando.agregarINParametro("P_FACT48", OracleDbType.Varchar2, fact_48);
            objComando.agregarINParametro("P_CONVENIO", OracleDbType.Varchar2, convenio);
            objComando.agregarINParametro("P_COB_OPC", OracleDbType.Varchar2, cob_opc);
            objComando.agregarINParametro("P_MCA_MEL", OracleDbType.Varchar2, MCA_MEL);
            objComando.agregarINOUTParametro("P_NUM_COTIZACION", OracleDbType.Varchar2, 15, NUM_COTIZACION);
            objComando.agregarOUTParametro("P_ERROR", OracleDbType.Varchar2, 255);

            return objComando.ejecutarRegistroSP();

        }
        catch (Exception ex)
        {
            throw new Exception("ERROR Cotizador.GrabaCotizacionEmite_DB : " + ex.Message);
        }
    }

    #endregion

    #region Llamada al procedimiento que guarda las modalidades seleccionadas con rango de Fechas

    public DataRow GrabaCotizacionEmite_Fechas_DB(string COD_DOCUM, string COD_DOCUM_ASEG, string NUM_MATRICULA,
        string COD_MODALIDAD, decimal PRIMA_NETA, string DESC, string COD_RAMO, string MONTO_RC, string FEC_INI_VIG,
        string FEC_FIN_VIG, string EDAD_CONDUCTOR, string SEXO_CONDUCTOR, string NUM_COTIZACION, string RC_EXCESO, string ID,
        string fact_48, string convenio, string cob_opc, string MCA_MEL, OracleConnection conn)
    {
        MCommand objComando = new MCommand();

        try
        {
            objComando.Connection = conn;

            objComando.CommandText = "MEL_K_VEHICULO.P_GRABA_MODALIDAD_EMITE_FECHAS";

            objComando.agregarINParametro("P_COD_DOCUM", OracleDbType.Varchar2, COD_DOCUM);
            objComando.agregarINParametro("P_COD_DOCUM_ASEG", OracleDbType.Varchar2, COD_DOCUM_ASEG);
            objComando.agregarINParametro("P_NUM_MATRICULA", OracleDbType.Varchar2, NUM_MATRICULA);
            objComando.agregarINParametro("P_FECHA_INI_VIG", OracleDbType.Varchar2, FEC_INI_VIG);
            objComando.agregarINParametro("P_FECHA_FIN_VIG", OracleDbType.Varchar2, FEC_FIN_VIG);
            objComando.agregarINParametro("P_COD_MODALIDAD", OracleDbType.Varchar2, COD_MODALIDAD);
            objComando.agregarINParametro("P_PRIMA_NETA", OracleDbType.Decimal, PRIMA_NETA);
            objComando.agregarINParametro("P_DESC", OracleDbType.Varchar2, DESC);
            objComando.agregarINParametro("P_ID", OracleDbType.Varchar2, ID);
            objComando.agregarINParametro("P_COD_RAMO", OracleDbType.Varchar2, COD_RAMO);
            objComando.agregarINParametro("P_MONTO_RC", OracleDbType.Varchar2, MONTO_RC);
            objComando.agregarINParametro("P_EDAD_CONDUCTOR", OracleDbType.Varchar2, EDAD_CONDUCTOR);
            objComando.agregarINParametro("P_SEXO_CONDUCTOR", OracleDbType.Varchar2, SEXO_CONDUCTOR);
            objComando.agregarINParametro("P_RC_EXCESO", OracleDbType.Varchar2, RC_EXCESO);
            objComando.agregarINParametro("P_FACT48", OracleDbType.Varchar2, fact_48);
            objComando.agregarINParametro("P_CONVENIO", OracleDbType.Varchar2, convenio);
            objComando.agregarINParametro("P_COB_OPC", OracleDbType.Varchar2, cob_opc);
            objComando.agregarINParametro("P_MCA_MEL", OracleDbType.Varchar2, MCA_MEL);
            objComando.agregarINOUTParametro("P_NUM_COTIZACION", OracleDbType.Varchar2, 15, NUM_COTIZACION);
            objComando.agregarOUTParametro("P_ERROR", OracleDbType.Varchar2, 255);

            return objComando.ejecutarRegistroSP();

        }
        catch (Exception ex)
        {
            throw new Exception("ERROR Cotizador.GrabaCotizacionEmite_Fechas_DB : " + ex.Message);
        }
    }

    #endregion

    #region Graba Datos del Vehiculos para Cotizar
    public DataRow GrabaVehiculoCot_DB(string NUM_MATRICULA, string COD_DOCUM, string COD_MARCA, string COD_MODELO, string COD_SUB_MODELO, string ANIO_FAB, string ID, OracleConnection conn)
    {
        MCommand objComando = new MCommand();

        try
        {
            objComando.Connection = conn;

            objComando.CommandText = "MEL_K_VEHICULO.P_GRABA_DATOS_VEH";

            objComando.agregarINParametro("P_NUM_MATRICULA", OracleDbType.Varchar2, NUM_MATRICULA);
            objComando.agregarINParametro("P_COD_DOCUM", OracleDbType.Varchar2, COD_DOCUM);
            objComando.agregarINParametro("P_COD_MARCA", OracleDbType.Varchar2, COD_MARCA);
            objComando.agregarINParametro("P_COD_MODELO", OracleDbType.Varchar2, COD_MODELO);
            objComando.agregarINParametro("P_COD_SUB_MODELO", OracleDbType.Varchar2, COD_SUB_MODELO);
            objComando.agregarINParametro("P_ANIO_FAB", OracleDbType.Varchar2, ANIO_FAB);
            objComando.agregarINOUTParametro("P_ID", OracleDbType.Varchar2, 255, ID);
            objComando.agregarOUTParametro("P_ERROR", OracleDbType.Varchar2, 255);

            return objComando.ejecutarRegistroSP();

        }
        catch (Exception ex)
        {
            throw new Exception("ERROR Cotizador.GrabaVehiculoCot_DB : " + ex.Message);
        }
    }
    #endregion

    #region Llamada al procedimiento que guarda las modalidades seleccionadas
    public DataRow ImprimeCotizacion_DB(string num_cotizacion, OracleConnection conn)
    {
        MCommand objComando = new MCommand();

        try
        {
            objComando.Connection = conn;

            objComando.CommandText = "MEL_K_VEHICULO.P_IMPRIME_COTIZACION";

            objComando.agregarINParametro("P_NUM_COTIZACION", OracleDbType.Varchar2, num_cotizacion);
            objComando.agregarOUTParametro("P_NOM_FIC", OracleDbType.Varchar2, 255);
            objComando.agregarOUTParametro("P_ERROR", OracleDbType.Varchar2, 255);

            return objComando.ejecutarRegistroSP();

        }
        catch (Exception ex)
        {
            throw new Exception("ERROR Cotizador.ImprimeCotizacion_DB : " + ex.Message);
        }
    }
    #endregion

    #region Llamada al procedimiento que guarda las modalidades seleccionadas
    public DataRow ImprimeNuevaCotizacion_DB(string num_cuotas_PAT, string num_cotizacion, OracleConnection conn)
    {
        MCommand objComando = new MCommand();
        try
        {
            objComando.Connection = conn;
            //objComando.CommandText = "MEL_K_VEHICULO.P_IMPRIME_COTIZACION2";
            objComando.CommandText = "P_IMPRIME_COTIZACION2";

            objComando.agregarINParametro("P_NUM_COTIZACION", OracleDbType.Varchar2, num_cotizacion);
            objComando.agregarINParametro("P_NUM_CUOTAS_PAT", OracleDbType.Int32, Convert.ToInt32(num_cuotas_PAT));
            objComando.agregarOUTParametro("P_NOM_FIC", OracleDbType.Varchar2, 255);
            objComando.agregarOUTParametro("P_ERROR", OracleDbType.Varchar2, 255);

            return objComando.ejecutarRegistroSP();

        }
        catch (Exception ex)
        {
            throw new Exception("ERROR Cotizador.ImprimeCotizacion_DB : " + ex.Message);
        }
    }

    public DataRow ImprimeNuevaCotizacion_DB_Antiguo(string num_cuotas_PAT, string num_cotizacion, OracleConnection conn)
    {
        MCommand objComando = new MCommand();

        try
        {
            objComando.Connection = conn;

            objComando.CommandText = "MEL_K_VEHICULO.P_IMPRIME_COTIZACION2_ANTIGUO";

            objComando.agregarINParametro("P_NUM_COTIZACION", OracleDbType.Varchar2, num_cotizacion);
            objComando.agregarINParametro("P_NUM_CUOTAS_PAT", OracleDbType.Int32, Convert.ToInt32(num_cuotas_PAT));
            objComando.agregarOUTParametro("P_NOM_FIC", OracleDbType.Varchar2, 255);
            objComando.agregarOUTParametro("P_ERROR", OracleDbType.Varchar2, 255);

            return objComando.ejecutarRegistroSP();

        }
        catch (Exception ex)
        {
            throw new Exception("ERROR Cotizador.ImprimeCotizacion_DB : " + ex.Message);
        }
    }
    #endregion

    public DataRow LlamaSisgen_DB(string cod_docum_aseg, string cod_docum_tomad, string num_matricula, OracleConnection conn)
    {
        MCommand objComando = new MCommand();

        try
        {
            objComando.Connection = conn;

            objComando.CommandText = "MEL_K_VEHICULO.P_LLAMA_SISGEN";

            objComando.agregarINParametro("P_COD_DOCUM_ASEG", OracleDbType.Varchar2, cod_docum_aseg);
            objComando.agregarINParametro("P_COD_DOCUM_TOMAD", OracleDbType.Varchar2, cod_docum_tomad);
            objComando.agregarINParametro("P_NUM_MATRICULA", OracleDbType.Varchar2, num_matricula);
            objComando.agregarOUTParametro("P_CANT_SINIESTROS", OracleDbType.Varchar2, 255);
            objComando.agregarOUTParametro("P_MONT_SINIESTROS", OracleDbType.Varchar2, 255);

            return objComando.ejecutarRegistroSP();

        }
        catch (Exception ex)
        {
            throw new Exception("ERROR Cotizador_DB.LlamaSisgen_DB : " + ex.Message);
        }
    }

    #region Procedimiento que valida si un vehiculo tiene una inspeccion
    public DataRow ValidaInspeccion_DB(string num_matricula, string cod_docum, string cod_ramo, string convenio, OracleConnection conexion)
    {
        MCommand objComando = new MCommand();

        try
        {
            objComando.Connection = conexion;

            objComando.CommandText = "MEL_K_VEHICULO.P_VALIDA_INSPECCION";

            objComando.agregarINParametro("P_NUM_MATRICULA", OracleDbType.Varchar2, num_matricula);
            objComando.agregarINParametro("P_COD_DOCUM_INSP", OracleDbType.Varchar2, cod_docum);
            objComando.agregarINParametro("P_COD_RAMO", OracleDbType.Varchar2, cod_ramo);
            objComando.agregarINParametro("P_CONV", OracleDbType.Varchar2, convenio);
            objComando.agregarOUTParametro("P_NUM_INSPEC", OracleDbType.Varchar2, 255);
            objComando.agregarOUTParametro("P_STATUS", OracleDbType.Varchar2, 255);
            objComando.agregarOUTParametro("P_EXISTE_INSPECTOR_TER", OracleDbType.Varchar2, 255);
            objComando.agregarOUTParametro("P_FECHA_INSPECCION", OracleDbType.Varchar2, 255);
            objComando.agregarOUTParametro("P_MCA_VENCIDA", OracleDbType.Varchar2, 255);
            objComando.agregarOUTParametro("P_ERROR", OracleDbType.Varchar2, 255);
            return objComando.ejecutarRegistroSP();

        }
        catch (Exception ex)
        {
            throw new Exception("ERROR Cotizador.NomModalidad_DB : " + ex.Message);
        }
    }
    #endregion

    #region Procedimiento que trae nombre modalidad
    public DataRow AsignaInspeccion_DB(string num_cotizacion, string num_inspeccion, OracleConnection conexion)
    {
        MCommand objComando = new MCommand();

        try
        {
            objComando.Connection = conexion;

            objComando.CommandText = "MEL_K_VEHICULO.P_ASIGNA_INSPECCION";

            objComando.agregarINParametro("P_NUM_COTIZACION", OracleDbType.Varchar2, num_cotizacion);
            objComando.agregarINParametro("P_NUM_INSPECCION", OracleDbType.Varchar2, num_inspeccion);
            objComando.agregarOUTParametro("P_ERROR", OracleDbType.Varchar2, 255);
            return objComando.ejecutarRegistroSP();

        }
        catch (Exception ex)
        {
            throw new Exception("ERROR Cotizador.NomModalidad_DB : " + ex.Message);
        }
    }
    #endregion

    #region Cantidad de planes disponibles
    public DataSet OpcionesCotizador_DB(string cod_conv, OracleConnection conexion)
    {
        MCommand objComando = new MCommand();

        try
        {
            objComando.Connection = conexion;

            objComando.CommandText = "MEL_K_VEHICULO.P_TRAE_OPCIONES";

            objComando.agregarINParametro("p_cod_conv", OracleDbType.Varchar2, cod_conv);
            objComando.agregarOUTParametro("p_opciones", OracleDbType.RefCursor, 0);

            return objComando.ejecutarRefCursorSP();

        }
        catch (Exception ex)
        {
            throw new Exception("ERROR Cotizador.OpcionesCotizador_DB : " + ex.Message);
        }
    }
    #endregion

    #region Valida Suplantacion del Cotizador
    public DataRow ValidaSuplantacion_DB(string cod_docum, OracleConnection conexion)
    {
        MCommand objComando = new MCommand();

        try
        {
            objComando.Connection = conexion;

            objComando.CommandText = "MEL_K_VEHICULO.P_VALIDA_SUPLANTA";

            objComando.agregarINParametro("P_COD_DOCUM", OracleDbType.Varchar2, cod_docum);
            objComando.agregarOUTParametro("P_RESPUESTA", OracleDbType.Varchar2, 255);
            return objComando.ejecutarRegistroSP();

        }
        catch (Exception ex)
        {
            throw new Exception("ERROR Cotizador.ValidaSuplantacion_DB : " + ex.Message);
        }
    }
    #endregion

    #region Carca Convenio y Cod Docum para una cotizacion ya hecha
    public DataRow CargaDatosConvenioCot_DB(string num_cotizacion, OracleConnection conexion)
    {
        MCommand objComando = new MCommand();

        try
        {
            objComando.Connection = conexion;

            objComando.CommandText = "MEL_K_VEHICULO.P_TRAE_COD_DOCUM_CONVENIO";

            objComando.agregarINParametro("P_NUM_COTIZACION", OracleDbType.Varchar2, num_cotizacion);
            objComando.agregarOUTParametro("P_COD_DOCUM_MAE", OracleDbType.Varchar2, 255);
            objComando.agregarOUTParametro("P_COD_CONV", OracleDbType.Varchar2, 255);
            return objComando.ejecutarRegistroSP();

        }
        catch (Exception ex)
        {
            throw new Exception("ERROR Cotizador.CargaDatosConvenio_DB : " + ex.Message);
        }
    }
    #endregion

    #region Trae Datos de una Cotizacion
    public DataSet CargaDatosCotizacion_DB(string num_cotizacion, OracleConnection conexion)
    {
        MCommand objComando = new MCommand();

        try
        {
            objComando.Connection = conexion;

            objComando.CommandText = "MEL_K_VEHICULO.P_CARGA_DATOS_COTIZACION";

            objComando.agregarINParametro("p_num_cotizacion", OracleDbType.Varchar2, num_cotizacion);
            objComando.agregarOUTParametro("p_datos", OracleDbType.RefCursor, 0);

            return objComando.ejecutarRefCursorSP();

        }
        catch (Exception ex)
        {
            throw new Exception("ERROR Cotizador.CargaDatosCotizacion_DB : " + ex.Message);
        }
    }
    #endregion

    #region Valida si el riego tiene una poliza vigente, en ese caso, se muestra la prima vigente
    public DataRow ValidaRiesgoPolVigente_DB(string cod_docum_aseg, string cod_marca, string cod_modelo, string cod_sub_modelo, string cod_conv, string rc_exceso, OracleConnection conexion)
    {
        MCommand objComando = new MCommand();

        try
        {
            objComando.Connection = conexion;

            objComando.CommandText = "MEL_K_VEHICULO.P_VALIDA_VEH_PLAN_VIGENTE";

            objComando.agregarINParametro("P_COD_DOCUM_ASEG", OracleDbType.Varchar2, cod_docum_aseg);
            objComando.agregarINParametro("P_COD_MARCA", OracleDbType.Varchar2, cod_marca);
            objComando.agregarINParametro("P_COD_MODELO", OracleDbType.Varchar2, cod_modelo);
            objComando.agregarINParametro("P_COD_SUB_MODELO", OracleDbType.Varchar2, cod_sub_modelo);
            objComando.agregarINParametro("P_COD_CONV", OracleDbType.Varchar2, cod_conv);
            objComando.agregarINParametro("P_RC_EXCESO", OracleDbType.Varchar2, rc_exceso);
            objComando.agregarOUTParametro("P_MCA_VIGENTE", OracleDbType.Varchar2, 255);
            objComando.agregarOUTParametro("P_COD_MODALIDAD_VIGENTE", OracleDbType.Varchar2, 255);
            objComando.agregarOUTParametro("P_COD_RAMO", OracleDbType.Varchar2, 255);
            objComando.agregarOUTParametro("P_IMP_PRIMA_NETA", OracleDbType.Varchar2, 255);
            objComando.agregarOUTParametro("P_IMP_PRIMA_TOTAL", OracleDbType.Varchar2, 255);
            return objComando.ejecutarRegistroSP();

        }
        catch (Exception ex)
        {
            throw new Exception("ERROR Cotizador.ValidaRiesgoPolVigente_DB : " + ex.Message);
        }
    }
    #endregion

    #region Opciones de Telemarketing
    public DataRow OpcionesTMarketing_DB(string cod_conv, string cod_docum, string cod_producto, OracleConnection conexion)
    {
        MCommand objComando = new MCommand();

        try
        {
            objComando.Connection = conexion;

            objComando.CommandText = "MEL_K_TMARKETING.P_VALIDA_MOSTRAR";

            objComando.agregarINParametro("P_COD_CONVENIO", OracleDbType.Varchar2, cod_conv);
            objComando.agregarINParametro("P_COD_DOCUM", OracleDbType.Varchar2, cod_docum);
            objComando.agregarINParametro("P_COD_PRODUCTO", OracleDbType.Varchar2, cod_producto);
            objComando.agregarOUTParametro("P_RESPUESTA", OracleDbType.Varchar2, 255);

            return objComando.ejecutarRegistroSP();

        }
        catch (Exception ex)
        {
            throw new Exception("ERROR Cotizador.OpcionesTMarketing_DB : " + ex.Message);
        }
    }

    #region Opciones de Telemarketing
    public DataRow OpcionesTMarketingPopUp_DB(string cod_conv, string cod_docum, string cod_producto, OracleConnection conexion)
    {
        MCommand objComando = new MCommand();

        try
        {
            objComando.Connection = conexion;

            objComando.CommandText = "MEL_K_TMARKETING.P_VALIDA_MOSTRAR_POPUP";

            objComando.agregarINParametro("P_COD_CONVENIO", OracleDbType.Varchar2, cod_conv);
            objComando.agregarINParametro("P_COD_DOCUM", OracleDbType.Varchar2, cod_docum);
            objComando.agregarINParametro("P_COD_PRODUCTO", OracleDbType.Varchar2, cod_producto);
            objComando.agregarOUTParametro("P_RESPUESTA", OracleDbType.Varchar2, 255);

            return objComando.ejecutarRegistroSP();

        }
        catch (Exception ex)
        {
            throw new Exception("ERROR Cotizador.OpcionesTMarketingPopUp_DB : " + ex.Message);
        }
    }
    #endregion

    public DataRow GrabaTMarketing_DB(string cod_docum_aseg, string nom_asegurado, string ape_paterno, string ape_materno, string email, string num_telefono, string num_telefono2, string cod_producto, string cod_docum, string cod_convenio, string num_cotizacion, string id_tmarketing, OracleConnection conexion)
    {
        MCommand objComando = new MCommand();

        try
        {
            objComando.Connection = conexion;

            objComando.CommandText = "MEL_K_TMARKETING.P_INGRESA_DATOS_TERCERO";

            objComando.agregarINParametro("P_COD_DOCUM_ASEG", OracleDbType.Varchar2, cod_docum_aseg);
            objComando.agregarINParametro("P_NOM_ASEGURADO", OracleDbType.Varchar2, nom_asegurado);
            objComando.agregarINParametro("P_APE_PATERNO", OracleDbType.Varchar2, ape_paterno);
            objComando.agregarINParametro("P_APE_MATERNO", OracleDbType.Varchar2, ape_materno);
            objComando.agregarINParametro("P_EMAIL", OracleDbType.Varchar2, email);
            objComando.agregarINParametro("P_NUM_TELEFONO", OracleDbType.Varchar2, num_telefono);
            objComando.agregarINParametro("P_NUM_TELEFONO2", OracleDbType.Varchar2, num_telefono2);
            objComando.agregarINParametro("P_COD_PRODUCTO", OracleDbType.Varchar2, cod_producto);
            objComando.agregarINParametro("P_COD_DOCUM", OracleDbType.Varchar2, cod_docum);
            objComando.agregarINParametro("P_COD_CONVENIO", OracleDbType.Varchar2, cod_convenio);
            objComando.agregarINParametro("P_NUM_COTIZACION", OracleDbType.Varchar2, num_cotizacion);
            objComando.agregarINOUTParametro("P_ID_TMARKETING", OracleDbType.Varchar2, 15, id_tmarketing);

            return objComando.ejecutarRegistroSP();

        }
        catch (Exception ex)
        {
            throw new Exception("ERROR Cotizador.GrabaTMarketing_DB : " + ex.Message);
        }
    }

    #endregion

    #region Cuadro de Comisiones disponibles
    public DataSet CuadroComisiones_DB(string cod_docum, string cod_conv, OracleConnection conexion)
    {
        MCommand objComando = new MCommand();

        try
        {
            objComando.Connection = conexion;

            objComando.CommandText = "MEL_K_VEHICULO.P_GET_LISTA_CUADRO_COM";

            objComando.agregarINParametro("p_cod_docum", OracleDbType.Varchar2, cod_docum);
            objComando.agregarINParametro("p_conv", OracleDbType.Varchar2, cod_conv);
            objComando.agregarOUTParametro("p_mca_cuadro", OracleDbType.Varchar2, 255);
            objComando.agregarOUTParametro("p_lista_cuadro_com", OracleDbType.RefCursor, 0);

            return objComando.ejecutarRefCursorSP();

        }
        catch (Exception ex)
        {
            throw new Exception("ERROR Cotizador.CuadroComisiones_DB : " + ex.Message);
        }
    }
    #endregion

    public DataRow CalcularComision_DB(int cod_modalidad, string cod_docum, string cod_conv, string cod_cuadro_com, decimal prima_neta, string desc, string cod_ramo, OracleConnection conn)
    {
        MCommand objComando = new MCommand();


        try
        {
            objComando.Connection = conn;

            objComando.CommandText = "MEL_K_VEHICULO.P_GET_PRIMA_CUADRO_COM";

            objComando.agregarINParametro("P_PRIMA_NETA", OracleDbType.Decimal, prima_neta);
            objComando.agregarINParametro("p_desc_neta", OracleDbType.Varchar2, desc.Replace(",","."));
            objComando.agregarINParametro("P_CUADRO_COM", OracleDbType.Varchar2, cod_cuadro_com);
            objComando.agregarINParametro("P_COD_MODALIDAD", OracleDbType.Int32, cod_modalidad);
            objComando.agregarINParametro("P_COD_DOCUM", OracleDbType.Varchar2, cod_docum);
            objComando.agregarINParametro("P_CONV", OracleDbType.Varchar2, cod_conv);
            objComando.agregarINParametro("P_COD_RAMO", OracleDbType.Varchar2, cod_ramo);

            objComando.agregarOUTParametro("P_PRIMA", OracleDbType.Varchar2, 255);
            objComando.agregarOUTParametro("P_PRIMA_TOTAL", OracleDbType.Varchar2, 255);
            objComando.agregarOUTParametro("P_DESC", OracleDbType.Varchar2, 255);
            objComando.agregarOUTParametro("P_PORC_DESC", OracleDbType.Varchar2, 255);
            objComando.agregarOUTParametro("P_RECAR", OracleDbType.Varchar2, 255);
            objComando.agregarOUTParametro("P_PORC_RECAR", OracleDbType.Varchar2, 255);

            return objComando.ejecutarRegistroSP();

        }
        catch (Exception ex)
        {
            throw new Exception("ERROR Cotizador.CalcularComision_DB : " + ex.Message);
        }
    }

    public DataRow GrabaComision_DB(string num_cotizacion, string cod_cuadro_com, OracleConnection conn)
    {
        MCommand objComando = new MCommand();

        try
        {
            objComando.Connection = conn;

            objComando.CommandText = "MEL_K_VEHICULO.P_GRABA_COMISION";

            objComando.agregarINParametro("P_NUM_COTIZACION", OracleDbType.Varchar2, num_cotizacion);
            objComando.agregarINParametro("P_COD_CUADRO_COM", OracleDbType.Varchar2, cod_cuadro_com);

            objComando.agregarOUTParametro("P_ERROR", OracleDbType.Varchar2, 255);

            return objComando.ejecutarRegistroSP();

        }
        catch (Exception ex)
        {
            throw new Exception("ERROR Cotizador.GrabaComision_DB : " + ex.Message);
        }
    }

    #region Valida Suplantacion del Cotizador
    public DataRow ValidaMcaMel_DB(string cod_docum, string cod_conv, OracleConnection conexion)
    {
        MCommand objComando = new MCommand();

        try
        {
            objComando.Connection = conexion;

            objComando.CommandText = "MEL_K_VEHICULO.p_valida_mca_mel";

            objComando.agregarINParametro("p_cod_docum", OracleDbType.Varchar2, cod_docum);
            objComando.agregarINParametro("p_cod_conv", OracleDbType.Varchar2, cod_conv);
            objComando.agregarOUTParametro("p_valida_mca_mel", OracleDbType.Varchar2, 255);
            objComando.agregarOUTParametro("p_mca_mel", OracleDbType.Varchar2, 255);
            return objComando.ejecutarRegistroSP();

        }
        catch (Exception ex)
        {
            throw new Exception("ERROR Cotizador.ValidaMcaMel_DB : " + ex.Message);
        }
    }
    #endregion

    #region Procedimiento que trae prima exenta
    public DataRow PrimaExenta_DB(string cod_ramo, string cod_modalidad, OracleConnection conexion)
    {
        MCommand objComando = new MCommand();

        try
        {
            objComando.Connection = conexion;

            objComando.CommandText = "MEL_K_VEHICULO.P_MONTO_COB_EXENTA";
            objComando.agregarINParametro("P_COD_RAMO", OracleDbType.Varchar2, cod_ramo);
            objComando.agregarINParametro("P_COD_MODALIDAD", OracleDbType.Varchar2, cod_modalidad);
            objComando.agregarOUTParametro("P_MONTO_EXENTA", OracleDbType.Single, 50);

            return objComando.ejecutarRegistroSP();

        }
        catch (Exception ex)
        {
            throw new Exception("ERROR Cotizador.PrimaTec_DB : " + ex.Message);
        }
    }
    #endregion

    public DataRow GrabaOpcionInspeccion_DB(string num_cotizacion, string opcion, OracleConnection conn)
    {
        MCommand objComando = new MCommand();

        try
        {
            objComando.Connection = conn;

            objComando.CommandText = "p_graba_opcion_inspeccion";

            objComando.agregarINParametro("P_NUM_COTIZACION", OracleDbType.Varchar2, num_cotizacion);
            objComando.agregarINParametro("p_opcion", OracleDbType.Varchar2, opcion);


            return objComando.ejecutarRegistroSP();

        }
        catch (Exception ex)
        {
            throw new Exception("ERROR Cotizador.GrabaComision_DB : " + ex.Message);
        }
    }

    public DataRow PerdidaTotal_DB(string num_matricula, OracleConnection conn)
    {
        MCommand objComando = new MCommand();

        try
        {
            objComando.Connection = conn;

            objComando.CommandText = "mel_k_vehiculo.p_busca_perdida_total";

            objComando.agregarINParametro("p_num_matricula", OracleDbType.Varchar2, num_matricula);
            objComando.agregarOUTParametro("p_perdida_total", OracleDbType.Varchar2, 255);


            return objComando.ejecutarRegistroSP();

        }
        catch (Exception ex)
        {
            throw new Exception("ERROR Cotizador.PerdidaTotal_DB : " + ex.Message);
        }
    }

    public DataRow UpdateRamoSubModelo_DB(string num_cotizacion, string cod_marca, string cod_modelo, string cod_sub_modelo, OracleConnection conn)
    {
        MCommand objComando = new MCommand();

        try
        {
            objComando.Connection = conn;

            objComando.CommandText = "p_update_ramo_vehiculo";

            objComando.agregarINParametro("p_num_cotizacion", OracleDbType.Varchar2, num_cotizacion);
            objComando.agregarINParametro("p_cod_marca", OracleDbType.Varchar2, cod_marca);
            objComando.agregarINParametro("p_cod_modelo", OracleDbType.Varchar2, cod_modelo);
            objComando.agregarINParametro("p_cod_sub_modelo", OracleDbType.Varchar2, cod_sub_modelo);
            objComando.agregarOUTParametro("p_cod_ramo", OracleDbType.Varchar2, 255);

            return objComando.ejecutarRegistroSP();

        }
        catch (Exception ex)
        {
            throw new Exception("ERROR Cotizador.UpdateRamoSubModelo_DB : " + ex.Message);
        }
    }

    public DataRow LlamaDataBussines_DB(string cod_cia, string cod_ramo, string cod_conv, string cod_docum_aseg, OracleConnection conn)
    {
        MCommand objComando = new MCommand();

        try
        {
            objComando.Connection = conn;

            objComando.CommandText = "P_TRAE_DESCUENTO_DATABUSINESS";

            objComando.agregarINParametro("p_cod_cia", OracleDbType.Varchar2, cod_cia);
            objComando.agregarINParametro("p_cod_ramo", OracleDbType.Varchar2, cod_ramo);
            objComando.agregarINParametro("p_cod_conv", OracleDbType.Varchar2, cod_conv);
            objComando.agregarINParametro("p_cod_docum_aseg", OracleDbType.Varchar2, cod_docum_aseg);
            objComando.agregarOUTParametro("p_tipo_desc", OracleDbType.Varchar2, 255);
            objComando.agregarOUTParametro("p_desc", OracleDbType.Varchar2, 255);
            objComando.agregarOUTParametro("p_error", OracleDbType.Varchar2, 255);

            return objComando.ejecutarRegistroSP();

        }
        catch (Exception ex)
        {
            throw new Exception("ERROR Cotizador_DB.LlamaDataBussines_DB : " + ex.Message);
        }
    }

    #region Cantidad de planes disponibles
    public DataSet TodosLosPlanes_DB(string cod_conv, OracleConnection conexion)
    {
        MCommand objComando = new MCommand();

        try
        {
            objComando.Connection = conexion;

            objComando.CommandText = "P_MODALIDADES_VEH";

            objComando.agregarOUTParametro("p_planes", OracleDbType.RefCursor, 0);

            return objComando.ejecutarRefCursorSP();

        }
        catch (Exception ex)
        {
            throw new Exception("ERROR Cotizador.TotalPlanes_DB : " + ex.Message);
        }
    }
    #endregion

    #region Llamada al procedimiento que guarda la cant. y montos de siniestros en una cotización.
    public DataRow updCotizacionSiniestros_DB(string num_cotizacion, string cant_siniestros, string monto_siniestros, OracleConnection conn)
    {
        MCommand objComando = new MCommand();

        try
        {
            objComando.Connection = conn;

            objComando.CommandText = "MEL_K_VEHICULO.P_UPD_SISGEN_COTIZACION";

            objComando.agregarINParametro("P_NUM_COTIZACION", OracleDbType.Varchar2, num_cotizacion);
            objComando.agregarINParametro("P_CANT_SINIESTROS", OracleDbType.Int32, Convert.ToInt32(cant_siniestros));
            objComando.agregarINParametro("P_MONTO_SINIESTROS", OracleDbType.Varchar2, monto_siniestros);
            objComando.agregarOUTParametro("P_ERROR", OracleDbType.Varchar2, 255);

            return objComando.ejecutarRegistroSP();

        }
        catch (Exception ex)
        {
            throw new Exception("ERROR Cotizador.GrabaCotizacion_DB : " + ex.Message);
        }
    }
    #endregion

    public DataRow CalcularSinComision_DB(int cod_modalidad, string cod_docum, string cod_conv, string cod_cuadro_com, string prima_neta, string desc, string cod_ramo, OracleConnection conn)
    {
        MCommand objComando = new MCommand();

        try
        {
            objComando.Connection = conn;

            objComando.CommandText = "MEL_K_VEHICULO.P_GET_PRIMA_SIN_CUADRO_COM";

            objComando.agregarINParametro("P_PRIMA_NETA", OracleDbType.Decimal, prima_neta);
            objComando.agregarINParametro("p_desc_neta", OracleDbType.Varchar2, desc);
            objComando.agregarINParametro("P_CUADRO_COM", OracleDbType.Varchar2, cod_cuadro_com);
            objComando.agregarINParametro("P_COD_MODALIDAD", OracleDbType.Int32, cod_modalidad);
            objComando.agregarINParametro("P_COD_DOCUM", OracleDbType.Varchar2, cod_docum);
            objComando.agregarINParametro("P_CONV", OracleDbType.Varchar2, cod_conv);
            objComando.agregarINParametro("P_COD_RAMO", OracleDbType.Varchar2, cod_ramo);

            objComando.agregarOUTParametro("P_PRIMA_NETA_SIN_CUADRO", OracleDbType.Varchar2, 255);


            return objComando.ejecutarRegistroSP();

        }
        catch (Exception ex)
        {
            throw new Exception("ERROR Cotizador.CalcularComision_DB : " + ex.Message);
        }
    }

    public DataRow ValidaCambioComision_DB(string num_cotizacion, string cod_cuadro_com_nuevo, OracleConnection conn)
    {
        MCommand objComando = new MCommand();

        try
        {
            objComando.Connection = conn;

            objComando.CommandText = "mel_k_bolsa_descuento.p_valida_interacciones";

            objComando.agregarINParametro("p_num_cotizacion", OracleDbType.Varchar2, num_cotizacion);
            objComando.agregarINParametro("p_cod_cuadro_com_nuevo", OracleDbType.Varchar2, cod_cuadro_com_nuevo);

            objComando.agregarOUTParametro("p_respuesta", OracleDbType.Varchar2, 255);

            return objComando.ejecutarRegistroSP();

        }
        catch (Exception ex)
        {
            throw new Exception("ERROR Cotizador.ValidaCambioComision_DB : " + ex.Message);
        }
    }

    public DataRow RegistraPregCotizacion_DB(int cod_cia,int cod_ramo,string desc_pregunta,string respuesta,string num_cotizacion,string num_poliza, OracleConnection conn)
    {
        MCommand objComando = new MCommand();

        try
        {
            objComando.Connection = conn;

            objComando.CommandText = "mel_p_guarda_preguntas";

            objComando.agregarINParametro("P_COD_CIA", OracleDbType.Int32, cod_cia);
            objComando.agregarINParametro("P_COD_RAMO", OracleDbType.Int32, cod_ramo);
            objComando.agregarINParametro("P_DESC_PREGUNTA", OracleDbType.Varchar2, desc_pregunta);
            objComando.agregarINParametro("P_RESPUESTA", OracleDbType.Varchar2, respuesta);
            objComando.agregarINParametro("P_NUM_COTIZACION", OracleDbType.Varchar2, num_cotizacion);
            objComando.agregarINParametro("P_NUM_POLIZA", OracleDbType.Varchar2, num_poliza);

            objComando.agregarOUTParametro("P_ERROR", OracleDbType.Varchar2, 255);

            return objComando.ejecutarRegistroSP();

        }
        catch (Exception ex)
        {
            throw new Exception("ERROR Cotizador.RegistraPregCotizacion_DB : " + ex.Message);
        }
    }

    public DataRow actualizaPregVeh_DB(string num_cotizacion,string hijos,string franquicia,string danospre,OracleConnection conn)
    {
        MCommand objComando = new MCommand();
        try
        {
            objComando.Connection = conn;

            objComando.CommandText = "mel_k_vehiculo.P_GRABA_RESPUESTAS";

            objComando.agregarINParametro("P_NUM_COTIZACION", OracleDbType.Varchar2, num_cotizacion);
            objComando.agregarINParametro("P_HIJOS", OracleDbType.Varchar2, hijos);
            objComando.agregarINParametro("P_FRANQUICIA", OracleDbType.Varchar2, franquicia);
            objComando.agregarINParametro("P_DANOS", OracleDbType.Varchar2, danospre);

            objComando.agregarOUTParametro("P_ERROR", OracleDbType.Varchar2, 255);

            return objComando.ejecutarRegistroSP();

        }
        catch (Exception ex)
        {
            throw new Exception("ERROR Cotizador.actualizaPregVeh_DB : " + ex.Message);
        }
    }

    public DataRow validaControlTecnico_DB(string num_poliza, OracleConnection conn)
    {
        MCommand objComando = new MCommand();
        try
        {
            objComando.Connection = conn;
            objComando.CommandText = "MEL_P_VALIDA_POLIZA";
            objComando.agregarINParametro("p_num_poliza", OracleDbType.Varchar2, num_poliza);
            objComando.agregarOUTParametro("p_error", OracleDbType.Varchar2, 255);
            return objComando.ejecutarRegistroSP();
        }
        catch (Exception ex)
        {
            throw new Exception("ERROR Cotizador.validaControlTecnico_DB : " + ex.Message);
        }
    }

    #region Procedimiento que valida si un vehiculo tiene una inspeccion con el numero de motor
    public DataRow ValidaInspeccionMotor_DB(string num_motor, string cod_docum, string cod_ramo, string convenio, OracleConnection conexion)
    {
        MCommand objComando = new MCommand();

        try
        {
            objComando.Connection = conexion;

            objComando.CommandText = "MEL_K_VEHICULO.P_VALIDA_INSPECCION_MOTOR";

            objComando.agregarINParametro("P_NUM_MOTOR", OracleDbType.Varchar2, num_motor);
            objComando.agregarINParametro("P_COD_DOCUM_INSP", OracleDbType.Varchar2, cod_docum);
            objComando.agregarINParametro("P_COD_RAMO", OracleDbType.Varchar2, cod_ramo);
            objComando.agregarINParametro("P_CONV", OracleDbType.Varchar2, convenio);
            objComando.agregarOUTParametro("P_NUM_INSPEC", OracleDbType.Varchar2, 255);
            objComando.agregarOUTParametro("P_STATUS", OracleDbType.Varchar2, 255);
            objComando.agregarOUTParametro("P_EXISTE_INSPECTOR_TER", OracleDbType.Varchar2, 255);
            objComando.agregarOUTParametro("P_FECHA_INSPECCION", OracleDbType.Varchar2, 255);
            objComando.agregarOUTParametro("P_MCA_VENCIDA", OracleDbType.Varchar2, 255);
            objComando.agregarOUTParametro("P_ERROR", OracleDbType.Varchar2, 255);
            return objComando.ejecutarRegistroSP();
        }
        catch (Exception ex)
        {
            throw new Exception("ERROR Cotizador.NomModalidad_DB : " + ex.Message);
            Logs.writeToLogFile("Error - Cotizar_DB/ValidaInspeccion_DB: " + ex.Message);
        }
    }
    #endregion


    //CJ 10-04-2018 /CAMPAÑA COMERCIAL DESCUENTO CRUZADO  --JC

    public DataRow DsctoVenta_cruzada_DB(string CodDocumAseg, string cod_ramo, OracleConnection conn)
    {
        MCommand objComando = new MCommand();
        Int32 p_id_sector_ramo = 27;//testing idsector ramo 
        try
        {
            objComando.Connection = conn;
            objComando.CommandText = "MEL_K_CAMPANIA_COMERCIAL.P_VENTA_CRUZADA";

            decimal dato = decimal.Parse(cod_ramo);
            objComando.agregarINParametro("p_cod_ramo_origen", OracleDbType.Decimal, dato);
            objComando.agregarINParametro("p_cod_docum", OracleDbType.Varchar2, CodDocumAseg);
            objComando.agregarINParametro("p_id_sector_ramo", OracleDbType.Int32, p_id_sector_ramo);
            

            objComando.agregarOUTParametro("p_dscto", OracleDbType.BinaryDouble, 255);
            objComando.agregarOUTParametro("p_resultado", OracleDbType.Varchar2, 255);
            objComando.agregarOUTParametro("p_respuesta", OracleDbType.Varchar2, 255);
            return objComando.ejecutarRegistroSP();
        }
        catch (Exception ex)
        {
            throw new Exception("ERROR DsctoVenta_cruzada_DB: " + ex.Message);
        }
    }

    public DataRow DsctoFamiliar_DB(string CodDocumFamiliar, string cod_ramo, OracleConnection conn)
    {
        MCommand objComando = new MCommand();
        Int32 p_id_sector_ramo = 27;//testing idsector ramo 
        try
        {
            objComando.Connection = conn;
            objComando.CommandText = "MEL_K_CAMPANIA_COMERCIAL.P_DSCTO_FAMILIAR";

            decimal dato = decimal.Parse(cod_ramo);
            objComando.agregarINParametro("p_cod_ramo_origen", OracleDbType.Decimal, dato);
            objComando.agregarINParametro("p_cod_docum", OracleDbType.Varchar2, CodDocumFamiliar);
            objComando.agregarINParametro("p_id_sector_ramo", OracleDbType.Int32, p_id_sector_ramo);
            

            objComando.agregarOUTParametro("p_dscto", OracleDbType.BinaryDouble, 255);
            objComando.agregarOUTParametro("p_resultado", OracleDbType.Varchar2, 255);
            objComando.agregarOUTParametro("p_respuesta", OracleDbType.Varchar2, 255);
            return objComando.ejecutarRegistroSP();
        }
        catch (Exception ex)
        {
            throw new Exception("ERROR DsctoFamiliar_DB: " + ex.Message);
        }
    }

    public DataRow DsctoAgendaVencida_DB(string num_matricula, string cod_ramo, string rutCodDocumAseg, OracleConnection conn)
    {
        MCommand objComando = new MCommand();
        try
        {
            objComando.Connection = conn;
            objComando.CommandText = "MEL_K_CAMPANIA_COMERCIAL.P_DSCTO_AGENDA_VENCIMIENTO";

            decimal dato = decimal.Parse(cod_ramo);
            objComando.agregarINParametro("p_cod_ramo_origen", OracleDbType.Decimal, dato);
            objComando.agregarINParametro("p_num_matricula", OracleDbType.Varchar2, num_matricula);
            objComando.agregarINParametro("p_rutCodDocumAseg", OracleDbType.Varchar2, rutCodDocumAseg);

            objComando.agregarOUTParametro("p_dscto", OracleDbType.BinaryDouble, 255);
            objComando.agregarOUTParametro("p_resultado", OracleDbType.Varchar2, 255);
            objComando.agregarOUTParametro("p_respuesta", OracleDbType.Varchar2, 255);
            return objComando.ejecutarRegistroSP();
        }
        catch (Exception ex)
        {
            throw new Exception("ERROR DsctoAgendaVencida_DB : " + ex.Message);
        }
    }

    public DataRow GuardaDetalleDescuentos_DB(String NUM_COTIZACION, Decimal P_DSCTO_FAM, Decimal P_DSCTO_AGEVEN, Decimal P_DSCTO_VENCRUZ, Decimal P_PRIMA_BRUTA, Decimal P_SUMA_DSCTOS, Decimal P_TOTAL_DSCTO_UF, Decimal P_PRIMA_CON_DSCTO, OracleConnection conn)
    {
        MCommand objComando = new MCommand();
        try
        {


            //P_NUM_COTIZACION  varchar2,
            //                          P_DSCTO_FAM       binary_double,
            //                          P_DSCTO_AGEVEN    BINARY_DOUBLE,
            //                          P_DSCTO_VENCRUZ   BINARY_DOUBLE,
            //                          P_PRIMA_BRUTA     BINARY_DOUBLE,
            //                          P_SUMA_DSCTOS     BINARY_DOUBLE,
            //                          P_TOTAL_DSCTO_UF  BINARY_DOUBLE,
            //                          P_PRIMA_CON_DSCTO BINARY_DOUBLE,
            //                          P_NUM_POLIZA      varchar2,
            //                          p_error           OUT varchar2) IS


            objComando.Connection = conn;
            objComando.CommandText = "MEL_K_CAMPANIA_COMERCIAL.P_INSERT_DETALLE_DESCUENTO";

            objComando.agregarINParametro("P_NUM_COTIZACION", OracleDbType.Varchar2, NUM_COTIZACION);
            objComando.agregarINParametro("P_DSCTO_FAM", OracleDbType.BinaryDouble, P_DSCTO_FAM);
            objComando.agregarINParametro("P_DSCTO_AGEVEN", OracleDbType.BinaryDouble, P_DSCTO_AGEVEN);
            objComando.agregarINParametro("P_DSCTO_VENCRUZ", OracleDbType.BinaryDouble, P_DSCTO_VENCRUZ);
            objComando.agregarINParametro("P_PRIMA_BRUTA", OracleDbType.Decimal, P_PRIMA_BRUTA);
            objComando.agregarINParametro("P_SUMA_DSCTOS", OracleDbType.BinaryDouble, P_SUMA_DSCTOS);//
            objComando.agregarINParametro("P_TOTAL_DSCTO_UF", OracleDbType.BinaryDouble, P_TOTAL_DSCTO_UF);//
            objComando.agregarINParametro("P_PRIMA_CON_DSCTO", OracleDbType.BinaryDouble, P_PRIMA_CON_DSCTO);//
            objComando.agregarINParametro("P_NUM_POLIZA", OracleDbType.Varchar2, "");//
            //objComando.agregarINParametro("P_DSCTO_CUPON", OracleDbType.BinaryDouble, 0);


            objComando.agregarOUTParametro("p_error", OracleDbType.Varchar2, 255);
            return objComando.ejecutarRegistroSP();
        }
        catch (Exception ex)
        {
            throw new Exception("ERROR GuardaDetalleDescuentos_DB : " + ex.Message);
        }
    }

    public DataRow GetTopeDescuento_DB(string cod_ramo, OracleConnection conn)
    {
        MCommand objComando = new MCommand();
        try
        {
            decimal P_SECTOR_RAMO = 27;
            objComando.Connection = conn;
            objComando.CommandText = "MEL_K_CAMPANIA_COMERCIAL.P_GET_TOPE_DSCTO";

           
            decimal dato = decimal.Parse(cod_ramo);
            objComando.agregarINParametro("p_cod_ramo", OracleDbType.Decimal, dato);
            objComando.agregarINParametro("P_SECTOR_RAMO", OracleDbType.Decimal, P_SECTOR_RAMO);
            objComando.agregarOUTParametro("P_TOPE_DSCTO", OracleDbType.Decimal, 255);
            objComando.agregarOUTParametro("p_error", OracleDbType.Varchar2, 255);
            return objComando.ejecutarRegistroSP();
        }
        catch (Exception ex)
        {
            throw new Exception("ERROR GetTopeDescuento_DB : " + ex.Message);
        }
    }

    public DataRow DsctoPAT_DB(string cod_ramo, OracleConnection conn)
    {
        MCommand objComando = new MCommand();
        try
        {
            objComando.Connection = conn;
            objComando.CommandText = "MEL_K_CAMPANIA_COMERCIAL.P_DSCTO_PAT_CC";

            decimal dato = decimal.Parse(cod_ramo);
            objComando.agregarINParametro("p_cod_ramo_origen", OracleDbType.Decimal, dato);
            //objComando.agregarINParametro("p_num_matricula", OracleDbType.Varchar2, num_matricula);

            objComando.agregarOUTParametro("p_dscto", OracleDbType.BinaryDouble, 255);
            //   objComando.agregarOUTParametro("p_resultado", OracleDbType.Varchar2, 255);
            objComando.agregarOUTParametro("p_respuesta", OracleDbType.Varchar2, 255);
            return objComando.ejecutarRegistroSP();
        }
        catch (Exception ex)
        {
            throw new Exception("ERROR DsctoPAT_DB : " + ex.Message);
        }
    }

    public bool UpdateDetalleDescuentos(String NUM_COTIZACION, Decimal? P_DSCTO_FAM, Decimal? P_DSCTO_AGEVEN, Decimal? P_DSCTO_VENCRUZ, Decimal? P_DSCTO_PATCONT, Decimal? P_PRIMA_BRUTA, Decimal P_SUMA_DSCTOS, Decimal P_TOTAL_DSCTO_UF, Decimal P_PRIMA_CON_DSCTO, OracleConnection conn)
    {
        MCommand objComando = new MCommand();

        bool resp = true;
        try
        {
            objComando.Connection = conn;

            objComando.CommandText = "MEL_K_CAMPANIA_COMERCIAL.P_UPDATE_DETALLE_DESCUENTO";

            objComando.agregarINParametro("P_NUM_COTIZACION", OracleDbType.Varchar2, NUM_COTIZACION);
            objComando.agregarINParametro("P_DSCTO_FAM", OracleDbType.Decimal, P_DSCTO_FAM);
            objComando.agregarINParametro("P_DSCTO_AGEVEN", OracleDbType.Decimal, P_DSCTO_AGEVEN);
            objComando.agregarINParametro("P_DSCTO_VENCRUZ", OracleDbType.Decimal, P_DSCTO_VENCRUZ);
            objComando.agregarINParametro("P_DSCTO_CUPON", OracleDbType.Decimal, null);
            objComando.agregarINParametro("P_DSCTO_PATCONT", OracleDbType.Decimal, P_DSCTO_PATCONT);
            objComando.agregarINParametro("P_PRIMA_BRUTA", OracleDbType.Decimal, P_PRIMA_BRUTA);
            objComando.agregarINParametro("P_SUMA_DSCTOS", OracleDbType.Decimal, P_SUMA_DSCTOS);
            objComando.agregarOUTParametro("p_error", OracleDbType.Varchar2, 500);
            objComando.ejecutarSP();
        }
        catch (Exception ex)
        {
            resp = false;
            throw new Exception("ERRORen update detalle descuentos : " + ex.Message);
        }
        return resp;
    }

    public DataSet getDetalleDescuentos(OracleConnection strConexion, string num_cotizacion)
    {
        try
        {

            MCommand objCommand = new MCommand();

            objCommand.Connection = strConexion;

            objCommand.CommandText = "MEL_K_CAMPANIA_COMERCIAL.P_GET_DETALLE_DESCUENTO";

            objCommand.agregarINParametro("p_num_cotizacion", OracleDbType.Varchar2, num_cotizacion);
            objCommand.agregarOUTParametro("p_respuesta", OracleDbType.Varchar2, 500);
            objCommand.agregarOUTParametro("p_detalle_desc", OracleDbType.RefCursor, 0);

            return objCommand.ejecutarRefCursorSP();
        }
        catch (Exception ex)
        {
            throw new Exception("ERROR getDetalleDescuentos : " + ex.Message);
        }

    }

    public DataRow validaTipoAgente_DB(string cod_docum, OracleConnection conn)
    {
        MCommand objComando = new MCommand();

        try
        {
            objComando.Connection = conn;

            objComando.CommandText = "P_TRAE_TIP_AGT";

            objComando.agregarINParametro("P_COD_DOCUM", OracleDbType.Varchar2, cod_docum);
            objComando.agregarOUTParametro("P_NOM_TIP", OracleDbType.Varchar2, 255);
            objComando.agregarOUTParametro("P_TIP_AGT", OracleDbType.Varchar2, 255);

            return objComando.ejecutarRegistroSP();

        }
        catch (Exception ex)
        {
            throw new Exception("ERROR Cotizador.validaTipoAgente_DB : " + ex.Message);
        }
    }

    public DataRow GetTopeDescuentoAgt_DB(string cod_ramo,string cod_docum_agt, OracleConnection conn)
    {
        MCommand objComando = new MCommand();
        try
        {
            decimal P_SECTOR_RAMO = 27;
            objComando.Connection = conn;
            objComando.CommandText = "MEL_K_CAMPANIA_COMERCIAL.P_GET_TOPE_DSCTO_AGT";


            decimal dato = decimal.Parse(cod_ramo);
            objComando.agregarINParametro("p_cod_ramo", OracleDbType.Decimal, dato);
            objComando.agregarINParametro("P_SECTOR_RAMO", OracleDbType.Decimal, P_SECTOR_RAMO);
            objComando.agregarINParametro("P_COD_DOCUM_AGT", OracleDbType.Varchar2, cod_docum_agt);
            objComando.agregarOUTParametro("P_TOPE_DSCTO", OracleDbType.Decimal, 255);
            objComando.agregarOUTParametro("p_error", OracleDbType.Varchar2, 255);
            return objComando.ejecutarRegistroSP();
        }
        catch (Exception ex)
        {
            throw new Exception("ERROR GetTopeDescuento_DB : " + ex.Message);
        }
    }

    public DataRow VerificaPatenteTabla_DB(string p_cod_cia, string p_matricula, OracleConnection conn)
    {
        MCommand objComando = new MCommand();
         //PROCEDURE P_VERIFICA_REMATE(P_COD_CIA IN VARCHAR2,
         //                     P_MATRICULA    IN VARCHAR2,
         //                     P_ERROR      OUT VARCHAR2)
        try
        {
            objComando.Connection = conn;

            objComando.CommandText = "MEL_K_VALIDA_VEHICULO.P_VERIFICA_REMATE";
            
            objComando.agregarINParametro("P_COD_CIA", OracleDbType.Varchar2, p_cod_cia);
            objComando.agregarINParametro("P_MATRICULA", OracleDbType.Varchar2, p_matricula);

            objComando.agregarOUTParametro("P_ERROR", OracleDbType.Varchar2, 255);


            return objComando.ejecutarRegistroSP();

        }
        catch (Exception ex)
        {
            throw new Exception("ERROR Cotizador_DB.LlamaSisgen_DB : " + ex.Message);
        }
    }

    //public DataRow GuardaRegistroRemate_DB(string P_COD_MARCA, string P_COD_MODELO, string P_ANIO, string P_MENSAJE, string P_COD_CIA, string P_MATRICULA, OracleConnection conn)
    //{
    //    MCommand objComando = new MCommand();

    //    try
    //    {

          
    //        objComando.Connection = conn;

    //        objComando.CommandText = "mel_k_vehiculo_cv.P_VERIFICA_REMATE";

    //        objComando.agregarINParametro("P_COD_MARCA", OracleDbType.Varchar2, P_COD_MARCA);
    //        objComando.agregarINParametro("P_COD_MODELO", OracleDbType.Varchar2, P_COD_MODELO);
    //        objComando.agregarINParametro("P_ANIO", OracleDbType.Varchar2, P_ANIO);
    //        objComando.agregarINParametro("P_MENSAJE", OracleDbType.Varchar2, P_MENSAJE);
    //        objComando.agregarINParametro("P_COD_CIA", OracleDbType.Varchar2, P_COD_CIA);
    //        objComando.agregarINParametro("P_MATRICULA", OracleDbType.Varchar2, P_MATRICULA);

    //        objComando.agregarOUTParametro("P_ERROR", OracleDbType.Varchar2, 255);
            

    //        return objComando.ejecutarRegistroSP();

    //    }
    //    catch (Exception ex)
    //    {
    //        throw new Exception("ERROR Cotizador_DB.LlamaSisgen_DB : " + ex.Message);
    //    }
    //}

    #region Llamada a MEL_K_VALIDA_VEHICULO.P_REGISTRO_PATENTE
    public DataRow GuardaRegistroRemate_DB( string P_MENSAJE, string P_COD_CIA, string P_MATRICULA, string FechaOperacion, OracleConnection conn)
    {
        MCommand objComando = new MCommand();

        try
        {
            objComando.Connection = conn;
            objComando.CommandText = "MEL_K_VALIDA_VEHICULO.P_REGISTRO_PATENTE";

            objComando.agregarINParametro("P_MENSAJE", OracleDbType.Varchar2, P_MENSAJE);
            objComando.agregarINParametro("P_COD_CIA", OracleDbType.Varchar2, P_COD_CIA);
            objComando.agregarINParametro("p_fecha", OracleDbType.Varchar2, FechaOperacion);
            objComando.agregarINParametro("P_MATRICULA", OracleDbType.Varchar2, P_MATRICULA);

            objComando.agregarOUTParametro("P_ERROR", OracleDbType.Varchar2, 255);

            return objComando.ejecutarRegistroSP();
        }
        catch (Exception ex)
        {
            throw new Exception("ERROR Cotizador_DB.LlamaSisgen_DB : " + ex.Message);
        }
    }
    #endregion
}
