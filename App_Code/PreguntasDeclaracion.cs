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
using System.Collections.Generic;

/// <summary>
/// Descripción breve de PreguntasDeclaracion
/// </summary>
public class PreguntasDeclaracion
{
    public static string TraePreguntas(bool autoNuevo, string cuota, out List<string> lstPreguntas)
    {
        try
        {
            using (OracleConnection cnx = MConexion.getConexion("OVDES"))
            {
                string html = "";
                PreguntasDeclaracion_DB objdb = new PreguntasDeclaracion_DB();
                DataSet ds = objdb.TraePreguntas_DB(cnx);
                lstPreguntas = new List<string>();
                if (ds.Tables.Count > 0)
                {
                    DataView dv = ds.Tables[0].DefaultView;
                    dv.Sort = "[ID_PREGUNTA] ASC";
                    DataTable dt = dv.ToTable();
                    foreach (DataRow dr in dt.Rows)
                    {
                        

                        if (autoNuevo)
                        {
                            if (dr["ID_PREGUNTA"].ToString() == "1")
                            {
                                lstPreguntas.Add(dr["DESC_PREGUNTA"].ToString());

                                html += "<div class='bloque left lineal' style='width: 69%; margin-top: 15px; margin-bottom: 0;'>";
                                html += "<label class='text' for='patente'>";
                                html += dr["desc_pregunta"].ToString();
                                html += "</label></br>";
                                html += "<span style='float: left; margin: 4px 10px 0 0; padding: 0;'>";
                                html += "<input type='radio' id='Resp" + dr["id_pregunta"].ToString() + "_1' name='p" + dr["id_pregunta"].ToString() + "' onchange=\"preguntas_declaracion_estado(this, '" + dr["respuesta_afirmativa"].ToString() + "', '" + dr["id_pregunta"].ToString() + "', '" + dr["id_pregunta_padre"].ToString() + "') \"/>";
                                html += dr["respuesta_afirmativa"].ToString() + " &nbsp;&nbsp; </span>";
                                html += "<span style='float: left; margin: 4px 10px 0 0; padding: 0;'>";
                                html += "<input type='radio' id='Resp" + dr["id_pregunta"].ToString() + "_2' name='p" + dr["id_pregunta"].ToString() + "' onchange=\"preguntas_declaracion_estado(this, '" + dr["respuesta_negativa"].ToString() + "', '" + dr["id_pregunta"].ToString() + "', '" + dr["id_pregunta_padre"].ToString() + "') \"/>";
                                html += dr["respuesta_negativa"].ToString() + "</span>";
                                html += "</div></br>";
                                break;
                            }
                        }
                        else
                        {

                            if (dr["ID_PREGUNTA"].ToString() != "4")
                                lstPreguntas.Add(dr["DESC_PREGUNTA"].ToString());
                            else
                                lstPreguntas.Add(dr["DESC_PREGUNTA"].ToString() + cuota);

                            html += "<div class='bloque left lineal' style='width: 69%; margin-top: 15px; margin-bottom: 0;'>";
                            html += "<label class='text' for='patente'>";
                            if(dr["ID_PREGUNTA"].ToString() != "4")
                                html += dr["DESC_PREGUNTA"].ToString();
                            else
                                html += dr["DESC_PREGUNTA"].ToString() + cuota;
                            html += "</label></br>";
                            html += "<span style='float: left; margin: 4px 10px 0 0; padding: 0;'>";
                            if (dr["ID_PREGUNTA"].ToString() == "1")
                                html += "<input type='radio'  id='Resp" + dr["ID_PREGUNTA"].ToString() + "_1' name='P" + dr["ID_PREGUNTA"].ToString() + "' onchange=\"preguntas_declaracion_estado(this, '" + dr["RESPUESTA_AFIRMATIVA"].ToString() + "', '" + dr["ID_PREGUNTA"].ToString() + "', '" + dr["ID_PREGUNTA_PADRE"].ToString() + "') \"/>";
                            else
                                html += "<input disabled type='radio'  id='Resp" + dr["ID_PREGUNTA"].ToString() + "_1' name='P" + dr["ID_PREGUNTA"].ToString() + "' onchange=\"preguntas_declaracion_estado(this, '" + dr["RESPUESTA_AFIRMATIVA"].ToString() + "', '" + dr["ID_PREGUNTA"].ToString() + "', '" + dr["ID_PREGUNTA_PADRE"].ToString() + "') \"/>";
                            //html += "</span>";
                            //html += "<span>" + dr["RESPUESTA_AFIRMATIVA"].ToString() + " &nbsp;&nbsp; </span>";
                            html += dr["RESPUESTA_AFIRMATIVA"].ToString() + " &nbsp;&nbsp; </span>";
                            html += "<span style='float: left; margin: 4px 10px 0 0; padding: 0;'>";
                            if (dr["ID_PREGUNTA"].ToString() == "1")
                                html += "<input type='radio'  id='Resp" + dr["ID_PREGUNTA"].ToString() + "_2' name='P" + dr["ID_PREGUNTA"].ToString() + "' onchange=\"preguntas_declaracion_estado(this, '" + dr["RESPUESTA_NEGATIVA"].ToString() + "', '" + dr["ID_PREGUNTA"].ToString() + "', '" + dr["ID_PREGUNTA_PADRE"].ToString() + "') \"/>";
                            else
                                html += "<input disabled type='radio'  id='Resp" + dr["ID_PREGUNTA"].ToString() + "_2' name='P" + dr["ID_PREGUNTA"].ToString() + "' onchange=\"preguntas_declaracion_estado(this, '" + dr["RESPUESTA_NEGATIVA"].ToString() + "', '" + dr["ID_PREGUNTA"].ToString() + "', '" + dr["ID_PREGUNTA_PADRE"].ToString() + "') \"/>";
                            //html += "</span>";
                            html +=  dr["RESPUESTA_NEGATIVA"].ToString() + "</span>";
                            html += "</div></br>";
                        }
                    }
                }
                
                return html;
            }
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }

    public static string ValidaRespuestaBloqueo(int id_pregunta, int id_preguntapadre, string resp)
    {
        try
        {
            using (OracleConnection cnx = MConexion.getConexion("OVDES"))
            {
                PreguntasDeclaracion_DB objdb = new PreguntasDeclaracion_DB();

                return objdb.ValidaRespuestaBloqueo_DB(cnx, id_pregunta, id_preguntapadre, resp);
            }
        }
        catch (Exception ex)
        {
            return "";
        }
    }

    public static string ValidaDiasHabiles(string fecha, int dias)
    {
        try
        {
            using (OracleConnection cnx = MConexion.getConexion("OVDES"))
            {
                PreguntasDeclaracion_DB objdb = new PreguntasDeclaracion_DB();

                return objdb.ValidaDiasHabiles_DB(cnx,fecha,dias);
            }
        }
        catch (Exception ex)
        {
            return "";
        }
    }

    public static int CantPreguntas(bool AutoNuevo)
    {
        try
        {
            using (OracleConnection cnx = MConexion.getConexion("OVDES"))
            {
                string html = "";
                PreguntasDeclaracion_DB objdb = new PreguntasDeclaracion_DB();
                DataSet ds = objdb.TraePreguntas_DB(cnx);

                if (ds.Tables.Count > 0)
                {
                    DataView dv = ds.Tables[0].DefaultView;
                    dv.Sort = "[ID_PREGUNTA] ASC";
                    DataTable dt = dv.ToTable();
                    if (AutoNuevo)
                        return 1;
                    else
                        return dt.Rows.Count;
                }
                else
                    return 0;
            }
        }
        catch (Exception ex)
        {
            return 0;
        }
    }
}

public class RespuestasDeclaracion
{
    private string pregunta;

    public string Pregunta
    {
        get { return pregunta; }
        set { pregunta = value; }
    }

    private string respuesta;

    public string Respuesta
    {
        get { return respuesta; }
        set { respuesta = value; }
    }

    private string idPregunta;

    public string IdPregunta
    {
        get { return idPregunta; }
        set { idPregunta = value; }
    }

    public RespuestasDeclaracion(){}

    public RespuestasDeclaracion(string p_pregunta, string p_respuesta, string p_idPregunta) 
    {
        Pregunta = p_pregunta; Respuesta = p_respuesta; IdPregunta = p_idPregunta;
    }
}
