using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class MasterPage2 : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void Page_PreInit(object sender, EventArgs e)
    {
        try
        {
            this.Page.Theme = Session["Theme"].ToString();
        }
        catch
        {
            Response.Redirect("SessionTerminada.aspx", false);
        }
    }
   
    //protected void Timer1_Tick(object sender, EventArgs e)
    //{
    //    UtilesWeb.EjecutaJs(this.ContentPlaceHolder1.Page, " $('#overlay').fadeIn('fast',function(){$('#box').animate({'top':'160px'},500);});");
    //}
    
}
