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
/// Summary description for Cobranza_DB
/// </summary>
public class Cobranza_DB
{
    #region Calculo de Cuota
    public DataRow ValorCuota_DB(string cod_ramo, decimal prima, decimal desc_recar, int cuotas, string tip_cuota, string dia_pago, OracleConnection strConexion)
    {
        MCommand objCommand = new MCommand();
        DataRow outRow;

        try
        {           

            objCommand.Connection = strConexion;

            objCommand.CommandText = "MEL_K_COBRANZA.P_CALCULO_CUOTA";

            objCommand.agregarINParametro("P_CUOTA", OracleDbType.Int32, cuotas);
            objCommand.agregarINParametro("P_PRIMA", OracleDbType.Decimal, prima);
            objCommand.agregarINParametro("P_DESC", OracleDbType.Decimal, desc_recar);
            objCommand.agregarINParametro("P_COD_RAMO", OracleDbType.Varchar2, cod_ramo);
            objCommand.agregarINParametro("P_TIP_CUOTA", OracleDbType.Varchar2, tip_cuota);
            objCommand.agregarINParametro("P_DIA_PAGO", OracleDbType.Varchar2, dia_pago);
            objCommand.agregarOUTParametro("P_IMP_NETO", OracleDbType.Varchar2, 255);
            objCommand.agregarOUTParametro("P_INT_IMPTO", OracleDbType.Varchar2, 255);
            objCommand.agregarOUTParametro("P_VAL_CUOTA_NETA", OracleDbType.Varchar2, 255);
            objCommand.agregarOUTParametro("P_VAL_CUOTA_IMPTO", OracleDbType.Varchar2, 255);
            objCommand.agregarOUTParametro("P_VALOR_CUOTA", OracleDbType.Varchar2, 255);
            objCommand.agregarOUTParametro("p_error", OracleDbType.Varchar2, 255);

            outRow = objCommand.ejecutarRegistroSP();

            return outRow;

        }
        catch (Exception ex)
        {
            throw new Exception("ERROR Cobranza_DB.ValorCuota_DB : " + ex.Message);
        }
    }
    #endregion

    #region Calculo de Cuota
    public DataRow ValorCuotaSinInteres_DB(string prima,int cuotas, OracleConnection strConexion)
    {
        MCommand objCommand = new MCommand();
        DataRow outRow;

        try
        {

            objCommand.Connection = strConexion;

            objCommand.CommandText = "P_CALCULO_CUOTA_SIN_INTERES";

            objCommand.agregarINParametro("P_CUOTA", OracleDbType.Int32, cuotas);
            objCommand.agregarINParametro("P_PRIMA", OracleDbType.Single, float.Parse(prima.ToString(), System.Globalization.NumberStyles.Float, new System.Globalization.CultureInfo("en-US")));
            objCommand.agregarOUTParametro("P_VALOR_CUOTA", OracleDbType.Varchar2, 255);
            objCommand.agregarOUTParametro("p_error", OracleDbType.Varchar2, 255);

            outRow = objCommand.ejecutarRegistroSP();

            return outRow;

        }
        catch (Exception ex)
        {
            throw new Exception("ERROR Cobranza_DB.ValorCuotaSinInteres_DB : " + ex.Message);
        }
    }
    #endregion

    #region getPlanesPago()
    public DataSet PlanesPago_DB(int cod_cia, OracleConnection strConexion)
    {
        try
        {

            MCommand objCommand = new MCommand();

            objCommand.Connection = strConexion;

            objCommand.CommandText = "MEL_K_MAPFRE.P_TRAE_PLANES_PAGO";

            objCommand.agregarINParametro("p_cod_cia", OracleDbType.Int32, cod_cia);
            objCommand.agregarOUTParametro("p_cursor", OracleDbType.RefCursor, 0);
            objCommand.agregarOUTParametro("p_error", OracleDbType.Varchar2, 500);

            return objCommand.ejecutarRefCursorSP();
        }
        catch (Exception ex)
        {
            throw new Exception("ERROR Cobranza_DB.PlanesPago_DB : " + ex.Message);
        }

    }
    #endregion

    #region getPlanesPago_Ripley()
    public DataSet PlanesPagoRipley_DB(int cod_cia, OracleConnection strConexion)
    {
        try
        {

            MCommand objCommand = new MCommand();

            objCommand.Connection = strConexion;

            objCommand.CommandText = "MEL_K_VEHICULO.P_TRAE_PLANES_PAGO_RIPLEY";

            objCommand.agregarINParametro("p_cod_cia", OracleDbType.Int32, cod_cia);
            objCommand.agregarOUTParametro("p_cursor", OracleDbType.RefCursor, 0);
            objCommand.agregarOUTParametro("p_error", OracleDbType.Varchar2, 500);

            return objCommand.ejecutarRefCursorSP();
        }
        catch (Exception ex)
        {
            throw new Exception("ERROR Cobranza_DB.PlanesPago_DB : " + ex.Message);
        }

    }
    #endregion

	#region getPlanesPago_Compara()
    public DataSet PlanesPagoCompara_DB(int cod_cia, string tip_pago, OracleConnection strConexion)
    {
        try
        {

            MCommand objCommand = new MCommand();

            objCommand.Connection = strConexion;

            objCommand.CommandText = "MEL_K_VEHICULO.P_TRAE_PLANES_PAGO_COMPARA";

            objCommand.agregarINParametro("p_cod_cia", OracleDbType.Int32, cod_cia);
            objCommand.agregarINParametro("tip_pago", OracleDbType.Varchar2, tip_pago);
            objCommand.agregarOUTParametro("p_cursor", OracleDbType.RefCursor, 0);
            objCommand.agregarOUTParametro("p_error", OracleDbType.Varchar2, 500);

            return objCommand.ejecutarRefCursorSP();
        }
        catch (Exception ex)
        {
            throw new Exception("ERROR Cobranza_DB.PlanesPago_DB : " + ex.Message);
        }

    }
    #endregion

    #region getPlanesPago()
    public DataSet PlanesPagoPAT_DB(int cod_cia, OracleConnection strConexion)
    {
        try
        {

            MCommand objCommand = new MCommand();

            objCommand.Connection = strConexion;

            objCommand.CommandText = "MEL_K_VEHICULO.P_TRAE_PLANES_PAGO_PAT";

            objCommand.agregarINParametro("p_cod_cia", OracleDbType.Int32, cod_cia);
            objCommand.agregarOUTParametro("p_cursor", OracleDbType.RefCursor, 0);
            objCommand.agregarOUTParametro("p_error", OracleDbType.Varchar2, 500);

            return objCommand.ejecutarRefCursorSP();
        }
        catch (Exception ex)
        {
            throw new Exception("ERROR Cobranza_DB.PlanesPagoPAT_DB : " + ex.Message);
        }

    }
    #endregion

    #region getPlanesPago()
    public DataSet MarcaTarjetas_DB(OracleConnection strConexion)
    {
        try
        {

            MCommand objCommand = new MCommand();

            objCommand.Connection = strConexion;

            objCommand.CommandText = "MEL_K_MAPFRE_MCL.P_TRAE_TARJETAS";
           
            objCommand.agregarOUTParametro("p_cursor", OracleDbType.RefCursor, 0);
            objCommand.agregarOUTParametro("p_error", OracleDbType.Varchar2, 500);

            return objCommand.ejecutarRefCursorSP();
        }
        catch (Exception ex)
        {
            throw new Exception("ERROR Cobranza_DB.MarcaTarjetas_DB : " + ex.Message);
        }

    }
    #endregion

    #region getPlanesPago()
    public DataSet Tarjetas_DB(OracleConnection strConexion, string tip_tarjeta)
    {
        try
        {

            MCommand objCommand = new MCommand();

            objCommand.Connection = strConexion;

            objCommand.CommandText = "MEL_K_MAPFRE_MCL.P_TRAE_COD_TARJETA";

            objCommand.agregarINParametro("P_TIP_TARJETA", OracleDbType.Varchar2, tip_tarjeta);
            objCommand.agregarOUTParametro("p_cursor", OracleDbType.RefCursor, 0);
            objCommand.agregarOUTParametro("p_error", OracleDbType.Varchar2, 500);

            return objCommand.ejecutarRefCursorSP();
        }
        catch (Exception ex)
        {
            throw new Exception("ERROR Cobranza_DB.MarcaTarjetas_DB : " + ex.Message);
        }

    }
    #endregion

    #region Calculo de Cuota
    public DataRow DiaPago_DB(string cod_docum, OracleConnection strConexion)
    {
        MCommand objCommand = new MCommand();        

        try
        {
            objCommand.Connection = strConexion;

            objCommand.CommandText = "MEL_K_COBRANZA.P_CONSULTA_DIA_PAGO";

            objCommand.agregarINParametro("p_cod_docum", OracleDbType.Varchar2, cod_docum);
            objCommand.agregarOUTParametro("p_dia_pago", OracleDbType.Int32, 15);

            return objCommand.ejecutarRegistroSP();
        }
        catch (Exception ex)
        {
            throw new Exception("ERROR Cobranza_DB.DiaPago_DB : " + ex.Message);
        }
    }
    #endregion

    #region Calculo de Cuota
    public DataRow IVA_DB(OracleConnection strConexion)
    {
        MCommand objCommand = new MCommand();

        try
        {
            objCommand.Connection = strConexion;

            objCommand.CommandText = "DC_F_IVA_VIGENTE";

            objCommand.agregarRETURNParametro("ivas", OracleDbType.Decimal, 15);

            return objCommand.ejecutarRegistroSP();


        }
        catch (Exception ex)
        {
            throw new Exception("ERROR Cobranza_DB.DiaPago_DB : " + ex.Message);
        }
    }
    #endregion

    #region getPlanesPago_Convenio()
    public DataSet PlanesPagoConvenio_DB(string cod_cia, string cod_ramo, string tip_pago, string cod_agt, string cod_convenio, OracleConnection strConexion)
    {
        try
        {

            MCommand objCommand = new MCommand();

            objCommand.Connection = strConexion;

            objCommand.CommandText = "p_plan_pago_convenio";

            objCommand.agregarINParametro("p_cod_cia", OracleDbType.Varchar2, cod_cia);
            objCommand.agregarINParametro("p_cod_ramo", OracleDbType.Varchar2, cod_ramo);
            objCommand.agregarINParametro("p_cod_agt", OracleDbType.Varchar2, cod_agt);
            objCommand.agregarINParametro("p_cod_convenio", OracleDbType.Varchar2, cod_convenio);
            objCommand.agregarINParametro("p_tip_pago", OracleDbType.Varchar2, tip_pago);            
            objCommand.agregarOUTParametro("p_cursor", OracleDbType.RefCursor, 0);
            objCommand.agregarOUTParametro("p_error", OracleDbType.Varchar2, 500);

            return objCommand.ejecutarRefCursorSP();
        }
        catch (Exception ex)
        {
            throw new Exception("ERROR Cobranza_DB.PlanesPago_DB : " + ex.Message);
        }

    }
    #endregion
}
