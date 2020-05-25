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
/// Summary description for Vehiculo
/// </summary>
public class Vehiculo
{
    public static void Carga_Marcas(DropDownList cmb)
    {
        try
        {
            using (OracleConnection cnx = MConexion.getConexion("OF0"))
            {
                Vehiculo_DB objdb = new Vehiculo_DB();
                DataSet ds = objdb.getMarcas(cnx, null);

                cmb.DataSource = ds;
                cmb.DataTextField = "NOM_MARCA";
                cmb.DataValueField = "COD_MARCA";
                cmb.DataBind();
                cmb.Items.Insert(0, new ListItem("Seleccionar", "0"));
                cmb.SelectedIndex = 0;

                ds.Dispose();
            }
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }

    public static void Combo_Modelos(DropDownList cmb, string cod_marca)
    {
        try
        {
            using (OracleConnection cnx = MConexion.getConexion("OF0"))
            {
                Vehiculo_DB objdb = new Vehiculo_DB();
                DataSet ds = objdb.getModelos(cnx, cod_marca);

                cmb.DataSource = ds;
                cmb.DataTextField = "NOM_MODELO";
                cmb.DataValueField = "COD_MODELO";
                cmb.DataBind();
                cmb.Items.Insert(0, new ListItem("Seleccionar", "0"));
                cmb.SelectedIndex = 0;

                ds.Dispose();
            }
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }

    public static void Combo_SubModelos(DropDownList cmb, string cod_marca,string cod_modelo)
    {
        try
        {
            using (OracleConnection cnx = MConexion.getConexion("OF0"))
            {
                Vehiculo_DB objdb = new Vehiculo_DB();
                DataSet ds = objdb.getSubModelos(cnx, cod_marca, cod_modelo);

                cmb.DataSource = ds;
                cmb.DataTextField = "NOM_SUB_MODELO";
                cmb.DataValueField = "COD_SUB_MODELO";
                cmb.DataBind();
                cmb.Items.Insert(0, new ListItem("Seleccionar", "0"));
                cmb.SelectedIndex = 0;

                ds.Dispose();
            }
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }

    public static void Combo_Colores(DropDownList cmb)
    {
        try
        {
            using (OracleConnection cnx = MConexion.getConexion("OF0"))
            {
                Vehiculo_DB objdb = new Vehiculo_DB();
                DataSet ds = objdb.getColores(cnx);

                cmb.DataSource = ds;
                cmb.DataTextField = "NOM_COLOR";
                cmb.DataValueField = "COD_COLOR";
                cmb.DataBind();
                cmb.Items.Insert(0, new ListItem("Seleccionar", "0"));
                cmb.SelectedIndex = 0;

                ds.Dispose();
            }
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }  

    #region Devuelve los datos del vehiculo segun la patente
    public static DataRow DatosVeh(string num_matricula)
    {
        try
        {

            using (OracleConnection Conexion = MConexion.getConexion("OVDES"))
            {
                Vehiculo_DB objdb = new Vehiculo_DB();

                DataRow objdatos_veh = objdb.DatosVeh_DB(num_matricula, Conexion);

                return objdatos_veh;

            }
        }

        catch (Exception ex)
        {

            throw new Exception(ex.Message);

        }
    }

    public static DataRow DatosVehID(string ID)
    {
        try
        {

            using (OracleConnection Conexion = MConexion.getConexion("OVDES"))
            {
                Vehiculo_DB objdb = new Vehiculo_DB();

                DataRow objdatos_veh = objdb.DatosVeh_ID_DB(ID, Conexion);

                return objdatos_veh;

            }
        }

        catch (Exception ex)
        {

            throw new Exception(ex.Message);

        }
    }
    #endregion

    public static void GuardaDatosVehEmision(string ID, string COD_COLOR, string NRO_MOTOR, string NRO_CHASIS)
    {
        try
        {

            using (OracleConnection Conexion = MConexion.getConexion("OVDES"))
            {
                Vehiculo_DB objdb = new Vehiculo_DB();

                DataRow objdatos_veh = objdb.GuardaDatosVehEmision_DB(ID, COD_COLOR, NRO_MOTOR, NRO_CHASIS, Conexion);                

            }
        }

        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }

    public static void Combo_Partes_Veh(DropDownList cmb1, DropDownList cmb2)
    {
        try
        {
            using (OracleConnection cnx = MConexion.getConexion("OF0"))
            {
                Vehiculo_DB objdb = new Vehiculo_DB();
                DataSet ds = objdb.getPartesVeh(cnx);

                //cmb1.DataSource = ds.Tables[0];
                //cmb1.DataTextField = "PARTE";
                //cmb1.DataValueField = "COD_PARTE";
                //cmb1.DataBind();
                //cmb1.Items.Insert(0, new ListItem("Seleccionar", "0"));
                //cmb1.SelectedIndex = 0;

                DataTable dt = ds.Tables[0];

                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    cmb1.Items.Add(new ListItem(dt.Rows[i]["PARTE"].ToString(), dt.Rows[i]["COD_PARTE"].ToString() + "_" + dt.Rows[i]["COD_SUB_PARTE"].ToString()));
                }
                cmb1.Items.Insert(0, new ListItem("Seleccionar", "0"));
                cmb1.SelectedIndex = 0;

                /*******/
                
                cmb2.DataSource = ds.Tables[1];
                cmb2.DataTextField = "NOM_DANO";
                cmb2.DataValueField = "COD_DANO";
                cmb2.DataBind();
                cmb2.Items.Insert(0, new ListItem("Seleccionar", "0"));
                cmb2.SelectedIndex = 0;

                ds.Dispose();

            }
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }

    }

    public static void Combo_Accesorios(DropDownList cmb)
    {
        try
        {
            using (OracleConnection cnx = MConexion.getConexion("OVDES"))
            {
                Vehiculo_DB objdb = new Vehiculo_DB();
                DataSet ds = objdb.getAccesorios(cnx);

                cmb.DataSource = ds;
                cmb.DataTextField = "NOM_ACCESORIO";
                cmb.DataValueField = "COD_ACCESORIO";
                cmb.DataBind();
                cmb.Items.Insert(0, new ListItem("Seleccionar", "0"));
                cmb.SelectedIndex = 0;

                ds.Dispose();



            }
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }

    }

    public static string GuardaDatosInspeccion(string p_num_cotizacion, string p_datos_tercero, string p_datos_vehiculo, string p_datos_inspeccionDP, string p_datos_inspeccionAcc)
    {
        try
        {

            using (OracleConnection Conexion = MConexion.getConexion("OVDES"))
            {
                Vehiculo_DB objdb = new Vehiculo_DB();

                DataRow objdatos_veh = objdb.GuardaDatosInspeccion_DB(p_num_cotizacion, p_datos_tercero, p_datos_vehiculo, p_datos_inspeccionDP, p_datos_inspeccionAcc, Conexion);

                return objdatos_veh["p_error"].ToString();

            }
        }

        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }

    public static string TraeNomTipVehi(string cod_marca, string cod_modelo, string cod_sub_modelo)
    {
        try
        {
            using (OracleConnection Conexion = MConexion.getConexion("OVDES"))
            {
                Vehiculo_DB objdb = new Vehiculo_DB();

                DataRow objdatos_veh = objdb.TraeNomTipVehi_DB(cod_marca, cod_modelo, cod_sub_modelo, Conexion);

                return objdatos_veh["p_nom_tip_vehi"].ToString();

            }
        }

        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }

    public static void GuardaDatosInspeccionBSP(string num_cotizacion, string num_matricula, string nombre_contacto,string direccion_contacto, string cod_region_contacto, string cod_ciudad_contacto, string cod_comuna_contacto,string fono_contacto, string celular_contacto,string observaciones_contacto, string nom_aseg, string cod_area)
    {
        try
        {

            using (OracleConnection Conexion = MConexion.getConexion("OVDES"))
            {
                Vehiculo_DB objdb = new Vehiculo_DB();

                DataRow objdatos_veh = objdb.GuardaDatosInspeccionBSP_DB( num_cotizacion, num_matricula,  nombre_contacto, direccion_contacto,  cod_region_contacto,  cod_ciudad_contacto,  cod_comuna_contacto, fono_contacto,  celular_contacto, observaciones_contacto, nom_aseg, cod_area,  Conexion);

                //return objdatos_veh["p_error"].ToString();

            }
        }

        catch (Exception ex)
        {
            //throw new Exception(ex.Message);
        }
    }

    public static void GuardaDatosFactura(string num_cotizacion, string num_factura, string fec_factura, string cod_docum_factura, string nom_factura)
    {
        try
        {

            using (OracleConnection Conexion = MConexion.getConexion("OVDES"))
            {
                Vehiculo_DB objdb = new Vehiculo_DB();

                DataRow objdatos_veh = objdb.GuardaDatosFactura_DB(num_cotizacion, num_factura, fec_factura, cod_docum_factura, nom_factura, Conexion);
            }
        }

        catch (Exception ex)
        {
            //throw new Exception(ex.Message);
        }
    }

    public static decimal PrimaExenta(string cod_modalidad, string cod_ramo)
    {
        DataRow prima_exenta = null;
        Vehiculo_DB objdb = new Vehiculo_DB();

        try
        {
            using (OracleConnection Conexion = MConexion.getConexion("OVDES"))
            {
                prima_exenta = objdb.PrimaExenta_DB(cod_modalidad, cod_ramo, Conexion);

                System.Globalization.NumberFormatInfo nfi = new
                System.Globalization.NumberFormatInfo();
                nfi.NumberGroupSeparator = ",";


                return Convert.ToDecimal(prima_exenta["p_monto_exenta"].ToString(),nfi);
            }
        }

        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }

    }

    public static void getDescuentosOpcionales(DropDownList cmb1, string cod_docum)
    {
        try
        {
            using (OracleConnection cnx = MConexion.getConexion("OVDES"))
            {
                Vehiculo_DB objdb = new Vehiculo_DB();
                DataSet ds = objdb.getDescuentosOpcionales_DB(cod_docum, "801", cnx);

                DataTable dt = ds.Tables[0];

                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    cmb1.Items.Add(new ListItem(dt.Rows[i]["PORC"].ToString(), dt.Rows[i]["COD_DESCUENTO"].ToString()));
                }
                cmb1.Items.Insert(0, new ListItem("0", "0"));
                cmb1.SelectedIndex = 0;                

                ds.Dispose();

            }
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }

    public static string ValidaDescuentosOpcionales(string cod_docum)
    {
        try
        {
            using (OracleConnection cnx = MConexion.getConexion("OVDES"))
            {
                Vehiculo_DB objdb = new Vehiculo_DB();
                DataSet ds = objdb.getDescuentosOpcionales_DB(cod_docum, "801", cnx);

                DataTable dt = ds.Tables[0];

                if (dt.Rows.Count >= 1)
                    return "S";
                else
                    return "N";
                ds.Dispose();

            }
        }
        catch (Exception ex)
        {
            return "N";
        }
    }

    public static void GrabaDescuentoOpc(string cod_descuento, string num_cotizacion)
    {
        DataRow descuento = null;
        Vehiculo_DB objdb = new Vehiculo_DB();

        try
        {
            using (OracleConnection Conexion = MConexion.getConexion("OVDES"))
            {
                descuento = objdb.GrabaDescuentoOpc_DB(cod_descuento, num_cotizacion, Conexion);                
            }
        }

        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }

    }

    public static string ValidaNroMotor(string nro_motor)
    {
        try
        {
            using (OracleConnection Conexion = MConexion.getConexion("OVDES"))
            {
                Vehiculo_DB objdb = new Vehiculo_DB();

                DataRow objdb_nro = objdb.ValidaNroMotor_DB(nro_motor, Conexion);

                return objdb_nro["g_existe"].ToString();
            }
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }

    public static void AutorizaInspeccionBSPWEB(string num_cotizacion)
    {
        try
        {

            using (OracleConnection Conexion = MConexion.getConexion("OVDES"))
            {
                Vehiculo_DB objdb = new Vehiculo_DB();

                DataRow objdatos_veh = objdb.AutorizaInspeccionBSPWEB_DB(num_cotizacion, Conexion);

                //return objdatos_veh["p_error"].ToString();

            }
        }

        catch (Exception ex)
        {
            //throw new Exception(ex.Message);
        }
    }

    public static void GuardaDatosInspeccionBSPWEB(string num_cotizacion, string num_matricula, string nombre_contacto, string direccion_contacto, string cod_region_contacto, string cod_ciudad_contacto, string cod_comuna_contacto, string fono_contacto, string celular_contacto, string observaciones_contacto, string nom_aseg, string cod_area)
    {
        try
        {

            using (OracleConnection Conexion = MConexion.getConexion("OVDES"))
            {
                Vehiculo_DB objdb = new Vehiculo_DB();

                DataRow objdatos_veh = objdb.GuardaDatosInspeccionBSPWeb_DB(num_cotizacion, num_matricula, nombre_contacto, direccion_contacto, cod_region_contacto, cod_ciudad_contacto, cod_comuna_contacto, fono_contacto, celular_contacto, observaciones_contacto, nom_aseg, cod_area, Conexion);

                //return objdatos_veh["p_error"].ToString();

            }
        }

        catch (Exception ex)
        {
            //throw new Exception(ex.Message);
        }
    }
}