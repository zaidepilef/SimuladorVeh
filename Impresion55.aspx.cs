using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Threading;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using SOAPWS;

public partial class Impresion55 : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            
			string link = Emitir.ImprimirPoliza("8011600094350");

        //link = FirmaDigital.FirmaDocumento(link);

        string url = ConfigurationManager.AppSettings["Server"] + "/pdf/";

        link = url + link + ".PDF";

        Thread.Sleep(3000);

        if (link != "ERROR")

			   UtilesWeb.OpenNewWindow(Page, "https://mel.mapfre.cl/Productos/Comun/ImpresorFirma.aspx?poliza=" + link );
        else
        {
            UtilesWeb.EjecutaJs(this, "alert('Se registro un error al momento de generar su poliza, intentalo de nuevo mas tarde.');");
            return;
        }

        }

    }

    

    protected void ImgImprimirPoliza_Click(object sender, ImageClickEventArgs e)
    {
        string link = Emitir.ImprimirPoliza(this.lblNumPoliza.Text);

        //link = FirmaDigital.FirmaDocumento(link);

        string url = ConfigurationManager.AppSettings["Server"] + "/pdf/";

        link = url + link + ".PDF";

        Thread.Sleep(3000);

        if (link != "ERROR")
            //UtilesWeb.OpenNewWindow(Page, link);
			   UtilesWeb.OpenNewWindow(Page, "https://mel.mapfre.cl/Productos/Comun/ImpresorFirma.aspx?poliza=" + link );
        else
        {
            UtilesWeb.EjecutaJs(this, "alert('Se registro un error al momento de generar su poliza, intentalo de nuevo mas tarde.');");
            return;
        }
    }

    protected void ImgImprimirMandato_Click(object sender, ImageClickEventArgs e)
    {
        string link = Emitir.ImprimirMandato(this.hdnNumCotizacion.Value);

        string url = ConfigurationManager.AppSettings["Server"] + "/pdf/";

        link = url + link;

        Thread.Sleep(5000);

        UtilesWeb.OpenNewWindow(Page, link);
    }
    protected void ImgNuevaCotizacion_Click(object sender, ImageClickEventArgs e)
    {
        //Response.Redirect("Cotizador.aspx",false);
        Response.Redirect(Session["LOAD_URL"].ToString());
    }
    protected void ImgImprimirSOAP_Click(object sender, ImageClickEventArgs e)
    {
        string link = ((datospoliza[])Session["datospoliza"])[0].UrlPoliza;
        UtilesWeb.OpenNewWindow(Page, link);
    }
    
}
