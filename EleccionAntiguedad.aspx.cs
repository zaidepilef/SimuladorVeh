using System;
using System.Collections;
using System.Configuration;
using System.Data;
//using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
//using System.Xml.Linq;

public partial class EleccionAntiguedad : System.Web.UI.Page
{
    protected void Page_PreInit(object sender, EventArgs e)
    {
        try
        {
            this.Theme = "MenuInicial";
        }
        catch
        {
            Response.Redirect("SessionTerminada.aspx", false);
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void imgPlanTradicional_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Cotizador.aspx", false);
    }

    protected void imgAutosAntiguos_Click(object sender, ImageClickEventArgs e)
    {
        Session["CONV"] = "AUTOANTIGUO";
        Response.Redirect("Cotizador.aspx", false);
    }
}
