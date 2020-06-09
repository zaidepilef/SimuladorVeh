<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Emisor.aspx.cs" Inherits="Emisor" Title="Emisión de Vehículos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript">
    function MuestraAyudaNumero()
    {
        document.getElementById("tarjeta").style.display = "none";
		document.getElementById("tarjeta_numero").style.display = "none";
		document.getElementById("tarjeta_fecha").style.display = "block";  
    }
    
    function MuestraAyudaFecha()
    {
        document.getElementById("tarjeta").style.display = "none";
		document.getElementById("tarjeta_numero").style.display = "block";
		document.getElementById("tarjeta_fecha").style.display = "none"; 
    }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <asp:ScriptManager ID="ScriptManager1" AsyncPostBackTimeout="600" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="DatosCotizacionEmisor">
                <fieldset>
                    <table>
                        <tr>
                            <td style="width: 12%;">
                                Número de Simulación:
                            </td>
                            <td>
                                <strong>
                                    <asp:Label ID="lblNumCotizacion" runat="server"></asp:Label></strong>
                            </td>
                            <td style="width: 12%;">
                                Fecha de la Simulación:
                            </td>
                            <td>
                                <strong>
                                    <asp:Label ID="lblFecCotizacion" runat="server"></asp:Label>
                                </strong>
                            </td>
                            <td style="width: 15%;">
                                Nombre de la Modalidad:
                            </td>
                            <td>
                                <strong>
                                    <asp:Label ID="lblNomModalidad" runat="server"></asp:Label>
                                </strong>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Prima Neta:
                            </td>
                            <td>
                                <strong>
                                    <asp:Label ID="lblPrimaNeta" runat="server"></asp:Label>
                                </strong>
                            </td>
                            <td>
                                Prima Bruta:
                            </td>
                            <td>
                                <strong>
                                    <asp:Label ID="lblPrimaBruta" runat="server"></asp:Label>
                                </strong>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </div>
            <asp:HiddenField runat="server" ID="hdn_AutoNuevo" />
            <div id="DatosVehiculoEmisor">
                <fieldset>
                    <table>
                        <tr>
                            <td colspan="4" class="titItem">
                                <asp:Label ID="lblDatosVeh" CssClass="TituloSecundario" runat="server" Text="datos del vehiculo"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 12%;">
                                <asp:Label ID="lblTituloTipVeh" runat="server"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblTipVehiculo" runat="server"></asp:Label>
                            </td>
                            <td style="width: 12%;">
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 12%;">
                                patente:
                            </td>
                            <td>
                                <asp:Label ID="lblNumMatricula" runat="server"></asp:Label>
                            </td>
                            <td style="width: 12%;">
                                marca:
                            </td>
                            <td>
                                <asp:Label ID="lblNomMarca" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                modelo:
                            </td>
                            <td>
                                <asp:Label ID="lblNomModelo" runat="server"></asp:Label>
                            </td>
                            <td>
                                sub modelo:
                            </td>
                            <td>
                                <asp:Label ID="lblNomSubModelo" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                año fabricación:
                            </td>
                            <td>
                                <asp:Label ID="lblAño" runat="server"></asp:Label>
                            </td>
                            <td>
                                color:
                            </td>
                            <td>
                                <asp:DropDownList ID="drpColor" runat="server" ToolTip="Seleccione el color del Vehículo"
                                    OnSelectedIndexChanged="drpColor_SelectedIndexChanged" AutoPostBack="true">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                nro. motor:
                            </td>
                            <td>
                                <asp:TextBox ID="txtNroMotor" runat="server" MaxLength="20" ToolTip="Ingrese el Nro. de Motor del Vehículo"
                                    OnTextChanged="txtNroMotor_TextChanged" AutoPostBack="true"></asp:TextBox>
                            </td>
                            <td>
                                nro. chasis:
                            </td>
                            <td>
                                <asp:TextBox ID="txtNroChasis" runat="server" MaxLength="30" ToolTip="Ingrese el Nro. de Chasis del Vehículo"
                                    OnTextChanged="txtNroChasis_TextChanged" AutoPostBack="true"></asp:TextBox>
                            </td>
                        </tr>
                        <tr id="trDatosFactura" runat="server">
                            <td colspan="4">
                                <table width="934" border="0" cellpadding="0" cellspacing="0">
                                    <tr class="TopFactura">
                                        <td colspan="4">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4" class="BodyFacturaTop">
                                            <table>
                                                <tr>
                                                    <td class="ImgFactura">
                                                        &nbsp;
                                                    </td>
                                                    <td style="vertical-align= middle;">
                                                        <strong>datos de la factura</strong>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="BodyFacturaLeft" style="width: 15%;">
                                            <asp:Label ID="lblFechaFactura" runat="server" Text="fecha de la factura:"></asp:Label>
                                        </td>
                                        <td class="BodyFacturaCenter" style="width: 38%;">
                                            <table>
                                                <tr>
                                                    <td>
                                                        <asp:TextBox ID="txtFechaFactura" ToolTip="Ingrese la Fecha de la Factura" ReadOnly="false"
                                                            AutoPostBack="true" CssClass="TextBox" runat="server" MaxLength="10" OnTextChanged="txtFechaFactura_TextChanged"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                        <input type="button" class="calendario" id="calendar-trigger2" onclick="ini2()"  />
                                                    </td>
                                                    <td>
                                                        (Ej: 23-05-2011)
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td class="BodyFacturaCenter" style="width: 15%;">
                                            <asp:Label ID="lblNumFactura" runat="server" Text="número de factura:"></asp:Label>
                                        </td>
                                        <td class="BodyFacturaRight" style="width: 32%;">
                                            <asp:TextBox ID="txtNumFactura" MaxLength="10" runat="server" 
                                                ToolTip="Ingrese el Número de la Factura" 
                                                ontextchanged="txtNumFactura_TextChanged" AutoPostBack="true"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="BodyFacturaLeft">
                                            <asp:Label ID="lblRutAutomotora" runat="server" Text="rut de la automotora:"></asp:Label>
                                        </td>
                                        <td class="BodyFacturaCenter">
                                            <asp:TextBox ID="txtRutAutomotora" MaxLength="9" runat="server" ToolTip="Ingrese el RUT de la Automotora"
                                                AutoPostBack="true" OnTextChanged="txtRutAutomotora_TextChanged"></asp:TextBox>&nbsp;&nbsp;
                                            (Sin puntos ni guión)
                                        </td>
                                        <td class="BodyFacturaCenter">
                                            <asp:Label ID="lblNomAutomotora" runat="server" Text="nombre de la automotora:"></asp:Label>
                                        </td>
                                        <td class="BodyFacturaRight">
                                            <asp:TextBox ID="txtNomAutomotora" runat="server" MaxLength="80" ToolTip="Ingrese el Nombre de la Automotora"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr class="BottomFactura">
                                        <td colspan="4">
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </div>
            <div id="DatosAseguradoEmisor">
                <fieldset>
                    <table>
                        <tr>
                            <td colspan="4" class="titItem">
                                <asp:Label ID="lblDatosAsegurado" CssClass="TituloSecundario" runat="server" Text="datos del Asegurado"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 12%;">
                                rut:
                            </td>
                            <td style="width: 38%;">
                                <asp:TextBox ID="txtCodDocumAseg" MaxLength="15" runat="server"></asp:TextBox>&nbsp;&nbsp;
                                (Sin puntos ni guión)
                            </td>
                            <td style="width: 12%;">
                                Nombres:
                            </td>
                            <td style="width: 38%;">
                                <asp:TextBox ID="txtNomAseg" MaxLength="80" runat="server" OnTextChanged="txtNomAseg_TextChanged"
                                    ToolTip="Ingrese el Apellido Paterno del Asegurado"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                apellido paterno :
                            </td>
                            <td>
                                <asp:TextBox ID="txtApePaternoAseg" MaxLength="30" runat="server" OnTextChanged="txtApePaternoAseg_TextChanged"
                                    ToolTip="Ingrese el Apellido Materno del Asegurado"></asp:TextBox>
                            </td>
                            <td>
                                apellido materno:
                            </td>
                            <td>
                                <asp:TextBox ID="txtApeMaternoAseg" MaxLength="30" runat="server" OnTextChanged="txtApeMaternoAseg_TextChanged"
                                    ToolTip="Ingrese el Apellido Materno del Asegurado"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                dirección:
                            </td>
                            <td>
                                <asp:TextBox ID="txtDireccionAseg" runat="server" MaxLength="40" AutoPostBack="true"
                                    OnTextChanged="txtDireccionAseg_TextChanged" ToolTip="Ingrese la Dirección del Asegurado"></asp:TextBox>
                            </td>
                            <td>
                                región:
                            </td>
                            <td>
                                <asp:DropDownList ID="drpRegionAseg" runat="server" OnSelectedIndexChanged="drpRegionAseg_SelectedIndexChanged"
                                    ToolTip="Seleccione la Region del Asegurado" AutoPostBack="true">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                ciudad:
                            </td>
                            <td>
                                <asp:DropDownList ID="drpCiudadAseg" runat="server" AutoPostBack="true" OnSelectedIndexChanged="drpCiudadAseg_SelectedIndexChanged"
                                    ToolTip="Seleccione la Ciudad del Asegurado">
                                    <asp:ListItem Value="Seleccionar">Seleccionar</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                comuna:
                            </td>
                            <td>
                                <asp:DropDownList ID="drpComunaAseg" runat="server" AutoPostBack="true" OnSelectedIndexChanged="drpComunaAseg_SelectedIndexChanged"
                                    ToolTip="Seleccione la Comuna del Asegurado">
                                    <asp:ListItem Value="Seleccionar">Seleccionar</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                telefono:
                            </td>
                            <td>
                                <asp:TextBox ID="txtFonoAseg" MaxLength="10" runat="server" AutoPostBack="true" OnTextChanged="txtFonoAseg_TextChanged"
                                    ToolTip="Ingrese el Telefono del Asegurado"></asp:TextBox>
                            </td>
                            <td>
                                email:
                            </td>
                            <td>
                                <asp:TextBox ID="txtEmailAseg" MaxLength="60" ToolTip="Ingrese un correo electrónico válido"
                                    runat="server" AutoPostBack="true" OnTextChanged="txtEmailAseg_TextChanged" Width="180px"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </div>
            <div id="DatosTomadorEmisor">
                <fieldset>
                    <table>
                        <tr>
                            <td colspan="4" class="titItem">
                                <asp:Label ID="lblDatosTomador" CssClass="TituloSecundario" runat="server" Text="datos del tomador"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 12%;">
                                rut:
                            </td>
                            <td style="width: 38%;">
                                <asp:TextBox ID="txtCodDocumTomad" MaxLength="15" runat="server" AutoPostBack="true"
                                    OnTextChanged="txtCodDocumTomad_TextChanged" ToolTip="Ingrese el RUT del Tomador"></asp:TextBox>&nbsp;&nbsp;
                                (Sin puntos ni guión)
                            </td>
                            <td style="width: 12%;">
                                nombres:
                            </td>
                            <td style="width: 38%;">
                                <asp:TextBox ID="txtNomTomad" MaxLength="80" runat="server" ToolTip="Ingrese el Nombre del Tomador"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                apellido paterno :
                            </td>
                            <td>
                                <asp:TextBox ID="txtApePaternoTomad" MaxLength="30" runat="server" ToolTip="Ingrese el Apellido Paterno del Tomador"></asp:TextBox>
                            </td>
                            <td>
                                apellido materno:
                            </td>
                            <td>
                                <asp:TextBox ID="txtApeMaternoTomad" MaxLength="30" runat="server" ToolTip="Ingrese el Apellido Materno del Tomador"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                dirección:
                            </td>
                            <td>
                                <asp:TextBox ID="txtDireccionTomad" MaxLength="40" runat="server" ToolTip="Ingrese la Direccion del Tomador"></asp:TextBox>
                            </td>
                            <td>
                                región:
                            </td>
                            <td>
                                <asp:DropDownList ID="drpRegionTomad" runat="server" AutoPostBack="true" OnSelectedIndexChanged="drpRegionTomad_SelectedIndexChanged"
                                    ToolTip="Seleccione la Region del Tomador">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                ciudad:
                            </td>
                            <td>
                                <asp:DropDownList ID="drpCiudadTomad" runat="server" AutoPostBack="true" OnSelectedIndexChanged="drpCiudadTomad_SelectedIndexChanged"
                                    ToolTip="Seleccione la Ciudad del Tomador">
                                    <asp:ListItem Value="Seleccionar">Seleccionar</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                comuna:
                            </td>
                            <td>
                                <asp:DropDownList ID="drpComunaTomad" runat="server" ToolTip="Seleccione la Comuna del Tomador">
                                    <asp:ListItem Value="Seleccionar">Seleccionar</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                telefono:
                            </td>
                            <td>
                                <asp:TextBox ID="txtFonoTomad" MaxLength="10" runat="server" ToolTip="Ingrese la Telefono del Tomador"></asp:TextBox>
                            </td>
                            <td>
                                email:
                            </td>
                            <td>
                                <asp:TextBox ID="txtEmailTomad" MaxLength="60" runat="server" Width="180px" ToolTip="Ingrese un correo electrónico válido"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </div>
            <div id="DatosPreguntas">
                <fieldset>
                </fieldset>
            </div>    
            <div id="DatosInspeccionEmisor">
                <fieldset>
                    <table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tr id="trTituloDeclaracion" runat="server">
                            <td class="titItem">
                                Declaración sobre el Estado del Vehículo
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div id="dvDeclaracionEstado" runat="server">
                                    <div id="apartado" class="apartado">
                                        <div class="cbp-mc-form contenido" id="formDeclaracionEstado" runat="server">
                                        </div>
                                        <br />
                                        <div class="cbp-mc-form contenido">
                                            <div class="bloque clearfix" style="margin-bottom: 0px; padding-top: 5px">
                                                    <asp:CheckBox ID="chkPreguntasDeclaracionEstado" runat="server" 
                                                    CssClass="chkConfirmo alineacion clearfix" GroupName="grpDeclaracionEstado"/>
                                            </div>
                                        </div>
                                        <asp:HiddenField ID="hdnR1" runat="server" />
                                        <asp:HiddenField ID="hdnR2" runat="server" />
                                        <asp:HiddenField ID="hdnR3" runat="server" />
                                        <asp:HiddenField ID="hdnR4" runat="server" />
                                        <asp:HiddenField ID="EsAmunategui" runat="server" />
                                        
                                    </div>
                                    </div>
                                <%--<asp:CheckBox ID="chkDeclaracion" runat="server" Text="Declaro expresamente que he tomado conocimiento que las respuestas entregadas en la sección “Declaración sobre el Estado del Riesgo” son determinantes para la evaluación del riesgo por parte de MAPFRE y que cualquier error, reticencia o inexactitud facultará a MAPFRE a rescindir el contrato de seguros y/o exonerar a MAPFRE de la obligación de pagar cualquier indemnización en caso de siniestro. (Art. 524 y 525 del Código de Comercio). Adicionalmente declaro estar en conocimiento que MAPFRE no será responsable de ningún siniestro y por ende los daños si éste hubiere ocurrido antes del inicio de vigencia de la póliza. (Art. 532 del Código de Comercio). " />--%>
                            </td>
                        </tr>
                        <tr>
                            <td class="titItem">
                                <asp:Label ID="lblInspeccion" CssClass="TituloSecundario" runat="server" Text="inspección"></asp:Label>
                            </td>
                        </tr>

                        <tr id="trCentrosInspeccion" runat="server">
                            
                            <%-- CENTROS DE INSPECCION --%>
                            <td>
                                <asp:RadioButton ID="rdbCentrosInspeccion" AutoPostBack="true" GroupName="rdbInspeccion"
                                    Text="Inspeccion en Centros de Inspección" runat="server" OnCheckedChanged="rdbCentrosInspeccion_CheckedChanged" />
                                &nbsp;&nbsp;<asp:LinkButton ID="lnkDatosCentrosInspeccion" runat="server" OnClick="lnkDatosCentrosInspeccion_Click">mas información</asp:LinkButton>
                            </td>
                        </tr>

                        <tr id="trDatosCentrosInspeccion" runat="server">
                            <td>
                                <table width="400" cellpadding="0" cellspacing="0" border="0">
                                    <tr class="TopCentros">
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="BodyCentrosTop">
                                            <table cellpadding="0" cellspacing="0" border="0">
                                                <tr>
                                                    <td>
                                                        La inspección puede realizarse en:
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <table cellpadding="0" cellspacing="0" border="0">
                                                            <tr>
                                                                <td class="fuenteDireccion">
                                                                    Oficinas Comerciales MAPFRE
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="fuenteDireccion2">
                                                                    Horario de Atención
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="fuenteDireccion3">
                                                                    Lunes a Jueves 8:30 a 13:30 – 14:30 a 18:00 horas.
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="fuenteDireccion3">
                                                                    Viernes 8:30 a 13:30 – 14:30 a 16:00 horas.
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="BottomCentros">
                                            &nbsp;
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        
                        <tr id="trInspeccionDomicilio" runat="server" visible = "false">
                            <%-- INSPECCION A DOMICILIO --%>
                            <td>
                                <asp:RadioButton ID="rdbInspeccionDomicilio" AutoPostBack="true" GroupName="rdbInspeccion" visible = "false"
                                    Text="Inspeccion a Domicilio" runat="server" OnCheckedChanged="rdbInpeccionDomicilio_CheckedChanged" />
                            </td>
                        </tr>

                        <tr id="trDatosContacto" runat="server">
                            <td>
                                <table width="700">
                                    <tr class="TopContacto">
                                        <td colspan="6">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="BodyContactoTop" colspan="6">
                                            <table width="100%">
                                                <tr>
                                                    <td class="ImgContacto">
                                                        &nbsp;
                                                    </td>
                                                    <td style="vertical-align= middle;">
                                                        <strong>Datos de Contacto para la Inspección a Domicilio</strong>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="BodyContactoLeft" style="width: 15%;">
                                            Nombre Completo:
                                        </td>
                                        <td class="BodyContactoRight" colspan="5">
                                            <asp:TextBox ID="txtNomContacto" ToolTip="Ingrese el Nombre Completo del Contacto para la Inspeccion a Domicilio" MaxLength="30" Width="250px" runat="server"></asp:TextBox>
                                            &nbsp; &nbsp; &nbsp; &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="BodyContactoLeft">
                                            Dirección para la Inspección:
                                        </td>
                                        <td class="BodyContactoRight" colspan="5">
                                            <asp:TextBox ID="txtDireccionContacto" ToolTip="Ingrese la Direccion para la Inspeccion a Domicilio" Width="250px" runat="server"></asp:TextBox>
                                            &nbsp; &nbsp; &nbsp; &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="BodyContactoLeft">
                                            Región:
                                        </td>
                                        <td class="BodyContactoCenter">
                                            <asp:DropDownList ID="drpRegionContacto" runat="server" AutoPostBack="true" OnSelectedIndexChanged="drpRegionContacto_SelectedIndexChanged"
                                                ToolTip="Seleccione la Region para la Inspeccion a Domicilio">
                                            </asp:DropDownList>
                                        </td>
                                        <td class="BodyContactoCenter">
                                            Ciudad:
                                        </td>
                                        <td class="BodyContactoCenter">
                                            <asp:DropDownList ID="drpCiudadContacto" runat="server" AutoPostBack="true" OnSelectedIndexChanged="drpCiudadContacto_SelectedIndexChanged"
                                                ToolTip="Seleccione la Ciudad del Tomador para la Inspeccion a Domicilio">
                                                <asp:ListItem Value="0">Seleccionar</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td class="BodyContactoCenter">
                                            Comuna:
                                        </td>
                                        <td class="BodyContactoRight">
                                            <asp:DropDownList ID="drpComunaContacto" runat="server" ToolTip="Seleccione la Comuna del Tomador para la Inspeccion a Domicilio">
                                                <asp:ListItem Value="0">Seleccionar</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="BodyContactoLeft">
                                            Teléfono Fijo:
                                        </td>
                                        <td class="BodyContactoCenter">
                                            <asp:TextBox ID="txtCodAreaFonoContacto" ToolTip="Ingrese el Codigo de Area del Telefono Fijo de Contacto para la Inspeccion a Domicilio" MaxLength="2" Width="20px" runat="server"></asp:TextBox>-
                                            <asp:TextBox ID="txtFonoContacto" MaxLength="8"  ToolTip="Ingrese el Telefono Fijo de Contacto para la Inspeccion a Domicilio" Width="80px" runat="server"></asp:TextBox>
                                        </td>
                                        <td class="BodyContactoCenter">
                                            &nbsp;
                                        </td>
                                        <td class="BodyContactoCenter">
                                            &nbsp;
                                        </td>
                                        <td class="BodyContactoCenter">
                                            &nbsp;
                                        </td>
                                        <td class="BodyContactoRight">
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="BodyContactoLeft">
                                            Teléfono Movil:
                                        </td>
                                        <td class="BodyContactoCenter">
                                            <asp:TextBox ID="txtCodMovilContacto"  MaxLength="2" Width="20px" runat="server"></asp:TextBox>-<asp:TextBox
                                                ID="txtMovilContacto" ToolTip="Ingrese el Telefono Movil de Contacto para la Inspeccion a Domicilio" MaxLength="8" Width="80px" runat="server"></asp:TextBox>
                                        </td>
                                        <td class="BodyContactoCenter">
                                            &nbsp;
                                        </td>
                                        <td class="BodyContactoCenter">
                                            &nbsp;
                                        </td>
                                        <td class="BodyContactoCenter">
                                            &nbsp;
                                        </td>
                                        <td class="BodyContactoRight">
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="BodyContactoLeft">
                                            Observaciones:
                                        </td>
                                        <td class="BodyContactoRight" colspan="5">
                                            <asp:TextBox ID="txtObsContacto" ToolTip="Ingrese alguna Observacion para la Inspeccion a Domicilio" MaxLength="100" runat="server" Width="248px"></asp:TextBox>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td class="BottomContacto" colspan="6">
                                            &nbsp;
                                        </td>
                                    </tr>

                                </table>
                            </td>
                        </tr>


                        <%--autoinspeccion--%>
                        <tr id="tr1" runat="server">
                            <td>
                                <asp:RadioButton ID="rbtAutoinspeccion" AutoPostBack="true" GroupName="rdbInspeccion"
                                    Text="App autoinspeccón" runat="server" OnCheckedChanged="rbtAutoinspeccion_CheckedChanged" />
                                &nbsp;&nbsp;<asp:LinkButton ID="LinkButton1" runat="server" >!Nuevo!</asp:LinkButton>
                                    </span>
                            </td>
                        </tr>
                        <tr id="trautoinspeccion" runat="server" visible="false">
                            <td>
                                <table width="400" cellpadding="0" cellspacing="0" border="0">
                                    <tr class="TopCentros">
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="BodyCentrosTop">
                                            <table cellpadding="0" cellspacing="0" border="0">
                                                <tr>
                                                    <td class="fuenteDireccion">
                                                        <img src="img/icoAutoInspeccion.png" alt="AutoInspeccion" style="margin: auto; display: block">
                                                        <span class="info_s" style="text-align: justify; width: 95%">¡Hazlo tú mismo con la nueva aplicación Autoinspección!</span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <table cellpadding="0" cellspacing="0" border="0">
                                                            <tr>
                                                                <td class="fuenteDireccion">
                                                                
                                                                    <span class="info_s" style="text-align: justify; width: 95%">En MAPFRE Chile sabemos
                                                                    que tu tiempo es valioso, por ello hemos
                                                                    creado una nueva aplicación AutoInspección para que tú mismo nos
                                                                    
                                                                    informes del estado del vehículo, y evites asistir a centros de
                                                                    
                                                                    inspección o coordinar visitas.<br />
                                                                    
                                                                    La aplicación se encuentra disponible para teléfonos con sistema
                                                                    
                                                                    operativo iOS y Android.<br />
                                                                    
                                                                    Cuando finalices la compra de tu seguro te enviaremos un correo
                                                                    
                                                                    electrónico con las instrucciones para que descargues la aplicación
                                                                    
                                                                    en tu teléfono.<br />
                                                                    <br />
                                                                    <div class="cbp-mc-column4">
                                                                        <div class="bloque ">
                                                                            <img src="img/icoAppStore.png" alt="AppStore" style="margin: auto; display: block">
                                                                        </div>
                                                                    </div>
                                                                    <div class="cbp-mc-column4">
                                                                        <div class="bloque ">
                                                                            <img src="img/icoPlayStore.png" alt="PlayStore" style="margin: auto; display: block">
                                                                        </div>
                                                                    </div>
                                                                </span>
                                                                </td>
                                                            </tr>
                                                            
                                                        </table>
                                                    </td>
                                                </tr>
                                                
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="BottomCentros">
                                            &nbsp;
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <%--Cierre autoinspeccion--%>

                        <tr id="trRegistraInspeccion" runat="server" visible = "false">
                            <td>
                                <strong>
                                    <asp:Label ID="lblRegistraInspeccion" runat="server"></asp:Label></strong>
                            </td>
                        </tr>
                        <tr id="trSinInspeccion" runat="server">
                            <%-- SIN INSPECCION --%>

                            <td>
                                <asp:RadioButton Visible="true" ID="rdbSinInspeccion" AutoPostBack="true" runat="server" Checked="true" GroupName="rdbInspeccion" Text="No requiere inspección" />
                            </td>
                        </tr>
                        <tr id="trInspeccionExpress" runat="server" visible = "false">
                            <td>
                                <asp:RadioButton ID="rdbInspeccionExpress" AutoPostBack="true" GroupName="rdbInspeccion" Visible="false" Text="sin Inspección" runat="server" OnCheckedChanged="rdbInspeccionExpress_CheckedChanged" />
                            </td>
                        </tr>
                     
                        
                    </table>
                </fieldset>
            </div>

            <div id="DatosVigenciaEmisor">
                <fieldset>
                    <table>
                        <tr>
                            <td class="titItem">
                                <asp:Label ID="lblVigencia" CssClass="TituloSecundario" runat="server" Text="Vigencia"></asp:Label>
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>
                                <table width="600">
                                    <tr>
                                        <td>
                                            Inicio vigencia del seguro:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtFechaVigencia" Width="58px" ToolTip="Ingrese la Fecha de Vigencia"
                                                ReadOnly="false" AutoPostBack="true" CssClass="TextBox" runat="server"></asp:TextBox>
                                        </td>
                                        <td>
                                            <table id="calendario" runat="server">
                                                <tr>
                                                    <td>
                                                        <input type="button" class="calendario" id="calendar-trigger" onclick="ini()" />
                                                    </td>
                                                    <td>
                                                        (Ej: 23-05-2011)
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td id="tdFinVigencia1" runat="server">
                                            Fin vigencia del seguro:
                                        </td>
                                        <td id="tdFinVigencia2" runat="server">
                                            <asp:TextBox ID="txtFechaFinVigencia" Width="58px" ToolTip="Fecha de Fin de Vigencia"
                                                ReadOnly="false" AutoPostBack="true" CssClass="TextBox" runat="server"></asp:TextBox>
                                        </td>
                                        <td id="tdFinVigencia3" runat="server">
                                            <table id="calendario2" runat="server">
                                                <tr>
                                                    <td>
                                                        <input type="button" class="calendario" id="Button1" onclick="ini()" />
                                                    </td>
                                                    <td>
                                                        (Ej: 23-05-2011)
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </div>
            
            <div id="DatosPagoEmisor">
                <fieldset>
                    <table>
                        <tr>
                            <td class="titItem">
                                <asp:Label ID="lblFormaPago" CssClass="TituloSecundario" runat="server" Text="forma de pago"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table width="850px">
                                    <tr>
                                        <td>
                                            <asp:RadioButton ID="rdbCuotasMapfre" GroupName="rdbFormasPago" runat="server" Text="cuotas mapfre"
                                                AutoPostBack="True" Checked="True" OnCheckedChanged="rdbCuotasMapfre_CheckedChanged" />
                                        </td>
                                        <td>
                                            <asp:RadioButton ID="rdbPAT" GroupName="rdbFormasPago" runat="server" Text="PAT"
                                                AutoPostBack="True" OnCheckedChanged="rdbPAT_CheckedChanged" />
                                        </td>
                                        <td>
                                            <asp:RadioButton ID="rdbPAC" GroupName="rdbFormasPago" runat="server" Text="PAC"
                                            AutoPostBack="True" OnCheckedChanged="rdbPAC_CheckedChanged" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">
                                            <div id="PAT" runat="server" style="width: 800px;">
                                                <table>
                                                    <tr>
                                                        <td style="width: 20%">
                                                            marca de la tarjeta:
                                                        </td>
                                                        <td style="width: 30%">
                                                            <asp:DropDownList ID="drpMarcaTarjetaPAT" AutoPostBack="true" runat="server" OnSelectedIndexChanged="drpMarcaTarjetaPAT_SelectedIndexChanged"
                                                                ToolTip="Seleccione la Marca de la Tarjeta">
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td rowspan="4">
                                                            <div id="AyudaTarjeta" style="float: left">
                                                                <span id="tarjeta" style="display: block;">
                                                                    <asp:Image runat="server" ID="ImgTarjetaClasica" SkinID="ImgTarjetaClasica" />
                                                                </span><span id="tarjeta_numero" style="display: none">
                                                                    <asp:Image runat="server" ID="ImgTarjetaNumero" SkinID="ImgTarjetaNumero" />
                                                                </span><span id="tarjeta_fecha" style="display: none">
                                                                    <asp:Image runat="server" ID="ImgTarjetaFecha" SkinID="ImgTarjetaFecha" />
                                                                </span>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            tipo de tarjeta:
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="drpTarjetaPAT" runat="server" ToolTip="Seleccione el Tipo de Tarjeta">
                                                                <asp:ListItem Value="Seleccionar">seleccionar</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            n° de tarjeta:
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtNumTarjetaPAT" runat="server" onClick="MuestraAyudaNumero()"
                                                                MaxLength="16" OnTextChanged="txtNumTarjetaPAT_TextChanged" AutoPostBack="true"
                                                                ToolTip="Ingrese el Número de Tarjeta"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            Vencimiento:
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="drpMesVencTarjPAT" runat="server" onClick="MuestraAyudaFecha()">
                                                                <asp:ListItem Value="01" Selected="True">enero</asp:ListItem>
                                                                <asp:ListItem Value="02">febrero</asp:ListItem>
                                                                <asp:ListItem Value="03">marzo</asp:ListItem>
                                                                <asp:ListItem Value="04">abril</asp:ListItem>
                                                                <asp:ListItem Value="05">mayo</asp:ListItem>
                                                                <asp:ListItem Value="06">junio</asp:ListItem>
                                                                <asp:ListItem Value="07">julio</asp:ListItem>
                                                                <asp:ListItem Value="08">agosto</asp:ListItem>
                                                                <asp:ListItem Value="09">septiembre</asp:ListItem>
                                                                <asp:ListItem Value="10">octubre</asp:ListItem>
                                                                <asp:ListItem Value="11">noviembre</asp:ListItem>
                                                                <asp:ListItem Value="12">diciembre</asp:ListItem>
                                                            </asp:DropDownList>
                                                            <asp:DropDownList ID="drpAñoVencTarjPAT" runat="server" onClick="MuestraAyudaFecha()">
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                            <div id="PAC" runat="server" style="width: 800px;">
                                            <table>
                                                <tr>
                                                    <td colspan="2">
                                                        Cargo a cuenta corriente
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                    Plan de pago:                                                     
                                                    </td>
                                                    <td>
                                                    <label style="font-weight:bold">DOC. 10 Cuotas (La primera cuota cargada al segundo mes)</label>
                                                    </td>
                                                </tr>
                                            </table>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">
                                            <table>
                                                <tr>
                                                    <td style="width: 12%;">
                                                        plan de pago:
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList ID="drpPlanPago" runat="server" AutoPostBack="True" OnSelectedIndexChanged="drpPlanPago_SelectedIndexChanged"
                                                            ToolTip="Seleccione el Plan de Pago">
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td style="width: 12%;">
                                                        fecha de pago:
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList ID="drpDiaPago" runat="server" AutoPostBack="True" OnSelectedIndexChanged="drpDiaPago_SelectedIndexChanged"
                                                            ToolTip="Seleccione la Fecha de Pago">
                                                            <asp:ListItem Value="0">seleccionar</asp:ListItem>
                                                            <asp:ListItem Value="5">5</asp:ListItem>
                                                            <asp:ListItem Value="20">20</asp:ListItem>
                                                            <asp:ListItem Value="25">25</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td>
                                                        valor cuota:
                                                    </td>
                                                    <td>
                                                        <strong>
                                                            <asp:Label ID="lblValorCuota" runat="server" Text="Label"></asp:Label></strong>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </div>
            
            <asp:UpdateProgress ID="UpdateProgress2" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                <ProgressTemplate>
                    <div class="overlay">
                    </div>
                    <div class="centralimg">
                        Por favor, Espere un momento mientras cargamos la información</div>
                </ProgressTemplate>
            </asp:UpdateProgress>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
        <ContentTemplate>
            <div id="Botonera">
                <table id="tblBotonera" runat="server">
                    <tr>
                        <td align="left">
                            <asp:Button ID="ImgNuevaCotizacion" Text="Nueva Simulación" runat="server" CssClass="estilo_boton"  
                                OnClick="ImgNuevaCotizacion_Click" />
                        </td>
                        <td>
                            <asp:Button ID="ImgValidaEmitir" CssClass="estilo_boton"  runat="server" OnClick="ImgValidaEmitir_Click" 
                            Text="Generar Propuesta" OnClientClick="validaPreguntas()" />    
                              
                            <%--<asp:Button ID="imgGenerarPropuesta" CssClass="estilo_boton"  runat="server" OnClick="imgGenerarPropuesta_Click" 
                            Text="Generar Propuesta" OnClientClick="validaPreguntas()" />--%>                         
                            <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel3">
                                <ProgressTemplate>
                                    <div>
                                    <div class="overlay">
                                    </div>
                                    <div class="emitimg">
                                        Por favor, Espere un momento mientras cargamos la información
                                    </div>
                                    </div>
                                </ProgressTemplate>
                            </asp:UpdateProgress>
                            
                        </td>
                    </tr>
                </table>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <input type="hidden" id="hdnMinVigencia" name="hdnMinVigencia" runat="server" />
</asp:Content>
