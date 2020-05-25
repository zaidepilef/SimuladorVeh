using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

public partial class FinSimulacion : System.Web.UI.Page
{
    protected void Page_PreInit(object sender, EventArgs e)
    {
        try
        {
            if (Session["Theme"].ToString() == "AutoAntiguo")
                this.Theme = "Mapfre";
            else
                this.Theme = Session["Theme"].ToString();
        }
        catch
        {
            Response.Redirect("SessionTerminada.aspx", false);
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            Poliza PolVeh;
            if (Session["PolVeh"] != null)
            {
                PolVeh = (Poliza)Session["PolVeh"];
            }
            else
            {
                PolVeh = new Poliza();
                Session["PolVeh"] = PolVeh;
                Response.Redirect("SessionTerminada.aspx", false);
            }

            lblNumPresupuesto.Text = PolVeh.NumCotizacion;
        }
        catch (Exception ex)
        { }
    }
}
