using System;
using System.Collections;
using System.Configuration;
using System.Data;
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
            this.Theme = Session["Theme"].ToString();
        }
        catch
        {
            Response.Redirect("SessionTerminada.aspx", false);
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            Vehiculo.Combo_Partes_Veh(drpDescripcionParte, drpDaños);
            Vehiculo.Combo_Accesorios(drpAccesorios);
            this.DivPartesVehiculo.Visible = false;
            this.DivAccesorios.Visible = false;

            if (Session["InspeccionExpress"] == null)
            {
                Session["InspeccionExpress"] = "NO";
            }

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

            this.lblCodDocumAseg.Text = UtilesWeb.getFormated(PolVeh.CodDocumAseg);
            this.lblNomAseg.Text = PolVeh.NomAseg;
            this.lblApePaterno.Text = PolVeh.ApePatAseg;
            this.lblApeMaterno.Text = PolVeh.ApeMatAseg;
            this.lblNumMatricula.Text = PolVeh.NumMatricula;
            this.lblNomMarca.Text = PolVeh.NomMarca;
            this.lblNomModelo.Text = PolVeh.NomModelo;
            this.lblNomSubModelo.Text = PolVeh.NomSubModelo;
            this.lblNroMotor.Text = PolVeh.NroMotor;
            this.lblNroChasis.Text = PolVeh.NroChasis;
            this.lblColor.Text = PolVeh.NomColor;
            this.lblAño.Text = PolVeh.AñoFab;


        }

        EscribeAccesorio();

        EscribeDaños();
    }

    #region Propiedes de la Tabla de Daños -  Agregar, eliminar

    protected void imgEliminar_Click(object sender, ImageClickEventArgs e)
    {
        string id = ((ImageButton)sender).ID.ToString();

        id = id.Substring(id.Length - 1, 1);

        ArrayList ArrDaños = AccesoriosVehiculo.CargaAccesorio();

        ArrDaños.RemoveAt(Convert.ToInt32(id));

        tblDaños.Rows.Remove(tblDaños.Rows[Convert.ToInt32(id) + 1]);

    }

    protected void ImgAgregar_Click(object sender, ImageClickEventArgs e)
    {

        char[] r = { '_' };
        string[] Codigo = this.drpDescripcionParte.SelectedValue.ToString().Split(r);

        string Cod_Parte = Codigo[0];

        string Cod_Sub_Parte = Codigo[1];

        DañosVehiculo Daños = new DañosVehiculo();

        if (ExisteDaño(Cod_Parte, Cod_Sub_Parte))
        {

            Daños.CodParte = Cod_Parte;
            Daños.CodSubParte = Cod_Sub_Parte;
            Daños.NomPartesVeh = this.drpDescripcionParte.SelectedItem.ToString();
            Daños.CodDaño = this.drpDaños.SelectedValue.ToString();
            Daños.NomDaño = this.drpDaños.SelectedItem.ToString();
            Daños.Observacion = this.txtObservacion.Text.ToString();

            AgregaDaño(Daños);

            this.txtObservacion.Text = "";
            this.drpDaños.SelectedIndex = 0;
            this.drpDescripcionParte.SelectedIndex = 0;
        }

    }

    public void AgregaDaño(DañosVehiculo Daños)
    {
        ArrayList ArrDaños = DañosVehiculo.CargaDaño();

        ArrDaños.Add(Daños);

        for (int i = ArrDaños.Count; i > 1; i--)
        {
            tblDaños.Rows.Remove(tblDaños.Rows[i - 1]);
        }

        EscribeDaños();

    }

    public bool ExisteDaño(string cod_parte, string cod_sub_parte)
    {
        ArrayList ArrDaños = DañosVehiculo.CargaDaño();

        for (int i = 0; i < ArrDaños.Count; i++)
        {
            if (((DañosVehiculo)ArrDaños[i]).CodParte.ToString() == cod_parte && ((DañosVehiculo)ArrDaños[i]).CodSubParte.ToString() == cod_sub_parte)
            {
                UtilesWeb.EjecutaJs(this, "alert('No es posible ingresar el daño porque este ya se encuentra registrado.');");
                return false;
            }
        }

        return true;
    }

    public void EscribeDaños()
    {
        ArrayList ArrDaños = DañosVehiculo.CargaDaño();

        for (int i = 0; i < ArrDaños.Count; i++)
        {
            TableRow rowTotal = new TableRow();
            ImageButton imgEliminar = new ImageButton();
            ImageButton Original = this.imgEliminarOriginal;

            imgEliminar.ID = "imgEliminar" + i;
            imgEliminar.ImageUrl = Original.ImageUrl;
            imgEliminar.Click += imgEliminar_Click;

            TableCell cellEliminar = new TableCell();
            cellEliminar.CssClass = "CeldaEliminar";
            cellEliminar.Controls.Add(imgEliminar);
            rowTotal.Cells.Add(cellEliminar);

            TableCell cellDesc = new TableCell();
            cellDesc.CssClass = "CeldaDesc";
            cellDesc.Controls.Add(new LiteralControl(((DañosVehiculo)ArrDaños[i]).NomPartesVeh));
            rowTotal.Cells.Add(cellDesc);

            TableCell cellDaño = new TableCell();
            cellDaño.CssClass = "CeldaDaño";
            cellDaño.Controls.Add(new LiteralControl(((DañosVehiculo)ArrDaños[i]).NomDaño));
            rowTotal.Cells.Add(cellDaño);

            TableCell cellObs = new TableCell();
            cellObs.CssClass = "CeldaObs";
            cellObs.Controls.Add(new LiteralControl(((DañosVehiculo)ArrDaños[i]).Observacion));
            rowTotal.Cells.Add(cellObs);

            tblDaños.Rows.Add(rowTotal);
        }
    }

    #endregion

    protected void rdbSinDanosPrevios_CheckedChanged(object sender, EventArgs e)
    {
        this.DivPartesVehiculo.Visible = false;
    }

    protected void rdbDanosPreexistentes_CheckedChanged(object sender, EventArgs e)
    {
        this.DivPartesVehiculo.Visible = true;
    }

    protected void imgEliminarAcc_Click(object sender, ImageClickEventArgs e)
    {
        string id = ((ImageButton)sender).ID.ToString();

        id = id.Substring(id.Length - 1, 1);

        ArrayList ArrAccesorios = AccesoriosVehiculo.CargaAccesorio();

        ArrAccesorios.RemoveAt(Convert.ToInt32(id));

        tblAccesorios.Rows.Remove(tblAccesorios.Rows[Convert.ToInt32(id) + 1]);

    }

    protected void ImgAgregarAcc_Click(object sender, ImageClickEventArgs e)
    {

        string Cod_Accesorio = this.drpAccesorios.SelectedValue.ToString();

        AccesoriosVehiculo Accesorio = new AccesoriosVehiculo();

        if (ExisteAccesorio(Cod_Accesorio))
        {
            Accesorio.CodAccesorio = Cod_Accesorio;
            Accesorio.NomAccesorio = this.drpAccesorios.SelectedItem.ToString();
            Accesorio.Observacion = this.txtObservacionAccesorios.Text.ToString();

            AgregaAccesorio(Accesorio);

            this.txtObservacionAccesorios.Text = "";
            this.drpAccesorios.SelectedIndex = 0;
        }

    }

    public void AgregaAccesorio(AccesoriosVehiculo Accesorio)
    {
        ArrayList ArrAccesorios = AccesoriosVehiculo.CargaAccesorio();

        ArrAccesorios.Add(Accesorio);

        for (int i = ArrAccesorios.Count; i > 1; i--)
        {
            tblAccesorios.Rows.Remove(tblAccesorios.Rows[i - 1]);
        }

        EscribeAccesorio();

    }

    public bool ExisteAccesorio(string cod_acc)
    {
        ArrayList ArrAccesorios = AccesoriosVehiculo.CargaAccesorio();

        for (int i = 0; i < ArrAccesorios.Count; i++)
        {
            if (((AccesoriosVehiculo)ArrAccesorios[i]).CodAccesorio.ToString() == cod_acc)
            {
                UtilesWeb.EjecutaJs(this, "alert('No es posible ingresar el accesorio porque este ya se encuentra registrado.');");
                return false;
            }
        }

        return true;
    }

    public void EscribeAccesorio()
    {
        ArrayList ArrAccesorios = AccesoriosVehiculo.CargaAccesorio();

        for (int i = 0; i < ArrAccesorios.Count; i++)
        {
            TableRow rowTotal = new TableRow();
            ImageButton imgEliminar = new ImageButton();
            ImageButton Original = this.imgEliminarOriginal;

            imgEliminar.ID = "ImgEliminarAcc" + i;
            imgEliminar.ImageUrl = Original.ImageUrl;
            imgEliminar.Click += imgEliminarAcc_Click;

            TableCell cellEliminar = new TableCell();
            cellEliminar.CssClass = "CeldaEliminar";
            cellEliminar.Controls.Add(imgEliminar);
            rowTotal.Cells.Add(cellEliminar);

            TableCell cellDesc = new TableCell();
            cellDesc.CssClass = "CeldaDesc";
            cellDesc.Controls.Add(new LiteralControl(((AccesoriosVehiculo)ArrAccesorios[i]).NomAccesorio));
            rowTotal.Cells.Add(cellDesc);

            TableCell cellObs = new TableCell();
            cellObs.CssClass = "CeldaObs";
            cellObs.Controls.Add(new LiteralControl(((AccesoriosVehiculo)ArrAccesorios[i]).Observacion));
            rowTotal.Cells.Add(cellObs);

            tblAccesorios.Rows.Add(rowTotal);
        }
    }

    protected void rdbSinAccesorios_CheckedChanged(object sender, EventArgs e)
    {
        this.DivAccesorios.Visible = false;
    }

    protected void rdbConAccesorios_CheckedChanged(object sender, EventArgs e)
    {
        this.DivAccesorios.Visible = true;
    }

    protected void ImgGuardar_Click(object sender, ImageClickEventArgs e)
    {
        string datos_daños = "";
        string datos_accesorios = "";

        ArrayList ArrAccesorios = AccesoriosVehiculo.CargaAccesorio();

        for (int i = 0; i < ArrAccesorios.Count; i++)
        {
            datos_accesorios = datos_accesorios + ((AccesoriosVehiculo)ArrAccesorios[i]).NomAccesorio.ToString() + "|";
            datos_accesorios = datos_accesorios + ((AccesoriosVehiculo)ArrAccesorios[i]).Observacion.ToString() + "||";
            datos_accesorios = datos_accesorios + ((AccesoriosVehiculo)ArrAccesorios[i]).CodAccesorio + "|";
        }


        ArrayList ArrDaños = DañosVehiculo.CargaDaño();

        for (int i = 0; i < ArrDaños.Count; i++)
        {
            datos_daños = datos_daños + ((DañosVehiculo)ArrDaños[i]).NomPartesVeh.ToString() + "|";
            datos_daños = datos_daños + ((DañosVehiculo)ArrDaños[i]).Observacion.ToString() + "|";
            datos_daños = datos_daños + ((DañosVehiculo)ArrDaños[i]).CodDaño.ToString() + "|";
            datos_daños = datos_daños + ((DañosVehiculo)ArrDaños[i]).CodParte.ToString() + "|";
            datos_daños = datos_daños + ((DañosVehiculo)ArrDaños[i]).CodSubParte.ToString() + "|";
        }

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

        string resultado = Vehiculo.GuardaDatosInspeccion(PolVeh.NumCotizacion, "", "", datos_daños, datos_accesorios);

        if (resultado == "OK")
        {
            Session["InspeccionExpress"] = "OK";

            UtilesWeb.EjecutaJs(this, "alert('Los datos de la inspeccion han sido almacenados exitosamente.');");
            UtilesWeb.EjecutaJs(this, "window.close();");
        }
        else
        {
            Session["InspeccionExpress"] = "NO";

            UtilesWeb.EnviaCorreoAcusete(resultado, "Cot. Veh. Livianos - Emision.asxp - Inspeccion Express");
            UtilesWeb.EjecutaJs(this, "alert('Se registro un error al momento de generar la inspeccion, intentalo de nuevo mas tarde.');");
            return;
        }

    }

    protected void ImgCancelar_Click(object sender, ImageClickEventArgs e)
    {
        //UtilesWeb.EjecutaJs(this, "window.close();");        
    }
}
