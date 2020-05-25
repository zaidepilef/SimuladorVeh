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

public partial class EleccionCotizador : System.Web.UI.Page
{
    protected void Page_PreInit(object sender, EventArgs e)
    {
        try
        {
            //this.Theme = "Seleccion";
            this.Theme = "MenuInicial";
                        
            //if (Session["es_gap"].ToString() == "SI")
            //{
            //    this.Theme = "GAP";
            //}
            //else
            //{
            //    if (Session["MCA_MEL"] == null)
            //    {
            //        this.Theme = Session["Theme"].ToString();
            //    }
            //    else
            //    {
            //        if (Session["MCA_MEL"].ToString() == "N")
            //            this.Theme = "TronWeb";
            //        else
            //            this.Theme = Session["Theme"].ToString();
            //    }
            //}

        }
        catch
        {
            Response.Redirect("SessionTerminada.aspx", false);
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void imgVehPart_Click(object sender, ImageClickEventArgs e)
    {        
            Response.Redirect("EleccionAntiguedad.aspx", false);        
    }

    protected void imgVehCom_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("https://mel.mapfre.cl/CotizadorVehComercial/load.asp?R=" + Session["MM_Cuenta"].ToString(), false);
    }
    protected void btnUsoParticular_Click(object sender, EventArgs e)
    {
        Response.Redirect("EleccionAntiguedad.aspx", false);     
    }
    protected void btnUsoComercial_Click(object sender, EventArgs e)
    {
        Response.Redirect("https://mel.mapfre.cl/CotizadorVehComercial/load.asp?R=" + Session["MM_Cuenta"].ToString(), false);
    }
}
