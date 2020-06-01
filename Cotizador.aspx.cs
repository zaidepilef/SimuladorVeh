using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Globalization;
using System.Threading;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using SOAPWS;
using System.Collections.Generic;

public partial class Cotizador : System.Web.UI.Page
{
    static int flag = 0;  //06_06 bandera temporal
    static string[] deducible = { "1", "2", "3", "4", "5", "6", "7", "8", "9", "10" };
    static List<string> lista = new List<string>();
    string RutCorredor = "";
    protected void Page_PreInit(object sender, EventArgs e)
    {
        try
        {
            if (Session["es_gap"].ToString() == "SI")
            {
                if (Session["MCA_MEL"].ToString() == "N")
                    this.Theme = "TronWeb";
                else
                    this.Theme = "GAP";
            }
            else
            {
                if (Session["MCA_MEL"] == null)
                {
                    this.Theme = Session["Theme"].ToString();
                }
                else
                {
                    if (Session["MCA_MEL"].ToString() == "N")
                        this.Theme = "TronWeb";
                    else
                        this.Theme = Session["Theme"].ToString();
                }
            }


        }
        catch
        {
            Response.Redirect("SessionTerminada.aspx", false);
        }
    }


    //INTEGRACION INTEGRACION  CAMPAÑA COMERCIAL VENTA CRUZADA

    public String topeDscto
    {
        get
        {
            object o = ViewState["topeDscto"];
            return (o == null) ? String.Empty : (string)o;
        }

        set
        {
            ViewState["topeDscto"] = value;
        }
    }

    public String sumaTotalPorcDsctos
    {
        get
        {
            object o = ViewState["sumaTotalPorcDsctos"];
            return (o == null) ? String.Empty : (string)o;
        }

        set
        {
            ViewState["sumaTotalPorcDsctos"] = value;
        }
    }


    public String porcDsctoCruzado
    {
        get
        {
            object o = ViewState["porcDsctoCruzado"];
            return (o == null) ? String.Empty : (string)o;
        }

        set
        {
            ViewState["porcDsctoCruzado"] = value;
        }
    }

    public String porcDsctoFamiliar
    {
        get
        {
            object o = ViewState["porcDsctoFamiliar"];
            return (o == null) ? String.Empty : (string)o;
        }

        set
        {
            ViewState["porcDsctoFamiliar"] = value;
        }
    }

    public String porcDsctoAgendaVencida
    {
        get
        {
            object o = ViewState["porcDsctoAgendaVencida"];
            return (o == null) ? String.Empty : (string)o;
        }

        set
        {
            ViewState["porcDsctoAgendaVencida"] = value;
        }
    }

    public Boolean RowDsctoVentaCruzada
    {
        get
        {
            object o = ViewState["RowDsctoVentaCruzada"];
            return (o == null) ? false : (Boolean)o;
        }

        set
        {
            ViewState["RowDsctoVentaCruzada"] = value;
        }
    }

    public Boolean RowDsctoFamiliar
    {
        get
        {
            object o = ViewState["RowDsctoFamiliar"];
            return (o == null) ? false : (Boolean)o;
        }

        set
        {
            ViewState["RowDsctoFamiliar"] = value;
        }
    }

    public Boolean RowDsctoAgendaVencida
    {
        get
        {
            object o = ViewState["RowDsctoAgendaVencida"];
            return (o == null) ? false : (Boolean)o;
        }

        set
        {
            ViewState["RowDsctoAgendaVencida"] = value;
        }
    }

    //FIN INTEGRACION  CAMPAÑA COMERCIAL VENTA CRUZADA


    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            //Response.Write(Session.SessionID.ToString());

            //Session["mca_emite"]="N";

            //test CJ 12-04-2018
            //tblrowCuota.Visible = true;
            ////tblrowPrimaTotalDsctos.Visible = true;
            //tblrowValorRef.Visible = true;
            //tblrowSelModalidades.Visible = true;
            tblrowPrimaNeta.Visible = true;
            //tblrowPrimaComision.Visible = true;
            //tblrowDescuento.Visible = true;
            //tblrowRecargo.Visible = true;
            //tblrowDsctosCampanaComercial.Visible = true;
        

            if (!this.IsPostBack)
            {
                if (Session["MM_Cuenta"].ToString() == "")
                {
                    Response.Redirect("SessionTerminada.aspx", false);
                }

                
                
                //FirmaDigital.FirmaDocumentoSimple("nom_archivo");
                PanelMarketing.Visible = true;

                Session["MCA_MEL"] = "S";
                PanelMELTW.Visible = false;

                // #CCE
                Session["Cotizacion"] = "Y";
                // #CCE

                if (Session["CONV"].ToString() == "AUTOANTIGUO")
                {
                    PanelMELTW.Visible = false;
                    PanelAutoAntiguo.Visible = true;
                    chkVehFact48.Visible = false;
                }

                if (Session["VALIDA_MCA_MEL"].ToString() == "S")
                {
                    if (Session["MCA_MEL"].ToString() == "")
                    {
                        PanelMELTW.Visible = true;
                    }
                    else
                    {
                        PanelMELTW.Visible = false;
                    }

                    if (Session["CONV"].ToString() == "AUTOANTIGUO")
                    {
                        PanelMarketing.Visible = false;
                        PanelMELTW.Visible = false;
                        PanelAutoAntiguo.Visible = true;
                        chkVehFact48.Visible = false;
                        UpdatePanelAutoAntiguo.Visible = true;
                        rbtFranquiciaNo.Checked = true;
                        Image28.Visible = false;
                        //Image27.Visible = false;
                    }
                }
                else
                {
                    PanelMELTW.Visible = false;

                    if (Session["CONV"].ToString() != "AUTOANTIGUO")
                    {
                        OpcCoberturasAutoAntiguo.Visible = false;
                    }

                    if (Session["CONV"].ToString() == "AUTOANTIGUO")
                    {
                        PanelMELTW.Visible = false;
                        PanelAutoAntiguo.Visible = true;
                        chkVehFact48.Visible = false;
                    }
                }

                //this.Timer1.Enabled = false;
                //this.Timer2.Enabled = false;                

                if (Session["mca_tmarketing"].ToString() == "S")
                    this.trDatosSeguimiento.Visible = true;
                else
                    this.trDatosSeguimiento.Visible = false;

                if (Session["mca_tmarketing_PopUp"].ToString() == "S")
                {
                    if (Session["id_tmarketing"].ToString() == "")
                    {
                        this.PanelMarketing.Visible = true;
                    }
                    else
                    {
                        this.PanelMarketing.Visible = false;
                    }
                }
                else
                    this.PanelMarketing.Visible = false;

                Session["COD_DOCUM"] = Session["MM_Cuenta"].ToString();

                Session["SelModalidades"] = null;
                Session["PolVeh"] = null;

                txtNumMatricula.Focus();
                tblResultados.Visible = false;
                tblDescRec.Visible = false;

                if (Session["FechaIniVigenciaSel"] != null)
                {
                    hdnMinVigenciaSel.Value = Session["FechaIniVigenciaSel"].ToString();
                }

                if (Session["opc_cob_opc"].ToString() == "S")
                {
                    Opc_CoberturasOpcionales.Visible = true;

                    if (Session["CONV"].ToString() == "AUTOANTIGUO")
                        Opc_CoberturasOpcionales.Visible = false;
                    else
                        OpcCoberturasAutoAntiguo.Visible = false;
                }
                else
                {
                    Opc_CoberturasOpcionales.Visible = false;
                }


                if (Session["opc_fecha_variable"].ToString() == "S")
                {
                    DatosVigenciaEmisor.Visible = true;
                }
                else
                    DatosVigenciaEmisor.Visible = false;


                if (Session["opc_cob"].ToString() == "S")
                {
                    Opc_Coberturas.Visible = true;

                    if (Session["CONV"].ToString() == "AUTOANTIGUO")
                    {
                        Opc_Coberturas.Visible = false;

                        OpcCoberturasAutoAntiguo.Visible = true;
                    }
                }
                else
                {
                    Opc_Coberturas.Visible = false;
                }
                if (Session["mca_recargo"].ToString() == "S")
                {
                    tdRecargo.Visible = true;//FMOUAT
                    tblrowRecargo.Visible = false;
                }
                else
                {
                    tdRecargo.Visible = false;
                    tblrowRecargo.Visible = false;
                }

                if (Session["mca_descuento"].ToString() == "S")
                {
                    tdDscto.Visible = true;//FMOUAT
                    tblrowDescuento.Visible = false;
                    Vehiculo.getDescuentosOpcionales(this.drpDescuento1, Session["COD_DOCUM"].ToString());
                }
                else
                {
                    tdDscto.Visible = false;
                    tblrowDescuento.Visible = false;
                }

                trDifPersona.Visible = false;
                trDatosTomad.Visible = false;

                drpEdad.Visible = false;
                lblEdadConductor.Visible = false;

                //ImgEnviarMail.Visible = false;
                EnviarCorreo.Visible = false;
                EnviarCorreo_Exitoso.Visible = false;

                //tblrowSelModEmitir.Visible = false;

                tblBotonera.Visible = false;
                //CoberturasOpcionales.Visible = false;

                if (Session["suplanta"].ToString() == "SI")
                    ImgMuestraSuplanta.Visible = true;
                else
                    ImgMuestraSuplanta.Visible = false;

                //ImgMuestraSuplanta.Visible = true;

                lblNomCuenta.Text = Tercero.DatosCuenta(Session["COD_DOCUM"].ToString());

                PanelSuplanta.Visible = false;

                tblrowValorRef.Cells[0].ColumnSpan = 11;

                tblrowValorRef.Cells[0].Text = ConfigurationManager.AppSettings["TextoValorReferencial"];

                tblDifPersona.Visible = false;

                Vehiculo.Carga_Marcas(this.drpMarca);

                //Mantis 126449
                hdnMinVigencia.Value = ConfigurationManager.AppSettings["DiaVigenciaSinFactura"].ToString();

                int AntiguedadVeh = Convert.ToInt32(ConfigurationManager.AppSettings["AntiguedadVeh"]);
                int AntiguedadAutoAntiguoMax = Convert.ToInt32(ConfigurationManager.AppSettings["AntiguedadAutoAntiguoMax"]);
                int AntiguedadAutoAntiguoMin = Convert.ToInt32(ConfigurationManager.AppSettings["AntiguedadAutoAntiguoMin"]);

                if (Session["CONV"] != null && Session["CONV"].ToString() == "AUTOANTIGUO")
                {
                    chkVehFact48.Visible = false;
                    this.drpAño = CargaAñosAntiguodrp(this.drpAño, AntiguedadAutoAntiguoMin, AntiguedadAutoAntiguoMax);
                }
                else
                {
                    this.drpAño = CargaAñosdrp(this.drpAño, AntiguedadVeh);
                }

                int edad_minima = Convert.ToInt32(ConfigurationManager.AppSettings["EdadMinima"]);
                int edad_maxima = Convert.ToInt32(ConfigurationManager.AppSettings["EdadMaxima"]);
                UtilesWeb.Carga_Edad(drpEdad, edad_minima, edad_maxima);

                if (Session["MCA_MEL"].ToString() == "S")
                    this.chk8133.Checked = true;
                else
                    this.chk8133.Checked = false;

                if (Session["CONV"].ToString() == "RIPLEYBI" || Session["CONV"].ToString() == "RIPLEY" || Session["CONV"].ToString() == "RIPLEYCALL")
                {
                    //PolVeh.NumCuota = "15";
                    this.chk8133.Checked = false;
                    Cobranza.PlanesPagoRipley(drpValCuota);
                }
                else
                {
                    /*Cobranza.PlanesPago(drpValCuota);
                    Cobranza.PlanesPago(drpValCuotaPAT);
                    this.drpValCuota.SelectedIndex = 1;
                    this.drpValCuotaPAT.SelectedIndex = 1;

                    if (Session["CONV"].ToString() == "13MESES")
                        this.drpValCuotaPAT.Enabled = false;*/
                    this.drpValCuota.SelectedIndex = 5;
                    this.drpValCuotaPAT.SelectedIndex = 5;

                    if (Session["CONV"].ToString() == "COMPARA")
                    {
                        /*if (rdbPAC.Checked)
                            Cobranza.PlanesPagoCompara(drpPlanPago, "DB");
                        else*/
                        Cobranza.PlanesPagoCompara(drpValCuotaPAT, "");
                    }
                    else
                    {
                        if (Session["CONV"].ToString() != "")
                        {
                            string codRamo = "801";
                            if (Session["CONV"].ToString() == "AUTOANTIGUO")
                                codRamo = "809";

                            /*if (this.rdbCuotasMapfre.Checked)
                                Cobranza.PlanesPagoConvenio(drpPlanPago, "1", codRamo, "GD", "99999", PolVeh.Convenio);*/

                            /*if (this.rdbPAT.Checked)*/
                            Cobranza.PlanesPagoConvenio(drpValCuotaPAT, "1", codRamo, "TA", "99999", Session["CONV"].ToString());

                            if (drpValCuotaPAT.Items.Count == 0)
                            {
                                Cobranza.PlanesPago(drpValCuotaPAT);
                            }
                        }
                        else
                        {
                            Cobranza.PlanesPago(drpValCuotaPAT);
                        }
                    }
                    if (Session["CONV"].ToString() == "COMPARA")
                    {
                        this.drpValCuotaPAT.SelectedIndex = 5;
                        this.drpValCuotaPAT.Enabled = false;
                    }
                }

                this.chkExGar.Visible = false;

                ValidaEscondeOpcionesMEL();

                EscondeResultados();

                DateTimeFormatInfo d = new CultureInfo("es-CL", false).DateTimeFormat;

                DateTime hoy = DateTime.Now;
                DateTime limite = new DateTime(2014, 04, 01);

                int compar = hoy.CompareTo(limite);

                //if (compar < 0)
                this.ImgMel13.Visible = true;
                //else
                //    this.ImgMel13.Visible = false;

                //tdCuadroCom.Visible = false;
                //drpCuadroCom1.Visible = false;

                if (Session["VALIDA_MCA_MEL"].ToString() == "S")
                {
                    if (Session["MCA_MEL"].ToString() != "")
                    {
                        if (Session["CONV"].ToString() == "")
                        {
                            //UtilesWeb.OpenNewWindow(Page, "pop_up.html", "598", "615", "0", "0");
                            string winFeatures = "location=0,status=0,directories=0,menubar=no,scrollbars=0,width=600,height=600,top=150,left=350";
                            ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "newWindow", "window.open('pop_up.html','_blank','" + winFeatures + "');", true);

                        }
                    }
                }

                //INTEGRACION  CAMPAÑA CMERCIAL VENTA CRUZADA
                try
                {

                    string cod_ramo = "801";
                    if (Session["CONV"].ToString() == "AUTOANTIGUO")
                        cod_ramo = "809";


                    DataRow dr = Cotiza.GetTopeDescuentoagt(cod_ramo, Session["COD_DOCUM"].ToString());

                    if (dr != null && dr["P_TOPE_DSCTO"] != null)
                    {
                        topeDscto = dr["P_TOPE_DSCTO"].ToString();
                    }

                    ///FDR: aplico la restriccion de AMUNATEGUI 
                    RutCorredor = Session["MM_Cuenta"].ToString();
                    RestringeAmunategui(RutCorredor);

                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }

        }
        catch (Exception ex)
        {
            System.Diagnostics.StackTrace Stack = new System.Diagnostics.StackTrace(ex, true);
            int errorlineno = Stack.GetFrame(0).GetFileLineNumber();
            int errorcol = Stack.GetFrame(0).GetFileColumnNumber();

            if (ex.Message != "Object reference not set to an instance of an object.")
            {
                UtilesWeb.EnviaCorreoAcusete(ex.Message, "Cot. Veh. Livianos - Cotizador.asxp - Page_Load - Linea: " + errorlineno + " - " + errorcol);
            }
            Response.Redirect("SessionTerminada.aspx", false);

        }
    }

    public DropDownList CargaAñosdrp(DropDownList drp, int AñoInicio)
    {
        DateTime date = DateTime.Now;
        int AñoActual = date.Year;
        UtilesWeb.Carga_Anios_DropGenerico(drp, AñoActual - AñoInicio);
        return drp;
    }

    public DropDownList CargaAñosAntiguodrp(DropDownList drp, int AñoInicio, int AñoFin)
    {
        UtilesWeb.Carga_Anios_DropGenerico(drp, AñoInicio, AñoFin);
        return drp;
    }

    protected void rdbDifPersona_CheckedChanged(object sender, EventArgs e)
    {
        if (((RadioButton)sender).Text == "si")
            tblDifPersona.Visible = true;
        else
            tblDifPersona.Visible = false;

        EscondeResultados();
    }

    protected void drpMarca_SelectedIndexChanged(object sender, EventArgs e)
    {

        string cod_marca = UtilesWeb.GetPropertyValue(sender, "SelectedValue");
        this.drpModelo.Items.Clear();

        Vehiculo.Combo_Modelos(this.drpModelo, cod_marca);
        this.drpModelo.SelectedIndex = 0;
        this.drpModelo.Enabled = true;

        this.lblTipVehiculo.Text = "";
        this.lblTituloTipVeh.Text = "";

        ValidaExGarage(cod_marca);

        EscondeResultados();

    }

    protected void drpModelo_SelectedIndexChanged(object sender, EventArgs e)
    {

        string cod_modelo = UtilesWeb.GetPropertyValue(sender, "SelectedValue");
        string cod_marca = this.drpMarca.SelectedValue.ToString();
        this.drpSubModelo.Items.Clear();

        Vehiculo.Combo_SubModelos(this.drpSubModelo, cod_marca, cod_modelo);
        this.drpSubModelo.SelectedIndex = 0;
        this.drpSubModelo.Enabled = true;

        this.lblTipVehiculo.Text = "";
        this.lblTituloTipVeh.Text = "";

        EscondeResultados();

    }

    protected void chkVehFact48_CheckedChanged(object sender, EventArgs e)
    {
        if (((CheckBox)sender).Checked == true)
        {
            if (this.txtNumMatricula.Text == "")
            {
                if (ValidaPatenteAD())
                    this.txtNumMatricula.Text = "A/D";
            }

            //this.txtNumMatricula.ReadOnly = true;
            //this.txtNumMatricula.Enabled = false;
            this.txtNumMatricula.ReadOnly = false;
            this.txtNumMatricula.Enabled = true;
            this.chkCotExpress.Checked = false;
            this.chkCotExpress.Enabled = false;

        }
        else
        {
            //this.txtNumMatricula.Text = "";

            this.txtNumMatricula.ReadOnly = false;
            this.txtNumMatricula.Enabled = true;
            this.chkCotExpress.Enabled = true;
        }

        if (this.chkVehFact48.Checked)
        {
            this.drpAño.Items.Clear();
            this.drpAño = CargaAñosdrp(this.drpAño, 0);
        }
        else
        {
            this.drpAño.Items.Clear();
            int AntiguedadVeh = Convert.ToInt32(ConfigurationManager.AppSettings["AntiguedadVeh"]);
            this.drpAño = CargaAñosdrp(this.drpAño, AntiguedadVeh);
        }

        EnableVeh();
        EscondeResultados();

    }

    protected void txtNomAseg_TextChanged(object sender, EventArgs e)
    {
        this.txtNomAseg.Text = this.txtNomAseg.Text.ToUpper();
        EscondeResultados();
    }

    protected void txtApePatAseg_TextChanged(object sender, EventArgs e)
    {
        this.txtApePatAseg.Text = this.txtApePatAseg.Text.ToUpper();

    }

    protected void txtApeMatAseg_TextChanged(object sender, EventArgs e)
    {
        this.txtApeMatAseg.Text = this.txtApeMatAseg.Text.ToUpper();

    }


    protected void DsctoFamiliar()
    {
        try
        {
            RowDsctoFamiliar = false;
            porcDsctoFamiliar = "";
            string cod_docum_familiar = this.txtCodDocumFamiliar.Text.ToUpper().Trim().Replace("-", "").Replace(".", "");
            string CodDocumAseg = this.txtCodDocumAseg.Text.ToUpper().Trim().Replace("-", "").Replace(".", "");

            if (UtilesWeb.ValidaRUT(cod_docum_familiar) == false)
            {
                //ScriptManager1.SetFocus(txtCodDocumAseg);
                this.txtCodDocumFamiliar.Text = "";
                UtilesWeb.EjecutaJs(this, "alert('El Rut ingresado no es válido, favor corregir');");
                EscondeResultados();
                RowDsctoFamiliar = false;
                drpTipoFamiliar.SelectedIndex = 0;
                return;
            }
            if (UtilesWeb.DV_RUT(cod_docum_familiar) == false)
            {
                //ScriptManager1.SetFocus(txtCodDocumAseg);
                this.txtCodDocumFamiliar.Text = "";
                UtilesWeb.EjecutaJs(this, "alert('El Rut ingresado no es válido, favor corregir');");
                EscondeResultados();
                RowDsctoFamiliar = false;
                drpTipoFamiliar.SelectedIndex = 0;
                return;
            }
            if (cod_docum_familiar == CodDocumAseg)
            {
                //ScriptManager1.SetFocus(txtCodDocumAseg);
                this.txtCodDocumFamiliar.Text = "";
                UtilesWeb.EjecutaJs(this, "alert('El Rut ingresado del familiar debe ser distinto al del Asegurado , favor corregir');");
                EscondeResultados();
                RowDsctoFamiliar = false;
                drpTipoFamiliar.SelectedIndex = 0;
                return;
            }
            this.txtCodDocumFamiliar.Text = UtilesWeb.getFormated(cod_docum_familiar.ToUpper());

            //if (drpTipoFamiliar.SelectedValue == "0")
            //{
            //    UtilesWeb.EjecutaJs(this, "alert('" + drpTipoFamiliar.ToolTip + "');");
            //    return;
            //}


            string cod_ramo = "801";
            if (Session["CONV"].ToString() == "AUTOANTIGUO")
                cod_ramo = "809";

            DataRow drDctoFam = Cotiza.DsctoFamiliar(cod_ramo, cod_docum_familiar);
            tblrowDsctoFamiliar.Visible = false;
            if (drDctoFam != null && drDctoFam["p_resultado"].ToString() == "S")
            {
                porcDsctoFamiliar = ValidaTotalDsctoAplicar(drDctoFam["p_dscto"].ToString());
                actualizaSumaTotalDsctos();
                lbltblrowDsctoFamiliar.Text = "(-" + Convert.ToString(Convert.ToDecimal(porcDsctoFamiliar) ) + "%)";
                //tblrowDsctoFamiliar.Visible = true;
                RowDsctoFamiliar = true;
            }
            EscondeResultados();
        }
        catch (Exception ex)
        {
            porcDsctoFamiliar = "";
            actualizaSumaTotalDsctos();
            drpTipoFamiliar.SelectedIndex = 0;
            RowDsctoFamiliar = false;          
            EscondeResultados();
        }
    }

    private void actualizaSumaTotalDsctos()
    {
        sumaTotalPorcDsctos = "0";

        if (!String.IsNullOrEmpty(porcDsctoFamiliar))
            sumaTotalPorcDsctos = (Convert.ToDecimal(sumaTotalPorcDsctos.Replace(".", ",")) + Convert.ToDecimal(porcDsctoFamiliar.Replace(".", ","))).ToString();
        if (!String.IsNullOrEmpty(porcDsctoCruzado))
            sumaTotalPorcDsctos = (Convert.ToDecimal(sumaTotalPorcDsctos.Replace(".", ",")) + Convert.ToDecimal(porcDsctoCruzado.Replace(".", ","))).ToString();
        if (!String.IsNullOrEmpty(porcDsctoAgendaVencida))
            sumaTotalPorcDsctos = (Convert.ToDecimal(sumaTotalPorcDsctos.Replace(".", ",")) + Convert.ToDecimal(porcDsctoAgendaVencida.Replace(".", ","))).ToString();
      
        
        string sumaTotalPorcDsctosLabel = "-" + (Convert.ToDecimal(sumaTotalPorcDsctos.Replace(".", ",") )).ToString();

        lbltblrowDsctoCampanaComercial.Text = "(" + sumaTotalPorcDsctosLabel + "%)";
    }

    private String ValidaTotalDsctoAplicar(String porc)
    {
        actualizaSumaTotalDsctos();

        String porcentaje = "";
        if ((Convert.ToDecimal(sumaTotalPorcDsctos.Replace(".", ",")) + Convert.ToDecimal(porc.Replace(".", ","))) <= Convert.ToDecimal(topeDscto.Replace(".", ",")))
        {
            porcentaje = porc;
        }
        else
        {
            porcentaje = (Convert.ToDecimal(topeDscto.Replace(".", ",")) - Convert.ToDecimal(sumaTotalPorcDsctos.Replace(".", ","))).ToString();
        }

        return porcentaje;
    }

    protected void txtCodDocumFamiliar_TextChanged(object sender, EventArgs e)
    {
        DsctoFamiliar();
    }

    protected void txtCodDocumAseg_TextChanged(object sender, EventArgs e)
    {
        try
        {
            DateTime dtime = new DateTime();
            dtime = DateTime.Now;

            string cod_docum_aseg = this.txtCodDocumAseg.Text.ToUpper().Trim().Replace("-", "").Replace(".", "");

            if (UtilesWeb.ValidaRUT(cod_docum_aseg) == false)
            {
                //ScriptManager1.SetFocus(txtCodDocumAseg);
                this.txtCodDocumAseg.Text = "";
                UtilesWeb.EjecutaJs(this, "alert('El Rut ingresado no es válido, favor corregir');");
                EscondeResultados();
                return;
            }
            if (UtilesWeb.DV_RUT(cod_docum_aseg) == false)
            {
                //ScriptManager1.SetFocus(txtCodDocumAseg);
                this.txtCodDocumAseg.Text = "";
                UtilesWeb.EjecutaJs(this, "alert('El Rut ingresado no es válido, favor corregir');");
                EscondeResultados();
                return;
            }

            if (Tercero.ClienteBloqueado(cod_docum_aseg))
            {
                //SetCodDocumAseg(cod_docum_aseg);

                string tip_rut = UtilesWeb.ValidaJuridico(cod_docum_aseg);

                // Req 0018587
                //if (tip_rut == "J")
                //{
                //    this.txtCodDocumAseg.Text = "";
                //    UtilesWeb.EjecutaJs(this, "alert('El RUT no corresponde a vehiculos particulares, comunicate con tu ejecutivo.');");
                //    return;
                //}


                Poliza PolVeh = Poliza.CargaPoliza();

                DataRow DataBussines = Cotiza.LlamaDataBussines("1", "801", PolVeh.Convenio, cod_docum_aseg);

                PolVeh.TipoDescuentoDataBusiness = DataBussines["P_TIPO_DESC"].ToString();
                PolVeh.DescuentoDataBusiness = DataBussines["P_DESC"].ToString();


                this.txtNomAseg.Text = "";
                this.txtApePatAseg.Text = "";
                this.txtApeMatAseg.Text = "";
                this.txtNomAseg.Enabled = true;
                this.txtApePatAseg.Enabled = true;
                this.txtApeMatAseg.Enabled = true;
                this.drpSexo.SelectedIndex = 1;

                DataRow datos_tercero = null;
                datos_tercero = Tercero.DatosTercero(cod_docum_aseg);

                DataRow datosterceroTW = Tercero.DatosTerceroTronWeb(cod_docum_aseg);

                if (datos_tercero["P_ERROR"].ToString() == "0" || datos_tercero["P_ERROR"].ToString() == "OK")
                {
                    UtilesWeb.Asigna_dat_block(datos_tercero, this.txtNomAseg, "P_NOM_TERCEO");

                    UtilesWeb.Asigna_dat_block(datos_tercero, this.txtApePatAseg, "P_APE_PATERNO");

                    UtilesWeb.Asigna_dat_block(datos_tercero, this.txtApeMatAseg, "P_APE_MATERNO");

                    SetCodDocumAseg(cod_docum_aseg, datos_tercero["P_SEXO"].ToString(), datos_tercero["P_EDAD"].ToString());

                    //UtilesWeb.selected_block(this.drpEdad, datos_tercero["P_EDAD"].ToString(), true, lblEdadConductor);

                    //UtilesWeb.selected_block(this.drpSexo, datos_tercero["P_SEXO"].ToString());

                    if (datosterceroTW != null)
                        if (datosterceroTW["TLF_NUMERO"].ToString() != "0" && datosterceroTW["TLF_NUMERO"].ToString() != "")
                            this.txtFonoAseg.Text = datosterceroTW["TLF_NUMERO"].ToString();
                }

                if (tip_rut == "J")
                {
                    // Req 0018587
                    //this.drpEdad.Visible = false;
                    //this.lblEdadConductor.Visible = false;
                    //UtilesWeb.selected_block(this.drpEdad, "30", true, lblEdadConductor);
                    //UtilesWeb.selected_block(this.drpSexo, "0");
                }

                /* Que no traiga estos datos, por sol de Samaniego Leon, Juan Carlos 
                if (Session["mca_tmarketing"].ToString() == "S")
                {
                    DataRow datostercerotw = Tercero.DatosTerceroTronWeb(cod_docum_aseg);

                    if (datostercerotw != null)
                    {
                        UtilesWeb.Asigna_dat(datostercerotw, this.txtFonoAseg, "TLF_NUMERO");
                        UtilesWeb.Asigna_dat(datostercerotw, this.txtEmailAseg, "NOM_EMAIL");
                    }
                }
                */

                EscondeResultados();
            }
            else
            {
                this.txtCodDocumAseg.Text = "";
                UtilesWeb.EjecutaJs(this, "alert('El RUT se encuentra bloqueado, comunicate con tu ejecutivo.');");
                EscondeResultados();
                return;
            }
        }
        catch
        {
            this.txtCodDocumAseg.Text = "";
            UtilesWeb.EjecutaJs(this, "alert('El Rut ingresado no es válido, favor corregir');");
            EscondeResultados();
            return;
        }

    }

    protected void btnCalcular_Click(object sender, EventArgs e)
    {
        try
        {
            if (ValidaIngresoCampos())
            {
                flag = 0;
                ValidaTMarketing();
                Cotizar();
                EscondeCotizar();
                EscondeEmitir();
                ValidaEscondeOpcionesMEL();
                EscondeAvisoVencimiento();

                try
                {

                    System.Globalization.NumberFormatInfo nfi1 = new System.Globalization.NumberFormatInfo();
                    nfi1.NumberDecimalSeparator = ",";

                    decimal prima = Convert.ToDecimal(lblPrimaTotal1.Text.Replace(".", ","), nfi1);
	
					if (prima > 140)
                    {
                        EscondeResultados();
                        UtilesWeb.EjecutaJs(this, "alert('Prima excede politica de suscripción. Pongase en contacto con su ejecutivo');");
                    }
                }
                catch (Exception ex)                
                {
                    Logs.writeToLogFile("Error " + ex.Message.ToString());
                
                }
                
               if (Session["VALIDA_MCA_MEL"].ToString() == "S")
                {
                    if (Session["MCA_MEL"].ToString() != "")
                    {
                        if (Session["CONV"].ToString() == "")
                        {
                            
                            string winFeatures = "location=0,status=0,directories=0,menubar=no,scrollbars=0,width=850,height=600,top=150,left=350";
							
							string url = "pop_up_2.asp?R=" + UtilesWeb.Encriptador(Session["MM_Cuenta"].ToString());
                            ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "newWindow", "window.open('" + url +"','_blank','" + winFeatures + "');", true);

                        }
                    }
                }	                
 				
				
            }
        }
        catch (Exception ex)
        {
            System.Diagnostics.StackTrace Stack = new System.Diagnostics.StackTrace(ex, true);
            int errorlineno = Stack.GetFrame(0).GetFileLineNumber();
            int errorcol = Stack.GetFrame(0).GetFileColumnNumber();

            //UtilesWeb.EnviaCorreoAcusete(ex.Message, "Cot. Veh. Livianos - Cotizador.asxp - btnCalcular_Click - Linea: " + errorlineno + " - " + errorcol);
            Response.Redirect("SessionTerminada.aspx", false);
        }
    }

    public void ValidaTMarketing()
    {
        if (Session["mca_tmarketing"].ToString() == "S")
        {
            if (Session["id_tmarketing"].ToString() == "")
            {
                if (UtilesWeb.ValidaTextBox(this, this.txtEmailAseg, ScriptManager1) &&
                    UtilesWeb.ValidaTextBox(this, this.txtFonoAseg, ScriptManager1) &&
                    UtilesWeb.ValidaTextBox(this, this.txtFonoAseg2, ScriptManager1))
                {
                    if (Session["id_tmarketing"] == null)
                    {
                        Session["id_tmarketing"] = "";
                    }

                    if (!UtilesWeb.ValidaEmail(this.txtEmailAseg.Text))
                    {
                        UtilesWeb.EjecutaJs(this, "alert('La dirección de correo no es válida, favor corregir');");
                        this.txtEmailDe.Text = "";
                        return;
                    }

                    Poliza PolVeh = Poliza.CargaPoliza();

                    PolVeh.NomAseg = this.txtNomAseg.Text;
                    PolVeh.ApePatAseg = this.txtApePatAseg.Text;
                    PolVeh.ApeMatAseg = this.txtApeMatAseg.Text;
                    PolVeh.EmailAseg = this.txtEmailAseg.Text;
                    PolVeh.FonoAseg = this.txtFonoAseg.Text;
                    PolVeh.FonoAseg2 = this.txtFonoAseg2.Text;

                    PolVeh.NomTomad = this.txtNomAseg.Text;
                    PolVeh.ApePatTomad = this.txtApePatAseg.Text;
                    PolVeh.ApeMatTomad = this.txtApeMatAseg.Text;
                    PolVeh.EmailTomad = this.txtEmailAseg.Text;
                    PolVeh.FonoTomad = this.txtFonoAseg.Text;
                    PolVeh.FonoTomad2 = this.txtFonoAseg2.Text;
                    /*CJSS*/
                    PolVeh.FechaInicioVigencia = this.txtFechaIniVigencia.Text;
                    PolVeh.FechaFinVigencia = this.txtFechaFinVigencia.Text;
                    /*FIN CJSS*/
                    string id_marketing = Cotiza.GrabaTMarketing(this.txtCodDocumAseg.Text.ToUpper().Trim().Replace("-", "").Replace(".", ""), this.txtNomAseg.Text, this.txtApePatAseg.Text, this.txtApeMatAseg.Text, this.txtEmailAseg.Text, this.txtFonoAseg.Text, this.txtFonoAseg2.Text, ConfigurationManager.AppSettings["Producto"].ToString(), Session["COD_DOCUM"].ToString(), Session["CONV"].ToString(), "", Session["id_tmarketing"].ToString());

                    //this.PanelMarketing.Visible = false;

                    Session["id_tmarketing"] = id_marketing;
                }
            }
        }
    }

    public string getRcExceso()
    {
        string rc_exceso = "0";

        if (this.chk8200.Checked == true)
            //rc_exceso = this.chk8200.ID.Substring(3, 4);
            rc_exceso = "8202";
        if (this.chk8201.Checked == true)
            //rc_exceso = this.chk8201.ID.Substring(3, 4);
            rc_exceso = "8203";

        return rc_exceso;
    }

    public void GetDatosFormulario()
    {
        Poliza PolVeh = Poliza.CargaPoliza();

        string cod_marca = this.drpMarca.SelectedValue.ToString();
        PolVeh.CodMarca = cod_marca;
        PolVeh.NomMarca = this.drpMarca.SelectedItem.ToString();

        string cod_modelo = this.drpModelo.SelectedValue.ToString();
        PolVeh.CodModelo = cod_modelo;
        PolVeh.NomModelo = this.drpModelo.SelectedItem.ToString();

        string cod_submodelo = this.drpSubModelo.SelectedValue.ToString();
        PolVeh.CodSubModelo = cod_submodelo;
        PolVeh.NomSubModelo = this.drpSubModelo.SelectedItem.ToString();

        string año = this.drpAño.SelectedValue.ToString();
        PolVeh.AñoFab = año;

        /*CJSS*/

        string fechaIniVigencia = this.txtFechaIniVigencia.Text;
        PolVeh.FechaInicioVigencia = fechaIniVigencia.Replace("/", String.Empty).Replace("-", string.Empty).Trim();

        string fechaFinVigencia = this.txtFechaFinVigencia.Text;
        PolVeh.FechaFinVigencia = fechaFinVigencia.Replace("/", String.Empty).Replace("-", string.Empty).Trim();

        /* FIN CJSS */

        if (this.chkVehFact48.Checked)
            PolVeh.Fact48 = "1";
        else
            PolVeh.Fact48 = "0";

        string edad = this.drpEdad.SelectedValue.ToString();
        PolVeh.EdadAseg = edad;

        string sexo = this.drpSexo.SelectedValue.ToString();
        PolVeh.SexoAseg = sexo;

        string convenio = Session["CONV"].ToString();
        PolVeh.Convenio = convenio;

        string mca_mel = Session["MCA_MEL"].ToString();
        PolVeh.McaMel = mca_mel;


        //if (this.rdbDifPersonaNo.Checked == true)
        //{
        string cod_docum_aseg = this.txtCodDocumAseg.Text.ToString();
        PolVeh.CodDocumAseg = cod_docum_aseg.Replace("-", "").Replace(".", "").Trim();
        PolVeh.NomAseg = this.txtNomAseg.Text;
        PolVeh.ApePatAseg = this.txtApePatAseg.Text;
        PolVeh.ApeMatAseg = this.txtApeMatAseg.Text;

        if (Session["mca_tmarketing"].ToString() == "S")
        {
            PolVeh.EmailAseg = this.txtEmailAseg.Text;
            PolVeh.FonoAseg = this.txtFonoAseg.Text;
            PolVeh.FonoAseg2 = this.txtFonoAseg2.Text;
        }

        string num_matricula = this.txtNumMatricula.Text.ToString();
        PolVeh.NumMatricula = num_matricula;

        if (rbtHijosSi.Checked)
            PolVeh.PreguntaHijos = "S";
        else
            PolVeh.PreguntaHijos = "N";

        if (rbtFranquiciaSi.Checked)
            PolVeh.PreguntaFranquicia = "S";
        else
            PolVeh.PreguntaFranquicia = "N";

        //if (rbtDañosSi.Checked)
        //    PolVeh.PreguntaDanosPre = "S";
        //else
        //    PolVeh.PreguntaDanosPre = "N";
    }

    private DataRow CalculoDsctoVentaCruzada()
    {
        try
        {
            string cod_ramo = "801";
            if (Session["CONV"].ToString() == "AUTOANTIGUO")
                cod_ramo = "809";

            string cod_docum_aseg = this.txtCodDocumAseg.Text.Replace(".", "").Replace("-", "");
            DataRow dr = Cotiza.DsctoVenta_cruzada(cod_ramo, cod_docum_aseg);
            if (dr != null && dr["p_resultado"].ToString() == "S")
            {
                return dr;
            }
            else
                return null;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    private DataRow CalculoDsctoAgendaVencida()
    {
        try
        {
            string cod_ramo = "801";
            if (Session["CONV"].ToString() == "AUTOANTIGUO")
                cod_ramo = "809";

            string num_traticula = this.txtNumMatricula.Text.Trim();
            string rutCodDocumAseg = this.txtCodDocumAseg.Text.ToString().Replace(".", "").Replace("-", "").Trim();
            DataRow dr = Cotiza.DsctoAgendaVencida(cod_ramo, num_traticula, rutCodDocumAseg);
            if (dr != null && dr["p_resultado"].ToString() == "S")
            {
                return dr;
            }
            else
                return null;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    private void CargarDescuentos()
    {
        try
        {

            DataRow DrDsctoCruzado = CalculoDsctoVentaCruzada();

            tblrowDsctoCruzada.Visible = false;

            if (DrDsctoCruzado != null && DrDsctoCruzado["p_resultado"].ToString() == "S")
            {
                porcDsctoCruzado = ValidaTotalDsctoAplicar((String.IsNullOrEmpty(DrDsctoCruzado["p_dscto"].ToString())) ? "0" : DrDsctoCruzado["p_dscto"].ToString());
                actualizaSumaTotalDsctos();
                lbltblrowDsctoCruzada.Text = "(-" + Convert.ToString(Convert.ToDecimal(porcDsctoCruzado) ) + "%)";
                tblrowDsctoCruzada.Visible = true;
                RowDsctoVentaCruzada = true;
            }
            else
            {
                porcDsctoCruzado = "";
                actualizaSumaTotalDsctos();
                tblrowDsctoCruzada.Visible = false;
                RowDsctoVentaCruzada = false;
            }


            DataRow DrDsctoAgendaVencida = CalculoDsctoAgendaVencida();
            tblrowDsctoAgendaVencida.Visible = false;
            if (DrDsctoAgendaVencida != null && DrDsctoAgendaVencida["p_resultado"].ToString() == "S")
            {
                porcDsctoAgendaVencida = ValidaTotalDsctoAplicar((String.IsNullOrEmpty(DrDsctoAgendaVencida["p_dscto"].ToString())) ? "0" : DrDsctoAgendaVencida["p_dscto"].ToString());
                actualizaSumaTotalDsctos();
                lbltblrowDsctoAgendaVencida.Text = "(-" + Convert.ToString(Convert.ToDecimal(porcDsctoAgendaVencida) ) + "%)";
                tblrowDsctoAgendaVencida.Visible = true;
                RowDsctoAgendaVencida = true;
            }
            else
            {
                porcDsctoAgendaVencida = "";
                actualizaSumaTotalDsctos();
                 tblrowDsctoAgendaVencida.Visible = false;
                RowDsctoAgendaVencida = false;
            }

            if (RowDsctoVentaCruzada || RowDsctoFamiliar || RowDsctoAgendaVencida) //Descuentos
            {
                tblrowDsctosCampanaComercial.Visible = true;
            }
            else
            {
                tblrowDsctosCampanaComercial.Visible = false;
            }   
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public void CotizarNuevo() { //////////////////////////////////////////////////////////////////05_06
      
        CargarDescuentos();

        Poliza PolVeh = Poliza.CargaPoliza();

        DataSet Planes = new DataSet();
        //ACA ES DONDE VA A BUSCAR LOS PLANES 
        Planes = Cotiza.CantPlanes(Session["CONV"].ToString());

        string mca_cuadros = Cotiza.CuadroComisiones(Session["COD_DOCUM"].ToString(), Session["CONV"].ToString(), this.drpCuadroCom1);

        /* 05_06 if (mca_cuadros == "S")
            EscondeResComisionDif();
        else
            EscondeComisionDif();
        */
        PolVeh.CodRamo = "";
        PolVeh.NumCotizacion = "";

        GetDatosFormulario();

        DateTimeFormatInfo d = new CultureInfo("es-CL", false).DateTimeFormat;
        string hoy = DateTime.Now.ToString("dd-MMM-yyyy", d).ToUpper();
        PolVeh.FechaCotizacion = hoy;

        PolVeh.CodDocum = Session["COD_DOCUM"].ToString();

        string monto_rc = ConfigurationManager.AppSettings["MontoRC"].ToString();

        if (Session["CONV"].ToString() == "777215604")
            PolVeh.MontoRC = "1000";
        else
            PolVeh.MontoRC = monto_rc;

        if (Session["CONV"].ToString() == "AUTOANTIGUO")
            PolVeh.MontoRC = "200";

        DataRow Sisgen = Cotiza.LlamaSisgen(PolVeh.CodDocumAseg, PolVeh.CodDocumTomad, PolVeh.NumMatricula);

        PolVeh.CantSiniestros = Sisgen["P_CANT_SINIESTROS"].ToString();
        PolVeh.MontoSiniestros = Sisgen["P_MONT_SINIESTROS"].ToString();

        Session["CANT_MODALIDADES"] = Planes.Tables[0].Rows.Count;

        string dia_pago = ConfigurationManager.AppSettings["DiaPagoCot"];

        PolVeh.RCExceso = getRcExceso();
        PolVeh.CobOpc = getCobOpc();

        ArrayList ModError = new ArrayList();
        string chkm;
        for (int totalmod = 0; totalmod < tblrowNomPlan.Cells.Count; totalmod++)
        {
            tblrowNomPlan.Cells[totalmod].Visible = true;
            tblrowPrimaTotal.Cells[totalmod].Visible = true;
            tblrowPrimaComision.Cells[totalmod].Visible = true;
            tblrowPrimaNeta.Cells[totalmod].Visible = true;
            tblrowDescuento.Cells[totalmod].Visible = true;
            tblrowRecargo.Cells[totalmod].Visible = true;
            tblrowCuota.Cells[totalmod].Visible = true;
            tblrowCuotaPAT.Cells[totalmod].Visible = true;
            tblrowSelModalidades.Cells[totalmod].Visible = true;
            tblrowSelModEmitir.Cells[totalmod].Visible = true;

            //CJ 10-04-2018
            tblrowDsctoCruzada.Cells[totalmod].Visible = true;
            tblrowPrimaTotalDsctos.Cells[totalmod].Visible = true;
            tblrowDsctoFamiliar.Cells[totalmod].Visible = true;
            tblrowDsctoAgendaVencida.Cells[totalmod].Visible = true;
            tblrowDsctosCampanaComercial.Cells[totalmod].Visible = true;
        }

        int i_error = 1;

        this.tblResultados.Attributes.Remove("Width");

        if (mca_cuadros == "S")
            this.tblResultados.Width = 1150;
        else
            this.tblResultados.Width = 980;

        System.Globalization.NumberFormatInfo nfi = new
        System.Globalization.NumberFormatInfo();
        nfi.NumberGroupSeparator = ",";

        DataRow prima_vigente = Cotiza.ValidaRiesgoPolVigente(PolVeh.CodDocumAseg, PolVeh.CodMarca,
                                                              PolVeh.CodModelo, PolVeh.CodSubModelo,
                                                              PolVeh.Convenio, PolVeh.RCExceso);

        //FMOUAT
        decimal factor = 1;
        if (prima_vigente["p_mca_vigente"].ToString() == "S")
        {
            string plan = prima_vigente["p_cod_modalidad_vigente"].ToString();

            string modalidad = Cotiza.NomModalidad(plan);

            if (Session["CONV"].ToString() == "AUTOANTIGUO")
                PolVeh.CodRamo = "809";

            DataRow cotizacion = Cotiza.Cotizar(plan,
                                                PolVeh.CodMarca,
                                                PolVeh.CodModelo,
                                                PolVeh.CodSubModelo,
                                                PolVeh.AñoFab,
                                                PolVeh.CodDocum,
                                                PolVeh.CodDocumAseg,
                                                PolVeh.NumMatricula,
                                                PolVeh.CodRamo,
                                                PolVeh.MontoRC,
                                                PolVeh.EdadAseg,
                                                PolVeh.SexoAseg,
                                                PolVeh.CantSiniestros,
                                                PolVeh.MontoSiniestros,
                                                PolVeh.RCExceso,
                                                PolVeh.AñoFab,
                                                PolVeh.Convenio,
                                                PolVeh.CobOpc,
                                                PolVeh.McaMel,
                                                PolVeh.TipoDescuentoDataBusiness,
                                                PolVeh.DescuentoDataBusiness);

            if (cotizacion["P_ERROR"].ToString() == "0")
            {
                decimal primacot = Convert.ToDecimal(cotizacion["P_PRIMA_TOTAL"].ToString(), nfi);
                decimal primavigente = Convert.ToDecimal(prima_vigente["p_imp_prima_total"].ToString(), nfi);

                if (primavigente >= primacot)
                {
                    factor = primavigente / primacot;
                }
            }
        }

        ArrayList arr;
        Session["SelModalidades"] = null;
        if (Session["SelModalidades"] != null)
        {
            arr = (ArrayList)Session["SelModalidades"];
        }
        else
        {
            arr = new ArrayList();
            for (int i = 0; i < Convert.ToInt32(ConfigurationManager.AppSettings["MaxModalidadesSelect"]); i++)
                arr.Add("1");

            Session["SelModalidades"] = arr;
        }

        for (int i = 0; i < Planes.Tables[0].Rows.Count; i++)
        {
            string cod_plan = Planes.Tables[0].Rows[i]["COD_PLAN"].ToString();

            string nom_modalidad = Cotiza.NomModalidad(cod_plan);

            if (Session["CONV"].ToString() == "AUTOANTIGUO")
                PolVeh.CodRamo = "809";

                DataRow cotizacion = Cotiza.Cotizar_Fechas(cod_plan, PolVeh.CodMarca, PolVeh.CodModelo,
                PolVeh.CodSubModelo, PolVeh.AñoFab, PolVeh.CodDocum, PolVeh.CodDocumAseg, PolVeh.NumMatricula,
                PolVeh.FechaInicioVigencia, PolVeh.FechaFinVigencia, PolVeh.CodRamo, PolVeh.MontoRC, PolVeh.EdadAseg, PolVeh.SexoAseg, PolVeh.CantSiniestros, PolVeh.MontoSiniestros, PolVeh.RCExceso, PolVeh.AñoFab, PolVeh.Convenio, PolVeh.CobOpc, PolVeh.McaMel, PolVeh.TipoDescuentoDataBusiness, PolVeh.DescuentoDataBusiness);

            if (cotizacion["P_ERROR"].ToString() == "0")
            {
                decimal dec_primaneta = Decimal.Round((Convert.ToDecimal(cotizacion["P_PRIMA"].ToString(), nfi) * factor), 2);
                decimal dec_primatotal = Decimal.Round((Convert.ToDecimal(cotizacion["P_PRIMA_TOTAL"].ToString(), nfi) * factor), 2);

                int compare;

                string primaneta;
                string primatotal;
                string desc;
                string porc_desc;
                string recar;
                string porc_recar;

                Decimal primanetaDecimal = Decimal.Round((Convert.ToDecimal(cotizacion["P_PRIMA"].ToString(), nfi) * factor), 2);
                primaneta = primanetaDecimal.ToString();
                primatotal = Decimal.Round((Convert.ToDecimal(cotizacion["P_PRIMA_TOTAL"].ToString(), nfi) * factor), 2).ToString();


                desc = cotizacion["P_DESC"].ToString();
                porc_desc = cotizacion["P_PORC_DESC"].ToString();
                Session["DESC"] = porc_desc;

                recar = cotizacion["P_RECAR"].ToString();
                porc_recar = cotizacion["P_PORC_RECAR"].ToString();
                Session["RECAR"] = porc_recar;

                Session["COD_RAMO"] = cotizacion["P_COD_RAMO"].ToString();
                PolVeh.CodRamo = cotizacion["P_COD_RAMO"].ToString();
                //}

                string descuento;

                if (Convert.ToSingle(desc) == 0)
                    descuento = recar;
                else
                    descuento = desc;

                //CJ ACA SE CALCULA EL DESCUENTO  DE LA CAMPAÑA COMERCIAL VENTA CRUZADA JC  
                decimal descTotalCampañaComercial = Convert.ToDecimal((String.IsNullOrEmpty(sumaTotalPorcDsctos)) ? "0" : sumaTotalPorcDsctos.Replace(".", ","));
                decimal primaexcenta = Vehiculo.PrimaExenta(cod_plan, Session["COD_RAMO"].ToString());
                decimal iva = Cobranza.IVA();
                decimal div = Math.Round(((descTotalCampañaComercial * primanetaDecimal * -1) / 100), 2);

                decimal primatotalcondescuento = Math.Round((((primanetaDecimal - primaexcenta - (div * -1)) * iva) / 100) + (primanetaDecimal - (div * -1)), 2);
                descuento = Convert.ToString(Convert.ToDecimal(descuento.Replace(".", ",")) + div).Replace(".", ",");


                CalculaCuota(primaneta, "GD", this.drpValCuotaPAT.SelectedValue.ToString(), descuento, Session["COD_RAMO"].ToString(), dia_pago, i + 1);
                CalculaCuota(primaneta, "TA", this.drpValCuotaPAT.SelectedValue.ToString(), descuento, Session["COD_RAMO"].ToString(), dia_pago, i + 1);

                setlblNomPlan(nom_modalidad, i + 1);

                sethdfCodModalidad(cod_plan, i + 1);

                // Prima Bruta Anual (Comisión Normal)
                setlblPrimaNeta(primaneta, i + 1);

                setcssPrimaNeta("PrimaNetaEnabled", i + 1);

                setlblPrimaComision("---", i + 1);

                setlblDescuento(desc, i + 1);

                setlblRecargo(recar, i + 1);


                //SETEA LA PRIMA BRUTA ANUAL  aca la prima llega y luego con esta se calcula el porcentaje de descuento 
                setlblPrimaTotal(primatotalcondescuento.ToString(), i + 1);

                setlblPrimaTotalDsctos(primaneta, i + 1);

                //// Descuento  Total Campaña cOMENCIAL
                //setDsctoCampanaComercial(descuentoAdicional, i + 1);

                //txtDescuento.Text = porc_desc;                    

                txtRecargo.Text = porc_recar;
                txtRecargo1.Text = porc_recar;
              
                Session["MAX_DESC"] = Convert.ToInt32(Math.Round(Convert.ToDecimal(porc_desc), 2)) * 2;
                Session["MIN_RECAR"] = Convert.ToInt32(porc_recar);

                CheckBox chk = new CheckBox();
                chk = UpdatePanelResultados.FindControl("chkselmod" + (i + 1)) as CheckBox;
                chk.Checked = true;
                chkm = chk.ID;

                arr[i] = chk.ID;
            }
            else
            {

                Logs.writeToLogFile("CodMarca " + PolVeh.CodMarca);
                Logs.writeToLogFile("CodModelo " + PolVeh.CodModelo);
                Logs.writeToLogFile("CodSubModelo " + PolVeh.CodSubModelo);
                Logs.writeToLogFile("AñoFab " + PolVeh.AñoFab);
                Logs.writeToLogFile("CodDocum " + PolVeh.CodDocum);
                Logs.writeToLogFile("CodDocumAseg " + PolVeh.CodDocumAseg);
                Logs.writeToLogFile("NumMatricula " + PolVeh.NumMatricula);

                Logs.writeToLogFile("Error Cotizar : " + cotizacion["P_ERROR"].ToString());

                ModError.Add(i);
                i_error++;

                if (cotizacion["P_ERROR"].ToString() == "1010")
                    Session["MCA_SUSPENSION"] = "SI";
                else
                    Session["MCA_SUSPENSION"] = "NO";
            }

          
        }

        tblrowValorRef.Cells[0].ColumnSpan = Planes.Tables[0].Rows.Count + 1;

        tblrowValorRef.Cells[0].Text = ConfigurationManager.AppSettings["TextoValorReferencial"];

        tblrowValorRef.CssClass = "ValorRef";

        this.tblResultados.CssClass = "Resultados";

        if (mca_cuadros == "S")
        {

            if ((Planes.Tables[0].Rows.Count - ModError.Count) <= 6)
            {
                this.tblResultados.Width = 950;
                this.tblResultados.CssClass = "Resultados2";
            }

            if ((Planes.Tables[0].Rows.Count - ModError.Count) <= 3)
            {
                this.tblResultados.Width = 700;
                this.tblResultados.CssClass = "Resultados2";
            }
        }
        else
        {
            if ((Planes.Tables[0].Rows.Count - ModError.Count) <= 5)
                this.tblResultados.Width = 700;

        }


        for (int totalmod = 12; totalmod > Planes.Tables[0].Rows.Count; totalmod--)
        {
            tblrowNomPlan.Cells[totalmod].Visible = false;
            tblrowPrimaTotal.Cells[totalmod].Visible = false;
            tblrowPrimaComision.Cells[totalmod].Visible = false;
            tblrowPrimaNeta.Cells[totalmod].Visible = false;
            tblrowDescuento.Cells[totalmod].Visible = false;
            tblrowRecargo.Cells[totalmod].Visible = false;
            tblrowCuota.Cells[totalmod].Visible = false;
            tblrowCuotaPAT.Cells[totalmod].Visible = false;
            tblrowSelModalidades.Cells[totalmod].Visible = false;
            tblrowSelModEmitir.Cells[totalmod].Visible = false;

            //CJ 10-04-2018
            tblrowDsctoCruzada.Cells[totalmod].Visible = false;
            tblrowPrimaTotalDsctos.Cells[totalmod].Visible = false;
            tblrowDsctoFamiliar.Cells[totalmod].Visible = false;
            tblrowDsctoAgendaVencida.Cells[totalmod].Visible = false;
            tblrowDsctosCampanaComercial.Cells[totalmod].Visible = false;

        }

        for (int totalmoderror = 0; totalmoderror < ModError.Count; totalmoderror++)
        {
            tblrowNomPlan.Cells[Convert.ToInt32(ModError[totalmoderror].ToString()) + 1].Visible = false;
            tblrowPrimaTotal.Cells[Convert.ToInt32(ModError[totalmoderror].ToString()) + 1].Visible = false;
            tblrowPrimaComision.Cells[Convert.ToInt32(ModError[totalmoderror].ToString()) + 1].Visible = false;
            tblrowPrimaNeta.Cells[Convert.ToInt32(ModError[totalmoderror].ToString()) + 1].Visible = false;
            tblrowDescuento.Cells[Convert.ToInt32(ModError[totalmoderror].ToString()) + 1].Visible = false;
            tblrowRecargo.Cells[Convert.ToInt32(ModError[totalmoderror].ToString()) + 1].Visible = false;
            tblrowCuota.Cells[Convert.ToInt32(ModError[totalmoderror].ToString()) + 1].Visible = false;
            tblrowCuotaPAT.Cells[Convert.ToInt32(ModError[totalmoderror].ToString()) + 1].Visible = false;
            tblrowSelModalidades.Cells[Convert.ToInt32(ModError[totalmoderror].ToString()) + 1].Visible = false;
            tblrowSelModEmitir.Cells[Convert.ToInt32(ModError[totalmoderror].ToString()) + 1].Visible = false;

            //CJ 10-04-2018
            tblrowDsctoCruzada.Cells[Convert.ToInt32(ModError[totalmoderror].ToString()) + 1].Visible = false;
            tblrowPrimaTotalDsctos.Cells[Convert.ToInt32(ModError[totalmoderror].ToString()) + 1].Visible = false;
            tblrowDsctoFamiliar.Cells[Convert.ToInt32(ModError[totalmoderror].ToString()) + 1].Visible = false;
            tblrowDsctoAgendaVencida.Cells[Convert.ToInt32(ModError[totalmoderror].ToString()) + 1].Visible = false;
            tblrowDsctosCampanaComercial.Cells[Convert.ToInt32(ModError[totalmoderror].ToString()) + 1].Visible = false;
        }

        if (ModError.Count == Planes.Tables[0].Rows.Count)
        {
            if (Session["MCA_SUSPENSION"].ToString() == "SI")
                UtilesWeb.EjecutaJs(this, "alert('" + ConfigurationManager.AppSettings["MensajeSuspension"] + "');");
            else
                UtilesWeb.EjecutaJs(this, "alert('" + ConfigurationManager.AppSettings["MensajeSinPlanes"] + "');");
        }
        else
        {
            if (Session["mca_tmarketing"].ToString() == "S")
            {
                GrabaDatosTmarketing(PolVeh.CodDocumAseg, PolVeh.NomAseg, PolVeh.ApePatAseg, PolVeh.ApeMatAseg, PolVeh.EmailAseg, PolVeh.FonoAseg, PolVeh.FonoAseg2, ConfigurationManager.AppSettings["Producto"].ToString(), PolVeh.CodDocum, PolVeh.Convenio, PolVeh.NumCotizacion);
            }

            tblResultados.Visible = true;
            tblDescRec.Visible = true;
            setSelectedPlan();
            //ClearSelectedPlan();
            tblBotonera.Visible = true;
        }
    }// fin de cotizarNuevo

    public void Cotizar()
    {
        //campaña comecrcial venta cruzada
        CargarDescuentos();
        // mod pasaave
        Session["anio"] = this.drpAño.SelectedValue;
        // fin-mod pasaave
        Poliza PolVeh = Poliza.CargaPoliza();

        DataSet Planes = new DataSet();
        //ACA ES DONDE VA A BUSCAR LOS PLANES 
        // FDR: PREguntar a GERADO
        Planes = Cotiza.CantPlanes(Session["CONV"].ToString());

        string mca_cuadros = Cotiza.CuadroComisiones(Session["COD_DOCUM"].ToString(), Session["CONV"].ToString(), this.drpCuadroCom1);

        if (mca_cuadros == "S")
            EscondeResComisionDif();
        else
            EscondeComisionDif();

        PolVeh.CodRamo = "";
        PolVeh.NumCotizacion = "";

        GetDatosFormulario();

        DateTimeFormatInfo d = new CultureInfo("es-CL", false).DateTimeFormat;
        string hoy = DateTime.Now.ToString("dd-MMM-yyyy", d).ToUpper();
        PolVeh.FechaCotizacion = hoy;

        PolVeh.CodDocum = Session["COD_DOCUM"].ToString();

        string monto_rc = ConfigurationManager.AppSettings["MontoRC"].ToString();

        if (Session["CONV"].ToString() == "777215604")
            PolVeh.MontoRC = "1000";
        else
            PolVeh.MontoRC = monto_rc;

        if (Session["CONV"].ToString() == "AUTOANTIGUO")
            PolVeh.MontoRC = "200";

        DataRow Sisgen = Cotiza.LlamaSisgen(PolVeh.CodDocumAseg, PolVeh.CodDocumTomad, PolVeh.NumMatricula);

        PolVeh.CantSiniestros = Sisgen["P_CANT_SINIESTROS"].ToString();
        PolVeh.MontoSiniestros = Sisgen["P_MONT_SINIESTROS"].ToString();

        //DataRow DataBussines = Cotiza.LlamaDataBussines("1","801", PolVeh.Convenio, PolVeh.CodDocumAseg);

        //PolVeh.TipoDescuentoDataBusiness = DataBussines["P_TIPO_DESC"].ToString();
        //PolVeh.DescuentoDataBusiness = DataBussines["P_DESC"].ToString();

        Session["CANT_MODALIDADES"] = Planes.Tables[0].Rows.Count; 

        string dia_pago = ConfigurationManager.AppSettings["DiaPagoCot"];

        PolVeh.RCExceso = getRcExceso();
        PolVeh.CobOpc = getCobOpc();

        ArrayList ModError = new ArrayList();
        string chkm;
        for (int totalmod = 0; totalmod < tblrowNomPlan.Cells.Count; totalmod++)
        {
            tblrowNomPlan.Cells[totalmod].Visible = true;
            tblrowPrimaTotal.Cells[totalmod].Visible = true;
            tblrowPrimaComision.Cells[totalmod].Visible = true;
            tblrowPrimaNeta.Cells[totalmod].Visible = true;
            tblrowDescuento.Cells[totalmod].Visible = true;
            tblrowRecargo.Cells[totalmod].Visible = true;
            tblrowCuota.Cells[totalmod].Visible = true;
            tblrowCuotaPAT.Cells[totalmod].Visible = true;
            tblrowSelModalidades.Cells[totalmod].Visible = true;
            tblrowSelModEmitir.Cells[totalmod].Visible = true;

            //CJ 10-04-2018
            tblrowDsctoCruzada.Cells[totalmod].Visible = true;
            tblrowPrimaTotalDsctos.Cells[totalmod].Visible = true;
            tblrowDsctoFamiliar.Cells[totalmod].Visible = true;
            tblrowDsctoAgendaVencida.Cells[totalmod].Visible = true;
            tblrowDsctosCampanaComercial.Cells[totalmod].Visible = true;
        }

        int i_error = 1;

        this.tblResultados.Attributes.Remove("Width");

        if (mca_cuadros == "S")
            this.tblResultados.Width = 1150;
        else
            this.tblResultados.Width = 980;

        System.Globalization.NumberFormatInfo nfi = new
        System.Globalization.NumberFormatInfo();
        nfi.NumberGroupSeparator = ",";

        DataRow prima_vigente = Cotiza.ValidaRiesgoPolVigente(PolVeh.CodDocumAseg, PolVeh.CodMarca,
                                                              PolVeh.CodModelo, PolVeh.CodSubModelo,
                                                              PolVeh.Convenio, PolVeh.RCExceso);

        //FMOUAT
        decimal factor = 1;
        if (prima_vigente["p_mca_vigente"].ToString() == "S")
        {
            string plan = prima_vigente["p_cod_modalidad_vigente"].ToString();

            string modalidad = Cotiza.NomModalidad(plan);

            if (Session["CONV"].ToString() == "AUTOANTIGUO")
                PolVeh.CodRamo = "809";

            DataRow cotizacion = Cotiza.Cotizar(plan,
                                                PolVeh.CodMarca,
                                                PolVeh.CodModelo,
                                                PolVeh.CodSubModelo,
                                                PolVeh.AñoFab,
                                                PolVeh.CodDocum,
                                                PolVeh.CodDocumAseg,
                                                PolVeh.NumMatricula,
                                                PolVeh.CodRamo,
                                                PolVeh.MontoRC,
                                                PolVeh.EdadAseg,
                                                PolVeh.SexoAseg,
                                                PolVeh.CantSiniestros,
                                                PolVeh.MontoSiniestros,
                                                PolVeh.RCExceso,
                                                PolVeh.AñoFab,
                                                PolVeh.Convenio,
                                                PolVeh.CobOpc,
                                                PolVeh.McaMel,
                                                PolVeh.TipoDescuentoDataBusiness,
                                                PolVeh.DescuentoDataBusiness);

            if (cotizacion["P_ERROR"].ToString() == "0")
            {
                decimal primacot = Convert.ToDecimal(cotizacion["P_PRIMA_TOTAL"].ToString(), nfi);
                decimal primavigente = Convert.ToDecimal(prima_vigente["p_imp_prima_total"].ToString(), nfi);

                if (primavigente >= primacot)
                {
                    factor = primavigente / primacot;
                }
            }
        }

        ArrayList arr;
        Session["SelModalidades"] = null;
        if (Session["SelModalidades"] != null)
        {
            arr = (ArrayList)Session["SelModalidades"];
        }
        else
        {
            arr = new ArrayList();
            for (int i = 0; i < Convert.ToInt32(ConfigurationManager.AppSettings["MaxModalidadesSelect"]); i++)
                arr.Add("1");

            Session["SelModalidades"] = arr;
        }

        for (int i = 0; i < Planes.Tables[0].Rows.Count; i++)
        {
            string cod_plan = Planes.Tables[0].Rows[i]["COD_PLAN"].ToString();

            string nom_modalidad = Cotiza.NomModalidad(cod_plan);

            if (Session["CONV"].ToString() == "AUTOANTIGUO")
                PolVeh.CodRamo = "809";

            //CJSS 04-06-2014
            //DataRow cotizacion = Cotiza.Cotizar(cod_plan, PolVeh.CodMarca, PolVeh.CodModelo, PolVeh.CodSubModelo, PolVeh.AñoFab, PolVeh.CodDocum, PolVeh.CodDocumAseg, PolVeh.NumMatricula, PolVeh.CodRamo, PolVeh.MontoRC, PolVeh.EdadAseg, PolVeh.SexoAseg, PolVeh.CantSiniestros, PolVeh.MontoSiniestros, PolVeh.RCExceso, PolVeh.AñoFab, PolVeh.Convenio, PolVeh.CobOpc, PolVeh.McaMel, PolVeh.TipoDescuentoDataBusiness, PolVeh.DescuentoDataBusiness);

            DataRow cotizacion = Cotiza.Cotizar_Fechas(cod_plan, PolVeh.CodMarca, PolVeh.CodModelo,
                PolVeh.CodSubModelo, PolVeh.AñoFab, PolVeh.CodDocum, PolVeh.CodDocumAseg, PolVeh.NumMatricula,
                PolVeh.FechaInicioVigencia, PolVeh.FechaFinVigencia, PolVeh.CodRamo, PolVeh.MontoRC, PolVeh.EdadAseg, PolVeh.SexoAseg, PolVeh.CantSiniestros, PolVeh.MontoSiniestros, PolVeh.RCExceso, PolVeh.AñoFab, PolVeh.Convenio, PolVeh.CobOpc, PolVeh.McaMel, PolVeh.TipoDescuentoDataBusiness, PolVeh.DescuentoDataBusiness);

            if (cotizacion["P_ERROR"].ToString() == "0")
            {
                decimal dec_primaneta = Decimal.Round((Convert.ToDecimal(cotizacion["P_PRIMA"].ToString(), nfi) * factor), 2);
                decimal dec_primatotal = Decimal.Round((Convert.ToDecimal(cotizacion["P_PRIMA_TOTAL"].ToString(), nfi) * factor), 2);

                int compare;

                //if (prima_vigente["p_mca_vigente"].ToString() == "S")
                //{
                //    decimal dec_primaneta_vigente = Convert.ToDecimal(prima_vigente["P_IMP_PRIMA_NETA"].ToString(), nfi);
                //    decimal dec_primatotal_vigente = Convert.ToDecimal(prima_vigente["P_IMP_PRIMA_TOTAL"].ToString(), nfi);

                //    compare = decimal.Compare(dec_primaneta_vigente, dec_primaneta);
                //}
                //else
                //{
                //    compare = 0;
                //}

                string primaneta;
                string primatotal;
                string desc;
                string porc_desc;
                string recar;
                string porc_recar;

                //if (prima_vigente["p_mca_vigente"].ToString() == "S" &&
                //    prima_vigente["p_cod_modalidad_vigente"].ToString() == cod_plan &&
                //    compare > 0)
                //{
                //    primaneta = prima_vigente["P_IMP_PRIMA_NETA"].ToString();
                //    primatotal = prima_vigente["P_IMP_PRIMA_TOTAL"].ToString();

                //    desc = "0.00";
                //    porc_desc = "0";
                //    Session["DESC"] = porc_desc;

                //    recar = "0.00";
                //    porc_recar = "0";
                //    Session["RECAR"] = porc_recar;

                //    Session["COD_RAMO"] = prima_vigente["P_COD_RAMO"].ToString();
                //    //PolVeh.CodRamo = prima_vigente["P_COD_RAMO"].ToString();
                //}
                //else
                //{
                Decimal primanetaDecimal = Decimal.Round((Convert.ToDecimal(cotizacion["P_PRIMA"].ToString(), nfi) * factor), 2);
                primaneta = primanetaDecimal.ToString();
                primatotal = Decimal.Round((Convert.ToDecimal(cotizacion["P_PRIMA_TOTAL"].ToString(), nfi) * factor), 2).ToString();
               
              
                desc = cotizacion["P_DESC"].ToString();
                porc_desc = cotizacion["P_PORC_DESC"].ToString();
                Session["DESC"] = porc_desc;

                recar = cotizacion["P_RECAR"].ToString();
                porc_recar = cotizacion["P_PORC_RECAR"].ToString();
                Session["RECAR"] = porc_recar;

                Session["COD_RAMO"] = cotizacion["P_COD_RAMO"].ToString();
                PolVeh.CodRamo = cotizacion["P_COD_RAMO"].ToString();
                //}

                string descuento;

                if (Convert.ToSingle(desc) == 0)
                    descuento = recar;
                else
                    descuento = desc;

                //CJ ACA SE CALCULA EL DESCUENTO  DE LA CAMPAÑA COMERCIAL VENTA CRUZADA JC  
               decimal descTotalCampañaComercial = Convert.ToDecimal((String.IsNullOrEmpty(sumaTotalPorcDsctos)) ? "0" : sumaTotalPorcDsctos.Replace(".", ","));
               decimal primaexcenta = Vehiculo.PrimaExenta(cod_plan, Session["COD_RAMO"].ToString());
               decimal iva = Cobranza.IVA();
               decimal div = Math.Round(((descTotalCampañaComercial * primanetaDecimal * -1) / 100), 2);

               decimal primatotalcondescuento = Math.Round((((primanetaDecimal - primaexcenta - (div * -1)) * iva) / 100) + (primanetaDecimal - (div * -1)), 2);
               descuento = Convert.ToString(Convert.ToDecimal(descuento.Replace(".", ",")) + div).Replace(".", ",");


                CalculaCuota(primaneta, "GD", this.drpValCuotaPAT.SelectedValue.ToString(), descuento, Session["COD_RAMO"].ToString(), dia_pago, i + 1);
                CalculaCuota(primaneta, "TA", this.drpValCuotaPAT.SelectedValue.ToString(), descuento, Session["COD_RAMO"].ToString(), dia_pago, i + 1);

                setlblNomPlan(nom_modalidad, i + 1);

                sethdfCodModalidad(cod_plan, i + 1);
               
                // Prima Bruta Anual (Comisión Normal)
                setlblPrimaNeta(primaneta, i + 1);

                setcssPrimaNeta("PrimaNetaEnabled", i + 1);

                setlblPrimaComision("---", i + 1);

                setlblDescuento(desc, i + 1);

                setlblRecargo(recar, i + 1);

               
                //SETEA LA PRIMA BRUTA ANUAL  aca la prima llega y luego con esta se calcula el porcentaje de descuento 
                setlblPrimaTotal(primatotalcondescuento.ToString(), i + 1);

                setlblPrimaTotalDsctos(primaneta, i + 1);
               
                //// Descuento  Total Campaña cOMENCIAL
                //setDsctoCampanaComercial(descuentoAdicional, i + 1);

                //txtDescuento.Text = porc_desc;                    

                txtRecargo.Text = porc_recar;
                txtRecargo1.Text = porc_recar;
                /*
                if (cod_plan == "8000" || cod_plan == "8003" || cod_plan == "8005" || cod_plan == "8010")
                {
                    tblrowNomPlan.Cells[i + 1].CssClass = "Celda_Master_Tit";
                    tblrowPrimaNeta.Cells[i + 1].CssClass = "Celda_Master";
                    tblrowPrimaTotal.Cells[i + 1].CssClass = "Celda_Master";
                    tblrowRecargo.Cells[i + 1].CssClass = "Celda_Master";
                }

                if (cod_plan == "8120" || cod_plan == "8123" || cod_plan == "8125" || cod_plan == "8121")
                {
                    tblrowNomPlan.Cells[i + 1].CssClass = "Celda_Flex_Tit";                    
                    tblrowPrimaNeta.Cells[i + 1].CssClass = "Celda_Flex";
                    tblrowPrimaTotal.Cells[i + 1].CssClass = "Celda_Flex";
                    tblrowRecargo.Cells[i + 1].CssClass = "Celda_Flex";
                }

                if (cod_plan == "8900")
                {
                    tblrowNomPlan.Cells[i + 1].CssClass = "Celda_Balance_Tit";
                    tblrowPrimaNeta.Cells[i + 1].CssClass = "Celda_Balance";
                    tblrowPrimaTotal.Cells[i + 1].CssClass = "Celda_Balance";
                    tblrowRecargo.Cells[i + 1].CssClass = "Celda_Balance";
                }

                if (cod_plan == "8910")
                {
                    tblrowNomPlan.Cells[i + 1].CssClass = "Celda_Elemental_Tit";
                    tblrowPrimaNeta.Cells[i + 1].CssClass = "Celda_Elemental";
                    tblrowPrimaTotal.Cells[i + 1].CssClass = "Celda_Elemental";
                    tblrowRecargo.Cells[i + 1].CssClass = "Celda_Elemental";
                }
                */
                Session["MAX_DESC"] = Convert.ToInt32(Math.Round(Convert.ToDecimal(porc_desc), 2)) * 2;
                Session["MIN_RECAR"] = Convert.ToInt32(porc_recar);

                CheckBox chk = new CheckBox();
                chk = UpdatePanelResultados.FindControl("chkselmod" + (i + 1)) as CheckBox;
                chk.Checked = true;
                chkm = chk.ID;

                arr[i] = chk.ID;
            }
            else
            {

                Logs.writeToLogFile("CodMarca " + PolVeh.CodMarca);
                Logs.writeToLogFile("CodModelo " + PolVeh.CodModelo);
                Logs.writeToLogFile("CodSubModelo " + PolVeh.CodSubModelo);
                Logs.writeToLogFile("AñoFab " + PolVeh.AñoFab);
                Logs.writeToLogFile("CodDocum " + PolVeh.CodDocum);
                Logs.writeToLogFile("CodDocumAseg " + PolVeh.CodDocumAseg);
                Logs.writeToLogFile("NumMatricula " + PolVeh.NumMatricula);

                Logs.writeToLogFile("Error Cotizar : " + cotizacion["P_ERROR"].ToString());

                ModError.Add(i);
                i_error++;

                if (cotizacion["P_ERROR"].ToString() == "1010")
                    Session["MCA_SUSPENSION"] = "SI";
                else
                    Session["MCA_SUSPENSION"] = "NO";
            }

            //FMOUAT
            //if (i != tblrowNomPlan.Cells.Count - 1)
            //{
            //CheckBox chk = new CheckBox();
            //chk = UpdatePanelResultados.FindControl("chkselmod" + (i + 1)) as CheckBox;
            //chk.Checked = true;
            //chkm = chk.ID;

            //arr[i] = chk.ID;

            //}
        }

        tblrowValorRef.Cells[0].ColumnSpan = Planes.Tables[0].Rows.Count + 1;

        tblrowValorRef.Cells[0].Text = ConfigurationManager.AppSettings["TextoValorReferencial"];

        tblrowValorRef.CssClass = "ValorRef";

        this.tblResultados.CssClass = "Resultados";

        if (mca_cuadros == "S")
        {

            if ((Planes.Tables[0].Rows.Count - ModError.Count) <= 6)
            {
                this.tblResultados.Width = 950;
                this.tblResultados.CssClass = "Resultados2";
            }

            if ((Planes.Tables[0].Rows.Count - ModError.Count) <= 3)
            {
                this.tblResultados.Width = 700;
                this.tblResultados.CssClass = "Resultados2";
            }
        }
        else
        {
            if ((Planes.Tables[0].Rows.Count - ModError.Count) <= 5)
                this.tblResultados.Width = 700;

        }


        for (int totalmod = 12; totalmod > Planes.Tables[0].Rows.Count; totalmod--)
        {
            tblrowNomPlan.Cells[totalmod].Visible = false;
            tblrowPrimaTotal.Cells[totalmod].Visible = false;
            tblrowPrimaComision.Cells[totalmod].Visible = false;
            tblrowPrimaNeta.Cells[totalmod].Visible = false;
            tblrowDescuento.Cells[totalmod].Visible = false;
            tblrowRecargo.Cells[totalmod].Visible = false;
            tblrowCuota.Cells[totalmod].Visible = false;
            tblrowCuotaPAT.Cells[totalmod].Visible = false;
            tblrowSelModalidades.Cells[totalmod].Visible = false;
            tblrowSelModEmitir.Cells[totalmod].Visible = false;

            //CJ 10-04-2018
            tblrowDsctoCruzada.Cells[totalmod].Visible = false;
            tblrowPrimaTotalDsctos.Cells[totalmod].Visible = false;
            tblrowDsctoFamiliar.Cells[totalmod].Visible = false;
            tblrowDsctoAgendaVencida.Cells[totalmod].Visible = false;
            tblrowDsctosCampanaComercial.Cells[totalmod].Visible = false;

        }

        for (int totalmoderror = 0; totalmoderror < ModError.Count; totalmoderror++)
        {
            tblrowNomPlan.Cells[Convert.ToInt32(ModError[totalmoderror].ToString()) + 1].Visible = false;
            tblrowPrimaTotal.Cells[Convert.ToInt32(ModError[totalmoderror].ToString()) + 1].Visible = false;
            tblrowPrimaComision.Cells[Convert.ToInt32(ModError[totalmoderror].ToString()) + 1].Visible = false;
            tblrowPrimaNeta.Cells[Convert.ToInt32(ModError[totalmoderror].ToString()) + 1].Visible = false;
            tblrowDescuento.Cells[Convert.ToInt32(ModError[totalmoderror].ToString()) + 1].Visible = false;
            tblrowRecargo.Cells[Convert.ToInt32(ModError[totalmoderror].ToString()) + 1].Visible = false;
            tblrowCuota.Cells[Convert.ToInt32(ModError[totalmoderror].ToString()) + 1].Visible = false;
            tblrowCuotaPAT.Cells[Convert.ToInt32(ModError[totalmoderror].ToString()) + 1].Visible = false;
            tblrowSelModalidades.Cells[Convert.ToInt32(ModError[totalmoderror].ToString()) + 1].Visible = false;
            tblrowSelModEmitir.Cells[Convert.ToInt32(ModError[totalmoderror].ToString()) + 1].Visible = false;

            //CJ 10-04-2018
            tblrowDsctoCruzada.Cells[Convert.ToInt32(ModError[totalmoderror].ToString()) + 1].Visible = false;
            tblrowPrimaTotalDsctos.Cells[Convert.ToInt32(ModError[totalmoderror].ToString()) + 1].Visible = false;
            tblrowDsctoFamiliar.Cells[Convert.ToInt32(ModError[totalmoderror].ToString()) + 1].Visible = false;
            tblrowDsctoAgendaVencida.Cells[Convert.ToInt32(ModError[totalmoderror].ToString()) + 1].Visible = false;
            tblrowDsctosCampanaComercial.Cells[Convert.ToInt32(ModError[totalmoderror].ToString()) + 1].Visible = false;
        }

        if (ModError.Count == Planes.Tables[0].Rows.Count)
        {
            if (Session["MCA_SUSPENSION"].ToString() == "SI")
                UtilesWeb.EjecutaJs(this, "alert('" + ConfigurationManager.AppSettings["MensajeSuspension"] + "');");
            else
                UtilesWeb.EjecutaJs(this, "alert('" + ConfigurationManager.AppSettings["MensajeSinPlanes"] + "');");
        }
        else
        {
            if (Session["mca_tmarketing"].ToString() == "S")
            {
                GrabaDatosTmarketing(PolVeh.CodDocumAseg, PolVeh.NomAseg, PolVeh.ApePatAseg, PolVeh.ApeMatAseg, PolVeh.EmailAseg, PolVeh.FonoAseg, PolVeh.FonoAseg2, ConfigurationManager.AppSettings["Producto"].ToString(), PolVeh.CodDocum, PolVeh.Convenio, PolVeh.NumCotizacion);
            }

            tblResultados.Visible = true;
            tblDescRec.Visible = true;
            setSelectedPlan();
            //ClearSelectedPlan();
            tblBotonera.Visible = true;
        }
    }

    public void CalculaCuota(string primatotal, string tip_cuota, string num_cuotas, string descuento, 
        string cod_ramo, string dia_pago, int cont)
    {
        string valcuota;

        if (Session["CONV"].ToString() == "RIPLEYBI" || Session["CONV"].ToString() == "RIPLEY" || Session["CONV"].ToString() == "RIPLEYDESCU")
        {
            if (num_cuotas == "15")
                num_cuotas = "12";
            if (num_cuotas == "32")
                num_cuotas = "24";
            valcuota = Cobranza.CalculaCuotaSinInteres(primatotal, num_cuotas);
        }
        else
        {

            if (this.txtRecargo1.Text != "0")
                valcuota = Cobranza.CalculaCuota(primatotal, tip_cuota, num_cuotas, descuento, cod_ramo, dia_pago);
            else
                valcuota = Cobranza.CalculaCuota(primatotal, tip_cuota, num_cuotas, descuento /*"0"*/, cod_ramo, dia_pago);


        }

        if (tip_cuota == "GD")
            setlblCuota(valcuota, cont);
        else
            setlblCuotaPAT(valcuota, cont); 

    }

    public bool ValidaIngresoCampos()
    {
        if (UtilesWeb.ValidaTextBox(this, this.txtNumMatricula, ScriptManager1) &&
                              UtilesWeb.ValidaDrowDownList(this, this.drpMarca, ScriptManager1) &&
                              UtilesWeb.ValidaDrowDownList(this, this.drpModelo, ScriptManager1) &&
                              UtilesWeb.ValidaDrowDownList(this, this.drpSubModelo, ScriptManager1) &&
                              UtilesWeb.ValidaDrowDownList(this, this.drpAño, ScriptManager1) &&
                              UtilesWeb.ValidaTextBox(this, this.txtCodDocumAseg, ScriptManager1) &&
                              UtilesWeb.ValidaTextBox(this, this.txtNomAseg, ScriptManager1) &&
                              UtilesWeb.ValidaRadioButtons(this, this.rbtFranquiciaSi, this.rbtFranquiciaNo, ScriptManager1) &&
            //UtilesWeb.ValidaRadioButtons(this, this.rbtDañosSi, this.rbtDañosNo, ScriptManager1) &&
                              UtilesWeb.ValidaRadioButtons(this, this.rbtDueñoSi, this.rbtDueñoNo, ScriptManager1) &&
                              UtilesWeb.ValidaRadioButtons(this, this.rbtHijosSi, this.rbtHijosNo, ScriptManager1) &&
                              UtilesWeb.ValidaRadioButtons(this, this.rbtParticularSi, this.rbtParticularNo, ScriptManager1))
        {
            string cod_docum = this.txtCodDocumAseg.Text.Replace(".", "").Replace("-", "");
            DateTime fecha_min = new DateTime();
            DateTime fecha_max = new DateTime();

            if (DatosVigenciaEmisor.Visible == true)
            {
                if (UtilesWeb.ValidaTextBox(this, this.txtFechaIniVigencia, ScriptManager1) &&
                    UtilesWeb.ValidaTextBox(this, this.txtFechaFinVigencia, ScriptManager1))
                {
                    try
                    {
                        fecha_min = DateTime.ParseExact(txtFechaIniVigencia.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                        fecha_max = DateTime.ParseExact(txtFechaFinVigencia.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture);

                        if (fecha_max < fecha_min)
                        {
                            UtilesWeb.EjecutaJs(this, "alert('Las fechas de Vigencia están incorrectas, favor corregir');");
                            return false;
                        }
                    }
                    catch
                    {
                        UtilesWeb.EjecutaJs(this, "alert('Las fechas de Vigencia están incorrectas, favor corregir');");
                        return false;
                    }
                }
                else
                {
                    return false;
                }
            }


            //validacion familiar
            if (this.txtCodDocumFamiliar.Text != "")
            {

                if (drpTipoFamiliar.SelectedValue == "0")
                {
                    UtilesWeb.EjecutaJs(this, "alert('" + drpTipoFamiliar.ToolTip + "');");
                    return false;
                }
            }


            if (Session["mca_tmarketing"].ToString() == "S")
            {
                if (UtilesWeb.ValidaTextBox(this, this.txtFonoAseg, ScriptManager1) &&
                              UtilesWeb.ValidaTextBox(this, this.txtEmailAseg, ScriptManager1))
                {
                    if (!UtilesWeb.ValidaEmail(this.txtEmailAseg.Text))
                    {
                        UtilesWeb.EjecutaJs(this, "alert('La dirección de correo no es válida, favor corregir');");
                        this.txtEmailAseg.Text = "";
                        return false;
                    }

                    int intcod_docum = Convert.ToInt32(cod_docum.Substring(0, cod_docum.Length - 1));

                    if (intcod_docum <= 50000000)
                    {
                        if (UtilesWeb.ValidaDrowDownList(this, this.drpEdad, ScriptManager1))
                            return true;
                        else
                            return false;
                    }
                    return true;
                }
                else
                    return false;
            }
            else
            {
                int intcod_docum = Convert.ToInt32(cod_docum.Substring(0, cod_docum.Length - 1));

                if (intcod_docum <= 50000000)
                {
                    if (UtilesWeb.ValidaDrowDownList(this, this.drpEdad, ScriptManager1))
                        return true;
                    else
                        return false;
                }
                return true;
            }
        }
        else
            return false;

     


    }

    #region Asigna y Retorna Valores a la Tabla de Resultados
    public void ClearSelectedPlan()
    {
        Session["SelModalidades"] = null;

        this.chkselmod1.Checked = false;
        this.chkselmod2.Checked = false;
        this.chkselmod3.Checked = false;
        this.chkselmod4.Checked = false;
        this.chkselmod5.Checked = false;
        this.chkselmod6.Checked = false;
        this.chkselmod7.Checked = false;
        this.chkselmod8.Checked = false;
        this.chkselmod9.Checked = false;
        this.chkselmod10.Checked = false;
        this.chkselmod11.Checked = false;
        this.chkselmod12.Checked = false;
    }

    public void setSelectedPlan()
    {
        this.rdbselmod1.Checked = false;
        this.rdbselmod2.Checked = false;
        this.rdbselmod3.Checked = false;
        this.rdbselmod4.Checked = false;
        this.rdbselmod5.Checked = false;
        this.rdbselmod6.Checked = false;
        this.rdbselmod7.Checked = false;
        this.rdbselmod8.Checked = false;
        this.rdbselmod9.Checked = false;
        this.rdbselmod10.Checked = false;
        this.rdbselmod11.Checked = false;
        this.rdbselmod12.Checked = false;

        if (this.rdbselmod1.Visible == true)
        {
            this.rdbselmod1.Checked = true;
            return;
        }

        if (this.rdbselmod2.Visible == true)
        {
            this.rdbselmod2.Checked = true;
            return;
        }

        if (this.rdbselmod3.Visible == true)
        {
            this.rdbselmod3.Checked = true;
            return;
        }

        if (this.rdbselmod4.Visible == true)
        {
            this.rdbselmod4.Checked = true;
            return;
        }

        if (this.rdbselmod5.Visible == true)
        {
            this.rdbselmod5.Checked = true;
            return;
        }

        if (this.rdbselmod6.Visible == true)
        {
            this.rdbselmod6.Checked = true;
            return;
        }

        if (this.rdbselmod7.Visible == true)
        {
            this.rdbselmod7.Checked = true;
            return;
        }

        if (this.rdbselmod8.Visible == true)
        {
            this.rdbselmod8.Checked = true;
            return;
        }

        if (this.rdbselmod9.Visible == true)
        {
            this.rdbselmod9.Checked = true;
            return;
        }

        if (this.rdbselmod10.Visible == true)
        {
            this.rdbselmod10.Checked = true;
            return;
        }

        if (this.rdbselmod11.Visible == true)
        {
            this.rdbselmod11.Checked = true;
            return;
        }

        if (this.rdbselmod12.Visible == true)
        {
            this.rdbselmod12.Checked = true;
            return;
        }


    }

    public void setlblNomPlan(string valor, int id)
    {
        TextInfo UsaTextInfo = new CultureInfo("en-US", false).TextInfo;

        string Valor = UsaTextInfo.ToLower(valor);

        switch (id)
        {
            case 1:
                lblNomPlan1.Text = Valor;
                break;
            case 2:
                lblNomPlan2.Text = Valor;
                break;
            case 3:
                lblNomPlan3.Text = Valor;
                break;
            case 4:
                lblNomPlan4.Text = Valor;
                break;
            case 5:
                lblNomPlan5.Text = Valor;
                break;
            case 6:
                lblNomPlan6.Text = Valor;
                break;
            case 7:
                lblNomPlan7.Text = Valor;
                break;
            case 8:
                lblNomPlan8.Text = Valor;
                break;
            case 9:
                lblNomPlan9.Text = Valor;
                break;
            case 10:
                lblNomPlan10.Text = Valor;
                break;
            case 11:
                lblNomPlan11.Text = Valor;
                break;
            case 12:
                lblNomPlan12.Text = Valor;
                break;

            default:
                break;
        }

    }

    public void sethdfCodModalidad(string valor, int id)
    {
        switch (id)
        {
            case 1:
                hdfCodModalidad1.Value = valor;
                break;
            case 2:
                hdfCodModalidad2.Value = valor;
                break;
            case 3:
                hdfCodModalidad3.Value = valor;
                break;
            case 4:
                hdfCodModalidad4.Value = valor;
                break;
            case 5:
                hdfCodModalidad5.Value = valor;
                break;
            case 6:
                hdfCodModalidad6.Value = valor;
                break;
            case 7:
                hdfCodModalidad7.Value = valor;
                break;
            case 8:
                hdfCodModalidad8.Value = valor;
                break;
            case 9:
                hdfCodModalidad9.Value = valor;
                break;
            case 10:
                hdfCodModalidad10.Value = valor;
                break;
            case 11:
                hdfCodModalidad11.Value = valor;
                break;
            case 12:
                hdfCodModalidad12.Value = valor;
                break;
            default:
                break;
        }

    }

    public string gethdfCodModalidad(int id)
    {
        string valor = "";
        switch (id)
        {
            case 1:
                valor = hdfCodModalidad1.Value;
                return valor;
            case 2:
                valor = hdfCodModalidad2.Value;
                return valor;
            case 3:
                valor = hdfCodModalidad3.Value;
                return valor;
            case 4:
                valor = hdfCodModalidad4.Value;
                return valor;
            case 5:
                valor = hdfCodModalidad5.Value;
                return valor;
            case 6:
                valor = hdfCodModalidad6.Value;
                return valor;
            case 7:
                valor = hdfCodModalidad7.Value;
                return valor;
            case 8:
                valor = hdfCodModalidad8.Value;
                return valor;
            case 9:
                valor = hdfCodModalidad9.Value;
                return valor;
            case 10:
                valor = hdfCodModalidad10.Value;
                return valor;
            case 11:
                valor = hdfCodModalidad11.Value;
                return valor;
            case 12:
                valor = hdfCodModalidad12.Value;
                return valor;
            default:
                return valor;
        }

    }

    public string getlblNomModalidad(int id)
    {
        string valor = "";
        switch (id)
        {
            case 1:
                valor = lblNomPlan1.Text;
                return valor;
            case 2:
                valor = lblNomPlan2.Text;
                return valor;
            case 3:
                valor = lblNomPlan3.Text;
                return valor;
            case 4:
                valor = lblNomPlan4.Text;
                return valor;
            case 5:
                valor = lblNomPlan5.Text;
                return valor;
            case 6:
                valor = lblNomPlan6.Text;
                return valor;
            case 7:
                valor = lblNomPlan7.Text;
                return valor;
            case 8:
                valor = lblNomPlan8.Text;
                return valor;
            case 9:
                valor = lblNomPlan9.Text;
                return valor;
            case 10:
                valor = lblNomPlan10.Text;
                return valor;
            case 11:
                valor = lblNomPlan11.Text;
                return valor;
            case 12:
                valor = lblNomPlan12.Text;
                return valor;
            default:
                return valor;
        }

    }

    public string getrdbSelModalidad()
    {
        if (rdbselmod1.Checked == true)
            return rdbselmod1.ID;
        if (rdbselmod2.Checked == true)
            return rdbselmod2.ID;
        if (rdbselmod3.Checked == true)
            return rdbselmod3.ID;
        if (rdbselmod4.Checked == true)
            return rdbselmod4.ID;
        if (rdbselmod5.Checked == true)
            return rdbselmod5.ID;
        if (rdbselmod6.Checked == true)
            return rdbselmod6.ID;
        if (rdbselmod7.Checked == true)
            return rdbselmod7.ID;
        if (rdbselmod8.Checked == true)
            return rdbselmod8.ID;
        if (rdbselmod9.Checked == true)
            return rdbselmod9.ID;
        if (rdbselmod10.Checked == true)
            return rdbselmod10.ID;
        if (rdbselmod11.Checked == true)
            return rdbselmod11.ID;
        if (rdbselmod12.Checked == true)
            return rdbselmod12.ID;
        else
            return rdbselmod1.ID;
    }

    public void setlblPrimaNeta(string valor, int id)
    {
        string anioveh = Session["anio"].ToString();
        string anio20 = DateTime.Now.AddYears(-20).ToString("yyyy");
        string anio15 = DateTime.Now.AddYears(-15).ToString("yyyy");
        string anio10 = DateTime.Now.AddYears(-15).ToString("yyyy"); 
        /* string anio10 = DateTime.Now.AddYears(-10).ToString("yyyy"); */
        switch (id)
        {
        /* 
            case 1:
                lblPrimaNeta1.Text = valor;
                break;
            case 2:
                lblPrimaNeta2.Text = valor;
                break;
            case 3:
                lblPrimaNeta3.Text = valor;
                break;
            case 4:
                lblPrimaNeta4.Text = valor;
                break;
            case 5:
                lblPrimaNeta5.Text = valor;
                break;
            case 6:
                lblPrimaNeta6.Text = valor;
                break;
        */
            case 1:
                if (int.Parse(anio15) > int.Parse(anioveh) && int.Parse(anio20) <= int.Parse(anioveh))
                {
                    lblPrimaNeta1.Text = "-";
                    Session["Prima1"] = "-";
                    break;
                }
                else if (int.Parse(anio10) > int.Parse(anioveh) && int.Parse(anio20) <= int.Parse(anioveh))
                {
                    lblPrimaNeta1.Text = "-";
                    Session["Prima1"] = "-";
                    break;
                }
                    lblPrimaNeta1.Text = valor;
                    Session["Prima1"] = valor;
                    if (Session["PrimaN1"]== null)
                {
                    Session["PrimaN1"] = valor;
                }
                    break;
           
            case 2:
                if (int.Parse(anio15) > int.Parse(anioveh) && int.Parse(anio20) <= int.Parse(anioveh))
                {
                    lblPrimaNeta2.Text = "-";
                    Session["Prima2"] = "-";
                    break;
                }
                else if (int.Parse(anio10) > int.Parse(anioveh) && int.Parse(anio20) <= int.Parse(anioveh))
                {
                    lblPrimaNeta2.Text = "-";
                    Session["Prima2"] = "-";
                    break;
                }
                    lblPrimaNeta2.Text = valor;
                    Session["Prima2"] = valor;
                    if (Session["PrimaN2"] == null)
                    {
                        Session["PrimaN2"] = valor;
                    }
                    break;
              
            case 3:
                if (int.Parse(anio15) > int.Parse(anioveh) && int.Parse(anio20) <= int.Parse(anioveh))
                {
                    lblPrimaNeta3.Text = "-";
                    Session["Prima3"] = "-";
                    break;
                }
                else if (int.Parse(anio10) > int.Parse(anioveh) && int.Parse(anio20) <= int.Parse(anioveh))
                {
                    lblPrimaNeta3.Text = "-";
                    Session["Prima3"] = "-";
                    break;
                }
                    lblPrimaNeta3.Text = valor;
                    Session["Prima3"] = valor;
                    if (Session["PrimaN3"] == null)
                    {
                        Session["PrimaN3"] = valor;
                    }
                    break;
             
            case 4:
                if (int.Parse(anio15) > int.Parse(anioveh) && int.Parse(anio20) <= int.Parse(anioveh))
                {
                    lblPrimaNeta4.Text = "-";
                    Session["Prima4"] = "-";
                    break;
                }
                else if (int.Parse(anio10) > int.Parse(anioveh) && int.Parse(anio20) <= int.Parse(anioveh))
                {
                    lblPrimaNeta4.Text = "-";
                    Session["Prima4"] = "-";
                    break;
                }
                    lblPrimaNeta4.Text = valor;
                    Session["Prima4"] = valor;
                    if (Session["PrimaN4"] == null)
                    {
                        Session["PrimaN4"] = valor;
                    }
                    break;
                   
            case 5:
                if (int.Parse(anio15) > int.Parse(anioveh) && int.Parse(anio20) <= int.Parse(anioveh))
                {
                    lblPrimaNeta5.Text = "-";
                    Session["Prima5"] = "-";
                    break;
                }
                else if (int.Parse(anio10) > int.Parse(anioveh) && int.Parse(anio20) <= int.Parse(anioveh))
                {
                    lblPrimaNeta5.Text = valor;
                    Session["Prima5"] = valor;
                    break;
                }
                    lblPrimaNeta5.Text = valor;
                    Session["Prima5"] = valor;
                    if (Session["PrimaN5"] == null)
                    {
                        Session["PrimaN5"] = valor;
                    }
                    break;
                
            case 6:
                if (int.Parse(anio15) > int.Parse(anioveh) && int.Parse(anio20) <= int.Parse(anioveh))
                {
                    lblPrimaNeta5.Text = "-";
                    Session["Prima6"] = "-";
                    break;
                }
                else if (int.Parse(anio10) > int.Parse(anioveh) && int.Parse(anio20) <= int.Parse(anioveh))
                {
                    lblPrimaNeta5.Text = valor;
                    Session["Prima6"] = valor;
                    break;
                }
                    lblPrimaNeta6.Text = valor;
                    Session["Prima6"] = valor;
                    if (Session["PrimaN6"] == null)
                    {
                        Session["PrimaN6"] = valor;
                    }
                    break;
            case 7:
                lblPrimaNeta7.Text = valor;
                break;
            case 8:
                lblPrimaNeta8.Text = valor;
                break;
            case 9:
                lblPrimaNeta9.Text = valor;
                break;
            case 10:
                lblPrimaNeta10.Text = valor;
                break;
            case 11:
                lblPrimaNeta11.Text = valor;
                break;
            case 12:
                lblPrimaNeta12.Text = valor;
                break;
            default:
                break;
        }

    }

    public void setcssPrimaNeta(string valor, int id)
    {
        switch (id)
        {
            case 1:
                lblPrimaNeta1.CssClass = valor;
                break;
            case 2:
                lblPrimaNeta2.CssClass = valor;
                break;
            case 3:
                lblPrimaNeta3.CssClass = valor;
                break;
            case 4:
                lblPrimaNeta4.CssClass = valor;
                break;
            case 5:
                lblPrimaNeta5.CssClass = valor;
                break;
            case 6:
                lblPrimaNeta6.CssClass = valor;
                break;
            case 7:
                lblPrimaNeta7.CssClass = valor;
                break;
            case 8:
                lblPrimaNeta8.CssClass = valor;
                break;
            case 9:
                lblPrimaNeta9.CssClass = valor;
                break;
            case 10:
                lblPrimaNeta10.CssClass = valor;
                break;
            case 11:
                lblPrimaNeta11.CssClass = valor;
                break;
            case 12:
                lblPrimaNeta12.CssClass = valor;
                break;
            default:
                break;
        }

    }

    public void setlblPrimaComision(string valor, int id)
    {
        switch (id)
        {
            case 1:
                lblPrimaComision1.Text = valor;
                break;
            case 2:
                lblPrimaComision2.Text = valor;
                break;
            case 3:
                lblPrimaComision3.Text = valor;
                break;
            case 4:
                lblPrimaComision4.Text = valor;
                break;
            case 5:
                lblPrimaComision5.Text = valor;
                break;
            case 6:
                lblPrimaComision6.Text = valor;
                break;
            case 7:
                lblPrimaComision7.Text = valor;
                break;
            case 8:
                lblPrimaComision8.Text = valor;
                break;
            case 9:
                lblPrimaComision9.Text = valor;
                break;
            case 10:
                lblPrimaComision10.Text = valor;
                break;
            case 11:
                lblPrimaComision11.Text = valor;
                break;
            case 12:
                lblPrimaComision12.Text = valor;
                break;
            default:
                break;
        }

    }

    public void setlblDescuento(string valor, int id)
    {
        switch (id)
        {
            case 1:
                lblDescuento1.Text = valor;
                break;
            case 2:
                lblDescuento2.Text = valor;
                break;
            case 3:
                lblDescuento3.Text = valor;
                break;
            case 4:
                lblDescuento4.Text = valor;
                break;
            case 5:
                lblDescuento5.Text = valor;
                break;
            case 6:
                lblDescuento6.Text = valor;
                break;
            case 7:
                lblDescuento7.Text = valor;
                break;
            case 8:
                lblDescuento8.Text = valor;
                break;
            case 9:
                lblDescuento9.Text = valor;
                break;
            case 10:
                lblDescuento10.Text = valor;
                break;
            case 11:
                lblDescuento11.Text = valor;
                break;
            case 12:
                lblDescuento12.Text = valor;
                break;
            default:
                break;
        }

    }

    public void setlblRecargo(string valor, int id)
    {
        switch (id)
        {
            case 1:
                lblRecargo1.Text = valor;
                break;
            case 2:
                lblRecargo2.Text = valor;
                break;
            case 3:
                lblRecargo3.Text = valor;
                break;
            case 4:
                lblRecargo4.Text = valor;
                break;
            case 5:
                lblRecargo5.Text = valor;
                break;
            case 6:
                lblRecargo6.Text = valor;
                break;
            case 7:
                lblRecargo7.Text = valor;
                break;
            case 8:
                lblRecargo8.Text = valor;
                break;
            case 9:
                lblRecargo9.Text = valor;
                break;
            case 10:
                lblRecargo10.Text = valor;
                break;
            case 11:
                lblRecargo11.Text = valor;
                break;
            case 12:
                lblRecargo12.Text = valor;
                break;
            default:
                break;
        }

    }

    public string getlblDescuento(int id)
    {
        string valor = "";

        switch (id)
        {
            case 1:
                valor = lblDescuento1.Text;
                return valor;
            case 2:
                valor = lblDescuento2.Text;
                return valor;
            case 3:
                valor = lblDescuento3.Text;
                return valor;
            case 4:
                valor = lblDescuento4.Text;
                return valor;
            case 5:
                valor = lblDescuento5.Text;
                return valor;
            case 6:
                valor = lblDescuento6.Text;
                return valor;
            case 7:
                valor = lblDescuento7.Text;
                return valor;
            case 8:
                valor = lblDescuento8.Text;
                return valor;
            case 9:
                valor = lblDescuento9.Text;
                return valor;
            case 10:
                valor = lblDescuento10.Text;
                return valor;
            case 11:
                valor = lblDescuento11.Text;
                return valor;
            case 12:
                valor = lblDescuento12.Text;
                return valor;
            default:
                return valor;
        }

    }

    public string getlblRecargo(int id)
    {
        string valor = "";

        switch (id)
        {
            case 1:
                valor = lblRecargo1.Text;
                return valor;
            case 2:
                valor = lblRecargo2.Text;
                return valor;
            case 3:
                valor = lblRecargo3.Text;
                return valor;
            case 4:
                valor = lblRecargo4.Text;
                return valor;
            case 5:
                valor = lblRecargo5.Text;
                return valor;
            case 6:
                valor = lblRecargo6.Text;
                return valor;
            case 7:
                valor = lblRecargo7.Text;
                return valor;
            case 8:
                valor = lblRecargo8.Text;
                return valor;
            case 9:
                valor = lblRecargo9.Text;
                return valor;
            case 10:
                valor = lblRecargo10.Text;
                return valor;
            case 11:
                valor = lblRecargo11.Text;
                return valor;
            case 12:
                valor = lblRecargo12.Text;
                return valor;
            default:
                return valor;
        }

    }

    public string getlblPrimaNeta(int id)
    {
        string valor = "";

        if (this.chkComisionDif.Checked == true)
        {
            switch (id)
            {
                case 1:
                    valor = lblPrimaComision1.Text;
                    return valor;
                case 2:
                    valor = lblPrimaComision2.Text;
                    return valor;
                case 3:
                    valor = lblPrimaComision3.Text;
                    return valor;
                case 4:
                    valor = lblPrimaComision4.Text;
                    return valor;
                case 5:
                    valor = lblPrimaComision5.Text;
                    return valor;
                case 6:
                    valor = lblPrimaComision6.Text;
                    return valor;
                case 7:
                    valor = lblPrimaComision7.Text;
                    return valor;
                case 8:
                    valor = lblPrimaComision8.Text;
                    return valor;
                case 9:
                    valor = lblPrimaComision9.Text;
                    return valor;
                case 10:
                    valor = lblPrimaComision10.Text;
                    return valor;
                case 11:
                    valor = lblPrimaComision11.Text;
                    return valor;
                case 12:
                    valor = lblPrimaComision12.Text;
                    return valor;
                default:
                    return valor;
            }
        }
        else
        {

            switch (id)
            {
                case 1:
                  //modificacion patricio saavedra
                  //valor = lblPrimaNeta1.Text;
                    valor = Session["PrimaN1"].ToString();
                    return valor;
                case 2:
                  //valor = lblPrimaNeta2.Text;
                    valor = Session["PrimaN2"].ToString();
                    return valor;
                case 3:
                  //valor = lblPrimaNeta3.Text;
                    valor = Session["PrimaN3"].ToString();
                    return valor;
                case 4:
                  //valor = lblPrimaNeta4.Text;
                    valor = Session["PrimaN4"].ToString();
                    return valor;
                case 5:
                  //valor = lblPrimaNeta5.Text;
                    valor = Session["PrimaN5"].ToString();
                    return valor;
                case 6:
                  //valor = lblPrimaNeta6.Text;
                    valor = Session["PrimaN6"].ToString();
                    return valor;
                case 7:
                    valor = lblPrimaNeta7.Text;
                    return valor;
                case 8:
                    valor = lblPrimaNeta8.Text;
                    return valor;
                case 9:
                    valor = lblPrimaNeta9.Text;
                    return valor;
                case 10:
                    valor = lblPrimaNeta10.Text;
                    return valor;
                case 11:
                    valor = lblPrimaNeta11.Text;
                    return valor;
                case 12:
                    valor = lblPrimaNeta12.Text;
                    return valor;
                default:
                    return valor;
            }
        }

    }

    public string getlblPrimaNetaOriginal(int id)
    {
        string valor = "";

        switch (id)
        {
            case 1:
             // valor = lblPrimaNeta1.Text; 
                valor = Session["PrimaN1"].ToString();
                return valor;
            case 2:
             // valor = lblPrimaNeta2.Text;
                valor = Session["PrimaN2"].ToString();
                return valor;
            case 3:
             // valor = lblPrimaNeta3.Text;
                valor = Session["PrimaN3"].ToString();
                return valor;
            case 4:
             // valor = lblPrimaNeta4.Text;
                valor = Session["PrimaN4"].ToString();
                return valor;
            case 5:
             // valor = lblPrimaNeta5.Text;
                valor = Session["PrimaN5"].ToString();
                return valor;
            case 6:
             // valor = lblPrimaNeta6.Text;
                valor = Session["PrimaN6"].ToString();
                return valor;
            case 7:
                valor = lblPrimaNeta7.Text;
                return valor;
            case 8:
                valor = lblPrimaNeta8.Text;
                return valor;
            case 9:
                valor = lblPrimaNeta9.Text;
                return valor;
            case 10:
                valor = lblPrimaNeta10.Text;
                return valor;
            case 11:
                valor = lblPrimaNeta11.Text;
                return valor;
            case 12:
                valor = lblPrimaNeta12.Text;
                return valor;
            default:
                return valor;
        }

    }

    public string getlblPrimaTotal(int id)
    {
        string valor = "";

        switch (id)
        {
            case 1:
                valor = lblPrimaTotal1.Text;
                return valor;
            case 2:
                valor = lblPrimaTotal2.Text;
                return valor;
            case 3:
                valor = lblPrimaTotal3.Text;
                return valor;
            case 4:
                valor = lblPrimaTotal4.Text;
                return valor;
            case 5:
                valor = lblPrimaTotal5.Text;
                return valor;
            case 6:
                valor = lblPrimaTotal6.Text;
                return valor;
            case 7:
                valor = lblPrimaTotal7.Text;
                return valor;
            case 8:
                valor = lblPrimaTotal8.Text;
                return valor;
            case 9:
                valor = lblPrimaTotal9.Text;
                return valor;
            case 10:
                valor = lblPrimaTotal10.Text;
                return valor;
            case 11:
                valor = lblPrimaTotal11.Text;
                return valor;
            case 12:
                valor = lblPrimaTotal12.Text;
                return valor;
            default:
                return valor;
        }

    }

    public void setlblPrimaTotal(string valor, int id)
    {
        switch (id)
        {
            case 1:
                lblPrimaTotal1.Text = valor;
                break;
            case 2:
                lblPrimaTotal2.Text = valor;
                break;
            case 3:
                lblPrimaTotal3.Text = valor;
                break;
            case 4:
                lblPrimaTotal4.Text = valor;
                break;
            case 5:
                lblPrimaTotal5.Text = valor;
                break;
            case 6:
                lblPrimaTotal6.Text = valor;
                break;
            case 7:
                lblPrimaTotal7.Text = valor;
                break;
            case 8:
                lblPrimaTotal8.Text = valor;
                break;
            case 9:
                lblPrimaTotal9.Text = valor;
                break;
            case 10:
                lblPrimaTotal10.Text = valor;
                break;
            case 11:
                lblPrimaTotal11.Text = valor;
                break;
            case 12:
                lblPrimaTotal12.Text = valor;
                break;
            default:
                break;
        }

        //setlblPrimaTotalDsctos(valor, id);

    }

    public void setlblCuota(string valor, int id)
    {
        switch (id)
        {
            case 1:
                lblCuota1.Text = valor;
                break;
            case 2:
                lblCuota2.Text = valor;
                break;
            case 3:
                lblCuota3.Text = valor;
                break;
            case 4:
                lblCuota4.Text = valor;
                break;
            case 5:
                lblCuota5.Text = valor;
                break;
            case 6:
                lblCuota6.Text = valor;
                break;
            case 7:
                lblCuota7.Text = valor;
                break;
            case 8:
                lblCuota8.Text = valor;
                break;
            case 9:
                lblCuota9.Text = valor;
                break;
            case 10:
                lblCuota10.Text = valor;
                break;
            case 11:
                lblCuota11.Text = valor;
                break;
            case 12:
                lblCuota12.Text = valor;
                break;
            default:
                break;
        }

    }

    public string getlblCuota(int id)
    {
        string valor = "";

        switch (id)
        {
            case 1:
                valor = lblCuota1.Text;
                return valor;
            case 2:
                valor = lblCuota2.Text;
                return valor;
            case 3:
                valor = lblCuota3.Text;
                return valor;
            case 4:
                valor = lblCuota4.Text;
                return valor;
            case 5:
                valor = lblCuota5.Text;
                return valor;
            case 6:
                valor = lblCuota6.Text;
                return valor;
            case 7:
                valor = lblCuota7.Text;
                return valor;
            case 8:
                valor = lblCuota8.Text;
                return valor;
            case 9:
                valor = lblCuota9.Text;
                return valor;
            case 10:
                valor = lblCuota10.Text;
                return valor;
            case 11:
                valor = lblCuota11.Text;
                return valor;
            case 12:
                valor = lblCuota12.Text;
                return valor;
            default:
                return valor;
        }

    }

    public void setlblCuotaPAT(string valor, int id)
    {
        switch (id)
        {
            case 1:
                lblCuotaPAT1.Text = valor;
                break;
            case 2:
                lblCuotaPAT2.Text = valor;
                break;
            case 3:
                lblCuotaPAT3.Text = valor;
                break;
            case 4:
                lblCuotaPAT4.Text = valor;
                break;
            case 5:
                lblCuotaPAT5.Text = valor;
                break;
            case 6:
                lblCuotaPAT6.Text = valor;
                break;
            case 7:
                lblCuotaPAT7.Text = valor;
                break;
            case 8:
                lblCuotaPAT8.Text = valor;
                break;
            case 9:
                lblCuotaPAT9.Text = valor;
                break;
            case 10:
                lblCuotaPAT10.Text = valor;
                break;
            case 11:
                lblCuotaPAT11.Text = valor;
                break;
            case 12:
                lblCuotaPAT12.Text = valor;
                break;
            default:
                break;
        }

    }

    public string getlblCuotaPAT(int id)
    {
        string valor = "";

        switch (id)
        {
            case 1:
                valor = lblCuotaPAT1.Text;
                return valor;
            case 2:
                valor = lblCuotaPAT2.Text;
                return valor;
            case 3:
                valor = lblCuotaPAT3.Text;
                return valor;
            case 4:
                valor = lblCuotaPAT4.Text;
                return valor;
            case 5:
                valor = lblCuotaPAT5.Text;
                return valor;
            case 6:
                valor = lblCuotaPAT6.Text;
                return valor;
            case 7:
                valor = lblCuotaPAT7.Text;
                return valor;
            case 8:
                valor = lblCuotaPAT8.Text;
                return valor;
            case 9:
                valor = lblCuotaPAT9.Text;
                return valor;
            case 10:
                valor = lblCuotaPAT10.Text;
                return valor;
            case 11:
                valor = lblCuotaPAT11.Text;
                return valor;
            case 12:
                valor = lblCuotaPAT12.Text;
                return valor;
            default:
                return valor;
        }

    }
    #endregion

    #region Descuento Campaña comercial 
    public void setVentaCruzada(string valor, int id)
    {
        switch (id)
        {
            case 1:
                lblDsctoCruzada1.Text = valor.Replace(",",".");
                break;
            case 2:
                lblDsctoCruzada2.Text = valor.Replace(",",".");
                break;
            case 3:
                lblDsctoCruzada3.Text = valor.Replace(",",".");
                break;
            case 4:
                lblDsctoCruzada4.Text = valor.Replace(",",".");
                break;
            case 5:
                lblDsctoCruzada5.Text = valor.Replace(",",".");
                break;
            case 6:
                lblDsctoCruzada6.Text = valor.Replace(",",".");
                break;
            case 7:
                lblDsctoCruzada7.Text = valor.Replace(",",".");
                break;
            case 8:
                lblDsctoCruzada8.Text = valor.Replace(",",".");
                break;
            case 9:
                lblDsctoCruzada9.Text = valor.Replace(",",".");
                break;
            case 10:
                lblDsctoCruzada10.Text = valor.Replace(",",".");
                break;
            case 11:
                lblDsctoCruzada11.Text = valor.Replace(",",".");
                break;
            case 12:
                lblDsctoCruzada12.Text = valor.Replace(",",".");
                break;
            default:
                break;
        }

    }

    public string getVentaCruzada(int id)
    {
        string valor = "";

        switch (id)
        {
            case 1:
                valor = lblDsctoCruzada1.Text;
                return valor;
            case 2:
                valor = lblDsctoCruzada2.Text;
                return valor;
            case 3:
                valor = lblDsctoCruzada3.Text;
                return valor;
            case 4:
                valor = lblDsctoCruzada4.Text;
                return valor;
            case 5:
                valor = lblDsctoCruzada5.Text;
                return valor;
            case 6:
                valor = lblDsctoCruzada6.Text;
                return valor;
            case 7:
                valor = lblDsctoCruzada7.Text;
                return valor;
            case 8:
                valor = lblDsctoCruzada8.Text;
                return valor;
            case 9:
                valor = lblDsctoCruzada9.Text;
                return valor;
            case 10:
                valor = lblDsctoCruzada10.Text;
                return valor;
            case 11:
                valor = lblDsctoCruzada11.Text;
                return valor;
            case 12:
                valor = lblDsctoCruzada12.Text;
                return valor;
            default:
                return valor;
        }

    }

    public void setDsctoFamiliar(string valor, int id)
    {
        switch (id)
        {
            case 1:
                lblDsctoFamiliar1.Text = valor;
                break;
            case 2:
                lblDsctoFamiliar2.Text = valor;
                break;
            case 3:
                lblDsctoFamiliar3.Text = valor;
                break;
            case 4:
                lblDsctoFamiliar4.Text = valor;
                break;
            case 5:
                lblDsctoFamiliar5.Text = valor;
                break;
            case 6:
                lblDsctoFamiliar6.Text = valor;
                break;
            case 7:
                lblDsctoFamiliar7.Text = valor;
                break;
            case 8:
                lblDsctoFamiliar8.Text = valor;
                break;
            case 9:
                lblDsctoFamiliar9.Text = valor;
                break;
            case 10:
                lblDsctoFamiliar10.Text = valor;
                break;
            case 11:
                lblDsctoFamiliar11.Text = valor;
                break;
            case 12:
                lblDsctoFamiliar12.Text = valor;
                break;
            default:
                break;
        }

    }

    public string getDsctoFamiliar(int id)
    {
        string valor = "";

        switch (id)
        {
            case 1:
                valor = lblDsctoFamiliar1.Text;
                return valor;
            case 2:
                valor = lblDsctoFamiliar2.Text;
                return valor;
            case 3:
                valor = lblDsctoFamiliar3.Text;
                return valor;
            case 4:
                valor = lblDsctoFamiliar4.Text;
                return valor;
            case 5:
                valor = lblDsctoFamiliar5.Text;
                return valor;
            case 6:
                valor = lblDsctoFamiliar6.Text;
                return valor;
            case 7:
                valor = lblDsctoFamiliar7.Text;
                return valor;
            case 8:
                valor = lblDsctoFamiliar8.Text;
                return valor;
            case 9:
                valor = lblDsctoFamiliar9.Text;
                return valor;
            case 10:
                valor = lblDsctoFamiliar10.Text;
                return valor;
            case 11:
                valor = lblDsctoFamiliar11.Text;
                return valor;
            case 12:
                valor = lblDsctoFamiliar12.Text;
                return valor;
            default:
                return valor;
        }

    }

    #region Total Descuentos Cotizacion
    public void setDsctoCampanaComercial(string valor, int id)
    {
        switch (id)
        {
            case 1:
                lblDsctoCampanaComercial1.Text = valor;
                break;
            case 2:
                lblDsctoCampanaComercial2.Text = valor;
                break;
            case 3:
                lblDsctoCampanaComercial3.Text = valor;
                break;
            case 4:
                lblDsctoCampanaComercial4.Text = valor;
                break;
            case 5:
                lblDsctoCampanaComercial5.Text = valor;
                break;
            case 6:
                lblDsctoCampanaComercial6.Text = valor;
                break;
            case 7:
                lblDsctoCampanaComercial7.Text = valor;
                break;
            case 8:
                lblDsctoCampanaComercial8.Text = valor;
                break;
            case 9:
                lblDsctoCampanaComercial9.Text = valor;
                break;
            case 10:
                lblDsctoCampanaComercial10.Text = valor;
                break;
            case 11:
                lblDsctoCampanaComercial11.Text = valor;
                break;
            case 12:
                lblDsctoCampanaComercial12.Text = valor;
                break;
            default:
                break;
        }

    }

    public string getDsctoCampanaComercial(int id)
    {
        string valor = "";

        switch (id)
        {
            case 1:
                valor = lblDsctoCampanaComercial1.Text;
                return valor;
            case 2:
                valor = lblDsctoCampanaComercial2.Text;
                return valor;
            case 3:
                valor = lblDsctoCampanaComercial3.Text;
                return valor;
            case 4:
                valor = lblDsctoCampanaComercial4.Text;
                return valor;
            case 5:
                valor = lblDsctoCampanaComercial5.Text;
                return valor;
            case 6:
                valor = lblDsctoCampanaComercial6.Text;
                return valor;
            case 7:
                valor = lblDsctoCampanaComercial7.Text;
                return valor;
            case 8:
                valor = lblDsctoCampanaComercial8.Text;
                return valor;
            case 9:
                valor = lblDsctoCampanaComercial9.Text;
                return valor;
            case 10:
                valor = lblDsctoCampanaComercial10.Text;
                return valor;
            case 11:
                valor = lblDsctoCampanaComercial11.Text;
                return valor;
            case 12:
                valor = lblDsctoCampanaComercial12.Text;
                return valor;
            default:
                return valor;
        }

    }

    #endregion


    public void setlblPrimaTotalDsctos(string primatotal, int id)
    {

        System.Globalization.NumberFormatInfo nfi = new
       System.Globalization.NumberFormatInfo();
        nfi.NumberGroupSeparator = ",";

        Decimal dsctoVentaCruzadoRedondeado = 0;
        Decimal dsctoFamiliarRedondeado = 0;
        Decimal dsctoAgendaVencidaRedondeado = 0;
        try
        {

            primatotal = primatotal.Replace(".", ",");

            if (RowDsctoVentaCruzada)
            {
                dsctoVentaCruzadoRedondeado = Math.Round((Convert.ToDecimal(primatotal.Replace(",", "."), nfi) * Convert.ToDecimal(porcDsctoCruzado.Replace(",", "."), nfi)) / 100, 2);//con redondeo
                //dsctoVentaCruzado = (Convert.ToDecimal(primatotal,nfi) * (Convert.ToDecimal(porcDsctoCruzado,nfi))) / 100;//
                setVentaCruzada(dsctoVentaCruzadoRedondeado.ToString().Replace(",", "."), id);
            }

            else
            {
                this.tblrowDsctoCruzada.Visible = false;
            }
            if (RowDsctoFamiliar)
            {
                decimal porcefami = ((String.IsNullOrEmpty(porcDsctoFamiliar)) ? 0 : Convert.ToDecimal(porcDsctoFamiliar.Replace(",", "."), nfi));
                dsctoFamiliarRedondeado = Math.Round((Convert.ToDecimal(primatotal.Replace(",", "."), nfi) * porcefami) / 100, 2);
                this.tblrowDsctoFamiliar.Visible = true;
                setDsctoFamiliar(dsctoFamiliarRedondeado.ToString().Replace(",", "."), id);
            }
            else
            {
                this.tblrowDsctoFamiliar.Visible = false ;
            }


            if (RowDsctoAgendaVencida)
            {
                decimal porceAgendaVencida = ((String.IsNullOrEmpty(porcDsctoAgendaVencida)) ? 0 : Convert.ToDecimal(porcDsctoAgendaVencida.Replace(",", "."), nfi));
                dsctoAgendaVencidaRedondeado = Math.Round((Convert.ToDecimal(primatotal.Replace(",", "."), nfi) * porceAgendaVencida) / 100, 2);
                setlblDsctoAgendaVencida(dsctoAgendaVencidaRedondeado.ToString().Replace(",", "."), id);
            }
            else
            {
                this.tblrowDsctoAgendaVencida.Visible = false;
            }

            String valor = (Convert.ToDecimal(primatotal, nfi) - (dsctoVentaCruzadoRedondeado + dsctoFamiliarRedondeado + dsctoAgendaVencidaRedondeado)).ToString("N2");
            // Descuento  Total Campaña cOMENCIAL , suma de los descuentos 
            setDsctoCampanaComercial((dsctoVentaCruzadoRedondeado + dsctoFamiliarRedondeado + dsctoAgendaVencidaRedondeado).ToString().Replace(",", "."), id);


            //switch (id)
            //{
            //    case 1:
            //        lblPrimaTotalDsctos1.Text = valor.Replace(",",".");;
            //        break;
            //    case 2:
            //        lblPrimaTotalDsctos2.Text = valor.Replace(",",".");;
            //        break;
            //    case 3:
            //        lblPrimaTotalDsctos3.Text = valor.Replace(",",".");;
            //        break;
            //    case 4:
            //        lblPrimaTotalDsctos4.Text = valor.Replace(",",".");;
            //        break;
            //    case 5:
            //        lblPrimaTotalDsctos5.Text = valor.Replace(",",".");;
            //        break;
            //    case 6:
            //        lblPrimaTotalDsctos6.Text = valor.Replace(",",".");;
            //        break;
            //    case 7:
            //        lblPrimaTotalDsctos7.Text = valor.Replace(",",".");;
            //        break;
            //    case 8:
            //        lblPrimaTotalDsctos8.Text = valor.Replace(",",".");;
            //        break;
            //    case 9:
            //        lblPrimaTotalDsctos9.Text = valor.Replace(",",".");;
            //        break;
            //    case 10:
            //        lblPrimaTotalDsctos10.Text = valor.Replace(",",".");;
            //        break;
            //    case 11:
            //        lblPrimaTotalDsctos11.Text = valor.Replace(",",".");;
            //        break;
            //    case 12:
            //        lblPrimaTotalDsctos12.Text = valor.Replace(",",".");;
            //        break;
            //    default:
            //        break;
            //}
            //setDsctoCampanaComercial(descuentoAdicional, i + 1);
        }
        catch (Exception EX)
        {
            EX.Message.ToString();
        }
    }

    public string getlblPrimaTotalDsctos(int id)
    {
        string valor = "";

        switch (id)
        {
            case 1:
                valor = lblPrimaTotalDsctos1.Text;
                return valor;
            case 2:
                valor = lblPrimaTotalDsctos2.Text;
                return valor;
            case 3:
                valor = lblPrimaTotalDsctos3.Text;
                return valor;
            case 4:
                valor = lblPrimaTotalDsctos4.Text;
                return valor;
            case 5:
                valor = lblPrimaTotalDsctos5.Text;
                return valor;
            case 6:
                valor = lblPrimaTotalDsctos6.Text;
                return valor;
            case 7:
                valor = lblPrimaTotalDsctos7.Text;
                return valor;
            case 8:
                valor = lblPrimaTotalDsctos8.Text;
                return valor;
            case 9:
                valor = lblPrimaTotalDsctos9.Text;
                return valor;
            case 10:
                valor = lblPrimaTotalDsctos10.Text;
                return valor;
            case 11:
                valor = lblPrimaTotalDsctos11.Text;
                return valor;
            case 12:
                valor = lblPrimaTotalDsctos12.Text;
                return valor;
            default:
                return valor;
        }

    }

    public void setlblDsctoAgendaVencida(string valor, int id)
    {
        switch (id)
        {
            case 1:
                lblDsctoAgendaVenc1.Text = valor.Replace(",",".");
                break;
            case 2:
                lblDsctoAgendaVenc2.Text = valor.Replace(",", ".");
                break;
            case 3:
                lblDsctoAgendaVenc3.Text = valor.Replace(",", ".");
                break;
            case 4:
                lblDsctoAgendaVenc4.Text = valor.Replace(",", ".");
                break;
            case 5:
                lblDsctoAgendaVenc5.Text = valor.Replace(",", ".");
                break;
            case 6:
                lblDsctoAgendaVenc6.Text = valor.Replace(",", ".");
                break;
            case 7:
                lblDsctoAgendaVenc7.Text = valor.Replace(",", ".");
                break;
            case 8:
                lblDsctoAgendaVenc8.Text = valor.Replace(",", ".");
                break;
            case 9:
                lblDsctoAgendaVenc9.Text = valor.Replace(",", ".");
                break;
            case 10:
                lblDsctoAgendaVenc10.Text = valor.Replace(",", ".");
                break;
            case 11:
                lblDsctoAgendaVenc11.Text = valor.Replace(",", ".");
                break;
            case 12:
                lblDsctoAgendaVenc12.Text = valor.Replace(",", ".");
                break;
            default:
                break;
        }

    }

    public string getlblDsctoAgendaVencida(int id)
    {
        string valor = "";

        switch (id)
        {
            case 1:
                valor = lblDsctoAgendaVenc1.Text;
                return valor;
            case 2:
                valor = lblDsctoAgendaVenc2.Text;
                return valor;
            case 3:
                valor = lblDsctoAgendaVenc3.Text;
                return valor;
            case 4:
                valor = lblDsctoAgendaVenc4.Text;
                return valor;
            case 5:
                valor = lblDsctoAgendaVenc5.Text;
                return valor;
            case 6:
                valor = lblDsctoAgendaVenc6.Text;
                return valor;
            case 7:
                valor = lblDsctoAgendaVenc7.Text;
                return valor;
            case 8:
                valor = lblDsctoAgendaVenc8.Text;
                return valor;
            case 9:
                valor = lblDsctoAgendaVenc9.Text;
                return valor;
            case 10:
                valor = lblDsctoAgendaVenc10.Text;
                return valor;
            case 11:
                valor = lblDsctoAgendaVenc11.Text;
                return valor;
            case 12:
                valor = lblDsctoAgendaVenc12.Text;
                return valor;
            default:
                return valor;
        }

    }

    #endregion


    public TableCell CreaCelda(string valor)
    {
        TableCell celda = new TableCell();
        celda.Text = valor;

        return celda;
    }

    protected void ImgCotizar_Click(object sender, EventArgs e)
    {
        Poliza PolVeh = new Poliza();
        try
        {
            if (ValidaIngresoCampos())
            {
                string num_cotizacion = GeneraCotizacion(out PolVeh);
                if (num_cotizacion != "N")
                {
                    ImprimeCotizacion(num_cotizacion);
                   
                }
                  
            }
        }
        catch (Exception ex)
        {
            System.Diagnostics.StackTrace Stack = new System.Diagnostics.StackTrace(ex, true);
            int errorlineno = Stack.GetFrame(0).GetFileLineNumber();
            int errorcol = Stack.GetFrame(0).GetFileColumnNumber();

            UtilesWeb.EnviaCorreoAcusete(ex.Message, "Cot. Veh. Livianos - Cotizador.asxp - ImgCotizar_Click - Linea: " + errorlineno + " - " + errorcol);
        }
    }

    protected string GeneraCotizacion(out Poliza PolVeh)
    {
        PolVeh = null;
        if (Session["SelModalidades"] == null)
        {
            UtilesWeb.EjecutaJs(this, "alert('Por favor seleccione al menos un plan para cotizar');");
            return "N";
        }
        else
        {
           
            ArrayList arr = new ArrayList();
            if (Session["SelModalidades"] != null)
            {
                arr = (ArrayList)Session["SelModalidades"];
            }

            int mca_sel = 0;

            for (int i = 0; i < arr.Count; i++)
            {
                if (arr[i].ToString() == "1")
                    mca_sel++;
            }

            if (mca_sel == 3)
            {
                UtilesWeb.EjecutaJs(this, "alert('Por favor seleccione al menos un plan para cotizar');");
                return "N";
            }
            else
            {
                //Poliza PolVeh = Poliza.CargaPoliza();
                PolVeh = Poliza.CargaPoliza();
                string strModalidades = "";
                string prima_totalDesctosCruzado = "";
                String totalDescuentosCampaniaComercial = "";
                string prima_total = "";
                System.Globalization.NumberFormatInfo nfi = new
    System.Globalization.NumberFormatInfo();
                nfi.NumberGroupSeparator = ",";

                /*
                if (PolVeh.NumCotizacion != "")
                {
                    num_cotizacion = PolVeh.NumCotizacion;
                }
                */

                PolVeh.NumCotizacion = "";
                PolVeh.ID = "";

                GetDatosFormulario();

                #region for
                for (int i = 0; i < arr.Count; i++)
                {
                    if (arr[i].ToString() != "1")
                    {
                        string id = arr[i].ToString();

                        //int id_sel = Convert.ToInt32(id.Substring(id.Length - 1, 1));

                        int id_sel;

                        if (id.Length < 11)
                            id_sel = Convert.ToInt32(id.Substring(id.Length - 1, 1));
                        else
                            id_sel = Convert.ToInt32(id.Substring(id.Length - 2, 2));

                        string cod_modalidad = gethdfCodModalidad(id_sel);
                        string prima_neta = getlblPrimaNeta(id_sel);

                        string descuento = getlblDescuento(id_sel);
                        string recargo = getlblRecargo(id_sel);

                        string descrecarg;

                        if (descuento == "0.00")
                            descrecarg = recargo;
                        else
                            descrecarg = descuento;

                         prima_total = getlblPrimaTotal(id_sel);

                        //INTEGRACION CAMPAÑA COMERCIAL 
                        //string prima_totalDesctosCruzado = getlblPrimaTotalDsctos(id_sel);
                         totalDescuentosCampaniaComercial = getDsctoCampanaComercial(id_sel);
                        if (totalDescuentosCampaniaComercial != "") { totalDescuentosCampaniaComercial = "-" + totalDescuentosCampaniaComercial; } else { totalDescuentosCampaniaComercial = "0"; }

                        descrecarg = Convert.ToString(Convert.ToDecimal(descrecarg.Replace(",", "."), nfi) + Convert.ToDecimal(totalDescuentosCampaniaComercial.Replace(",", "."), nfi));

                      

                        strModalidades = strModalidades + cod_modalidad + "$" + prima_neta + "#" + descrecarg + "|";

                       


                      
                    }
                }
                #endregion

                DataRow grabavehiculo = Cotiza.GrabaVehiculoCot(PolVeh.NumMatricula, PolVeh.CodDocumAseg, PolVeh.CodMarca, PolVeh.CodModelo, PolVeh.CodSubModelo, PolVeh.AñoFab, PolVeh.ID);

                PolVeh.ID = grabavehiculo["P_ID"].ToString();

                DataRow grabatercero = Tercero.GuardaNomTer(PolVeh.CodDocumAseg, PolVeh.ApePatAseg, PolVeh.ApeMatAseg, PolVeh.NomAseg);

                /*CJSS*/
                strModalidades = strModalidades.Replace(',', '.');//SE CAIA DEPENDIENDO DEL SERVIDOR CON FORMATO COMAS

                DataRow grabacotizacion = Cotiza.GrabaCotizacion(PolVeh.CodDocum, PolVeh.CodDocumAseg,
                    PolVeh.NumMatricula, strModalidades, PolVeh.NumCotizacion, PolVeh.CodRamo, PolVeh.MontoRC,
                    PolVeh.SexoAseg, PolVeh.EdadAseg, PolVeh.RCExceso, PolVeh.ID, PolVeh.Fact48, PolVeh.Convenio, PolVeh.CobOpc, PolVeh.McaMel, PolVeh.FechaInicioVigencia, PolVeh.FechaFinVigencia);
                /*FIN CJSS*/

                PolVeh.NumCotizacion = grabacotizacion["p_num_cotizacion"].ToString();

                //FMOUAT

                #region guarda respuestas y preguntas1

                string hijos, franquicia, danospre;
                if (PolVeh.PreguntaHijos == "S") hijos = "SI"; else hijos = "NO";
                if (PolVeh.PreguntaFranquicia == "S") franquicia = "SI"; else franquicia = "NO";
                //if (PolVeh.PreguntaDanosPre =="S") danospre = "SI"; else danospre="NO";

                bool actupregveh = Cotiza.actualizaPregVeh(PolVeh.NumCotizacion, PolVeh.PreguntaHijos.ToUpper(), PolVeh.PreguntaFranquicia.ToUpper(), "");

                bool grabapreguntahijo = Cotiza.RegistraPregCotizacion(1, Convert.ToInt32(PolVeh.CodRamo), lblPregHijos.Text.ToUpper(), hijos, PolVeh.NumCotizacion, PolVeh.NumPoliza);
                bool grabapreguntafranq = Cotiza.RegistraPregCotizacion(1, Convert.ToInt32(PolVeh.CodRamo), lblPregFranquicia.Text.ToUpper(), franquicia.ToUpper(), PolVeh.NumCotizacion, PolVeh.NumPoliza);
                //bool grabapreguntadanos = Cotiza.RegistraPregCotizacion(1, Convert.ToInt32(PolVeh.CodRamo), lblPregDanos.Text.ToUpper(), danospre.ToUpper(), PolVeh.NumCotizacion, PolVeh.NumPoliza);

                #endregion

                DataRow updcotizacion = Cotiza.updCotizacionSiniestros(PolVeh.NumCotizacion, PolVeh.CantSiniestros, PolVeh.MontoSiniestros);

                GrabaDescuento(PolVeh.NumCotizacion);

                DataRow grabacomision;
                //if (PolVeh.CodCuadroCom != "")
                grabacomision = Cotiza.GrabaComision(PolVeh.NumCotizacion, PolVeh.CodCuadroCom);

                #region SE GUARDA EL DETALLE DE LOS DESCUENTOS CAMPAÑA COMERCIAL
                //integracion campaña comercial 


                if (porcDsctoAgendaVencida == "") porcDsctoAgendaVencida = "0";
                if (porcDsctoFamiliar == "") porcDsctoFamiliar = "0";
                if (porcDsctoCruzado == "") porcDsctoCruzado = "0";
                string sumadescuentos = lbltblrowDsctoCampanaComercial.Text.Replace("-", "").Replace("%", "").Replace("(", "").Replace(")", "").Trim();
                if (sumadescuentos == "") sumadescuentos = "0";
                Decimal P_SUMA_DSCTOS = Convert.ToDecimal(sumadescuentos);

                DataRow GuardaDetalleDescuentos = Cotiza.GuardaDetalleDescuentos(PolVeh.NumCotizacion, Convert.ToDecimal(porcDsctoFamiliar), Convert.ToDecimal(porcDsctoAgendaVencida), Convert.ToDecimal(porcDsctoCruzado), Convert.ToDecimal(prima_total.Replace(",", "."), nfi), P_SUMA_DSCTOS, Convert.ToDecimal(totalDescuentosCampaniaComercial.Replace(",", "."), nfi), Convert.ToDecimal(prima_total.Replace(",", "."), nfi));


                #endregion



                if (Session["mca_tmarketing"].ToString() == "S")
                {
                    GrabaDatosTmarketing(PolVeh.CodDocumAseg, PolVeh.NomAseg, PolVeh.ApePatAseg, PolVeh.ApeMatAseg, PolVeh.EmailAseg, PolVeh.FonoAseg, PolVeh.FonoAseg2, ConfigurationManager.AppSettings["Producto"].ToString(), PolVeh.CodDocum, PolVeh.Convenio, PolVeh.NumCotizacion);
                }

                //if (grabavehiculo["P_ERROR"].ToString() == "0" && grabacotizacion["P_ERROR"].ToString() == "0" && grabatercero["P_ERROR"].ToString() == "0")
                if (grabavehiculo["P_ERROR"].ToString() == "0" && grabacotizacion["P_ERROR"].ToString() == "0")
                    return PolVeh.NumCotizacion;
                else
                {
                    UtilesWeb.EjecutaJs(this, "alert('Se ha producido un error al generar su cotizacion, por favor intentelo más tarde');");
                    return "N";
                }
            }
        }
    }

    protected void ImprimeCotizacion(string num_cotizacion)
    {
        try
        {
            Poliza PolVeh = Poliza.CargaPoliza();
            string num_cuotas_pat = drpValCuotaPAT.SelectedValue.ToString();
            string convenio = PolVeh.Convenio;
            string url;

            if (!cotizaMapfre(convenio))
                url = GeneraPDFCotizacion(PolVeh.NumCotizacion);
            else
                url = GeneraPDFNuevaCotizacion(num_cuotas_pat, PolVeh.NumCotizacion);

            if (url != "")
            {
                Thread.Sleep(8000);
                UtilesWeb.OpenNewWindow(Page, url);
            }
            else
            {
                UtilesWeb.EjecutaJs(this, "alert('Se ha producido un error al generar su cotizacion, por favor intentelo más tarde');");
            }
        }
        catch
        {
            UtilesWeb.EjecutaJs(this, "alert('Se ha producido un error al generar su cotizacion, por favor intentelo más tarde');");
        }


    }

    protected string GeneraPDFCotizacion(string num_cotizacion)
    {
        try
        {
            DataRow imprimecotizacion = Cotiza.ImprimeCotizacion(num_cotizacion);

            string link = "";

            if (imprimecotizacion["P_ERROR"].ToString() == "")
            {
                string url = ConfigurationManager.AppSettings["Server"] + "/pdf/";

                link = url + imprimecotizacion["P_NOM_FIC"].ToString();

                System.Threading.Thread.Sleep(6000);

                //link = FirmaDigital.FirmaDocumento(link);
                ////link = FirmaDigital.FirmaDocumentoSimple(link);

                ////Thread.Sleep(5000);
            }
            else
                link = "";

            return link;
        }
        catch (Exception ex)
        {
            throw new Exception("GeneraPDFCotizacion: " + ex.Message.ToString());
        }

    }

    protected string GeneraPDFNuevaCotizacion(string num_cuotas_pat, string num_cotizacion)
    {
        try
        {
            DataRow imprimecotizacion;

            if (Session["CONV"].ToString() == "AUTOANTIGUO")
                imprimecotizacion = Cotiza.ImprimeNuevaCotizacionAntiguo(num_cuotas_pat, num_cotizacion);
            else
                imprimecotizacion = Cotiza.ImprimeNuevaCotizacion(num_cuotas_pat, num_cotizacion);

            string link = "";

            if (imprimecotizacion["P_ERROR"].ToString() == "")
            {
                string url = ConfigurationManager.AppSettings["Server"] + "/pdf/";

                link = url + imprimecotizacion["P_NOM_FIC"].ToString();

                System.Threading.Thread.Sleep(6000);

            }
            else
                link = "";

            return link;
        }
        catch (Exception ex)
        {
            throw new Exception("Error GeneraPDFNuevaCotizacion: " + ex.Message.ToString());
        }

    }

    protected void chkselmod_CheckedChanged(object sender, EventArgs e)
    {
        try
        {

            ArrayList arr;
            if (Session["SelModalidades"] != null)
            {
                arr = (ArrayList)Session["SelModalidades"];
            }
            else
            {
                arr = new ArrayList();
                for (int i = 0; i < Convert.ToInt32(ConfigurationManager.AppSettings["MaxModalidadesSelect"]); i++)
                    arr.Add("1");

                Session["SelModalidades"] = arr;
            }

            int cant_max_mod = Convert.ToInt32(ConfigurationManager.AppSettings["MaxModalidadesSelect"]);
            string max = "NO";

            if (((CheckBox)sender).Checked == true)
            {

                for (int i = 0; i < cant_max_mod; i++)
                {
                    if (arr[i].ToString() == "1")
                    {
                        arr[i] = ((CheckBox)sender).ID.ToString();
                        max = "NO";
                        break;
                    }
                    else
                    {
                        max = "SI";
                    }

                }

                if (max == "SI")
                {
                    ((CheckBox)sender).Checked = false;
                    UtilesWeb.EjecutaJs(this, "alert('Por favor, seleccione solo 3 planes para cotizar');");
                }
            }
            else
            {
                for (int i = 0; i < cant_max_mod; i++)
                {
                    if (arr[i].ToString() == ((CheckBox)sender).ID)
                        arr[i] = "1";
                }
            }
        }
        catch (Exception ex)
        {
            string msgError = ex.Message.IndexOf("msg=") < 0 ? "Error al obtener información" : ex.Message.Replace("msg=", "");
            UtilesWeb.EjecutaJs(this, "alert('" + msgError + "');");
        }


    }

    protected void ImgEmitir_Click(object sender, EventArgs e)
    {
        tblrowSelModEmitir.Visible = true;
    }

    protected void ImgEmitirMostrar_Click(object sender, EventArgs e)
    {
        //UtilesWeb.EjecutaJs(this, "alert('No Disponible');");
        //return;

        tblrowSelModEmitir.Visible = true;
        DataRow grabamodalidad = null;

        try
        {
            //Poliza PolVeh;
            //if (Session["PolVeh"] != null)
            //{
            //    PolVeh = (Poliza)Session["PolVeh"];
            //}
            //else
            //{
            //    PolVeh = new Poliza();
            //    Session["PolVeh"] = PolVeh;
            //}

            Poliza PolVeh = Poliza.CargaPoliza();

            GetDatosFormulario();

            if (PolVeh.NumMatricula == "A/D" && this.chkVehFact48.Checked == false)
            {
                UtilesWeb.EjecutaJs(this, "alert('Para emitir, debe informar la patente.');");
                return;
            }
            else
            {

                string radio_sel = getrdbSelModalidad();
                int id_sel;

                if (radio_sel.Length < 11)
                    id_sel = Convert.ToInt32(radio_sel.Substring(radio_sel.Length - 1, 1));
                else
                    id_sel = Convert.ToInt32(radio_sel.Substring(radio_sel.Length - 2, 2));

                string cod_modalidad = gethdfCodModalidad(id_sel);
                string nom_modalidad = getlblNomModalidad(id_sel);
                string prima_neta = getlblPrimaNeta(id_sel);
                string prima_total = getlblPrimaTotal(id_sel);

                //INTEGRACION CAMPAÑA COMERCIAL 
                string prima_totalDesctosCruzado = getlblPrimaTotalDsctos(id_sel);
                String totalDescuentosCampaniaComercial = getDsctoCampanaComercial(id_sel);
                if (totalDescuentosCampaniaComercial != ""){totalDescuentosCampaniaComercial = "-" + totalDescuentosCampaniaComercial;} else { totalDescuentosCampaniaComercial = "0"; }
                
                
                string descuento = getlblDescuento(id_sel);
                string recargo = getlblRecargo(id_sel);
                string cuota = getlblCuota(id_sel);
                string cuotaPAT = getlblCuotaPAT(id_sel);

                string descrecarg;
                if (descuento == "0.00")
                    descrecarg = recargo;
                else
                    descrecarg = descuento;

                string diapago = ConfigurationManager.AppSettings["DiaPagoCot"];

                PolVeh.CodModalidad = cod_modalidad;
                PolVeh.NomModalidad = nom_modalidad;
                PolVeh.PrimaNeta = prima_neta;
                PolVeh.PrimaTotal = prima_total;
                System.Globalization.NumberFormatInfo nfi = new System.Globalization.NumberFormatInfo();
                nfi.NumberGroupSeparator = ",";
                
                descrecarg = Convert.ToString(Convert.ToDecimal(descrecarg.Replace(",", "."), nfi) + Convert.ToDecimal(totalDescuentosCampaniaComercial.Replace(",", "."), nfi));


                PolVeh.Descuento = descrecarg.Replace(",",".");
                PolVeh.Cuota = cuota;
                PolVeh.Cuota = cuotaPAT;
                PolVeh.NumCuota = this.drpValCuota.SelectedValue;
                PolVeh.NumCuotaPAT = this.drpValCuotaPAT.SelectedValue;
                PolVeh.DiaPago = diapago;

                PolVeh.NumMatricula = this.txtNumMatricula.Text;
                PolVeh.CodMarca = this.drpMarca.SelectedValue.ToString();
                PolVeh.NomMarca = this.drpMarca.SelectedItem.ToString();
                PolVeh.CodModelo = this.drpModelo.SelectedValue.ToString();
                PolVeh.NomModelo = this.drpModelo.SelectedItem.ToString();
                PolVeh.CodSubModelo = this.drpSubModelo.SelectedValue.ToString();
                PolVeh.NomSubModelo = this.drpSubModelo.SelectedItem.ToString();
                PolVeh.AñoFab = this.drpAño.SelectedValue.ToString();
                PolVeh.NomTipoVeh = this.lblTipVehiculo.Text.ToString();

                /*CJSS*/
                PolVeh.FechaInicioVigencia = this.txtFechaIniVigencia.Text.ToString();
                PolVeh.FechaFinVigencia = this.txtFechaFinVigencia.Text.ToString();
                /*FIN */

                if (PolVeh.NumMatricula == "A/D")
                {
                    if (PolVeh.ID == null)
                    {
                        DataRow grabavehiculo = Cotiza.GrabaVehiculoCot(PolVeh.NumMatricula, PolVeh.CodDocumAseg, PolVeh.CodMarca, PolVeh.CodModelo, PolVeh.CodSubModelo, PolVeh.AñoFab, PolVeh.ID);
                        PolVeh.ID = grabavehiculo["P_ID"].ToString();
                    }
                }
                else
                {
                    DataRow grabavehiculo = Cotiza.GrabaVehiculoCot(PolVeh.NumMatricula, PolVeh.CodDocumAseg, PolVeh.CodMarca, PolVeh.CodModelo, PolVeh.CodSubModelo, PolVeh.AñoFab, PolVeh.ID);
                    PolVeh.ID = grabavehiculo["P_ID"].ToString();
                }

              

                //CJSS  REPLICAR METODO CON FECHAS
                grabamodalidad = Cotiza.GrabaCotizacionEmite(PolVeh.CodDocum, PolVeh.CodDocumAseg,
                    PolVeh.NumMatricula, PolVeh.FechaInicioVigencia, PolVeh.FechaFinVigencia, PolVeh.CodModalidad, Convert.ToDecimal(PolVeh.PrimaNeta.Replace(",", "."), nfi), PolVeh.Descuento, PolVeh.CodRamo, PolVeh.MontoRC, PolVeh.EdadAseg, PolVeh.SexoAseg, PolVeh.NumCotizacion, PolVeh.RCExceso, PolVeh.ID, PolVeh.Fact48, PolVeh.Convenio, PolVeh.CobOpc, PolVeh.McaMel);

                PolVeh.NumCotizacion = grabamodalidad["p_num_cotizacion"].ToString();

                //FMOUAT

                #region guarda respuestas y preguntas1

                string hijos, franquicia, danospre;
                if (PolVeh.PreguntaHijos == "S") hijos = "SI"; else hijos = "NO";
                if (PolVeh.PreguntaFranquicia == "S") franquicia = "SI"; else franquicia = "NO";
                //if (PolVeh.PreguntaDanosPre == "S") danospre = "SI"; else danospre = "NO";

                bool actupregveh = Cotiza.actualizaPregVeh(PolVeh.NumCotizacion, PolVeh.PreguntaHijos.ToUpper(), PolVeh.PreguntaFranquicia.ToUpper(), "");

                bool grabapreguntahijo = Cotiza.RegistraPregCotizacion(1, Convert.ToInt32(PolVeh.CodRamo), lblPregHijos.Text.ToUpper(), hijos, PolVeh.NumCotizacion, PolVeh.NumPoliza);
                bool grabapreguntafranq = Cotiza.RegistraPregCotizacion(1, Convert.ToInt32(PolVeh.CodRamo), lblPregFranquicia.Text.ToUpper(), franquicia.ToUpper(), PolVeh.NumCotizacion, PolVeh.NumPoliza);
                //bool grabapreguntadanos = Cotiza.RegistraPregCotizacion(1, Convert.ToInt32(PolVeh.CodRamo), lblPregDanos.Text.ToUpper(), danospre.ToUpper(), PolVeh.NumCotizacion, PolVeh.NumPoliza);

                #endregion

                DataRow grabacomision;
                //if (PolVeh.CodCuadroCom != "")
                grabacomision = Cotiza.GrabaComision(PolVeh.NumCotizacion, PolVeh.CodCuadroCom);



                //--SE COMENTA POR CAMPAÑA COMERCIAL 
                //// #CCE
                //// GUARDO PRIMA NETA, PRIMA CON PAT Y NUMERO DE COTIZACIÓN     

                //string Cotizacion = PolVeh.NumCotizacion;
                //string DesctoPAT = Cobranza.DesctoPAT();
                ////string DesctoPAT = "5";
                //string PrimaNeta = PolVeh.PrimaNeta;
                //string PrimaBruta = PolVeh.PrimaTotal;

                //decimal PrimaNetaPAT = 0;
                //decimal PrimaBrutaPAT = 0;

                //DesctoPAT = DesctoPAT.Replace(",", ".");
                //PrimaNetaPAT = Convert.ToDecimal(PrimaNeta.Replace(",", "."), nfi) - (Convert.ToDecimal(PrimaNeta.Replace(",", "."), nfi) * Convert.ToDecimal(DesctoPAT, nfi) / 100);
                //PrimaNetaPAT = Decimal.Round(PrimaNetaPAT, 2);

                //PrimaBrutaPAT = Convert.ToDecimal(PrimaBruta.Replace(",", "."), nfi) - (Convert.ToDecimal(PrimaBruta.Replace(",", "."), nfi) * Convert.ToDecimal(DesctoPAT, nfi) / 100);
                //PrimaBrutaPAT = decimal.Round(PrimaBrutaPAT, 2);

                //string OpcionPago = string.Empty;
                //string Fecha = string.Empty;

                //Logs.writeToLogFile("GrabaTabladeDesctoPAT");
                //Logs.writeToLogFile(Cotizacion.ToString());
                //Logs.writeToLogFile(DesctoPAT.ToString());
                //Logs.writeToLogFile(PrimaNeta.ToString());
                //Logs.writeToLogFile(PrimaNetaPAT.ToString());
                //Logs.writeToLogFile(PrimaBruta.ToString());
                //Logs.writeToLogFile(PrimaBrutaPAT.ToString());

                //DataRow GrabaDescuentoPat = Cotiza.GrabaTabladeDesctoPAT(Cotizacion.ToString(), DesctoPAT.ToString(), PrimaNeta.ToString(), PrimaNetaPAT.ToString(), "", PrimaBruta.ToString(), PrimaBrutaPAT.ToString());
                //--fin SE COMENTA POR CAMPAÑA COMERCIAL 





                #region Se guarda el detalle de los descuentos CAMPAÑA COMERCIAL VENTA CRUZADA
                if (porcDsctoAgendaVencida == "") porcDsctoAgendaVencida = "0";
                if (porcDsctoFamiliar == "") porcDsctoFamiliar = "0";
                if (porcDsctoCruzado == "") porcDsctoCruzado = "0";
              //  
                string sumadescuentos = lbltblrowDsctoCampanaComercial.Text.Replace("-", "").Replace("%", "").Replace("(", "").Replace(")", "").Trim();
                if (sumadescuentos=="") sumadescuentos="0";
                Decimal P_SUMA_DSCTOS = Convert.ToDecimal(sumadescuentos);
               
                DataRow GuardaDetalleDescuentos = Cotiza.GuardaDetalleDescuentos(PolVeh.NumCotizacion.ToString(), Convert.ToDecimal(porcDsctoFamiliar), Convert.ToDecimal(porcDsctoAgendaVencida), Convert.ToDecimal(porcDsctoCruzado), Convert.ToDecimal(PolVeh.PrimaTotal.Replace(",", "."), nfi), P_SUMA_DSCTOS, Convert.ToDecimal(totalDescuentosCampaniaComercial), Convert.ToDecimal(PolVeh.PrimaTotal));

                #endregion

                //#CCE

                if (Session["mca_tmarketing"].ToString() == "S")
                {
                    GrabaDatosTmarketing(PolVeh.CodDocumAseg, PolVeh.NomAseg, PolVeh.ApePatAseg, PolVeh.ApeMatAseg, PolVeh.EmailAseg, PolVeh.FonoAseg, PolVeh.FonoAseg2, ConfigurationManager.AppSettings["Producto"].ToString(), PolVeh.CodDocum, PolVeh.Convenio, PolVeh.NumCotizacion);
                }

                if (grabamodalidad["p_error"].ToString() == "0")
                {
                    Response.Redirect("Emisor.aspx", false);
                }
            }
        }
        catch (Exception ex)
        {
            System.Diagnostics.StackTrace Stack = new System.Diagnostics.StackTrace(ex, true);
            int errorlineno = Stack.GetFrame(0).GetFileLineNumber();
            int errorcol = Stack.GetFrame(0).GetFileColumnNumber();

            UtilesWeb.EnviaCorreoAcusete(ex.Message, "Cot. Veh. Livianos - Cotizador.asxp - ImgEmitirMostrar_Click - Linea: " + errorlineno + " - " + errorcol);
        }
    }

    protected void txtNumMatricula_TextChanged(object sender, EventArgs e)
    {
        this.chkCotExpress.Checked = false;
        this.chkCotExpress.Enabled = false;

        //this.chkVehFact48.Checked = false;
        //this.chkVehFact48.Enabled = false;

        try
        {
            DataRow datos_vehiculo = null;

            this.txtNumMatricula.Text = this.txtNumMatricula.Text.ToUpper();

            string num_matricula = this.txtNumMatricula.Text;

            string tipopatente = UtilesWeb.ValidaPatente(num_matricula);

            if (tipopatente == "ERROR")
            {
                UtilesWeb.EjecutaJs(this, "alert('La patente no es válida, favor corregir');");
                this.txtNumMatricula.Text = "";
                //ScriptManager1.SetFocus(this.txtNumMatricula);
                this.chkCotExpress.Enabled = true;
                this.chkVehFact48.Enabled = true;
                EscondeResultados();
                LimpiaPolVeh_Vehiculo();

                return;
            }

            string existe_poliza = Cotiza.PolizaExistente(this.txtNumMatricula.Text);

            if (existe_poliza == "S")
            {
                UtilesWeb.EjecutaJs(this, "alert('La patente que desea ingresar ya existe en nuestros registros con una poliza vigente, por favor ingrese otra para cotizar.');");
                this.txtNumMatricula.Text = "";
                //ScriptManager1.SetFocus(this.txtNumMatricula);
                this.chkCotExpress.Enabled = true;
                this.chkVehFact48.Enabled = true;
                EscondeResultados();
                LimpiaPolVeh_Vehiculo();

                return;
            }

            //if (existe_poliza == "P")
            //{
            //    UtilesWeb.EjecutaJs(this, "alert('La patente ingresada no es posible de cotizar en MAPFRE, por favor ingrese otra para cotizar.');");
            //    this.txtNumMatricula.Text = "";
            //    //ScriptManager1.SetFocus(this.txtNumMatricula);
            //    this.chkCotExpress.Enabled = true;
            //    this.chkVehFact48.Enabled = true;
            //    EscondeResultados();
            //    LimpiaPolVeh_Vehiculo();

            //    return;
            //}

            string existe_perdida_total = Cotiza.PerdidaTotal(this.txtNumMatricula.Text);
            //string existe_perdida_total = "N";

            if (existe_perdida_total == "S")
            {
                UtilesWeb.EjecutaJs(this, "alert('La patente ingresada no es posible de emitir en MAPFRE, por favor ingrese otra para cotizar.');");
                this.txtNumMatricula.Text = "";
                //ScriptManager1.SetFocus(this.txtNumMatricula);
                //this.chkCotExpress.Enabled = true;
                //this.chkVehFact48.Enabled = true;
                EscondeResultados();
                LimpiaPolVeh_Vehiculo();

                return;
            }

            if (Session["opc_soap"].ToString() == "S")
            {
                Service1 servicio = new Service1();

                if (servicio.ValidaPagoMatricula(this.txtNumMatricula.Text) != "NO")
                {
                    this.txtNumMatricula.Text = "";
                    UtilesWeb.EjecutaJs(this, "alert('La patente ingresada ya cuenta con un seguro obligatorio.');");
                    EscondeResultados();
                    LimpiaPolVeh_Vehiculo();

                    return;
                }
            }

            EscondeResultados();
            LimpiaPolVeh_Vehiculo();

            Poliza PolVeh = Poliza.CargaPoliza();

            //Poliza PolVeh;
            //if (Session["PolVeh"] != null)
            //{
            //    PolVeh = (Poliza)Session["PolVeh"];
            //}
            //else
            //{
            //    PolVeh = new Poliza();
            //    Session["PolVeh"] = PolVeh;
            //}

            PolVeh.NumMatricula = num_matricula;

            datos_vehiculo = Vehiculo.DatosVeh(num_matricula);



            //Carlos Vargas

            try
            {
                WebServiceAach.wsSisgenGenV3 prueba = new WebServiceAach.wsSisgenGenV3();

                DataSet result = prueba.getGenerico("2",
                                                              "",
                                                              num_matricula,
                                                              "",
                                                              "",
                                                              "",
                                                              "",
                                                              "0965082107",
                                                              "ADMCZAMORA",
                                                              "127HET",
                                                              "NOMBRE",
                                                              "AA");

                if (result.Tables["REMATES"].Rows.Count > 0)
                {
                    string FechaOperacion = result.Tables["REMATES"].Rows[0]["FECHAOPERACION"].ToString();

                    FechaOperacion = FechaOperacion.Substring(0, 4) + "-" + FechaOperacion.Substring(4, 2) + "-"+FechaOperacion.Substring(6, 2);

                    DataRow dr = Cotiza.GuardaRegistroRemate_DB("Vehiculo Rematado por Mercado Asegurador", "1", num_matricula, FechaOperacion);
                    // DataRow dr = Cotiza.GuardaRegistroRemate_DB(result.Tables[2].Rows[0]["NombreComprador"].ToString(),"1",num_matricula);
                    this.txtNumMatricula.Text = "";
                    UtilesWeb.EjecutaJs(this, "alert('No se puede tarificar con los datos ingresados - tipo(1)');");
                    EscondeResultados();
                    LimpiaPolVeh_Vehiculo(); 
                    return;
                }
                else if (result.Tables["ROBOS"].Rows.Count > 0)
                {
                    string FechaOperacion = result.Tables["ROBOS"].Rows[0]["Fechasiniestro"].ToString();

                    FechaOperacion = FechaOperacion.Substring(0, 4) + "-" + FechaOperacion.Substring(4, 2) + "-" + FechaOperacion.Substring(6, 2);

                    DataRow dr = Cotiza.GuardaRegistroRemate_DB("Vehiculo Robado", "1", num_matricula, FechaOperacion);
                    // DataRow dr = Cotiza.GuardaRegistroRemate_DB(result.Tables[2].Rows[0]["NombreComprador"].ToString(),"1",num_matricula);
                    this.txtNumMatricula.Text = "";
                    UtilesWeb.EjecutaJs(this, "alert('No se puede tarificar con los datos ingresados -tipo(2)');");
                    EscondeResultados();
                    LimpiaPolVeh_Vehiculo();
                    return;
                }

                //Valida en la tabla

                DataRow dt = Cotiza.VerificaPatenteTabla("1", num_matricula);

                if (dt["P_ERROR"].ToString() != "0")
                {
                    this.txtNumMatricula.Text = "";
                    UtilesWeb.EjecutaJs(this, "alert('La patente ingresada no es posible de emitir en MAPFRE, por favor ingrese otra para cotizar.');");
                    EscondeResultados();
                    LimpiaPolVeh_Vehiculo();
                    return;
                }

            }
            catch
            {
                //se cae registra en la tabla

                DataRow dt = Cotiza.VerificaPatenteTabla("1", num_matricula);

                if (dt["P_ERROR"].ToString() != "0")
                {
                    this.txtNumMatricula.Text = "";
                    UtilesWeb.EjecutaJs(this, "alert('La patente ingresada no es posible de emitir en MAPFRE, por favor ingrese otra para cotizar.');");
                    EscondeResultados();
                    LimpiaPolVeh_Vehiculo();
                    return;
                }

            }


            if (datos_vehiculo["P_ERROR"].ToString() == "0" || datos_vehiculo["P_ERROR"].ToString() == "OK")
            {
                #region Datos del Vehiculo

                UtilesWeb.selected(this.drpMarca, datos_vehiculo["P_COD_MARCA"].ToString());
                UtilesWeb.selected(this.drpAño, datos_vehiculo["P_ANIO"].ToString());

                if (datos_vehiculo["P_COD_MARCA"] != System.DBNull.Value && datos_vehiculo["P_COD_MARCA"].ToString() != "0")
                {
                    Vehiculo.Combo_Modelos(this.drpModelo, datos_vehiculo["P_COD_MARCA"].ToString());
                    UtilesWeb.selected(this.drpModelo, datos_vehiculo["P_COD_MODELO"].ToString());

                    if (datos_vehiculo["P_COD_MODELO"] != System.DBNull.Value && datos_vehiculo["P_COD_MODELO"].ToString() != "0")
                    {
                        Vehiculo.Combo_SubModelos(this.drpSubModelo, datos_vehiculo["P_COD_MARCA"].ToString(), datos_vehiculo["P_COD_MODELO"].ToString());
                        UtilesWeb.selected(this.drpSubModelo, datos_vehiculo["P_COD_SUB_MODELO"].ToString());
                    }
                    else
                    {
                        this.drpSubModelo.Enabled = true;
                        this.drpSubModelo.SelectedIndex = 0;
                    }

                    ValidaExGarage(datos_vehiculo["P_COD_MARCA"].ToString());


                }
                else
                {
                    this.drpMarca.Enabled = true;
                    this.drpMarca.SelectedIndex = 0;
                    this.drpModelo.Enabled = true;
                    this.drpModelo.SelectedIndex = 0;
                    this.drpSubModelo.Enabled = true;
                    this.drpSubModelo.SelectedIndex = 0;

                    this.lblTipVehiculo.Text = "";
                    this.lblTituloTipVeh.Text = "";

                    ValidaExGarage(this.drpMarca.SelectedValue);
                }

                if (datos_vehiculo["P_NRO_CHASIS"] != System.DBNull.Value && datos_vehiculo["P_NRO_CHASIS"].ToString() != "")
                {
                    PolVeh.NroChasis = datos_vehiculo["P_NRO_CHASIS"].ToString();
                }

                if (datos_vehiculo["P_NRO_MOTOR"] != System.DBNull.Value && datos_vehiculo["P_NRO_MOTOR"].ToString() != "")
                {
                    PolVeh.NroMotor = datos_vehiculo["P_NRO_MOTOR"].ToString();
                }

                if (datos_vehiculo["P_COD_COLOR"] != System.DBNull.Value && datos_vehiculo["P_COD_COLOR"].ToString() != "")
                {
                    PolVeh.CodColor = datos_vehiculo["P_COD_COLOR"].ToString();
                }

                if (datos_vehiculo["P_NOM_COLOR"] != System.DBNull.Value && datos_vehiculo["P_NOM_COLOR"].ToString() != "")
                {
                    PolVeh.NomColor = datos_vehiculo["P_NOM_COLOR"].ToString();
                }

                #endregion

                #region Datos del Asegurado

                if (datos_vehiculo["P_RUT_COT"] != System.DBNull.Value && datos_vehiculo["P_RUT_COT"].ToString() != "")
                {
                    string cod_docum_aseg = datos_vehiculo["P_RUT_COT"].ToString().ToUpper().Trim();

                    SetCodDocumAseg(cod_docum_aseg, datos_vehiculo["P_SEXO"].ToString(), datos_vehiculo["P_EDAD"].ToString());

                    string tip_rut = UtilesWeb.ValidaJuridico(cod_docum_aseg);

                    // Req 0018587
                    //if (tip_rut == "J")
                    //{
                    //    this.txtCodDocumAseg.Text = "";
                    //    UtilesWeb.EjecutaJs(this, "alert('El RUT no corresponde a vehiculos particulares, comunicate con tu ejecutivo.');");
                    //    return;
                    //}

                    DataRow DataBussines = Cotiza.LlamaDataBussines("1", "801", PolVeh.Convenio, cod_docum_aseg);

                    PolVeh.TipoDescuentoDataBusiness = DataBussines["P_TIPO_DESC"].ToString();
                    PolVeh.DescuentoDataBusiness = DataBussines["P_DESC"].ToString();

                }

                UtilesWeb.Asigna_dat_block(datos_vehiculo, this.txtNomAseg, "P_NOM_COT");

                UtilesWeb.Asigna_dat_block(datos_vehiculo, this.txtApePatAseg, "P_APE_PAT_COT");

                UtilesWeb.Asigna_dat_block(datos_vehiculo, this.txtApeMatAseg, "P_APE_MAT_COT");

                #endregion
            }
            else
            {
                EnableVeh();
            }

            this.chkCotExpress.Enabled = true;
            this.chkVehFact48.Enabled = true;
        }
        catch //(Exception ex)
        {
            UtilesWeb.EjecutaJs(this, "alert('La patente no es válida, favor corregir');");
            this.txtNumMatricula.Text = "";
            //ScriptManager1.SetFocus(this.txtNumMatricula);
            this.chkCotExpress.Enabled = true;
            this.chkVehFact48.Enabled = true;
            return;
        }
    }

    public void SetCodDocumAseg(string cod_docum_aseg)
    {
        //Session["COD_DOCUM_ASEG"] = cod_docum_aseg.Replace("-", "").Replace(".", "").Trim(); ;
        this.txtCodDocumAseg.Text = UtilesWeb.getFormated(cod_docum_aseg.ToUpper());

        int intcod_docum = Convert.ToInt32(cod_docum_aseg.Substring(0, cod_docum_aseg.Length - 1));



        if (intcod_docum >= 50000000)
        {
            drpSexo.Enabled = false;

            if (drpSexo.Items.FindByValue("9") == null)
            {
                drpSexo.Items.Insert(0, new ListItem("Jurídico", "9"));
                drpSexo.SelectedIndex = 0;
            }
            else
            {
                drpSexo.SelectedIndex = 2;
            }

            drpEdad.SelectedIndex = 0;
            drpEdad.Enabled = false;
            drpEdad.Visible = false;
            lblEdadConductor.Visible = false;
        }
        else
        {
            drpSexo.Enabled = true;
            if (drpSexo.Items.FindByValue("9") != null)
                drpSexo.Items.RemoveAt(drpSexo.Items.IndexOf(drpSexo.Items.FindByValue("9")));

            drpEdad.SelectedIndex = 0;
            ///////////drpEdad.Enabled = true;
            ///////////drpEdad.Visible = true;
            lblEdadConductor.Visible = true;
        }
    }

    public void SetCodDocumAseg(string cod_docum_aseg, string sexo, string edad)
    {
        this.txtCodDocumAseg.Text = UtilesWeb.getFormated(cod_docum_aseg);
        //Session["COD_DOCUM_ASEG"] = cod_docum_aseg.Replace("-", "").Replace(".", "").Trim(); ;

        int intcod_docum = Convert.ToInt32(cod_docum_aseg.Substring(0, cod_docum_aseg.Length - 1));

        if (intcod_docum >= 50000000)
        {
            drpSexo.Enabled = false;

            if (drpSexo.Items.FindByValue("9") == null)
            {
                drpSexo.Items.Insert(0, new ListItem("Jurídico", "9"));
                drpSexo.SelectedIndex = 0;
            }
            else
            {
                drpSexo.SelectedIndex = 2;
            }

            drpEdad.SelectedIndex = 0;
            drpEdad.Enabled = false;
            drpEdad.Visible = false;
            lblEdadConductor.Visible = false;
        }
        else
        {
            drpSexo.Enabled = true;
            if (drpSexo.Items.FindByValue("9") != null)
                drpSexo.Items.RemoveAt(drpSexo.Items.IndexOf(drpSexo.Items.FindByValue("9")));

            drpEdad.SelectedIndex = 0;
            ///////////drpEdad.Enabled = true;
            ///////////drpEdad.Visible = true;
            //lblEdadConductor.Visible = true;

            if (Convert.ToInt32(edad) > 99)
                edad = "18";

            UtilesWeb.selected_block(this.drpEdad, edad, false);

            UtilesWeb.selected_block_sexo(this.drpSexo, sexo);

        }
    }

    protected void chkCotExpress_CheckedChanged(object sender, EventArgs e)
    {
        if (((CheckBox)sender).Checked == true)
        {
            if (ValidaPatenteAD())
                this.txtNumMatricula.Text = "A/D";

            UtilesWeb.EjecutaJs(this, "alert('Opción no es válida para emitir sino se ingresan todos los datos del vehiculo.');");

            //this.txtNumMatricula.ReadOnly = true;
            //this.txtNumMatricula.Enabled = false;
        }
        else
        {
            this.txtNumMatricula.Text = "";
            this.txtNumMatricula.ReadOnly = false;
            this.txtNumMatricula.Enabled = true;
        }

        EnableVeh();
        EscondeResultados();
    }

    protected void EnableVeh()
    {
        this.drpMarca.Enabled = true;
        this.drpModelo.Enabled = true;
        this.drpSubModelo.Enabled = true;
        this.drpAño.Enabled = true;
    }

    protected void EnableAseg()
    {
        this.txtCodDocumAseg.Enabled = true;
        this.txtApePatAseg.Enabled = true;
        this.txtApeMatAseg.Enabled = true;
    }

    protected void drpAño_SelectedIndexChanged(object sender, EventArgs e)
    {
        EscondeResultados();
    }

    private void EscondeResultados()
    {
        if (this.tblResultados.Visible == true)
        {
            this.tblResultados.Visible = false;
            this.tblDescRec.Visible = false;
            this.tblBotonera.Visible = false;
            this.EnviarCorreo.Visible = false;
            this.EnviarCorreo_Exitoso.Visible = false;
        }

        EscondeCotizar();
        EscondeAvisoVencimiento();

    }

    private void EscondeCotizar()
    {
        if (this.tblResultados.Visible == true)
            this.divBotonCalcular.Visible = false;
        else
            this.divBotonCalcular.Visible = true;
    }

    private void EscondeResComisionDif()
    {
        this.drpCuadroCom1.Enabled = false;
        this.chkComisionDif.Checked = false;

        for (int i = 0; i < Convert.ToInt32(Session["CANT_MODALIDADES"]); i++) /***/
        {
            if (tblrowNomPlan.Cells[i + 1].Visible != false)
            {
                setlblPrimaComision("---", i + 1);
            }
        }
    }

    /// <summary>
    /// funcion que esconde opciones por una restriccion en amunategui
    /// </summary>
    private void EscondeAmunategui() {
        tdCuadroCom.Visible = false;
        tdRecargo.Visible = false;
    }

    private void EscondeComisionDif()
    {
        this.tblrowPrimaComision.Visible = false;
        tdCuadroCom.Visible = false;
    }

    private void EscondeEmitir()
    {
        if (this.chkCotExpress.Checked == true)
        {

            if (Session["mca_emite"].ToString() == "S")
            {
                this.ImgEmitir.Visible = true;
            }
            else
            {
                this.ImgEmitir.Visible = false;
                this.tblrowSelModEmitir.Visible = false;
            }

            if (Session["opc_pat"].ToString() != "S")
            {
                this.tblrowCuotaPAT.Visible = false;
                this.tblrowValorRef.Visible = false;
            }

            if (Session["opc_cuotas"].ToString() != "S")
            {
                this.tblrowCuota.Visible = false;
            }

            //this.ImgEmitir.Visible = false;
        }
        else
        {
            if (Session["mca_emite"].ToString() == "S")
            {
                this.ImgEmitir.Visible = true;
            }
            else
            {
                this.ImgEmitir.Visible = false;
                this.tblrowSelModEmitir.Visible = false;
            }

            if (Session["opc_pat"].ToString() != "S")
            {
                this.tblrowCuotaPAT.Visible = false;
                this.tblrowValorRef.Visible = false;
            }

            if (Session["opc_cuotas"].ToString() != "S")
            {
                this.tblrowCuota.Visible = false;
            }
        }


        // this.ImgEmitir.Visible = false;
        // Omarcito
    }

    protected void drpSexo_SelectedIndexChanged(object sender, EventArgs e)
    {
        string sexo = UtilesWeb.GetPropertyValue(sender, "SelectedValue");

        if (sexo == "9")
        {
            this.drpEdad.SelectedIndex = 0;
            this.drpEdad.Enabled = false;
        }
        else
            drpEdad.Enabled = true;

    }

    #region Aplica Descuentos o Recargos

    protected void AplicaDescuentos(object sender, EventArgs e)
    {
        //this.txtDescuento.Text = this.txtDescuento.Text.Replace("-", "");
        //this.txtDescuento.Text = this.txtDescuento.Text.Replace(".", "");

        try
        {
            System.Globalization.NumberFormatInfo nfi = new
            System.Globalization.NumberFormatInfo();
            nfi.NumberGroupSeparator = ",";

            //if (Convert.ToInt32(this.txtDescuento.Text) > Convert.ToInt32(Session["MAX_DESC"].ToString()))
            if (Convert.ToInt32(this.drpDescuento1.SelectedItem.Text) > Convert.ToInt32(Session["MAX_DESC"].ToString()))
            {
                UtilesWeb.EjecutaJs(this, "alert('El Descuento no puede ser mayor a " + Session["MAX_DESC"] + "');");
                //this.txtDescuento.Text = Session["DESC"].ToString();
                return;
            }
            else
            {
                //decimal desc = Convert.ToDecimal(this.txtDescuento.Text.Replace(",", "."), nfi);
                decimal desc = Convert.ToDecimal(this.drpDescuento1.SelectedItem.Text, nfi);

                string label;

                for (int i = 0; i < Convert.ToInt32(Session["CANT_MODALIDADES"]); i++) /**/
                {
                    //float primaneta = Convert.ToSingle(getlblPrimaNeta(i + 1));

                    //float div = (desc * primaneta * -1) / 100;

                    //float suma = (((primaneta - (div * -1)) * 19) / 100) + (primaneta - (div * -1));

                    label = getlblPrimaNeta(i + 1);

                    if (label != "Label")
                    {

                        decimal primaneta = Convert.ToDecimal((getlblPrimaNeta(i + 1).Replace(",", ".")), nfi);

                        decimal primaexcenta = Vehiculo.PrimaExenta(gethdfCodModalidad(i + 1), Session["COD_RAMO"].ToString());

                        decimal iva = Cobranza.IVA();

                        decimal div = Math.Round(((desc * primaneta * -1) / 100), 2);


                        //INTEGRACION CAMPAÑA COMERCIAL 
                        // decimal suma = (((primaneta - primaexcenta - (div * -1) - (divDscto * -1)) * iva) / 100) + (primaneta - (div * -1)) + (primaneta - (divDscto * -1));
                        decimal descTotalCampañaComercial = Convert.ToDecimal((String.IsNullOrEmpty(sumaTotalPorcDsctos)) ? "0" : sumaTotalPorcDsctos.Replace(".", ","));
                        //VALOR    EN FUNCION DEL PORCENTAJE DE DESCUENTO 
                        decimal divDscto = Math.Round((descTotalCampañaComercial * primaneta * -1) / 100, 2);
                      //  string descuentoAdicional = Math.Round(divDscto, 2).ToString().Replace(",", ".");
                     
                      
                        //// fin INTEGRACION CAMPAÑA COMERCIAL 

                        string descuento;

                        if (div == 0)
                        {
                            descuento = "0.00";
                        }
                        else
                        {
                            descuento = Math.Round(div, 2).ToString().Replace(",", ".");
                            //descuento = Math.Round(div, 2).ToString();
                        }


                        setlblDescuento(descuento.Replace(",", "."), i + 1);
                        setlblRecargo("0.00", i + 1);

                        //INTEGRACION CAMPAÑA COMERCIAL VENTA CRUZADA JC
                        div = div + divDscto;
                        //RESTA EL PORCENTAJE DE DESCUENTO DE LA PRIMA  Y SE ACTUALIZA LA PRIMA TOTAL
                        decimal primatotalcondescuento = (((primaneta - primaexcenta - (div * -1)) * iva) / 100) + (primaneta - (div * -1));
                        decimal primatotalSindescuento = (((primaneta - primaexcenta) * iva) / 100) + (primaneta);
                        setlblPrimaTotal(Math.Round(primatotalcondescuento, 2).ToString().Replace(",", "."), i + 1);
                       
                        //INTEGRACION CAMPAÑA COMERCIAL VENTA CRUZADA JC
                        setlblPrimaTotalDsctos(primaneta.ToString(), i + 1);
                       
                        string dia_pago = ConfigurationManager.AppSettings["DiaPagoCot"];

                         //se suma el valor del descuento cruzado al descuento para el calculo de la cuota 
                        descuento =(Convert.ToDecimal(descuento,nfi) + Convert.ToDecimal(divDscto,nfi)).ToString();

                        CalculaCuota(Math.Round(primaneta, 2).ToString().Replace(",", "."), "GD", this.drpValCuotaPAT.SelectedValue.ToString(), descuento.Replace(",", "."), Session["COD_RAMO"].ToString(), dia_pago, i + 1);

                        CalculaCuota(Math.Round(primaneta, 2).ToString().Replace(",", "."), "TA", this.drpValCuotaPAT.SelectedValue.ToString(), descuento.Replace(",", "."), Session["COD_RAMO"].ToString(), dia_pago, i + 1);
                    }
                }

                //Session["DESC"] = this.txtDescuento.Text;
                Session["DESC"] = this.drpDescuento1.SelectedItem.Text;
                this.txtRecargo.Text = "0";
                this.txtRecargo1.Text = "0";
                Session["RECAR"] = "0";

            }
        }
        catch
        {
            UtilesWeb.EjecutaJs(this, "alert('El monto de Descuento no es válido');");
            //this.txtDescuento.Text = Session["DESC"].ToString();
            this.drpDescuento1.SelectedValue = Session["DESC"].ToString();
            return;
        }
    }

   protected void AplicaRecargos(object sender, EventArgs e)
    {
        this.txtRecargo.Text = this.txtRecargo.Text.Replace("-", "");
        this.txtRecargo.Text = this.txtRecargo.Text.Replace(".", "");

        this.txtRecargo1.Text = this.txtRecargo1.Text.Replace("-", "");
        this.txtRecargo1.Text = this.txtRecargo1.Text.Replace(".", "");

        try
        {

            System.Globalization.NumberFormatInfo nfi = new
            System.Globalization.NumberFormatInfo();
            nfi.NumberGroupSeparator = ",";

            if (Convert.ToInt32(this.txtRecargo1.Text) > Convert.ToInt32(ConfigurationManager.AppSettings["MaxPorcRecargo"].ToString()))
            {
                UtilesWeb.EjecutaJs(this, "alert('El Recargo no puede ser mayor a " + ConfigurationManager.AppSettings["MaxPorcRecargo"].ToString() + "');");
                this.txtRecargo1.Text = Session["RECAR"].ToString();
                return;
            }
            else
            {
                if (Convert.ToInt32(this.txtRecargo1.Text) < Convert.ToInt32(Session["MIN_RECAR"].ToString()))
                {
                    UtilesWeb.EjecutaJs(this, "alert('El Recargo no puede ser menor a " + Session["MIN_RECAR"].ToString() + "');");
                    this.txtRecargo1.Text = Session["RECAR"].ToString();
                    return;
                }
                else
                {
                    decimal recar = Convert.ToDecimal(this.txtRecargo1.Text.Replace(",", "."), nfi);
                    //decimal recar = Convert.ToDecimal(this.txtRecargo.Text);

                    for (int i = 0; i < Convert.ToInt32(Session["CANT_MODALIDADES"]); i++) /***/
                    {
                        if (tblrowNomPlan.Cells[i + 1].Visible != false)
                        {
                            decimal primaneta = Convert.ToDecimal((getlblPrimaNeta(i + 1).Replace(",", ".")), nfi);

                            decimal primaexenta = GetPrimaExenta(gethdfCodModalidad(i + 1));

                            decimal iva = Cobranza.IVA();

                            decimal div = Math.Round(((recar * primaneta) / 100), 2);
                           

                            //INTEGRACION CAMPAÑA COMERCIAL
                            decimal descTotal = Convert.ToDecimal((String.IsNullOrEmpty(sumaTotalPorcDsctos)) ? "0" : sumaTotalPorcDsctos.Replace(".", ","));
                            decimal divDscto = Math.Round((descTotal * primaneta * -1) / 100, 2);
                            string descuentoAdicional = Math.Round(divDscto, 2).ToString().Replace(",", ".");



                            string recargo;

                            if (div == 0)
                            {
                                recargo = "0.00";
                            }
                            else
                            {
                                recargo = Math.Round(div, 2).ToString().Replace(",", ".");
                                //recargo = Math.Round(div, 2).ToString();
                            }

                            div = div + divDscto;


                            decimal suma = (((primaneta + (div) - primaexenta) * iva) / 100) + (primaneta + (div));
                            //decimal suma = (((primaneta + (div) + (divDscto) - primaexenta) * iva) / 100) + (primaneta + (div) + (divDscto));

                            //modificacion pasaave
                            if (recargo == "0.00")
                            {
                                lblPrimaNeta1.Text = Session["Prima1"].ToString();
                                lblPrimaNeta2.Text = Session["Prima2"].ToString();
                                lblPrimaNeta3.Text = Session["Prima3"].ToString();
                                lblPrimaNeta4.Text = Session["Prima4"].ToString();
                                lblPrimaNeta5.Text = Session["Prima5"].ToString();
                                lblPrimaNeta6.Text = Session["Prima6"].ToString();
                            }
                            else
                            {
                                switch (i)
                                {
                                    case 0:
                                        if (primaneta == 0)
                                        {
                                            break;

                                        }
                                        else
                                        {
                                            decimal recarga1 = recar / 100;
                                            decimal sumapri1 = primaneta * recarga1;
                                            decimal primaneta1 = primaneta + sumapri1;
                                            lblPrimaNeta1.Text = Math.Round(primaneta1, 2).ToString();
                                            break;
                                        }

                                    case 1:
                                        if (primaneta == 0)
                                        {
                                            break;

                                        }
                                        else
                                        {
                                            decimal recarga2 = recar / 100;
                                            decimal sumapri2 = primaneta * recarga2;
                                            decimal primaneta2 = primaneta + sumapri2;
                                            lblPrimaNeta2.Text = Math.Round(primaneta2, 2).ToString();
                                            break;
                                        }
                                    case 2:
                                        if (primaneta == 0)
                                        {
                                            break;

                                        }
                                        else
                                        {
                                            decimal recarga3 = recar / 100;
                                            decimal sumapri3 = primaneta * recarga3;
                                            decimal primaneta3 = primaneta + sumapri3;
                                            lblPrimaNeta3.Text = Math.Round(primaneta3, 2).ToString();
                                            break;
                                        }
                                    case 3:
                                        if (primaneta == 0)
                                        {
                                            break;

                                        }
                                        else
                                        {
                                            decimal recarga4 = recar / 100;
                                            decimal sumapri4 = primaneta * recarga4;
                                            decimal primaneta4 = primaneta + sumapri4;
                                            lblPrimaNeta4.Text = Math.Round(primaneta4, 2).ToString();
                                            break;
                                        }
                                    case 4:
                                        if (primaneta == 0)
                                        {
                                            break;

                                        }
                                        else
                                        {
                                            decimal recarga5 = recar / 100;
                                            decimal sumapri5 = primaneta * recarga5;
                                            decimal primaneta5 = primaneta + sumapri5;
                                            lblPrimaNeta5.Text = Math.Round(primaneta5, 2).ToString();
                                            break;
                                        }
                                    case 5:
                                        if (primaneta == 0)
                                        {
                                            break;

                                        }
                                        else
                                        {
                                            decimal recarga6 = recar / 100;
                                            decimal sumapri6 = primaneta * recarga6;
                                            decimal primaneta6 = primaneta + sumapri6;
                                            lblPrimaNeta6.Text = Math.Round(primaneta6, 2).ToString();
                                            break;
                                        }
                                    default:
                                        break;
                                }
                            }
                            // fin modificacion

                            setlblRecargo(recargo.Replace(",", "."), i + 1);
                            //setlblRecargo(recargo, i + 1);
                            setlblDescuento("0.00", i + 1);

                          
                            setlblPrimaTotal(Math.Round(suma, 2).ToString(), i + 1); 
                          
                            //INTEGRACION CAMPAÑA COMERCIAL VENTA CRUZADA JC
                            setlblPrimaTotalDsctos(Math.Round(primaneta, 2).ToString().Replace(",", "."), i + 1);

                            string dia_pago = ConfigurationManager.AppSettings["DiaPagoCot"];

                            //INTEGRACION CAMPAÑA COMERCIAL VENTA CRUZADA JC
                            recargo = Convert.ToString(Convert.ToDecimal(recargo.Replace(".", ",")) + Convert.ToDecimal(descuentoAdicional.Replace(".", ","))).Replace(",", ".");

                            CalculaCuota(Math.Round(primaneta, 2).ToString().Replace(",", "."), "GD", this.drpValCuotaPAT.SelectedValue.ToString(), recargo, Session["COD_RAMO"].ToString(), dia_pago, i + 1);
                          //  CalculaCuota(Math.Round(primaneta, 2).ToString().Replace(",", "."), "GD", this.drpValCuota.SelectedValue.ToString(), recargo, Session["COD_RAMO"].ToString(), dia_pago, i + 1);
                            //CalculaCuota(Math.Round(primaneta, 2).ToString(), "GD", this.drpValCuota.SelectedValue.ToString(), recargo, Session["COD_RAMO"].ToString(), dia_pago, i + 1);
                            CalculaCuota(Math.Round(primaneta, 2).ToString().Replace(",", "."), "TA", this.drpValCuotaPAT.SelectedValue.ToString(), recargo, Session["COD_RAMO"].ToString(), dia_pago, i + 1);
                           // CalculaCuota(Math.Round(primaneta, 2).ToString().Replace(",", "."), "TA", this.drpValCuota.SelectedValue.ToString(), recargo, Session["COD_RAMO"].ToString(), dia_pago, i + 1);
                            //CalculaCuota(Math.Round(primaneta, 2).ToString(), "TA", this.drpValCuotaPAT.SelectedValue.ToString(), recargo, Session["COD_RAMO"].ToString(), dia_pago, i + 1);
                        }
                    }

                    Session["RECAR"] = this.txtRecargo1.Text;
                    //this.txtDescuento.Text = "0";
                    this.drpDescuento1.SelectedValue = "0";
                    Session["DESC"] = "0";
                }


            }
        }
        catch (Exception ex)
        {
            UtilesWeb.EjecutaJs(this, "alert('El monto de Recargo no es válido " + ex.Message + " ');");
            this.txtRecargo1.Text = Session["RECAR"].ToString();
            return;
        }
    }
    #endregion

    private string FormateoDecimales(string valor)
    {

        if (valor.IndexOf(".") == 0)
            valor = "0" + valor.Replace(",", ".");

        return valor = Convert.ToDecimal(valor).ToString("0.00").Replace(",", ".");


    }

    protected void drpValCuotaPAT_SelectedIndexChanged(object sender, EventArgs e)
    {
        string dia_pago = ConfigurationManager.AppSettings["DiaPagoCot"];

        for (int i = 0; i < Convert.ToInt32(Session["CANT_MODALIDADES"]); i++)  /**/
        {
            if (tblrowNomPlan.Cells[i + 1].Visible != false)
            {
                string descuento;

                if (Convert.ToSingle(getlblDescuento(i + 1)) == 0)
                    descuento = getlblRecargo(i + 1);
                else
                    descuento = getlblDescuento(i + 1);

                String sumadescuentos= "-"+ getDsctoCampanaComercial(i + 1);
                descuento = Convert.ToString(Convert.ToDecimal(descuento.Replace(".", ",")) + Convert.ToDecimal(sumadescuentos.Replace(".", ","))).Replace(",", ".");

                CalculaCuota(getlblPrimaNeta(i + 1), "TA", this.drpValCuotaPAT.SelectedValue.ToString(), descuento, Session["COD_RAMO"].ToString(), dia_pago, i + 1);
            }
        }

        for (int i = 0; i < Convert.ToInt32(Session["CANT_MODALIDADES"]); i++) /***/
        {
            if (tblrowNomPlan.Cells[i + 1].Visible != false)
            {
                string descuento;

                if (Convert.ToSingle(getlblDescuento(i + 1)) == 0)
                    descuento = getlblRecargo(i + 1);
                else
                    descuento = getlblDescuento(i + 1);

               String sumadescuentos= "-"+ getDsctoCampanaComercial(i + 1);
                descuento = Convert.ToString(Convert.ToDecimal(descuento.Replace(".", ",")) + Convert.ToDecimal(sumadescuentos.Replace(".", ","))).Replace(",", ".");


                CalculaCuota(getlblPrimaNeta(i + 1), "GD", this.drpValCuotaPAT.SelectedValue.ToString(), descuento, Session["COD_RAMO"].ToString(), dia_pago, i + 1);
            }
        }
    }

    protected void drpValCuota_SelectedIndexChanged(object sender, EventArgs e)
    {
        string dia_pago = ConfigurationManager.AppSettings["DiaPagoCot"];

        for (int i = 0; i < Convert.ToInt32(Session["CANT_MODALIDADES"]); i++) /***/
        {
            if (tblrowNomPlan.Cells[i + 1].Visible != false)
            {
                string descuento;

                if (Convert.ToSingle(getlblDescuento(i + 1)) == 0)
                    descuento = getlblRecargo(i + 1);
                else
                    descuento = getlblDescuento(i + 1);

                String descuentoAdicional ="-"+ getDsctoCampanaComercial(i + 1);

                descuento = Convert.ToString(Convert.ToDecimal(descuento.Replace(".", ",")) + Convert.ToDecimal(descuentoAdicional.Replace(".", ","))).Replace(",", ".");

                CalculaCuota(getlblPrimaNeta(i + 1), "GD", this.drpValCuota.SelectedValue.ToString(), descuento, Session["COD_RAMO"].ToString(), dia_pago, i + 1);
            }
        }
    }

    private void LimpiaPolVeh_Vehiculo()
    {
        Poliza PolVeh = Poliza.CargaPoliza();

        //Poliza PolVeh;
        //if (Session["PolVeh"] != null)
        //{
        //    PolVeh = (Poliza)Session["PolVeh"];
        //}
        //else
        //{
        //    PolVeh = new Poliza();
        //    Session["PolVeh"] = PolVeh;
        //}
        PolVeh.ID = "";
        PolVeh.NumMatricula = "";
        PolVeh.CodMarca = "";
        PolVeh.NomMarca = "";
        PolVeh.CodModelo = "";
        PolVeh.NomModelo = "";
        PolVeh.CodSubModelo = "";
        PolVeh.NomSubModelo = "";
        PolVeh.AñoFab = "";
        PolVeh.Fact48 = "";
        PolVeh.CodColor = "";
        PolVeh.NomColor = "";
        PolVeh.NroMotor = "";
        PolVeh.NroChasis = "";

    }

    private void LimpiaPolVeh_Tercero()
    {
        Poliza PolVeh = Poliza.CargaPoliza();

        //Poliza PolVeh;

        //if (Session["PolVeh"] != null)
        //{
        //    PolVeh = (Poliza)Session["PolVeh"];
        //}
        //else
        //{
        //    PolVeh = new Poliza();
        //    Session["PolVeh"] = PolVeh;
        //}

        PolVeh.CodDocumAseg = "";
        PolVeh.NomAseg = "";
        PolVeh.ApePatAseg = "";
        PolVeh.ApeMatAseg = "";
        PolVeh.EdadAseg = "";
        PolVeh.SexoAseg = "";

        PolVeh.CodDocumTomad = "";
        PolVeh.NomTomad = "";
        PolVeh.ApePatTomad = "";
        PolVeh.ApeMatTomad = "";
        PolVeh.EdadTomad = "";
        PolVeh.SexoTomad = "";

    }

    #region Util para no perder el focus
    private const string SCRIPT_DOFOCUS =
    @"window.setTimeout('DoFocus()', 1);
    function DoFocus()
    {
        try {
            document.getElementById('REQUEST_LASTFOCUS').focus();
        } catch (ex) {}
    }";

    private void HookOnFocus(Control CurrentControl)
    {
        //checks if control is one of TextBox, DropDownList, ListBox or Button
        if ((CurrentControl is TextBox) ||
            (CurrentControl is DropDownList) ||
            (CurrentControl is ListBox) ||
            (CurrentControl is Button))
            //adds a script which saves active control on receiving focus in the hidden field __LASTFOCUS.
            (CurrentControl as WebControl).Attributes.Add(
                    "onfocus",
                    "try{document.getElementById('__LASTFOCUS').value=this.id} catch(e) {}");
        //checks if the control has children
        if (CurrentControl.HasControls())
            //if yes do them all recursively
            foreach (Control CurrentChildControl in CurrentControl.Controls)
                HookOnFocus(CurrentChildControl);
    }

    #endregion

    protected void chk8200_CheckedChanged(object sender, EventArgs e)
    {
        this.chk8201.Checked = false;
        EscondeResultados();
    }

    protected void chk8201_CheckedChanged(object sender, EventArgs e)
    {
        this.chk8200.Checked = false;
        EscondeResultados();
    }

    protected void ImgRecalcular_Click(object sender, EventArgs e)
    {
        try
        {
            EscondeResultados();

            if (ValidaIngresoCampos())
            {
                flag = 0;
                Cotizar();
                EscondeCotizar();
                EscondeAvisoVencimiento();
            }
            else
            {
                UtilesWeb.EjecutaJs(this.Page, "alert('else')");
            }
        }
        catch
        {
            Response.Redirect("SessionTerminada.aspx", false);
        }
    }

    protected void ImgNuevaCotizacion_Click(object sender, EventArgs e)
    {
        EscondeResultados();
        //Response.Redirect("Cotizador.aspx", false);
        Response.Redirect(Session["LOAD_URL"].ToString());
    }

    protected void ImgEnviarMail_Click(object sender, EventArgs e)
    {
        EnviarCorreo.Visible = true;
        this.EnviarCorreo_Exitoso.Visible = false;
        this.EnviarCorreo.Visible = true;
    }

    protected void imgEmailEnviar_Click(object sender, EventArgs e)
    {
        try
        {

            if (UtilesWeb.ValidaTextBox(this, this.txtEmailPara, ScriptManager1) &&
                UtilesWeb.ValidaTextBox(this, this.txtEmailDe, ScriptManager1) &&
                UtilesWeb.ValidaTextBox(this, this.txtEmailMensaje, ScriptManager1))
            {
                string resultado_envio = "";

                if (!UtilesWeb.ValidaEmail(this.txtEmailPara.Text))
                {
                    UtilesWeb.EjecutaJs(this, "alert('La dirección de correo no es válida, favor corregir');");
                    this.txtEmailPara.Text = "";
                    return;
                }

                if (!UtilesWeb.ValidaEmail(this.txtEmailDe.Text))
                {
                    UtilesWeb.EjecutaJs(this, "alert('La dirección de correo no es válida, favor corregir');");
                    this.txtEmailDe.Text = "";
                    return;
                }
                Poliza PolVeh = new Poliza();
                string num_cotizacion = GeneraCotizacion(out PolVeh);
              


                if (num_cotizacion != "N")
                {
                    /*resultado_envio = Cotiza.EnviaCorreo(num_cotizacion.Substring(0, 3), num_cotizacion, this.txtEmailPara.Text, this.txtEmailDe.Text, this.txtEmailDe.Text, this.txtEmailMensaje.Text);

                    if (resultado_envio != "")
                    {
                        this.lblEnvioCorreo.Text = "El correo no ha podido ser enviado, por favor intÃ©ntelo mas tarde.";
                        this.EnviarCorreo_Exitoso.Visible = true;
                        this.EnviarCorreo.Visible = false;

                    }
                    else
                    {
                        this.lblEnvioCorreo.Text = "El correo ha sido enviado exitosamente.";
                        this.EnviarCorreo_Exitoso.Visible = true;
                        this.EnviarCorreo.Visible = false;
                    }*/

                    //string url = GeneraPDFCotizacion(num_cotizacion);
                    string num_cuotas_pat = drpValCuotaPAT.SelectedValue.ToString();
                    string url = GeneraPDFNuevaCotizacion(num_cuotas_pat, num_cotizacion);

                    if (url != "")
                    {
                        url = url.Replace(ConfigurationManager.AppSettings["Server"] + "/pdf/", "");

                        resultado_envio = Cotiza.EnviaCorreo(num_cotizacion.Substring(0, 3), num_cotizacion, this.txtEmailPara.Text, this.txtEmailDe.Text, this.txtEmailDe.Text, this.txtEmailMensaje.Text, url);

                        if (resultado_envio != "OK")
                        {
                            this.lblEnvioCorreo.Text = "El correo no ha podido ser enviado, por favor inténtelo mas tarde.";
                            this.EnviarCorreo_Exitoso.Visible = true;
                            this.EnviarCorreo.Visible = false;

                        }
                        else
                        {
                            this.lblEnvioCorreo.Text = "El correo ha sido enviado exitosamente.";
                            this.EnviarCorreo_Exitoso.Visible = true;
                            this.EnviarCorreo.Visible = false;
                        }
                    }
                    else
                    {
                        this.lblEnvioCorreo.Text = "El correo no ha podido ser enviado, por favor inténtelo mas tarde.";
                        this.EnviarCorreo_Exitoso.Visible = true;
                        this.EnviarCorreo.Visible = false;
                    }
                }
            }

        }
        catch
        {
            this.lblEnvioCorreo.Text = "El correo no ha podido ser enviado, por favor inténtelo mas tarde.";
            this.EnviarCorreo_Exitoso.Visible = true;
            this.EnviarCorreo.Visible = false;
        }
    }

    protected void ImgCancelar_Click1(object sender, EventArgs e)
    {
        EnviarCorreo.Visible = false;
    }

    protected void txtEmailPara_TextChanged(object sender, EventArgs e)
    {
        if (!UtilesWeb.ValidaEmail(((TextBox)sender).Text.ToString()))
        {
            UtilesWeb.EjecutaJs(this, "alert('La dirección de correo no es válida, favor corregir');");
            this.txtEmailPara.Text = "";
        }
    }

    protected void txtEmailDe_TextChanged(object sender, EventArgs e)
    {
        if (!UtilesWeb.ValidaEmail(((TextBox)sender).Text.ToString()))
        {
            UtilesWeb.EjecutaJs(this, "alert('La dirección de correo no es válida, favor corregir');");
            this.txtEmailDe.Text = "";
        }
    }

    protected void txtCuenta_TextChanged(object sender, EventArgs e)
    {
        string cod_docum = this.txtCuenta.Text.ToUpper().Trim().Replace("-", "").Replace(".", "");

        if (UtilesWeb.ValidaRUT(cod_docum) == false)
        {
            //ScriptManager1.SetFocus(txtCodDocumAseg);
            this.txtCuenta.Text = "";
            UtilesWeb.EjecutaJs(this, "alert('El Rut no es válido, favor corregir');");
            return;
        }

        if (UtilesWeb.DV_RUT(cod_docum) == false)
        {
            //ScriptManager1.SetFocus(txtCodDocumAseg);
            this.txtCuenta.Text = "";
            UtilesWeb.EjecutaJs(this, "alert('El Rut no es válido, favor corregir');");
            return;
        }

    }

    protected void ImgNoSuplanta_Click(object sender, ImageClickEventArgs e)
    {
        PanelSuplanta.Visible = false;
    }

    protected void ImgMuestraSuplanta_Click(object sender, ImageClickEventArgs e)
    {
        PanelSuplanta.Visible = true;
    }

    protected void ImgSuplanta_Click(object sender, ImageClickEventArgs e)
    {
        if (UtilesWeb.ValidaTextBox(this, this.txtCuenta, ScriptManager1))
        {
            string cuenta_habilitada;

            string cod_docum = this.txtCuenta.Text.ToUpper().Trim().Replace("-", "").Replace(".", "");

            cuenta_habilitada = Tercero.CuentaHabilitada(cod_docum);

            if (cuenta_habilitada == "N")
            {
                UtilesWeb.EjecutaJs(this, "alert('El Rut ingresado no posee cuenta, favor corregir');");
                return;
            }
            else
            {
                Response.Redirect("load.aspx?MM_Cuenta=" + cod_docum + "&SUPLANTANDO=S", false);
            }
        }
    }

    protected void drpSubModelo_SelectedIndexChanged(object sender, EventArgs e)
    {
        string cod_sub_modelo = UtilesWeb.GetPropertyValue(sender, "SelectedValue");
        string cod_modelo = this.drpModelo.SelectedValue.ToString();
        string cod_marca = this.drpMarca.SelectedValue.ToString();

        string nom_tipo_veh = Vehiculo.TraeNomTipVehi(cod_marca, cod_modelo, cod_sub_modelo);

        if (nom_tipo_veh != "")
        {
            this.lblTipVehiculo.Text = nom_tipo_veh;
            this.lblTituloTipVeh.Text = "Tipo de Vehículo:";
        }
        else
        {
            this.lblTituloTipVeh.Text = "";
        }


    }

    protected void Timer1_Tick(object sender, EventArgs e)
    {
        //UtilesWeb.EjecutaJs(this, " $('#overlay').fadeIn('fast',function(){$('#box').animate({'top':'160px'},500);});");
        //UtilesWeb.EjecutaJs(this, " $('#slidebox').animate({'right':'0px'},300); ");
    }

    protected void Timer2_Tick(object sender, EventArgs e)
    {
        //UtilesWeb.EjecutaJs(this, " $('#overlay').fadeIn('fast',function(){$('#box').animate({'top':'160px'},500);});");
        //UtilesWeb.EjecutaJs(this, " $('#slidebox').animate({'right':'0px'},300); ");

        //UtilesWeb.EjecutaJs(this, "   $('#boxclose').click(function(){$('#box').animate({'top':'-200px'},500,function(){$('#overlay').fadeOut('fast');});}); ");

        //UtilesWeb.EjecutaJs(this, " $('#slidebox').stop(true).animate({'right':'-430px'},100); ");

        //this.Timer1.Enabled = false;
    }

    protected void GrabaDatosTmarketing(string cod_docum_aseg, string nom_asegurado, string ape_paterno, string ape_materno, string email, string num_telefono, string num_telefono2, string cod_producto, string cod_docum, string cod_convenio, string num_cotizacion)
    {
        if (Session["id_tmarketing"] == null)
        {
            Session["id_tmarketing"] = "";
        }

        string id_marketing = Cotiza.GrabaTMarketing(cod_docum_aseg, nom_asegurado, ape_paterno, ape_materno, email, num_telefono, num_telefono2, cod_producto, cod_docum, cod_convenio, num_cotizacion, Session["id_tmarketing"].ToString());

        Session["id_tmarketing"] = id_marketing;

    }

    public string getCobOpc()
    {
        string cob_opc = "";

        if (this.chk8105.Checked == true)
            cob_opc = cob_opc + this.chk8105.ID.Substring(3, 4) + "|";

        if (this.chk8133.Checked == true)
            cob_opc = cob_opc + this.chk8133.ID.Substring(3, 4) + "|";

        if (this.chkExGar.Checked == true)
            cob_opc = cob_opc + this.chkExGar.ID.Substring(3, 4).ToUpper() + "|";

        return cob_opc;
    }

    protected void chk8105_CheckedChanged(object sender, EventArgs e)
    {
        EscondeResultados();
    }

    protected void chk8133_CheckedChanged(object sender, EventArgs e)
    {
        EscondeResultados();
    }
    
    protected void chkExGar_CheckedChanged(object sender, EventArgs e)
    {
        EscondeResultados();
    }

    protected void ValidaExGarage(string cod_marca)
    {
        string marcas_exclusividad = ConfigurationManager.AppSettings["MarcasExclusividadGarage"];
        char[] r = { '-' };
        string[] arr_marcas = marcas_exclusividad.Split(r);

        this.chkExGar.Visible = false;
        this.chkExGar.Checked = false;

        foreach (string cod_marca_ex in arr_marcas)
        {
            if (cod_marca == cod_marca_ex)
            {
                this.chkExGar.Visible = true;
                //this.chkExGar.Checked = true;
            }
        }
    }

    protected void drpCuadroCom_SelectedIndexChanged(object sender, EventArgs e)
    {
       
        CalculaComisionDif();
        
    }

    protected void chkComisionDif_CheckedChanged(object sender, EventArgs e)
    {

        if (((CheckBox)sender).Checked == true)
        {
            this.drpCuadroCom1.Enabled = true;
            
            CalculaComisionDif();
            flag = 1;  //06_06
            this.drpCuadroCom1.Visible = true;
            tdCuadroCom.Visible = true;
        }
        else
        {
            EscondeResComisionDif();
            this.drpCuadroCom1.Enabled = false;
            //tdCuadroCom.Visible = false;
            Poliza PolVeh = Poliza.CargaPoliza();
            PolVeh.CodCuadroCom = "";

            Cotizar();
            EscondeAvisoVencimiento();

            //this.drpCuadroCom1.Visible = false;
        }


    }

    // 05_06
    protected void CalculaComisionDif()
    {

       // CotizarNuevo();   /// 05_06
        /*string[] deducible = { "83.18","63.98","58.86","51.83","26.55","14.86"
                                 ,"83.18","63.98","26.45","14.86"};*/
        //string[] deducible = { "1","2","3","4","5","6","7","8","9","10"};
        //UtilesWeb.EjecutaJs(this, "alert('ciclo for" + Convert.ToInt32(Session["CANT_MODALIDADES"]) + "');");
        for (int i = 0; i < Convert.ToInt32(Session["CANT_MODALIDADES"]); i++) /***/
        {
            if (tblrowNomPlan.Cells[i + 1].Visible != false)
            {
                string descuento;
                string porc_desc;

                System.Globalization.NumberFormatInfo nfi = new System.Globalization.NumberFormatInfo();
                nfi.NumberGroupSeparator = ",";

                if (Convert.ToSingle(Session["RECAR"].ToString()) == 0)
                {
                    porc_desc = "0";
                    Session["DESC"] = porc_desc;
                    this.drpDescuento1.SelectedValue = "0";

                    setlblDescuento("0.00", i + 1);

                    descuento = Session["DESC"].ToString();
                }
                else
                    descuento = Session["RECAR"].ToString();

                
                //INTEGRACION CAMPAÑA COMERCIAL 
                // decimal suma = (((primaneta - primaexcenta - (div * -1) - (divDscto * -1)) * iva) / 100) + (primaneta - (div * -1)) + (primaneta - (divDscto * -1));
                decimal descTotalCampañaComercial = Convert.ToDecimal((String.IsNullOrEmpty(sumaTotalPorcDsctos)) ? "0" : sumaTotalPorcDsctos.Replace(".", ","));
                //VALOR    EN FUNCION DEL PORCENTAJE DE DESCUENTO 

                if (flag == 0) // 06_06
                {
                    deducible[i] = getlblPrimaNetaOriginal(i + 1).Replace(",", ".");
                    lista.Add(getlblPrimaNetaOriginal(i + 1).Replace(",", "."));
                }
                decimal primanetaPantalla = decimal.Parse(getlblPrimaNetaOriginal(i + 1).Replace(",", "."), nfi);
                decimal divDscto = Math.Round((descTotalCampañaComercial * primanetaPantalla * -1) / 100, 2);
                //  string descuentoAdicional = Math.Round(divDscto, 2).ToString().Replace(",", ".");
                //se suma el valor del descuento cruzado al descuento para el calculo de la cuota 
                descuento = (Convert.ToDecimal(descuento, nfi) + Convert.ToDecimal(divDscto, nfi)).ToString();
                //// fin INTEGRACION CAMPAÑA COMERCIAL 



               /* DataRow cotizacion = Cotiza.CalcularComision(gethdfCodModalidad(i + 1),
                    Session["COD_DOCUM"].ToString(), Session["CONV"].ToString(),
                    this.drpCuadroCom1.SelectedValue.ToString(),
                    Convert.ToDecimal(getlblPrimaNetaOriginal(i + 1).Replace(",", "."), nfi),
                    descuento, Session["COD_RAMO"].ToString());*/
                //UtilesWeb.EjecutaJs(this, "alert('" +"bandera : "+flag+" " +deducible[i] + "');"); //06_06
                DataRow cotizacion = Cotiza.CalcularComision(gethdfCodModalidad(i + 1),
                    Session["COD_DOCUM"].ToString(), Session["CONV"].ToString(),
                    this.drpCuadroCom1.SelectedValue.ToString(),
                    Convert.ToDecimal(deducible[i], nfi),
                    descuento, Session["COD_RAMO"].ToString());
                
                //string primaneta = cotizacion["P_PRIMA_NETA"].ToString();   //05_06
                string primaneta = cotizacion["P_PRIMA"].ToString();   
                
                string primatotal = cotizacion["P_PRIMA_TOTAL"].ToString();

                string desc = cotizacion["P_DESC"].ToString();
                porc_desc = cotizacion["P_PORC_DESC"].ToString();
                //Session["DESC"] = porc_desc;

                string recar = cotizacion["P_RECAR"].ToString();
                string porc_recar = cotizacion["P_PORC_RECAR"].ToString();
                //Session["RECAR"] = porc_recar;

                Poliza PolVeh = Poliza.CargaPoliza();

                PolVeh.CodCuadroCom = this.drpCuadroCom1.SelectedValue.ToString();

                //Session["COD_RAMO"] = cotizacion["P_COD_RAMO"].ToString();
                //PolVeh.CodRamo = cotizacion["P_COD_RAMO"].ToString();

                //string descuento;

                //if (Convert.ToSingle(desc) == 0)
                //    descuento = recar;
                //else
                //    descuento = desc;

                string dia_pago = ConfigurationManager.AppSettings["DiaPagoCot"];

                //String descuentoAdicional = getDsctoCampanaComercial(i + 1);

                //descuento = Convert.ToString(Convert.ToDecimal(descuento.Replace(".", ",")) + Convert.ToDecimal(descuentoAdicional.Replace(".", ","))).Replace(",", ".");

                CalculaCuota(primaneta, "GD", this.drpValCuotaPAT.SelectedValue.ToString(), descuento, Session["COD_RAMO"].ToString(), dia_pago, i + 1);

                CalculaCuota(primaneta, "TA", this.drpValCuotaPAT.SelectedValue.ToString(), descuento, Session["COD_RAMO"].ToString(), dia_pago, i + 1);

                //setlblNomPlan(nom_modalidad, i + 1);

                //sethdfCodModalidad(cod_plan, i + 1);

                setlblPrimaNeta(primaneta, i + 1);  ///////////////////// aqui cambia los valores en la tabla de la pantalla

                //setcssPrimaNeta("PrimaNetaDisabled", i + 1);
                //this.tblrowPrimaNeta.CssClass = "PrimaNetaDisabled";

                setcssPrimaNeta("PrimaNetaEnabledabled", i + 1);
                this.tblrowPrimaNeta.CssClass = "PrimaNetaEnabledabled";

                setlblPrimaComision(primaneta, i + 1);

                setlblDescuento(desc, i + 1);
                //INTEGRACION CAMPAÑA COMERCIAL VENTA CRUZADA JC
                setlblPrimaTotalDsctos(primaneta.ToString(), i + 1);
                setlblRecargo(recar, i + 1);

                setlblPrimaTotal(primatotal, i + 1);

                //txtDescuento.Text = porc_desc;

                txtRecargo.Text = porc_recar;
                txtRecargo1.Text = porc_recar;

                //Session["MAX_DESC"] = Convert.ToInt32(porc_desc) * 2;
                //Session["MIN_RECAR"] = Convert.ToInt32(porc_recar);

            }
        }
        //CotizarNuevo();   /// 05_06
    }

    protected void ImgMel_Click(object sender, ImageClickEventArgs e)
    {
        //if (Session["es_gap"].ToString() == "SI")
        //{
        //    Session["MCA_MEL"] = "S";
        //    Session["CONV"] = "LXUF";
        //    PanelMELTW.Visible = false;
        //    Response.Redirect("load.aspx?MM_Cuenta=" + Session["MM_Cuenta"] + "&CONV=" + Session["CONV"]);
        //}
        //else
        //{
        Session["MCA_MEL"] = "S";
        PanelMELTW.Visible = false;

        if (Session["CONV"].ToString() == "AUTOANTIGUO")
        {
            PanelMELTW.Visible = false;
            PanelAutoAntiguo.Visible = true;
            chkVehFact48.Visible = false;
        }

        Response.Redirect("Cotizador.aspx");
        //}
    }

    protected void ImgTw_Click(object sender, ImageClickEventArgs e)
    {
        Session["MCA_MEL"] = "N";
        PanelMELTW.Visible = false;

        if (Session["CONV"].ToString() == "AUTOANTIGUO")
        {
            PanelMELTW.Visible = false;
            PanelAutoAntiguo.Visible = true;
            chkVehFact48.Visible = false;
        }

        Response.Redirect("Cotizador.aspx");
    }

    protected void ImgMel13_Click(object sender, ImageClickEventArgs e)
    {
        Session["MCA_MEL"] = "S";
        Session["CONV"] = "13MESES";
        PanelMELTW.Visible = false;

        if (Session["CONV"].ToString() == "AUTOANTIGUO")
        {
            PanelMELTW.Visible = false;
            PanelAutoAntiguo.Visible = false;
            chkVehFact48.Visible = false;
        }

        Response.Redirect("load.aspx?MM_Cuenta=" + Session["MM_Cuenta"] + "&CONV=" + Session["CONV"]);

    }

    public void ValidaEscondeOpcionesMEL()
    {
        if (Session["MCA_MEL"] != null)
        {
            if (Session["MCA_MEL"].ToString() == "N")
            {
                //this.Opc_CoberturasOpcionales.Visible = false;
                this.chk8133.Checked = false;
                this.chk8133.Enabled = false;
                this.ImgMuestraSuplanta.Visible = false;
                this.tblrowDescuento.Visible = false;
                this.tblrowRecargo.Visible = false;
                this.tblrowPrimaComision.Visible = false;
                this.ImgEmitir.Visible = false;
                this.tblrowSelModEmitir.Visible = false;
                this.lblTipoCot.Text = "";
                this.tblrowTitulo.Visible = false;

                //FMOUAT
                tdDscto.Visible = false;
                tdRecargo.Visible = false;
                tdCuadroCom.Visible = false;
            }
        }

        if (Session["MCA_MEL"] != null)
        {
            if (Session["CONV"].ToString() != "")
                this.tblrowTitulo.Visible = false;
        }

        //SOLICITUD MANTIS 107421
        if (Session["CONV"] != null && Session["CONV"].ToString() == "AUTOANTIGUO")
        {
            tdDscto.Visible = false;
            tdRecargo.Visible = false;
            //txtRecargo1.Enabled = false;
            //drpDescuento1.Enabled = false;
        }

    }

    public decimal GetPrimaExenta(string cod_modalidad)
    {
        try
        {
            System.Globalization.NumberFormatInfo nfi = new
            System.Globalization.NumberFormatInfo();
            nfi.NumberGroupSeparator = ",";

            string prima_exenta = Cotiza.PrimaExenta(Session["COD_RAMO"].ToString(), cod_modalidad);

            decimal exenta = Convert.ToDecimal(prima_exenta.Replace(",", "."), nfi);
            return exenta;
        }
        catch
        {
            return 0;
        }
    }

    protected void ImgIngresar_Click(object sender, ImageClickEventArgs e)
    {
        if (UtilesWeb.ValidaTextBox(this, this.txtNomMarketing, ScriptManager1) &&
            UtilesWeb.ValidaTextBox(this, this.txtEmailMarketing, ScriptManager1) &&
            UtilesWeb.ValidaTextBox(this, this.txtFonoMarketing, ScriptManager1))
        {
            if (Session["id_tmarketing"] == null)
            {
                Session["id_tmarketing"] = "";
            }

            if (!UtilesWeb.ValidaEmail(this.txtEmailMarketing.Text))
            {
                UtilesWeb.EjecutaJs(this, "alert('La dirección de correo no es válida, favor corregir');");
                this.txtEmailDe.Text = "";
                return;
            }

            string id_marketing = Cotiza.GrabaTMarketing("", this.txtNomMarketing.Text, "", "", this.txtEmailMarketing.Text, this.txtFonoMarketing.Text, "", ConfigurationManager.AppSettings["Producto"].ToString(), Session["COD_DOCUM"].ToString(), Session["CONV"].ToString(), "", Session["id_tmarketing"].ToString());

            this.PanelMarketing.Visible = false;

            Session["id_tmarketing"] = id_marketing;
        }

    }

    protected void GrabaDescuento(string num_cotizacion)
    {
        if (Session["mca_descuento"].ToString() == "S")
        {
            if (this.drpDescuento1.SelectedValue != "0")
            {
                Vehiculo.GrabaDescuentoOpc(this.drpDescuento1.SelectedValue.ToString(), num_cotizacion);
            }

        }
    }

    public bool ValidaPatenteAD()
    {
        if (Session["opc_soap"].ToString() == "S")

            //if (this.txtNumMatricula.Text == "A/D")
            //{
            //this.txtNumMatricula.Text = "";
            //UtilesWeb.EjecutaJs(this, "alert('Para esta promocion, la patente no puedes ser A/D');");

            //}

            //else
            //{
            return false;
        //}



        else
            return true;

    }

    protected void rbtDueño_CheckedChanged(object sender, EventArgs e)
    {
        if (rbtDueñoNo.Checked)
        {
            UtilesWeb.EjecutaJs(this, "alert('El RUT debe pertenecer al dueño del vehículo. Por favor ingresar el RUT correcto.');");
            txtCodDocumAseg.Text = "";
            txtApePatAseg.Text = "";
            txtApeMatAseg.Text = "";
            txtNomAseg.Text = "";
            txtCodDocumAseg.Focus();

            rbtDueñoNo.Checked = false;
        }
        EscondeResultados();
    }

    public bool cotizaMapfre(string convenio)
    {
        if (convenio == "RIPLEY" ||
            convenio == "RIPLEYBI" ||
            convenio == "RIPLEYFUNC" ||
            convenio == "RIPLEYDESCU" ||
            convenio == "RIPLEYCC" ||
            convenio == "RIPLEYUC" ||
            convenio == "RIPLEYUCHILE" ||
            convenio == "RIPLEYXBOX" ||
            convenio == "RIPLEYDIANINO" ||
            convenio == "RIPLEYCOR" ||
            convenio == "RIPLEYFUNC" ||
            convenio == "ESCOLARBIANUAL" ||
            convenio == "WILLIS" ||
            convenio == "789967806" ||
            convenio == "777215604")
            return false;
        else
            return true;
    }

    /// <summary>
    /// funcion de restriccion en caso amunategui
    /// </summary>
    /// <param name="cod_docum"></param>
    public void RestringeAmunategui(string cod_docum) {

        if (Cotiza.RestringeAmunategui(cod_docum))
        {
            EscondeAmunategui();
        }
      
    }

    protected void imgBtnAutoAntiguo_Click(object sender, ImageClickEventArgs e)
    {
        PanelAutoAntiguo.Visible = false;
    }
    protected void BtnAutoAntiguo_Click(object sender, EventArgs e)
    {
        PanelAutoAntiguo.Visible = false;
    }
    protected void ImgMel13_Click1(object sender, EventArgs e)
    {
        Session["MCA_MEL"] = "N";
        PanelMELTW.Visible = false;

        if (Session["CONV"].ToString() == "AUTOANTIGUO")
        {
            PanelMELTW.Visible = false;
            PanelAutoAntiguo.Visible = true;
            chkVehFact48.Visible = false;
        }

        Response.Redirect("Cotizador.aspx");
    }
    protected void ImgMel_Click1(object sender, EventArgs e)
    {
        //if (Session["es_gap"].ToString() == "SI")
        //{
        //    Session["MCA_MEL"] = "S";
        //    Session["CONV"] = "LXUF";
        //    PanelMELTW.Visible = false;
        //    Response.Redirect("load.aspx?MM_Cuenta=" + Session["MM_Cuenta"] + "&CONV=" + Session["CONV"]);
        //}
        //else
        //{
        Session["MCA_MEL"] = "S";
        PanelMELTW.Visible = false;

        if (Session["CONV"].ToString() == "AUTOANTIGUO")
        {
            PanelMELTW.Visible = false;
            PanelAutoAntiguo.Visible = true;
            chkVehFact48.Visible = false;
        }

        Response.Redirect("Cotizador.aspx");
        //}
    }
    protected void btnVolver_Click(object sender, EventArgs e)
    {
        if (!String.IsNullOrEmpty(Session["MM_Cuenta"].ToString()))
            Response.Redirect("load.asp?R=" + Session["MM_Cuenta"].ToString(), false);
    }
    protected void btnVolver2_Click(object sender, EventArgs e)
    {
        if (!String.IsNullOrEmpty(Session["MM_Cuenta"].ToString()))
            Response.Redirect("load.asp?R=" + Session["MM_Cuenta"].ToString(), false);
    }
    protected void txtFechaIniVigencia_TextChanged(object sender, EventArgs e)
    {
        if (DatosVigenciaEmisor.Visible == true)
        {
            Session["FechaIniVigenciaSel"] = txtFechaIniVigencia.Text;
            txtFechaFinVigencia.Text = "";
            txtCantDias.Text = "";

            if (!UtilesWeb.ValidaFecha(this.txtFechaIniVigencia.Text))
            {
                UtilesWeb.EjecutaJs(this, "alert('Fecha de Inicio no es válida, por favor debe corregirla');");
            }
        }

        EscondeResultados();
    }
    protected void txtFechaFinVigencia_TextChanged(object sender, EventArgs e)
    {
        if (DatosVigenciaEmisor.Visible == true)
        {
            if (!UtilesWeb.ValidaFecha(this.txtFechaFinVigencia.Text))
            {
                UtilesWeb.EjecutaJs(this, "alert('Fecha de Termino no es válida, por favor debe corregirla');");
            }
            else
            {
                DateTime fechaIni = DateTime.ParseExact(txtFechaIniVigencia.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                DateTime fechaFin = DateTime.ParseExact(txtFechaFinVigencia.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture);

                TimeSpan cantDias = fechaFin - fechaIni;
                txtCantDias.Text = cantDias.Days.ToString();
            }
        }

        EscondeResultados();
    }

    protected void EscondeAvisoVencimiento()
    {
        if (!String.IsNullOrEmpty(Session["MM_Cuenta"].ToString()))
        {
            if (Session["MM_Cuenta"].ToString() == "166418674" ||
                Session["MM_Cuenta"].ToString() == "16445939K" ||
                Session["MM_Cuenta"].ToString() == "100779757")
                tblrowCuota.Visible = false;
        }
    }

    protected void rbtParticular_CheckedChanged(object sender, EventArgs e)
    {
        if (rbtParticularNo.Checked)
        {
            UtilesWeb.EjecutaJs(this, "alert('No podrá cotizar debido a que la póliza es solo para vehículos de uso exclusivamente particular.');");
            rbtParticularNo.Checked = false;
        }
    }

    protected void drpTipoFamiliar_SelectedIndexChanged(object sender, EventArgs e)
    {
        DsctoFamiliar();
    }
}