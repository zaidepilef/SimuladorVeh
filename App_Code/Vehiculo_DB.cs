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
/// Procedimentos 
/// </summary>
public class Vehiculo_DB
{
    #region Procedimiento que devuelve las Marcas
    public DataSet getMarcas(OracleConnection cnx, string cod_marca)
    {
        MCommand objComando = new MCommand();

        try
        {

            objComando.Connection = cnx;

            objComando.CommandText = "tron2000.mel_k_mapfre_mcl.get_marca";

            objComando.agregarINParametro("v_marca", OracleDbType.Varchar2, cod_marca);
            objComando.agregarOUTParametro("p_marca", OracleDbType.RefCursor, 0);
            objComando.agregarOUTParametro("p_error", OracleDbType.Varchar2, 255);

            return objComando.ejecutarRefCursorSP();

        }
        catch (Exception ex)
        {
            throw new Exception("Error al capturar M " + ex.Message);
        }
    }

    #endregion

    #region Procedimiento que devuelve los Modelos
    public DataSet getModelos(OracleConnection cnx, string cod_marca)
    {
        MCommand objComando = new MCommand();

        try
        {
            objComando.Connection = cnx;

            objComando.CommandText = "MEL_K_MAPFRE.get_modelos";

            objComando.agregarINParametro("v_marca", OracleDbType.Varchar2, cod_marca);
            objComando.agregarOUTParametro("p_modelos", OracleDbType.RefCursor, 0);
            objComando.agregarOUTParametro("P_ERROR", OracleDbType.Varchar2, 255);

            return objComando.ejecutarRefCursorSP();

        }
        catch (Exception ex)
        {
            throw new Exception("ERROR Cotizador.ValidaSuplantacion : " + ex.Message);
        }
    }

    #endregion

    #region Procedimiento que devuelve las SubModelos
    public DataSet getSubModelos(OracleConnection cnx, string cod_marca, string cod_modelo)
    {
        MCommand objComando = new MCommand();

        try
        {
            objComando.Connection = cnx;

            objComando.CommandText = "MEL_K_MAPFRE.get_sub_modelos";

            objComando.agregarINParametro("v_marca", OracleDbType.Varchar2, cod_marca);
            objComando.agregarINParametro("v_modelo", OracleDbType.Varchar2, cod_modelo);
            objComando.agregarOUTParametro("p_sub_modelos", OracleDbType.RefCursor, 0);
            objComando.agregarOUTParametro("p_error", OracleDbType.Varchar2, 255);

            return objComando.ejecutarRefCursorSP();

        }
        catch (Exception ex)
        {
            throw new Exception("ERROR Cotizador.ValidaSuplantacion : " + ex.Message);
        }
    }
    #endregion

    #region Procedimiento que devuelve las colores
    public DataSet getColores(OracleConnection cnx)
    {
        MCommand objComando = new MCommand();

        try
        {
            objComando.Connection = cnx;

            objComando.CommandText = "MEL_K_MAPFRE.P_colores";

            objComando.agregarINParametro("p_where", OracleDbType.Varchar2, "1=1");            
            objComando.agregarOUTParametro("c_colores", OracleDbType.RefCursor, 0);
            objComando.agregarOUTParametro("p_error", OracleDbType.Varchar2, 255);

            return objComando.ejecutarRefCursorSP();

        }
        catch (Exception ex)
        {
            throw new Exception("ERROR Cotizador.ValidaSuplantacion : " + ex.Message);
        }
    }
    #endregion

    #region Llamada al procedimiento que selecciona la marca, modelo y submodelo del vehiculo
    public DataRow DatosVeh_DB(string num_matricula, OracleConnection cnx)
    {
        MCommand objComando = new MCommand();

        try
        {
            objComando.Connection = cnx;
            
            objComando.CommandText = "MEL_K_VEHICULO.P_DATOS_VEHICULO";

            objComando.agregarINParametro("P_NUM_MATRICULA", OracleDbType.Varchar2, num_matricula);
            objComando.agregarOUTParametro("P_NOM_COT", OracleDbType.Varchar2, 2000);
            objComando.agregarOUTParametro("P_APE_PAT_COT", OracleDbType.Varchar2, 2000);
            objComando.agregarOUTParametro("P_APE_MAT_COT", OracleDbType.Varchar2, 2000);
            objComando.agregarOUTParametro("P_RUT_COT", OracleDbType.Varchar2, 255);
            objComando.agregarOUTParametro("P_DIR_COT", OracleDbType.Varchar2, 255);
            objComando.agregarOUTParametro("P_COMUNA_COT", OracleDbType.Varchar2, 255);
            objComando.agregarOUTParametro("P_CIUDAD_COT", OracleDbType.Varchar2, 255);
            objComando.agregarOUTParametro("P_REGION_COT", OracleDbType.Varchar2, 255);
            objComando.agregarOUTParametro("P_ANIO", OracleDbType.Varchar2, 255);
            objComando.agregarOUTParametro("P_NRO_CHASIS", OracleDbType.Varchar2, 255);
            objComando.agregarOUTParametro("P_NRO_MOTOR", OracleDbType.Varchar2, 255);
            objComando.agregarOUTParametro("P_COD_COLOR", OracleDbType.Varchar2, 255);
            objComando.agregarOUTParametro("P_NOM_COLOR", OracleDbType.Varchar2, 255);
            objComando.agregarOUTParametro("P_COD_MARCA", OracleDbType.Varchar2, 255);
            objComando.agregarOUTParametro("P_NOM_MARCA", OracleDbType.Varchar2, 255);
            objComando.agregarOUTParametro("P_COD_MODELO", OracleDbType.Varchar2, 255);
            objComando.agregarOUTParametro("P_NOM_MODELO", OracleDbType.Varchar2, 255);
            objComando.agregarOUTParametro("P_COD_SUB_MODELO", OracleDbType.Varchar2, 255);
            objComando.agregarOUTParametro("P_NOM_SUB_MODELO", OracleDbType.Varchar2, 255);
            objComando.agregarOUTParametro("P_TIP_VEHI", OracleDbType.Varchar2, 255);
            objComando.agregarOUTParametro("P_EDAD", OracleDbType.Varchar2, 255);
            objComando.agregarOUTParametro("P_SEXO", OracleDbType.Varchar2, 255);
            objComando.agregarOUTParametro("P_ID", OracleDbType.Varchar2, 255);
            objComando.agregarOUTParametro("P_ERROR", OracleDbType.Varchar2, 255);

            return objComando.ejecutarRegistroSP(); ;

        }
        catch (Exception ex)
        {
            throw new Exception("ERROR Cotizador.DatosVeh_DB : " + ex.Message);
        }
    }

    public DataRow DatosVeh_ID_DB(string ID, OracleConnection cnx)
    {
        MCommand objComando = new MCommand();

        try
        {
            objComando.Connection = cnx;

            objComando.CommandText = "MEL_K_VEHICULO.P_DATOS_VEHICULO_ID";

            objComando.agregarINParametro("P_ID", OracleDbType.Varchar2, ID);
            objComando.agregarOUTParametro("P_NOM_COT", OracleDbType.Varchar2, 2000);
            objComando.agregarOUTParametro("P_APE_PAT_COT", OracleDbType.Varchar2, 2000);
            objComando.agregarOUTParametro("P_APE_MAT_COT", OracleDbType.Varchar2, 2000);
            objComando.agregarOUTParametro("P_RUT_COT", OracleDbType.Varchar2, 255);
            objComando.agregarOUTParametro("P_DIR_COT", OracleDbType.Varchar2, 255);
            objComando.agregarOUTParametro("P_COMUNA_COT", OracleDbType.Varchar2, 255);
            objComando.agregarOUTParametro("P_CIUDAD_COT", OracleDbType.Varchar2, 255);
            objComando.agregarOUTParametro("P_REGION_COT", OracleDbType.Varchar2, 255);
            objComando.agregarOUTParametro("P_ANIO", OracleDbType.Varchar2, 255);
            objComando.agregarOUTParametro("P_NRO_CHASIS", OracleDbType.Varchar2, 255);
            objComando.agregarOUTParametro("P_NRO_MOTOR", OracleDbType.Varchar2, 255);
            objComando.agregarOUTParametro("P_COD_COLOR", OracleDbType.Varchar2, 255);
            objComando.agregarOUTParametro("P_NOM_COLOR", OracleDbType.Varchar2, 255);
            objComando.agregarOUTParametro("P_COD_MARCA", OracleDbType.Varchar2, 255);
            objComando.agregarOUTParametro("P_NOM_MARCA", OracleDbType.Varchar2, 255);
            objComando.agregarOUTParametro("P_COD_MODELO", OracleDbType.Varchar2, 255);
            objComando.agregarOUTParametro("P_NOM_MODELO", OracleDbType.Varchar2, 255);
            objComando.agregarOUTParametro("P_COD_SUB_MODELO", OracleDbType.Varchar2, 255);
            objComando.agregarOUTParametro("P_NOM_SUB_MODELO", OracleDbType.Varchar2, 255);
            objComando.agregarOUTParametro("P_TIP_VEHI", OracleDbType.Varchar2, 255);
            objComando.agregarOUTParametro("P_EDAD", OracleDbType.Varchar2, 255);
            objComando.agregarOUTParametro("P_SEXO", OracleDbType.Varchar2, 255);
            objComando.agregarOUTParametro("P_ERROR", OracleDbType.Varchar2, 255);

            return objComando.ejecutarRegistroSP();
        }
        catch (Exception ex)
        {
            throw new Exception("ERROR Cotizador.DatosVeh_DB : " + ex.Message);
        }
    }
    #endregion

    #region Procedimiento que guarda los datos del vehiculo para emitir
    public DataRow GuardaDatosVehEmision_DB(string ID, string COD_COLOR, string NRO_MOTOR, string NRO_CHASIS, OracleConnection conexion)
    {
        MCommand objComando = new MCommand();

        try
        {
            objComando.Connection = conexion;

            objComando.CommandText = "MEL_K_VEHICULO.P_GRABA_DATOS_VEH_EMISION";

            objComando.agregarINParametro("p_id", OracleDbType.Int32, Convert.ToInt32(ID));
            objComando.agregarINParametro("p_cod_color", OracleDbType.Int32, COD_COLOR);
            objComando.agregarINParametro("p_nro_motor", OracleDbType.Varchar2, NRO_MOTOR);
            objComando.agregarINParametro("p_nro_chasis", OracleDbType.Varchar2, NRO_CHASIS);

            objComando.agregarOUTParametro("p_error", OracleDbType.Varchar2, 255);

            return objComando.ejecutarRegistroSP();

        }
        catch (Exception ex)
        {
            throw new Exception("ERROR Cotizador.GrabaDatosVeh : " + ex.Message);
        }
    }
    #endregion 	

    #region Procedimiento que devuelve los accesorios del vehiculo para la inspeccion
    public DataSet getAccesorios(OracleConnection cnx)
    {
        MCommand objComando = new MCommand();

        try
        {
            objComando.Connection = cnx;

            objComando.CommandText = "MEL_K_MAPFRE_MCL.p_accesorios";

            objComando.agregarINParametro("p_where", OracleDbType.Varchar2, "1=1");
            objComando.agregarOUTParametro("c_accesorios", OracleDbType.RefCursor, 0);
            objComando.agregarOUTParametro("p_error", OracleDbType.Varchar2, 255);

            return objComando.ejecutarRefCursorSP();

        }
        catch (Exception ex)
        {
            throw new Exception("ERROR Cotizador.getAccesorios : " + ex.Message);
        }
    }
    #endregion

    #region Procedimiento que devuelve las partes y daños del vehiculo para la inspeccion
    public DataSet getPartesVeh(OracleConnection cnx)
    {
        MCommand objComando = new MCommand();

        try
        {
            objComando.Connection = cnx;

            objComando.CommandText = "tron2000.MEL_K_MAPFRE_MCL.P_PARTES_VEHICULO";

            objComando.agregarINParametro("p_where", OracleDbType.Varchar2, "1=1");
            objComando.agregarOUTParametro("c_partes", OracleDbType.RefCursor, 0);
            objComando.agregarOUTParametro("c_danos", OracleDbType.RefCursor, 0);
            objComando.agregarOUTParametro("p_error", OracleDbType.Varchar2, 255);

            return objComando.ejecutarRefCursorSP();

        }
        catch (Exception ex)
        {
            throw new Exception("ERROR Cotizador.getPartesVeh : " + ex.Message);
        }
    }
    #endregion

    #region Procedimiento que guarda los datos de la inspeccion
    public DataRow GuardaDatosInspeccion_DB(string p_num_cotizacion, string p_datos_tercero, string p_datos_vehiculo, string p_datos_inspeccionDP, string p_datos_inspeccionAcc, OracleConnection conexion)
    {
        MCommand objComando = new MCommand();

        try
        {
            objComando.Connection = conexion;

            objComando.CommandText = "MEL_K_INSPECCION.P_INGRESA_INSPECCION";

            objComando.agregarINParametro("p_num_cotizacion", OracleDbType.Varchar2, p_num_cotizacion);
            objComando.agregarINParametro("p_datos_tercero", OracleDbType.Varchar2, p_datos_tercero);
            objComando.agregarINParametro("p_datos_vehiculo", OracleDbType.Varchar2, p_datos_vehiculo);
            objComando.agregarINParametro("p_datos_inspecciondp", OracleDbType.Varchar2, p_datos_inspeccionDP);
            objComando.agregarINParametro("p_datos_inspeccionacc", OracleDbType.Varchar2, p_datos_inspeccionAcc);
            objComando.agregarOUTParametro("p_error", OracleDbType.Varchar2, 255);

            return objComando.ejecutarRegistroSP();

        }
        catch (Exception ex)
        {
            throw new Exception("ERROR Cotizador.GrabaDatosVeh : " + ex.Message);
        }
    }
    #endregion 

    #region Procedimiento que guarda los datos de la inspeccion
    public DataRow TraeNomTipVehi_DB(string cod_marca, string cod_modelo, string cod_sub_modelo, OracleConnection conexion)
    {
        MCommand objComando = new MCommand();

        try
        {
            objComando.Connection = conexion;

            objComando.CommandText = "MEL_K_VEHICULO.P_TRAE_TIPO_VEHICULO";

            objComando.agregarINParametro("p_cod_marca", OracleDbType.Varchar2, cod_marca);
            objComando.agregarINParametro("p_cod_modelo", OracleDbType.Varchar2, cod_modelo);
            objComando.agregarINParametro("p_cod_sub_modelo", OracleDbType.Varchar2, cod_sub_modelo);
            objComando.agregarINParametro("p_uso_veh", OracleDbType.Varchar2, "P");
            objComando.agregarOUTParametro("p_cod_ramo", OracleDbType.Varchar2, 255);
            objComando.agregarOUTParametro("p_cod_tip_vehi", OracleDbType.Varchar2, 255);
            objComando.agregarOUTParametro("p_nom_tip_vehi", OracleDbType.Varchar2, 255);
            objComando.agregarOUTParametro("p_error", OracleDbType.Varchar2, 255);

            return objComando.ejecutarRegistroSP();

        }
        catch (Exception ex)
        {
            throw new Exception("ERROR Cotizador.TraeNomTipVehi : " + ex.Message);
        }
    }
    #endregion 

    #region Procedimiento que guarda los datos de la inspeccion
    public DataRow GuardaDatosInspeccionBSP_DB(string num_cotizacion, string num_matricula, string nombre_contacto, string direccion_contacto, string cod_region_contacto, string cod_ciudad_contacto, string cod_comuna_contacto, string fono_contacto, string celular_contacto, string observaciones_contacto, string nom_aseg, string cod_area, OracleConnection conexion)
    {
        MCommand objComando = new MCommand();

        try
        {
            objComando.Connection = conexion;

            objComando.CommandText = "MEL_K_INSPECCION.P_INGRESA_SOL_INSPEC";

            objComando.agregarINParametro("p_num_cotizacion", OracleDbType.Varchar2, num_cotizacion);
            objComando.agregarINParametro("p_patente", OracleDbType.Varchar2, num_matricula);
            objComando.agregarINParametro("p_nombre", OracleDbType.Varchar2, nom_aseg);
            objComando.agregarINParametro("p_direccion", OracleDbType.Varchar2, direccion_contacto);
            objComando.agregarINParametro("p_region", OracleDbType.Varchar2, cod_region_contacto);
            objComando.agregarINParametro("p_ciudad", OracleDbType.Varchar2, cod_ciudad_contacto);
            objComando.agregarINParametro("p_comuna", OracleDbType.Varchar2, cod_comuna_contacto);
            objComando.agregarINParametro("p_fono", OracleDbType.Varchar2, fono_contacto);
            objComando.agregarINParametro("p_cod_area", OracleDbType.Varchar2, cod_area);
            objComando.agregarINParametro("p_celular", OracleDbType.Varchar2, celular_contacto);
            objComando.agregarINParametro("p_observaciones", OracleDbType.Varchar2, observaciones_contacto);
            objComando.agregarINParametro("p_nombre_contacto", OracleDbType.Varchar2, nombre_contacto);
            objComando.agregarOUTParametro("p_error", OracleDbType.Varchar2, 255);

            return objComando.ejecutarRegistroSP();

        }
        catch (Exception ex)
        {
            throw new Exception("ERROR Cotizador.GuardaDatosInspeccionBSP_DB : " + ex.Message);
        }
    }
    #endregion 

    #region Procedimiento que guarda los datos de la inspeccion
    public DataRow GuardaDatosFactura_DB(string num_cotizacion, string num_factura, string fec_factura, string cod_docum_factura, string nom_factura, OracleConnection conexion)
    {
        MCommand objComando = new MCommand();

        try
        {
            objComando.Connection = conexion;

            objComando.CommandText = "mel_k_vehiculo.P_GRABA_DATOS_FACTURA";

            objComando.agregarINParametro("p_num_cotizacion", OracleDbType.Varchar2, num_cotizacion);
            objComando.agregarINParametro("P_NUM_FACTURA", OracleDbType.Varchar2, num_factura);
            objComando.agregarINParametro("P_FEC_FACTURA", OracleDbType.Varchar2, fec_factura);
            objComando.agregarINParametro("P_COD_DOCUM_AUTOMOTORA", OracleDbType.Varchar2, cod_docum_factura);
            objComando.agregarINParametro("P_NOM_AUTOMORA", OracleDbType.Varchar2, nom_factura);
            objComando.agregarOUTParametro("p_error", OracleDbType.Varchar2, 255);

            return objComando.ejecutarRegistroSP();

        }
        catch (Exception ex)
        {
            throw new Exception("ERROR Cotizador.GuardaDatosFactura_DB : " + ex.Message);
        }
    }
    #endregion 

    #region Procedimiento que guarda los datos de la inspeccion
    public DataRow PrimaExenta_DB(string cod_modalidad, string cod_ramo, OracleConnection conexion)
    {
        MCommand objComando = new MCommand();

        try
        {
            objComando.Connection = conexion;

            objComando.CommandText = "mel_k_vehiculo.p_monto_cob_exenta";

            objComando.agregarINParametro("p_cod_ramo", OracleDbType.Varchar2, cod_ramo);
            objComando.agregarINParametro("p_cod_modalidad", OracleDbType.Varchar2, cod_modalidad);
            objComando.agregarOUTParametro("p_monto_exenta", OracleDbType.Varchar2, 255);

            return objComando.ejecutarRegistroSP();

        }
        catch (Exception ex)
        {
            throw new Exception("ERROR Cotizador.p_monto_cob_exenta : " + ex.Message);
        }
    }
    #endregion 

    public DataSet getDescuentosOpcionales_DB(string cod_docum, string cod_ramo, OracleConnection cnx)
    {
        MCommand objComando = new MCommand();

        try
        {
            objComando.Connection = cnx;

            objComando.CommandText = "MEL_K_BOLSA_DESCUENTO.P_DESCUENTOS_OPCIONALES";

            objComando.agregarINParametro("P_COD_CIA", OracleDbType.Int32, 1);
            objComando.agregarINParametro("P_COD_DOCUM", OracleDbType.Varchar2, cod_docum);
            objComando.agregarINParametro("P_COD_RAMO", OracleDbType.Varchar2, cod_ramo);
            objComando.agregarOUTParametro("PO_RESU", OracleDbType.RefCursor, 0);
            objComando.agregarOUTParametro("PO_ERROR", OracleDbType.Varchar2, 255);

            return objComando.ejecutarRefCursorSP();

        }
        catch (Exception ex)
        {
            throw new Exception("ERROR Cotizador.getDescuentosOpcionales_DB : " + ex.Message);
        }
    }

    #region Procedimiento Asignar descuento OPC
    public DataRow GrabaDescuentoOpc_DB(string cod_descuento, string num_cotizacion, OracleConnection conexion)
    {
        MCommand objComando = new MCommand();

        try
        {
            objComando.Connection = conexion;

            objComando.CommandText = "MEL_K_BOLSA_DESCUENTO.P_ASIGNAR_DESCUENTO_OPC";

            objComando.agregarINParametro("P_TIPO_DESCUENTO", OracleDbType.Varchar2, cod_descuento);
            objComando.agregarINParametro("P_NUM_COT", OracleDbType.Varchar2, num_cotizacion);
            objComando.agregarOUTParametro("P_ERROR", OracleDbType.Varchar2, 255);

            return objComando.ejecutarRegistroSP();

        }
        catch (Exception ex)
        {
            throw new Exception("ERROR Cotizador.GrabaDescuentoOpc_DB : " + ex.Message);
        }
    }
    #endregion 

    #region Procedimiento que Valida Numero Motor
    public DataRow ValidaNroMotor_DB(string nro_motor, OracleConnection conexion)
    {
        MCommand objComando = new MCommand();

        try
        {
            objComando.Connection = conexion;

            objComando.CommandText = "MEL_K_VEHICULO_COMERCIAL.P_VALIDA_NRO_MOTOR";

            objComando.agregarINParametro("p_motor", OracleDbType.Varchar2, nro_motor);
            objComando.agregarOUTParametro("g_existe", OracleDbType.Varchar2, 255);
            objComando.agregarOUTParametro("g_error", OracleDbType.Varchar2, 255);

            return objComando.ejecutarRegistroSP();

        }
        catch (Exception ex)
        {
            throw new Exception("ERROR Cotizador.ValidaNroMotor_DB : " + ex.Message);
        }
    }
    #endregion

    #region Procedimiento que guarda los datos de la inspeccion
    public DataRow AutorizaInspeccionBSPWEB_DB(string num_cotizacion, OracleConnection conexion)
    {
        MCommand objComando = new MCommand();

        try
        {
            objComando.Connection = conexion;

            objComando.CommandText = "MEL_K_INSPECCION.P_AUTORIZA_SOL_INSPEC_WEB_DIR";

            objComando.agregarINParametro("p_num_cotizacion", OracleDbType.Varchar2, num_cotizacion);
            objComando.agregarOUTParametro("p_error", OracleDbType.Varchar2, 255);

            return objComando.ejecutarRegistroSP();

        }
        catch (Exception ex)
        {
            throw new Exception("ERROR Cotizador.AutorizaInspeccionBSPWEB_DB : " + ex.Message);
        }
        finally
        {
            conexion.Dispose();
        }
    }
    #endregion

    #region Procedimiento que guarda los datos de la inspeccion
    public DataRow GuardaDatosInspeccionBSPWeb_DB(string num_cotizacion, string num_matricula, string nombre_contacto, string direccion_contacto, string cod_region_contacto, string cod_ciudad_contacto, string cod_comuna_contacto, string fono_contacto, string celular_contacto, string observaciones_contacto, string nom_aseg, string cod_area, OracleConnection conexion)
    {
        MCommand objComando = new MCommand();

        try
        {
            objComando.Connection = conexion;

            objComando.CommandText = "MEL_K_INSPECCION.P_INGRESA_SOL_INSPEC_WEB_DIR";

            objComando.agregarINParametro("p_num_cotizacion", OracleDbType.Varchar2, num_cotizacion);
            objComando.agregarINParametro("p_patente", OracleDbType.Varchar2, num_matricula);
            objComando.agregarINParametro("p_nombre", OracleDbType.Varchar2, nom_aseg);
            objComando.agregarINParametro("p_direccion", OracleDbType.Varchar2, direccion_contacto);
            objComando.agregarINParametro("p_region", OracleDbType.Varchar2, cod_region_contacto);
            objComando.agregarINParametro("p_ciudad", OracleDbType.Varchar2, cod_ciudad_contacto);
            objComando.agregarINParametro("p_comuna", OracleDbType.Varchar2, cod_comuna_contacto);
            objComando.agregarINParametro("p_fono", OracleDbType.Varchar2, fono_contacto);
            objComando.agregarINParametro("p_cod_area", OracleDbType.Varchar2, cod_area);
            objComando.agregarINParametro("p_celular", OracleDbType.Varchar2, celular_contacto);
            objComando.agregarINParametro("p_observaciones", OracleDbType.Varchar2, observaciones_contacto);
            objComando.agregarINParametro("p_nombre_contacto", OracleDbType.Varchar2, nombre_contacto);
            objComando.agregarOUTParametro("p_error", OracleDbType.Varchar2, 255);

            return objComando.ejecutarRegistroSP();

        }
        catch (Exception ex)
        {
            throw new Exception("ERROR Cotizador.GuardaDatosInspeccionBSP_DB : " + ex.Message);
        }
        finally
        {
            conexion.Dispose();
        }
    }
    #endregion


}
