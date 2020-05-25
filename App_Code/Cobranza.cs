using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using MapfreMCL.oracle;
using Oracle.DataAccess.Client;

/// <summary>
/// Summary description for Cobranza
/// </summary>
public class Cobranza
{
    public static DataRow ValorCuota(decimal prima, string tip_cuota, string num_cuotas, decimal descuento, string cod_ramo, string dia_pago)
    {
        DataRow cuota = null;
        Cobranza_DB objcobranza = new Cobranza_DB();

        try
        {
            using (OracleConnection Conexion = MConexion.getConexion("OVDES"))
            {
                cuota = objcobranza.ValorCuota_DB(cod_ramo, prima, descuento, Convert.ToInt32(num_cuotas), tip_cuota, dia_pago, Conexion);
                return cuota;
            }
        }

        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }

    public static DataRow ValorCuotaSinInteres(string prima, string num_cuotas)
    {
        DataRow cuota = null;
        Cobranza_DB objcobranza = new Cobranza_DB();

        try
        {
            using (OracleConnection Conexion = MConexion.getConexion("OVDES"))
            {
                cuota = objcobranza.ValorCuotaSinInteres_DB(prima, Convert.ToInt32(num_cuotas), Conexion);
                return cuota;
            }
        }

        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }

    public static string CalculaCuota(string primatotal, string tip_cuota, string num_cuotas, string descuento, string cod_ramo, string dia_pago)
    {

        System.Globalization.NumberFormatInfo nfi = new
        System.Globalization.NumberFormatInfo();
        nfi.NumberGroupSeparator = ",";

        decimal primatotal_d = Convert.ToDecimal(primatotal.Replace(",", "."), nfi);
        decimal descuento_d = Convert.ToDecimal(descuento.Replace(",", "."), nfi);

        DataRow cuotas = ValorCuota(primatotal_d, tip_cuota, num_cuotas, descuento_d, cod_ramo, dia_pago);

        decimal cuota_minima = Convert.ToDecimal(ConfigurationManager.AppSettings["CuotaMinima"].ToString().Replace(",","."),nfi);

        decimal cuota = Convert.ToDecimal(cuotas["P_VALOR_CUOTA"].ToString().Replace(",","."),nfi);

        string valcuota;

        if (cuota < cuota_minima)        
            valcuota = "---";        
        else
            valcuota = cuotas["P_VALOR_CUOTA"].ToString();

        return valcuota;

    }

    public static string CalculaCuotaSinInteres(string primatotal, string num_cuotas)
    {
        System.Globalization.NumberFormatInfo nfi = new
        System.Globalization.NumberFormatInfo();
        nfi.NumberGroupSeparator = ",";        
        
        DataRow cuotas = ValorCuotaSinInteres(primatotal, num_cuotas);

        decimal cuota_minima = Convert.ToDecimal(ConfigurationManager.AppSettings["CuotaMinima"].ToString().Replace(",", "."),nfi);

        decimal cuota = Convert.ToDecimal(cuotas["P_VALOR_CUOTA"].ToString().Replace(",", "."),nfi);

        string valcuota;

        if (cuota < cuota_minima)
            valcuota = "---";
        else
            valcuota = cuotas["P_VALOR_CUOTA"].ToString();

        return valcuota;

    }

    public static void PlanesPago(DropDownList cmb)
    {
        try
        {
            using (OracleConnection Conexion = MConexion.getConexion("OF0"))
            {

                Cobranza_DB objCotizador = new Cobranza_DB();

                cmb.DataSource = objCotizador.PlanesPago_DB(1, Conexion);
                cmb.DataTextField = "NOM_FRACC_PAGO";
                cmb.DataValueField = "NUM_CUOTAS";
                cmb.DataBind();                
                //cmb.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Seleccionar", "0"));
            }

        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }

     public static void PlanesPagoRipley(DropDownList cmb)
    {
        try
        {
            using (OracleConnection Conexion = MConexion.getConexion("OVDES"))
            {

                Cobranza_DB objCotizador = new Cobranza_DB();

                cmb.DataSource = objCotizador.PlanesPagoRipley_DB(1, Conexion);
                cmb.DataTextField = "NOM_FRACC_PAGO";
                cmb.DataValueField = "NUM_CUOTAS";
                cmb.DataBind();
                //cmb.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Seleccionar", "0"));
            }

        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }

	public static void PlanesPagoCompara(DropDownList cmb,string tip_pago)
     {
         try
         {
             using (OracleConnection Conexion = MConexion.getConexion("OVDES"))
             {

                 Cobranza_DB objCotizador = new Cobranza_DB();

                 cmb.DataSource = objCotizador.PlanesPagoCompara_DB(1,tip_pago, Conexion);
                 cmb.DataTextField = "NOM_FRACC_PAGO";
                 cmb.DataValueField = "NUM_CUOTAS";
                 cmb.DataBind();
                 //cmb.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Seleccionar", "0"));
             }

         }
         catch (Exception ex)
         {
             throw new Exception(ex.Message);
         }
     }
    
    public static void MarcaTarjetas(DropDownList cmb)
    {
        try
        {
            using (OracleConnection Conexion = MConexion.getConexion("OVDES"))
            {
                Cobranza_DB objCotizador = new Cobranza_DB();

                cmb.DataSource = objCotizador.MarcaTarjetas_DB(Conexion);
                cmb.DataTextField = "NOM_TARJETA";
                cmb.DataTextField = cmb.DataTextField.ToUpper();
                cmb.DataValueField = "TIP_TARJETA";
                cmb.DataBind();
                cmb.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Seleccionar", "0"));
            }

        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }

    public static void Tarjetas(DropDownList cmb, string tip_tarjeta)
    {
        try
        {
            using (OracleConnection Conexion = MConexion.getConexion("OVDES"))
            {
                Cobranza_DB objCotizador = new Cobranza_DB();

                cmb.DataSource = objCotizador.Tarjetas_DB(Conexion, tip_tarjeta);
                cmb.DataTextField = "NOM_TARJETA";
                cmb.DataTextField = cmb.DataTextField.ToUpper();
                cmb.DataValueField = "COD_TARJETA";
                cmb.DataBind();
                cmb.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Seleccionar", "0"));
            }

        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }    

    public static string DiaPago(string cod_docum)
    {
        DataRow diapago = null;
        Cobranza_DB objcobranza = new Cobranza_DB();

        try
        {
            using (OracleConnection Conexion = MConexion.getConexion("OVDES"))
            {
                diapago = objcobranza.DiaPago_DB(cod_docum, Conexion);

                return diapago["p_dia_pago"].ToString();
            }
        }

        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }

    }

    public static decimal IVA()
    {
        DataRow diapago = null;
        Cobranza_DB objcobranza = new Cobranza_DB();

        try
        {
            using (OracleConnection Conexion = MConexion.getConexion("OVDES"))
            {
                diapago = objcobranza.IVA_DB(Conexion);

                System.Globalization.NumberFormatInfo nfi = new
                System.Globalization.NumberFormatInfo();
                nfi.NumberGroupSeparator = ",";
              
                return Convert.ToDecimal(diapago["ivas"].ToString(),nfi);                
            }
        }

        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }

    }

    public static void PlanesPagoConvenio(DropDownList cmb, string cod_cia, string cod_ramo, string tip_pago, string cod_agt, string cod_convenio)
    {
        try
        {
            using (OracleConnection Conexion = MConexion.getConexion("OVDES"))
            {

                Cobranza_DB objCotizador = new Cobranza_DB();

                cmb.DataSource = objCotizador.PlanesPagoConvenio_DB(cod_cia, cod_ramo, tip_pago, cod_agt, cod_convenio, Conexion);
                cmb.DataTextField = "NOM_FRACC_PAGO";
                cmb.DataValueField = "NUM_CUOTAS";
                cmb.DataBind();
            }

        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }

    // #CCE
    public static string DesctoPAT()
    {
        OracleCommand cmd = new OracleCommand();
        using (OracleConnection cnx = MConexion.getConexion("OVDES"))
        {
            try
            {
                cmd.Connection = cnx;
                cmd.CommandText = "f_get_parametros";
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("result", OracleDbType.Varchar2, 128);
                cmd.Parameters["result"].Direction = ParameterDirection.ReturnValue;

                cmd.Parameters.Add("p_nombre", OracleDbType.Varchar2);
                cmd.Parameters["p_nombre"].Value = "DSCTO_VEH_PAT";

                cmd.ExecuteNonQuery();
                string valor = cmd.Parameters["result"].Value.ToString();
                return valor;
            }

            catch (Exception ex)
            {
                throw new Exception("ERROR Cobranza.cs / DesctoPAT : " + ex.Message);
            }
        }
    }
    // #CCE


}
