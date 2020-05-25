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
/// Summary description for Tercero_DB
/// </summary>
public class Tercero_DB
{
    #region Llamada al procedimiento que trae el nombre del asegurado

    public DataRow DatosTercero_DB(string cod_docum, OracleConnection cnx)
    {
        MCommand objComando = new MCommand();

        try
        {
            objComando.Connection = cnx;

            objComando.CommandText = "MEL_K_VEHICULO.P_DATOS_TERCERO";

            objComando.agregarINParametro("P_COD_DOCUM", OracleDbType.Varchar2, cod_docum);
            objComando.agregarOUTParametro("P_NOM_TERCEO", OracleDbType.Varchar2, 2000);
            objComando.agregarOUTParametro("P_APE_PATERNO", OracleDbType.Varchar2, 255);
            objComando.agregarOUTParametro("P_APE_MATERNO", OracleDbType.Varchar2, 255);
            objComando.agregarOUTParametro("P_EDAD", OracleDbType.Varchar2, 255);
            objComando.agregarOUTParametro("P_SEXO", OracleDbType.Varchar2, 255);
            objComando.agregarOUTParametro("P_ERROR", OracleDbType.Varchar2, 255);

            return objComando.ejecutarRegistroSP(); ;

        }
        catch (Exception ex)
        {
            throw new Exception("ERROR Cotizador.DatosVeh_DB : " + ex.Message);
        }
    }
    #endregion

    #region Clase que captura los datos del Tercero

    public DataSet DatosTerceroTronWeb_DB(OracleConnection cnx, string cod_docum)
    {
        MCommand objComando = new MCommand();

        try
        {

            objComando.Connection = cnx;

            objComando.CommandText = "MEL_K_TERCERO_TRN.P_TRAE_DATOS_ASEGURADO";

            //objComando.agregarINParametro("p_cod_cia", OracleDbType.Varchar2, "1");
            objComando.agregarINParametro("p_cod_docum_aseg", OracleDbType.Varchar2, cod_docum);
            objComando.agregarOUTParametro("p_cursor", OracleDbType.RefCursor, 0);
            objComando.agregarOUTParametro("p_error", OracleDbType.Varchar2, 255);

            return objComando.ejecutarRefCursorSP();

        }
        catch (Exception ex)
        {
            throw new Exception("Error al capturar Regiones " + ex.Message);
        }
    }


    #endregion		
    
    #region Llamada al procedimiento que guarda los datos del tercero SOLO Convenio COMPARA
    public DataRow GuardaTerCompara_DB(string cod_docum, string ape1_tercero, string ape2_tercero, string nom_tercero, string nom_direccion, int cod_region, int cod_ciudad, int cod_comuna, string tlf_pais, string tlf_zona, string tlf_numero, string mca_sexo, string num_movil, string email, string fecha_nac, OracleConnection strConexion)
    {
        MCommand objComando = new MCommand();

        try
        {
            objComando.Connection = strConexion;

            objComando.CommandText = "MEL_K_TERCERO_TRN.P_GRABA_DATOS_TERCERO_COMPARA";

            objComando.agregarINParametro("P_COD_DOCUM", OracleDbType.Varchar2, cod_docum);
            objComando.agregarINParametro("P_APE1_TERCERO", OracleDbType.Varchar2, ape1_tercero);
            objComando.agregarINParametro("P_APE2_TERCERO", OracleDbType.Varchar2, ape2_tercero);
            objComando.agregarINParametro("P_NOM_TERCERO", OracleDbType.Varchar2, nom_tercero);
            objComando.agregarINParametro("P_NOM_DIRECCION", OracleDbType.Varchar2, nom_direccion);
            objComando.agregarINParametro("P_COD_REGION", OracleDbType.Int32, cod_region);
            objComando.agregarINParametro("P_COD_CIUDAD", OracleDbType.Int32, cod_ciudad);
            objComando.agregarINParametro("P_COD_COMUNA", OracleDbType.Int32, cod_comuna);
            objComando.agregarINParametro("P_TLF_PAIS", OracleDbType.Varchar2, tlf_pais);
            objComando.agregarINParametro("P_TLF_ZONA", OracleDbType.Varchar2, tlf_zona);
            objComando.agregarINParametro("P_TLF_NUMERO", OracleDbType.Varchar2, tlf_numero);
            objComando.agregarINParametro("P_MCA_SEXO", OracleDbType.Varchar2, mca_sexo);
            objComando.agregarINParametro("P_NUM_MOVIL", OracleDbType.Varchar2, num_movil);
            objComando.agregarINParametro("P_EMAIL", OracleDbType.Varchar2, email);
            objComando.agregarINParametro("P_FEC_NACIMIENTO", OracleDbType.Varchar2, fecha_nac);
            objComando.agregarOUTParametro("P_ERROR", OracleDbType.Varchar2, 255);

            return objComando.ejecutarRegistroSP();
        }
        catch (Exception ex)
        {
            throw new Exception("ERROR Cotizador.GuardaTerCompara : " + ex.Message);
        }
    }
    #endregion

    #region Llamada al procedimiento que guarda los datos del tercero
    public DataRow GuardaTer_DB(string cod_docum, string ape1_tercero, string ape2_tercero, string nom_tercero, string nom_direccion, int cod_region, int cod_ciudad, int cod_comuna, string tlf_pais, string tlf_zona, string tlf_numero, string mca_sexo, OracleConnection strConexion)
    {
        MCommand objComando = new MCommand();

        try
        {
            objComando.Connection = strConexion;

            objComando.CommandText = "MEL_K_TERCERO_TRN.P_GRABA_DATOS_ASEG";

            objComando.agregarINParametro("P_COD_DOCUM", OracleDbType.Varchar2, cod_docum);
            objComando.agregarINParametro("P_APE1_TERCERO", OracleDbType.Varchar2, ape1_tercero);
            objComando.agregarINParametro("P_APE2_TERCERO", OracleDbType.Varchar2, ape2_tercero);
            objComando.agregarINParametro("P_NOM_TERCERO", OracleDbType.Varchar2, nom_tercero);
            objComando.agregarINParametro("P_NOM_DIRECCION", OracleDbType.Varchar2, nom_direccion);
            objComando.agregarINParametro("P_COD_REGION", OracleDbType.Int32, cod_region);
            objComando.agregarINParametro("P_COD_CIUDAD", OracleDbType.Int32, cod_ciudad);
            objComando.agregarINParametro("P_COD_COMUNA", OracleDbType.Int32, cod_comuna);
            objComando.agregarINParametro("P_TLF_PAIS", OracleDbType.Varchar2, tlf_pais);
            objComando.agregarINParametro("P_TLF_ZONA", OracleDbType.Varchar2, tlf_zona);
            objComando.agregarINParametro("P_TLF_NUMERO", OracleDbType.Varchar2, tlf_numero);
            objComando.agregarINParametro("P_MCA_SEXO", OracleDbType.Varchar2, mca_sexo);
            objComando.agregarOUTParametro("P_ERROR", OracleDbType.Varchar2, 255);

            return objComando.ejecutarRegistroSP();
        }
        catch (Exception ex)
        {
            throw new Exception("ERROR Cotizador.GuardaTer : " + ex.Message);
        }

    }
    #endregion

    #region Guarda el Email del tercero
    public DataRow GuardaEmailTer_DB(string COD_DOCUM, string EMAIL, OracleConnection Conexion)
    {
        MCommand objComando = new MCommand();

        try
        {
            objComando.Connection = Conexion;

            objComando.CommandText = "MEL_K_EMAIL.P_GUARDA_EMAIL_TER";

            objComando.agregarINParametro("p_email", OracleDbType.Varchar2, EMAIL);
            objComando.agregarINParametro("p_cod_docum", OracleDbType.Varchar2, COD_DOCUM);

            return objComando.ejecutarRegistroSP();

        }
        catch (Exception ex)
        {
            throw new Exception("ERROR Cotizador.GuardaEmailTer : " + ex.Message);
        }

    }
    #endregion 

    #region Guarda el Nombre del tercero
    public DataRow GuardaNomTer_DB(string COD_DOCUM, string APE1_TERCERO, string APE2_TERCERO, string NOM_TERCERO, OracleConnection Conexion)
    {
        MCommand objComando = new MCommand();

        try
        {
            objComando.Connection = Conexion;

            objComando.CommandText = "MEL_K_TERCERO_TRN.P_GRABA_NOM_ASEG";

            objComando.agregarINParametro("P_COD_DOCUM", OracleDbType.Varchar2, COD_DOCUM);
            objComando.agregarINParametro("P_APE1_TERCERO", OracleDbType.Varchar2, APE1_TERCERO);
            objComando.agregarINParametro("P_APE2_TERCERO", OracleDbType.Varchar2, APE2_TERCERO);
            objComando.agregarINParametro("P_NOM_TERCERO", OracleDbType.Varchar2, NOM_TERCERO);

            objComando.agregarOUTParametro("P_ERROR", OracleDbType.Varchar2, 255);

            return objComando.ejecutarRegistroSP();

        }
        catch (Exception ex)
        {
            throw new Exception("ERROR Cotizador.GuardaNomTer : " + ex.Message);
        }

    }
    #endregion

    #region Llamada al procedimiento que valida si un tercero esta bloqueado
    public DataRow ClienteBloqueado_DB(string cod_docum, OracleConnection Conexion)
    {
        MCommand objComando = new MCommand();

        try
        {
            objComando.Connection = Conexion;

            objComando.CommandText = "OV_K_RENOVACION.P_CONSULTA_BLOQUEO";

            objComando.agregarINParametro("p_cod_docum", OracleDbType.Varchar2, cod_docum);
            objComando.agregarOUTParametro("p_retorno", OracleDbType.Varchar2, 255);

            return objComando.ejecutarRegistroSP();

        }
        catch (Exception ex)
        {
            throw new Exception("ERROR Cotizador.ValidaClienteBloqueado : " + ex.Message);
        }

    }
    #endregion 

    #region Llamada al procedimiento que devuelve el Nombre de la Cuenta que esta conectada
    public DataRow DatosCuenta_DB(string cod_docum, OracleConnection Conexion)
    {
        MCommand objComando = new MCommand();


        try
        {
            objComando.Connection = Conexion;

            objComando.CommandText = "MEL_K_TERCERO_TRN.P_TRAE_NOM_CUENTA";

            objComando.agregarINParametro("p_cod_docum", OracleDbType.Varchar2, cod_docum);
            objComando.agregarOUTParametro("p_nom_cuenta", OracleDbType.Varchar2, 100);
            objComando.agregarOUTParametro("p_error", OracleDbType.Varchar2, 255);

            return objComando.ejecutarRegistroSP();

        }
        catch (Exception ex)
        {
            throw new Exception("ERROR Cotizador.NombreCuenta : " + ex.Message);
        }

    }
    #endregion

    #region Llamada al procedimiento que devuelve si la cuenta esta habilitada o no
    public DataRow CuentaHabilitada_DB(string cod_docum, OracleConnection Conexion)
    {
        MCommand objComando = new MCommand();

        try
        {
            objComando.Connection = Conexion;

            objComando.CommandText = "MEL_K_VEHICULO.P_CUENTA_HABILITADA";

            objComando.agregarINParametro("p_cod_docum", OracleDbType.Varchar2, cod_docum);
            objComando.agregarOUTParametro("p_existe", OracleDbType.Varchar2, 100);

            return objComando.ejecutarRegistroSP();

        }
        catch (Exception ex)
        {
            throw new Exception("ERROR Cotizador.NombreCuenta : " + ex.Message);
        }

    }
    #endregion

    #region Llamada al procedimiento que trae el nombre del asegurado

    public DataRow DatosAutomotora_DB(string cod_docum_automotora, OracleConnection cnx)
    {
        MCommand objComando = new MCommand();

        try
        {
            objComando.Connection = cnx;

            objComando.CommandText = "MEL_K_VEHICULO.P_DATOS_AUTOMORA";

            objComando.agregarINParametro("p_cod_docum", OracleDbType.Varchar2, cod_docum_automotora);
            objComando.agregarOUTParametro("p_nom_automotora", OracleDbType.Varchar2, 2000);

            return objComando.ejecutarRegistroSP(); ;

        }
        catch (Exception ex)
        {
            throw new Exception("ERROR Cotizador.DatosVeh_DB : " + ex.Message);
        }
    }
    #endregion

    #region Llamada al procedimiento que devuelve el correo del agente
    public static DataRow TraeCorreo_DB(string cod_docum, OracleConnection strConexion)
    {
        MCommand cmd = new MCommand();


        try
        {
            cmd.Connection = strConexion;

            cmd.CommandText = "MEL_K_TERCERO_TRN.P_TRAE_CORREO";

            cmd.agregarINParametro("p_cod_docum", OracleDbType.Varchar2, cod_docum);
            cmd.agregarOUTParametro("p_correo", OracleDbType.Varchar2, 255);

            return cmd.ejecutarRegistroSP();

        }
        catch (Exception ex)
        {
            throw new Exception("ERROR Cotizador.CotizaXML : " + ex.Message);
        }
    }
    #endregion

    #region Valida si es GAP

    public DataRow ValidaGAP_DB(string cod_docum, OracleConnection cnx)
    {
        MCommand objComando = new MCommand();

        try
        {
            objComando.Connection = cnx;

            objComando.CommandText = "p_valida_gap";

            objComando.agregarINParametro("P_COD_DOCUM_MAE", OracleDbType.Varchar2, cod_docum);
            objComando.agregarOUTParametro("P_RESPUESTA", OracleDbType.Varchar2, 255);

            return objComando.ejecutarRegistroSP(); ;

        }
        catch (Exception ex)
        {
            throw new Exception("ERROR Cotizador.ValidaGAP_DB : " + ex.Message);
        }
    }
    #endregion

    #region Llamada al procedimiento que guarda los datos del tercero DE LA COTIZACION
    public DataRow GuardaTerceroCotizacion_DB(string P_NUM_COTIZACION,
                                              string COD_DOCUM_ASEG,
                                                string P_NOMBRES,
                                                string P_AP_PATERNO,
                                                string P_AP_MATERNO,
                                                string P_MAIL,
                                                string P_CELULAR,
                                                string P_FONO_FIJO,
                                                OracleConnection strConexion)
    {
        MCommand objComando = new MCommand();

        try
        {
            objComando.Connection = strConexion;

            objComando.CommandText = "mel_k_veh_comer_elec.P_GUARDA_TER_COTIZACION";

            objComando.agregarINParametro("P_NUM_COTIZACION", OracleDbType.Varchar2, P_NUM_COTIZACION);
            objComando.agregarINParametro("COD_DOCUM_ASEG", OracleDbType.Varchar2, COD_DOCUM_ASEG);
            objComando.agregarINParametro("P_NOMBRES", OracleDbType.Varchar2, P_NOMBRES);
            objComando.agregarINParametro("P_AP_PATERNO", OracleDbType.Varchar2, P_AP_PATERNO);
            objComando.agregarINParametro("P_AP_MATERNO", OracleDbType.Varchar2, P_AP_MATERNO);
            objComando.agregarINParametro("P_MAIL", OracleDbType.Varchar2, P_MAIL);
            objComando.agregarINParametro("P_CELULAR", OracleDbType.Varchar2, P_CELULAR);
            objComando.agregarINParametro("P_FONO_FIJO", OracleDbType.Varchar2, P_FONO_FIJO);
            objComando.agregarOUTParametro("P_ERROR", OracleDbType.Varchar2, 255);

            return objComando.ejecutarRegistroSP();
        }
        catch (Exception ex)
        {
            throw new Exception("ERROR Cotizador.GuardaTerceroCotizacion_DB : " + ex.Message);
        }
        finally
        {
            strConexion.Dispose();
        }
    }
    #endregion



}
