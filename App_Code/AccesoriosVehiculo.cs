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
/// Summary description for AccesoriosVehiculo
/// </summary>
public class AccesoriosVehiculo
{
    public string CodAccesorio;
    public string NomAccesorio;
    public string Observacion;

    public AccesoriosVehiculo()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public static ArrayList CargaAccesorio()
    {
        ArrayList ArrAccesorios;

        if (HttpContext.Current.Session["Accesorios"] != null)
        {
            ArrAccesorios = (ArrayList)HttpContext.Current.Session["Accesorios"];
        }
        else
        {
            ArrAccesorios = new ArrayList();
            HttpContext.Current.Session["Accesorios"] = ArrAccesorios;
        }

        return ArrAccesorios;
    }    
}
