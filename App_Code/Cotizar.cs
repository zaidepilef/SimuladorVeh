using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Configuration;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using MapfreMCL.oracle;
using Oracle.DataAccess.Client;

/// <summary>
/// Summary description for Cotizador
/// </summary>
public class Cotiza
{

    #region Restringe condiciones de Amunategui
    // me retorna 4 varchar desde 
    /*
     PROCEDURE P_EVALUA_RESTRICCION(
                      P_COD_DOCUM IN VARCHAR2,
                     P_DESCUENTO OUT VARCHAR2,
                     P_COMISION OUT VARCHAR2,
                     P_INSPECCION OUT VARCHAR2,
                     P_ERROR OUT VARCHAR2) IS
     * */
    public static bool RestringeAmunategui(string cod_docum) {
        try
        {
            bool pasa = false;
            DataRow cant = null;
            Cotiza_DB objCantidad = new Cotiza_DB();
            using (OracleConnection Conexion = MConexion.getConexion("OVDES"))
            {
                cant = objCantidad.EvaluaRestriccion_DB(cod_docum, Conexion);
                if (cant.ItemArray[3].ToString() == "0")
                {
                    pasa = true;
                }
            }
            return pasa;
            
        }
        catch (Exception ex)
        {
            //throw new Exception("ERROR Cotizar.UpdatePrimaNeta : " + ex.Message);
            Logs.writeToLogFile("ERROR Cotizar.UpdatePrimaNeta : " + ex.Message);
            return false;
        }
    
    }
    #endregion

    #region Cantidad de Planes
    public static DataSet CantPlanes(string cod_conv)
    {
        DataSet cant = null;
        Cotiza_DB objCantidad = new Cotiza_DB();
        try
        {
            using (OracleConnection Conexion = MConexion.getConexion("OVDES"))
            {
                cant = objCantidad.CantPlanes_DB(cod_conv, Conexion);
                return cant;
            }
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }
    #endregion

    public static DataRow Cotizar(string cod_modalidad, string cod_marca, string cod_modelo, string cod_submodelo, string año, string cod_docum, string cod_docum_aseg, string num_matricula, string cod_ramo, string monto_rc, string edad, string sexo, string cant_siniestros, string monto_siniestros, string rc_exceso, string antig_veh, string cod_conv, string cob_opc, string mca_mel, string tipo_descuento_databusiness, string descuento_databusiness)
    {
        DataRow cotizacion = null;
        Cotiza_DB objcotiza = new Cotiza_DB();

        try
        {
            using (OracleConnection Conexion = MConexion.getConexion("OVDES"))
            {
                cotizacion = objcotiza.Cotizar_DB(cod_ramo, cod_docum, cod_docum_aseg, Convert.ToInt32(cod_marca), Convert.ToInt32(cod_modelo), Convert.ToInt32(cod_submodelo), Convert.ToInt32(cod_modalidad), num_matricula, monto_rc, edad, sexo, cant_siniestros, monto_siniestros, rc_exceso, antig_veh, cod_conv, cob_opc, mca_mel, tipo_descuento_databusiness, descuento_databusiness, Conexion);
                return cotizacion;
            }
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }

    public static DataRow Cotizar_Fechas(string cod_modalidad, string cod_marca, string cod_modelo,
                                         string cod_submodelo, string año, string cod_docum,
                                         string cod_docum_aseg, string num_matricula, string fecha_inicio,
                                         string fecha_fin, string cod_ramo, string monto_rc, string edad,
                                         string sexo, string cant_siniestros, string monto_siniestros,
                                         string rc_exceso, string antig_veh, string cod_conv, string cob_opc,
                                         string mca_mel, string tipo_descuento_databusiness, string descuento_databusiness)
    {
        DataRow cotizacion = null;
        Cotiza_DB objcotiza = new Cotiza_DB();

        try
        {
            if (!String.IsNullOrEmpty(fecha_inicio) || !String.IsNullOrEmpty(fecha_fin))
            {

                using (OracleConnection Conexion = MConexion.getConexion("OVDES"))
                {
                    cotizacion = objcotiza.Cotizar_Fechas_DB(cod_ramo, cod_docum, cod_docum_aseg,
                        Convert.ToInt32(cod_marca), Convert.ToInt32(cod_modelo), Convert.ToInt32(cod_submodelo),
                        Convert.ToInt32(cod_modalidad), num_matricula, monto_rc, edad, sexo, cant_siniestros,
                        monto_siniestros, rc_exceso, antig_veh, cod_conv, cob_opc, fecha_inicio, fecha_fin,
                        mca_mel, tipo_descuento_databusiness, descuento_databusiness, Conexion);
                    return cotizacion;
                }
            }
            else
            {
                using (OracleConnection Conexion = MConexion.getConexion("OVDES"))
                {
                    cotizacion = objcotiza.Cotizar_DB(cod_ramo, cod_docum, cod_docum_aseg,
                        Convert.ToInt32(cod_marca), Convert.ToInt32(cod_modelo), Convert.ToInt32(cod_submodelo),
                        Convert.ToInt32(cod_modalidad), num_matricula, monto_rc, edad, sexo, cant_siniestros,
                        monto_siniestros, rc_exceso, antig_veh, cod_conv, cob_opc, mca_mel,
                        tipo_descuento_databusiness, descuento_databusiness, Conexion);
                    return cotizacion;
                }
            }
        }

        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }

    public static string NomModalidad(string cod_modalidad)
    {
        DataRow modalidad = null;
        Cotiza_DB objcotiza = new Cotiza_DB();

        try
        {
            using (OracleConnection Conexion = MConexion.getConexion("OVDES"))
            {
                modalidad = objcotiza.NomModalidad_DB(Convert.ToInt32(cod_modalidad), Conexion);

                return modalidad["p_nom_modalidad"].ToString();
            }
        }

        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }

    }

    public static string PolizaExistente(string num_matricula)
    {
        DataRow modalidad = null;
        Cotiza_DB objcotiza = new Cotiza_DB();

        try
        {
            using (OracleConnection Conexion = MConexion.getConexion("OVDES"))
            {
                modalidad = objcotiza.PolizaExistente_DB(num_matricula, Conexion);

                return modalidad["p_error"].ToString();
            }
        }

        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }

    }

    public static string PrimaTec(string cod_docum_aseg)
    {
        DataRow primatecnica = null;
        Cotiza_DB objcotiza = new Cotiza_DB();

        try
        {
            using (OracleConnection Conexion = MConexion.getConexion("OVDES"))
            {
                primatecnica = objcotiza.PrimaTec_DB(cod_docum_aseg, "", "", Conexion);

                return primatecnica["P_PRIMA_TEC_MIN"].ToString();
            }
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }

    public static string PrimaTec(string cod_docum_aseg, string cod_docum_tomad)
    {
        DataRow primatecnica = null;
        Cotiza_DB objcotiza = new Cotiza_DB();

        try
        {
            using (OracleConnection Conexion = MConexion.getConexion("OVDES"))
            {
                primatecnica = objcotiza.PrimaTec_DB(cod_docum_aseg, cod_docum_tomad, "", Conexion);

                return primatecnica["P_PRIMA_TEC_MIN"].ToString();
            }
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }

    public static string PrimaTecMatricula(string num_matricula)
    {
        DataRow primatecnica = null;
        Cotiza_DB objcotiza = new Cotiza_DB();

        try
        {
            using (OracleConnection Conexion = MConexion.getConexion("OVDES"))
            {
                primatecnica = objcotiza.PrimaTec_DB("", "", num_matricula, Conexion);

                return primatecnica["P_PRIMA_TEC_MIN"].ToString();
            }
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }

    public static DataRow GrabaCotizacion(string cod_docum, string cod_docum_aseg, string num_matricula,
        string stringcot, string num_cotizacion, string cod_ramo, string monto_rc, string sexo,
        string edad, string rc_exceso, string ID, string fact_48, string convenio, string cob_opc, string mca_mel, string fec_ini_vig, string fec_fin_vig)
    {
        DataRow grabacotizacion = null;
        Cotiza_DB objcotiza = new Cotiza_DB();

        try
        {
            using (OracleConnection Conexion = MConexion.getConexion("OVDES"))
            {
                grabacotizacion = objcotiza.GrabaCotizacion_DB(cod_docum, cod_docum_aseg, num_matricula, stringcot,
                    num_cotizacion, cod_ramo, monto_rc, sexo, edad, rc_exceso, ID, fact_48, convenio, cob_opc, mca_mel,
                    fec_ini_vig, fec_fin_vig, Conexion);
                return grabacotizacion;
            }
        }

        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }

    public static DataRow GrabaCotizacionEmite(string COD_DOCUM, string COD_DOCUM_ASEG, string NUM_MATRICULA,
        string FECHA_INICIO_VIGENCIA, string FECHA_FIN_VIGENCIA, string COD_MODALIDAD, decimal PRIMA_NETA,
        string DESC, string COD_RAMO, string MONTO_RC, string EDAD_CONDUCTOR, string SEXO_CONDUCTOR,
        string NUM_COTIZACION, string RC_EXCESO, string ID, string fact_48, string convenio,
        string cob_opc, string mca_mel)
    {
        DataRow grabacotizacion = null;
        Cotiza_DB objcotiza = new Cotiza_DB();

        try
        {
            if (String.IsNullOrEmpty(FECHA_INICIO_VIGENCIA) && String.IsNullOrEmpty(FECHA_FIN_VIGENCIA))
            {
                using (OracleConnection Conexion = MConexion.getConexion("OVDES"))
                {
                    grabacotizacion = objcotiza.GrabaCotizacionEmite_DB(COD_DOCUM, COD_DOCUM_ASEG, NUM_MATRICULA, COD_MODALIDAD, PRIMA_NETA, DESC, COD_RAMO, MONTO_RC, EDAD_CONDUCTOR, SEXO_CONDUCTOR, NUM_COTIZACION, RC_EXCESO, ID, fact_48, convenio, cob_opc, mca_mel, Conexion);
                    return grabacotizacion;
                }
            }
            else
            {
                using (OracleConnection Conexion = MConexion.getConexion("OVDES"))
                {
                    grabacotizacion = objcotiza.GrabaCotizacionEmite_Fechas_DB(COD_DOCUM, COD_DOCUM_ASEG, NUM_MATRICULA, COD_MODALIDAD, PRIMA_NETA, DESC, COD_RAMO, MONTO_RC, FECHA_INICIO_VIGENCIA, FECHA_FIN_VIGENCIA, EDAD_CONDUCTOR, SEXO_CONDUCTOR, NUM_COTIZACION, RC_EXCESO, ID, fact_48, convenio, cob_opc, mca_mel, Conexion);
                    return grabacotizacion;
                }
            }
        }

        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }

    public static DataRow GrabaVehiculoCot(string num_matricula, string cod_docum, string cod_marca, string cod_modelo, string cod_sub_modelo, string anio_fab, string id)
    {
        DataRow grabavehiculo = null;
        Cotiza_DB objcotiza = new Cotiza_DB();

        try
        {
            using (OracleConnection Conexion = MConexion.getConexion("OVDES"))
            {
                grabavehiculo = objcotiza.GrabaVehiculoCot_DB(num_matricula, cod_docum, cod_marca, cod_modelo, cod_sub_modelo, anio_fab, id, Conexion);
                return grabavehiculo;
            }
        }

        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }

    public static DataRow ImprimeCotizacion(string num_cotizacion)
    {
        DataRow imprimecotizacion = null;
        Cotiza_DB objcotiza = new Cotiza_DB();

        try
        {
            using (OracleConnection Conexion = MConexion.getConexion("OVDES"))
            {
                imprimecotizacion = objcotiza.ImprimeCotizacion_DB(num_cotizacion, Conexion);
                return imprimecotizacion;
            }
        }

        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }

    public static DataRow ImprimeNuevaCotizacion(string num_cuotas_PAT, string num_cotizacion)
    {
        DataRow imprimecotizacion = null;
        Cotiza_DB objcotiza = new Cotiza_DB();

        try
        {
            using (OracleConnection Conexion = MConexion.getConexion("OVDES"))
            {
                imprimecotizacion = objcotiza.ImprimeNuevaCotizacion_DB(num_cuotas_PAT, num_cotizacion, Conexion);
                return imprimecotizacion;
            }
        }

        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }

    public static DataRow ImprimeNuevaCotizacionAntiguo(string num_cuotas_PAT, string num_cotizacion)
    {
        DataRow imprimecotizacion = null;
        Cotiza_DB objcotiza = new Cotiza_DB();

        try
        {
            using (OracleConnection Conexion = MConexion.getConexion("OVDES"))
            {
                imprimecotizacion = objcotiza.ImprimeNuevaCotizacion_DB_Antiguo(num_cuotas_PAT, num_cotizacion, Conexion);
                return imprimecotizacion;
            }
        }

        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }

    public static DataRow LlamaSisgen(string cod_docum_aseg, string cod_docum_tomad, string num_matricula)
    {
        DataRow sisgen = null;
        Cotiza_DB objcotiza = new Cotiza_DB();

        try
        {
            using (OracleConnection Conexion = MConexion.getConexion("OVDES"))
            {
                sisgen = objcotiza.LlamaSisgen_DB(cod_docum_aseg, cod_docum_tomad, num_matricula, Conexion);
                return sisgen;
            }
        }

        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }

    public static string EnviaCorreo(string cod_ramo, string num_cotizacion, string correo_destino, string correo_corredor, string correo_cc, string mensaje, string url)
    {
        DataRow emailcot = null;

        try
        {
            using (OracleConnection Conexion = MConexion.getConexion("OVDES"))
            {
                string tabla;
                string result;

                tabla = "<TABLE>";
                tabla += "<TR>";
                tabla += "<TD width='500'>";
                tabla += "<FONT size='2' face='Arial'><STRONG>Mensaje Adjunto :</STRONG></font>";
                tabla += "<P><STRONG>" + mensaje + "</STRONG></P>";
                tabla += "</TD>";
                tabla += "</TR>";
                tabla += "</TABLE>";

                string asunto = ConfigurationManager.AppSettings["ASUNTO_CORREO"];

                // Get the 'pages' section.
                Configuration configuration = WebConfigurationManager.OpenWebConfiguration("~");
                PagesSection pagesSection = (PagesSection)configuration.GetSection("system.web/pages");

                result = pagesSection.StyleSheetTheme;

                string logo_correo = ConfigurationManager.AppSettings["Server"].ToString() + "/CotizadorVeh/App_Themes/" + result + "/Images/logocorreo.jpg";

                emailcot = UtilesWeb.EnviaCorreo_DB("1", cod_ramo, num_cotizacion, correo_destino, correo_corredor, correo_cc, asunto, mensaje, logo_correo, url, Conexion);

                return emailcot["P_ERROR"].ToString();
            }
        }

        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }


    // este valida si hay que inspeccionar segun la DB
    public static DataRow ValidaInspeccion(string num_matricula, string cod_docum, string cod_ramo, string convenio)
    {
        DataRow inspeccion = null;
        Cotiza_DB objcotiza = new Cotiza_DB();

        try
        {
            using (OracleConnection Conexion = MConexion.getConexion("OVDES"))
            {
                inspeccion = objcotiza.ValidaInspeccion_DB(num_matricula, cod_docum, cod_ramo, convenio, Conexion);
                return inspeccion;
            }
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }

    public static void AsignaInspeccion(string num_cotizacion, string num_inspeccion)
    {
        DataRow inspeccion = null;
        Cotiza_DB objcotiza = new Cotiza_DB();

        try
        {
            using (OracleConnection Conexion = MConexion.getConexion("OVDES"))
            {
                inspeccion = objcotiza.AsignaInspeccion_DB(num_cotizacion, num_inspeccion, Conexion);
            }
        }

        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }

    }

    public static DataSet OpcionesCotizador(string cod_conv)
    {
        DataSet cant = null;
        Cotiza_DB objOpciones = new Cotiza_DB();

        try
        {
            using (OracleConnection Conexion = MConexion.getConexion("OVDES"))
            {
                cant = objOpciones.OpcionesCotizador_DB(cod_conv, Conexion);

                return cant;

            }

        }

        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }

    public static DataRow ValidaSuplantacion(string cod_docum)
    {
        DataRow cant = null;
        Cotiza_DB objOpciones = new Cotiza_DB();

        try
        {
            using (OracleConnection Conexion = MConexion.getConexion("OVDES"))
            {
                cant = objOpciones.ValidaSuplantacion_DB(cod_docum, Conexion);
                return cant;
            }
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }

    public static DataRow CargaDatosConvenioCot(string num_cotizacion)
    {
        DataRow cant = null;
        Cotiza_DB objOpciones = new Cotiza_DB();

        try
        {
            using (OracleConnection Conexion = MConexion.getConexion("OVDES"))
            {
                cant = objOpciones.CargaDatosConvenioCot_DB(num_cotizacion, Conexion);

                return cant;

            }

        }

        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }

    public static DataSet CargaDatosCotizacion(string num_cotizacion)
    {
        DataSet datos = null;
        Cotiza_DB objOpciones = new Cotiza_DB();

        try
        {
            using (OracleConnection Conexion = MConexion.getConexion("OVDES"))
            {
                datos = objOpciones.CargaDatosCotizacion_DB(num_cotizacion, Conexion);

                return datos;

            }

        }

        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }

    public static DataRow ValidaRiesgoPolVigente(string cod_docum_aseg, string cod_marca, string cod_modelo, string cod_sub_modelo, string cod_conv, string rc_exceso)
    {
        DataRow pol_vig = null;
        Cotiza_DB objPolVigentes = new Cotiza_DB();

        try
        {
            using (OracleConnection Conexion = MConexion.getConexion("OVDES"))
            {
                pol_vig = objPolVigentes.ValidaRiesgoPolVigente_DB(cod_docum_aseg, cod_marca, cod_modelo, cod_sub_modelo, cod_conv, rc_exceso, Conexion);

                return pol_vig;
            }
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }

    public static string OpcionesTMarketing(string cod_conv, string cod_docum, string cod_producto)
    {
        DataRow cant = null;
        Cotiza_DB objOpciones = new Cotiza_DB();
        try
        {
            using (OracleConnection Conexion = MConexion.getConexion("OVDES"))
            {
                cant = objOpciones.OpcionesTMarketing_DB(cod_conv, cod_docum, cod_producto, Conexion);
                return cant["P_RESPUESTA"].ToString();
            }
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }

    public static string OpcionesTMarketingPopUp(string cod_conv, string cod_docum, string cod_producto)
    {
        DataRow cant = null;
        Cotiza_DB objOpciones = new Cotiza_DB();
        try
        {
            using (OracleConnection Conexion = MConexion.getConexion("OVDES"))
            {
                cant = objOpciones.OpcionesTMarketingPopUp_DB(cod_conv, cod_docum, cod_producto, Conexion);
                return cant["P_RESPUESTA"].ToString();
            }
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }

    public static string GrabaTMarketing(string cod_docum_aseg, string nom_asegurado, string ape_paterno, string ape_materno, string email, string num_telefono, string num_telefono2, string cod_producto, string cod_docum, string cod_convenio, string num_cotizacion, string id_tmarketing)
    {
        DataRow graba = null;
        Cotiza_DB objOpciones = new Cotiza_DB();
        try
        {
            using (OracleConnection Conexion = MConexion.getConexion("OVDES"))
            {
                graba = objOpciones.GrabaTMarketing_DB(cod_docum_aseg, nom_asegurado, ape_paterno, ape_materno, email, num_telefono, num_telefono2, cod_producto, cod_docum, cod_convenio, num_cotizacion, id_tmarketing, Conexion);
                return graba["P_ID_TMARKETING"].ToString();
            }
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }


    #region Cantidad de Planes
    public static string CuadroComisiones(string cod_docum, string cod_conv, DropDownList cmb)
    {
        DataSet cant = null;
        Cotiza_DB objCantidad = new Cotiza_DB();
        try
        {
            using (OracleConnection Conexion = MConexion.getConexion("OVDES"))
            {
                cant = objCantidad.CuadroComisiones_DB(cod_docum, cod_conv, Conexion);

                string mca_cuadros = cant.Tables[1].Rows[0][0].ToString();

                if (mca_cuadros == "S")
                {
                    cmb.DataSource = cant;
                    cmb.DataTextField = "PORC_COM";
                    cmb.DataValueField = "COD_CUADRO_COM";
                    cmb.DataBind();
                    //cmb.Items.Insert(0, new ListItem("Seleccionar", "0"));
                    //cmb.SelectedIndex = 3;
                    //cmb.SelectedItem.Text = "15%";

                    cant.Dispose();

                    for (int i = 0; i < cmb.Items.Count; i++)
                    {
                        if (cmb.Items[0].Value == "410")
                            cmb.SelectedIndex = i;
                    }

                }

                return mca_cuadros;
            }
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }

    }
    #endregion

    public static DataRow CalcularComision(string cod_modalidad, string cod_docum, string cod_conv, string cod_cuadro_com, decimal prima_neta, string desc, string cod_ramo)
    {
        DataRow cotizacion = null;
        Cotiza_DB objcotiza = new Cotiza_DB();

        try
        {
            using (OracleConnection Conexion = MConexion.getConexion("OVDES"))
            {
                cotizacion = objcotiza.CalcularComision_DB(Convert.ToInt32(cod_modalidad), cod_docum, cod_conv, cod_cuadro_com, prima_neta, desc, cod_ramo, Conexion);
                return cotizacion;
            }
        }

        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }

    public static DataRow GrabaComision(string num_cotizacion, string cod_cuadro_com)
    {
        DataRow cotizacion = null;
        Cotiza_DB objcotiza = new Cotiza_DB();

        try
        {
            using (OracleConnection Conexion = MConexion.getConexion("OVDES"))
            {
                cotizacion = objcotiza.GrabaComision_DB(num_cotizacion, cod_cuadro_com, Conexion);
                return cotizacion;
            }
        }

        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }

    public static DataRow ValidaMcaMel(string cod_docum, string cod_conv)
    {
        DataRow cant = null;
        Cotiza_DB objOpciones = new Cotiza_DB();

        try
        {
            using (OracleConnection Conexion = MConexion.getConexion("OVDES"))
            {
                cant = objOpciones.ValidaMcaMel_DB(cod_docum, cod_conv, Conexion);

                return cant;

            }

        }

        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }

    public static string PrimaExenta(string cod_ramo, string cod_modalidad)
    {
        DataRow primaexenta = null;
        Cotiza_DB objcotiza = new Cotiza_DB();

        try
        {
            using (OracleConnection Conexion = MConexion.getConexion("OVDES"))
            {
                primaexenta = objcotiza.PrimaExenta_DB(cod_ramo, cod_modalidad, Conexion);

                return primaexenta["P_MONTO_EXENTA"].ToString();
            }
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }

    public static void GrabaOpcionInspeccion(string num_cotizacion, string opcion)
    {
        DataRow inspeccion = null;
        Cotiza_DB objcotiza = new Cotiza_DB();

        try
        {
            using (OracleConnection Conexion = MConexion.getConexion("OVDES"))
            {
                inspeccion = objcotiza.GrabaOpcionInspeccion_DB(num_cotizacion, opcion, Conexion);
            }
        }

        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }

    }

    public static string PerdidaTotal(string num_matricula)
    {
        DataRow modalidad = null;
        Cotiza_DB objcotiza = new Cotiza_DB();

        try
        {
            using (OracleConnection Conexion = MConexion.getConexion("OVDES"))
            {
                modalidad = objcotiza.PerdidaTotal_DB(num_matricula, Conexion);

                return modalidad["p_perdida_total"].ToString();
            }
        }

        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }

    }

    public static string UpdateRamoSubModelo(string num_cotizacion, string cod_marca, string cod_modelo, string cod_sub_modelo)
    {
        DataRow grabavehiculo = null;
        Cotiza_DB objcotiza = new Cotiza_DB();

        try
        {
            using (OracleConnection Conexion = MConexion.getConexion("OVDES"))
            {
                grabavehiculo = objcotiza.UpdateRamoSubModelo_DB(num_cotizacion, cod_marca, cod_modelo, cod_sub_modelo, Conexion);
                return grabavehiculo["p_cod_ramo"].ToString();
            }
        }

        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }

    public static DataRow LlamaDataBussines(string cod_cia, string cod_ramo, string cod_conv, string cod_docum_aseg)
    {
        DataRow databussines = null;
        Cotiza_DB objcotiza = new Cotiza_DB();

        try
        {
            using (OracleConnection Conexion = MConexion.getConexion("OVDES"))
            {
                databussines = objcotiza.LlamaDataBussines_DB(cod_cia, cod_ramo, cod_conv, cod_docum_aseg, Conexion);
                return databussines;
            }
        }

        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }

    public static DataSet TodosLosPlanes(string cod_conv)
    {
        DataSet cant = null;
        Cotiza_DB objCantidad = new Cotiza_DB();

        try
        {
            using (OracleConnection Conexion = MConexion.getConexion("OVDES"))
            {
                cant = objCantidad.TodosLosPlanes_DB(cod_conv, Conexion);

                return cant;

            }

        }

        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }

    }

    public static DataRow updCotizacionSiniestros(string num_cotizacion, string cant_siniestros, string monto_siniestros)
    {
        DataRow updcotizacion = null;
        Cotiza_DB objcotiza = new Cotiza_DB();

        try
        {
            using (OracleConnection Conexion = MConexion.getConexion("OVDES"))
            {
                updcotizacion = objcotiza.updCotizacionSiniestros_DB(num_cotizacion, cant_siniestros, monto_siniestros, Conexion);
                return updcotizacion;
            }
        }

        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }

    public static string CalcularSinComision(string cod_modalidad, string cod_docum, string cod_conv, string cod_cuadro_com, string prima_neta, string desc, string cod_ramo)
    {
        DataRow cotizacion = null;
        Cotiza_DB objcotiza = new Cotiza_DB();

        try
        {
            using (OracleConnection Conexion = MConexion.getConexion("OVDES"))
            {
                cotizacion = objcotiza.CalcularSinComision_DB(Convert.ToInt32(cod_modalidad), cod_docum, cod_conv, cod_cuadro_com, prima_neta, desc, cod_ramo, Conexion);
                return cotizacion["P_PRIMA_NETA_SIN_CUADRO"].ToString();
            }
        }

        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }

    public static bool ValidaCambioComision(string num_cotizacion, string cod_cuadro_com_nuevo)
    {
        DataRow comision = null;
        Cotiza_DB objcomision = new Cotiza_DB();

        try
        {
            using (OracleConnection Conexion = MConexion.getConexion("OVDES"))
            {
                comision = objcomision.ValidaCambioComision_DB(num_cotizacion, cod_cuadro_com_nuevo, Conexion);
                if (comision["p_respuesta"].ToString() == "OK")
                    return true;
                else
                    return false;
            }
        }

        catch (Exception ex)
        {
            return false;
        }
    }

    public static bool RegistraPregCotizacion(int cod_cia,int cod_ramo,string desc_pregunta,string respuesta,string num_cotizacion,string num_poliza)
    {
        DataRow valida = null;
        Cotiza_DB objcomision = new Cotiza_DB();

        try
        {
            using (OracleConnection Conexion = MConexion.getConexion("OF0"))
            {
                valida = objcomision.RegistraPregCotizacion_DB(cod_cia,
                                                            cod_ramo,
                                                            desc_pregunta,
                                                            respuesta,
                                                            num_cotizacion,
                                                            num_poliza,
                                                            Conexion);
                if (valida["P_ERROR"].ToString() == "")
                    return true;
                else
                    return false;
            }
        }

        catch (Exception ex)
        {
            return false;
        }
    }

    public static bool actualizaPregVeh(string num_cotizacion,string hijos,string franquicia,string danospre)
    {
        DataRow valida = null;
        Cotiza_DB objcomision = new Cotiza_DB();

        try
        {
            using (OracleConnection Conexion = MConexion.getConexion("OVDES"))
            {
                valida = objcomision.actualizaPregVeh_DB(num_cotizacion,
                                                            hijos,
                                                            franquicia,
                                                            danospre,
                                                            Conexion);
                if (valida["P_ERROR"].ToString() == "")
                    return true;
                else
                    return false;
            }
        }

        catch (Exception ex)
        {
            return false;
        }
    }

    public static string validaControlTecnico(string num_poliza)
    {
        DataRow valida = null;
        Cotiza_DB objcomision = new Cotiza_DB();

        try
        {
            using (OracleConnection Conexion = MConexion.getConexion("OVDES"))
            {
                valida = objcomision.validaControlTecnico_DB(num_poliza,
                                                            Conexion);
                return valida["P_ERROR"].ToString();
            }
        }

        catch (Exception ex)
        {
            return "";
        }
    }

    //#CCE
    public static DataRow GrabaTabladeDesctoPAT(string Cotizacion, string Descuento, string PrimaNeta, string PrimaNetaPAT, string OpcionPago, string PrimaBruta, string PrimaBrutaPAT)
    {
        MCommand objComando = new MCommand();

        try
        {
            using (OracleConnection cnx = MConexion.getConexion("OVDES"))
            {
                objComando.Connection = cnx;
                objComando.CommandText = "P_GRABA_DESCUENTO_PAT";

                objComando.agregarINParametro("P_NUM_COTIZACION", OracleDbType.Varchar2, Cotizacion);
                objComando.agregarINParametro("P_DESCUENTO_PAT", OracleDbType.Varchar2, Descuento);
                objComando.agregarINParametro("P_PRIMA_NETA", OracleDbType.Varchar2, PrimaNeta);
                objComando.agregarINParametro("P_PRIMA_NETA_DESCTO", OracleDbType.Varchar2, PrimaNetaPAT);
                objComando.agregarINParametro("P_OPCION_PAGO", OracleDbType.Varchar2, OpcionPago);
                objComando.agregarINParametro("P_PRIMA_BRUTA", OracleDbType.Varchar2, PrimaBruta);
                objComando.agregarINParametro("P_PRIMA_BRUTA_DESCTO", OracleDbType.Varchar2, PrimaBrutaPAT);

                objComando.agregarOUTParametro("P_ERROR", OracleDbType.Varchar2, 255);

                return objComando.ejecutarRegistroSP();
            }
        }

        catch (Exception ex)
        {
            throw new Exception("ERROR Cotizar.GrabaTabladeDesctoPAT : " + ex.Message);
        }
    }

    // ========================================================================================

    public static DataRow GetDescto_PAT(string cod_cotizacion)
    {
        MCommand objComando = new MCommand();
        DataRow dr = null;
        OracleConnection cnx = MConexion.getConexion("OVDES");

        try
        {
            objComando.Connection = cnx;
            objComando.CommandText = "P_BUSCA_DCTO_PAT_CC";

            objComando.agregarINParametro("P_NUM_COTIZACION", OracleDbType.Varchar2, cod_cotizacion);
            objComando.agregarOUTParametro("P_REGISTROS", OracleDbType.RefCursor, 0);
            objComando.agregarOUTParametro("P_ERROR", OracleDbType.Varchar2, 255);

            DataSet ds = objComando.ejecutarRefCursorSP();

            if (ds.Tables[0].Rows.Count > 0)
            {
                dr = ds.Tables[0].Rows[0];
            }

            return dr;
        }

        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }

    // ========================================================================================

    public static DataRow UpdatePrimaNeta(string num_cotizacion, string prima_neta, string prima_bruta)
    {
        MCommand objComando = new MCommand();
        prima_neta = prima_neta.Replace(",", ".");

        try
        {
            using (OracleConnection cnx = MConexion.getConexion("OVDES"))
            {
                objComando.Connection = cnx;
                objComando.CommandText = "P_UPD_PRIMA_NETA_VEH";

                objComando.agregarINParametro("P_NUM_COTIZACION", OracleDbType.Varchar2, num_cotizacion);
                objComando.agregarINParametro("P_PRIMA_NETA", OracleDbType.Varchar2, prima_neta);
                objComando.agregarINParametro("P_PRIMA_BRUTA", OracleDbType.Varchar2, prima_bruta);
                objComando.agregarOUTParametro("P_ERROR", OracleDbType.Varchar2, 255);

                return objComando.ejecutarRegistroSP();
            }
        }

        catch (Exception ex)
        {
            throw new Exception("ERROR Cotizar.UpdatePrimaNeta : " + ex.Message);
            Logs.writeToLogFile("ERROR Cotizar.UpdatePrimaNeta : " + ex.Message);
        }
    }


    public static DataRow UpdateCabeceraInspeccion(string num_inspeccion, string num_poliza)
    {
        MCommand objComando = new MCommand();

        try
        {
            using (OracleConnection cnx = MConexion.getConexion("OVDES"))
            {
                objComando.Connection = cnx;
                objComando.CommandText = "MEL_K_VEHICULO.P_UPD_REGISTRO_CABECERA";

                objComando.agregarINParametro("P_NUM_INSPEC", OracleDbType.Varchar2, num_inspeccion);
                objComando.agregarINParametro("P_POLIZA", OracleDbType.Varchar2, num_poliza);
                objComando.agregarOUTParametro("P_ERROR", OracleDbType.Varchar2, 255);

                return objComando.ejecutarRegistroSP();
            }
        }

        catch (Exception ex)
        {
            throw new Exception("ERROR Cotizar.UpdateCabeceraInspeccion : " + ex.Message);
            Logs.writeToLogFile("ERROR Cotizar.UpdateCabeceraInspeccion : " + ex.Message);
        }
    }

    //#CCE

    public static DataRow ValidaInspeccionMotor(string num_motor, string cod_docum, string cod_ramo, string convenio)
    {
        DataRow inspeccion = null;
        Cotiza_DB objcotiza = new Cotiza_DB();

        try
        {
            using (OracleConnection Conexion = MConexion.getConexion("OVDES"))
            {
                inspeccion = objcotiza.ValidaInspeccionMotor_DB(num_motor, cod_docum, cod_ramo, convenio, Conexion);
                return inspeccion;
            }
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }

    //INTEGRACION CAMPAÑA COMERCIAL 
    public static DataRow DsctoVenta_cruzada(string cod_ramo, string CodDocumAseg)
    {
        DataRow data = null;
        Cotiza_DB objcotiza = new Cotiza_DB();

        try
        {
            using (OracleConnection Conexion = MConexion.getConexion("OVDES"))
            {
                data = objcotiza.DsctoVenta_cruzada_DB(CodDocumAseg, cod_ramo, Conexion);
                return data;
            }
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }

    public static DataRow DsctoFamiliar(string cod_ramo, string CodDocumFamiliar)
    {
        DataRow data = null;
        Cotiza_DB objcotiza = new Cotiza_DB();

        try
        {
            using (OracleConnection Conexion = MConexion.getConexion("OVDES"))
            {
                data = objcotiza.DsctoFamiliar_DB(CodDocumFamiliar, cod_ramo, Conexion);
                return data;
            }
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }

    public static DataRow DsctoAgendaVencida(string cod_ramo, string num_matricula, string rutCodDocumAseg)
    {
        DataRow data = null;
        Cotiza_DB objcotiza = new Cotiza_DB();

        try
        {
            using (OracleConnection Conexion = MConexion.getConexion("OVDES"))
            {
                data = objcotiza.DsctoAgendaVencida_DB(num_matricula, cod_ramo,rutCodDocumAseg, Conexion );
                return data;
            }
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }

    public static DataRow GuardaDetalleDescuentos(String NUM_COTIZACION, Decimal P_DSCTO_FAM, Decimal P_DSCTO_AGEVEN, Decimal P_DSCTO_VENCRUZ, Decimal P_PRIMA_BRUTA, Decimal P_SUMA_DSCTOS, Decimal P_TOTAL_DSCTO_UF, Decimal P_PRIMA_CON_DSCTO)
    {
        DataRow data = null;
        Cotiza_DB objcotiza = new Cotiza_DB();

        try
        {
            using (OracleConnection Conexion = MConexion.getConexion("OVDES"))
            {
                data = objcotiza.GuardaDetalleDescuentos_DB(NUM_COTIZACION, P_DSCTO_FAM, P_DSCTO_AGEVEN, P_DSCTO_VENCRUZ, P_PRIMA_BRUTA, P_SUMA_DSCTOS, P_TOTAL_DSCTO_UF, P_PRIMA_CON_DSCTO, Conexion);
                return data;
            }
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }

    public static DataRow GetTopeDescuento(string cod_ramo)
    {
        DataRow data = null;
        Cotiza_DB objcotiza = new Cotiza_DB();

        try
        {
            using (OracleConnection Conexion = MConexion.getConexion("OVDES"))
            {
                data = objcotiza.GetTopeDescuento_DB(cod_ramo, Conexion);
                return data;
            }
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }

    public static DataRow DsctoPAT(string cod_ramo)
    {
        DataRow data = null;
        Cotiza_DB objcotiza = new Cotiza_DB();

        try
        {
            using (OracleConnection Conexion = MConexion.getConexion("OVDES"))
            {
                data = objcotiza.DsctoPAT_DB(cod_ramo, Conexion);
                return data;
            }
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }

    public static bool UpdateDetalleDescuentos(String NUM_COTIZACION, Decimal? P_DSCTO_FAM, Decimal? P_DSCTO_AGEVEN, Decimal? P_DSCTO_VENCRUZ, Decimal? P_DSCTO_PATCONT, Decimal? P_PRIMA_BRUTA, Decimal P_SUMA_DSCTOS, Decimal P_TOTAL_DSCTO_UF, Decimal P_PRIMA_CON_DSCTO)
    {
        Cotiza_DB objcotiza = new Cotiza_DB();
        try
        {
            using (OracleConnection cnx = MConexion.getConexion("OVDES"))
            {

                return objcotiza.UpdateDetalleDescuentos(NUM_COTIZACION, P_DSCTO_FAM, P_DSCTO_AGEVEN, P_DSCTO_VENCRUZ, P_DSCTO_PATCONT, P_PRIMA_BRUTA, P_SUMA_DSCTOS,P_TOTAL_DSCTO_UF,P_PRIMA_CON_DSCTO, cnx);

            }
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }

    }

    public static DataSet GettDetalleDescuentos(string num_cotizacion)
    {
        Cotiza_DB objcotiza = new Cotiza_DB();
        DataSet ds = new DataSet();
        try
        {
            using (OracleConnection cnx = MConexion.getConexion("OVDES"))
            {

                ds = objcotiza.getDetalleDescuentos(cnx, num_cotizacion);

            }
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
        return ds;
    }

    //FIN INTEGRACION CAMPAÑA COMERCIAL

    public static string validaTipoAgente(string cod_docum)
    {
        DataRow valida = null;
        Cotiza_DB objcomision = new Cotiza_DB();

        try
        {
            using (OracleConnection Conexion = MConexion.getConexion("OVDES"))
            {
                valida = objcomision.validaTipoAgente_DB(cod_docum, Conexion);
                return valida["P_TIP_AGT"].ToString();
            }
        }

        catch (Exception ex)
        {
            return "";
        }
    }

    public static DataRow GetTopeDescuentoagt(string cod_ramo, string cod_docum_agt)
    {
        DataRow data = null;
        Cotiza_DB objcotiza = new Cotiza_DB();

        try
        {
            using (OracleConnection Conexion = MConexion.getConexion("OVDES"))
            {
                data = objcotiza.GetTopeDescuentoAgt_DB(cod_ramo, cod_docum_agt, Conexion);
                return data;
            }
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }

    public static DataRow VerificaPatenteTabla(string p_cod_cia, string p_matricula)
    {
        DataRow Verifica_Patente = null;
        Cotiza_DB objcotiza = new Cotiza_DB();

        try
        {
            using (OracleConnection Conexion = MConexion.getConexion("OVDES"))
            {
                Verifica_Patente = objcotiza.VerificaPatenteTabla_DB(p_cod_cia, p_matricula, Conexion);
                return Verifica_Patente;
            }
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }
    
    public static DataRow GuardaRegistroRemate_DB(string P_MENSAJE, string P_COD_CIA, string P_MATRICULA, string fechaOperacion)
    {
        DataRow cotizacion = null;
        Cotiza_DB objcotiza = new Cotiza_DB();

        try
        {
            using (OracleConnection Conexion = MConexion.getConexion("OVDES"))
            {
                cotizacion = objcotiza.GuardaRegistroRemate_DB(P_MENSAJE,P_COD_CIA,P_MATRICULA,fechaOperacion, Conexion);
                return cotizacion;
            }
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }

}
