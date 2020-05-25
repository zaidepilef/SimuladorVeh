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
/// Summary description for Localidades
/// </summary>
public class Localidades
{
    #region Carga Regiones
    public static void Carga_Regiones(DropDownList cmb)
    {
        try
        {
            using (OracleConnection cnx = MConexion.getConexion("OF0"))
            {
                Localidades_DB objdb = new Localidades_DB();
                DataSet ds = objdb.getRegion(cnx, "CHI");

                cmb.DataSource = ds;
                cmb.DataTextField = "Nom_Estado";
                cmb.DataValueField = "Cod_Estado";
                cmb.DataBind();
                cmb.Items.Insert(0, new ListItem("Seleccionar", "0"));
                cmb.SelectedIndex = 0;
            }
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }

    }
    #endregion

    #region Carga Ciudad



    public static void Carga_Ciudades(DropDownList cmb, string cod_estado)
    {
        try
        {
            cmb.Items.Clear();
            using (OracleConnection cnx = MConexion.getConexion("OF0"))
            {
                Localidades_DB objdb = new Localidades_DB();
                DataSet ds = objdb.getCiudad(cnx, "CHI", cod_estado);

                cmb.DataSource = ds;
                cmb.DataTextField = "Nom_Prov";
                cmb.DataValueField = "Cod_Prov";


                cmb.DataBind();
                cmb.Items.Insert(0, new ListItem("Seleccionar", "0"));
                cmb.SelectedIndex = 0;
            }
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }

    }




    #endregion

    #region Carga Comuna





    public static void Carga_Comunas(DropDownList cmb, string cod_prov)
    {
        try
        {
            cmb.Items.Clear();
            using (OracleConnection cnx = MConexion.getConexion("OF0"))
            {

                Localidades_DB objdb = new Localidades_DB();
                DataSet ds = objdb.getComuna(cnx, "CHI", cod_prov);

                cmb.DataSource = ds;
                cmb.DataTextField = "Nom_Localidad";
                cmb.DataValueField = "Cod_Localidad";

                cmb.DataBind();
                cmb.Items.Insert(0, new ListItem("Seleccionar", "0"));
                cmb.SelectedIndex = 0;
            }
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }

    }



    #endregion

    #region Carga Comuna para despacho
    public static HtmlSelect Combo_Comuna_despacho(System.Web.UI.HtmlControls.HtmlSelect combo, string cod_ciu)
    {

        combo.ID = "cmbComunasaseg";
        combo.Name = "cmbComunasaseg";

        if (cod_ciu != "0")
        {
            Localidades comu = new Localidades();

            combo.DataSource = comu.Carga_Comunas_despacho(cod_ciu);
            combo.DataTextField = "nom_localidad";
            combo.DataValueField = "cod_localidad";
            combo.DataBind();

            if (combo.Items.Count > 1)
                combo = UtilesWeb.Agrega_Seleccionar(combo);
        }
        else
            combo = UtilesWeb.Agrega_Seleccionar(combo);

        return combo;
    }

    public DataSet Carga_Comunas_despacho(string ciu)
    {
        try
        {
            using (OracleConnection cnx = MConexion.getConexion("OF0"))
            {
                Localidades_DB objdb = new Localidades_DB();

                DataSet ds = objdb.getComuna_despacho(cnx, "CHI", ciu);

                return ds;

            }
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }

    }
    #endregion

    #region Carga Region y selecciona
    public void Carga_Region(DropDownList cmb, string valor)
    {
        try
        {
            using (OracleConnection cnx = MConexion.getConexion("OF0"))
            {
                Localidades_DB objdb = new Localidades_DB();
                DataSet ds = objdb.getRegion(cnx, "CHI");

                cmb.DataSource = ds;
                cmb.DataTextField = "Nom_Estado";
                cmb.DataValueField = "Cod_Estado";
                cmb.DataBind();
                cmb.Items.Insert(0, new ListItem("Seleccionar", "0"));

                if (int.Parse(valor) > 0)
                {
                    cmb.SelectedIndex = 0;
                    foreach (ListItem item in cmb.Items)
                    {
                        if (item.Value == valor)
                        {
                            cmb.SelectedValue = valor;
                            break;
                        }
                    }
                }
                else
                    cmb.SelectedIndex = 0;

            }
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }

    }
    #endregion

    #region Carga Ciudad y selecciona
    public void Carga_Ciudad(DropDownList cmb, string Region, string valor)
    {
        try
        {
            using (OracleConnection cnx = MConexion.getConexion("OF0"))
            {
                Localidades_DB objdb = new Localidades_DB();
                DataSet ds = objdb.getCiudad(cnx, "CHI", Region);

                cmb.DataSource = ds;
                cmb.DataTextField = "NOM_PROV";
                cmb.DataValueField = "Cod_PROV";
                cmb.DataBind();
                cmb.Items.Insert(0, new ListItem("Seleccionar", "0"));
                //
                if (int.Parse(valor) > 0)
                {
                    cmb.SelectedIndex = 0;
                    foreach (ListItem item in cmb.Items)
                    {
                        if (item.Value == valor)
                        {
                            cmb.SelectedValue = valor;
                            break;
                        }
                    }
                }
                else
                    cmb.SelectedIndex = 0;

            }
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }

    }
    #endregion

    #region Carga Comuna y selecciona
    public void Carga_Comuna(DropDownList cmb, string ciudad, string valor)
    {
        try
        {
            using (OracleConnection cnx = MConexion.getConexion("OF0"))
            {
                Localidades_DB objdb = new Localidades_DB();
                DataSet ds = objdb.getComuna(cnx, "CHI", ciudad);

                cmb.DataSource = ds;
                cmb.DataTextField = "NOM_LOCALIDAD";
                cmb.DataValueField = "Cod_LOCALIDAD";
                cmb.DataBind();
                cmb.Items.Insert(0, new ListItem("Seleccionar", "0"));
                //
                if (int.Parse(valor) > 0)
                {
                    cmb.SelectedIndex = 0;
                    foreach (ListItem item in cmb.Items)
                    {
                        if (item.Value == valor)
                        {
                            cmb.SelectedValue = valor;
                            break;
                        }
                    }

                }
                else
                    cmb.SelectedIndex = 0;

            }
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }

    }
    #endregion		

}
