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
/// Summary description for Localidades_DB
/// </summary>
public class Localidades_DB
{
    #region Procedimiento que devuelve las regiones
    public DataSet getRegion(OracleConnection cnx, string str_cod_pais)
    {
        MCommand objComando = new MCommand();

        try
        {
            objComando.Connection = cnx;

            objComando.CommandText = "MEL_K_MAPFRE.P_Region";

            objComando.agregarINParametro("p_cod_pais", OracleDbType.Varchar2, str_cod_pais);
            objComando.agregarOUTParametro("c_regiones", OracleDbType.RefCursor, 0);
            objComando.agregarOUTParametro("P_ERROR", OracleDbType.Varchar2, 255);

            return objComando.ejecutarRefCursorSP();

        }
        catch (Exception ex)
        {
            throw new Exception("Error al capturar Regiones " + ex.Message);
        }



    }

    #endregion

    #region Procedimiento que devuelve las Ciudades
    public DataSet getCiudad(OracleConnection cnx, string str_cod_pais, string str_cod_estado)
    {
        MCommand objComando = new MCommand();

        try
        {
            objComando.Connection = cnx;

            objComando.CommandText = "MEL_K_MAPFRE.P_Ciudad";

            objComando.agregarINParametro("p_cod_pais", OracleDbType.Varchar2, str_cod_pais);
            objComando.agregarINParametro("p_cod_estado", OracleDbType.Varchar2, str_cod_estado);
            objComando.agregarOUTParametro("c_ciudades", OracleDbType.RefCursor, 0);
            objComando.agregarOUTParametro("P_ERROR", OracleDbType.Varchar2, 255);

            return objComando.ejecutarRefCursorSP();

        }
        catch (Exception ex)
        {
            throw new Exception("ERROR Cotizador.ValidaSuplantacion : " + ex.Message);
        }
    }

    #endregion

    #region Procedimiento que devuelve las Comunas
    public DataSet getComuna(OracleConnection cnx, string str_cod_pais, string str_cod_prov)
    {
        MCommand objComando = new MCommand();

        try
        {
            objComando.Connection = cnx;

            objComando.CommandText = "MEL_K_MAPFRE.P_COMUNA";

            objComando.agregarINParametro("P_COD_PAIS", OracleDbType.Varchar2, str_cod_pais);
            objComando.agregarINParametro("P_COD_PROV", OracleDbType.Varchar2, str_cod_prov);
            objComando.agregarOUTParametro("C_COMUNAS", OracleDbType.RefCursor, 0);
            objComando.agregarOUTParametro("P_ERROR", OracleDbType.Varchar2, 255);

            return objComando.ejecutarRefCursorSP();

        }
        catch (Exception ex)
        {
            throw new Exception("ERROR Cotizador.ValidaSuplantacion : " + ex.Message);
        }
    }
    #endregion

    #region Procedimiento que devuelve las regiones para Despacho
    public DataSet getRegion_despacho(OracleConnection cnx, string str_cod_pais)
    {
        MCommand objComando = new MCommand();

        try
        {
            objComando.Connection = cnx;

            objComando.CommandText = "MEL_K_MAPFRE.P_REGION_DESPACHO";

            objComando.agregarINParametro("p_cod_pais", OracleDbType.Varchar2, str_cod_pais);
            objComando.agregarOUTParametro("c_regiones", OracleDbType.RefCursor, 0);
            objComando.agregarOUTParametro("P_ERROR", OracleDbType.Varchar2, 255);

            return objComando.ejecutarRefCursorSP();

        }
        catch (Exception ex)
        {
            throw new Exception("Error al capturar Regiones " + ex.Message);
        }



    }

    #endregion

    #region Procedimiento que devuelve las Ciudades para Despacho
    public DataSet getCiudad_despacho(OracleConnection cnx, string str_cod_pais, string str_cod_estado)
    {
        MCommand objComando = new MCommand();

        try
        {
            objComando.Connection = cnx;

            objComando.CommandText = "MEL_K_MAPFRE.P_Ciudad_despacho";

            objComando.agregarINParametro("p_cod_pais", OracleDbType.Varchar2, str_cod_pais);
            objComando.agregarINParametro("p_cod_estado", OracleDbType.Varchar2, str_cod_estado);
            objComando.agregarOUTParametro("c_ciudades", OracleDbType.RefCursor, 0);
            objComando.agregarOUTParametro("P_ERROR", OracleDbType.Varchar2, 255);

            return objComando.ejecutarRefCursorSP();

        }
        catch (Exception ex)
        {
            throw new Exception("ERROR Cotizador.ValidaSuplantacion : " + ex.Message);
        }
    }

    #endregion

    #region Procedimiento que devuelve las Comunas para Despacho
    public DataSet getComuna_despacho(OracleConnection cnx, string str_cod_pais, string str_cod_prov)
    {
        MCommand objComando = new MCommand();

        try
        {
            objComando.Connection = cnx;

            objComando.CommandText = "MEL_K_MAPFRE.P_COMUNA_despacho";

            objComando.agregarINParametro("P_COD_PAIS", OracleDbType.Varchar2, str_cod_pais);
            objComando.agregarINParametro("P_COD_PROV", OracleDbType.Varchar2, str_cod_prov);
            objComando.agregarOUTParametro("C_COMUNAS", OracleDbType.RefCursor, 0);
            objComando.agregarOUTParametro("P_ERROR", OracleDbType.Varchar2, 255);

            return objComando.ejecutarRefCursorSP();

        }
        catch (Exception ex)
        {
            throw new Exception("ERROR Cotizador.ValidaSuplantacion : " + ex.Message);
        }
    }
    #endregion
}
