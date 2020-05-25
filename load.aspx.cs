using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Configuration;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

public partial class load : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string MM_Cuenta = "";
        string MM_UserAuthorization = "";
        string MM_Agente = "";
        string MM_CuentaMaestra = "";
        string MM_TipoMaestro = "";
        string MM_GUID = "";
        string CONV = "";

        Session.Clear();

        //cl.devetel.pre.devpay.ConsultaMedioPago clase = new  cl.devetel.pre.devpay.ConsultaMedioPago();
        //clase.DevPayConsultaMedioPago("100", "1100");        

        if (Request.QueryString["NUM_RECOT"] == null)
        {

            #region Capturo las variables por FORM

            if (Request.Form["MM_Cuenta"] != null)
                MM_Cuenta = Request.Form["MM_Cuenta"].ToString();

            if (Request.Form["MM_UserAuthorization"] != null)
                MM_UserAuthorization = Request.Form["MM_UserAuthorization"].ToString();

            if (Request.Form["MM_Agente"] != null)
                MM_Agente = Request.Form["MM_Agente"].ToString();

            if (Request.Form["MM_CuentaMaestra"] != null)
                MM_CuentaMaestra = Request.Form["MM_CuentaMaestra"].ToString();

            if (Request.Form["MM_TipoMaestro"] != null)
                MM_TipoMaestro = Request.Form["MM_TipoMaestro"].ToString();

            if (Request.Form["MM_GUID"] != null)
                MM_GUID = Request.Form["MM_GUID"].ToString();

            if (Request.Form["CONV"] != null)
                CONV = Request.Form["CONV"].ToString();

            #endregion

            #region Si no vienen por FORM, deben venir por QueryString
            if (Request.QueryString["MM_Cuenta"] != null)
                MM_Cuenta = Request.QueryString["MM_Cuenta"].ToString();

            if (Request.QueryString["MM_UserAuthorization"] != null)
                MM_UserAuthorization = Request.QueryString["MM_UserAuthorization"].ToString();

            if (Request.QueryString["MM_Agente"] != null)
                MM_Agente = Request.QueryString["MM_Agente"].ToString();

            if (Request.QueryString["MM_CuentaMaestra"] != null)
                MM_CuentaMaestra = Request.QueryString["MM_CuentaMaestra"].ToString();

            if (Request.QueryString["MM_TipoMaestro"] != null)
                MM_TipoMaestro = Request.QueryString["MM_TipoMaestro"].ToString();

            if (Request.QueryString["MM_GUID"] != null)
                MM_GUID = Request.QueryString["MM_GUID"].ToString();

            if (Request.QueryString["CONV"] != null)
                CONV = Request.QueryString["CONV"].ToString();

            if (Request.QueryString["SUPLANTANDO"] != null)
                Session["Suplantando"] = Request.QueryString["SUPLANTANDO"].ToString();

            #endregion

            Session["MM_Cuenta"] = MM_Cuenta.ToString();
            Session["MM_UserAuthorization"] = MM_UserAuthorization.ToString();
            Session["MM_Agente"] = MM_Agente.ToString();
            Session["MM_CuentaMaestra"] = MM_CuentaMaestra.ToString();
            Session["MM_TipoMaestro"] = MM_TipoMaestro.ToString();
            Session["MM_GUID"] = MM_GUID.ToString();
            Session["CONV"] = CONV.ToString();

            string suplanta = Suplantacion(Session["MM_Cuenta"].ToString());

            Session["suplanta"] = suplanta;

            string es_gap = Tercero.ValidaGAP(Session["MM_Cuenta"].ToString());

            Session["es_gap"] = es_gap;

            if(Session["CONV"].ToString() != "")
                TraeOpciones(Session["CONV"].ToString());
            else
                TraeOpciones(Session["MM_Cuenta"].ToString());

            Session["mca_tmarketing"] = Cotiza.OpcionesTMarketing(Session["CONV"].ToString(), Session["MM_Cuenta"].ToString(), ConfigurationManager.AppSettings["Producto"].ToString());
            //Session["mca_tmarketing"] = "N";
            Session["id_tmarketing"] = "";
            //Session["mca_tmarketing_PopUp"] = Cotiza.OpcionesTMarketingPopUp(Session["CONV"].ToString(), Session["MM_Cuenta"].ToString(), ConfigurationManager.AppSettings["Producto"].ToString());
            Session["mca_tmarketing_PopUp"] = "N";

            ValidaMcaMel(Session["MM_Cuenta"].ToString(), Session["CONV"].ToString());

            //        string GOOGLE_ANALYTICS_JAVASCRIPT =
            //        @" 
            //        <script type=""text/javascript"">
            //        var gaJsHost = ((""https:"" == document.location.protocol) ? ""https://ssl."" : ""http://www."");
            //        document.write(unescape(""%3Cscript src='"" + gaJsHost + ""google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E""));
            //        </script>
            //        <script type=""text/javascript"">
            //        try {
            //        var pageTracker = _gat._getTracker(""UA-10331915-1"");
            //        pageTracker._trackPageview();
            //        } catch(err) {}
            //        </script>
            //        ";
            //Page.RegisterClientScriptBlock("GoogleAnalytics",GOOGLE_ANALYTICS_JAVASCRIPT); 
            if (Session["CONV"].ToString() != "")
                Session["LOAD_URL"] = "load.aspx?MM_Cuenta=" + Session["MM_Cuenta"].ToString() + "&conv=" + Session["CONV"];
            else
                Session["LOAD_URL"] = "load.aspx?MM_Cuenta=" + Session["MM_Cuenta"].ToString();


				if (Session["CONV"].ToString() == "AUTOANTIGUO")
	            Response.Redirect("Cotizador.aspx", false);
				else
				{
					if(Session["CONV"].ToString() != "")
						Response.Redirect("Cotizador.aspx", false);
					else
                        Response.Redirect("Cotizador.aspx", false);
				}


        }
        else
        {
            Session["num_recotizacion"] = Request.QueryString["NUM_RECOT"].ToString();

            TraeDatosCotizacion(Session["num_recotizacion"].ToString());
            Session.Remove("MCA_MEL");

            Response.Redirect("CargaCotizacion.aspx", false);
        }
    }

    public void TraeOpciones(string cod_conv)
    {
        DataSet Opciones = new DataSet();
        Opciones = Cotiza.OpcionesCotizador(cod_conv);

        Session["mca_descuento"] = Vehiculo.ValidaDescuentosOpcionales(Session["MM_Cuenta"].ToString());

        for (int i = 0; i < Opciones.Tables[0].Rows.Count; i++)
        {
            Session["Theme"] = Opciones.Tables[0].Rows[0]["NOM_CSS"].ToString();

            Session["mca_descuento"] = Opciones.Tables[0].Rows[0]["MCA_DESCUENTO"].ToString();
            Session["mca_recargo"] = Opciones.Tables[0].Rows[0]["MCA_RECARGO"].ToString();

            Session["mca_emite"] = Opciones.Tables[0].Rows[0]["MCA_EMITE"].ToString();
            Session["opc_cuotas"] = Opciones.Tables[0].Rows[0]["OPC_CUOTAS"].ToString();
            Session["opc_pat"] = Opciones.Tables[0].Rows[0]["OPC_PAT"].ToString();
            Session["opc_pac"] = Opciones.Tables[0].Rows[0]["OPC_PAC"].ToString();
            Session["opc_checked"] = Opciones.Tables[0].Rows[0]["OPC_CHECKED"].ToString();
            Session["opc_cob_opc"] = Opciones.Tables[0].Rows[0]["OPC_COB_OPC"].ToString();
            Session["opc_cob"] = Opciones.Tables[0].Rows[0]["OPC_COB"].ToString();
            Session["opc_soap"] = Opciones.Tables[0].Rows[0]["OPC_SOAP"].ToString();
            Session["opc_fecha_variable"] = Opciones.Tables[0].Rows[0]["OPC_FECHA_VARIABLE"].ToString();
        }

        if (Session["Theme"] == null)
            Session["Theme"] = "Mapfre";

        if (Session["mca_descuento"] == null)
            Session["mca_descuento"] = "N";

        if (Session["mca_recargo"] == null)
            Session["mca_recargo"] = "S";

        if (Session["mca_emite"] == null)
            Session["mca_emite"] = "S";

        if (Session["opc_cuotas"] == null)
            Session["opc_cuotas"] = "S";

        if (Session["opc_pat"] == null)
            Session["opc_pat"] = "S";

        if (Session["opc_pac"] == null)
            Session["opc_pac"] = "N";

        if (Session["opc_checked"] == null)
            Session["opc_checked"] = "CuotasMapfre";

        if (Session["opc_cob_opc"] == null)
            Session["opc_cob_opc"] = "S";

        if (Session["opc_cob"] == null)
            Session["opc_cob"] = "S";

        if (Session["opc_soap"]== null)
            Session["opc_soap"] = "N";

        if (Session["opc_fecha_variable"] == null)
            Session["opc_fecha_variable"] = "N";
    }

    public string Suplantacion(string cod_docum)
    {
        DataRow Suplanta = null;
        Suplanta = Cotiza.ValidaSuplantacion(cod_docum);

        return Suplanta["P_RESPUESTA"].ToString();
    }

    public void TraeDatosCotizacion(string num_cotizacion)
    {
        DataRow Opciones = null;
        Opciones = Cotiza.CargaDatosConvenioCot(num_cotizacion);

        Session["MM_Cuenta"] = Opciones["p_cod_docum_mae"].ToString();
        Session["CONV"] = Opciones["p_cod_conv"].ToString();

        TraeOpciones(Session["CONV"].ToString());

    }

    public void ValidaMcaMel(string cod_docum, string cod_conv)
    {
        DataRow Opciones = null;
        Opciones = Cotiza.ValidaMcaMel(cod_docum, cod_conv);

        Session["VALIDA_MCA_MEL"] = Opciones["P_VALIDA_MCA_MEL"].ToString();
        Session["MCA_MEL"] = Opciones["P_MCA_MEL"].ToString();

    }

}