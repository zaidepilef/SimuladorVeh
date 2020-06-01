<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    EnableEventValidation="false" CodeFile="Cotizador.aspx.cs" Inherits="Cotizador"
    Title="Simulador de Vehiculos" %>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="head">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" AsyncPostBackTimeout="36000" runat="server">
    </asp:ScriptManager>
    <script type="text/javascript" language="javascript">
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        function EndRequestHandler(sender, args) {
            if (args.get_error() != undefined) {
                args.set_errorHandled(true);
            }
        }
    </script>
    <asp:UpdatePanel ID="UpdatePanelCuenta" runat="server">
        <ContentTemplate>
            <%-- <asp:Timer ID="Timer1" OnTick="Timer1_Tick" runat="server" Interval="5000" />--%>
            <%--<div id="slidebox">
            <a class="close" onclick="$('#slidebox').stop(true).animate({'right':'-430px'},600);"></a>
            <p>More in Technology & Science (4 of 23 articles)</p>
            <h2>The Social Impact of Scientific Research and new Technologies</h2>
            <asp:ImageButton ID="ImageButton1" runat="server" SkinID="ImgRecalcular" OnClick="ImgRecalcular_Click" />
        </div>--%>
            <!-- The JavaScript -->
            <%--  <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>--%>
            <!-- The overlay and the box -->
            <%-- <asp:Timer ID="Timer2" OnTick="Timer2_Tick" runat="server" Interval="500000" />--%>
            <!--
        <div class="overlay2" id="overlay" style="display:none;"></div>
        <div class="box" id="box">
            <a class="boxclose" onclick="$('#box').animate({'top':'-200px'},500,function(){$('#overlay').fadeOut('fast');});" id="boxclose"></a>
            <h1>Important message</h1>
            <p>
                Here comes a very important message for your user.
                Turn this window off by clicking the cross.
            </p>
        </div>
        <!-- end -->
            <table style="width: 100%">
                <tr>
                    <td style="width: 50%; text-align: left">
                        <asp:ImageButton ID="ImgMuestraSuplanta" SkinID="ImgMuestraSuplanta" runat="server"
                            OnClick="ImgMuestraSuplanta_Click" />
                    </td>
                    <td style="width: 50%; text-align: right">
                        <asp:Label ID="lblNomCuenta" runat="server" CssClass="fuente4"></asp:Label>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="UpdatePanelDatos" runat="server">
        <ContentTemplate>
            <div id="content">
                <div id="DatosVehiculo">
                    <fieldset>
                        <table>
                            <tr>
                                <td class="titItem" colspan="6">
                                    <asp:Label ID="lblDatosVeh" CssClass="TituloSecundario" runat="server" Text="datos del vehiculo"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <table cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td>
                                                <asp:CheckBox ID="chkCotExpress" AutoPostBack="true" runat="server" Text="Simulación Express" OnCheckedChanged="chkCotExpress_CheckedChanged" />
                                                <a href="#" class="info">&nbsp;&nbsp;<asp:Image ID="Image27" runat="server" SkinID="ImgNota" />
                                                    <span>Esta simulación no requiere ingresar la patente.<br></span>
                                                </a>
                                            </td>
                                            <td> </td>
                                        </tr>
                                    </table>
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                                <td colspan="2">
                                    <asp:Label ID="lblTituloTipVeh" runat="server"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <strong>
                                        <asp:Label ID="lblTipVehiculo" runat="server"></asp:Label></strong>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 12%;">
                                    patente:
                                </td>
                                <td style="width: 20%;">
                                    <asp:TextBox ID="txtNumMatricula" AutoPostBack="true" runat="server" MaxLength="6"
                                        Width="80px" OnTextChanged="txtNumMatricula_TextChanged" ToolTip="Ingrese la Patente del vehículo"></asp:TextBox>
                                    <a href="#" class="info">&nbsp;<asp:Image ID="Image28" runat="server" SkinID="ImgNota" />
                                        <span>No Obligatorio para Vehículos del año vigente.<br>
                                        </span></a>
                                </td>
                                <td colspan="2">
                                    <asp:CheckBox ID="chkVehFact48" runat="server" Text="Vehículo factura 3 días hábiles"
                                        OnCheckedChanged="chkVehFact48_CheckedChanged" AutoPostBack="true" />
                                </td>
                                <td style="width: 12%;">
                                    año Fabricación:
                                </td>
                                <td>
                                    <asp:DropDownList ID="drpAño" runat="server" AutoPostBack="True" OnSelectedIndexChanged="drpAño_SelectedIndexChanged"
                                        ToolTip="Seleccione el Año del Vehículo">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    marca:
                                </td>
                                <td>
                                    <asp:DropDownList ID="drpMarca" runat="server" AutoPostBack="True" OnSelectedIndexChanged="drpMarca_SelectedIndexChanged"
                                        ToolTip="Seleccione la Marca del Vehículo">
                                    </asp:DropDownList>
                                </td>
                                <td style="width: 5%;">
                                    modelo:
                                </td>
                                <td style="width: 25%;">
                                    <asp:DropDownList ID="drpModelo" runat="server" AutoPostBack="True" OnSelectedIndexChanged="drpModelo_SelectedIndexChanged"
                                        ToolTip="Seleccione el Modelo del Vehículo">
                                        <asp:ListItem Selected="True" Text="Seleccionar" Value="0"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    sub modelo:
                                </td>
                                <td>
                                    <asp:DropDownList ID="drpSubModelo" runat="server" ToolTip="Seleccione el Sub Modelo del Vehículo"
                                        AutoPostBack="true" OnSelectedIndexChanged="drpSubModelo_SelectedIndexChanged">
                                        <asp:ListItem Selected="True" Text="Seleccionar" Value="0"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="5">
                                    <asp:Label ID="lblPregFranquicia" runat="server" Text="¿Posee franquicia aduanera?"></asp:Label>
                                    <asp:RadioButton ID="rbtFranquiciaSi" runat="server" GroupName="grpFranquicia" Text="Si"
                                        ToolTip="Seleccione si posee o no franquicia aduanera" />
                                    <asp:RadioButton ID="rbtFranquiciaNo" runat="server" GroupName="grpFranquicia" Text="No"
                                        ToolTip="Seleccione si posee o no franquicia aduanera" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="5">
                                    <asp:Label ID="lblPregDanos" runat="server" Text="¿Tiene Daños Pre-existentes?" Visible="false"></asp:Label>
                                    <asp:RadioButton ID="rbtDañosSi" runat="server" GroupName="grpDaños" Text="Si" ToolTip="Seleccione si posee o no daños pre-existentes"
                                        Visible="false" />
                                    <asp:RadioButton ID="rbtDañosNo" runat="server" GroupName="grpDaños" Text="No" ToolTip="Seleccione si posee o no daños pre-existentes"
                                        Visible="false" />
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                </div>
                <div id="DatosAsegurado">
                    <fieldset>
                        <table>
                            <tr>
                                <td colspan="6" class="titItem">
                                    <asp:Label ID="lblDatosAsegurado" CssClass="TituloSecundario" runat="server" Text="Datos del Asegurado (Debe corresponder al dueño del vehículo)"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 12%;">
                                    rut:
                                </td>
                                <td colspan="2">
                                    <asp:TextBox ID="txtCodDocumAseg" runat="server" AutoPostBack="true" OnTextChanged="txtCodDocumAseg_TextChanged"
                                        MaxLength="12" ToolTip="Ingrese el Rut del Asegurado"></asp:TextBox>
                                    (Sin puntos ni guión) <a href="#" class="info">&nbsp;<asp:Image ID="Image29" runat="server"
                                        SkinID="ImgNota" />
                                        <span>Garantiza una simulación personalizada con la prima óptima para cada cliente.
                                        </span></a>
                                </td>
                                <td colspan="3">
                                    <asp:Label ID="lblPregDueno" runat="server" Text="¿El RUT ingresado pertenece al dueño del vehículo?"></asp:Label>
                                    <asp:RadioButton ID="rbtDueñoSi" runat="server" GroupName="grpDueño" Text="Si" AutoPostBack="true"
                                        ToolTip="Seleccione si el RUT ingresado pertenece al dueño del vehículo" OnCheckedChanged="rbtDueño_CheckedChanged" />
                                    <asp:RadioButton ID="rbtDueñoNo" runat="server" GroupName="grpDueño" Text="No" AutoPostBack="true"
                                        ToolTip="Seleccione si el RUT ingresado pertenece al dueño del vehículo" OnCheckedChanged="rbtDueño_CheckedChanged" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    nombre:
                                </td>
                                <td>
                                    <asp:TextBox ID="txtNomAseg" runat="server" AutoPostBack="true" OnTextChanged="txtNomAseg_TextChanged"
                                        ToolTip="Ingrese el Nombre del Asegurado"></asp:TextBox>
                                </td>
                                <td style="width: 12%;">
                                    apellido paterno:
                                </td>
                                <td>
                                    <asp:TextBox ID="txtApePatAseg" runat="server" AutoPostBack="true" OnTextChanged="txtApePatAseg_TextChanged"></asp:TextBox>
                                </td>
                                <td style="width: 12%;">
                                    apellido materno:
                                </td>
                                <td>
                                    <asp:TextBox ID="txtApeMatAseg" runat="server" AutoPostBack="true" OnTextChanged="txtApeMatAseg_TextChanged"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Label ID="lblPregHijos" runat="server" Text="¿Tiene hijos?"></asp:Label>
                                </td>
                                <td>
                                    <asp:RadioButton ID="rbtHijosSi" runat="server" GroupName="grpHijos" Text="Si" ToolTip="Seleccione si el dueño del vehículo ingresado tiene hijos" />
                                    <asp:RadioButton ID="rbtHijosNo" runat="server" GroupName="grpHijos" Text="No" ToolTip="Seleccione si el dueño del vehículo ingresado tiene hijos" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Label ID="Label3" runat="server" Text="El vehículo es exclusivamente de uso particular"></asp:Label>
                                </td>
                                <td>
                                    <asp:RadioButton ID="rbtParticularSi" runat="server" GroupName="grpParticular" Text="Si"
                                        ToolTip="Seleccione si el vehículo es de uso particular" OnCheckedChanged="rbtParticular_CheckedChanged"
                                        AutoPostBack="true" />
                                    <asp:RadioButton ID="rbtParticularNo" runat="server" GroupName="grpParticular" Text="No"
                                        ToolTip="Seleccione si el vehículo es de uso particular" OnCheckedChanged="rbtParticular_CheckedChanged"
                                        AutoPostBack="true" />
                                </td>
                            </tr>
                            <%--<tr>
                                <td colspan = "2">
                                    <asp:Label ID="lblVehPart" runat="server" Text="¿El vehiculo es exclusivamente de uso particular?"></asp:Label></td>
                                <td>
                                    <asp:RadioButton ID="rbtVehPartSi" runat="server" GroupName="grpVehPart" Text="Si" ToolTip="Seleccione si el vehículo ingresado es del tipo particular" />
                                    <asp:RadioButton ID="rbtVehPartNo" runat="server" GroupName="grpVehPart" Text="No" ToolTip="Seleccione si el vehículo ingresado es del tipo particular"/>
                                </td>
                            </tr>  
                            <tr>
                                <td colspan = "2">
                                    <asp:Label ID="lblVehDanos" runat="server" Text="¿El vehículo que desea asegurar presenta daños ya sea en su exterior o interior?"></asp:Label></td>
                                <td>
                                    <asp:RadioButton ID="rbtVehDanosSi" runat="server" GroupName="grpVehDanos" Text="Si" ToolTip="Seleccione si el vehículo ingresado presenta daños" />
                                    <asp:RadioButton ID="rbtVehDanosNo" runat="server" GroupName="grpVehDanos" Text="No" ToolTip="Seleccione si el vehículo ingresado presenta daños"/>
                                </td>
                            </tr>            --%>
                            <tr>
                                <td colspan="2">
                                    <asp:Label ID="lblFamiliares" runat="server" Text="¿Tiene familiares con seguros?  Rut:"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtCodDocumFamiliar" runat="server" AutoPostBack="true" OnTextChanged="txtCodDocumFamiliar_TextChanged"
                                        MaxLength="12" ToolTip="Ingrese el Rut del Asegurado"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:DropDownList ID="drpTipoFamiliar" runat="server" AutoPostBack="true" OnSelectedIndexChanged="drpTipoFamiliar_SelectedIndexChanged"
                                        ToolTip="Seleccione tipo de parentesco">
                                        <asp:ListItem Value="0" Text="Seleccione tipo de parentesco"></asp:ListItem>
                                        <asp:ListItem Value="hijo" Text="Hijo(a)"></asp:ListItem>
                                        <asp:ListItem Value="esposo" Text="Esposo(a)"></asp:ListItem>
                                        <asp:ListItem Value="papa" Text="Papá/Mamá"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr id="trDatosSeguimiento" runat="server">
                                <td>
                                    telefono:
                                </td>
                                <td>
                                    <asp:TextBox ID="txtFonoAseg" MaxLength="10" runat="server" AutoPostBack="true" ToolTip="Ingrese el Telefono del Asegurado"></asp:TextBox>
                                </td>
                                <td style="width: 12%;">
                                    email:
                                </td>
                                <td>
                                    <asp:TextBox ID="txtEmailAseg" MaxLength="60" ToolTip="Ingrese un correo electrónico válido"
                                        runat="server" AutoPostBack="true" Width="160px"></asp:TextBox>
                                </td>
                                <td style="width: 12%;">
                                    telefono movil
                                </td>
                                <td>
                                    <asp:TextBox ID="txtFonoAseg2" MaxLength="10" runat="server" AutoPostBack="true"
                                        ToolTip="Ingrese el Telefono Movil del Asegurado"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblEdadConductor" runat="server" Visible="false" Text="edad conductor:"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="drpEdad" runat="server" Visible="false" ToolTip="Seleccione la Edad del Asegurado">
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    <asp:DropDownList ID="drpSexo" Visible="false" runat="server" AutoPostBack="true"
                                        OnSelectedIndexChanged="drpSexo_SelectedIndexChanged">
                                        <asp:ListItem Value="0" Text="Femenino"></asp:ListItem>
                                        <asp:ListItem Value="1" Text="Masculino"></asp:ListItem>
                                        <asp:ListItem Value="9" Text="Jurídico"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr id="trDifPersona" runat="server">
                                <td colspan="6">
                                    <table>
                                        <tr>
                                            <td>
                                                ¿el tomador y el asegurado son diferente persona?
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                                <asp:RadioButton Checked="true" GroupName="rdbDifPersona" ID="rdbDifPersonaNo" runat="server"
                                                    OnCheckedChanged="rdbDifPersona_CheckedChanged" AutoPostBack="True" Text="no" />
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                                <asp:RadioButton GroupName="rdbDifPersona" ID="rdbDifPersonaSi" runat="server" OnCheckedChanged="rdbDifPersona_CheckedChanged"
                                                    AutoPostBack="True" Text="si" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr id="trDatosTomad" runat="server">
                                <td colspan="6">
                                    <table id="tblDifPersona" runat="server">
                                        <tr>
                                            <td>
                                                rut tomador:
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtCodDocumTom" runat="server" MaxLength="10"></asp:TextBox>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                                <asp:CheckBox ID="chkEntidadBanc" runat="server" Text="Entidad bancaria ó vehiculo en prenda" />
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                </td>
                                <td>
                                </td>
                                <td>
                                </td>
                                <td>
                                </td>
                                <td>
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                </div>
                <div id="DatosVigenciaEmisor" runat="server">
                    <fieldset>
                        <table>
                            <tr>
                                <td class="titItem">
                                    <asp:Label ID="lblVigencia" CssClass="TituloSecundario" runat="server" Text="Vigencia"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table id="fechasVigencia" style="width: 100%;">
                                        <tr>
                                            <td class="BodyCalendarioLeft" style="width: 12%;">
                                                Inicio Vigencia del Seguro:
                                            </td>
                                            <td class="BodyCalendarioCenter" style="width: 5%;">
                                                <table id="calendario1" runat="server">
                                                    <tr>
                                                        <td>
                                                            <asp:TextBox ID="txtFechaIniVigencia" Width="58px" ToolTip="Inicio Fecha de Vigencia"
                                                                ReadOnly="false" runat="server" AutoPostBack="true" CssClass="TextBox" OnTextChanged="txtFechaIniVigencia_TextChanged"></asp:TextBox>
                                                        </td>
                                                        <td>
                                                            <input type="button" class="calendario" id="calendar-trigger3" onclick="ini3()" />
                                                        </td>
                                                        <td>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td class="BodyCalendarioCenter" style="width: 10%;">
                                                Fin Vigencia del Seguro:
                                            </td>
                                            <td class="BodyCalendarioRight" style="width: 5%;">
                                                <table id="calendario2" runat="server">
                                                    <tr>
                                                        <td>
                                                            <asp:TextBox ID="txtFechaFinVigencia" Width="58px" ToolTip="Fin Fecha de Vigencia"
                                                                ReadOnly="false" runat="server" AutoPostBack="true" CssClass="TextBox" OnTextChanged="txtFechaFinVigencia_TextChanged"></asp:TextBox>
                                                        </td>
                                                        <td>
                                                            <input type="button" class="calendario" id="calendar-trigger4" onclick="ini4()" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td class="cantidadDias1" style="width: 3%;">
                                                Días :
                                            </td>
                                            <td class="cantidadDias2" style="width: 20%;">
                                                <asp:TextBox ID="txtCantDias" Width="50px" ReadOnly="true" CssClass="TextBox" runat="server"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <br />
                        <br />
                    </fieldset>
                </div>
                <div id="Opc_Coberturas" runat="server">
                    <div id="Coberturas">
                        <fieldset>
                            <table>
                                <tr>
                                    <td class="titItem">
                                        <asp:Label ID="lblResumenCoberturas" CssClass="TituloSecundario" runat="server" Text="resumen de coberturas"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <table style="text-align: center; font-size: 12px; border: 1px solid #c10003; font-variant: inherit">
                                            <tr style="background-color: #c10003; color: White; font-weight: bold; height: 20px">
                                                <td style="width: 350px;">
                                                    Coberturas por Producto
                                                </td>
                                                <td style="width: 140px;">
                                                    Flex
                                                    <!--FDR de aqui se restringe amunategui -->
                                                </td>
                                                <td style="width: 140px;">
                                                    Master
                                                </td>
                                                <td style="width: 140px;">
                                                    Balance
                                                </td>
                                                <td style="width: 140px;">
                                                    Elemental
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Daños al vehículo (incendio, choque o volcamiento)
                                                </td>
                                                <td>
                                                    <asp:Image ID="Image1" runat="server" ImageUrl="~/ticket.jpg" />
                                                </td>
                                                <td>
                                                    <asp:Image ID="Image2" runat="server" ImageUrl="~/ticket.jpg" />
                                                </td>
                                                <td>
                                                    <asp:Image ID="Image3" runat="server" ImageUrl="~/ticket.jpg" />
                                                </td>
                                                <td>
                                                    -
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Robo, Hurto, Uso no Autorizado
                                                </td>
                                                <td>
                                                    <asp:Image ID="Image4" runat="server" ImageUrl="~/ticket.jpg" />
                                                </td>
                                                <td>
                                                    <asp:Image ID="Image5" runat="server" ImageUrl="~/ticket.jpg" />
                                                </td>
                                                <td>
                                                    <asp:Image ID="Image6" runat="server" ImageUrl="~/ticket.jpg" />
                                                </td>
                                                <td>
                                                    -
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Pérdida Total por Daños
                                                </td>
                                                <td>
                                                    <asp:Image ID="Image7" runat="server" ImageUrl="~/ticket.jpg" />
                                                </td>
                                                <td>
                                                    <asp:Image ID="Image8" runat="server" ImageUrl="~/ticket.jpg" />
                                                </td>
                                                <td>
                                                    <asp:Image ID="Image9" runat="server" ImageUrl="~/ticket.jpg" />
                                                </td>
                                                <td>
                                                    -
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Responsabilidad Civil
                                                </td>
                                                <td colspan="4">
                                                    Monto hasta UF 1.000, opera como límite combinando las 3 subsecciones
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Robo de Accesorios
                                                </td>
                                                <td>
                                                    <asp:Image ID="Image10" runat="server" ImageUrl="~/ticket.jpg" />
                                                </td>
                                                <td>
                                                    <asp:Image ID="Image11" runat="server" ImageUrl="~/ticket.jpg" />
                                                </td>
                                                <td>
                                                    <asp:Image ID="Image12" runat="server" ImageUrl="~/ticket.jpg" />
                                                </td>
                                                <td>
                                                    -
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Daños por Riesgo a la Naturaleza
                                                </td>
                                                <td>
                                                    <asp:Image ID="Image13" runat="server" ImageUrl="~/ticket.jpg" />
                                                </td>
                                                <td>
                                                    <asp:Image ID="Image14" runat="server" ImageUrl="~/ticket.jpg" />
                                                </td>
                                                <td>
                                                    <asp:Image ID="Image15" runat="server" ImageUrl="~/ticket.jpg" />
                                                </td>
                                                <td>
                                                    -
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Daños por Granizo
                                                </td>
                                                <td>
                                                    <asp:Image ID="Image16" runat="server" ImageUrl="~/ticket.jpg" />
                                                </td>
                                                <td>
                                                    <asp:Image ID="Image17" runat="server" ImageUrl="~/ticket.jpg" />
                                                </td>
                                                <td>
                                                    <asp:Image ID="Image18" runat="server" ImageUrl="~/ticket.jpg" />
                                                </td>
                                                <td>
                                                    -
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Daños por Sismo
                                                </td>
                                                <td>
                                                    <asp:Image ID="Image19" runat="server" ImageUrl="~/ticket.jpg" />
                                                </td>
                                                <td>
                                                    <asp:Image ID="Image20" runat="server" ImageUrl="~/ticket.jpg" />
                                                </td>
                                                <td>
                                                    <asp:Image ID="Image21" runat="server" ImageUrl="~/ticket.jpg" />
                                                </td>
                                                <td>
                                                    -
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Daños Materiales por Actos Maliciosos
                                                </td>
                                                <td>
                                                    <asp:Image ID="Image22" runat="server" ImageUrl="~/ticket.jpg" />
                                                </td>
                                                <td>
                                                    <asp:Image ID="Image23" runat="server" ImageUrl="~/ticket.jpg" />
                                                </td>
                                                <td>
                                                    <asp:Image ID="Image24" runat="server" ImageUrl="~/ticket.jpg" />
                                                </td>
                                                <td>
                                                    -
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Daños Materiales por la Carga
                                                </td>
                                                <td>
                                                    <asp:Image ID="Image25" runat="server" ImageUrl="~/ticket.jpg" />
                                                </td>
                                                <td>
                                                    <asp:Image ID="Image30" runat="server" ImageUrl="~/ticket.jpg" />
                                                </td>
                                                <td>
                                                    <asp:Image ID="Image31" runat="server" ImageUrl="~/ticket.jpg" />
                                                </td>
                                                <td>
                                                    -
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Daños a Terceros por la Carga
                                                </td>
                                                <td>
                                                    <asp:Image ID="Image32" runat="server" ImageUrl="~/ticket.jpg" />
                                                </td>
                                                <td>
                                                    <asp:Image ID="Image33" runat="server" ImageUrl="~/ticket.jpg" />
                                                </td>
                                                <td>
                                                    <asp:Image ID="Image34" runat="server" ImageUrl="~/ticket.jpg" />
                                                </td>
                                                <td>
                                                    -
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Defensa Penal
                                                </td>
                                                <td>
                                                    <asp:Image ID="Image35" runat="server" ImageUrl="~/ticket.jpg" />
                                                </td>
                                                <td>
                                                    <asp:Image ID="Image36" runat="server" ImageUrl="~/ticket.jpg" />
                                                </td>
                                                <td>
                                                    <asp:Image ID="Image37" runat="server" ImageUrl="~/ticket.jpg" />
                                                </td>
                                                <td>
                                                    -
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Asiento Pasajero (Muerte Accidental)
                                                </td>
                                                <td>
                                                    <asp:Image ID="Image38" runat="server" ImageUrl="~/ticket.jpg" />
                                                </td>
                                                <td>
                                                    <asp:Image ID="Image39" runat="server" ImageUrl="~/ticket.jpg" />
                                                </td>
                                                <td>
                                                    <asp:Image ID="Image40" runat="server" ImageUrl="~/ticket.jpg" />
                                                </td>
                                                <td>
                                                    -
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Asiento Pasajero (Invalidez Accidental)
                                                </td>
                                                <td>
                                                    <asp:Image ID="Image41" runat="server" ImageUrl="~/ticket.jpg" />
                                                </td>
                                                <td>
                                                    <asp:Image ID="Image42" runat="server" ImageUrl="~/ticket.jpg" />
                                                </td>
                                                <td>
                                                    <asp:Image ID="Image43" runat="server" ImageUrl="~/ticket.jpg" />
                                                </td>
                                                <td>
                                                    -
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Asistencia Mapfre con <span style="color: #c10003">Auto de Reemplazo Ilimitado</span>
                                                </td>
                                                <td>
                                                    <asp:Image ID="Image44" runat="server" ImageUrl="~/ticket.jpg" />
                                                </td>
                                                <td>
                                                    <asp:Image ID="Image45" runat="server" ImageUrl="~/ticket.jpg" />
                                                </td>
                                                <td>
                                                    -
                                                </td>
                                                <td>
                                                    -
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Asistencia en Ruta
                                                </td>
                                                <td>
                                                    -
                                                </td>
                                                <td>
                                                    -
                                                </td>
                                                <td>
                                                    <asp:Image ID="Image48" runat="server" ImageUrl="~/ticket.jpg" />
                                                </td>
                                                <td>
                                                    <asp:Image ID="Image47" runat="server" ImageUrl="~/ticket.jpg" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Resp. Civil en Exceso UF 1.500
                                                </td>
                                                <td>
                                                    Opcional
                                                </td>
                                                <td>
                                                    <asp:Image ID="Image46" runat="server" ImageUrl="~/ticket.jpg" />
                                                </td>
                                                <td>
                                                    Opcional
                                                </td>
                                                <td>
                                                    Opcional
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Resp. Civil en Exceso UF 4.000
                                                </td>
                                                <td>
                                                    Opcional
                                                </td>
                                                <td>
                                                    Opcional
                                                </td>
                                                <td>
                                                    Opcional
                                                </td>
                                                <td>
                                                    Opcional
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Daños por Viaje al Extranjero
                                                </td>
                                                <td>
                                                    <asp:Image ID="Image49" runat="server" ImageUrl="~/ticket.jpg" />
                                                </td>
                                                <td>
                                                    <asp:Image ID="Image50" runat="server" ImageUrl="~/ticket.jpg" />
                                                </td>
                                                <td>
                                                    <asp:Image ID="Image51" runat="server" ImageUrl="~/ticket.jpg" />
                                                </td>
                                                <td>
                                                    -
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Image ID="ImgCoberturas" SkinID="ImgCoberturas" runat="server" Visible="false" />
                                    </td>
                                </tr>
                            </table>
                        </fieldset>
                    </div>
                </div>

                <div id="OpcCoberturasAutoAntiguo" runat="server">
                    <div id="CoberturasAutoAntiguo">
                        <fieldset>
                            <table>
                                <tr>
                                    <td class="titItem" colspan="6">
                                        <asp:Label ID="lblResumenCoberturasAA" CssClass="TituloSecundario" runat="server"
                                            Text="resumen de coberturas"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Image ID="imgCoberturaAntiguo" SkinID="ImgCoberturasAntiguo" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </fieldset>
                    </div>
                </div>

                <div id="Opc_CoberturasOpcionales" runat="server">
                    <div id="CoberturasOpcionales">
                        <fieldset>
                            <table cellpadding="0" cellspacing="0" border="0">
                                <tr>
                                    <td class="titItem" colspan="2">
                                        <asp:Label ID="lblCoberturasOpcionales" CssClass="TituloSecundario" runat="server"
                                            Text="coberturas opcionales"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:CheckBox ID="chk8200" Text="Responsabilidad Civil en Exceso de UF 1.000 por UF 1.500"
                                            runat="server" AutoPostBack="true" OnCheckedChanged="chk8200_CheckedChanged" /><a
                                                href="#" class="info">
                                                <asp:Image ID="ImgNota" runat="server" SkinID="ImgNota" />
                                                <span>Responsabilidad Civil en Exceso se extiende a cubrir los riesgos de responsabilidad
                                                    civil por daño emergente, daño moral y lucro cesante, hasta UF 1.800 en exceso de
                                                    UF 700, como limite único y combinado para las tres subsecciones, bajo los mismos
                                                    términos, condiciones y exclusiones de la cobertura principal.<br>
                                                    Cobertura incluída en Planes Master<br>
                                                </span></a>
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk8201" Text="Responsabilidad Civil en Exceso de UF 1.000 por UF 4.000"
                                            runat="server" AutoPostBack="true" OnCheckedChanged="chk8201_CheckedChanged" />
                                        <a href="#" class="info">
                                            <asp:Image ID="Image26" runat="server" SkinID="ImgNota" />
                                            <span>Responsabilidad Civil en Exceso se extiende a cubrir los riesgos de responsabilidad
                                                civil por daño emergente, daño moral y lucro cesante, hasta UF 4.300 en exceso de
                                                UF 700, como limite único y combinado para las tres subsecciones, bajo los mismos
                                                términos, condiciones y exclusiones de la cobertura principal.<br>
                                            </span></a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:CheckBox ID="chkExGar" Text="exclusividad de garage" runat="server" AutoPostBack="true"
                                            OnCheckedChanged="chkExGar_CheckedChanged" /><br />
                                        <asp:CheckBox ID="chk8105" Text="daños al vehículo durante viajes al extranjero"
                                            Checked="true" Visible="false" runat="server" AutoPostBack="true" OnCheckedChanged="chk8105_CheckedChanged" />
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr id="trAutoreemplazo" runat="server" visible="false">
                                    <td colspan="2">
                                        <asp:CheckBox ID="chk8133" Text="" runat="server" AutoPostBack="true" OnCheckedChanged="chk8133_CheckedChanged" />Autoreemplazo
                                        sin límite.<span class="MelExclusivo">exclusivo emisión electrónica</span>
                                    </td>
                                </tr>
                            </table>
                        </fieldset>
                    </div>
                </div>

                <asp:UpdateProgress ID="UpdateProgress3" AssociatedUpdatePanelID="UpdatePanelDatos"
                    runat="server">
                    <ProgressTemplate>
                        <div class="overlay">
                        </div>
                        <div class="centralimg">
                            Por favor, Espere un momento mientras cargamos la información</div>
                    </ProgressTemplate>
                </asp:UpdateProgress>

            </div>
        </ContentTemplate>
    </asp:UpdatePanel>


    <asp:UpdatePanel ID="UpdateCalcular" runat="server">
        <ContentTemplate>
            <div id="content2">
                <div id="divBotonCalcular" runat="server">
                    <table>
                        <tr>
                            <td>
                                <div class="bloque borde">
                                    <div class="clearfix">
                                        <asp:Button ID="btnCalcular" Text="Calcular" CssClass="estilo_boton" runat="server"
                                            OnClick="btnCalcular_Click" />
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
                <asp:UpdateProgress ID="UpdateProgress4" AssociatedUpdatePanelID="UpdateCalcular" runat="server">
                    <ProgressTemplate>
                        <div class="overlay"></div>
                        <div class="centralimgcalcular">Por favor, Espere un momento mientras calculamos su simulación</div>
                    </ProgressTemplate>
                </asp:UpdateProgress>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

    <asp:UpdatePanel ID="UpdatePanelResultados" runat="server">
        <ContentTemplate>
            <div id="content4">
                <div id="divResultados">
                    <fieldset>
                        <table style="width: 90%; text-align: left; background-color: #FFFFFF; font-family: Arial, Verdana;
                            font-size: 11px; font-weight: normal; text-transform: capitalize;" id="tblDescRec"
                            runat="server" visible="true">
                            <tr>
                                <td style="width: 25%;">
                                    Indique número de cuotas
                                    <asp:DropDownList ID="drpValCuotaPAT" AutoPostBack="true" OnSelectedIndexChanged="drpValCuotaPAT_SelectedIndexChanged"
                                        runat="server">
                                        <asp:ListItem Text="12" Value="12"></asp:ListItem>
                                        <asp:ListItem Text="10" Value="10"></asp:ListItem>
                                        <asp:ListItem Text="8" Value="8"></asp:ListItem>
                                        <asp:ListItem Text="6" Value="6"></asp:ListItem>
                                        <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                        <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td id="tdDscto" runat="server" style="width: 25%;">
                                    % Descuento
                                    <asp:DropDownList ID="drpDescuento1" AutoPostBack="true" OnSelectedIndexChanged="AplicaDescuentos"
                                        runat="server">
                                    </asp:DropDownList>
                                </td>
                                <td id="tdCuadroCom" runat="server" visible="true" style="width: 25%;">
                                    <!-- SE DEBE RESTRINGIR LA VISIBILIDAD DE COMBO PORCENTAJE "COMISION DESEADA", SI EL CORREDOR ES AMUNATEGUI  -->
                                    <asp:CheckBox ID="chkComisionDif" runat="server" AutoPostBack="true" OnCheckedChanged="chkComisionDif_CheckedChanged" />
                                    Indique comisión deseada
                                    <asp:DropDownList ID="drpCuadroCom1" OnSelectedIndexChanged="drpCuadroCom_SelectedIndexChanged"
                                        AutoPostBack="true" runat="server">
                                        <asp:ListItem Text="12" Value="12"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td id="tdRecargo" runat="server" visible="true" style="width: 25%;">
                                    <!-- SE DEBE RESTRINGIR LA VISIBILIDAD DE COMBO PORCENTAJE "RECARGO", SI EL CORREDOR ES AMUNATEGUI  -->
                                    % Recargo
                                    <asp:TextBox ID="txtRecargo1" OnTextChanged="AplicaRecargos" AutoPostBack="true"
                                        runat="server" MaxLength="2" Width="25">
                                    </asp:TextBox>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <asp:Table ID="tblResultados" SkinID="skTblResultados" runat="server">
                            <asp:TableRow ID="tblrowNomPlan" SkinID="skNomPlan" runat="server" Visible="true">
                                <asp:TableCell CssClass="titNombrePlan" Width="500px">CUADRO RESUMEN DE PRIMAS (Valores en UF iva incluído)</asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblNomPlan1" runat="server" Text="Label"></asp:Label>
                                    <asp:HiddenField ID="hdfCodModalidad1" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblNomPlan2" runat="server" Text="Label"></asp:Label>
                                    <asp:HiddenField ID="hdfCodModalidad2" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblNomPlan3" runat="server" Text="Label"></asp:Label>
                                    <asp:HiddenField ID="hdfCodModalidad3" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblNomPlan4" runat="server" Text="Label"></asp:Label>
                                    <asp:HiddenField ID="hdfCodModalidad4" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblNomPlan5" runat="server" Text="Label"></asp:Label>
                                    <asp:HiddenField ID="hdfCodModalidad5" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblNomPlan6" runat="server" Text="Label"></asp:Label>
                                    <asp:HiddenField ID="hdfCodModalidad6" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblNomPlan7" runat="server" Text="Label"></asp:Label>
                                    <asp:HiddenField ID="hdfCodModalidad7" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblNomPlan8" runat="server" Text="Label"></asp:Label>
                                    <asp:HiddenField ID="hdfCodModalidad8" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblNomPlan9" runat="server" Text="Label"></asp:Label>
                                    <asp:HiddenField ID="hdfCodModalidad9" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblNomPlan10" runat="server" Text="Label"></asp:Label>
                                    <asp:HiddenField ID="hdfCodModalidad10" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblNomPlan11" runat="server" Text="Label"></asp:Label>
                                    <asp:HiddenField ID="hdfCodModalidad11" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblNomPlan12" runat="server" Text="Label"></asp:Label>
                                    <asp:HiddenField ID="hdfCodModalidad12" runat="server" />
                                </asp:TableCell>
                            </asp:TableRow>

                            <asp:TableRow ID="tblrowPrimaNeta" SkinID="skPrimaNeta" runat="server" Visible="false">

                                <asp:TableCell CssClass="titPrimaNeta">Prima Neta Anual</asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblPrimaNeta1" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblPrimaNeta2" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblPrimaNeta3" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblPrimaNeta4" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblPrimaNeta5" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblPrimaNeta6" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblPrimaNeta7" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblPrimaNeta8" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblPrimaNeta9" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblPrimaNeta10" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblPrimaNeta11" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblPrimaNeta12" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow ID="tblrowPrimaComision" SkinID="skPrimaComision" runat="server" Visible="false">
                                <asp:TableCell CssClass="titPrimaComision">
                                    <asp:CheckBox ID="chkComisionDif1" runat="server" AutoPostBack="true" OnCheckedChanged="chkComisionDif_CheckedChanged" />
                                    Comisión Ajustada al
                                    <asp:DropDownList ID="drpCuadroCom" OnSelectedIndexChanged="drpCuadroCom_SelectedIndexChanged" AutoPostBack="true" runat="server">
                                        <asp:ListItem Text="12" Value="12"></asp:ListItem>
                                    </asp:DropDownList>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblPrimaComision1" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblPrimaComision2" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblPrimaComision3" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblPrimaComision4" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblPrimaComision5" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblPrimaComision6" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblPrimaComision7" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblPrimaComision8" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblPrimaComision9" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblPrimaComision10" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblPrimaComision11" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblPrimaComision12" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow ID="tblrowDescuento" SkinID="skDescuento" runat="server" Visible="false">
                                <asp:TableCell CssClass="titDescuento">
                                    % Descuento &nbsp;
                                    <asp:DropDownList ID="drpDescuento" AutoPostBack="true" OnSelectedIndexChanged="AplicaDescuentos"
                                        runat="server">
                                    </asp:DropDownList>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblDescuento1" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblDescuento2" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblDescuento3" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblDescuento4" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblDescuento5" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblDescuento6" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblDescuento7" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblDescuento8" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblDescuento9" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblDescuento10" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblDescuento11" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblDescuento12" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow ID="tblrowRecargo" SkinID="skRecargo" runat="server" Visible="false">
                                <asp:TableCell CssClass="titRecargo">
                                    % Recargo &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtRecargo" OnTextChanged="AplicaRecargos"
                                        AutoPostBack="true" runat="server" MaxLength="2" Width="25"></asp:TextBox>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblRecargo1" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblRecargo2" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblRecargo3" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblRecargo4" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblRecargo5" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblRecargo6" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblRecargo7" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblRecargo8" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblRecargo9" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblRecargo10" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblRecargo11" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblRecargo12" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow ID="tblrowCuota" SkinID="skCuota" runat="server">
                                <asp:TableCell CssClass="titCuota">
                                    Aviso de Vencimiento&nbsp;&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="drpValCuota" AutoPostBack="true"
                                        Visible="false" OnSelectedIndexChanged="drpValCuota_SelectedIndexChanged" runat="server">
                                        <asp:ListItem Text="12" Value="12"></asp:ListItem>
                                        <asp:ListItem Text="10" Value="10"></asp:ListItem>
                                        <asp:ListItem Text="8" Value="8"></asp:ListItem>
                                        <asp:ListItem Text="6" Value="6"></asp:ListItem>
                                        <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                        <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                    </asp:DropDownList>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblCuota1" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblCuota2" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblCuota3" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblCuota4" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblCuota5" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblCuota6" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblCuota7" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblCuota8" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblCuota9" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblCuota10" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblCuota11" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblCuota12" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow ID="tblrowDsctoCruzada" SkinID="skCuota" runat="server" Visible="false">
                                <asp:TableCell CssClass="titCuota">
                                    Descuento Venta Cruzada
                                    <asp:Label ID="lbltblrowDsctoCruzada" runat="server" Text="Label"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblDsctoCruzada1" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblDsctoCruzada2" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblDsctoCruzada3" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblDsctoCruzada4" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblDsctoCruzada5" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblDsctoCruzada6" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblDsctoCruzada7" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblDsctoCruzada8" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblDsctoCruzada9" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblDsctoCruzada10" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblDsctoCruzada11" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblDsctoCruzada12" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow ID="tblrowDsctoFamiliar" SkinID="skCuota" runat="server" Visible="false">
                                <asp:TableCell CssClass="titCuota">
                                    Descuento Familiar
                                    <asp:Label ID="lbltblrowDsctoFamiliar" runat="server" Text="Label"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblDsctoFamiliar1" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblDsctoFamiliar2" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblDsctoFamiliar3" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblDsctoFamiliar4" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblDsctoFamiliar5" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblDsctoFamiliar6" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblDsctoFamiliar7" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblDsctoFamiliar8" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblDsctoFamiliar9" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblDsctoFamiliar10" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblDsctoFamiliar11" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblDsctoFamiliar12" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow ID="tblrowDsctoAgendaVencida" SkinID="skCuota" runat="server" Visible="false">
                                <asp:TableCell CssClass="titCuota">
                                    Descuento AgendaVencida
                                    <asp:Label ID="lbltblrowDsctoAgendaVencida" runat="server" Text="Label"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblDsctoAgendaVenc1" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblDsctoAgendaVenc2" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblDsctoAgendaVenc3" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblDsctoAgendaVenc4" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblDsctoAgendaVenc5" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblDsctoAgendaVenc6" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblDsctoAgendaVenc7" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblDsctoAgendaVenc8" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblDsctoAgendaVenc9" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblDsctoAgendaVenc10" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblDsctoAgendaVenc11" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblDsctoAgendaVenc12" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow ID="tblrowDsctosCampanaComercial" SkinID="skCuota" runat="server" Visible="false">
                                <asp:TableCell CssClass="titCuota">
                                    Descuento Total Campaña comercial
                                    <asp:Label ID="lbltblrowDsctoCampanaComercial" runat="server" Text="Label"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblDsctoCampanaComercial1" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblDsctoCampanaComercial2" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblDsctoCampanaComercial3" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblDsctoCampanaComercial4" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblDsctoCampanaComercial5" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblDsctoCampanaComercial6" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblDsctoCampanaComercial7" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblDsctoCampanaComercial8" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblDsctoCampanaComercial9" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblDsctoCampanaComercial10" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblDsctoCampanaComercial11" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblDsctoCampanaComercial12" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow ID="tblrowPrimaTotal" SkinID="skPrimaTotal" runat="server">
                                <asp:TableCell CssClass="titPrimaTotal">
                Prima Bruta Anual Final
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblPrimaTotal1" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblPrimaTotal2" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblPrimaTotal3" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblPrimaTotal4" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblPrimaTotal5" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblPrimaTotal6" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblPrimaTotal7" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblPrimaTotal8" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblPrimaTotal9" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblPrimaTotal10" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblPrimaTotal11" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblPrimaTotal12" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow ID="tblrowCuotaPAT" SkinID="skCuotaPAT" runat="server" Visible="false">
                                <asp:TableCell CssClass="titCuotaPAT">
                                    Pago Automático Tarjeta de Crédito (PAT)
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblCuotaPAT1" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblCuotaPAT2" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblCuotaPAT3" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblCuotaPAT4" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblCuotaPAT5" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblCuotaPAT6" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblCuotaPAT7" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblCuotaPAT8" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblCuotaPAT9" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblCuotaPAT10" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblCuotaPAT11" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblCuotaPAT12" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow ID="tblrowPrimaTotalDsctos" SkinID="skPrimaNeta" runat="server" Visible="false">
                                <asp:TableCell CssClass="titPrimaNeta">
                Prima Bruta Anual (Con descuentos)
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblPrimaTotalDsctos1" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblPrimaTotalDsctos2" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblPrimaTotalDsctos3" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblPrimaTotalDsctos4" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblPrimaTotalDsctos5" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblPrimaTotalDsctos6" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblPrimaTotalDsctos7" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblPrimaTotalDsctos8" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblPrimaTotalDsctos9" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblPrimaTotalDsctos10" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblPrimaTotalDsctos11" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:Label ID="lblPrimaTotalDsctos12" runat="server" Text="Label"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow ID="tblrowValorRef" SkinID="skValorRef" runat="server" Visible="false">
                                <asp:TableCell SkinID="skValorRef">                
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow ID="tblrowSelModalidades" SkinID="skSelModalidades" runat="server"
                                Visible="false">
                                <asp:TableCell CssClass="titSelModalidades">Seleccionar Simulaciones
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:CheckBox ID="chkselmod1" runat="server" OnCheckedChanged="chkselmod_CheckedChanged"
                                        AutoPostBack="true" />
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:CheckBox ID="chkselmod2" runat="server" OnCheckedChanged="chkselmod_CheckedChanged"
                                        AutoPostBack="true" />
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:CheckBox ID="chkselmod3" runat="server" OnCheckedChanged="chkselmod_CheckedChanged"
                                        AutoPostBack="true" />
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:CheckBox ID="chkselmod4" runat="server" OnCheckedChanged="chkselmod_CheckedChanged"
                                        AutoPostBack="true" />
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:CheckBox ID="chkselmod5" runat="server" OnCheckedChanged="chkselmod_CheckedChanged"
                                        AutoPostBack="true" />
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:CheckBox ID="chkselmod6" runat="server" OnCheckedChanged="chkselmod_CheckedChanged"
                                        AutoPostBack="true" />
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:CheckBox ID="chkselmod7" runat="server" OnCheckedChanged="chkselmod_CheckedChanged"
                                        AutoPostBack="true" />
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:CheckBox ID="chkselmod8" runat="server" OnCheckedChanged="chkselmod_CheckedChanged"
                                        AutoPostBack="true" />
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:CheckBox ID="chkselmod9" runat="server" OnCheckedChanged="chkselmod_CheckedChanged"
                                        AutoPostBack="true" />
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:CheckBox ID="chkselmod10" runat="server" OnCheckedChanged="chkselmod_CheckedChanged"
                                        AutoPostBack="true" />
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:CheckBox ID="chkselmod11" runat="server" OnCheckedChanged="chkselmod_CheckedChanged"
                                        AutoPostBack="true" />
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:CheckBox ID="chkselmod12" runat="server" OnCheckedChanged="chkselmod_CheckedChanged"
                                        AutoPostBack="true" />
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow ID="tblrowSelModEmitir" SkinID="skSelModalidadesEmitir" runat="server">
                                <asp:TableCell CssClass="titSelModalidadesEmitir">Seleccione Plan a Emitir
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:RadioButton ID="rdbselmod1" GroupName="ModalidadEmitir" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:RadioButton ID="rdbselmod2" GroupName="ModalidadEmitir" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:RadioButton ID="rdbselmod3" GroupName="ModalidadEmitir" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:RadioButton ID="rdbselmod4" GroupName="ModalidadEmitir" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:RadioButton ID="rdbselmod5" GroupName="ModalidadEmitir" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:RadioButton ID="rdbselmod6" GroupName="ModalidadEmitir" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:RadioButton ID="rdbselmod7" GroupName="ModalidadEmitir" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:RadioButton ID="rdbselmod8" GroupName="ModalidadEmitir" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:RadioButton ID="rdbselmod9" GroupName="ModalidadEmitir" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:RadioButton ID="rdbselmod10" GroupName="ModalidadEmitir" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:RadioButton ID="rdbselmod11" GroupName="ModalidadEmitir" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell SkinID="skCeldaRes">
                                    <asp:RadioButton ID="rdbselmod12" GroupName="ModalidadEmitir" runat="server" />
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow ID="tblrowTitulo" SkinID="skTipoCot" runat="server">
                                <asp:TableCell CssClass="titTipoCot" ColumnSpan="11">
                                    <asp:Label runat="server" ID="lblTipoCot" Visible="true" Text="Estas condiciones, coberturas y tarifas son únicamente validas para emisión electrónica en éste mismo programa y por el propio Corredor."></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow ID="TableRow1" SkinID="skTipoCot" runat="server" Visible="false">
                                <asp:TableCell CssClass="titTipoCot" ColumnSpan="11">
                                    <asp:Label runat="server" ID="Label2" Visible="true" Text="(*) Valor Cuota sólo a travéz de medio de pago Tarjeta de Crédito."></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                    </fieldset>
                </div>
                <asp:UpdateProgress ID="UpdateProgress1" AssociatedUpdatePanelID="UpdatePanelResultados"
                    runat="server">
                    <ProgressTemplate>
                        <div class="overlay">
                        </div>
                        <div class="bottomimg">
                            Por favor, Espere un momento mientras calculamos nuevamente</div>
                    </ProgressTemplate>
                </asp:UpdateProgress>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <div id="content3">
                <div id="Botonera">
                    <table id="tblBotonera" runat="server">
                        <tr>
                            <td>
                                <%--<asp:ImageButton ID="ImgRecalcular" runat="server"SkinID="ImgRecalcular" OnClick="ImgRecalcular_Click" />
                                <asp:ImageButton ID="ImgNuevaCotizacion" runat="server" OnClick="ImgNuevaCotizacion_Click"
                                    SkinID="ImgNuevaCotizacion" />
                                <asp:ImageButton ID="ImgCotizar" runat="server" OnClick="ImgCotizar_Click" SkinID="ImgCotizar" />
                                <asp:ImageButton ID="ImgEnviarMail" runat="server" SkinID="ImgEnviarMail" OnClick="ImgEnviarMail_Click" />
                                <asp:ImageButton ID="ImgEmitir" runat="server" OnClick="ImgEmitirMostrar_Click" OnClientClick="javascript:if (!confirm('¿Esta seguro de emitir el plan seleccionado?')) return false;"
                                    SkinID="ImgEmitir" />--%>
                                <div>
                                    <asp:Button ID="ImgRecalcular" runat="server" Text="Recalcular" CssClass="estilo_boton"
                                        OnClick="ImgRecalcular_Click" />
                                    <asp:Button ID="ImgNuevaCotizacion" runat="server" Text="Nueva simulación" CssClass="estilo_boton"
                                        OnClick="ImgNuevaCotizacion_Click" />
                                    <asp:Button ID="ImgCotizar" runat="server" OnClick="ImgCotizar_Click" Text="Imprimir Simulación"
                                        CssClass="estilo_boton" />
                                    <asp:Button ID="ImgEnviarMail" runat="server" Text="Enviar por E-Mail" CssClass="estilo_boton"
                                        OnClick="ImgEnviarMail_Click" />
                                    <asp:Button ID="ImgEmitir" runat="server" OnClick="ImgEmitirMostrar_Click" Text="Generar Propuesta"
                                        CssClass="estilo_boton" />
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
                <asp:UpdateProgress ID="UpdateProgress2" AssociatedUpdatePanelID="UpdatePanel2" runat="server">
                    <ProgressTemplate>
                        <div class="overlay">
                        </div>
                        <div class="bottomimgbotonera">
                            Por favor, Espere un momento mientras cargamos los datos
                        </div>
                    </ProgressTemplate>
                </asp:UpdateProgress>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="UpdatePanelCorreo" runat="server">
        <ContentTemplate>
            <div id="EnviarCorreo" runat="server">
                <div id="Correo">
                    <fieldset>
                        <table class="fuente2">
                            <tr>
                                <td class="titItem" colspan="4">
                                    <asp:Label ID="Label1" CssClass="TituloSecundario" runat="server" Text="enviar simulación por e-mail"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 17%">
                                    para (e-mail Asegurado):
                                </td>
                                <td style="width: 25%">
                                    <asp:TextBox ID="txtEmailPara" runat="server" Width="210px" ToolTip="Ingrese el correo del Asegurado"></asp:TextBox>
                                </td>
                                <td style="width: 5%">
                                    de:
                                </td>
                                <td>
                                    <asp:TextBox ID="txtEmailDe" runat="server" Width="210px" ToolTip="Ingrese el correo del Remitente"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    <%--Mensaje :--%>
                                </td>
                                <td colspan="3">
                                    <asp:TextBox ID="txtEmailMensaje" runat="server" TextMode="MultiLine" Height="60px"
                                        Visible="false" Width="323px" MaxLength="300" Text="De acuerdo a lo conversado, envio la simulación."></asp:TextBox>
                                    &nbsp; &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    &nbsp;
                                    <asp:Button ID="imgEmailEnviar" runat="server" CssClass="estilo_boton" Text="Enviar"
                                        OnClick="imgEmailEnviar_Click" />
                                    <asp:Button ID="ImgCancelar" runat="server" CssClass="estilo_boton" Text="Cancelar"
                                        OnClick="ImgCancelar_Click1" />
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                </div>
            </div>
            <div id="EnviarCorreo_Exitoso" runat="server">
                <div id="Correo_Exitoso">
                    <fieldset>
                        <table>
                            <tr>
                                <td align="center">
                                    <strong>
                                        <asp:Label ID="lblEnvioCorreo" runat="server" Text=""></asp:Label>
                                    </strong>
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                </div>
            </div>
            <asp:UpdateProgress ID="UpdateProgress5" AssociatedUpdatePanelID="UpdatePanelCorreo"
                runat="server">
                <ProgressTemplate>
                    <div class="overlay">
                    </div>
                    <div class="correoimg">
                        Por favor, Espere un momento mientras enviamos su correo.</div>
                </ProgressTemplate>
            </asp:UpdateProgress>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="UpdatePanelSuplanta" runat="server">
        <ContentTemplate>
            <div id="PanelSuplanta" runat="server">
                <div id="Fondo" class="overlay">
                </div>
                <div id="DatosSuplanta" class="centered">
                    <table>
                        <tr>
                            <td colspan="2" class="AreaOpcional">
                                Suplantación Corredor
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 50%">
                                <table>
                                    <tr>
                                        <td colspan="2" class="fuente3">
                                            <strong>Ingrese RUT del Corredor</strong>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="fuente3">
                                            Cuenta
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtCuenta" AutoPostBack="true" runat="server" MaxLength="13" Width="80px"
                                                ToolTip="Ingrese la Patente del vehículo" runat="server" OnTextChanged="txtCuenta_TextChanged"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" align="center">
                                            <asp:ImageButton ID="ImgSuplanta" runat="server" SkinID="ImgSuplanta" OnClick="ImgSuplanta_Click" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td style="width: 50%" align="center">
                                <asp:ImageButton ID="ImgNoSuplanta" SkinID="ImgNoSuplanta" runat="server" OnClick="ImgNoSuplanta_Click" />
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <asp:UpdateProgress ID="UpdateProgress6" AssociatedUpdatePanelID="UpdatePanelSuplanta"
                runat="server">
                <ProgressTemplate>
                    <div class="overlay">
                    </div>
                    <div class="centralimg">
                        Por favor, Espere un momento mientras cargamos la información</div>
                </ProgressTemplate>
            </asp:UpdateProgress>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="UpdatePanelMELTW" runat="server">
        <ContentTemplate>
            <div id="PanelMELTW" runat="server">
                <div id="Fondo2" class="overlay3">
                </div>
                <%--                <div id="DatosPanelMEL-TW" class="fondotw">
                    <table width="530" height="406">
                        <tr>
                            <td align="center" height="291" style="width: 50%">
                                <asp:ImageButton ID="ImgMel" runat="server" SkinID="ImgMel" OnClick="ImgMel_Click" />
                            </td>
                            <td align="center" style="width: 50%">
                                <div id="divBtnCotizar" runat="server">
                                    <asp:ImageButton ID="ImgTw" runat="server" SkinID="ImgTw" OnClick="ImgTw_Click" />
                                </div>
                            </td>
                            <td align="center" style="width: 50%">
                                <asp:ImageButton ID="ImgMel13" Visible="true" runat="server" SkinID="ImgMel13" OnClick="ImgMel13_Click" />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 50%">
                                &nbsp;
                            </td>
                            <td align="center" style="width: 50%">
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </div>--%>
                <div id="DatosPanelMEL-TW">
                    <div id="pregunta">
                        <div class="titulo">
                            Simulación Vehículos Particulares</div>
                        <div class="encabezado">
                            Seleccione el canal por el que desea emitir su póliza</div>
                        <div class="bloque borde">
                            <h2>
                                Mapfre En Línea:</h2>
                            <p>
                                * <span class="color">Tarifas más rebajadas</span> que en la emisión por Oficina.</p>
                            <p>
                                * Acceso para <span>modificar su comisión</span>.</p>
                            <p>
                                * <span>Menor tasa</span> de interés.</p>
                            <p>
                                * Auto de <span>reemplazo sin límite</span>.</p>
                            <div class="clearfix">
                                <asp:Button ID="ImgMel" runat="server" Text="Simular/Emitir" CssClass="derecha" OnClick="ImgMel_Click1" />
                            </div>
                        </div>
                        <div class="bloque borde">
                            <h2>
                                Mapfre Oficina:</h2>
                            <p>
                                * Tarifas nomal por Oficina.</p>
                            <p>
                                * Comisión normal.</p>
                            <p>
                                * Tasa de interés normal.</p>
                            <p>
                                * Auto de reemplazo por 5 días</p>
                            <div class="clearfix">
                                <asp:Button ID="ImgMel13" runat="server" Text="Simular" CssClass="derecha" OnClick="ImgMel13_Click1" />
                            </div>
                        </div>
                        <div class='bloque volver'>
                            <asp:Button ID="btnVolver2" Text="Volver" runat="server" CssClass="izquierda volver"
                                OnClick="btnVolver2_Click" /></div>
                    </div>
                </div>
            </div>
            <asp:UpdateProgress ID="UpdateProgress7" AssociatedUpdatePanelID="UpdatePanelSuplanta"
                runat="server">
                <ProgressTemplate>
                    <div class="overlay">
                    </div>
                    <div class="centralimg">
                        Por favor, Espere un momento mientras cargamos la información</div>
                </ProgressTemplate>
            </asp:UpdateProgress>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="UpdatePanelMarketing" runat="server">
        <ContentTemplate>
            <div id="PanelMarketing" runat="server">
                <div id="Fondo" class="overlay">
                </div>
                <div id="DatosPanelMarketing" class="panelmarketing">
                    <table style="width: 100%">
                        <tr>
                            <td class="AreaOpcional">
                                Datos Personales
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 100%">
                                <table>
                                    <tr>
                                        <td colspan="2" class="fuente3">
                                            <strong>Para entregarte una mejor atención, favor indica los siguientes datos de contacto:
                                            </strong>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="fuente3">
                                            Nombre:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtNomMarketing" AutoPostBack="true" runat="server" MaxLength="30"
                                                Width="180px" ToolTip="Ingrese el Nombre" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="fuente3">
                                            Email:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtEmailMarketing" AutoPostBack="true" runat="server" MaxLength="60"
                                                Width="180px" ToolTip="Ingrese el Email" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="fuente3">
                                            Teléfono:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtFonoMarketing" MaxLength="10" runat="server" AutoPostBack="true"
                                                ToolTip="Ingrese el Telefono"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" align="center" class="fuente3">
                                            <asp:ImageButton ID="ImgIngresar" runat="server" SkinID="ImgAceptar" OnClick="ImgIngresar_Click" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <asp:UpdateProgress ID="UpdateProgress8" AssociatedUpdatePanelID="UpdatePanelSuplanta"
                runat="server">
                <ProgressTemplate>
                    <div class="overlay">
                    </div>
                    <div class="centralimg">
                        Por favor, Espere un momento mientras cargamos la información</div>
                </ProgressTemplate>
            </asp:UpdateProgress>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="UpdatePanelAutoAntiguo" runat="server" Visible="false">
        <ContentTemplate>
            <%--<div id="PanelAutoAntiguo" runat="server">
                <div id="FondoAutoAntiguo" class="overlay3">
                </div>
                <div id="DatosPanelAutoAntiguo" class="fondoautoant">
                    <table width="700" height="406">
                        <tr>
                            <td align="center" height="275" style="width: 33%">
                            </td>
                            <td align="center" style="width: 33%">
                            </td>
                            <td align="center" style="width: 33%">
                            </td>
                        </tr>
                        <tr valign="top">
                            <td align="center" style="width: 33%">
                            </td>
                            <td align="center" style="width: 33%">
                            </td>
                            <td align="center" style="width: 33%">
                                <asp:ImageButton ID="imgBtnAutoAntiguo" runat="server" SkinID="ImgBtnAutoAnt" OnClick="imgBtnAutoAntiguo_Click" />
                            </td>
                        </tr>
                    </table>
                </div>
            </div>--%>
            <div id="PanelAutoAntiguo" runat="server">
                <div id="FondoAutoAntiguo" class="overlay3" runat="server">
                </div>
                <div id="DatosPanelAutoAntiguo" runat="server" class="fondoautoant">
                    <div runat="server" class="titulo">
                        Simulación Vehículos Particulares</div>
                    <div runat="server" class="encabezado">
                    </div>
                    <div runat="server" class="bloque borde">
                        <h2>
                            Auto Senior:</h2>
                        <p>
                            * Para vehículos desde 13 hasta 20 años de Antigüedad</p>
                        <p>
                            * Deducible de UF5 en toda y cada pérdida</p>
                        <p>
                            * Rige deducible de 15% del valor comercial para casos de pérdida total del vehiculo
                            a consecuencia de Robo o Daño al Vehículo</p>
                        <div runat="server" class="clearfix">
                            <asp:Button ID="BtnAutoAntiguo" Text="Simular" runat="server" CssClass="derecha"
                                OnClick="BtnAutoAntiguo_Click" />
                        </div>
                    </div>
                    <div class='bloque volver'>
                        <asp:Button ID="btnVolver" runat="server" Text="Volver" CssClass="izquierda volver"
                            OnClick="btnVolver_Click" /></div>
                </div>
            </div>
            <asp:UpdateProgress ID="UpdateProgress9" AssociatedUpdatePanelID="UpdatePanelAutoAntiguo"
                runat="server">
                <ProgressTemplate>
                    <div class="overlay">
                    </div>
                    <div class="centralimg">
                        Por favor, Espere un momento mientras cargamos la información</div>
                </ProgressTemplate>
            </asp:UpdateProgress>
        </ContentTemplate>
    </asp:UpdatePanel>
    <input type="hidden" id="hdnMinVigencia" name="hdnMinVigencia" runat="server" />
    <input type="hidden" id="hdnMinVigenciaSel" name="hdnMinVigenciaSel" runat="server" />
</asp:Content>
