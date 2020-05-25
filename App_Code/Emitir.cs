using System;
using System.Data;
using System.Configuration;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using MapfreMCL.oracle;
using Oracle.DataAccess.Client;

public class Emitir
{
    public static DataRow GeneraXML(string cod_ramo, string cod_docum_mae, string cod_docum_aseg, string cod_docum_tomad, string num_cotizacion, string cod_plan_pago, string mca_inspeccion, string fec_vig_ini,string dia_pago,  string forma_pago,string codbanco, string codtarjeta, string nrotarjeta, string mestarjeta, string aniotarjeta, string mca_suplanta)
    {
        DataRow emision = null;
        DataRow error_emision = null;        
        Emitir_DB objemite = new Emitir_DB();

        try
        {
            using (OracleConnection Conexion = MConexion.getConexion("OVDES"))
            {
                emision = objemite.GeneraXML_DB(cod_docum_mae, cod_docum_aseg, cod_docum_tomad, num_cotizacion, cod_plan_pago, mca_inspeccion, fec_vig_ini, dia_pago, forma_pago, codbanco, codtarjeta, nrotarjeta, mestarjeta, aniotarjeta, mca_suplanta,Conexion);

                if (emision["P_ERROR"].ToString() == "N")
                {
                    StringBuilder objXML = new StringBuilder();

                    objXML.Append("<XML ACCION=\"P\" COD_RAMO=\"");
                    objXML.Append(cod_ramo);
                    objXML.Append("\" NUM_POLIZA=\"");
                    objXML.Append("\">");

                    objXML.Append(emision["P_MEL_XML_POL_P2000030"]);
                    objXML.Append(emision["P_MEL_XML_POL_P2000031"]);
                    objXML.Append(emision["P_MEL_XML_POL_P2000020"]);
                    objXML.Append(emision["P_MEL_XML_POL_P2000040"]);
                    objXML.Append(emision["P_MEL_XML_POL_P2000060"]);
                    //objXML.Append(emision["P_MEL_XML_POL_P1001331"]);

                    objXML.Append("</XML>");

                    string XML;

                    XML = objXML.ToString();
                    XML = XML.Replace("null", "");

                    DataRow emitir = EmitirPoliza(XML);

                     return emitir;                  

                }
                else
                    return error_emision;
            }
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }

    public static DataRow EmitirPoliza(string xml)
    {
        DataRow emision = null;
        Emitir_DB objemision = new Emitir_DB();

        try
        {
            using (OracleConnection Conexion = MConexion.getConexion("OF0"))
            {
                emision = objemision.EmitirPoliza_DB(xml, Conexion);
                return emision;
            }
        }

        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }

    public static void ActualizaNumPoliza(string num_cotizacion, string num_poliza)
    {
        DataRow emision = null;
        Emitir_DB objemision = new Emitir_DB();

        try
        {
            using (OracleConnection Conexion = MConexion.getConexion("OVDES"))
            {
                emision = objemision.ActualizaNumPoliza_DB(num_cotizacion, num_poliza, Conexion);
                //return emision;
            }
        }

        catch (Exception ex)
        {
           // throw new Exception(ex.Message);
        }
    }

    public static string ImprimirPoliza(string num_poliza)
    {
        DataRow emision = null;
        Emitir_DB objemision = new Emitir_DB();

        string namefile;
        string namefilePDF;
        string proceso;

        try
        {
            using (OracleConnection cnxOF0 = MConexion.getConexion("OF0"))
            {
                DataRow dr = Emitir_DB.getFileName(cnxOF0, num_poliza);
                namefilePDF = dr["P_NOM_ARCHIVO"].ToString();
                //namefile = namefilePDF.Substring(0, namefilePDF.IndexOf("."));

                System.Threading.Thread.Sleep(6000);

                DataRow drtxt = Emitir_DB.insertaTxt(cnxOF0, "1", "DPATH", namefilePDF + ".TXT");
                proceso = drtxt["p_error"].ToString();

                if (proceso == "0")
                {
                    System.Threading.Thread.Sleep(6000);

                    proceso = Emitir_DB.insertPDF(MConexion.getConexion("OVDES"), "LIS", namefilePDF + ".TXT");

                    System.Threading.Thread.Sleep(6000);

                    if (proceso == "0")
                    {
                        // Se concatena despues de firmado
                        //proceso = ConfigurationManager.AppSettings["Server"] +
                        //          "/pdf/" + namefilePDF + ".PDF";

                        //proceso = namefilePDF + ".PDF";
                        proceso = namefilePDF;

                        //#region Firmando PDF y Generando Link
                        //string lafirmo = ConfigurationManager.AppSettings["McaFirmaPDF"];
                        //if (lafirmo == "S")
                        //{
                        //    bool resp = UtilesWeb.firmaPDFServidor(namefile);
                        //    //System.Threading.Thread.Sleep(5000);
                        //    if (resp)
                        //        proceso = "http://" + ConfigurationManager.AppSettings["Server13"] + "/pdf/" + namefile + "_sign.PDF";
                        //    else
                        //        UtilesWeb.EnviaCorreoAcusete("NO FIRMO RCI :" + namefilePDF, "REVISAR PROCESO FIRMA");
                        //}
                        //#endregion

                        return proceso;

                    }
                    else
                    {
                        return "ERROR";
                    }

                }
                else
                {
                    return "ERROR";
                }

            }

        }
        catch
        {
            return "ERROR";
        }
    }

    public static string ImprimirMandato(string num_cotizacion)
    {
        DataRow emision = null;
        Emitir_DB objemision = new Emitir_DB();

        try
        {
            using (OracleConnection Conexion = MConexion.getConexion("OVDES"))
            {
                emision = objemision.ImprimirMandato_DB(Conexion, num_cotizacion);
                
                return emision["p_nom_fic"].ToString();
            }
        }

        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }

   
    
}
