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

public partial class autoantiguo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["CONV"] = "AUTOANTIGUO";
        Response.Redirect("Cotizador.aspx", false);        
    }
}
