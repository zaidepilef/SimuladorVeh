using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

/// <summary>
/// Summary description for FirmaDigital
/// </summary>
public class FirmaDigital
{
    public static string FirmaDocumento(string nom_archivo)
    {
        try
        {
            string lafirmo = ConfigurationManager.AppSettings["McaFirmaPDF"];

            if (lafirmo == "S")
            {
                bool resp = UtilesWeb.firmaPDFServidor(nom_archivo);
                System.Threading.Thread.Sleep(3000);

                if (resp)
                    nom_archivo = nom_archivo + "_sign";
                else
                    UtilesWeb.EnviaCorreoAcusete("NO FIRMO VEHICULO :" + nom_archivo, "REVISAR PROCESO FIRMA");
                 
            }
            
            return nom_archivo;            
          
        }
        catch (Exception ex)
        {
            return nom_archivo;
        }
    }
}
