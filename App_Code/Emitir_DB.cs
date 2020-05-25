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
/// Summary description for Emitir_DB
/// </summary>
public class Emitir_DB
{
    #region Genera los XMLs
    public DataRow  GeneraXML_DB(string cod_docum_mae, string cod_docum_aseg, string cod_docum_tomad, string num_cotizacion, string cod_plan_pago, string mca_inspeccion, string fec_vig_ini, string dia_pago, string forma_pago, string codbanco, string codtarjeta, string nrotarjeta, string mestarjeta, string aniotarjeta,string mca_suplanta, OracleConnection conn)
    {
        MCommand objComando = new MCommand();

        try
        {
            objComando.Connection = conn;

            objComando.CommandText = "MEL_K_VEHICULO.P_GENERA_XML";

            objComando.agregarINParametro("P_COD_DOCUM_MAE", OracleDbType.Varchar2, cod_docum_mae);
            objComando.agregarINParametro("P_COD_DOCUM_ASEG", OracleDbType.Varchar2, cod_docum_aseg);
            objComando.agregarINParametro("P_COD_DOCUM_TOMAD", OracleDbType.Varchar2, cod_docum_tomad);
            objComando.agregarINParametro("P_NUM_COTIZACION", OracleDbType.Varchar2, num_cotizacion);

            objComando.agregarINParametro("P_COD_PLAN_PAGO", OracleDbType.Varchar2, cod_plan_pago);
            objComando.agregarINParametro("P_IND_INSP", OracleDbType.Varchar2, mca_inspeccion);
            objComando.agregarINParametro("P_FEC_VIG_INI", OracleDbType.Varchar2, fec_vig_ini);
            objComando.agregarINParametro("P_DIA_PAGO", OracleDbType.Varchar2, dia_pago);

            objComando.agregarINParametro("P_FORMA_PAGO", OracleDbType.Varchar2, forma_pago);
            objComando.agregarINParametro("P_CODBANCO", OracleDbType.Varchar2, codbanco);
            objComando.agregarINParametro("P_CODTARJETA", OracleDbType.Varchar2, codtarjeta);
            objComando.agregarINParametro("P_NROTARJETA", OracleDbType.Varchar2, nrotarjeta);
            objComando.agregarINParametro("P_MESTARJETA", OracleDbType.Varchar2, mestarjeta);
            objComando.agregarINParametro("P_ANIOTARJETA", OracleDbType.Varchar2, aniotarjeta);

            objComando.agregarINParametro("P_SUPLANTA", OracleDbType.Varchar2, mca_suplanta);

            objComando.agregarOUTParametro("P_COD_RAMO", OracleDbType.Int32, 15);
            objComando.agregarOUTParametro("P_MEL_XML_POL_P2000030", OracleDbType.Clob, 0);
            objComando.agregarOUTParametro("P_MEL_XML_POL_P2000031", OracleDbType.Clob, 0);
            objComando.agregarOUTParametro("P_MEL_XML_POL_P2000020", OracleDbType.Clob, 0);
            objComando.agregarOUTParametro("P_MEL_XML_POL_P2000040", OracleDbType.Clob, 0);
            objComando.agregarOUTParametro("P_MEL_XML_POL_P2000060", OracleDbType.Clob, 0);
            objComando.agregarOUTParametro("P_MEL_XML_POL_p1001331", OracleDbType.Clob, 0);
            objComando.agregarOUTParametro("P_ERROR", OracleDbType.Varchar2, 255);

            return objComando.ejecutarRegistroSP();

        }
        catch (Exception ex)
        {
            throw new Exception("ERROR Cotizador.GeneraXML_DB : " + ex.Message);
        }
    }
    #endregion

    #region Emitir Poliza
    public DataRow EmitirPoliza_DB(string xml, OracleConnection conn)
    {
        MCommand objComando = new MCommand();

        try
        {
            objComando.Connection = conn;

            objComando.CommandText = "tron2000.em_k_gen_ws_mmx.P_LANZA_PROCESO2_XML";

            objComando.agregarINParametro("PCADENA", OracleDbType.Clob, xml);
            objComando.agregarOUTParametro("PNUM_POLIZA", OracleDbType.Varchar2, 30);
            objComando.agregarOUTParametro("PNUM_POLIZA_ORIGEN", OracleDbType.Varchar2, 30);
            objComando.agregarOUTParametro("PTXT_ERROR", OracleDbType.Varchar2, 255);

            return objComando.ejecutarRegistroSP();

        }
        catch (Exception ex)
        {
            throw new Exception("ERROR Cotizador.EmitirPoliza_DB : " + ex.Message);
        }
    }
    #endregion

    #region Actualiza Numero Poliza
    public DataRow ActualizaNumPoliza_DB(string num_cotizacion, string num_poliza, OracleConnection conn)
    {
        MCommand objComando = new MCommand();

        //try
        //{

        objComando.Connection = conn;

        objComando.CommandText = "MEL_K_VEHICULO.P_UPDATE_COT_POL";

        objComando.agregarINParametro("P_NUM_COTIZACION", OracleDbType.Varchar2, num_cotizacion);
        objComando.agregarINParametro("P_NUM_POLIZA", OracleDbType.Varchar2, num_poliza);
        objComando.agregarOUTParametro("P_ERROR", OracleDbType.Int32, 20);

        return objComando.ejecutarRegistroSP();

        //}
        //catch (Exception ex)
        //{
        //    //throw new Exception("ERROR Cotizador.EmitirPoliza_DB : " + ex.Message);
        //}
    }
    #endregion

    #region Método que crea y captura el nombre del Archivo pdf
    public static DataRow getFileName(OracleConnection cnx, string num_poliza)
    {
        MCommand objComando = new MCommand();

        try
        {
            objComando.Connection = cnx;

            objComando.CommandText = "tron2000.p_imprime_poliza_veh";

            objComando.agregarINParametro("p_num_poliza", OracleDbType.Varchar2, num_poliza);
            objComando.agregarOUTParametro("p_nom_archivo", OracleDbType.Varchar2, 255);

            return objComando.ejecutarRegistroSP();

        }
        catch (Exception ex)
        {
            throw new Exception("Error al Opteneder el nombre del PDF " + ex.Message);
        }
    }
    #endregion

    #region Método que inserta el archivo TXT
    public static DataRow insertaTxt(OracleConnection cnx, string cod_cia, string nom_dir, string nom_archivo)
    {
        MCommand objComando = new MCommand();

        try
        {
            objComando.Connection = cnx;

            objComando.CommandText = "MEL_k_dat_pdf.p_inserta_txt";

            objComando.agregarINParametro("p_cod_cia", OracleDbType.Varchar2, cod_cia);
            objComando.agregarINParametro("p_nom_directorio", OracleDbType.Varchar2, nom_dir);
            objComando.agregarINParametro("p_nom_archivo", OracleDbType.Varchar2, nom_archivo);
            objComando.agregarOUTParametro("p_error", OracleDbType.Varchar2, 255);

            return objComando.ejecutarRegistroSP();
        }
        catch (Exception ex)
        {
            throw new Exception("Error al insertar TXT " + ex.Message);
        }
    }
    #endregion

    #region Método que inserta el archivo PDF
    public static string insertPDF(OracleConnection cnx, string nom_dir, string nom_archivo)
    {
        MCommand objComando = new MCommand();
        DataRow insert = null;

        try
        {
            objComando.Connection = cnx;

            objComando.CommandText = "ov_net_pruebas.p_inserta_dat";

            objComando.agregarINParametro("p_nom_archivo", OracleDbType.Varchar2, nom_archivo);
            objComando.agregarINParametro("p_nom_directorio", OracleDbType.Varchar2, nom_dir);
            objComando.agregarOUTParametro("p_error", OracleDbType.Varchar2, 255);

            insert = objComando.ejecutarRegistroSP();

            return insert["p_error"].ToString();

        }
        catch (Exception ex)
        {
            throw new Exception("Error al insertar el PDF " + ex.Message);
        }
    }
    #endregion

    #region Método que inserta el archivo pdf en OVDES
    public DataRow ImprimirMandato_DB(OracleConnection cnx, string num_cotizacion)
    {
        MCommand objComando = new MCommand();

        try
        {
            objComando.Connection = cnx;

            objComando.CommandText = "MEL_K_VEHICULO.P_IMPRIME_PAT";

            objComando.agregarINParametro("P_NUM_COTIZACION", OracleDbType.Varchar2, num_cotizacion);
            objComando.agregarOUTParametro("p_nom_fic", OracleDbType.Varchar2, 255);
            objComando.agregarOUTParametro("p_error", OracleDbType.Varchar2, 255);

            return objComando.ejecutarRegistroSP();

        }
        catch (Exception ex)
        {
            throw new Exception("Error al insertar el PDF " + ex.Message);
        }
    }
    #endregion

}
