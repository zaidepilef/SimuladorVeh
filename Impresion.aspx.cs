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

public partial class Impresion : System.Web.UI.Page
{
    protected void Page_PreInit(object sender, EventArgs e)
    {
        try
        {
            this.Theme = Session["Theme"].ToString();
        }
        catch
        {
            Response.Redirect("SessionTerminada.aspx", false);
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
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

                Response.Redirect("SessionTerminada.aspx",false);
            }

            if (PolVeh.ErrorEmision == "POLIZA RETENIDA, CONTROL TECNICO")
            {
                lblNumPoliza.Text = PolVeh.NumPoliza;
                lblEstado.Text = "POLIZA RETENIDA, CONTROL TÉCNICO";
                ImgImprimirPoliza.Visible = false;
            }
            else
            {
                lblNumPoliza.Text = PolVeh.NumPoliza;
                lblEstado.Text = "VIGENTE";
                ImgImprimirPoliza.Visible = true;
            }

            hdnNumCotizacion.Value = PolVeh.NumCotizacion;

            if (PolVeh.FormaPago == "TA")
            {
                ImgImprimirMandato.Visible = true;
            }
            else
            {
                ImgImprimirMandato.Visible = false;
            }
            if (Session["opc_soap"].ToString() == "S")
            {
                if (((datospoliza[])Session["datospoliza"])[0].UrlPoliza != "")
                    ImgImprimirSOAP.Visible = true;
                else
                    ImgImprimirSOAP.Visible = false;

                if (((datospoliza[])Session["datospoliza"])[0].NumPoliza == "")
                    ImgImprimirSOAP.Visible = false;               
                
            }
            else
                ImgImprimirSOAP.Visible = false;


            DateTime thisDate = DateTime.Now.Date;
            lblFecha.Text = thisDate.ToString("dd/MM/yyyy");

            //Emitir.ActualizaNumPoliza(PolVeh.NumCotizacion, PolVeh.NumPoliza);

            GuardaMailTercero(PolVeh.CodDocumAseg, PolVeh.EmailAseg);

            GuardaMailTercero(PolVeh.CodDocumTomad, PolVeh.EmailTomad);

        }

    }

    protected void GuardaMailTercero(string cod_docum, string email)
    {
        DataRow objmailaseg = Tercero.GuardaEmailTer(cod_docum, email);
    }

    protected void ImgImprimirPoliza_Click(object sender, ImageClickEventArgs e)
    {
        /*string link = Emitir.ImprimirPoliza(this.lblNumPoliza.Text);

        //link = FirmaDigital.FirmaDocumento(link);

        string url = ConfigurationManager.AppSettings["Server"] + "/pdf/";

        link = url + link + ".PDF";

        Thread.Sleep(3000);
        */

        string link = ConfigurationManager.AppSettings["Server"] + "/Productos/Comun/ImpresorSuplPDF.aspx?cod_cia=1&poliza=" + this.lblNumPoliza.Text + "&spto=0&apli=0&spto_apli=0";

        if (link != "ERROR")
            UtilesWeb.OpenNewWindow(Page, link);
			//UtilesWeb.OpenNewWindow(Page, "https://mel.mapfre.cl/Productos/Comun/ImpresorFirma.aspx?poliza=" + link );
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
