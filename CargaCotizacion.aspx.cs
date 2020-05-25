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

public partial class _Default : System.Web.UI.Page
{
    protected void Page_PreInit(object sender, EventArgs e)
    {
        try
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
                    this.Theme = "Mapfre";
            }
        }
        catch
        {
            Response.Redirect("SessionTerminada.aspx", false);
        }
    }

    //integracion campaña comercial  jc
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

    //fin integracion campaña comercial  jc


    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            //test CJ 12-04-2018
            //tblrowCuota.Visible = true;
            ////tblrowPrimaTotalDsctos.Visible = true;
            //tblrowValorRef.Visible = true;
            //tblrowSelModalidades.Visible = true;
            //tblrowPrimaNeta.Visible = true;
            //tblrowPrimaComision.Visible = true;

            //tblrowDsctosCampanaComercial.Visible = true;


            //tblrowDsctoCruzada.Visible = true;
            //tblrowDsctoFamiliar.Visible = true;
            //tblrowDsctoAgendaVencida.Visible = true;
            //tblrowDsctosCampanaComercial.Visible = true;
            //tblrowPrimaTotalDsctos.Visible = true;


            if (!this.IsPostBack)
            {
                if (Session["MM_Cuenta"].ToString() == "")
                {
                    Response.Redirect("SessionTerminada.aspx", false);
                }

                Session["COD_DOCUM"] = Session["MM_Cuenta"].ToString();


                if (Session["mca_recargo"].ToString() == "S")
                {
                    tdRecargo.Visible = false;//FMOUAT
                    tblrowRecargo.Visible = false;
                }
                else
                {
                    tdRecargo.Visible = false;
                    tblrowRecargo.Visible = false;
                }

                LimpiaPolVeh_Vehiculo();

                CargaCuadroComOriginal();

                CargaCotizacion();

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
        }

        catch (Exception ex)
        {
            System.Diagnostics.StackTrace Stack = new System.Diagnostics.StackTrace(ex, true);
            int errorlineno = Stack.GetFrame(0).GetFileLineNumber();
            int errorcol = Stack.GetFrame(0).GetFileColumnNumber();

            UtilesWeb.EnviaCorreoAcusete(ex.Message, "Cot. Veh. Livianos - Cotizador.asxp - Page_Load - Linea: " + errorlineno + " - " + errorcol);
            Response.Redirect("SessionTerminada.aspx", false);

        }

    }

    public DataSet CargaDatosCotizacion(string num_cotizacion)
    {
        DataSet datoscot = new DataSet();
        datoscot = Cotiza.CargaDatosCotizacion(num_cotizacion);

        return datoscot;

    }

    protected void CargaDatosNumMatricula(string NumMatricula)
    {
        try
        {
            DataRow datos_vehiculo = null;

            this.lblNumMatricula.Text = NumMatricula;

            string num_matricula = this.lblNumMatricula.Text;

            //string tipopatente = UtilesWeb.ValidaPatente(num_matricula);

            //if (tipopatente == "ERROR")
            //{
            //    UtilesWeb.EjecutaJs(this, "alert('La patente no es válida, favor corregir');");
            //    this.txtNumMatricula.Text = "";
            //    //ScriptManager1.SetFocus(this.txtNumMatricula);
            //    this.chkCotExpress.Enabled = true;
            //    this.chkVehFact48.Enabled = true;
            //    return;
            //}

            if (this.lblNumMatricula.Text != "A/D")
            {
                string existe_poliza = Cotiza.PolizaExistente(this.lblNumMatricula.Text);

                if (existe_poliza == "S")
                {
                    UtilesWeb.EjecutaJs(this, "alert('La patente que desea ingresar ya existe en nuestros registros con una poliza vigente, por favor ingrese otra para cotizar.');");
                    this.txtNumMatricula.Visible = false;

                    //this.chkCotExpress.Enabled = true;
                    //this.chkVehFact48.Enabled = true;
                    return;
                }

                if (existe_poliza == "P")
                {
                    UtilesWeb.EjecutaJs(this, "alert('La patente ingresada no es posible de cotizar en MAPFRE, por favor ingrese otra para cotizar.');");
                    //this.txtNumMatricula.Text = "";

                    //this.chkCotExpress.Enabled = true;
                    //this.chkVehFact48.Enabled = true;
                    return;
                }
            }

            Poliza PolVeh = Poliza.CargaPoliza();

            datos_vehiculo = Vehiculo.DatosVehID(PolVeh.ID);

            #region Datos del Vehiculo

            UtilesWeb.selected(this.drpMarca, datos_vehiculo["P_COD_MARCA"].ToString());
            UtilesWeb.selected(this.drpAño, datos_vehiculo["P_ANIO"].ToString());

            this.lblNomMarca.Text = this.drpMarca.SelectedItem.ToString();
            this.drpMarca.Visible = false;

            this.lblAño.Text = this.drpAño.SelectedItem.ToString();
            this.drpAño.Visible = false;


            Vehiculo.Combo_Modelos(this.drpModelo, datos_vehiculo["P_COD_MARCA"].ToString());
            UtilesWeb.selected(this.drpModelo, datos_vehiculo["P_COD_MODELO"].ToString());

            this.lblNomModelo.Text = this.drpModelo.SelectedItem.ToString();
            this.drpModelo.Visible = false;

            Vehiculo.Combo_SubModelos(this.drpSubModelo, datos_vehiculo["P_COD_MARCA"].ToString(), datos_vehiculo["P_COD_MODELO"].ToString());
            UtilesWeb.selected(this.drpSubModelo, datos_vehiculo["P_COD_SUB_MODELO"].ToString());

            if (PolVeh.Convenio == "COMPARA")
            {
                this.lblNomSubModelo.Visible = false;
                this.drpSubModelo.Enabled = true;

                this.lblNumMatricula.Visible = false;
                this.txtNumMatricula.Enabled = true;
                this.txtNumMatricula.Text = PolVeh.NumMatricula;
            }
            else
            {
                this.lblNomSubModelo.Text = this.drpSubModelo.SelectedItem.ToString();
                this.drpSubModelo.Visible = false;
                this.drpSubModelo.Enabled = false;

                //this.txtNumMatricula.Enabled = false;
                //this.txtNumMatricula.Visible = false;

                if (this.lblNumMatricula.Text != "A/D")
                {
                    this.txtNumMatricula.Enabled = false;
                    this.txtNumMatricula.Visible = false;
                }
                else
                {
                    this.lblNumMatricula.Visible = false;
                    this.txtNumMatricula.Enabled = true;
                    this.txtNumMatricula.Text = PolVeh.NumMatricula;
                }
            }

            if (rbtHijosSi.Checked)
                PolVeh.PreguntaHijos = "S";
            else
                PolVeh.PreguntaHijos = "N";

            if (rbtFranquiciaSi.Checked)
                PolVeh.PreguntaFranquicia = "S";
            else
                PolVeh.PreguntaFranquicia = "N";

            PolVeh.CodMarca = this.drpMarca.SelectedValue.ToString();
            PolVeh.NomMarca = this.drpMarca.SelectedItem.ToString();

            PolVeh.CodModelo = this.drpModelo.SelectedValue.ToString();
            PolVeh.NomModelo = this.drpModelo.SelectedItem.ToString();

            PolVeh.CodSubModelo = this.drpSubModelo.SelectedValue.ToString();
            PolVeh.NomSubModelo = this.drpSubModelo.SelectedItem.ToString();

            PolVeh.AñoFab = this.lblAño.Text.ToString();

            this.drpMarca.Enabled = false;
            this.drpModelo.Enabled = false;
            this.drpAño.Enabled = false;

            if (datos_vehiculo["P_NRO_CHASIS"] != System.DBNull.Value && datos_vehiculo["P_NRO_CHASIS"].ToString() != "")
            {
                PolVeh.NroChasis = datos_vehiculo["P_NRO_CHASIS"].ToString();
            }

            if (datos_vehiculo["P_NRO_MOTOR"] != System.DBNull.Value && datos_vehiculo["P_NRO_MOTOR"].ToString() != "")
            {
                PolVeh.NroMotor = datos_vehiculo["P_NRO_MOTOR"].ToString();

                string val = Vehiculo.ValidaNroMotor(PolVeh.NroMotor.ToUpper());

                if (val == "S")
                {
                    PolVeh.NroMotor = "";
                }
            }

            if (datos_vehiculo["P_COD_COLOR"] != System.DBNull.Value && datos_vehiculo["P_COD_COLOR"].ToString() != "")
            {
                PolVeh.CodColor = datos_vehiculo["P_COD_COLOR"].ToString();
            }

            if (datos_vehiculo["P_NOM_COLOR"] != System.DBNull.Value && datos_vehiculo["P_NOM_COLOR"].ToString() != "")
            {
                PolVeh.NomColor = datos_vehiculo["P_NOM_COLOR"].ToString();
            }

            string nom_tipo_veh = Vehiculo.TraeNomTipVehi(PolVeh.CodMarca, PolVeh.CodModelo, PolVeh.CodSubModelo);

            if (nom_tipo_veh != "")
            {
                this.lblTipVehiculo.Text = nom_tipo_veh;
                this.lblTituloTipVeh.Text = "Tipo de Vehículo:";
            }
            else
            {
                this.lblTituloTipVeh.Text = "";
            }

            #endregion

            #region Datos del Asegurado

            string cod_docum_aseg = PolVeh.CodDocumAseg;

            //SetCodDocumAseg(cod_docum_aseg, datos_vehiculo["P_SEXO"].ToString(), datos_vehiculo["P_EDAD"].ToString());
            lblCodDocumAseg.Text = UtilesWeb.getFormated(cod_docum_aseg);

            string tip_rut = UtilesWeb.ValidaJuridico(cod_docum_aseg);

            DataRow datos_tercero = null;
            datos_tercero = Tercero.DatosTercero(cod_docum_aseg);

            this.lblNomAseg.Text = datos_tercero["P_NOM_TERCEO"].ToString();
            this.lblApePatAseg.Text = datos_tercero["P_APE_PATERNO"].ToString();
            this.lblApeMatAseg.Text = datos_tercero["P_APE_MATERNO"].ToString();

            #endregion

        }
        catch //(Exception ex)
        {
            UtilesWeb.EjecutaJs(this, "alert('La patente no es válida, favor corregir');");
            return;
        }
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
        switch (id)
        {
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
                    valor = lblPrimaNeta1.Text;
                    return valor;
                case 2:
                    valor = lblPrimaNeta2.Text;
                    return valor;
                case 3:
                    valor = lblPrimaNeta3.Text;
                    return valor;
                case 4:
                    valor = lblPrimaNeta4.Text;
                    return valor;
                case 5:
                    valor = lblPrimaNeta5.Text;
                    return valor;
                case 6:
                    valor = lblPrimaNeta6.Text;
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
                valor = lblPrimaNeta1.Text;
                return valor;
            case 2:
                valor = lblPrimaNeta2.Text;
                return valor;
            case 3:
                valor = lblPrimaNeta3.Text;
                return valor;
            case 4:
                valor = lblPrimaNeta4.Text;
                return valor;
            case 5:
                valor = lblPrimaNeta5.Text;
                return valor;
            case 6:
                valor = lblPrimaNeta6.Text;
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

    protected void ImgEmitir_Click(object sender, ImageClickEventArgs e)
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

            bool mca_valida;

            Poliza PolVeh = Poliza.CargaPoliza();

            if (PolVeh.Convenio == "COMPARA")
            {
                if (UtilesWeb.ValidaDrowDownList(this, this.drpSubModelo, ScriptManager1) &&
                    UtilesWeb.ValidaRadioButtons(this, this.rbtFranquiciaSi, this.rbtFranquiciaNo, ScriptManager1) &&
                    //UtilesWeb.ValidaRadioButtons(this, this.rbtDañosSi, this.rbtDañosNo, ScriptManager1) &&
                              UtilesWeb.ValidaRadioButtons(this, this.rbtDueñoSi, this.rbtDueñoNo, ScriptManager1) &&
                              UtilesWeb.ValidaRadioButtons(this, this.rbtHijosSi, this.rbtHijosNo, ScriptManager1))
                {
                    mca_valida = true;
                    PolVeh.CodSubModelo = this.drpSubModelo.SelectedValue;
                    PolVeh.NomSubModelo = this.drpSubModelo.SelectedItem.Text;
                    PolVeh.NumMatricula = this.txtNumMatricula.Text;

                    if (rbtHijosSi.Checked)
                        PolVeh.PreguntaHijos = "S";
                    else
                        PolVeh.PreguntaHijos = "N";

                    if (rbtFranquiciaSi.Checked)
                        PolVeh.PreguntaFranquicia = "S";
                    else
                        PolVeh.PreguntaFranquicia = "N";
                }
                else
                {
                    mca_valida = false;
                }
            }
            else
            {
                mca_valida = true;
            }

            if (mca_valida == true)
            {
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
                    PolVeh.Descuento = descrecarg;
                    PolVeh.Cuota = cuota;
                    PolVeh.Cuota = cuotaPAT;
                    PolVeh.NumCuota = this.drpValCuota.SelectedValue;
                    PolVeh.NumCuotaPAT = this.drpValCuotaPAT.SelectedValue;
                    PolVeh.DiaPago = diapago;

                    if (this.chkVehFact48.Checked)
                    {
                        if (PolVeh.NumMatricula == "")
                        {
                            PolVeh.NumMatricula = "A/D";
                            this.txtNumMatricula.Text = "A/D";
                        }
                    }

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

                    if (PolVeh.Convenio == "COMPARA")
                    {
                        if (this.chkVehFact48.Checked)
                            PolVeh.Fact48 = "1";
                        else
                            PolVeh.Fact48 = "0";

                        DataRow grabavehiculo = Cotiza.GrabaVehiculoCot(PolVeh.NumMatricula, PolVeh.CodDocumAseg, PolVeh.CodMarca, PolVeh.CodModelo, PolVeh.CodSubModelo, PolVeh.AñoFab, PolVeh.ID);

                        string update_cod_ramo = Cotiza.UpdateRamoSubModelo(PolVeh.NumCotizacion, PolVeh.CodMarca, PolVeh.CodModelo, PolVeh.CodSubModelo);
                        PolVeh.CodRamo = update_cod_ramo;

                    }

                    System.Globalization.NumberFormatInfo nfi = new
                    System.Globalization.NumberFormatInfo();
                    nfi.NumberGroupSeparator = ",";

                    //CJSS
                    grabamodalidad = Cotiza.GrabaCotizacionEmite(PolVeh.CodDocum, PolVeh.CodDocumAseg,
                        PolVeh.NumMatricula, PolVeh.FechaInicioVigencia, PolVeh.FechaFinVigencia, PolVeh.CodModalidad, Convert.ToDecimal(PolVeh.PrimaNeta.Replace(",", "."), nfi),
                        PolVeh.Descuento, PolVeh.CodRamo, PolVeh.MontoRC, PolVeh.EdadAseg, PolVeh.SexoAseg,
                        PolVeh.NumCotizacion, PolVeh.RCExceso, PolVeh.ID, PolVeh.Fact48, PolVeh.Convenio,
                        PolVeh.CobOpc, PolVeh.McaMel);

                    //FMOUAT

                    string Cotizacion = PolVeh.NumCotizacion;
                    string DesctoPAT = Cobranza.DesctoPAT();
                    string PrimaNeta = PolVeh.PrimaNeta;
                    string PrimaBruta = PolVeh.PrimaTotal;

                    decimal PrimaNetaPAT = 0;
                    decimal PrimaBrutaPAT = 0;

                    DesctoPAT = DesctoPAT.Replace(",", ".");
                    PrimaNetaPAT = Convert.ToDecimal(PrimaNeta.Replace(",", "."), nfi) - (Convert.ToDecimal(PrimaNeta.Replace(",", "."), nfi) * Convert.ToDecimal(DesctoPAT, nfi) / 100);
                    PrimaNetaPAT = Decimal.Round(PrimaNetaPAT, 2);

                    PrimaBrutaPAT = Convert.ToDecimal(PrimaBruta.Replace(",", "."), nfi) - (Convert.ToDecimal(PrimaBruta.Replace(",", "."), nfi) * Convert.ToDecimal(DesctoPAT, nfi) / 100);
                    PrimaBrutaPAT = decimal.Round(PrimaBrutaPAT, 2);

                    string OpcionPago = string.Empty;
                    string Fecha = string.Empty;

                    Logs.writeToLogFile("GrabaTabladeDesctoPAT");
                    Logs.writeToLogFile(Cotizacion.ToString());
                    Logs.writeToLogFile(DesctoPAT.ToString());
                    Logs.writeToLogFile(PrimaNeta.ToString());
                    Logs.writeToLogFile(PrimaNetaPAT.ToString());
                    Logs.writeToLogFile(PrimaBruta.ToString());
                    Logs.writeToLogFile(PrimaBrutaPAT.ToString());

                    DataRow GrabaDescuentoPat = Cotiza.GrabaTabladeDesctoPAT(Cotizacion.ToString(), DesctoPAT.ToString(), PrimaNeta.ToString(), PrimaNetaPAT.ToString(), "", PrimaBruta.ToString(), PrimaBrutaPAT.ToString());

                    #region guarda respuestas y preguntas1

                    if (rbtHijosSi.Checked)
                        PolVeh.PreguntaHijos = "S";
                    else
                        PolVeh.PreguntaHijos = "N";

                    if (rbtFranquiciaSi.Checked)
                        PolVeh.PreguntaFranquicia = "S";
                    else
                        PolVeh.PreguntaFranquicia = "N";

                    string hijos, franquicia, danospre;
                    if (PolVeh.PreguntaHijos == "S") hijos = "SI"; else hijos = "NO";
                    if (PolVeh.PreguntaFranquicia == "S") franquicia = "SI"; else franquicia = "NO";
                    //if (PolVeh.PreguntaDanosPre =="S") danospre = "SI"; else danospre="NO";

                    bool actupregveh = Cotiza.actualizaPregVeh(PolVeh.NumCotizacion, PolVeh.PreguntaHijos.ToUpper(), PolVeh.PreguntaFranquicia.ToUpper(), "");

                    bool grabapreguntahijo = Cotiza.RegistraPregCotizacion(1, Convert.ToInt32(PolVeh.CodRamo), lblPregHijos.Text.ToUpper(), hijos, PolVeh.NumCotizacion, PolVeh.NumPoliza);
                    bool grabapreguntafranq = Cotiza.RegistraPregCotizacion(1, Convert.ToInt32(PolVeh.CodRamo), lblPregFranquicia.Text.ToUpper(), franquicia.ToUpper(), PolVeh.NumCotizacion, PolVeh.NumPoliza);
                    //bool grabapreguntadanos = Cotiza.RegistraPregCotizacion(1, Convert.ToInt32(PolVeh.CodRamo), lblPregDanos.Text.ToUpper(), danospre.ToUpper(), PolVeh.NumCotizacion, PolVeh.NumPoliza);

                    #endregion

                    PolVeh.NumCotizacion = grabamodalidad["p_num_cotizacion"].ToString();

                    if (grabamodalidad["p_error"].ToString() == "0")
                    {
                        Response.Redirect("Emisor.aspx", false);
                    }

                }
            }
        }
        catch (Exception ex)
        {
            Logs.writeToLogFile("1674 " + ex.Message);
            UtilesWeb.EnviaCorreoAcusete(ex.Message, "Cot. Veh. Livianos - Cotizador.asxp - ImgEmitirMostrar_Click");
        }
    }

    protected void chk8200_CheckedChanged(object sender, EventArgs e)
    {
        this.chk8201.Checked = false;
        //EscondeResultados();
    }

    protected void chk8201_CheckedChanged(object sender, EventArgs e)
    {
        this.chk8200.Checked = false;
        //EscondeResultados();
    }

    protected void ImgNuevaCotizacion_Click(object sender, EventArgs e)
    {
        //EscondeResultados();
        Response.Redirect("load.aspx?MM_Cuenta=" + Session["COD_DOCUM"].ToString(), false);
    }

    protected void ImgCotizar_Click(object sender, EventArgs e)
    {
        try
        {
            if (UtilesWeb.ValidaRadioButtons(this, this.rbtDueñoSi, this.rbtDueñoNo, ScriptManager1) &&
                              UtilesWeb.ValidaRadioButtons(this, this.rbtHijosSi, this.rbtHijosNo, ScriptManager1))
            {
                string num_cotizacion = GeneraCotizacion();
                if (num_cotizacion != "N")
                    //string num_cotizacion = "";
                    ImprimeCotizacion(num_cotizacion);
            }
        }
        catch (Exception ex)
        {
            UtilesWeb.EnviaCorreoAcusete(ex.Message, "Cot. Veh. Livianos - Cotizador.asxp - ImgCotizar_Click");
        }

    }

    protected string GeneraCotizacion()
    {

        Poliza PolVeh = Poliza.CargaPoliza();

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

        for (int i = 0; i < Convert.ToInt32(Session["CANT_MODALIDADES"].ToString()); i++)
        {
            arr[i] = i + 1;

        }

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

        string strModalidades = "";

        string num_cotizacion = "";

        if (PolVeh.NumCotizacion != "")
        {
            num_cotizacion = PolVeh.NumCotizacion;
        }

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

                strModalidades = strModalidades + cod_modalidad + "$" + prima_neta + "#" + descrecarg + "|";

            }

        }
        #endregion

        DataRow grabavehiculo = Cotiza.GrabaVehiculoCot(PolVeh.NumMatricula, PolVeh.CodDocumAseg, PolVeh.CodMarca, PolVeh.CodModelo, PolVeh.CodSubModelo, PolVeh.AñoFab, PolVeh.ID);

        PolVeh.ID = grabavehiculo["P_ID"].ToString();

        //FMOUAT
        PolVeh.NomAseg = this.lblNomAseg.Text;
        PolVeh.ApePatAseg = this.lblApePatAseg.Text;
        PolVeh.ApeMatAseg = this.lblApeMatAseg.Text;

        PolVeh.NomTomad = this.lblNomAseg.Text;
        PolVeh.ApePatTomad = this.lblApePatAseg.Text;
        PolVeh.ApeMatTomad = this.lblApeMatAseg.Text;

        if (rbtHijosSi.Checked)
            PolVeh.PreguntaHijos = "S";
        else
            PolVeh.PreguntaHijos = "N";

        if (rbtFranquiciaSi.Checked)
            PolVeh.PreguntaFranquicia = "S";
        else
            PolVeh.PreguntaFranquicia = "N";
        //FMOUAT FIN

        DataRow grabatercero = Tercero.GuardaNomTer(PolVeh.CodDocumAseg, PolVeh.ApePatAseg, PolVeh.ApeMatAseg, PolVeh.NomAseg);

        //DataRow grabacotizacion = Cotiza.GrabaCotizacion(PolVeh.CodDocum, PolVeh.CodDocumAseg, PolVeh.NumMatricula, strModalidades, PolVeh.NumCotizacion, PolVeh.CodRamo, PolVeh.MontoRC, PolVeh.SexoAseg, PolVeh.EdadAseg, PolVeh.RCExceso, PolVeh.ID, PolVeh.Fact48, PolVeh.Convenio, PolVeh.CobOpc, PolVeh.McaMel, PolVeh.FechaInicioVigencia, PolVeh.FechaFinVigencia);

        //PolVeh.NumCotizacion = grabacotizacion["p_num_cotizacion"].ToString();

        PolVeh.NumCotizacion = PolVeh.NumCotizacion;
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

        //GrabaDescuento(PolVeh.NumCotizacion);

        DataRow grabacomision;
        //if (PolVeh.CodCuadroCom != "")
        grabacomision = Cotiza.GrabaComision(PolVeh.NumCotizacion, PolVeh.CodCuadroCom);

        //if (grabavehiculo["P_ERROR"].ToString() == "0" && grabacotizacion["P_ERROR"].ToString() == "0" && grabatercero["P_ERROR"].ToString() == "0")
        //if (grabavehiculo["P_ERROR"].ToString() == "0" && grabacotizacion["P_ERROR"].ToString() == "0")
        if (grabavehiculo["P_ERROR"].ToString() == "0")
            return PolVeh.NumCotizacion;
        else
        {
            UtilesWeb.EjecutaJs(this, "alert('Se ha producido un error al generar su cotizacion, por favor intentelo más tarde');");
            return "N";
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

                CalculaCuota(getlblPrimaNeta(i + 1), "GD", this.drpValCuotaPAT.SelectedValue.ToString(), descuento, Session["COD_RAMO"].ToString(), dia_pago, i + 1);
            }
        }
    }

    protected void drpValCuota_SelectedIndexChanged(object sender, EventArgs e)
    {
        string dia_pago = ConfigurationManager.AppSettings["DiaPagoCot"];

        for (int i = 0; i <= Convert.ToInt32(Session["CANT_MODALIDADES"]) - 1; i++) /***/
        {
            if (tblrowNomPlan.Cells[i + 1].Visible != false)
            {
                string descuento;

                if (Convert.ToSingle(getlblDescuento(i + 1)) == 0)
                    descuento = getlblRecargo(i + 1);
                else
                    descuento = getlblDescuento(i + 1);

                CalculaCuota(getlblPrimaNeta(i + 1), "GD", this.drpValCuota.SelectedValue.ToString(), descuento, Session["COD_RAMO"].ToString(), dia_pago, i + 1);
            }
        }
    }

    public void CalculaCuota(string primatotal, string tip_cuota, string num_cuotas, string descuento, string cod_ramo, string dia_pago, int cont)
    {
        string valcuota = Cobranza.CalculaCuota(primatotal, tip_cuota, num_cuotas, descuento, cod_ramo, dia_pago);

        if (tip_cuota == "GD")
            setlblCuota(valcuota.Replace(",", "."), cont);
        else
            setlblCuotaPAT(valcuota.Replace(",", "."), cont);

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
        PolVeh.CobOpc = "";

    }

    public DropDownList CargaAñosdrp(DropDownList drp, int AñoInicio)
    {
        DateTime date = DateTime.Now;
        int AñoActual = date.Year;
        UtilesWeb.Carga_Anios_DropGenerico(drp, AñoActual - AñoInicio);
        return drp;

    }

    protected void chk8105_CheckedChanged(object sender, EventArgs e)
    {
        this.chk8105.Checked = false;
        //EscondeResultados();
    }
    protected void chk8133_CheckedChanged(object sender, EventArgs e)
    {
        this.chk8133.Checked = false;
        //EscondeResultados();
    }
    protected void chkExGar_CheckedChanged(object sender, EventArgs e)
    {
        this.chkExGar.Checked = false;
        //EscondeResultados();
    }

    protected void drpCuadroCom_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ValidaCambioComision())
            CalculaComisionDif();
        else
        {
            Poliza PolVeh = Poliza.CargaPoliza();
            DataSet datoscotizacion = CargaDatosCotizacion(PolVeh.NumCotizacion);

            if (datoscotizacion.Tables[0].Rows[0]["COD_CUADRO_COM"].ToString() == "")
                UtilesWeb.selected(this.drpCuadroCom, PolVeh.CodCuadroCom);
            else
                UtilesWeb.selected(this.drpCuadroCom, datoscotizacion.Tables[0].Rows[0]["COD_CUADRO_COM"].ToString());

            UtilesWeb.EjecutaJs(this, "alert('No es posible modificar la comision para esta cotizacion debido a que no cumple con las restricciones comerciales para efectuar dicho cambio. ');");
        }

    }

    protected void chkComisionDif_CheckedChanged(object sender, EventArgs e)
    {

        if (((CheckBox)sender).Checked == true)
        {
            this.drpCuadroCom.Enabled = true;
            CalculaComisionDif();
        }
        else
        {
            EscondeResComisionDif();
            this.drpCuadroCom.Enabled = false;

            Poliza PolVeh = Poliza.CargaPoliza();
            DataSet datoscotizacion = CargaDatosCotizacion(PolVeh.NumCotizacion);

            PolVeh.CodCuadroCom = datoscotizacion.Tables[0].Rows[0]["COD_CUADRO_COM"].ToString();

            if (PolVeh.CodCuadroCom == "")
                CargaCotizacion();
            else
                CargaCotizacionSinComision();
        }

    }

    protected void CalculaComisionDif()
    {
        for (int i = 0; i < Convert.ToInt32(Session["CANT_MODALIDADES"]); i++) /***/
        {
            if (tblrowNomPlan.Cells[i + 1].Visible != false)
            {
                string descuento;
                string porc_desc;

                System.Globalization.NumberFormatInfo nfi = new
                System.Globalization.NumberFormatInfo();
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

                DataRow cotizacion = Cotiza.CalcularComision(gethdfCodModalidad(i + 1), Session["COD_DOCUM"].ToString(), Session["CONV"].ToString(), this.drpCuadroCom.SelectedValue.ToString(), Convert.ToDecimal(getlblPrimaNetaOriginal(i + 1).Replace(",", "."), nfi), descuento, Session["COD_RAMO"].ToString());

                string primaneta = cotizacion["P_PRIMA"].ToString();
                string primatotal = cotizacion["P_PRIMA_TOTAL"].ToString();

                string desc = cotizacion["P_DESC"].ToString();
                porc_desc = cotizacion["P_PORC_DESC"].ToString();
                //Session["DESC"] = porc_desc;

                string recar = cotizacion["P_RECAR"].ToString();
                string porc_recar = cotizacion["P_PORC_RECAR"].ToString();
                //Session["RECAR"] = porc_recar;

                Poliza PolVeh = Poliza.CargaPoliza();

                PolVeh.CodCuadroCom = this.drpCuadroCom.SelectedValue.ToString();

                //Session["COD_RAMO"] = cotizacion["P_COD_RAMO"].ToString();
                //PolVeh.CodRamo = cotizacion["P_COD_RAMO"].ToString();

                //string descuento;

                //if (Convert.ToSingle(desc) == 0)
                //    descuento = recar;
                //else
                //    descuento = desc;

                string dia_pago = ConfigurationManager.AppSettings["DiaPagoCot"];

                CalculaCuota(primaneta, "GD", this.drpValCuota.SelectedValue.ToString(), descuento, Session["COD_RAMO"].ToString(), dia_pago, i + 1);

                CalculaCuota(primaneta, "TA", this.drpValCuotaPAT.SelectedValue.ToString(), descuento, Session["COD_RAMO"].ToString(), dia_pago, i + 1);

                //setlblNomPlan(nom_modalidad, i + 1);

                //sethdfCodModalidad(cod_plan, i + 1);

                //setlblPrimaNeta(primaneta, i + 1);

                setcssPrimaNeta("PrimaNetaDisabled", i + 1);
                //this.tblrowPrimaNeta.CssClass = "PrimaNetaDisabled";

                setlblPrimaComision(primaneta, i + 1);

                setlblDescuento(desc, i + 1);

                setlblRecargo(recar, i + 1);

                setlblPrimaTotal(primatotal, i + 1);

                //txtDescuento.Text = porc_desc;

                txtRecargo.Text = porc_recar;

                //Session["MAX_DESC"] = Convert.ToInt32(porc_desc) * 2;
                //Session["MIN_RECAR"] = Convert.ToInt32(porc_recar);              

            }

        }
        /*
        if (Convert.ToSingle(Session["RECAR"].ToString()) == 0)
            AplicaDescuentos();
        else
            AplicaRecargos();*/
    }

    private void EscondeResComisionDif()
    {
        //this.drpCuadroCom.Enabled = false;
        this.chkComisionDif.Checked = false;

        for (int i = 0; i < Convert.ToInt32(Session["CANT_MODALIDADES"]); i++) /***/
        {
            if (tblrowNomPlan.Cells[i + 1].Visible != false)
            {
                setlblPrimaComision("---", i + 1);
            }
        }
    }

    private void EscondeComisionDif()
    {
        this.tblrowPrimaComision.Visible = false;
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

    public void ValidaEscondeOpcionesMEL(string mca_mel)
    {
        if (Session["MCA_MEL"] == null)
        {
            Session["MCA_MEL"] = mca_mel;

            if (mca_mel == "N")
            {
                Response.Redirect("CargaCotizacion.aspx", false);
            }
        }
        else
        {

            if (Session["MCA_MEL"].ToString() == "N")
            {
                this.chk8133.Checked = true;
                this.chk8133.Enabled = false;
                this.tblrowDescuento.Visible = false;
                this.tblrowRecargo.Visible = false;
                this.tblrowPrimaComision.Visible = false;
                this.ImgEmitir.Visible = false;
                this.tblrowSelModEmitir.Visible = false;
                this.lblTipoCot.Text = "";
                this.tblrowTitulo.Visible = false;
            }

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
            //DataRow datos_vehiculo = null;

            this.txtNumMatricula.Text = this.txtNumMatricula.Text.ToUpper();

            string num_matricula = this.txtNumMatricula.Text;

            string tipopatente = UtilesWeb.ValidaPatente(num_matricula);

            if (tipopatente == "ERROR")
            {
                UtilesWeb.EjecutaJs(this, "alert('La patente no es válida, favor corregir');");
                this.txtNumMatricula.Text = "";
                //ScriptManager1.SetFocus(this.txtNumMatricula);
                //this.chkCotExpress.Enabled = true;
                //this.chkVehFact48.Enabled = true;
                return;
            }

            if (this.txtNumMatricula.Text != "A/D")
            {
                string existe_poliza = Cotiza.PolizaExistente(this.txtNumMatricula.Text);


                if (existe_poliza == "S")
                {
                    UtilesWeb.EjecutaJs(this, "alert('La patente que desea ingresar ya existe en nuestros registros con una poliza vigente, por favor ingrese otra para emitir.');");
                    this.txtNumMatricula.Text = "";
                    //ScriptManager1.SetFocus(this.txtNumMatricula);
                    //this.chkCotExpress.Enabled = true;
                    //this.chkVehFact48.Enabled = true;
                    return;
                }

                if (existe_poliza == "P")
                {
                    UtilesWeb.EjecutaJs(this, "alert('La patente ingresada no es posible de emitir en MAPFRE, por favor ingrese otra para cotizar.');");
                    this.txtNumMatricula.Text = "";
                    //ScriptManager1.SetFocus(this.txtNumMatricula);
                    //this.chkCotExpress.Enabled = true;
                    //this.chkVehFact48.Enabled = true;
                    return;
                }

                string existe_perdida_total = Cotiza.PerdidaTotal(this.txtNumMatricula.Text);

                if (existe_perdida_total == "S")
                {
                    UtilesWeb.EjecutaJs(this, "alert('La patente ingresada no es posible de emitir en MAPFRE, por favor ingrese otra para cotizar.');");
                    this.txtNumMatricula.Text = "";
                    //ScriptManager1.SetFocus(this.txtNumMatricula);
                    //this.chkCotExpress.Enabled = true;
                    //this.chkVehFact48.Enabled = true;
                    return;
                }
            }

            Poliza PolVeh = Poliza.CargaPoliza();

            PolVeh.NumMatricula = num_matricula;

            //EscondeResultados();
            //LimpiaPolVeh_Vehiculo();

            //Poliza PolVeh = Poliza.CargaPoliza();

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
            /*
            PolVeh.NumMatricula = num_matricula;

            datos_vehiculo = Vehiculo.DatosVeh(num_matricula);

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

                }

                //UtilesWeb.Asigna_dat_block(datos_vehiculo, this.txtNomAseg, "P_NOM_COT");

                //UtilesWeb.Asigna_dat_block(datos_vehiculo, this.txtApePatAseg, "P_APE_PAT_COT");

                //UtilesWeb.Asigna_dat_block(datos_vehiculo, this.txtApeMatAseg, "P_APE_MAT_COT");

                #endregion
            }
            else
            {
                EnableVeh();
            }

            this.chkCotExpress.Enabled = true;
            this.chkVehFact48.Enabled = true;*/
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
                this.chkExGar.Checked = true;
            }
        }
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

                        decimal suma = (((primaneta - primaexcenta - (div * -1)) * iva) / 100) + (primaneta - (div * -1));

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

                        setlblPrimaTotal(Math.Round(suma, 2).ToString().Replace(",", "."), i + 1);

                        string dia_pago = ConfigurationManager.AppSettings["DiaPagoCot"];

                        CalculaCuota(Math.Round(primaneta, 2).ToString().Replace(",", "."), "GD", this.drpValCuota.SelectedValue.ToString(), descuento, Session["COD_RAMO"].ToString(), dia_pago, i + 1);

                        CalculaCuota(Math.Round(primaneta, 2).ToString().Replace(",", "."), "TA", this.drpValCuota.SelectedValue.ToString(), descuento, Session["COD_RAMO"].ToString(), dia_pago, i + 1);
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

                            decimal suma = (((primaneta + (div) - primaexenta) * iva) / 100) + (primaneta + (div));

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

                            setlblRecargo(recargo.Replace(",", "."), i + 1);
                            //setlblRecargo(recargo, i + 1);
                            setlblDescuento("0.00", i + 1);

                            setlblPrimaTotal(Math.Round(suma, 2).ToString().Replace(",", "."), i + 1);
                            //setlblPrimaTotal(Math.Round(suma, 2).ToString(), i + 1); 

                            string dia_pago = ConfigurationManager.AppSettings["DiaPagoCot"];

                            CalculaCuota(Math.Round(primaneta, 2).ToString().Replace(",", "."), "GD", this.drpValCuota.SelectedValue.ToString(), recargo, Session["COD_RAMO"].ToString(), dia_pago, i + 1);
                            //CalculaCuota(Math.Round(primaneta, 2).ToString(), "GD", this.drpValCuota.SelectedValue.ToString(), recargo, Session["COD_RAMO"].ToString(), dia_pago, i + 1);

                            CalculaCuota(Math.Round(primaneta, 2).ToString().Replace(",", "."), "TA", this.drpValCuota.SelectedValue.ToString(), recargo, Session["COD_RAMO"].ToString(), dia_pago, i + 1);
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

    public bool ValidaCambioComision()
    {
        Poliza PolVeh = Poliza.CargaPoliza();

        return Cotiza.ValidaCambioComision(PolVeh.NumCotizacion, this.drpCuadroCom.SelectedValue);
    }

    public void CargaCotizacion()
    {
        if (Session["opc_cob_opc"].ToString() == "S")
            Opc_CoberturasOpcionales.Visible = true;
        else
            Opc_CoberturasOpcionales.Visible = false;

        if (Session["opc_cob"].ToString() == "S")
            Opc_Coberturas.Visible = true;
        else
            Opc_Coberturas.Visible = false;
        /*
        if (Session["mca_recargo"].ToString() == "S")
            tblrowRecargo.Visible = true;
        else
            tblrowRecargo.Visible = false;
        /*
        if (Session["mca_descuento"].ToString() == "S")
            tblrowDescuento.Visible = true;
        else
            tblrowDescuento.Visible = false;
        */

        Vehiculo.Carga_Marcas(this.drpMarca);
        int AntiguedadVeh = Convert.ToInt32(ConfigurationManager.AppSettings["AntiguedadVeh"]);
        this.drpAño = CargaAñosdrp(this.drpAño, AntiguedadVeh);

        lblNomCuenta.Text = Tercero.DatosCuenta(Session["COD_DOCUM"].ToString());

        tblrowValorRef.Cells[0].ColumnSpan = 11;

        tblrowValorRef.Cells[0].Text = ConfigurationManager.AppSettings["TextoValorReferencial"];

        Poliza PolVeh = Poliza.CargaPoliza();

        PolVeh.NumCotizacion = Session["num_recotizacion"].ToString();
        PolVeh.CodDocum = Session["COD_DOCUM"].ToString();



        DataSet datoscotizacion = CargaDatosCotizacion(PolVeh.NumCotizacion);

        PolVeh.McaMel = datoscotizacion.Tables[0].Rows[0]["MCA_MEL"].ToString();
        ValidaEscondeOpcionesMEL(PolVeh.McaMel);

        Session["CONV"] = datoscotizacion.Tables[0].Rows[0]["COD_DOCUM_PAG"].ToString();
        PolVeh.Convenio = Session["CONV"].ToString();

        PolVeh.CodDocumAseg = datoscotizacion.Tables[0].Rows[0]["COD_DOCUM_ASEG"].ToString();
        PolVeh.ID = datoscotizacion.Tables[0].Rows[0]["ID"].ToString();
        PolVeh.Fact48 = datoscotizacion.Tables[0].Rows[0]["FACTURA_48"].ToString();
        PolVeh.CodRamo = datoscotizacion.Tables[0].Rows[0]["COD_RAMO"].ToString();
        PolVeh.EdadAseg = datoscotizacion.Tables[0].Rows[0]["EDAD_CONDUCTOR"].ToString();
        PolVeh.SexoAseg = datoscotizacion.Tables[0].Rows[0]["ANOS_SIN_SINI"].ToString();
        PolVeh.MontoRC = datoscotizacion.Tables[0].Rows[0]["MONTO_RC"].ToString();
        PolVeh.RCExceso = datoscotizacion.Tables[0].Rows[0]["MONTO_DM"].ToString();
        PolVeh.NumMatricula = datoscotizacion.Tables[0].Rows[0]["NUM_MATRICULA"].ToString();
        PolVeh.FechaCotizacion = datoscotizacion.Tables[0].Rows[0]["FECHA_COT"].ToString();
        PolVeh.PreguntaHijos = datoscotizacion.Tables[0].Rows[0]["MCA_HIJOS"].ToString();
        PolVeh.PreguntaFranquicia = datoscotizacion.Tables[0].Rows[0]["MCA_FRANQUICIA"].ToString();

        //INTEGRACION CAMPAÑA COMERCIAL 
        CargarDescuentos(PolVeh.NumMatricula, PolVeh.CodDocumAseg, PolVeh.NumCotizacion);

        this.chk8133.Visible = false;

        this.chk8105.Enabled = false;
        this.chk8133.Enabled = false;
        this.chkExGar.Enabled = false;

        if (datoscotizacion.Tables[0].Rows[0]["DEDUCIBLE"].ToString() == "8105")
            this.chk8105.Checked = true;

        if (datoscotizacion.Tables[0].Rows[0]["MONTO_LC"].ToString() == "8133")
        {
            this.chk8133.Visible = true;
            this.chk8133.Checked = true;
        }

        if (datoscotizacion.Tables[0].Rows[0]["ASISTENCIA"].ToString() == "1")
        {
            this.chkExGar.Checked = true;
            this.chkExGar.Visible = true;
        }
        else
            this.chkExGar.Visible = false;

        PolVeh.CobOpc = getCobOpc();


        CargaDatosNumMatricula(PolVeh.NumMatricula);

        string existe_poliza = "N";

        if (PolVeh.NumMatricula != "A/D")
        {

            existe_poliza = Cotiza.PolizaExistente(PolVeh.NumMatricula);
        }

        if (existe_poliza != "S")
        {

            if (PolVeh.Fact48 == "0")
            {
                this.chkVehFact48.Checked = false;
                this.chkCotExpress.Checked = true;
            }
            else
            {
                this.chkVehFact48.Checked = true;
                this.chkCotExpress.Checked = false;
            }

            this.chkVehFact48.Enabled = false;


            if (PolVeh.RCExceso == "8200")
                this.chk8200.Checked = true;
            else
                this.chk8200.Checked = false;

            if (PolVeh.RCExceso == "8201")
                this.chk8201.Checked = true;
            else
                this.chk8201.Checked = false;

            this.chk8200.Enabled = false;
            this.chk8201.Enabled = false;


            if (PolVeh.NumMatricula == "A/D" && PolVeh.Fact48 == "0")
                this.chkCotExpress.Checked = true;
            else
                this.chkCotExpress.Checked = false;

            this.chkCotExpress.Enabled = false;


            if (this.chkCotExpress.Checked == true)
            {
                UtilesWeb.EjecutaJs(this, "alert('Opción utilizada no permite Emitir.  Comuniquese con su ejecutivo.');");

                this.ImgEmitir.Enabled = false;
                this.ImgEmitir.Visible = false;
            }

            //if (PolVeh.Convenio == "COMPARA")
            //{
            //this.chkCotExpress.Checked = false;
            //this.chkVehFact48.Checked = false;
            //this.ImgEmitir.Enabled = true;
            //this.ImgEmitir.Visible = true;
            //this.chkVehFact48.Enabled = true;
            //}

            if (PolVeh.Convenio == "COMPARA")
            {
                this.chkCotExpress.Checked = false;
                this.chkVehFact48.Checked = false;
                this.chkVehFact48.Enabled = true;
                this.ImgEmitir.Enabled = true;
                this.ImgEmitir.Visible = true;
            }

            this.tblrowSelModalidades.Visible = false;
            //this.ImgCotizar.Visible = false;

            if (Session["CONV"].ToString() == "RIPLEYBI" || Session["CONV"].ToString() == "RIPLEY")
            {
                //PolVeh.NumCuota = "15";
                Cobranza.PlanesPagoRipley(drpValCuota);
            }
            else
            {
                /*Cobranza.PlanesPago(drpValCuota);
                Cobranza.PlanesPago(drpValCuotaPAT);
                this.drpValCuota.SelectedIndex = 5;
                this.drpValCuotaPAT.SelectedIndex = 5;*/
                //if (PolVeh.Convenio == "COMPARA")
                //{
                //    /*if (rdbPAC.Checked)
                //        Cobranza.PlanesPagoCompara(drpValCuota, "DB");
                //    else*/
                //        Cobranza.PlanesPagoCompara(drpValCuota, "");
                //}
                //else
                //{
                //if (PolVeh.Convenio != "")
                //{
                //    string codRamo = "801";
                //    if (PolVeh.Convenio == "AUTOANTIGUO")
                //        codRamo = "809";

                //    /*if (this.rdbCuotasMapfre.Checked)
                //        Cobranza.PlanesPagoConvenio(drpValCuota, "1", codRamo, "GD", "99999", PolVeh.Convenio);

                //    if (this.rdbPAT.Checked)*/
                //        Cobranza.PlanesPagoConvenio(drpValCuota, "1", codRamo, "TA", "99999", PolVeh.Convenio);

                //        if (drpValCuota.Items.Count == 0)
                //    {
                //        Cobranza.PlanesPago(drpValCuota);
                //    }
                //}
                //else
                //{
                //    Cobranza.PlanesPago(drpValCuota);
                //}

                if (PolVeh.Convenio != "")
                {
                    string codRamo = "801";
                    if (PolVeh.Convenio == "AUTOANTIGUO")
                        codRamo = "809";

                    //if (this.rdbCuotasMapfre.Checked)
                    Cobranza.PlanesPagoConvenio(drpValCuota, "1", codRamo, "GD", "99999", PolVeh.Convenio);

                    //if (this.rdbPAT.Checked)
                    Cobranza.PlanesPagoConvenio(drpValCuotaPAT, "1", codRamo, "TA", "99999", PolVeh.Convenio);

                    //if (this.rdbPAC.Checked)
                    // Cobranza.PlanesPagoConvenio(drpPlanPago, "1", codRamo, "DB", "99999", PolVeh.Convenio);

                    if (drpValCuota.Items.Count == 0)
                    {
                        Cobranza.PlanesPago(drpValCuota);
                    }
                }
                else
                {
                    Cobranza.PlanesPago(drpValCuota);
                    Cobranza.PlanesPago(drpValCuotaPAT);
                }

                if (Session["CONV"].ToString() == "COMPARA")
                {
                    this.drpValCuotaPAT.SelectedIndex = 7;
                    this.drpValCuotaPAT.Enabled = true;
                }
            }

            /****/
            /*if (datoscotizacion.Tables[0].Rows[0]["COD_CUADRO_COM"].ToString() == "")
                //EscondeResComisionDif();
                //else
                EscondeComisionDif();
            else
            {*/
            ///PolVeh.CodCuadroCom = datoscotizacion.Tables[0].Rows[0]["COD_CUADRO_COM"].ToString();
            //EscondeResComisionDif();
            EscondeResComisionDif();
            //}

            if (PolVeh.CodCuadroCom == "")
            {
                this.chkComisionDif.Checked = false;
            }

            //Session["CANT_MODALIDADES"] = tblrowNomPlan.Cells.Count;

            string dia_pago = ConfigurationManager.AppSettings["DiaPagoCot"];

            ArrayList ModError = new ArrayList();

            for (int totalmod = 0; totalmod < tblrowNomPlan.Cells.Count; totalmod++)
            {
                tblrowNomPlan.Cells[totalmod].Visible = true;
                tblrowPrimaTotal.Cells[totalmod].Visible = true;
                tblrowPrimaComision.Cells[totalmod].Visible = true;
                tblrowPrimaNeta.Cells[totalmod].Visible = true;
                //tblrowDescuento.Cells[totalmod].Visible = true;
                //tblrowRecargo.Cells[totalmod].Visible = true;
                tblrowCuota.Cells[totalmod].Visible = true;
                tblrowCuotaPAT.Cells[totalmod].Visible = true;
                //tblrowSelModalidades.Cells[totalmod].Visible = true;
                tblrowSelModEmitir.Cells[totalmod].Visible = true;
            }

            this.tblResultados.Attributes.Remove("Width");
            this.tblResultados.Width = 980;

            Session["CANT_MODALIDADES"] = datoscotizacion.Tables[0].Rows.Count;

            string mca_cuadros = Cotiza.CuadroComisiones(PolVeh.CodDocum, PolVeh.Convenio, this.drpCuadroCom);

            if (PolVeh.CodCuadroCom == "")
            {
                for (int i = 0; i < Convert.ToInt32(Session["CANT_MODALIDADES"]); i++) /***/
                {
                    if (tblrowNomPlan.Cells[i + 1].Visible != false)
                    {
                        setlblPrimaComision("---", i + 1);
                    }
                }
            }

            for (int i = 0; i < datoscotizacion.Tables[0].Rows.Count; i++)
            {
                string cod_plan = datoscotizacion.Tables[0].Rows[i]["COD_MODALIDAD"].ToString();

                string nom_modalidad = Cotiza.NomModalidad(cod_plan);

                //DataRow cotizacion = Cotiza.Cotizar(cod_plan, cod_marca, cod_modelo, cod_submodelo, año, PolVeh.CodDocum, PolVeh.CodDocumAseg, PolVeh.NumMatricula, PolVeh.CodRamo, PolVeh.MontoRC, PolVeh.EdadAseg, PolVeh.SexoAseg, PolVeh.CantSiniestros, PolVeh.MontoSiniestros, PolVeh.RCExceso, PolVeh.AñoFab);

                //if (cotizacion["P_ERROR"].ToString() == "0")
                //{

                string primaneta;

                if (PolVeh.CodCuadroCom != "")
                {
                    this.chkComisionDif.Checked = true;
                    //this.chkComisionDif.Enabled = false;

                    //string mca_cuadros = Cotiza.CuadroComisiones(PolVeh.CodDocum, PolVeh.Convenio, this.drpCuadroCom);

                    UtilesWeb.selected(this.drpCuadroCom, PolVeh.CodCuadroCom);
                    //this.drpCuadroCom.Enabled = false;

                    primaneta = datoscotizacion.Tables[0].Rows[i]["IMP_PRIMA_NETA_REC"].ToString();
                    //primaneta= datoscotizacion.Tables[0].Rows[i]["IMP_PRIMA_NETA"].ToString();

                }
                else
                    primaneta = datoscotizacion.Tables[0].Rows[i]["IMP_PRIMA_NETA_REC"].ToString();
                //primaneta = datoscotizacion.Tables[0].Rows[i]["IMP_PRIMA_NETA"].ToString();

                string primatotal = datoscotizacion.Tables[0].Rows[i]["IMP_PRIMA_BRUTA"].ToString();

                string desc = datoscotizacion.Tables[0].Rows[i]["DESCUENTO"].ToString();

                string recar = datoscotizacion.Tables[0].Rows[i]["RECARGO"].ToString();

                decimal dec_primaneta = Convert.ToDecimal(primaneta.Replace(",", "."));

                decimal dec_desc = 0;
                if (desc != "")
                    dec_desc = Convert.ToDecimal(desc.Replace(",", "."));

                decimal dec_recar = 0;
                if (recar != "")
                    dec_recar = Convert.ToDecimal(recar.Replace(",", "."));

                string primaneta_sincuadro;

                string porc_desc = "0";
                string porc_recar = "0";

                if (dec_desc < 0)
                {
                    //decimal dec_porc_desc = dec_primaneta / dec_desc;
                    decimal dec_porc_desc = (dec_desc * 100) / dec_primaneta;
                    porc_desc = Convert.ToString(Math.Round(dec_porc_desc * -1, 0).ToString());
                }

                if (dec_recar > 0)
                {
                    //decimal dec_porc_recar = dec_primaneta / dec_recar;
                    decimal dec_porc_recar = (dec_recar * 100) / dec_primaneta;
                    porc_recar = Convert.ToString(Math.Round(dec_porc_recar, 0).ToString());
                }

                Session["DESC"] = porc_desc;
                Session["RECAR"] = porc_recar;

                Session["COD_RAMO"] = PolVeh.CodRamo;

                string descuento;

                if (Convert.ToDecimal(desc) == 0)
                    descuento = recar;
                else
                    descuento = desc;




                //INTEGRACION CAMPAÑA COMERCIAL 
                // decimal suma = (((primaneta - primaexcenta - (div * -1) - (divDscto * -1)) * iva) / 100) + (primaneta - (div * -1)) + (primaneta - (divDscto * -1));
                //decimal descTotalCampañaComercial = Convert.ToDecimal((String.IsNullOrEmpty(sumaTotalPorcDsctos)) ? "0" : sumaTotalPorcDsctos.Replace(".", ","));
                ////VALOR    EN FUNCION DEL PORCENTAJE DE DESCUENTO 
                //decimal divDscto = Math.Round((descTotalCampañaComercial * dec_primaneta * -1) / 100, 2);
                ////div = div + divDscto;



                //////RESTA EL PORCENTAJE DE DESCUENTO DE LA PRIMA  Y SE ACTUALIZA LA PRIMA TOTAL
                ////decimal primatotalcondescuento = (((primaneta - primaexcenta - (div * -1)) * iva) / 100) + (primaneta - (div * -1));
                ////decimal primatotalSindescuento = (((primaneta - primaexcenta) * iva) / 100) + (primaneta);

                ////INTEGRACION CAMPAÑA COMERCIAL VENTA CRUZADA JC
                //descuento = Convert.ToString(Convert.ToDecimal(descuento.Replace(".", ",")) + descTotalCampañaComercial).Replace(",", ".");



                CalculaCuota(primaneta.Replace(",", "."), "GD", this.drpValCuota.SelectedValue.ToString(), descuento.Replace(",", "."), Session["COD_RAMO"].ToString(), dia_pago, i + 1);

                CalculaCuota(primaneta.Replace(",", "."), "TA", this.drpValCuotaPAT.SelectedValue.ToString(), descuento.Replace(",", "."), Session["COD_RAMO"].ToString(), dia_pago, i + 1);

                setlblNomPlan(nom_modalidad, i + 1);

                sethdfCodModalidad(cod_plan, i + 1);

                if (PolVeh.CodCuadroCom != "")
                {
                    primaneta_sincuadro = Cotiza.CalcularSinComision(cod_plan, PolVeh.CodDocum, PolVeh.Convenio, PolVeh.CodCuadroCom, primaneta.Replace(",", "."), descuento.Replace(",", "."), PolVeh.CodRamo);

                    setlblPrimaNeta(primaneta_sincuadro.Replace(",", "."), i + 1);

                    setcssPrimaNeta("PrimaNetaDisabled", i + 1); ;

                    setlblPrimaComision(primaneta, i + 1);
                }
                else
                {
                    setlblPrimaNeta(primaneta.Replace(",", "."), i + 1);
                    setcssPrimaNeta("PrimaNetaEnabled", i + 1);
                }

                setlblDescuento(desc.Replace(",", "."), i + 1);

                setlblRecargo(recar.Replace(",", "."), i + 1);

                setlblPrimaTotal(primatotal.Replace(",", "."), i + 1);

                //campaña comercial jc 
               setlblPrimaTotalDsctos(primaneta, i + 1);

                //setDsctoCampanaComercial(descuentoAdicional, i + 1);

                /*
                txtDescuento.Text = porc_desc;
                this.txtDescuento.Visible = false;
                this.lblDescuento.Text = porc_desc;
                //this.lblDescuento.Visible = false;


                txtRecargo.Text = porc_recar;
                this.txtRecargo.Visible = false;
                this.lblRecargo.Text = porc_recar;
                this.lblRecargo.Visible = false;
                */

                txtRecargo.Text = porc_recar;
                txtRecargo1.Text = porc_recar;

                Session["MAX_DESC"] = Convert.ToInt32(porc_desc) * 2;
                Session["MIN_RECAR"] = Convert.ToInt32(porc_recar);
                //}
                //else
                //{
                //    ModError.Add(i);
                //    i_error++;
                //}
            }

            int error = tblrowNomPlan.Cells.Count - datoscotizacion.Tables[0].Rows.Count;

            //ModError.Add(i);
            //    i_error++;

            tblrowValorRef.Cells[0].ColumnSpan = datoscotizacion.Tables[0].Rows.Count + 1;

            tblrowValorRef.Cells[0].Text = ConfigurationManager.AppSettings["TextoValorReferencial"];

            tblrowValorRef.CssClass = "ValorRef";

            if ((datoscotizacion.Tables[0].Rows.Count - error) <= 5)
                this.tblResultados.Width = 700;


            for (int totalmod = 12; totalmod > datoscotizacion.Tables[0].Rows.Count; totalmod--)
            {
                tblrowNomPlan.Cells[totalmod].Visible = false;
                tblrowPrimaTotal.Cells[totalmod].Visible = false;
                tblrowPrimaComision.Cells[totalmod].Visible = false;
                tblrowPrimaNeta.Cells[totalmod].Visible = false;
                //tblrowDescuento.Cells[totalmod].Visible = false;
                //tblrowRecargo.Cells[totalmod].Visible = false;
                tblrowCuota.Cells[totalmod].Visible = false;
                tblrowCuotaPAT.Cells[totalmod].Visible = false;
                //tblrowSelModalidades.Cells[totalmod].Visible = false;
                tblrowSelModEmitir.Cells[totalmod].Visible = false;

                //CJ 10-04-2018
                tblrowDsctoCruzada.Cells[totalmod].Visible = false;
                tblrowPrimaTotalDsctos.Cells[totalmod].Visible = false;
                tblrowDsctoFamiliar.Cells[totalmod].Visible = false;
                tblrowDsctoAgendaVencida.Cells[totalmod].Visible = false;
                tblrowDsctosCampanaComercial.Cells[totalmod].Visible = false;
            }

            //for (int totalmoderror = 0; totalmoderror < error; totalmoderror++)
            //{
            //    tblrowNomPlan.Cells[error].Visible = false;
            //    tblrowPrimaTotal.Cells[error].Visible = false;
            //    tblrowPrimaComision.Cells[error].Visible = false;
            //    tblrowPrimaNeta.Cells[error].Visible = false;
            //    //tblrowDescuento.Cells[error].Visible = false;
            //    //tblrowRecargo.Cells[error].Visible = false;
            //    tblrowCuota.Cells[error].Visible = false;
            //    tblrowCuotaPAT.Cells[error].Visible = false;
            //    //tblrowSelModalidades.Cells[error].Visible = false;
            //    tblrowSelModEmitir.Cells[error].Visible = false;
            //}

            //if (ModError.Count == Planes.Tables[0].Rows.Count)
            //{
            //    UtilesWeb.EjecutaJs(this, "alert('" + ConfigurationManager.AppSettings["MensajeSinPlanes"] + "');");
            //}
            //else
            //{
            //    tblResultados.Visible = true;
            //    setSelectedPlan();
            //    ClearSelectedPlan();
            //    tblBotonera.Visible = true;
            //}

            /****/
        }
        else
        {
            tblResultados.Visible = false;
            tblBotonera.Visible = false;

        }

        this.rbtDueñoSi.Checked = true;
        this.rbtDueñoSi.Enabled = false;
        this.rbtDueñoNo.Enabled = false;

        if (datoscotizacion.Tables[0].Rows[0]["MCA_HIJOS"].ToString() == "")
        {
            this.rbtHijosSi.Enabled = true;
            this.rbtHijosNo.Enabled = true;
        }
        else
        {
            this.rbtHijosSi.Enabled = false;
            this.rbtHijosNo.Enabled = false;

            if (datoscotizacion.Tables[0].Rows[0]["MCA_HIJOS"].ToString() == "S")
                this.rbtHijosSi.Checked = true;
            else
                this.rbtHijosSi.Checked = false;

            if (datoscotizacion.Tables[0].Rows[0]["MCA_HIJOS"].ToString() == "N")
                this.rbtHijosNo.Checked = true;
            else
                this.rbtHijosNo.Checked = false;
        }

        if (datoscotizacion.Tables[0].Rows[0]["MCA_FRANQUICIA"].ToString() == "")
        {
            this.rbtFranquiciaSi.Enabled = true;
            this.rbtFranquiciaNo.Enabled = true;
        }
        else
        {
            this.rbtFranquiciaNo.Enabled = false;
            this.rbtFranquiciaSi.Enabled = false;

            if (datoscotizacion.Tables[0].Rows[0]["MCA_FRANQUICIA"].ToString() == "S")
                this.rbtFranquiciaSi.Checked = true;
            else
                this.rbtFranquiciaSi.Checked = false;

            if (datoscotizacion.Tables[0].Rows[0]["MCA_FRANQUICIA"].ToString() == "N")
                this.rbtFranquiciaNo.Checked = true;
            else
                this.rbtFranquiciaNo.Checked = false;

        }
    }

    public void CargaCuadroComOriginal()
    {
        Poliza PolVeh = Poliza.CargaPoliza();

        DataSet datoscotizacion = CargaDatosCotizacion(Session["num_recotizacion"].ToString());

        PolVeh.CodCuadroCom = datoscotizacion.Tables[0].Rows[0]["COD_CUADRO_COM"].ToString();

    }

    public void CargaCotizacionSinComision()
    {
        if (Session["opc_cob_opc"].ToString() == "S")
            Opc_CoberturasOpcionales.Visible = true;
        else
            Opc_CoberturasOpcionales.Visible = false;

        if (Session["opc_cob"].ToString() == "S")
            Opc_Coberturas.Visible = true;
        else
            Opc_Coberturas.Visible = false;
        /*
        if (Session["mca_recargo"].ToString() == "S")
            tblrowRecargo.Visible = true;
        else
            tblrowRecargo.Visible = false;
        /*
        if (Session["mca_descuento"].ToString() == "S")
            tblrowDescuento.Visible = true;
        else
            tblrowDescuento.Visible = false;
         */

        Vehiculo.Carga_Marcas(this.drpMarca);
        int AntiguedadVeh = Convert.ToInt32(ConfigurationManager.AppSettings["AntiguedadVeh"]);
        this.drpAño = CargaAñosdrp(this.drpAño, AntiguedadVeh);

        lblNomCuenta.Text = Tercero.DatosCuenta(Session["COD_DOCUM"].ToString());

        tblrowValorRef.Cells[0].ColumnSpan = 11;

        tblrowValorRef.Cells[0].Text = ConfigurationManager.AppSettings["TextoValorReferencial"];

        Poliza PolVeh = Poliza.CargaPoliza();

        PolVeh.NumCotizacion = Session["num_recotizacion"].ToString();
        PolVeh.CodDocum = Session["COD_DOCUM"].ToString();
        PolVeh.Convenio = Session["CONV"].ToString();

        DataSet datoscotizacion = CargaDatosCotizacion(PolVeh.NumCotizacion);

        PolVeh.McaMel = datoscotizacion.Tables[0].Rows[0]["MCA_MEL"].ToString();
        ValidaEscondeOpcionesMEL(PolVeh.McaMel);

        PolVeh.CodDocumAseg = datoscotizacion.Tables[0].Rows[0]["COD_DOCUM_ASEG"].ToString();
        PolVeh.ID = datoscotizacion.Tables[0].Rows[0]["ID"].ToString();
        PolVeh.Fact48 = datoscotizacion.Tables[0].Rows[0]["FACTURA_48"].ToString();
        PolVeh.CodRamo = datoscotizacion.Tables[0].Rows[0]["COD_RAMO"].ToString();
        PolVeh.EdadAseg = datoscotizacion.Tables[0].Rows[0]["EDAD_CONDUCTOR"].ToString();
        PolVeh.SexoAseg = datoscotizacion.Tables[0].Rows[0]["ANOS_SIN_SINI"].ToString();
        PolVeh.MontoRC = datoscotizacion.Tables[0].Rows[0]["MONTO_RC"].ToString();
        PolVeh.RCExceso = datoscotizacion.Tables[0].Rows[0]["MONTO_DM"].ToString();
        PolVeh.NumMatricula = datoscotizacion.Tables[0].Rows[0]["NUM_MATRICULA"].ToString();
        PolVeh.FechaCotizacion = datoscotizacion.Tables[0].Rows[0]["FECHA_COT"].ToString();

        this.chk8133.Visible = false;

        this.chk8105.Enabled = false;
        this.chk8133.Enabled = false;
        this.chkExGar.Enabled = false;

        if (datoscotizacion.Tables[0].Rows[0]["DEDUCIBLE"].ToString() == "8105")
            this.chk8105.Checked = true;

        if (datoscotizacion.Tables[0].Rows[0]["MONTO_LC"].ToString() == "8133")
        {
            this.chk8133.Visible = true;
            this.chk8133.Checked = true;
        }

        if (datoscotizacion.Tables[0].Rows[0]["ASISTENCIA"].ToString() == "1")
        {
            this.chkExGar.Checked = true;
            this.chkExGar.Visible = true;
        }
        else
            this.chkExGar.Visible = false;

        PolVeh.CobOpc = getCobOpc();


        CargaDatosNumMatricula(PolVeh.NumMatricula);

        if (PolVeh.Fact48 == "0")
        {
            this.chkVehFact48.Checked = false;
            this.chkCotExpress.Checked = true;
        }
        else
        {
            this.chkVehFact48.Checked = true;
            this.chkCotExpress.Checked = false;
        }

        this.chkVehFact48.Enabled = false;


        if (PolVeh.RCExceso == "8200")
            this.chk8200.Checked = true;
        else
            this.chk8200.Checked = false;

        if (PolVeh.RCExceso == "8201")
            this.chk8201.Checked = true;
        else
            this.chk8201.Checked = false;

        this.chk8200.Enabled = false;
        this.chk8201.Enabled = false;


        if (PolVeh.NumMatricula == "A/D" && PolVeh.Fact48 == "0")
            this.chkCotExpress.Checked = true;
        else
            this.chkCotExpress.Checked = false;

        this.chkCotExpress.Enabled = false;


        if (this.chkCotExpress.Checked == true)
        {
            this.ImgEmitir.Enabled = false;
            this.ImgEmitir.Visible = false;
        }

        //if (PolVeh.Convenio == "COMPARA")
        //{
        this.chkCotExpress.Checked = false;
        //this.chkVehFact48.Checked = false;
        this.ImgEmitir.Enabled = true;
        this.ImgEmitir.Visible = true;
        this.chkVehFact48.Enabled = true;
        //}

        if (PolVeh.Convenio == "COMPARA")
        {
            this.chkCotExpress.Checked = false;
            this.chkVehFact48.Checked = false;
            this.chkVehFact48.Enabled = true;
        }


        this.tblrowSelModalidades.Visible = false;
        //this.ImgCotizar.Visible = false;

        if (Session["CONV"].ToString() == "RIPLEYBI" || Session["CONV"].ToString() == "RIPLEY")
        {
            //PolVeh.NumCuota = "15";
            Cobranza.PlanesPagoRipley(drpValCuota);
        }
        else
        {
            Cobranza.PlanesPago(drpValCuota);
            Cobranza.PlanesPago(drpValCuotaPAT);
            this.drpValCuota.SelectedIndex = 5;
            this.drpValCuotaPAT.SelectedIndex = 5;
        }

        /****/
        /*if (datoscotizacion.Tables[0].Rows[0]["COD_CUADRO_COM"].ToString() == "")
            //EscondeResComisionDif();
            //else
            EscondeComisionDif();
        else
        {*/
        ///PolVeh.CodCuadroCom = datoscotizacion.Tables[0].Rows[0]["COD_CUADRO_COM"].ToString();
        //EscondeResComisionDif();
        EscondeResComisionDif();
        //}

        if (PolVeh.CodCuadroCom == "")
        {
            this.chkComisionDif.Checked = false;
        }

        //Session["CANT_MODALIDADES"] = tblrowNomPlan.Cells.Count;

        string dia_pago = ConfigurationManager.AppSettings["DiaPagoCot"];

        ArrayList ModError = new ArrayList();

        for (int totalmod = 0; totalmod < tblrowNomPlan.Cells.Count; totalmod++)
        {
            tblrowNomPlan.Cells[totalmod].Visible = true;
            tblrowPrimaTotal.Cells[totalmod].Visible = true;
            tblrowPrimaComision.Cells[totalmod].Visible = true;
            tblrowPrimaNeta.Cells[totalmod].Visible = true;
            //tblrowDescuento.Cells[totalmod].Visible = true;
            //tblrowRecargo.Cells[totalmod].Visible = true;
            tblrowCuota.Cells[totalmod].Visible = true;
            tblrowCuotaPAT.Cells[totalmod].Visible = true;
            //tblrowSelModalidades.Cells[totalmod].Visible = true;
            tblrowSelModEmitir.Cells[totalmod].Visible = true;
        }

        this.tblResultados.Attributes.Remove("Width");
        this.tblResultados.Width = 980;

        Session["CANT_MODALIDADES"] = datoscotizacion.Tables[0].Rows.Count;

        string mca_cuadros = Cotiza.CuadroComisiones(PolVeh.CodDocum, PolVeh.Convenio, this.drpCuadroCom);

        if (PolVeh.CodCuadroCom == "")
        {
            for (int i = 0; i < Convert.ToInt32(Session["CANT_MODALIDADES"]); i++) /***/
            {
                if (tblrowNomPlan.Cells[i + 1].Visible != false)
                {
                    setlblPrimaComision("---", i + 1);
                }
            }
        }

        for (int i = 0; i < datoscotizacion.Tables[0].Rows.Count; i++)
        {
            string cod_plan = datoscotizacion.Tables[0].Rows[i]["COD_MODALIDAD"].ToString();

            string nom_modalidad = Cotiza.NomModalidad(cod_plan);

            //DataRow cotizacion = Cotiza.Cotizar(cod_plan, cod_marca, cod_modelo, cod_submodelo, año, PolVeh.CodDocum, PolVeh.CodDocumAseg, PolVeh.NumMatricula, PolVeh.CodRamo, PolVeh.MontoRC, PolVeh.EdadAseg, PolVeh.SexoAseg, PolVeh.CantSiniestros, PolVeh.MontoSiniestros, PolVeh.RCExceso, PolVeh.AñoFab);

            //if (cotizacion["P_ERROR"].ToString() == "0")
            //{

            string primaneta;

            if (PolVeh.CodCuadroCom != "")
            {
                this.chkComisionDif.Checked = true;
                //this.chkComisionDif.Enabled = false;

                //string mca_cuadros = Cotiza.CuadroComisiones(PolVeh.CodDocum, PolVeh.Convenio, this.drpCuadroCom);

                UtilesWeb.selected(this.drpCuadroCom, PolVeh.CodCuadroCom);
                //this.drpCuadroCom.Enabled = false;

                primaneta = datoscotizacion.Tables[0].Rows[i]["IMP_PRIMA_NETA_REC"].ToString();
                //primaneta= datoscotizacion.Tables[0].Rows[i]["IMP_PRIMA_NETA"].ToString();

            }
            else
                primaneta = datoscotizacion.Tables[0].Rows[i]["IMP_PRIMA_NETA_REC"].ToString();
            //primaneta = datoscotizacion.Tables[0].Rows[i]["IMP_PRIMA_NETA"].ToString();

            string primatotal = datoscotizacion.Tables[0].Rows[i]["IMP_PRIMA_BRUTA"].ToString();

            string desc = datoscotizacion.Tables[0].Rows[i]["DESCUENTO"].ToString();

            string recar = datoscotizacion.Tables[0].Rows[i]["RECARGO"].ToString();

            decimal dec_primaneta = Convert.ToDecimal(primaneta.Replace(",", "."));
            decimal dec_desc = Convert.ToDecimal(desc.Replace(",", "."));
            decimal dec_recar = Convert.ToDecimal(recar.Replace(",", "."));

            string primaneta_sincuadro;

            string porc_desc = "0";
            string porc_recar = "0";

            if (dec_desc < 0)
            {
                //decimal dec_porc_desc = dec_primaneta / dec_desc;
                decimal dec_porc_desc = (dec_desc * 100) / dec_primaneta;
                porc_desc = Convert.ToString(Math.Round(dec_porc_desc * -1, 0).ToString());
            }

            if (dec_recar > 0)
            {
                //decimal dec_porc_recar = dec_primaneta / dec_recar;
                decimal dec_porc_recar = (dec_recar * 100) / dec_primaneta;
                porc_recar = Convert.ToString(Math.Round(dec_porc_recar, 0).ToString());
            }

            Session["DESC"] = porc_desc;
            Session["RECAR"] = porc_recar;

            Session["COD_RAMO"] = PolVeh.CodRamo;

            string descuento;

            if (Convert.ToDecimal(desc) == 0)
                descuento = recar;
            else
                descuento = desc;

            CalculaCuota(primaneta.Replace(",", "."), "GD", this.drpValCuota.SelectedValue.ToString(), descuento.Replace(",", "."), Session["COD_RAMO"].ToString(), dia_pago, i + 1);

            CalculaCuota(primaneta.Replace(",", "."), "TA", this.drpValCuotaPAT.SelectedValue.ToString(), descuento.Replace(",", "."), Session["COD_RAMO"].ToString(), dia_pago, i + 1);

            setlblNomPlan(nom_modalidad, i + 1);

            sethdfCodModalidad(cod_plan, i + 1);

            //if (PolVeh.CodCuadroCom != "")
            //{
            primaneta_sincuadro = Cotiza.CalcularSinComision(cod_plan, PolVeh.CodDocum, PolVeh.Convenio, PolVeh.CodCuadroCom, primaneta.Replace(",", "."), descuento.Replace(",", "."), PolVeh.CodRamo);

            setlblPrimaNeta(primaneta_sincuadro.Replace(",", "."), i + 1);

            //setcssPrimaNeta("PrimaNetaDisabled", i + 1); ;

            setlblPrimaComision(primaneta, i + 1);
            //}
            //else
            //{
            //    setlblPrimaNeta(primaneta.Replace(",", "."), i + 1);
            setcssPrimaNeta("PrimaNetaEnabled", i + 1);
            //}

            setlblDescuento(desc.Replace(",", "."), i + 1);

            setlblRecargo(recar.Replace(",", "."), i + 1);

            setlblPrimaTotal(primatotal.Replace(",", "."), i + 1);



            /*
            txtDescuento.Text = porc_desc;
            this.txtDescuento.Visible = false;
            this.lblDescuento.Text = porc_desc;
            //this.lblDescuento.Visible = false;

            txtRecargo.Text = porc_recar;
            this.txtRecargo.Visible = false;
            this.lblRecargo.Text = porc_recar;
            this.lblRecargo.Visible = false;
            */

            txtRecargo.Text = porc_recar;
            txtRecargo1.Text = porc_recar;

            Session["MAX_DESC"] = Convert.ToInt32(porc_desc) * 2;
            Session["MIN_RECAR"] = Convert.ToInt32(porc_recar);
            //}
            //else
            //{
            //    ModError.Add(i);
            //    i_error++;
            //}
        }

        int error = tblrowNomPlan.Cells.Count - datoscotizacion.Tables[0].Rows.Count;

        //ModError.Add(i);
        //    i_error++;

        tblrowValorRef.Cells[0].ColumnSpan = datoscotizacion.Tables[0].Rows.Count + 1;

        tblrowValorRef.Cells[0].Text = ConfigurationManager.AppSettings["TextoValorReferencial"];

        tblrowValorRef.CssClass = "ValorRef";

        EscondeResComisionDif();

        if ((datoscotizacion.Tables[0].Rows.Count - error) <= 5)
            this.tblResultados.Width = 700;


        for (int totalmod = 12; totalmod > datoscotizacion.Tables[0].Rows.Count; totalmod--)
        {
            tblrowNomPlan.Cells[totalmod].Visible = false;
            tblrowPrimaTotal.Cells[totalmod].Visible = false;
            tblrowPrimaComision.Cells[totalmod].Visible = false;
            tblrowPrimaNeta.Cells[totalmod].Visible = false;
            //tblrowDescuento.Cells[totalmod].Visible = false;
            //tblrowRecargo.Cells[totalmod].Visible = false;
            tblrowCuota.Cells[totalmod].Visible = false;
            tblrowCuotaPAT.Cells[totalmod].Visible = false;
            //tblrowSelModalidades.Cells[totalmod].Visible = false;
            tblrowSelModEmitir.Cells[totalmod].Visible = false;
        }

        for (int totalmoderror = 0; totalmoderror < error; totalmoderror++)
        {
            tblrowNomPlan.Cells[error].Visible = false;
            tblrowPrimaTotal.Cells[error].Visible = false;
            tblrowPrimaComision.Cells[error].Visible = false;
            tblrowPrimaNeta.Cells[error].Visible = false;
            //tblrowDescuento.Cells[error].Visible = false;
            //tblrowRecargo.Cells[error].Visible = false;
            tblrowCuota.Cells[error].Visible = false;
            tblrowCuotaPAT.Cells[error].Visible = false;
            //tblrowSelModalidades.Cells[error].Visible = false;
            tblrowSelModEmitir.Cells[error].Visible = false;
        }

        //if (ModError.Count == Planes.Tables[0].Rows.Count)
        //{
        //    UtilesWeb.EjecutaJs(this, "alert('" + ConfigurationManager.AppSettings["MensajeSinPlanes"] + "');");
        //}
        //else
        //{
        //    tblResultados.Visible = true;
        //    setSelectedPlan();
        //    ClearSelectedPlan();
        //    tblBotonera.Visible = true;
        //}

        /****/
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

    protected string GeneraPDFCotizacion(string num_cotizacion)
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

    protected string GeneraPDFNuevaCotizacion(string num_cuotas_pat, string num_cotizacion)
    {
        DataRow imprimecotizacion = Cotiza.ImprimeNuevaCotizacion(num_cuotas_pat, num_cotizacion);

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

    #region Descuento Cruzado
    public void setVentaCruzada(string valor, int id)
    {
        switch (id)
        {
            case 1:
                lblDsctoCruzada1.Text = valor.Replace(",", "."); ;
                break;
            case 2:
                lblDsctoCruzada2.Text = valor.Replace(",", "."); ;
                break;
            case 3:
                lblDsctoCruzada3.Text = valor.Replace(",", "."); ;
                break;
            case 4:
                lblDsctoCruzada4.Text = valor.Replace(",", "."); ;
                break;
            case 5:
                lblDsctoCruzada5.Text = valor.Replace(",", "."); ;
                break;
            case 6:
                lblDsctoCruzada6.Text = valor.Replace(",", "."); ;
                break;
            case 7:
                lblDsctoCruzada7.Text = valor.Replace(",", "."); ;
                break;
            case 8:
                lblDsctoCruzada8.Text = valor.Replace(",", "."); ;
                break;
            case 9:
                lblDsctoCruzada9.Text = valor.Replace(",", "."); ;
                break;
            case 10:
                lblDsctoCruzada10.Text = valor.Replace(",", "."); ;
                break;
            case 11:
                lblDsctoCruzada11.Text = valor.Replace(",", "."); ;
                break;
            case 12:
                lblDsctoCruzada12.Text = valor.Replace(",", "."); ;
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
                lblDsctoFamiliar1.Text = valor.Replace(",", "."); ;
                break;
            case 2:
                lblDsctoFamiliar2.Text = valor.Replace(",", "."); ;
                break;
            case 3:
                lblDsctoFamiliar3.Text = valor.Replace(",", "."); ;
                break;
            case 4:
                lblDsctoFamiliar4.Text = valor.Replace(",", "."); ;
                break;
            case 5:
                lblDsctoFamiliar5.Text = valor.Replace(",", "."); ;
                break;
            case 6:
                lblDsctoFamiliar6.Text = valor.Replace(",", "."); ;
                break;
            case 7:
                lblDsctoFamiliar7.Text = valor.Replace(",", "."); ;
                break;
            case 8:
                lblDsctoFamiliar8.Text = valor.Replace(",", "."); ;
                break;
            case 9:
                lblDsctoFamiliar9.Text = valor.Replace(",", "."); ;
                break;
            case 10:
                lblDsctoFamiliar10.Text = valor.Replace(",", "."); ;
                break;
            case 11:
                lblDsctoFamiliar11.Text = valor.Replace(",", "."); ;
                break;
            case 12:
                lblDsctoFamiliar12.Text = valor.Replace(",", "."); ;
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
                lblDsctoCampanaComercial1.Text = valor.Replace(",", "."); ;
                break;
            case 2:
                lblDsctoCampanaComercial2.Text = valor.Replace(",", "."); ;
                break;
            case 3:
                lblDsctoCampanaComercial3.Text = valor.Replace(",", "."); ;
                break;
            case 4:
                lblDsctoCampanaComercial4.Text = valor.Replace(",", "."); ;
                break;
            case 5:
                lblDsctoCampanaComercial5.Text = valor.Replace(",", "."); ;
                break;
            case 6:
                lblDsctoCampanaComercial6.Text = valor.Replace(",", "."); ;
                break;
            case 7:
                lblDsctoCampanaComercial7.Text = valor.Replace(",", "."); ;
                break;
            case 8:
                lblDsctoCampanaComercial8.Text = valor.Replace(",", "."); ;
                break;
            case 9:
                lblDsctoCampanaComercial9.Text = valor.Replace(",", "."); ;
                break;
            case 10:
                lblDsctoCampanaComercial10.Text = valor.Replace(",", "."); ;
                break;
            case 11:
                lblDsctoCampanaComercial11.Text = valor.Replace(",", "."); ;
                break;
            case 12:
                lblDsctoCampanaComercial12.Text = valor.Replace(",", "."); ;
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
        try
        {


            System.Globalization.NumberFormatInfo nfi = new
            System.Globalization.NumberFormatInfo();
            nfi.NumberGroupSeparator = ",";
            Decimal dsctoVentaCruzado = 0;
            Decimal dsctoFamiliar = 0;
            Decimal dsctoAgendaVencida = 0;

            primatotal = primatotal.Replace(".", ",");

            if (RowDsctoVentaCruzada)
            {
                //dsctoVentaCruzado = (Convert.ToDecimal(primatotal) * (Convert.ToDecimal(porcDsctoCruzado))) / 100;//
                //setVentaCruzada(dsctoVentaCruzado.ToString("N2"), id);


                dsctoVentaCruzado = Math.Round((Convert.ToDecimal(primatotal.Replace(",", "."), nfi) * Convert.ToDecimal(porcDsctoCruzado.Replace(",", "."), nfi)) / 100, 2);//con redondeo
                //dsctoVentaCruzado = (Convert.ToDecimal(primatotal,nfi) * (Convert.ToDecimal(porcDsctoCruzado,nfi))) / 100;//
                setVentaCruzada(dsctoVentaCruzado.ToString().Replace(",", "."), id);
            }
            else
            {
                this.tblrowDsctoCruzada.Visible = false;
            }
            if (RowDsctoFamiliar)
            {
                //decimal porcefami = ((String.IsNullOrEmpty(porcDsctoFamiliar)) ? 0 : Convert.ToDecimal(porcDsctoFamiliar));
                //dsctoFamiliar = (Convert.ToDecimal(primatotal) * porcefami) / 100;
                //setDsctoFamiliar(dsctoFamiliar.ToString("N2"), id);


                decimal porcefami = ((String.IsNullOrEmpty(porcDsctoFamiliar)) ? 0 : Convert.ToDecimal(porcDsctoFamiliar.Replace(",", "."), nfi));
                dsctoFamiliar = Math.Round((Convert.ToDecimal(primatotal.Replace(",", "."), nfi) * porcefami) / 100, 2);
                setDsctoFamiliar(dsctoFamiliar.ToString().Replace(",", "."), id);
            }
            else
            {
                this.tblrowDsctoFamiliar.Visible = false;
            }

            if (RowDsctoAgendaVencida)
            {
               
                //decimal porceAgendaVencida = ((String.IsNullOrEmpty(porcDsctoAgendaVencida)) ? 0 : Convert.ToDecimal(porcDsctoAgendaVencida));
                //dsctoAgendaVencida = (Convert.ToDecimal(primatotal) * porceAgendaVencida) / 100;
                //setlblDsctoAgendaVencida(dsctoAgendaVencida.ToString("N2"), id);
                decimal porceAgendaVencida = ((String.IsNullOrEmpty(porcDsctoAgendaVencida)) ? 0 : Convert.ToDecimal(porcDsctoAgendaVencida.Replace(",", "."), nfi));
                dsctoAgendaVencida = Math.Round((Convert.ToDecimal(primatotal.Replace(",", "."), nfi) * porceAgendaVencida) / 100, 2);
                setlblDsctoAgendaVencida(dsctoAgendaVencida.ToString().Replace(",", "."), id);
            }
            else
            {
                this.tblrowDsctoAgendaVencida.Visible = false;
            }
            String valor = (Convert.ToDecimal(primatotal, nfi) - (dsctoVentaCruzado + dsctoFamiliar + dsctoAgendaVencida)).ToString("N2");
            // Descuento  Total Campaña cOMENCIAL
        
            setDsctoCampanaComercial((dsctoVentaCruzado + dsctoFamiliar + dsctoAgendaVencida).ToString().Replace(",", "."), id);
            //switch (id)
            //{
            //    case 1:
            //        lblPrimaTotalDsctos1.Text = valor.Replace(",", "."); ;
            //        break;
            //    case 2:
            //        lblPrimaTotalDsctos2.Text = valor.Replace(",", "."); ;
            //        break;
            //    case 3:
            //        lblPrimaTotalDsctos3.Text = valor.Replace(",", "."); ;
            //        break;
            //    case 4:
            //        lblPrimaTotalDsctos4.Text = valor.Replace(",", "."); ;
            //        break;
            //    case 5:
            //        lblPrimaTotalDsctos5.Text = valor.Replace(",", "."); ;
            //        break;
            //    case 6:
            //        lblPrimaTotalDsctos6.Text = valor.Replace(",", "."); ;
            //        break;
            //    case 7:
            //        lblPrimaTotalDsctos7.Text = valor.Replace(",", "."); ;
            //        break;
            //    case 8:
            //        lblPrimaTotalDsctos8.Text = valor.Replace(",", "."); ;
            //        break;
            //    case 9:
            //        lblPrimaTotalDsctos9.Text = valor.Replace(",", "."); ;
            //        break;
            //    case 10:
            //        lblPrimaTotalDsctos10.Text = valor.Replace(",", "."); ;
            //        break;
            //    case 11:
            //        lblPrimaTotalDsctos11.Text = valor.Replace(",", "."); ;
            //        break;
            //    case 12:
            //        lblPrimaTotalDsctos12.Text = valor.Replace(",", "."); ;
            //        break;
            //    default:
            //        break;
            //}
            ////setDsctoCampanaComercial(descuentoAdicional, i + 1);
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
                lblDsctoAgendaVenc1.Text = valor.Replace(",", "."); ;
                break;
            case 2:
                lblDsctoAgendaVenc2.Text = valor.Replace(",", "."); ;
                break;
            case 3:
                lblDsctoAgendaVenc3.Text = valor.Replace(",", "."); ;
                break;
            case 4:
                lblDsctoAgendaVenc4.Text = valor.Replace(",", "."); ;
                break;
            case 5:
                lblDsctoAgendaVenc5.Text = valor.Replace(",", "."); ;
                break;
            case 6:
                lblDsctoAgendaVenc6.Text = valor.Replace(",", "."); ;
                break;
            case 7:
                lblDsctoAgendaVenc7.Text = valor.Replace(",", "."); ;
                break;
            case 8:
                lblDsctoAgendaVenc8.Text = valor.Replace(",", "."); ;
                break;
            case 9:
                lblDsctoAgendaVenc9.Text = valor.Replace(",", "."); ;
                break;
            case 10:
                lblDsctoAgendaVenc10.Text = valor.Replace(",", "."); ;
                break;
            case 11:
                lblDsctoAgendaVenc11.Text = valor.Replace(",", "."); ;
                break;
            case 12:
                lblDsctoAgendaVenc12.Text = valor.Replace(",", "."); ;
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


    private DataRow CalculoDsctoVentaCruzada(string CodDocumAseg)
    {
        try
        {
            string cod_ramo = "801";
            if (Session["CONV"].ToString() == "AUTOANTIGUO")
                cod_ramo = "809";

            string cod_docum_aseg = CodDocumAseg;
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

    private DataRow CalculoDsctoAgendaVencida(string NumMatricula, string rutAsegurado)
    {
        try
        {
            string cod_ramo = "801";
            if (Session["CONV"].ToString() == "AUTOANTIGUO")
                cod_ramo = "809";

            string num_traticula = NumMatricula.Trim();
            DataRow dr = Cotiza.DsctoAgendaVencida(cod_ramo, num_traticula, rutAsegurado);
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

    private void CargarDescuentos(string NumMatricula, string CodDocumAseg, string NumCotizacion)
    {
        try
        {
            DataSet ds = new DataSet();
            ds = Cotiza.GettDetalleDescuentos(NumCotizacion);

            //DataRow DrDsctoCruzado = CalculoDsctoVentaCruzada(CodDocumAseg);

            tblrowDsctoCruzada.Visible = false;

            //parche

            if (ds != null && ds.Tables[0].Rows.Count > 0)
            {

                if (ds != null && ds.Tables[0].Rows[0]["DSCTO_VENCRUZ"].ToString() != "" && ds.Tables[0].Rows[0]["DSCTO_VENCRUZ"].ToString() != "0")
                {
                    porcDsctoCruzado = (String.IsNullOrEmpty(ds.Tables[0].Rows[0]["DSCTO_VENCRUZ"].ToString())) ? "0" : ds.Tables[0].Rows[0]["DSCTO_VENCRUZ"].ToString();
                    actualizaSumaTotalDsctos();
                    lbltblrowDsctoCruzada.Text = "(-" + Convert.ToString(Convert.ToDecimal(porcDsctoCruzado)) + "%)";
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


                //DataRow DrDsctoAgendaVencida = CalculoDsctoAgendaVencida(NumMatricula);
                tblrowDsctoAgendaVencida.Visible = false;
                if (ds != null && ds.Tables[0].Rows[0]["DSCTO_AGEVEN"].ToString() != "" && ds.Tables[0].Rows[0]["DSCTO_AGEVEN"].ToString() != "0")
                {
                    porcDsctoAgendaVencida = (String.IsNullOrEmpty(ds.Tables[0].Rows[0]["DSCTO_AGEVEN"].ToString())) ? "0" : ds.Tables[0].Rows[0]["DSCTO_AGEVEN"].ToString();
                    actualizaSumaTotalDsctos();
                    lbltblrowDsctoAgendaVencida.Text = "(-" + Convert.ToString(Convert.ToDecimal(porcDsctoAgendaVencida)) + "%)";
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



                if (ds != null && ds.Tables[0].Rows[0]["DSCTO_FAM"].ToString() != "" && ds.Tables[0].Rows[0]["DSCTO_FAM"].ToString() != "0")
                {
                    porcDsctoFamiliar = String.IsNullOrEmpty(ds.Tables[0].Rows[0]["DSCTO_FAM"].ToString()) ? "0" : ds.Tables[0].Rows[0]["DSCTO_FAM"].ToString();
                    actualizaSumaTotalDsctos();
                    lbltblrowDsctoFamiliar.Text = "(-" + Convert.ToString(Convert.ToDecimal(porcDsctoFamiliar)) + "%)";
                    tblrowDsctoFamiliar.Visible = true;
                    RowDsctoFamiliar = true;
                }
                else
                {
                    porcDsctoFamiliar = "";
                    actualizaSumaTotalDsctos();
                    tblrowDsctoFamiliar.Visible = false;
                    RowDsctoFamiliar = false;
                }

                if (RowDsctoVentaCruzada || RowDsctoFamiliar || RowDsctoAgendaVencida) //Descuentos
                    //tblrowPrimaTotalDsctos.Visible = true;
                    tblrowDsctosCampanaComercial.Visible = true;
            }
            else
            {
                RowDsctoVentaCruzada = false;
                tblrowDsctoCruzada.Visible = false;
                RowDsctoAgendaVencida = false;
                tblrowDsctoAgendaVencida.Visible = false;
                RowDsctoFamiliar = false;
                tblrowDsctoFamiliar.Visible = false;

            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }


    //protected void DsctoFamiliar()
    //{
    //    try
    //    {



    //        GettDetalleDescuentos()


    //        RowDsctoFamiliar = false;
    //        porcDsctoFamiliar = "";


    //        string cod_docum_familiar = this.txtCodDocumFamiliar.Text.ToUpper().Trim().Replace("-", "").Replace(".", "");

    //        if (UtilesWeb.ValidaRUT(cod_docum_familiar) == false)
    //        {
    //            //ScriptManager1.SetFocus(txtCodDocumAseg);
    //            this.txtCodDocumFamiliar.Text = "";
    //            UtilesWeb.EjecutaJs(this, "alert('El Rut ingresado no es válido, favor corregir');");
    //            return;
    //        }
    //        if (UtilesWeb.DV_RUT(cod_docum_familiar) == false)
    //        {
    //            //ScriptManager1.SetFocus(txtCodDocumAseg);
    //            this.txtCodDocumFamiliar.Text = "";
    //            UtilesWeb.EjecutaJs(this, "alert('El Rut ingresado no es válido, favor corregir');");
    //            return;
    //        }

    //        this.txtCodDocumFamiliar.Text = UtilesWeb.getFormated(cod_docum_familiar.ToUpper());

    //        if (drpTipoFamiliar.SelectedValue == "0")
    //        {
    //            UtilesWeb.EjecutaJs(this, "alert('" + drpTipoFamiliar.ToolTip + "');");
    //            return;
    //        }


    //        string cod_ramo = "801";
    //        if (Session["CONV"].ToString() == "AUTOANTIGUO")
    //            cod_ramo = "809";

    //        DataRow drDctoFam = Cotiza.DsctoFamiliar(cod_ramo, cod_docum_familiar);
    //        tblrowDsctoFamiliar.Visible = false;
    //        if (drDctoFam != null && drDctoFam["p_resultado"].ToString() == "S")
    //        {
    //            porcDsctoFamiliar = ValidaTotalDsctoAplicar(drDctoFam["p_dscto"].ToString());
    //            actualizaSumaTotalDsctos();
    //            lbltblrowDsctoFamiliar.Text = "(-" + Convert.ToString(Convert.ToDecimal(porcDsctoFamiliar) * 100) + "%)";
    //            tblrowDsctoFamiliar.Visible = true;
    //            RowDsctoFamiliar = true;
    //        }

    //    }
    //    catch (Exception ex)
    //    {
    //        porcDsctoFamiliar = "";
    //        actualizaSumaTotalDsctos();
    //        RowDsctoFamiliar = false;
    //    }
    //}

    private void actualizaSumaTotalDsctos()
    {
        sumaTotalPorcDsctos = "0";

        if (!String.IsNullOrEmpty(porcDsctoFamiliar))
            sumaTotalPorcDsctos = (Convert.ToDecimal(sumaTotalPorcDsctos.Replace(".", ",")) + Convert.ToDecimal(porcDsctoFamiliar.Replace(".", ","))).ToString();
        if (!String.IsNullOrEmpty(porcDsctoCruzado))
            sumaTotalPorcDsctos = (Convert.ToDecimal(sumaTotalPorcDsctos.Replace(".", ",")) + Convert.ToDecimal(porcDsctoCruzado.Replace(".", ","))).ToString();
        if (!String.IsNullOrEmpty(porcDsctoAgendaVencida))
            sumaTotalPorcDsctos = (Convert.ToDecimal(sumaTotalPorcDsctos.Replace(".", ",")) + Convert.ToDecimal(porcDsctoAgendaVencida.Replace(".", ","))).ToString();

        lbltblrowDsctoCampanaComercial.Text = "(" + sumaTotalPorcDsctos + "%)";
    }


    #endregion
}
