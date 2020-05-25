using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

/// <summary>
/// Summary description for Poliza
/// </summary>
public class Poliza
{
    public string CodDocum;
    public string Convenio;

    public string CodDocumAseg;
    public string NomAseg;
    public string ApePatAseg;
    public string ApeMatAseg;
    public string EdadAseg;
    public string SexoAseg;
    public string DirAseg;
    public string CodRegionAseg;
    public string CodCiudadAseg;
    public string CodComunaAseg;
    public string FonoAseg;
    public string FonoAseg2;
    public string EmailAseg;

    public string CodDocumTomad;
    public string NomTomad;
    public string ApePatTomad;
    public string ApeMatTomad;
    public string EdadTomad;
    public string SexoTomad;
    public string DirTomad;
    public string CodRegionTomad;
    public string CodCiudadTomad;
    public string CodComunaTomad;
    public string FonoTomad;
    public string FonoTomad2;
    public string EmailTomad;

    public string ID;
    public string NumMatricula;
    public string CodMarca;
    public string NomMarca;
    public string CodModelo;
    public string NomModelo;
    public string CodSubModelo;
    public string NomSubModelo;
    public string AñoFab;
    public string Fact48;
    public string CodColor;
    public string NomColor;
    public string NroMotor;
    public string NroChasis;
    public string NumInspeccion;
    public string NomTipoVeh;

    public string CantSiniestros;
    public string MontoSiniestros;

    public string TipoDescuentoDataBusiness;
    public string DescuentoDataBusiness;

    public string RCExceso;
    public string CobOpc;
    public string CodCuadroCom;

    public string PrimaNeta;
    public string Descuento;    
    public string PrimaTotal;
    public string NumCuota;
    public string Cuota;
    public string NumCuotaPAT;
    public string CuotaPAT;
    public string DiaPago;
    public string CodModalidad;
    public string NomModalidad;
    public string CodPlanPago;

    public string FormaPago;

    public string CodBanco;
    public string CodTarjeta;
    public string NroTarjeta;
    public string MesTarjeta;
    public string AñoTarjeta;

    public string Inspeccion;

    public string FecFactura;
    public string NumFactura;
    public string CodDocumAutomotora;
    public string NomAutomotora;

    public string MontoRC;
    public string CodRamo;
    public string NumCotizacion;
    public string FechaVigencia;
    public string McaMel;
    public string FechaCotizacion;

    public string XML;
    public string NumPoliza;
    public string ErrorEmision;

    //FMOUAT
    public string PreguntaHijos;
    public string PreguntaFranquicia;
    public string PreguntaDanosPre;

    //CJSS
    public string FechaInicioVigencia;
    public string FechaFinVigencia;


    public Poliza()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public static Poliza CargaPoliza()
    {
        Poliza PolVeh;

        if (HttpContext.Current.Session["PolVeh"] != null)
        {
            PolVeh = (Poliza)HttpContext.Current.Session["PolVeh"];
        }
        else
        {
            PolVeh = new Poliza();
            HttpContext.Current.Session["PolVeh"] = PolVeh;
        }

        return PolVeh;

    }
}