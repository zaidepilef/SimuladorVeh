using System;
using System.Data;
using System.Collections;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

/// <summary>
/// Summary description for DañosVehiculo
/// </summary>
public class DañosVehiculo
{
    public string CodParte;
    public string CodSubParte;    
    public string NomPartesVeh;
    public string CodDaño;
    public string NomDaño;
    public string Observacion;
    
    
    public DañosVehiculo()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public static ArrayList CargaDaño()
    {
        ArrayList ArrDaños;

        if (HttpContext.Current.Session["Daños"] != null)
        {
            ArrDaños = (ArrayList)HttpContext.Current.Session["Daños"];
        }
        else
        {
            ArrDaños = new ArrayList();
            HttpContext.Current.Session["Daños"] = ArrDaños;
        }

        return ArrDaños;
    }    
}
