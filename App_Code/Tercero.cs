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

public class Tercero
{
    #region Devuelve los datos del tercero
    public static DataRow DatosTercero(string cod_docum)
    {
        try
        {

            using (OracleConnection Conexion = MConexion.getConexion("OVDES"))
            {
                Tercero_DB objdb = new Tercero_DB();

                DataRow objdatos_tercero = objdb.DatosTercero_DB(cod_docum, Conexion);

                return objdatos_tercero;

            }
        }

        catch (Exception ex)
        {

            throw new Exception(ex.Message);

        }
    }
    #endregion

    #region Devuelve los datos del tercero en a1001331,a1001399
    public static DataRow DatosTerceroTronWeb(string cod_docum)
    {
        try
        {
            using (OracleConnection cnx = MConexion.getConexion("OVDES"))
            {
                Tercero_DB objdb = new Tercero_DB();

                DataTable dt = new DataTable();

                DataSet ds = objdb.DatosTerceroTronWeb_DB(cnx, cod_docum);

                dt = ds.Tables[0];
                if (dt.Rows.Count > 0) return dt.Rows[0];
                else return null;

            }
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }
    #endregion

    #region Guarda los datos del tercero
    public static DataRow GuardaTer(string cod_docum, string ape1_tercero, string ape2_tercero, string nom_tercero, string nom_direccion, int cod_region, int cod_ciudad, int cod_comuna, string tlf_pais, string tlf_zona, string tlf_numero, string mca_sexo)
    {
        try
        {
            using (OracleConnection Conexion = MConexion.getConexion("OVDES"))
            {
                Tercero_DB objdb = new Tercero_DB();

                DataRow objdatos_tercero = objdb.GuardaTer_DB(cod_docum, ape1_tercero, ape2_tercero, nom_tercero, nom_direccion, cod_region, cod_ciudad, cod_comuna, tlf_pais, tlf_zona, tlf_numero, mca_sexo, Conexion);

                return objdatos_tercero;
            }
        }

        catch (Exception ex)
        {

            throw new Exception(ex.Message);

        }
    }
    #endregion

    #region Guarda los datos del tercero Compara
    public static DataRow GuardaTerCompara(string cod_docum, string ape1_tercero, string ape2_tercero, string nom_tercero, 
                                string nom_direccion, int cod_region, int cod_ciudad, int cod_comuna, string tlf_pais, 
                                string tlf_zona, string tlf_numero, string mca_sexo, string num_movil, string email, string fecha_nac)
    {
        try
        {
            using (OracleConnection Conexion = MConexion.getConexion("OVDES"))
            {
                Tercero_DB objdb = new Tercero_DB();

                DataRow objdatos_tercero = objdb.GuardaTerCompara_DB(cod_docum, ape1_tercero, ape2_tercero, nom_tercero, nom_direccion, cod_region, cod_ciudad, cod_comuna, tlf_pais, tlf_zona, tlf_numero, mca_sexo, num_movil, email, fecha_nac, Conexion);

                return objdatos_tercero;
            }
        }

        catch (Exception ex)
        {

            throw new Exception(ex.Message);

        }
    }
    #endregion


    #region Guarda el Email del tercero
    public static DataRow GuardaEmailTer(string cod_docum, string email)
    {
        try
        {

            using (OracleConnection Conexion = MConexion.getConexion("OVDES"))
            {
                Tercero_DB objdb = new Tercero_DB();

                DataRow objdatos_tercero = objdb.GuardaEmailTer_DB(cod_docum, email, Conexion);

                return objdatos_tercero;

            }
        }

        catch (Exception ex)
        {

            throw new Exception(ex.Message);

        }
    }
    #endregion

    #region Guarda el Nombre del tercero
    public static DataRow GuardaNomTer(string cod_docum, string ape1_tercero, string ape2_tercero, string nom_tercero)
    {
        try
        {
            using (OracleConnection Conexion = MConexion.getConexion("OVDES"))
            {
                Tercero_DB objdb = new Tercero_DB();

                DataRow objdatos_tercero = objdb.GuardaNomTer_DB(cod_docum, ape1_tercero, ape2_tercero, nom_tercero, Conexion);

                return objdatos_tercero;

            }
        }

        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }
    #endregion 

    public static bool ClienteBloqueado(string cod_docum)
    {
        DataRow tercero = null;
        Tercero_DB objtercero = new Tercero_DB();

        try
        {
            using (OracleConnection Conexion = MConexion.getConexion("OVDES"))
            {
                tercero = objtercero.ClienteBloqueado_DB(cod_docum, Conexion);

                if (tercero["p_retorno"].ToString() == "N")
                {
                    return true; /* NO ESTA BLOQUEADO */
                }
                else
                {
                    return false; /* ESTA BLOQUEADO */
                }
            }
        }
        catch
        {
            return true;
        }

    }

    #region Devuelve el Nombre de la cuenta
    public static string DatosCuenta(string cod_docum)
    {
        try
        {
            using (OracleConnection Conexion = MConexion.getConexion("OVDES"))
            {
                Tercero_DB objdb = new Tercero_DB();

                DataRow objdatos_tercero = objdb.DatosCuenta_DB(cod_docum, Conexion);

                return objdatos_tercero["p_nom_cuenta"].ToString();

            }
        }

        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }

    }
    #endregion

    #region Devuelve el Nombre de la cuenta
    public static string CuentaHabilitada(string cod_docum)
    {
        try
        {
            using (OracleConnection Conexion = MConexion.getConexion("OVDES"))
            {
                Tercero_DB objdb = new Tercero_DB();

                DataRow objdatos_tercero = objdb.CuentaHabilitada_DB(cod_docum, Conexion);

                return objdatos_tercero["p_existe"].ToString();

            }
        }

        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }

    }
    #endregion

    #region Devuelve los datos de la automotora
    public static DataRow DatosAutomotora(string cod_docum_automotora)
    {
        try
        {

            using (OracleConnection Conexion = MConexion.getConexion("OVDES"))
            {
                Tercero_DB objdb = new Tercero_DB();

                DataRow objdatos_tercero = objdb.DatosAutomotora_DB(cod_docum_automotora, Conexion);

                return objdatos_tercero;

            }
        }

        catch (Exception ex)
        {

            throw new Exception(ex.Message);

        }
    }
    #endregion

    #region Devuelve el Nombre de la cuenta
    public static string TraeCorreo(string cod_docum)
    {
        try
        {
            using (OracleConnection Conexion = MConexion.getConexion("OVDES"))
            {
                DataRow objdatos_tercero = Tercero_DB.TraeCorreo_DB(cod_docum, Conexion);

                return objdatos_tercero["p_correo"].ToString();

            }
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }
    #endregion

    #region Valida si es GAP
    public static string ValidaGAP(string cod_docum)
    {
        try
        {
            using (OracleConnection Conexion = MConexion.getConexion("OVDES"))
            {
                Tercero_DB objdb = new Tercero_DB();

                DataRow objdatos_tercero = objdb.ValidaGAP_DB(cod_docum, Conexion);

                return objdatos_tercero["P_RESPUESTA"].ToString();

            }
        }

        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }

    }
    #endregion

    #region Guarda datos tercero cotizacionDevuelve los datos del tercero
    public static DataRow GuardaTerceroCotizacion(string P_NUM_COTIZACION,
                                              string COD_DOCUM_ASEG,
                                                string P_NOMBRES,
                                                string P_AP_PATERNO,
                                                string P_AP_MATERNO,
                                                string P_MAIL,
                                                string P_CELULAR,
                                                string P_FONO_FIJO)
    {
        try
        {

            using (OracleConnection Conexion = MConexion.getConexion("OVDES"))
            {
                Tercero_DB objdb = new Tercero_DB();

                DataRow objdatos_tercero = objdb.GuardaTerceroCotizacion_DB(P_NUM_COTIZACION,
                                                                             COD_DOCUM_ASEG,
                                                                             P_NOMBRES,
                                                                             P_AP_PATERNO,
                                                                             P_AP_MATERNO,
                                                                             P_MAIL,
                                                                             P_CELULAR,
                                                                             P_FONO_FIJO,
                                                                             Conexion);

                return objdatos_tercero;

            }
        }

        catch (Exception ex)
        {

            throw new Exception(ex.Message);

        }
    }
    #endregion

}
