using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using Oracle.DataAccess.Client;
using MapfreMCL.oracle;
using System.Web.Configuration;

/// <summary>
/// Descripción breve de PreguntasDeclaracion_DB
/// </summary>
public class PreguntasDeclaracion_DB
{
    public PreguntasDeclaracion_DB() { }

    public DataSet TraePreguntas_DB(OracleConnection cnx)
    {
        MCommand objComando = new MCommand();

        int cod_ramo = Convert.ToInt32(WebConfigurationManager.AppSettings["RAMO"].ToString());

        try
        {

            objComando.Connection = cnx;

            objComando.CommandText = "MEL_K_LOGICA_PREGUNTAS.P_LISTA_PREGUNTAS";

            objComando.agregarINParametro("P_COD_RAMO", OracleDbType.Int32, cod_ramo);
            objComando.agregarOUTParametro("C_DATOS", OracleDbType.RefCursor, 0);

            return objComando.ejecutarRefCursorSP();

        }
        catch (Exception ex)
        {
            throw new Exception("Error al Traer Preguntas para Declaracion Estado " + ex.Message);
        }
        finally
        {
            cnx.Dispose();
        }
    }

    public string ValidaRespuestaBloqueo_DB(OracleConnection cnx, int id_pregunta, int id_pregunta_padre, string resp_padre)
    {
        MCommand objComando = new MCommand();
        int cod_ramo = Convert.ToInt32(WebConfigurationManager.AppSettings["RAMO"].ToString());
        try
        {
            objComando.Connection = cnx;
            objComando.CommandText = "MEL_K_LOGICA_PREGUNTAS.P_VALIDA_BLOQUEO";
            objComando.agregarINParametro("P_COD_RAMO", OracleDbType.Int32, cod_ramo);
            objComando.agregarINParametro("P_ID_PREGUNTA", OracleDbType.Int32, id_pregunta);
            objComando.agregarINParametro("P_ID_PREGUNTA_PADRE", OracleDbType.Int32, id_pregunta_padre);
            objComando.agregarINParametro("P_RESPUESTA_PADRE", OracleDbType.Varchar2, resp_padre);
            objComando.agregarOUTParametro("P_VALIDA", OracleDbType.Varchar2, 2);

            DataRow dr = objComando.ejecutarRegistroSP();

            if (dr != null)
                return dr["P_VALIDA"].ToString();
            else
                return "";
        }
        catch (Exception ex)
        {
            return "";
        }
    }

    public string ValidaDiasHabiles_DB(OracleConnection cnx, string fecha, int dias)
    {
        MCommand objComando = new MCommand();
        try
        {
            objComando.Connection = cnx;
            objComando.CommandText = "P_VALIDA_FECHAS_HABIL";
            objComando.agregarINParametro("P_FECHA", OracleDbType.Varchar2, fecha);
            objComando.agregarINParametro("P_NUM_DIAS", OracleDbType.Int32, dias);
            objComando.agregarOUTParametro("P_VALIDA", OracleDbType.Varchar2, 2);

            DataRow dr = objComando.ejecutarRegistroSP();

            if (dr != null)
                return dr["P_VALIDA"].ToString();
            else
                return "";
        }
        catch (Exception ex)
        {
            return "";
        }
    }
}
