﻿using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Globalization;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using SOAPWS;

public partial class Emisor2 : System.Web.UI.Page
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
                    Response.Redirect("SessionTerminada.aspx", false);
                }

                setTextLabel(lblNumCotizacion, PolVeh.NumCotizacion);
                setTextLabel(lblNomModalidad, PolVeh.NomModalidad.ToUpper());
                setTextLabel(lblFecCotizacion, PolVeh.FechaCotizacion);
                setTextLabel(lblPrimaNeta, PolVeh.PrimaNeta);
                setTextLabel(lblPrimaBruta, PolVeh.PrimaTotal);

                this.trDatosFactura.Visible = false;
                this.trDatosContacto.Visible = false;
                this.trDatosCentrosInspeccion.Visible = false;
                this.txtObsContacto.Attributes.Add("maxlength", "10");

                setTextLabel(lblNumMatricula, PolVeh.NumMatricula);
                setTextLabel(lblNomMarca, PolVeh.NomMarca);
                setTextLabel(lblNomModelo, PolVeh.NomModelo);
                setTextLabel(lblNomSubModelo, PolVeh.NomSubModelo);
                setTextLabel(lblAño, PolVeh.AñoFab);

                setTextLabel(lblTipVehiculo, PolVeh.NomTipoVeh);

                if (PolVeh.NomTipoVeh != "")
                    setTextLabel(lblTituloTipVeh, "Tipo de Vehículo");

                Vehiculo.Combo_Colores(drpColor);
                UtilesWeb.selected(drpColor, PolVeh.CodColor);

                setTextTextBox(txtNroMotor, PolVeh.NroMotor);
                setTextTextBox(txtNroChasis, PolVeh.NroChasis);

                setTextTextBox(txtCodDocumAseg, UtilesWeb.getFormated(PolVeh.CodDocumAseg), true);

                if (PolVeh.Convenio == "COMPARA")
                {
                    setTextTextBox(txtNomAseg, PolVeh.NomAseg, false);
                    setTextTextBox(txtApePaternoAseg, PolVeh.ApePatAseg, false);
                    setTextTextBox(txtApeMaternoAseg, PolVeh.ApeMatAseg, false);
                }
                else
                {
                    setTextTextBox(txtNomAseg, PolVeh.NomAseg, true);
                    setTextTextBox(txtApePaternoAseg, PolVeh.ApePatAseg, true);
                    setTextTextBox(txtApeMaternoAseg, PolVeh.ApeMatAseg, true);
                }

                setTextTextBox(txtCodDocumTomad, UtilesWeb.getFormated(PolVeh.CodDocumAseg), false);

                if (PolVeh.Convenio == "COMPARA")
                {
                    setTextTextBox(txtNomTomad, PolVeh.NomAseg, false);
                    setTextTextBox(txtApePaternoTomad, PolVeh.ApePatAseg, false);
                    setTextTextBox(txtApeMaternoTomad, PolVeh.ApeMatAseg, false);
                }
                else
                {
                    setTextTextBox(txtNomTomad, PolVeh.NomAseg, true);
                    setTextTextBox(txtApePaternoTomad, PolVeh.ApePatAseg, true);
                    setTextTextBox(txtApeMaternoTomad, PolVeh.ApeMatAseg, true);
                }

                Localidades.Carga_Regiones(drpRegionAseg);
                Localidades.Carga_Regiones(drpRegionTomad);
                Localidades.Carga_Regiones(drpRegionContacto);

                CargaTercero(PolVeh.CodDocumAseg, "ASEG");
                CargaTercero(PolVeh.CodDocumAseg, "TOMAD");

                string hoy = DateTime.Now.ToString("dd-MM-yyyy");

                if (!String.IsNullOrEmpty(PolVeh.FechaInicioVigencia) && !String.IsNullOrEmpty(PolVeh.FechaFinVigencia))
                {
                    this.txtFechaFinVigencia.Visible = true;


                    setTextTextBox(txtFechaVigencia, PolVeh.FechaInicioVigencia, true);
                    setTextTextBox(txtFechaFinVigencia, PolVeh.FechaFinVigencia, true);

                    txtFechaVigencia.ReadOnly = true;
                    txtFechaFinVigencia.ReadOnly = true;
                    calendario.Visible = false;
                    calendario2.Visible = false;
                }
                else
                {
                    setTextTextBox(txtFechaVigencia, hoy);
                    //txtFechaVigencia.ReadOnly = true;
                    tdFinVigencia1.Visible = false;
                    tdFinVigencia2.Visible = false;
                    tdFinVigencia3.Visible = false;
                    //tdCalendarioFechaIniVigencia.Visible = true;
                }

                //MANTIS 126449
                string minvigencia;

                if (PolVeh.Fact48 == "1")
                {
                    minvigencia = DateTime.Now.AddDays(-1 *Convert.ToInt32(ConfigurationManager.AppSettings["DiaVigenciaConFactura"])).ToString("yyyyMMdd");
                    hdnMinVigencia.Value = ConfigurationManager.AppSettings["DiaVigenciaConFactura"].ToString();
                }
                else
                {
                    minvigencia = DateTime.Now.AddDays(-1 * Convert.ToInt32(ConfigurationManager.AppSettings["DiaVigenciaSinFactura"])).ToString("yyyyMMdd");
                    hdnMinVigencia.Value = ConfigurationManager.AppSettings["DiaVigenciaSinFactura"].ToString();
                }
                //FIN MANTIS 126449

                int anio = System.DateTime.Now.Year;

                UtilesWeb.Carga_Anios_DropGenerico(drpAñoVencTarjPAT, anio, anio + 20);

                UtilesWeb.selected(drpAñoVencTarjPAT, anio.ToString());

                if (PolVeh.Convenio == "RIPLEYBI" || Session["CONV"].ToString() == "RIPLEY" || Session["CONV"].ToString() == "RIPLEYCALL" || Session["CONV"].ToString() == "RIPLEYFUNC" || Session["CONV"].ToString() == "CONOSUR")
                {
                    Session["opc_cuotas"] = "S";
                    Session["opc_checked"] = "CuotasMapfre";
                }

                if (Session["opc_cuotas"].ToString() == "S")
                    rdbCuotasMapfre.Visible = true;
                else
                    rdbCuotasMapfre.Visible = false;

                if (Session["opc_pat"].ToString() == "S")
                    rdbPAT.Visible = true;
                else
                    rdbPAT.Visible = false;

                if (Session["opc_pac"].ToString() == "S")
                    rdbPAC.Visible = true;
                else
                    rdbPAC.Visible = false;

                switch (Session["opc_checked"].ToString())
                {
                    case "CuotasMapfre":
                        rdbCuotasMapfre.Checked = true;
                        rdbPAC.Checked = false;
                        PAC.Visible = false;
                        rdbPAT.Checked = false;
                        PAT.Visible = false;
                        break;
                    case "PAT":
                        rdbCuotasMapfre.Checked = false;
                        rdbPAC.Checked = false;
                        PAC.Visible = false;
                        rdbPAT.Checked = true;
                        PAT.Visible = true;
                        break;
                    case "PAC":
                        rdbCuotasMapfre.Checked = false;
                        rdbPAC.Checked = true;
                        PAC.Visible = true;
                        rdbPAT.Checked = false;
                        PAT.Visible = false;
                        break;

                    default:
                        break;
                }

                //rdbPAC.Visible = false;
                //PAT.Visible = false;
                if (PolVeh.Convenio == "RIPLEYBI" || Session["CONV"].ToString() == "RIPLEY" || Session["CONV"].ToString() == "RIPLEYCALL" || Session["CONV"].ToString() == "RIPLEYFUNC")
                {
                    PolVeh.NumCuota = "15";
                    Cobranza.PlanesPagoRipley(drpPlanPago);
                }
                else
                {
                    /*if (PolVeh.Convenio == "COMPARA")
                    {
                        if (rdbPAC.Checked)
                            Cobranza.PlanesPagoCompara(drpPlanPago, "DB");
                        else
                            Cobranza.PlanesPagoCompara(drpPlanPago, "");
                    }
                    else
                    {*/
                        if (PolVeh.Convenio != "")
                        {
                            string codRamo = "801";
                            if (PolVeh.Convenio=="AUTOANTIGUO")
                                codRamo="809";                            

                            if (this.rdbCuotasMapfre.Checked)
                                Cobranza.PlanesPagoConvenio(drpPlanPago, "1", codRamo, "GD", "99999", PolVeh.Convenio);

                            if (this.rdbPAT.Checked)
                                Cobranza.PlanesPagoConvenio(drpPlanPago, "1", codRamo, "TA", "99999", PolVeh.Convenio);

                            if (this.rdbPAC.Checked)
                                Cobranza.PlanesPagoConvenio(drpPlanPago, "1", codRamo, "DB", "99999", PolVeh.Convenio);

                            if (drpPlanPago.Items.Count == 0)
                            {
                                Cobranza.PlanesPago(drpPlanPago);
                            }
                        }
                        else
                        {
                            Cobranza.PlanesPago(drpPlanPago);
                        }
                    /*}*/
                    if (Session["CONV"].ToString() == "COMPARA")
                    {
                        this.drpPlanPago.SelectedIndex = 5;
                        this.drpPlanPago.Enabled = true;
                    }
                }

                Cobranza.MarcaTarjetas(drpMarcaTarjetaPAT);

                //if (PolVeh.Fact48 == "1")
                //{
                //    rdbSinInspeccion.Visible = true;
                //    rdbSinInspeccion.Checked = true;
                //}
                //else
                //{
                //    rdbSinInspeccion.Visible = false;
                //    rdbSinInspeccion.Checked = false;
                //    rdbInspeccionOficina.Checked = true;
                //}

                setInspeccion();

                string dia_pago_bd = Cobranza.DiaPago(PolVeh.CodDocumTomad);

                if (dia_pago_bd != "0")
                {
                    UtilesWeb.selected_block(drpDiaPago, dia_pago_bd);
                    UtilesWeb.selected(drpPlanPago, PolVeh.NumCuota);
                    this.lblValorCuota.Text = CalculaCuota();
                }
                else
                {
                    string dia_pago = ConfigurationManager.AppSettings["DiaPagoCot"];
                    UtilesWeb.selected(drpDiaPago, dia_pago);
                    UtilesWeb.selected(drpPlanPago, PolVeh.NumCuota);
                    this.lblValorCuota.Text = CalculaCuota();
                }

                if (Session["num_recotizacion"] != null)
                    this.ImgNuevaCotizacion.Visible = false;
                else
                    this.ImgNuevaCotizacion.Visible = true;
            }
        }
        catch (Exception ex)
        {
            System.Diagnostics.StackTrace Stack = new System.Diagnostics.StackTrace(ex, true);
            int errorlineno = Stack.GetFrame(0).GetFileLineNumber();
            int errorcol = Stack.GetFrame(0).GetFileColumnNumber();

            UtilesWeb.EnviaCorreoAcusete(ex.Message, "Cot. Veh. Livianos - Emision.asxp - Page_Load - Linea: " + errorlineno + " - " + errorcol);
            Response.Redirect("SessionTerminada.aspx", false);
        }
    }

    protected void setInspeccion()
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

        this.rdbSinInspeccion.Visible = false;
        this.trSinInspeccion.Visible = false;
        this.rdbCentrosInspeccion.Visible = false;
        this.trCentrosInspeccion.Visible = false;
        this.rdbInspeccionDomicilio.Visible = false;
        this.trInspeccionDomicilio.Visible = false;
        this.trRegistraInspeccion.Visible = false;
        this.trDeducibleObligatorio.Visible = false;
        this.trInspeccionExpress.Visible = false;
        //this.txtFechaVigencia.ReadOnly = true;
        //this.txtFechaVigencia.Enabled = false;
        //this.calendario.Style.Add("display", "none");
        //this.calendario.Style.Add("visibility", "hidden");

        if (PolVeh.CodModalidad == "8910")
        {
            this.rdbSinInspeccion.Visible = true;
            this.trSinInspeccion.Visible = true;
            this.rdbSinInspeccion.Checked = true;
        }        
        else
        {
            DataRow inspeccion = Cotiza.ValidaInspeccion(PolVeh.NumMatricula, PolVeh.CodDocum, PolVeh.CodRamo, PolVeh.Convenio);

            #region comentado
            //VER DONDE VALIDAR INSPECCION PARA VEHICULOS ANTIGUOS
            //if (PolVeh.CodModalidad == "8915")
            //{
            //    this.rdbInspeccionDomicilio.Visible = false;
            //    this.rdbCentrosInspeccion.Visible = true;
            //    this.rdbCentrosInspeccion.Checked = true;
            //    this.trCentrosInspeccion.Visible = true;

            //    if (inspeccion["P_ERROR"].ToString() != "0" ||
            //        inspeccion["P_NUM_INSPEC"].ToString() == "" ||
            //        inspeccion["P_MCA_VENCIDA"].ToString().ToUpper() != "NO")
            //    {
            //        ImgValidaEmitir.Visible = false;
            //        UtilesWeb.EjecutaJs(this.Page, "alert('Vehículo no presenta inspección vigente en la Compañía, es necesario se encuentre realizada la inspección para continuar con la emisión');");
            //    }
            //}
            ////////////////////////////////////////////////////////
            #endregion

            if (inspeccion["P_ERROR"].ToString() == "0")
            {
                if (inspeccion["P_STATUS"].ToString() != "1" || PolVeh.NumMatricula == "A/D")
                {
                    if (inspeccion["P_NUM_INSPEC"].ToString() != "")
                    {
                        if (inspeccion["p_mca_vencida"].ToString() == "NO")
                        {
                            this.rdbCentrosInspeccion.Visible = false;
                            this.trCentrosInspeccion.Visible = false;
                            this.rdbInspeccionDomicilio.Visible = false;
                            this.trInspeccionDomicilio.Visible = false;
                            this.trDeducibleObligatorio.Visible = false;
                            this.trInspeccionExpress.Visible = false;

                            PolVeh.NumInspeccion = inspeccion["P_NUM_INSPEC"].ToString();
                            PolVeh.Inspeccion = "S";

                            Cotiza.AsignaInspeccion(PolVeh.NumCotizacion, PolVeh.NumInspeccion);

                            this.lblRegistraInspeccion.Text = "Registramos la inspección N° " + inspeccion["P_NUM_INSPEC"].ToString() + " asociada a este vehículo.";
                            this.trRegistraInspeccion.Visible = true;

                            #region COMENTADO
                            //this.txtFechaVigencia.ReadOnly = false;
                            //this.txtFechaVigencia.Enabled = true;
                            //this.calendario.Style.Add("display", "");
                            //this.calendario.Style.Add("visibility", "");
                            #endregion
                        }
                        else
                        {
                            this.lblRegistraInspeccion.Text = "La inspección ingresada se encuentra vencida, por favor seleccione una de las siguientes opciones para efectuar una nueva inspección.";
                            this.trRegistraInspeccion.Visible = true;

                            this.rdbCentrosInspeccion.Visible = true;
                            this.trCentrosInspeccion.Visible = true;
                            this.rdbCentrosInspeccion.Checked = true;
                            this.rdbInspeccionDomicilio.Visible = true;
                            this.trInspeccionDomicilio.Visible = true;
                            this.trDeducibleObligatorio.Visible = true;

                            if (inspeccion["P_EXISTE_INSPECTOR_TER"].ToString() == "SI")
                            {
                                this.trInspeccionExpress.Visible = true;
                                rdbInspeccionExpress.Visible = true;
                            }
                            else
                            {
                                this.trInspeccionExpress.Visible = false;
                                rdbInspeccionExpress.Visible = false;
                            }
                        }
                    }
                    else
                    {
                        if (PolVeh.Fact48 == "1")
                        {
                            this.trDatosFactura.Visible = true;

                            if (this.txtFechaFactura.Text != "")
                            {
                                try
                                {

                                    try
                                    {
                                        DateTime fecha_minima2 = DateTime.Now.AddDays(-1 * Convert.ToDouble(ConfigurationManager.AppSettings["DiaVigenciaFactura"].ToString()));
                                        string str_fecha_minima2 = fecha_minima2.ToString("dd-MM-yyyy", CultureInfo.InvariantCulture);

                                        //UtilesWeb.EnviaCorreoAcusete(str_fecha_minima2, "Error str_fecha_minima2 ");

                                        DateTimeFormatInfo dtfi12 = new DateTimeFormatInfo();
                                        dtfi12.ShortDatePattern = "dd-MM-yyyy";
                                        dtfi12.DateSeparator = "-";
                                        fecha_minima2 = Convert.ToDateTime(str_fecha_minima2, dtfi12);

                                    }
                                    catch (Exception ex)
                                    {
                                        System.Diagnostics.StackTrace Stack = new System.Diagnostics.StackTrace(ex, true);
                                        int errorlineno = Stack.GetFrame(0).GetFileLineNumber();
                                        int errorcol = Stack.GetFrame(0).GetFileColumnNumber();

                                        UtilesWeb.EnviaCorreoAcusete(ex.Message, "Error 4 " + errorlineno + " - " + errorcol);
                                    }


                                        DateTime fecha_minima = DateTime.Now.AddDays(-1 * Convert.ToDouble(ConfigurationManager.AppSettings["DiaVigenciaFactura"].ToString()));
                                        string str_fecha_minima = fecha_minima.ToString("dd-MM-yyyy", CultureInfo.InvariantCulture);
                                        DateTimeFormatInfo dtfi1 = new DateTimeFormatInfo();
                                        dtfi1.ShortDatePattern = "dd-MM-yyyy";
                                        dtfi1.DateSeparator = "-";
                                        fecha_minima = Convert.ToDateTime(str_fecha_minima, dtfi1);


                                       

                                        try
                                        {
                                            string strDate2 = this.txtFechaFactura.Text;
                                            DateTimeFormatInfo dtfi2 = new DateTimeFormatInfo();
                                            dtfi2.ShortDatePattern = "dd-MM-yyyy";
                                            dtfi2.DateSeparator = "-";
                                            DateTime objDate2 = Convert.ToDateTime(strDate2, dtfi2);
                                        }
                                        catch (Exception ex)
                                        {
                                            System.Diagnostics.StackTrace Stack = new System.Diagnostics.StackTrace(ex, true);
                                            int errorlineno = Stack.GetFrame(0).GetFileLineNumber();
                                            int errorcol = Stack.GetFrame(0).GetFileColumnNumber();

                                            UtilesWeb.EnviaCorreoAcusete(ex.Message, "Error 3 " + errorlineno + " - " + errorcol);
                                        }


                                        string strDate = this.txtFechaFactura.Text;
                                        DateTimeFormatInfo dtfi = new DateTimeFormatInfo();
                                        dtfi.ShortDatePattern = "dd-MM-yyyy";
                                        dtfi.DateSeparator = "-";
                                        DateTime objDate = Convert.ToDateTime(strDate, dtfi);


                                  

                                int compar = objDate.CompareTo(fecha_minima);

                                if (compar < 0)
                                {
                                    UtilesWeb.EjecutaJs(this, "alert('Fecha de emisión de la factura no debe ser superior a " + ConfigurationManager.AppSettings["DiaVigenciaFactura"].ToString() +  " días.');");

                                    this.rdbSinInspeccion.Visible = false;
                                    this.trSinInspeccion.Visible = false;
                                    this.rdbSinInspeccion.Checked = false;
                                    this.rdbCentrosInspeccion.Visible = true;
                                    this.trCentrosInspeccion.Visible = true;
                                    this.rdbCentrosInspeccion.Checked = true;
                                    this.rdbInspeccionDomicilio.Visible = true;
                                    this.trInspeccionDomicilio.Visible = true;
                                    this.trDeducibleObligatorio.Visible = true;

                                    if (inspeccion["P_EXISTE_INSPECTOR_TER"].ToString() == "SI")
                                    {
                                        this.trInspeccionExpress.Visible = true;
                                        rdbInspeccionExpress.Visible = true;
                                    }
                                    else
                                    {
                                        this.trInspeccionExpress.Visible = false;
                                        rdbInspeccionExpress.Visible = false;
                                    }
                                }
                                else
                                {
                                    this.rdbSinInspeccion.Visible = true;
                                    this.trSinInspeccion.Visible = true;
                                    this.rdbSinInspeccion.Checked = true;
                                }
                                }
        catch (Exception ex)
        {
            System.Diagnostics.StackTrace Stack = new System.Diagnostics.StackTrace(ex, true);
            int errorlineno = Stack.GetFrame(0).GetFileLineNumber();
            int errorcol = Stack.GetFrame(0).GetFileColumnNumber();

            UtilesWeb.EnviaCorreoAcusete(ex.Message, "Error " + errorlineno + " - " + errorcol);
        }
                            }
                            else
                            {

                            }
                        }
                        else
                        {
                            this.rdbSinInspeccion.Visible = false;
                            this.trSinInspeccion.Visible = false;
                            this.rdbSinInspeccion.Checked = false;
                            this.rdbCentrosInspeccion.Visible = true;
                            this.trCentrosInspeccion.Visible = true;
                            this.rdbCentrosInspeccion.Checked = true;
                            this.rdbInspeccionDomicilio.Visible = true;
                            this.trInspeccionDomicilio.Visible = true;
                            this.trDeducibleObligatorio.Visible = true;

                            if (Session["CONV"].ToString() == "AUTOANTIGUO")
                            {
                                this.rdbInspeccionDomicilio.Visible = false;
                                this.rdbInspeccionExpress.Visible = false;
                                this.trDeducibleObligatorio.Visible = false;
                            }

                            if (inspeccion["P_EXISTE_INSPECTOR_TER"].ToString() == "SI")
                            {
                                this.trInspeccionExpress.Visible = true;
                                rdbInspeccionExpress.Visible = true;
                            }
                            else
                            {
                                this.trInspeccionExpress.Visible = false;
                                rdbInspeccionExpress.Visible = false;
                            }
                        }
                    }
                }
                else
                {
                    if (PolVeh.Fact48 == "1")
                    {
                        if (this.txtFechaFactura.Text != "")
                        {
                            DateTimeFormatInfo d = new CultureInfo("es-CL", false).DateTimeFormat;
                            string hoy = DateTime.Now.ToString("dd-MM-yyyy", d).ToUpper();
                            PolVeh.FechaCotizacion = hoy;
                        }
                    }
                    else
                    {
                        this.trDatosFactura.Visible = false;
                    }
                }
            }
        }
        #region COMENTADO
        /*
        if (inspeccion["P_ERROR"].ToString() == "0")
        {
            if (inspeccion["P_STATUS"].ToString() != "1" || PolVeh.NumMatricula == "A/D")
            {
                rdbSinInspeccion.Visible = true;
                rdbInspeccionOficina.Visible = true;
                rdbInspeccionPosterior.Visible = true;

                if (PolVeh.Fact48 == "1")
                {
                    rdbSinInspeccion.Visible = true;
                    rdbSinInspeccion.Checked = true;
                }
                else
                {
                    rdbSinInspeccion.Visible = false;
                    rdbSinInspeccion.Checked = false;
                    rdbInspeccionOficina.Checked = true;
                }
            }
            else
            {
                rdbSinInspeccion.Visible = false;
                rdbInspeccionOficina.Visible = false;
                rdbInspeccionPosterior.Visible = false;

                PolVeh.NumInspeccion = inspeccion["P_NUM_INSPEC"].ToString();
                PolVeh.Inspeccion = "S";

                Cotiza.AsignaInspeccion(PolVeh.NumCotizacion, PolVeh.NumInspeccion);

                lblRegistraInspeccion.Text = "Registramos la inspección N° " + inspeccion["P_NUM_INSPEC"].ToString() + " asociada a este vehículo.";
            }

            if (inspeccion["P_EXISTE_INSPECTOR_TER"].ToString() == "SI")
                rdbInspeccionExpress.Visible = true;
            else
                rdbInspeccionExpress.Visible = false;

        }
        */
        #endregion
    }

    protected void setTextLabel(Label label, string valor)
    {
        label.Text = valor;
    }

    protected void setTextTextBox(TextBox textbox, string valor)
    {
        textbox.Text = valor;
    }

    protected void setTextTextBox(TextBox textbox, string valor, bool block)
    {
        textbox.Text = valor;

        if (block && valor != null)
        {
            textbox.ReadOnly = true;
            textbox.Enabled = false;
        }
        else
        {
            textbox.ReadOnly = false;
            textbox.Enabled = true;
        }
    }

    public void setTextTextBox(TextBox textboxAseg, TextBox textboxTomad, string valAseg, string valTomad, string valor, string tip)
    {
        if (valor != "")
        {
            if (tip == "ASEG")
            {
                if (valAseg == "" || valAseg == null)
                    setTextTextBox(textboxAseg, valor);
                else
                    setTextTextBox(textboxAseg, valAseg);
            }
            else
            {
                if (valTomad == "" || valTomad == null)
                    setTextTextBox(textboxTomad, valor);
                else
                    setTextTextBox(textboxTomad, valAseg);
            }
        }

    }

    public void setTextTextBox(TextBox textboxAseg, TextBox textboxTomad, string valAseg, string valTomad, string valor, string tip, bool block)
    {
        if (valor != "")
        {
            if (tip == "ASEG")
            {
                if (valAseg == "" || valAseg == null || valAseg == " ")
                    setTextTextBox(textboxAseg, valor, block);
            }
            else
            {
                if (valTomad == "" || valTomad == null || valAseg == " ")
                    setTextTextBox(textboxTomad, valor, block);
            }
        }

    }

    public void CargaTercero(string cod_docum, string tip_tercero)
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

            bool bloquea = true;
            bool habilita_drop = false;

            if (PolVeh.Convenio == "COMPARA")
            {
                bloquea = false;
                habilita_drop = true;
            }

            if (cod_docum != "")
            {
                DataRow datos_tercero_nombre = null;
                datos_tercero_nombre = Tercero.DatosTercero(cod_docum);

                if (datos_tercero_nombre["P_ERROR"].ToString() == "0" || datos_tercero_nombre["P_ERROR"].ToString() == "OK")
                {
                    //UtilesWeb.Asigna_dat_block(datos_tercero, this.txtNomAseg, "P_NOM_TERCEO");
                    setTextTextBox(this.txtNomAseg, this.txtNomTomad, PolVeh.NomAseg, PolVeh.NomTomad, datos_tercero_nombre["P_NOM_TERCEO"].ToString().ToUpper(), tip_tercero, bloquea);

                    //UtilesWeb.Asigna_dat_block(datos_tercero, this.txtApePatAseg, "P_APE_PATERNO");
                    setTextTextBox(this.txtApePaternoAseg, this.txtApePaternoTomad, PolVeh.ApePatAseg, PolVeh.ApePatTomad, datos_tercero_nombre["P_APE_PATERNO"].ToString().ToUpper(), tip_tercero, bloquea);

                    //UtilesWeb.Asigna_dat_block(datos_tercero, this.txtApeMatAseg, "P_APE_MATERNO");
                    setTextTextBox(this.txtApeMaternoAseg, this.txtApeMaternoTomad, PolVeh.ApeMatAseg, PolVeh.ApeMatTomad, datos_tercero_nombre["P_APE_MATERNO"].ToString().ToUpper(), tip_tercero, bloquea);

                    DataRow datostercero = Tercero.DatosTerceroTronWeb(cod_docum);

                    if (datostercero != null)
                    {

                        //setTextTextBox(this.txtNomAseg, this.txtNomTomad, PolVeh.NomAseg, PolVeh.NomTomad, datostercero["NOM_TERCERO"].ToString().ToUpper(), tip_tercero, true);

                        //setTextTextBox(this.txtApePaternoAseg, this.txtApePaternoTomad, PolVeh.ApePatAseg, PolVeh.ApePatTomad, datostercero["APE1_TERCERO"].ToString().ToUpper(), tip_tercero, true);

                        //setTextTextBox(this.txtApeMaternoAseg, this.txtApeMaternoTomad, PolVeh.ApeMatAseg, PolVeh.ApeMatTomad, datostercero["APE2_TERCERO"].ToString().ToUpper(), tip_tercero, true);

                        setTextTextBox(this.txtDireccionAseg, this.txtDireccionTomad, PolVeh.DirAseg, PolVeh.DirTomad, datostercero["NOM_DOMICILIO1"].ToString().ToUpper(), tip_tercero, bloquea);

                        setTextTextBox(this.txtFonoAseg, this.txtFonoTomad, PolVeh.FonoAseg, PolVeh.FonoTomad, datostercero["TLF_NUMERO"].ToString().ToUpper(), tip_tercero);

                        setTextTextBox(this.txtEmailAseg, this.txtEmailTomad, PolVeh.EmailAseg, PolVeh.EmailTomad, datostercero["NOM_EMAIL"].ToString().ToUpper(), tip_tercero);


                        if (datostercero["COD_ESTADO"].ToString() != "" && datostercero["COD_ESTADO"].ToString() != "0")
                        {
                            if (tip_tercero == "ASEG")
                            {
                                UtilesWeb.selected(this.drpRegionAseg, datostercero["COD_ESTADO"].ToString());
                                if (this.drpRegionAseg.SelectedValue != "0") this.drpRegionAseg.Enabled = habilita_drop;
                                Localidades.Carga_Ciudades(this.drpCiudadAseg, this.drpRegionAseg.SelectedValue);
                            }
                            else
                            {
                                UtilesWeb.selected(this.drpRegionTomad, datostercero["COD_ESTADO"].ToString());
                                if (this.drpRegionTomad.SelectedValue != "0") this.drpRegionTomad.Enabled = habilita_drop;
                                Localidades.Carga_Ciudades(this.drpCiudadTomad, this.drpRegionTomad.SelectedValue);
                            }
                        }
                        else
                        {
                            if (tip_tercero == "ASEG")
                                //this.drpRegionAseg.Enabled = habilita_drop;
                                if (this.drpRegionAseg.SelectedValue != "0") this.drpRegionAseg.Enabled = habilita_drop;
                                else
                                    this.drpRegionAseg.Enabled = true;
                            else
                                //this.drpRegionTomad.Enabled = habilita_drop;
                                if (this.drpRegionTomad.SelectedValue != "0") this.drpRegionAseg.Enabled = habilita_drop;
                                else
                                    this.drpRegionTomad.Enabled = true;
                        }

                        if (datostercero["COD_PROV"].ToString() != "" && datostercero["COD_PROV"].ToString() != "0")
                        {
                            if (tip_tercero == "ASEG")
                            {
                                UtilesWeb.selected(this.drpCiudadAseg, datostercero["COD_PROV"].ToString());
                                if (this.drpCiudadAseg.SelectedValue != "0") this.drpCiudadAseg.Enabled = habilita_drop;
                                Localidades.Carga_Comunas(this.drpComunaAseg, this.drpCiudadAseg.SelectedValue);
                            }
                            else
                            {
                                UtilesWeb.selected(this.drpCiudadTomad, datostercero["COD_PROV"].ToString());
                                if (this.drpCiudadTomad.SelectedValue != "0") this.drpCiudadTomad.Enabled = habilita_drop;
                                Localidades.Carga_Comunas(this.drpComunaTomad, this.drpCiudadTomad.SelectedValue);
                            }
                        }
                        else
                        {
                            if (tip_tercero == "ASEG")
                                //this.drpCiudadAseg.Enabled = habilita_drop;
                                if (this.drpCiudadAseg.SelectedValue != "0" && this.drpCiudadAseg.SelectedValue != "Seleccionar") this.drpCiudadAseg.Enabled = habilita_drop;
                                else
                                    this.drpCiudadAseg.Enabled = true;
                            else
                                //this.drpCiudadTomad.Enabled = habilita_drop;
                                if (this.drpCiudadTomad.SelectedValue != "0" && this.drpCiudadAseg.SelectedValue != "Seleccionar") this.drpCiudadTomad.Enabled = habilita_drop;
                                else
                                    this.drpCiudadTomad.Enabled = true;
                        }

                        if (datostercero["COD_LOCALIDAD"].ToString() != "" && datostercero["COD_LOCALIDAD"].ToString() != "0")
                        {
                            if (tip_tercero == "ASEG")
                            {
                                UtilesWeb.selected(this.drpComunaAseg, datostercero["COD_LOCALIDAD"].ToString());
                                if (this.drpComunaAseg.SelectedValue != "0") this.drpComunaAseg.Enabled = habilita_drop;
                            }
                            else
                            {
                                UtilesWeb.selected(this.drpComunaTomad, datostercero["COD_LOCALIDAD"].ToString());
                                if (this.drpComunaTomad.SelectedValue != "0") this.drpComunaTomad.Enabled = habilita_drop;
                            }
                        }
                        else
                        {
                            if (tip_tercero == "ASEG")
                                //this.drpComunaAseg.Enabled = habilita_drop;
                                if (this.drpComunaAseg.SelectedValue != "0" && this.drpCiudadAseg.SelectedValue != "Seleccionar") this.drpComunaAseg.Enabled = habilita_drop;
                                else
                                    this.drpComunaAseg.Enabled = true;
                            else
                                //this.drpComunaTomad.Enabled = habilita_drop;
                                if (this.drpComunaTomad.SelectedValue != "0" && this.drpCiudadAseg.SelectedValue != "Seleccionar") this.drpComunaTomad.Enabled = habilita_drop;
                                else
                                    this.drpComunaTomad.Enabled = true;
                        }

                    }
                    else
                    {
                        EnableTer(tip_tercero);
                    }
                }

            }
        }
        catch (Exception ex)
        {
            System.Diagnostics.StackTrace Stack = new System.Diagnostics.StackTrace(ex, true);
            int errorlineno = Stack.GetFrame(0).GetFileLineNumber();
            int errorcol = Stack.GetFrame(0).GetFileColumnNumber();

            UtilesWeb.EnviaCorreoAcusete(ex.Message, "Cot. Veh. Livianos - Emision.asxp - CargaTercero - Linea: " + errorlineno + " - " + errorcol);
        }

    }

    protected void EnableTer(string tip_tercero)
    {
        if (tip_tercero == "ASEG")
        {
            this.txtCodDocumAseg.Enabled = true;
            this.txtApePaternoAseg.Enabled = true;
            this.txtApeMaternoAseg.Enabled = true;
            this.drpRegionAseg.Enabled = true;
            this.drpCiudadAseg.Enabled = true;
            this.drpComunaAseg.Enabled = true;
            this.txtDireccionAseg.Enabled = true;
            this.txtFonoAseg.Enabled = true;
            this.txtEmailAseg.Enabled = true;
        }
        else
        {
            this.txtCodDocumTomad.Enabled = true;
            this.txtNomTomad.ReadOnly = false;
            this.txtApePaternoTomad.Enabled = true;
            this.txtApePaternoTomad.ReadOnly = false;
            this.txtApeMaternoTomad.Enabled = true;
            this.txtApeMaternoTomad.ReadOnly = false;
            this.drpRegionTomad.Enabled = true;
            this.drpCiudadTomad.Enabled = true;
            this.drpComunaTomad.Enabled = true;
            this.txtDireccionTomad.Enabled = true;
            this.txtDireccionTomad.ReadOnly = false;
            this.txtFonoTomad.Enabled = true;
            this.txtFonoTomad.ReadOnly = false;
            this.txtEmailTomad.Enabled = true;
            this.txtEmailTomad.ReadOnly = false;
        }
    }

    protected void drpRegionAseg_SelectedIndexChanged(object sender, EventArgs e)
    {
        string cod = UtilesWeb.GetPropertyValue(sender, "SelectedValue");
        Localidades.Carga_Ciudades(this.drpCiudadAseg, cod);

        this.drpComunaAseg.Items.Clear();
        this.drpComunaAseg.Items.Insert(0, new ListItem("Seleccionar", "0"));
        this.drpComunaAseg.SelectedIndex = 0;

        if (this.txtCodDocumAseg.Text == this.txtCodDocumTomad.Text)
        {
            string cod2 = UtilesWeb.GetPropertyValue(sender, "SelectedValue");
            Localidades.Carga_Ciudades(this.drpCiudadTomad, cod);

            this.drpComunaTomad.Items.Clear();
            this.drpComunaTomad.Items.Insert(0, new ListItem("Seleccionar", "0"));
            this.drpComunaTomad.SelectedIndex = 0;

            UtilesWeb.selected(this.drpRegionTomad, ((DropDownList)sender).SelectedValue.ToString());
        }
    }

    protected void drpRegionTomad_SelectedIndexChanged(object sender, EventArgs e)
    {
        string cod = UtilesWeb.GetPropertyValue(sender, "SelectedValue");
        Localidades.Carga_Ciudades(this.drpCiudadTomad, cod);

        this.drpComunaTomad.Items.Clear();
        this.drpComunaTomad.Items.Insert(0, new ListItem("Seleccionar", "0"));
        this.drpComunaTomad.SelectedIndex = 0;
    }

    protected void drpCiudadAseg_SelectedIndexChanged(object sender, EventArgs e)
    {
        string cod = UtilesWeb.GetPropertyValue(sender, "SelectedValue");
        Localidades.Carga_Comunas(this.drpComunaAseg, cod);

        if (this.txtCodDocumAseg.Text == this.txtCodDocumTomad.Text)
        {
            string cod2 = UtilesWeb.GetPropertyValue(sender, "SelectedValue");
            Localidades.Carga_Comunas(this.drpComunaTomad, cod);

            UtilesWeb.selected(this.drpCiudadTomad, ((DropDownList)sender).SelectedValue.ToString());
        }
    }

    protected void drpCiudadTomad_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (this.txtCodDocumAseg.Text == this.txtCodDocumTomad.Text)
        {
            string cod = UtilesWeb.GetPropertyValue(sender, "SelectedValue");
            Localidades.Carga_Comunas(this.drpComunaTomad, cod);
        }
    }

    protected void drpComunaAseg_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (this.txtCodDocumAseg.Text == this.txtCodDocumTomad.Text)
        {
            UtilesWeb.selected(this.drpComunaTomad, ((DropDownList)sender).SelectedValue.ToString());
        }
    }

    protected void txtDireccionAseg_TextChanged(object sender, EventArgs e)
    {
        if (this.txtCodDocumAseg.Text == this.txtCodDocumTomad.Text)
        {
            ((TextBox)sender).Text = ((TextBox)sender).Text.ToUpper();
            this.txtDireccionTomad.Text = ((TextBox)sender).Text;
        }
    }

    protected void txtFonoAseg_TextChanged(object sender, EventArgs e)
    {
        if (this.txtCodDocumAseg.Text == this.txtCodDocumTomad.Text)
        {
            ((TextBox)sender).Text = ((TextBox)sender).Text.ToUpper();
            this.txtFonoTomad.Text = ((TextBox)sender).Text;
        }
    }
    
    //protected void txtEmailAseg_TextChanged(object sender, EventArgs e)
    //{
    //    if (UtilesWeb.ValidaTextBoxEmail(this, ((TextBox)sender), ScriptManager1))
    //    {
    //        if (this.txtCodDocumAseg.Text == this.txtCodDocumTomad.Text)
    //        {
    //            ((TextBox)sender).Text = ((TextBox)sender).Text.ToUpper();
    //            this.txtEmailTomad.Text = ((TextBox)sender).Text;
    //        }
    //    }
    //    else
    //    {
    //        if (this.txtCodDocumAseg.Text == this.txtCodDocumTomad.Text)
    //        {
    //            this.txtEmailTomad.Text = ((TextBox)sender).Text;
    //        }
    //    }
    //}
    
    protected void txtNomAseg_TextChanged(object sender, EventArgs e)
    {
        if (this.txtCodDocumAseg.Text == this.txtCodDocumTomad.Text)
        {
            ((TextBox)sender).Text = ((TextBox)sender).Text.ToUpper();
            this.txtNomTomad.Text = ((TextBox)sender).Text;
        }
    }

    protected void txtApePaternoAseg_TextChanged(object sender, EventArgs e)
    {
        if (this.txtCodDocumAseg.Text == this.txtCodDocumTomad.Text)
        {
            ((TextBox)sender).Text = ((TextBox)sender).Text.ToUpper();
            this.txtApePaternoTomad.Text = ((TextBox)sender).Text;
        }
    }
    
    protected void txtApeMaternoAseg_TextChanged(object sender, EventArgs e)
    {
        if (this.txtCodDocumAseg.Text == this.txtCodDocumTomad.Text)
        {
            ((TextBox)sender).Text = ((TextBox)sender).Text.ToUpper();
            this.txtApeMaternoTomad.Text = ((TextBox)sender).Text;
        }
    }
    
    protected void rdbCuotasMapfre_CheckedChanged(object sender, EventArgs e)
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
        }
        this.PAT.Visible = false;
        this.PAC.Visible = false;
        //if (PolVeh.Convenio == "COMPARA")
        //{
        //    drpPlanPago.Items.Clear();
        //    Cobranza.PlanesPagoCompara(drpPlanPago, "");
        //}
        //else
        //{
            if (PolVeh.Convenio != "")
            {
                string codRamo = "801";
                if (PolVeh.CodRamo == "809")
                    codRamo = PolVeh.CodRamo;

                Cobranza.PlanesPagoConvenio(drpPlanPago, "1", codRamo, "GD", "99999", PolVeh.Convenio);

                if (drpPlanPago.Items.Count == 0)
                {
                    Cobranza.PlanesPago(drpPlanPago);
                }
            }
            else
            {
                Cobranza.PlanesPago(drpPlanPago);
            }
        //}
        this.lblValorCuota.Text = CalculaCuota();
        drpPlanPago.Enabled = true;

        //if (Session["CONV"].ToString() == "13MESES")
        if (Session["CONV"].ToString() == "COMPARA")
			{
            this.drpPlanPago.SelectedIndex = 5;

            //this.drpPlanPago.Enabled = false;

            string valcuota = CalculaCuota();

            this.lblValorCuota.Text = valcuota;
        }
    }
    
    protected void rdbPAT_CheckedChanged(object sender, EventArgs e)
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
        }
        this.PAT.Visible = true;
        this.PAC.Visible = false;

        //if (PolVeh.Convenio == "COMPARA")
        //{
        //    drpPlanPago.Items.Clear();
        //    Cobranza.PlanesPagoCompara(drpPlanPago, "");
        //}
        //else
        //{
            if (PolVeh.Convenio != "")
            {
                string codRamo = "801";
                if (PolVeh.CodRamo == "809")
                    codRamo = PolVeh.CodRamo;

                Cobranza.PlanesPagoConvenio(drpPlanPago, "1", codRamo, "TA", "99999", PolVeh.Convenio);

                if (drpPlanPago.Items.Count == 0)
                {
                    Cobranza.PlanesPago(drpPlanPago);
                }
            }
            else
            {
                Cobranza.PlanesPago(drpPlanPago);
            }
        //}

        this.lblValorCuota.Text = CalculaCuota();
        drpPlanPago.Enabled = true;
    }
    
    protected void drpMarcaTarjetaPAT_SelectedIndexChanged(object sender, EventArgs e)
    {
        string cod = UtilesWeb.GetPropertyValue(sender, "SelectedValue");

        if (cod != "0")
        {
            Cobranza.Tarjetas(this.drpTarjetaPAT, cod);
        }

    }
    
    protected void drpPlanPago_SelectedIndexChanged(object sender, EventArgs e)
    {
        //if (((DropDownList)sender).SelectedIndex != 0 && this.drpDiaPago.SelectedIndex != 0)
        //{
            string valcuota = CalculaCuota();
            this.lblValorCuota.Text = valcuota;
        //}
    }
    
    protected void drpDiaPago_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (((DropDownList)sender).SelectedIndex != 0 && this.drpPlanPago.SelectedIndex != 0)
        {
            string valcuota = CalculaCuota();
            this.lblValorCuota.Text = valcuota;
        }
    }
    
    protected string CalculaCuota()
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
            }

            string tip_cuota;

            if (this.rdbPAT.Checked)
                tip_cuota = "TA";
            else
            {
                if (this.rdbCuotasMapfre.Checked)
                    tip_cuota = "GD";
                else
                {
                    tip_cuota = "DB";
                    /*UtilesWeb.EjecutaJs(this, "alert('"+ PolVeh.PrimaNeta + "');");
                    UtilesWeb.EjecutaJs(this, "alert('"+ tip_cuota + "');");
                    UtilesWeb.EjecutaJs(this, "alert('"+ PolVeh.Descuento + "');");
                    UtilesWeb.EjecutaJs(this, "alert('"+ PolVeh.CodRamo + "');");
                    UtilesWeb.EjecutaJs(this, "alert('"+ this.drpDiaPago.SelectedValue + "');");*/
                }
            }

            string valcuota = Cobranza.CalculaCuota(PolVeh.PrimaNeta, tip_cuota, this.drpPlanPago.SelectedValue, PolVeh.Descuento, PolVeh.CodRamo, this.drpDiaPago.SelectedValue);

            return valcuota;
        }
        catch (Exception ex)
        {
            System.Diagnostics.StackTrace Stack = new System.Diagnostics.StackTrace(ex, true);
            int errorlineno = Stack.GetFrame(0).GetFileLineNumber();
            int errorcol = Stack.GetFrame(0).GetFileColumnNumber();

            UtilesWeb.EnviaCorreoAcusete(ex.Message, "Cot. Veh. Livianos - Emision.asxp - CalculaCuota - Linea: " + errorlineno + " - " + errorcol);
            return "0";
        }
    }

    protected void GuardaTercero(string cod_docum, string ape1_tercero, string ape2_tercero, string nom_tercero, 
                                string nom_direccion, string cod_region, string cod_ciudad, string cod_comuna, string tlf_pais, 
                                string tlf_zona, string tlf_numero, string mca_sexo, string email)
    {                
        DataRow objteraseg = Tercero.GuardaTer(cod_docum, ape1_tercero, ape2_tercero, nom_tercero, nom_direccion, Convert.ToInt32(cod_region), Convert.ToInt32(cod_ciudad), Convert.ToInt32(cod_comuna), tlf_pais, tlf_zona, tlf_numero, mca_sexo);
        //DataRow objmailaseg = Tercero.GuardaEmailTer(cod_docum, email);
    }

    protected void GuardaTerceroCompara(string cod_docum, string ape1_tercero, string ape2_tercero, string nom_tercero, string nom_direccion, string cod_region, string cod_ciudad, string cod_comuna, string tlf_pais, string tlf_zona, string tlf_numero, string mca_sexo, string celular, string email, string fechaNacimiento)
    {
        DataRow objteraseg = Tercero.GuardaTerCompara(cod_docum, ape1_tercero, ape2_tercero, nom_tercero, nom_direccion, Convert.ToInt32(cod_region), Convert.ToInt32(cod_ciudad), Convert.ToInt32(cod_comuna), tlf_pais, tlf_zona, tlf_numero, mca_sexo, celular, email, fechaNacimiento);
    }

    protected void ImgValidaEmitir_Click(object sender, ImageClickEventArgs e)
    {
        if (ValidaIngresoCampos())
        {
            EmitePoliza();
        }
    }

    public void EmitePoliza()
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
            }

            string cod_color = this.drpColor.SelectedValue;
            PolVeh.CodColor = cod_color;

            string nro_motor = this.txtNroMotor.Text;
            PolVeh.NroMotor = nro_motor;

            string nro_chasis = this.txtNroChasis.Text;
            PolVeh.NroChasis = nro_chasis;

            string cod_docum_aseg = this.txtCodDocumAseg.Text;
            PolVeh.CodDocumAseg = cod_docum_aseg.Trim().Replace("-", "").Replace(".", "");

            string nom_aseg = this.txtNomAseg.Text;
            PolVeh.NomAseg = nom_aseg;

            string ape_pat_aseg = this.txtApePaternoAseg.Text;
            PolVeh.ApePatAseg = ape_pat_aseg;

            string ape_mat_aseg = this.txtApeMaternoAseg.Text;
            PolVeh.ApeMatAseg = ape_mat_aseg;

            string dir_aseg = this.txtDireccionAseg.Text;
            PolVeh.DirAseg = dir_aseg;

            string cod_region_aseg = this.drpRegionAseg.SelectedValue;
            PolVeh.CodRegionAseg = cod_region_aseg;

            string cod_ciudad_aseg = this.drpCiudadAseg.SelectedValue;
            PolVeh.CodCiudadAseg = cod_ciudad_aseg;

            string cod_comuna_aseg = this.drpComunaAseg.SelectedValue;
            PolVeh.CodComunaAseg = cod_comuna_aseg;

            string fecha_vcto_poliza = this.txtFechaFinVigencia.Text;
            PolVeh.FechaFinVigencia = fecha_vcto_poliza;

            string fono_aseg = this.txtFonoAseg.Text;
            PolVeh.FonoAseg = fono_aseg;

            string email_aseg = this.txtEmailAseg.Text;
            PolVeh.EmailAseg = email_aseg;

            string cod_docum_tomad = this.txtCodDocumTomad.Text;
            PolVeh.CodDocumTomad = cod_docum_tomad.Trim().Replace("-", "").Replace(".", "");

            string nom_tomad = this.txtNomTomad.Text;
            PolVeh.NomTomad = nom_tomad;

            string ape_pat_tomad = this.txtApePaternoTomad.Text;
            PolVeh.ApePatTomad = ape_pat_tomad;

            string ape_mat_tomad = this.txtApeMaternoTomad.Text;
            PolVeh.ApeMatTomad = ape_mat_tomad;

            string dir_tomad = this.txtDireccionTomad.Text;
            PolVeh.DirTomad = dir_tomad;

            string cod_region_tomad = this.drpRegionTomad.SelectedValue;
            PolVeh.CodRegionTomad = cod_region_tomad;

            string cod_ciudad_tomad = this.drpCiudadTomad.SelectedValue;
            PolVeh.CodCiudadTomad = cod_ciudad_tomad;

            string cod_comuna_tomad = this.drpComunaTomad.SelectedValue;
            PolVeh.CodComunaTomad = cod_comuna_tomad;

            string fono_tomad = this.txtFonoTomad.Text;
            PolVeh.FonoTomad = fono_tomad;

            string email_tomad = this.txtEmailTomad.Text;
            PolVeh.EmailTomad = email_tomad;

            string fecha_factura = this.txtFechaFactura.Text;
            PolVeh.FecFactura = fecha_factura;
            string num_factura = this.txtNumFactura.Text;
            PolVeh.NumFactura = num_factura;
            string rut_automotora = this.txtRutAutomotora.Text.Trim().Replace("-", "").Replace(".", ""); ;
            PolVeh.CodDocumAutomotora = rut_automotora;
            string nom_automotora = this.txtNomAutomotora.Text;
            PolVeh.NomAutomotora = nom_automotora;

            string nom_completo_aseg = this.txtNomAseg.Text + " " + this.txtApePaternoAseg.Text + " " + this.txtApeMaternoAseg.Text;
            string nom_contacto = this.txtNomContacto.Text;
            string direccion_contacto = this.txtDireccionContacto.Text;
            string cod_region_contacto = this.drpRegionContacto.SelectedValue;
            string cod_ciudad_contacto = this.drpCiudadContacto.SelectedValue;
            string cod_comuna_contacto = this.drpComunaContacto.SelectedValue;
            string celular_contacto = this.txtCodMovilContacto.Text + this.txtMovilContacto.Text;
            string cod_area_contacto = this.txtCodAreaFonoContacto.Text;
            string fono_contacto = this.txtFonoContacto.Text;
            string observaciones_contacto = this.txtObsContacto.Text;

            nom_contacto = nom_contacto.Replace("&", "y");
            nom_contacto = nom_contacto.Replace("°", " ");
            nom_contacto = nom_contacto.Replace("º", " ");
            direccion_contacto = direccion_contacto.Replace("°", " ");
            direccion_contacto = direccion_contacto.Replace("º", " ");
            direccion_contacto = direccion_contacto.Replace("&", "y");            
            observaciones_contacto = observaciones_contacto.Replace("°", " ");
            observaciones_contacto = observaciones_contacto.Replace("º", " ");
            observaciones_contacto = observaciones_contacto.Replace("&", "y");
            
            string cod_plan_pago = this.drpPlanPago.SelectedValue;
            PolVeh.CodPlanPago = cod_plan_pago;

            if (PolVeh.NumInspeccion != "")
            {
                string mca_inspeccion = getrdbInspeccion();
                PolVeh.Inspeccion = mca_inspeccion;

                if (PolVeh.CodModalidad == "8915")
                {
                    PolVeh.Inspeccion = "N";
                }
            }

            Cotiza.GrabaOpcionInspeccion(PolVeh.NumCotizacion, PolVeh.Inspeccion);

            string fec_vigencia = this.txtFechaVigencia.Text.Substring(0, 2) + "/" + this.txtFechaVigencia.Text.Substring(3, 2) + "/" + this.txtFechaVigencia.Text.Substring(6, 4);

            PolVeh.FechaVigencia = fec_vigencia;

            string dia_pago = this.drpDiaPago.SelectedValue;
            PolVeh.DiaPago = dia_pago;

            string forma_pago = getrdbFormaPago();

            if (forma_pago == "GD")
            {
                PolVeh.CodBanco = "";
                PolVeh.CodTarjeta = "";
                PolVeh.NroTarjeta = "";
                PolVeh.MesTarjeta = "";
                PolVeh.AñoTarjeta = "";

                PolVeh.FormaPago = forma_pago;
            }

            if (forma_pago == "TA")
            {
                if (UtilesWeb.ValidaDrowDownList(this, this.drpMarcaTarjetaPAT, ScriptManager1) &&
                    UtilesWeb.ValidaDrowDownList(this, this.drpTarjetaPAT, ScriptManager1) &&
                    UtilesWeb.ValidaTextBox(this, this.txtNumTarjetaPAT, ScriptManager1) &&
                    UtilesWeb.ValidaDrowDownList(this, this.drpMesVencTarjPAT, ScriptManager1) &&
                    UtilesWeb.ValidaDrowDownList(this, this.drpAñoVencTarjPAT, ScriptManager1)
                    )
                {
                    PolVeh.CodBanco = this.drpTarjetaPAT.SelectedValue;
                    PolVeh.CodTarjeta = this.drpMarcaTarjetaPAT.SelectedValue;
                    PolVeh.NroTarjeta = this.txtNumTarjetaPAT.Text;
                    PolVeh.MesTarjeta = this.drpMesVencTarjPAT.SelectedValue;
                    PolVeh.AñoTarjeta = this.drpAñoVencTarjPAT.SelectedValue;

                    PolVeh.FormaPago = forma_pago;
                }
            }
            //Se crea forma de pago PAC//
            if (forma_pago == "DB")
            {
                PolVeh.CodBanco = "";
                PolVeh.CodTarjeta = "";
                PolVeh.NroTarjeta = "";
                PolVeh.MesTarjeta = "";
                PolVeh.AñoTarjeta = "";

                PolVeh.FormaPago = forma_pago;
            }

            string mca_suplanta = "N";

            if (Session["Suplantando"] != null)
                mca_suplanta = "S";

            Vehiculo.GuardaDatosVehEmision(PolVeh.ID, PolVeh.CodColor, PolVeh.NroMotor, PolVeh.NroChasis);

            if (PolVeh.Fact48 == "1")
                Vehiculo.GuardaDatosFactura(PolVeh.NumCotizacion, PolVeh.NumFactura, PolVeh.FecFactura, PolVeh.CodDocumAutomotora, PolVeh.NomAutomotora);

            //CJSS Mantis 111357
            if (PolVeh.Convenio == "COMPARA")
            {
                GuardaTerceroCompara(PolVeh.CodDocumAseg, PolVeh.ApePatAseg, PolVeh.ApeMatAseg, 
                                PolVeh.NomAseg, PolVeh.DirAseg, PolVeh.CodRegionAseg, PolVeh.CodCiudadAseg, 
                                PolVeh.CodComunaAseg, "56", "", PolVeh.FonoAseg, PolVeh.SexoAseg, PolVeh.FonoAseg2, PolVeh.EmailAseg, 
                                PolVeh.EdadAseg);

                GuardaTerceroCompara(PolVeh.CodDocumTomad, PolVeh.ApePatTomad, PolVeh.ApeMatTomad, 
                                PolVeh.NomTomad, PolVeh.DirTomad, PolVeh.CodRegionTomad, PolVeh.CodCiudadTomad, 
                                PolVeh.CodComunaTomad, "56", "", PolVeh.FonoTomad, PolVeh.SexoTomad, PolVeh.FonoTomad2, PolVeh.EmailTomad, 
                                PolVeh.EdadTomad);
            }
            else
            {
                GuardaTercero(PolVeh.CodDocumAseg, PolVeh.ApePatAseg, PolVeh.ApeMatAseg, PolVeh.NomAseg, PolVeh.DirAseg, PolVeh.CodRegionAseg, PolVeh.CodCiudadAseg, PolVeh.CodComunaAseg, "56", "", PolVeh.FonoAseg, PolVeh.SexoAseg, PolVeh.EmailAseg);
                GuardaTercero(PolVeh.CodDocumTomad, PolVeh.ApePatTomad, PolVeh.ApeMatTomad, PolVeh.NomTomad, PolVeh.DirTomad, PolVeh.CodRegionTomad, PolVeh.CodCiudadTomad, PolVeh.CodComunaTomad, "56", "", PolVeh.FonoTomad, PolVeh.SexoTomad, PolVeh.EmailTomad);
            }

            try
            {
                DataRow resultado_emision = Emitir.GeneraXML(PolVeh.CodRamo, PolVeh.CodDocum, PolVeh.CodDocumAseg, PolVeh.CodDocumTomad, PolVeh.NumCotizacion, PolVeh.CodPlanPago, PolVeh.Inspeccion, PolVeh.FechaVigencia, PolVeh.DiaPago, PolVeh.FormaPago, PolVeh.CodBanco, PolVeh.CodTarjeta, PolVeh.NroTarjeta, PolVeh.MesTarjeta, PolVeh.AñoTarjeta, mca_suplanta);

                string error;
                string num_poliza;

                error = resultado_emision["PTXT_ERROR"].ToString();
                num_poliza = resultado_emision["PNUM_POLIZA"].ToString();

                if (error == "" || error == "POLIZA RETENIDA, CONTROL TECNICO")
                {
                    Emitir.ActualizaNumPoliza(PolVeh.NumCotizacion, num_poliza);

                    PolVeh.NumPoliza = num_poliza;
                    PolVeh.ErrorEmision = error;

                    if (Session["opc_soap"].ToString() == "S")
                    {
                        Service1 servicio = new Service1();

                        datospoliza[] datos = servicio.EmiteSoap(PolVeh.NumCotizacion);

                        Session["datospoliza"] = datos;
                    }
                    //SOAPWS.poliza PolizaSoap[] = new SOAPWS.poliza();                  
                    //SOAPWS.Service1 servicio = new SOAPWS.Service1();
                    //servicio.EmiteSoap                    
                    //PolizaSoap = servicio.EmiteSoap(PolVeh.NumCotizacion);

                    if (PolVeh.Inspeccion == "B")
                        Vehiculo.GuardaDatosInspeccionBSP(PolVeh.NumCotizacion, PolVeh.NumMatricula, nom_contacto, direccion_contacto, cod_region_contacto, cod_ciudad_contacto, cod_comuna_contacto, fono_contacto, celular_contacto, observaciones_contacto, nom_completo_aseg, cod_area_contacto);

                    Response.Redirect("Impresion.aspx", false);
                }
                else
                {
                    UtilesWeb.EnviaCorreoAcusete(error, "Cot. Veh. Livianos - Emision.asxp - EmitePoliza");
                    UtilesWeb.EjecutaJs(this, "alert('Se registro un error al momento de generar su poliza, intentalo de nuevo mas tarde.');");
                    return;
                }

            }
            catch (Exception Exx)
            {
                UtilesWeb.EnviaCorreoAcusete(Exx.Message, "Cot. Veh. Livianos - Emision.asxp - EmitePoliza");
                UtilesWeb.EjecutaJs(this, "alert('Se registro un error al momento de generar su poliza, intentalo de nuevo mas tarde.');");
                return;
            }
            //}
        }
        catch (Exception ex)
        {
            System.Diagnostics.StackTrace Stack = new System.Diagnostics.StackTrace(ex, true);
            int errorlineno = Stack.GetFrame(0).GetFileLineNumber();
            int errorcol = Stack.GetFrame(0).GetFileColumnNumber();

            UtilesWeb.EnviaCorreoAcusete(ex.Message, "Cot. Veh. Livianos - Emision.asxp - EmitePoliza - Linea: " + errorlineno + " - " + errorcol);
            Response.Redirect("SessionTerminada.aspx", false);
        }
    }

    public string getrdbInspeccion()
    {
        if (this.rdbSinInspeccion.Checked == true)
            return "N";
        if (this.rdbCentrosInspeccion.Checked == true)
            return "C";
        if (this.rdbInspeccionDomicilio.Checked == true)
            return "B";
        /* if (this.rdbInspeccionOficina.Checked == true)
             return "S";
         if (this.rdbInspeccionPosterior.Checked == true)
             return "P";*/
        else
            return "N";
    }

    public string getrdbFormaPago()
    {
        if (this.rdbPAC.Checked == true)
            return "DB";
        if (this.rdbPAT.Checked == true)
            return "TA";
        if (this.rdbCuotasMapfre.Checked == true)
            return "GD";
        else
            return "GD";
    }

    public bool ValidaIngresoCampos()
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

        if (
            UtilesWeb.ValidaDrowDownList(this, this.drpColor, ScriptManager1) &&
            UtilesWeb.ValidaTextBox(this, this.txtNroMotor, ScriptManager1) &&
            UtilesWeb.ValidaTextBox(this, this.txtNroChasis, ScriptManager1) &&
            UtilesWeb.ValidaTextBox(this, this.txtCodDocumAseg, ScriptManager1) &&
            UtilesWeb.ValidaTextBox(this, this.txtDireccionAseg, ScriptManager1) &&
            UtilesWeb.ValidaDrowDownList(this, this.drpRegionAseg, ScriptManager1) &&
            UtilesWeb.ValidaDrowDownList(this, this.drpCiudadAseg, ScriptManager1) &&
            UtilesWeb.ValidaDrowDownList(this, this.drpComunaAseg, ScriptManager1) &&
            UtilesWeb.ValidaTextBox(this, this.txtFonoAseg, ScriptManager1) &&
            UtilesWeb.ValidaTextBox(this, this.txtCodDocumTomad, ScriptManager1) &&
            UtilesWeb.ValidaTextBox(this, this.txtDireccionTomad, ScriptManager1) &&
            UtilesWeb.ValidaDrowDownList(this, this.drpRegionTomad, ScriptManager1) &&
            UtilesWeb.ValidaDrowDownList(this, this.drpCiudadTomad, ScriptManager1) &&
            UtilesWeb.ValidaDrowDownList(this, this.drpComunaTomad, ScriptManager1) &&
            UtilesWeb.ValidaTextBox(this, this.txtFonoTomad, ScriptManager1) &&
            UtilesWeb.ValidaDrowDownList(this, this.drpPlanPago, ScriptManager1) &&
            UtilesWeb.ValidaDrowDownList(this, this.drpDiaPago, ScriptManager1)
             )
        {
            if (!UtilesWeb.ValidaEmail(this.txtEmailAseg.Text))
            {
                UtilesWeb.EjecutaJs(this, "alert('La dirección de correo no es válida, favor corregir');");
                this.txtEmailAseg.Text = "";
                return false;
            }

            if (!UtilesWeb.ValidaEmail(this.txtEmailTomad.Text))
            {
                UtilesWeb.EjecutaJs(this, "alert('La dirección de correo no es válida, por favor debe corregirla');");
                this.txtEmailTomad.Text = "";
                return false;
            }

            if (this.trDatosFactura.Visible == true)
            {
                if (!UtilesWeb.ValidaFecha(this.txtFechaFactura.Text))
                {
                    UtilesWeb.EjecutaJs(this, "alert('La fecha de la factura no es válida, por favor debe corregirla');");
                    return false;
                }
                else
                {
                    if (!UtilesWeb.ValidaTextBox(this, this.txtNumFactura, ScriptManager1))
                        return false;
                    else
                    {
                        if (!UtilesWeb.ValidaTextBox(this, this.txtRutAutomotora, ScriptManager1))
                            return false;
                        else
                        {
                            if (!UtilesWeb.ValidaTextBox(this, this.txtNomAutomotora, ScriptManager1))
                                return false;
                        }
                    }
                }
            }

            if (this.rdbInspeccionDomicilio.Checked == true)
            {
                if (!UtilesWeb.ValidaTextBox(this, this.txtNomContacto, ScriptManager1))
                    return false;
                else
                {
                    if (!UtilesWeb.ValidaTextBox(this, this.txtDireccionContacto, ScriptManager1))
                        return false;
                    else
                    {
                        if (!UtilesWeb.ValidaDrowDownList(this, this.drpRegionContacto, ScriptManager1))
                            return false;
                        else
                        {
                            if (!UtilesWeb.ValidaDrowDownList(this, this.drpCiudadContacto, ScriptManager1))
                                return false;
                            else
                            {
                                if (!UtilesWeb.ValidaDrowDownList(this, this.drpComunaContacto, ScriptManager1))
                                    return false;
                                else
                                {
                                    if (!UtilesWeb.ValidaTextBox(this, this.txtCodAreaFonoContacto, ScriptManager1))
                                        return false;
                                    else
                                    {
                                        if (!UtilesWeb.ValidaTextBox(this, this.txtFonoContacto, ScriptManager1))
                                            return false;
                                        else
                                        {
                                            if (!UtilesWeb.ValidaTextBox(this, this.txtMovilContacto, ScriptManager1))
                                                return false;
                                            else
                                            {
                                                if (!UtilesWeb.ValidaTextBox(this, this.txtObsContacto, ScriptManager1))
                                                    return false;
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }

            if (!UtilesWeb.ValidaFecha(this.txtFechaVigencia.Text))
            {
                UtilesWeb.EjecutaJs(this, "alert('La fecha de vigencia no es válida, por favor debe corregirla');");
                return false;
            }

            if (this.txtFechaVigencia.Text == "")
            {
                UtilesWeb.EjecutaJs(this, "alert('La fecha de vigencia no es válida, por favor debe corregirla');");
                return false;
            }

            if (this.rdbInspeccionExpress.Checked == true && Session["InspeccionExpress"].ToString() == "NO")
            {
                UtilesWeb.EjecutaJs(this, "alert('Es necesario guardar la informacion en la Inspeccion Express para poder continuar');");
                AbreInspeccion();
                return false;
            }

            //Mantis 126449  -  VALIDAR FECHA INICIO DE VIGENCIA DE LA POLIZA
            DateTime vigencia_minima;

            DateTimeFormatInfo dtfiVM = new DateTimeFormatInfo();
            dtfiVM.ShortDatePattern = "dd-MM-yyyy";
            dtfiVM.DateSeparator = "-";
            
            if (PolVeh.Fact48 == "1")
                vigencia_minima = DateTime.Now.AddDays(-1 * Convert.ToDouble(ConfigurationManager.AppSettings["DiaVigenciaConFactura"].ToString()));
            else
                vigencia_minima = DateTime.Now.AddDays(-1 * Convert.ToDouble(ConfigurationManager.AppSettings["DiaVigenciaSinFactura"].ToString()));

            string strDateVM = vigencia_minima.ToString("dd-MM-yyyy", CultureInfo.InvariantCulture);
            vigencia_minima = Convert.ToDateTime(strDateVM, dtfiVM);
            
            string strDate = this.txtFechaVigencia.Text;
            DateTimeFormatInfo dtfi = new DateTimeFormatInfo();
            dtfi.ShortDatePattern = "dd-MM-yyyy";
            dtfi.DateSeparator = "-";
            DateTime objDate = Convert.ToDateTime(strDate, dtfi);

            int compar = objDate.CompareTo(vigencia_minima);

            if (compar < 0)
            {
                string cantDias;

                if (PolVeh.Fact48 =="1")                
                    cantDias = ConfigurationManager.AppSettings["DiaVigenciaConFactura"].ToString();
                else
                    cantDias = ConfigurationManager.AppSettings["DiaVigenciaSinFactura"].ToString();

                string alert = "alert('La fecha de la vigencia de la póliza no puede ser inferior a " + cantDias + " días ');";
                UtilesWeb.EjecutaJs(this, alert);
                return false;
            }

            //Mantis 126449  --  VALIDAR FECHA DE EMISION DE LA FACTURA
            if (PolVeh.Fact48 == "1" && txtFechaFactura.Text != "")
            {
                vigencia_minima = DateTime.Now.AddDays(-1 * Convert.ToDouble(ConfigurationManager.AppSettings["DiaVigenciaFactura"].ToString()));

                string strDate2 = this.txtFechaFactura.Text;
                DateTimeFormatInfo dtfi2 = new DateTimeFormatInfo();
                dtfi2.ShortDatePattern = "dd-MM-yyyy";
                dtfi2.DateSeparator = "-";
                DateTime objDate2 = Convert.ToDateTime(strDate2, dtfi2);

                int compar2 = objDate2.CompareTo(vigencia_minima);

                if (compar2 < 0)
                {
                    string cantDias;
                    cantDias = ConfigurationManager.AppSettings["DiaVigenciaFactura"].ToString();

                    string alert = "alert('La fecha de emision de la factura no puede ser superior a " + cantDias + " días ');";
                    UtilesWeb.EjecutaJs(this, alert);
                    return false;
                }
            }

            if (PolVeh.NumMatricula != "A/D")
            {

                string existe_poliza = Cotiza.PolizaExistente(PolVeh.NumMatricula);

                if (existe_poliza == "S")
                {
                    UtilesWeb.EjecutaJs(this, "alert('La patente que desea ingresar ya existe en nuestros registros con una poliza vigente.');");

                    return false;
                }

            }

            string cod_docum = this.txtCodDocumAseg.Text.Replace(".", "").Replace("-", "");
            int intcod_docum = Convert.ToInt32(cod_docum.Substring(0, cod_docum.Length - 1));

            if (intcod_docum >= 50000000)
            {
                if (UtilesWeb.ValidaTextBox(this, this.txtNomAseg, ScriptManager1))
                {
                    if (UtilesWeb.ValidaTextBox(this, this.txtCodDocumTomad, ScriptManager1))
                    {
                        string cod_docum_tomad = this.txtCodDocumTomad.Text.Replace(".", "").Replace("-", "");
                        int intcod_docum_tomad = Convert.ToInt32(cod_docum_tomad.Substring(0, cod_docum_tomad.Length - 1));

                        if (intcod_docum_tomad >= 50000000)
                        {
                            if (UtilesWeb.ValidaTextBox(this, this.txtNomTomad, ScriptManager1))
                            {
                                return true;
                            }
                            else
                                return false;
                        }
                        else
                        {
                            if (
                                UtilesWeb.ValidaTextBox(this, this.txtNomTomad, ScriptManager1) &&
                                UtilesWeb.ValidaTextBox(this, this.txtApePaternoTomad, ScriptManager1) &&
                                UtilesWeb.ValidaTextBox(this, this.txtApeMaternoTomad, ScriptManager1)
                                )
                            {
                                return true;
                            }
                            else
                                return false;
                        }
                    }
                    else
                        return false;
                }
                else
                    return false;
            }
            else
            {
                if (UtilesWeb.ValidaTextBox(this, this.txtNomAseg, ScriptManager1) &&
                    UtilesWeb.ValidaTextBox(this, this.txtApePaternoAseg, ScriptManager1) &&
                    UtilesWeb.ValidaTextBox(this, this.txtApeMaternoAseg, ScriptManager1))
                {
                    if (UtilesWeb.ValidaTextBox(this, this.txtCodDocumTomad, ScriptManager1))
                    {
                        string cod_docum_tomad = this.txtCodDocumTomad.Text.Replace(".", "").Replace("-", "");
                        int intcod_docum_tomad = Convert.ToInt32(cod_docum_tomad.Substring(0, cod_docum_tomad.Length - 1));

                        if (intcod_docum_tomad >= 50000000)
                        {
                            if (UtilesWeb.ValidaTextBox(this, this.txtNomTomad, ScriptManager1))
                            {
                                return true;
                            }
                            else
                                return false;
                        }
                        else
                        {
                            if (
                                UtilesWeb.ValidaTextBox(this, this.txtNomTomad, ScriptManager1) &&
                                UtilesWeb.ValidaTextBox(this, this.txtApePaternoTomad, ScriptManager1) &&
                                UtilesWeb.ValidaTextBox(this, this.txtApeMaternoTomad, ScriptManager1)
                                )
                            {
                                return true;
                            }
                            else
                                return false;
                        }
                    }
                    else
                        return false;
                }
                else
                    return false;
            }
            //return true;
        }
        else
            return false;
    }

    protected void txtCodDocumTomad_TextChanged(object sender, EventArgs e)
    {
        try
        {
            string cod_docum_tomad = this.txtCodDocumTomad.Text.ToUpper().Trim().Replace("-", "").Replace(".", "");

            if (UtilesWeb.ValidaRUT(cod_docum_tomad) == false)
            {
                //ScriptManager1.SetFocus(txtCodDocumTomad);
                this.txtCodDocumTomad.Text = "";
                UtilesWeb.EjecutaJs(this, "alert('El Rut no es válido, favor corregir');");
                return;
            }
            if (UtilesWeb.DV_RUT(cod_docum_tomad) == false)
            {
                //ScriptManager1.SetFocus(txtCodDocumTomad);
                this.txtCodDocumTomad.Text = "";
                UtilesWeb.EjecutaJs(this, "alert('El Rut no es válido, favor corregir');");
                return;
            }

            if (Tercero.ClienteBloqueado(cod_docum_tomad))
            {
                this.txtCodDocumTomad.Text = UtilesWeb.getFormated(cod_docum_tomad.ToUpper());

                this.txtNomTomad.Text = "";
                this.txtApePaternoTomad.Text = "";
                this.txtApeMaternoTomad.Text = "";
                this.txtNomTomad.Enabled = true;
                this.txtApePaternoTomad.Enabled = true;
                this.txtApeMaternoTomad.Enabled = true;

                Poliza PolVeh;

                if (Session["PolVeh"] != null)
                {
                    PolVeh = (Poliza)Session["PolVeh"];
                }
                else
                {
                    PolVeh = new Poliza();
                    Session["PolVeh"] = PolVeh;
                }

                PolVeh.CodDocumTomad = cod_docum_tomad;
                PolVeh.NomTomad = "";
                PolVeh.ApePatTomad = "";
                PolVeh.ApeMatTomad = "";

                if (PolVeh.CodDocumTomad == PolVeh.CodDocumAseg)
                {
                    setTextTextBox(txtCodDocumTomad, UtilesWeb.getFormated(PolVeh.CodDocumAseg), false);
                    setTextTextBox(txtNomTomad, PolVeh.NomAseg, true);
                    setTextTextBox(txtApePaternoTomad, PolVeh.ApePatAseg, true);
                    setTextTextBox(txtApeMaternoTomad, PolVeh.ApeMatAseg, true);
                }

                CargaTercero(PolVeh.CodDocumTomad, "TOMAD");

                string dia_pago_bd = Cobranza.DiaPago(PolVeh.CodDocumTomad);

                if (dia_pago_bd != "0")
                {
                    UtilesWeb.selected_block(drpDiaPago, dia_pago_bd);
                    UtilesWeb.selected(drpPlanPago, PolVeh.NumCuota);
                    this.lblValorCuota.Text = CalculaCuota();
                }
                else
                {
                    string dia_pago = ConfigurationManager.AppSettings["DiaPagoCot"];
                    UtilesWeb.selected(drpDiaPago, dia_pago);
                    UtilesWeb.selected(drpPlanPago, PolVeh.NumCuota);
                    this.drpDiaPago.Enabled = true;
                    this.lblValorCuota.Text = PolVeh.Cuota;
                }
            }
            else
            {
                this.txtCodDocumAseg.Text = "";
                UtilesWeb.EjecutaJs(this, "alert('El RUT se encuentra bloqueado, comunicate con tu ejecutivo.');");
                return;
            }
        }
        catch
        {
            //ScriptManager1.SetFocus(txtCodDocumAseg);
            this.txtCodDocumAseg.Text = "";
            UtilesWeb.EjecutaJs(this, "alert('El Rut no es válido, favor corregir');");
            return;
        }
    }

    protected void txtNumTarjetaPAT_TextChanged(object sender, EventArgs e)
    {
        try
        {
            string num_tarjeta = ((TextBox)sender).Text.Replace("-", "").Replace(".", "").Trim();
            int largo = num_tarjeta.Length;

            if (largo > 16)
            {
                ((TextBox)sender).Text = "";
                UtilesWeb.EjecutaJs(this, "alert('El Numero de tarjeta no es válido, favor corregir');");
                return;
            }

            if (largo < 14)
            {
                ((TextBox)sender).Text = "";
                UtilesWeb.EjecutaJs(this, "alert('El Numero de tarjeta no es vÃ¡lido, favor corregir');");
                return;
            }

            if (!UtilesWeb.IsValidNumber(num_tarjeta))
            {
                ((TextBox)sender).Text = "";
                UtilesWeb.EjecutaJs(this, "alert('El Numero de tarjeta no es válido, favor corregir');");
                return;
            }
            else
            {
                this.txtNumTarjetaPAT.Text = num_tarjeta;
                return;
            }
        }
        catch
        {
            ((TextBox)sender).Text = "";
            UtilesWeb.EjecutaJs(this, "alert('El Numero de tarjeta no es válido, favor corregir');");
            return;
        }
    }

    protected void ImgNuevaCotizacion_Click(object sender, ImageClickEventArgs e)
    {
        //Response.Redirect("Cotizador.aspx", false);
        Response.Redirect(Session["LOAD_URL"].ToString());
    }

    protected void txtEmailAseg_TextChanged(object sender, EventArgs e)
    {
        if (this.txtCodDocumAseg.Text == this.txtCodDocumTomad.Text)
        {
            ((TextBox)sender).Text = ((TextBox)sender).Text.ToUpper();
            this.txtEmailTomad.Text = ((TextBox)sender).Text;
        }
    }

    protected void rdbInspeccionExpress_CheckedChanged(object sender, EventArgs e)
    {
        if (
           UtilesWeb.ValidaDrowDownList(this, this.drpColor, ScriptManager1) &&
           UtilesWeb.ValidaTextBox(this, this.txtNroMotor, ScriptManager1) &&
           UtilesWeb.ValidaTextBox(this, this.txtNroChasis, ScriptManager1))
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

            if (Session["InspeccionExpress"] != null)
            {
                if (Session["InspeccionExpress"].ToString() == "OK")
                {
                    UtilesWeb.selected(this.drpColor, PolVeh.CodColor);
                    this.txtNroMotor.Text = PolVeh.NroMotor;
                    this.txtNroChasis.Text = PolVeh.NroChasis;
                }
            }

            PolVeh.CodColor = this.drpColor.SelectedValue.ToString();
            PolVeh.NomColor = this.drpColor.SelectedItem.Text.ToString();
            PolVeh.NroMotor = this.txtNroMotor.Text.ToString();
            PolVeh.NroChasis = this.txtNroChasis.Text.ToString();

            AbreInspeccion();

        }
        else
        {
            if (this.rdbSinInspeccion.Visible == true)
                this.rdbSinInspeccion.Checked = true;
            //else
            //    this.rdbInspeccionOficina.Checked = true;

            this.rdbInspeccionExpress.Checked = false;
        }
    }

    public void AbreInspeccion()
    {
        //UtilesWeb.OpenNewWindow(Page, "Inspeccion.aspx", "1080", "800", "1", "0");
        UtilesWeb.EjecutaJs(Page, "window.showModalDialog('Inspeccion.aspx', '', 'center:yes;resizable:no;dialogHeight:800px;dialogWidth:940px')");
    }

    protected void drpColor_SelectedIndexChanged(object sender, EventArgs e)
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

        if (this.rdbInspeccionExpress.Checked == true)
        {
            if (Session["InspeccionExpress"] != null)
            {
                if (Session["InspeccionExpress"].ToString() == "OK")
                {
                    UtilesWeb.EjecutaJs(this, "alert('No es posible modificar esta informacion ya que existe una Inspeccion Asociada a estos datos.');");
                    UtilesWeb.selected(this.drpColor, PolVeh.CodColor);
                }
            }
        }
    }

    protected void txtNroMotor_TextChanged(object sender, EventArgs e)
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

        string val = Vehiculo.ValidaNroMotor(((TextBox)sender).Text.ToUpper());

        if (val == "S")
        {
            UtilesWeb.EjecutaJs(this, "alert('El número de motor ingresado ya cuenta con una póliza vigente.');");
            ((TextBox)sender).Text = "";
        }

        if (this.rdbInspeccionExpress.Checked == true)
        {
            if (Session["InspeccionExpress"] != null)
            {
                if (Session["InspeccionExpress"].ToString() == "OK")
                {
                    UtilesWeb.EjecutaJs(this, "alert('No es posible modificar esta informacion ya que existe una Inspeccion Asociada a estos datos.');");
                    this.txtNroMotor.Text = PolVeh.NroMotor;
                }
            }
        }

    }

    protected void txtNroChasis_TextChanged(object sender, EventArgs e)
    {
        Poliza PolVeh = Poliza.CargaPoliza();

        //if (Session["PolVeh"] != null)
        //{
        //    PolVeh = (Poliza)Session["PolVeh"];
        //}
        //else
        //{
        //    PolVeh = new Poliza();
        //    Session["PolVeh"] = PolVeh;
        //}

        if (this.rdbInspeccionExpress.Checked == true)
        {
            if (Session["InspeccionExpress"] != null)
            {
                if (Session["InspeccionExpress"].ToString() == "OK")
                {
                    UtilesWeb.EjecutaJs(this, "alert('No es posible modificar esta informacion ya que existe una Inspeccion Asociada a estos datos.');");
                    this.txtNroChasis.Text = PolVeh.NroChasis;
                }
            }
        }

    }
    
    protected void txtFechaFactura_TextChanged(object sender, EventArgs e)
    {
        if (!UtilesWeb.ValidaFecha(this.txtFechaFactura.Text))
        {
            UtilesWeb.EjecutaJs(this, "alert('La fecha de la factura no es válida, por favor debe corregirla');");
            //return false;
        }
        else
        {
            setInspeccion();
        }
    }

    protected void rdbInpeccionDomicilio_CheckedChanged(object sender, EventArgs e)
    {
        this.trDatosContacto.Visible = true;
        this.trDatosCentrosInspeccion.Visible = false;
    }

    protected void rdbCentrosInspeccion_CheckedChanged(object sender, EventArgs e)
    {
        this.trDatosContacto.Visible = false;
    }

    protected void drpRegionContacto_SelectedIndexChanged(object sender, EventArgs e)
    {
        string cod = UtilesWeb.GetPropertyValue(sender, "SelectedValue");
        Localidades.Carga_Ciudades(this.drpCiudadContacto, cod);

        this.drpComunaContacto.Items.Clear();
        this.drpComunaContacto.Items.Insert(0, new ListItem("Seleccionar", "0"));
        this.drpComunaContacto.SelectedIndex = 0;
    }

    protected void drpCiudadContacto_SelectedIndexChanged(object sender, EventArgs e)
    {
        string cod = UtilesWeb.GetPropertyValue(sender, "SelectedValue");
        Localidades.Carga_Comunas(this.drpComunaContacto, cod);
    }

    protected void txtRutAutomotora_TextChanged(object sender, EventArgs e)
    {
        string cod_docum_automotora = this.txtRutAutomotora.Text.ToUpper().Trim().Replace("-", "").Replace(".", "");

        if (UtilesWeb.ValidaRUT(cod_docum_automotora) == false)
        {
            //ScriptManager1.SetFocus(txtCodDocumTomad);
            this.txtRutAutomotora.Text = "";
            UtilesWeb.EjecutaJs(this, "alert('El Rut no es válido, favor corregir');");
            return;
        }
        if (UtilesWeb.DV_RUT(cod_docum_automotora) == false)
        {
            //ScriptManager1.SetFocus(txtCodDocumTomad);
            this.txtRutAutomotora.Text = "";
            UtilesWeb.EjecutaJs(this, "alert('El Rut no es válido, favor corregir');");
            return;
        }

        this.txtRutAutomotora.Text = UtilesWeb.getFormated(cod_docum_automotora.ToUpper());

        DataRow datos_tercero = null;
        datos_tercero = Tercero.DatosAutomotora(cod_docum_automotora);

        if (datos_tercero["p_nom_automotora"].ToString() != "")
        {
            UtilesWeb.Asigna_dat_block(datos_tercero, this.txtNomAutomotora, "p_nom_automotora");
        }
    }
    
    protected void lnkDatosCentrosInspeccion_Click(object sender, EventArgs e)
    {
        if (this.trDatosCentrosInspeccion.Visible == true)
            this.trDatosCentrosInspeccion.Visible = false;
        else
            this.trDatosCentrosInspeccion.Visible = true;
    }
    
    protected void txtNumFactura_TextChanged(object sender, EventArgs e)
    {
        try
        {
            if (!UtilesWeb.isNumero(this.txtNumFactura.Text))
            {
                UtilesWeb.EjecutaJs(this, "alert('El número de Factura ingresado no es válido, deben ser sólo números.');");
                this.txtNumFactura.Text = "";
            }
        }
        catch
        {
            UtilesWeb.EjecutaJs(this, "alert('El número de Factura ingresado no es válido, deben ser sólo números.');");
            this.txtNumFactura.Text = "";
            return;
        }
    }
    
    protected void rdbPAC_CheckedChanged(object sender, EventArgs e)
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
        }

        this.PAT.Visible = false;
        this.PAC.Visible = true;
        if (PolVeh.Convenio == "COMPARA")
        {
            drpPlanPago.Items.Clear();
            //Cobranza.PlanesPagoCompara(drpPlanPago, "DB");
            Cobranza.PlanesPagoConvenio(drpPlanPago, "1", "801", "DB", "99999", PolVeh.Convenio);
            drpPlanPago.SelectedIndex = drpPlanPago.Items.IndexOf(drpPlanPago.Items.FindByValue("83"));
        }
        this.lblValorCuota.Text = CalculaCuota();
        //drpPlanPago.Enabled = false;
    }
}