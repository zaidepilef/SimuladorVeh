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

public partial class _Default : System.Web.UI.Page
{
    protected void Page_PreInit(object sender, EventArgs e)
    {
        try
        {
            this.Theme = "Mapfre";
        }
        catch
        {
            Response.Redirect("SessionTerminada.aspx", false);
        }
    }
    
    protected void Page_Load(object sender, EventArgs e)
    {

    }
}
