<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="CargaCotizacion.aspx.cs" Inherits="_Default" Title="Simulador de Vehiculos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanelCuenta" runat="server">
        <ContentTemplate>
            <table style="width: 100%">
                <tr>
                    <td style="width: 50%; text-align: left">
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
                                            <asp:CheckBox ID="chkCotExpress" AutoPostBack="true" runat="server" Text="Simulación Express" />
                                        </td>
                                        <td>
                                        </td>
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
                                <strong>
                                    <asp:TextBox ID="txtNumMatricula" AutoPostBack="true" runat="server" MaxLength="6"
                                        Width="80px" OnTextChanged="txtNumMatricula_TextChanged" ToolTip="Ingrese la Patente del vehículo"></asp:TextBox>
                                    <asp:Label ID="lblNumMatricula" runat="server"></asp:Label></strong>
                            </td>
                            <td colspan="2">
                                <asp:CheckBox ID="chkVehFact48" runat="server" Text="Vehículo con Factura 48 hrs."
                                    AutoPostBack="true" />
                            </td>
                            <td style="width: 12%;">
                                año Fabricación:
                            </td>
                            <td>
                                <asp:DropDownList ID="drpAño" runat="server" AutoPostBack="True" ToolTip="Seleccione el Año del Vehículo">
                                </asp:DropDownList>
                                <strong>
                                    <asp:Label ID="lblAño" runat="server"></asp:Label></strong>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                marca:
                            </td>
                            <td>
                                <asp:DropDownList ID="drpMarca" runat="server" AutoPostBack="True" ToolTip="Seleccione la Marca del Vehículo">
                                </asp:DropDownList>
                                <strong>
                                    <asp:Label ID="lblNomMarca" runat="server"></asp:Label></strong>
                            </td>
                            <td style="width: 5%;">
                                modelo:
                            </td>
                            <td style="width: 25%;">
                                <asp:DropDownList ID="drpModelo" runat="server" AutoPostBack="True" ToolTip="Seleccione el Modelo del Vehículo">
                                    <asp:ListItem Selected="True" Text="Seleccionar" Value="0"></asp:ListItem>
                                </asp:DropDownList>
                                <strong>
                                    <asp:Label ID="lblNomModelo" runat="server"></asp:Label></strong>
                            </td>
                            <td>
                                sub modelo:
                            </td>
                            <td>
                                <asp:DropDownList ID="drpSubModelo" runat="server" ToolTip="Seleccione el Sub Modelo del Vehículo">
                                    <asp:ListItem Selected="True" Text="Seleccionar" Value="0"></asp:ListItem>
                                </asp:DropDownList>
                                <strong>
                                    <asp:Label ID="lblNomSubModelo" runat="server"></asp:Label></strong>
                            </td>
                        </tr>
                        <tr>
                                <td colspan="5">
                                    <asp:Label ID="lblPregFranquicia" runat="server" Text="¿Posee franquicia aduanera?"></asp:Label>
                                    <asp:RadioButton ID="rbtFranquiciaSi" runat="server" GroupName="grpFranquicia" Text="Si" ToolTip="Seleccione si posee o no franquicia aduanera" />
                                    <asp:RadioButton ID="rbtFranquiciaNo" runat="server" GroupName="grpFranquicia" Text="No" ToolTip="Seleccione si posee o no franquicia aduanera"/>
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
                                <asp:Label ID="lblDatosAsegurado" CssClass="TituloSecundario" runat="server" Text="datos del asegurado"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 12%;">
                                rut:
                            </td>
                            <td>
                                <strong>
                                    <asp:Label ID="lblCodDocumAseg" runat="server"></asp:Label></strong>
                            </td>
                            <td colspan="3">
                             <asp:Label ID="lblPregDueno" runat="server" Text="¿El RUT ingresado pertenece al dueño del vehículo?"></asp:Label>
                                    <asp:RadioButton ID="rbtDueñoSi" runat="server" GroupName="grpDueño" Text="Si" AutoPostBack="true" 
                                        ToolTip="Seleccione si el RUT ingresado pertenece al dueño del vehículo" />
                                    <asp:RadioButton ID="rbtDueñoNo" runat="server" GroupName="grpDueño" Text="No" AutoPostBack="true" 
                                    ToolTip="Seleccione si el RUT ingresado pertenece al dueño del vehículo" />
                            </td>                           
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                nombre:
                            </td>
                            <td style="width: 24%;">
                                <strong>
                                    <asp:Label ID="lblNomAseg" runat="server"></asp:Label></strong>
                            </td>
                            <td style="width: 12%;">
                                apellido paterno:
                            </td>
                            <td>
                                <strong>
                                    <asp:Label ID="lblApePatAseg" runat="server"></asp:Label></strong>
                            </td>
                            <td style="width: 12%;">
                                apellido materno:
                            </td>
                            <td>
                                <strong>
                                    <asp:Label ID="lblApeMatAseg" runat="server"></asp:Label></strong>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblPregHijos" runat="server" Text="¿Tiene hijos?"></asp:Label></td>
                            <td>
                                <asp:RadioButton ID="rbtHijosSi" runat="server" GroupName="grpHijos" Text="Si" ToolTip="Seleccione si el dueño del vehículo ingresado tiene hijos" />
                                <asp:RadioButton ID="rbtHijosNo" runat="server" GroupName="grpHijos" Text="No" ToolTip="Seleccione si el dueño del vehículo ingresado tiene hijos"/>
                            </td>
                        </tr>    
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
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
            <div id="Opc_Coberturas" runat="server">
               <div id="Coberturas">
                        <fieldset>
                            <%--<table>
                                <tr>
                                    <td class="titItem">
                                        <asp:Label ID="lblResumenCoberturas" CssClass="TituloSecundario" runat="server" Text="resumen de coberturas"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Image ID="ImgCoberturas" SkinID="ImgCoberturas" runat="server" />
                                    </td>
                                </tr>
                            </table>--%>
                            <table>
                                <tr>
                                    <td class="titItem">
                                        <asp:Label ID="lblResumenCoberturas" CssClass="TituloSecundario" runat="server" Text="resumen de coberturas"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <table style="text-align:center; font-size:12px; border: 1px solid #c10003; font-variant:inherit" >
                                            <tr style=" background-color:#c10003; color:White; font-weight:bold; height:20px">
                                                <td style=" width:350px;">Coberturas por Producto</td>
                                                <td style=" width:140px;">Flex</td>
                                                <td style=" width:140px;">Master</td>
                                                <td style=" width:140px;">Balance</td>
                                                <td style=" width:140px;">Elemental</td>
                                            </tr>
                                            <tr>
                                                <td>Daños al vehículo (incendio, choque o volcamiento)</td>
                                                <td><asp:Image ID="Image1" runat="server"  ImageUrl="~/ticket.jpg"/></td>
                                                <td><asp:Image ID="Image2" runat="server"  ImageUrl="~/ticket.jpg"/></td>
                                                <td><asp:Image ID="Image3" runat="server"  ImageUrl="~/ticket.jpg"/></td>
                                                <td>-</td>
                                            </tr>
                                            <tr>
                                                <td>Robo, Hurto, Uso no Autorizado</td>
                                                <td><asp:Image ID="Image4" runat="server"  ImageUrl="~/ticket.jpg"/></td>
                                                <td><asp:Image ID="Image5" runat="server"  ImageUrl="~/ticket.jpg"/></td>
                                                <td><asp:Image ID="Image6" runat="server"  ImageUrl="~/ticket.jpg"/></td>
                                                <td>-</td>
                                            </tr>
                                            <tr>
                                                <td>Pérdida Total por Daños</td>
                                                <td><asp:Image ID="Image7" runat="server"  ImageUrl="~/ticket.jpg"/></td>
                                                <td><asp:Image ID="Image8" runat="server"  ImageUrl="~/ticket.jpg"/></td>
                                                <td><asp:Image ID="Image9" runat="server"  ImageUrl="~/ticket.jpg"/></td>
                                                <td>-</td>
                                            </tr>
                                            <tr>
                                                <td>Responsabilidad Civil</td>
                                                <td colspan="4">Monto hasta UF 1.000, opera como límite combinando las 3 
                                                    subsecciones</td>
                                            </tr>
                                            <tr>
                                                <td>Robo de Accesorios</td>
                                                <td><asp:Image ID="Image10" runat="server"  ImageUrl="~/ticket.jpg"/></td>
                                                <td><asp:Image ID="Image11" runat="server"  ImageUrl="~/ticket.jpg"/></td>
                                                <td><asp:Image ID="Image12" runat="server"  ImageUrl="~/ticket.jpg"/></td>
                                                <td>-</td>
                                            </tr>
                                            <tr>
                                                <td>Daños por Riesgo a la Naturaleza</td>
                                                <td><asp:Image ID="Image13" runat="server"  ImageUrl="~/ticket.jpg"/></td>
                                                <td><asp:Image ID="Image14" runat="server"  ImageUrl="~/ticket.jpg"/></td>
                                                <td><asp:Image ID="Image15" runat="server"  ImageUrl="~/ticket.jpg"/></td>
                                                <td>-</td>
                                            </tr>
                                            <tr>
                                                <td>Daños por Granizo</td>
                                                <td><asp:Image ID="Image16" runat="server"  ImageUrl="~/ticket.jpg"/></td>
                                                <td><asp:Image ID="Image17" runat="server"  ImageUrl="~/ticket.jpg"/></td>
                                                <td><asp:Image ID="Image18" runat="server"  ImageUrl="~/ticket.jpg"/></td>
                                                <td>-</td>
                                            </tr>
                                            <tr>
                                                <td>Daños por Sismo</td>
                                                <td><asp:Image ID="Image19" runat="server"  ImageUrl="~/ticket.jpg"/></td>
                                                <td><asp:Image ID="Image20" runat="server"  ImageUrl="~/ticket.jpg"/></td>
                                                <td><asp:Image ID="Image21" runat="server"  ImageUrl="~/ticket.jpg"/></td>
                                                <td>-</td>
                                            </tr>
                                            <tr>
                                                <td>Daños Materiales por Actos Maliciosos</td>
                                                <td><asp:Image ID="Image22" runat="server"  ImageUrl="~/ticket.jpg"/></td>
                                                <td><asp:Image ID="Image23" runat="server"  ImageUrl="~/ticket.jpg"/></td>
                                                <td><asp:Image ID="Image24" runat="server"  ImageUrl="~/ticket.jpg"/></td>
                                                <td>-</td>
                                            </tr>
                                            <tr>
                                                <td>Daños Materiales por la Carga</td>
                                                <td><asp:Image ID="Image25" runat="server"  ImageUrl="~/ticket.jpg"/></td>
                                                <td><asp:Image ID="Image30" runat="server"  ImageUrl="~/ticket.jpg"/></td>
                                                <td><asp:Image ID="Image31" runat="server"  ImageUrl="~/ticket.jpg"/></td>
                                                <td>-</td>
                                            </tr>
                                            <tr>
                                                <td>Daños a Terceros por la Carga</td>
                                                <td><asp:Image ID="Image32" runat="server"  ImageUrl="~/ticket.jpg"/></td>
                                                <td><asp:Image ID="Image33" runat="server"  ImageUrl="~/ticket.jpg"/></td>
                                                <td><asp:Image ID="Image34" runat="server"  ImageUrl="~/ticket.jpg"/></td>
                                                <td>-</td>
                                            </tr>
                                            <tr>
                                                <td>Defensa Penal</td>
                                                <td><asp:Image ID="Image35" runat="server"  ImageUrl="~/ticket.jpg"/></td>
                                                <td><asp:Image ID="Image36" runat="server"  ImageUrl="~/ticket.jpg"/></td>
                                                <td><asp:Image ID="Image37" runat="server"  ImageUrl="~/ticket.jpg"/></td>
                                                <td>-</td>
                                            </tr>
                                            <tr>
                                                <td>Asiento Pasajero (Muerte Accidental)</td>
                                                <td><asp:Image ID="Image38" runat="server"  ImageUrl="~/ticket.jpg"/></td>
                                                <td><asp:Image ID="Image39" runat="server"  ImageUrl="~/ticket.jpg"/></td>
                                                <td><asp:Image ID="Image40" runat="server"  ImageUrl="~/ticket.jpg"/></td>
                                                <td>-</td>
                                            </tr>
                                            <tr>
                                                <td>Asiento Pasajero (Invalidez Accidental)</td>
                                                <td><asp:Image ID="Image41" runat="server"  ImageUrl="~/ticket.jpg"/></td>
                                                <td><asp:Image ID="Image42" runat="server"  ImageUrl="~/ticket.jpg"/></td>
                                                <td><asp:Image ID="Image43" runat="server"  ImageUrl="~/ticket.jpg"/></td>
                                                <td>-</td>
                                            </tr>
                                            <tr>
                                                <td>Asistencia Mapfre con <span style="color:#c10003">Auto de Reemplazo Ilimitado</span> </td>
                                                <td><asp:Image ID="Image44" runat="server"  ImageUrl="~/ticket.jpg"/></td>
                                                <td><asp:Image ID="Image45" runat="server"  ImageUrl="~/ticket.jpg"/></td>
                                                <td>-</td>
                                                <td>-</td>
                                            </tr>
                                            <tr>
                                                <td>Asistencia en Ruta</td>
                                                <td>-</td>
                                                <td>-</td>
                                                <td><asp:Image ID="Image48" runat="server"  ImageUrl="~/ticket.jpg"/></td>
                                                <td><asp:Image ID="Image47" runat="server"  ImageUrl="~/ticket.jpg"/></td>
                                            </tr>
                                            <tr>
                                                <td>Resp. Civil en Exceso UF 1.500</td>
                                                <td>Opcional</td>
                                                <td><asp:Image ID="Image46" runat="server"  ImageUrl="~/ticket.jpg"/></td>
                                                <td>Opcional</td>
                                                <td>Opcional</td>
                                            </tr>
                                            <tr>
                                                <td>Resp. Civil en Exceso UF 4.000</td>
                                                <td>Opcional</td>
                                                <td>Opcional</td>
                                                <td>Opcional</td>
                                                <td>Opcional</td>
                                            </tr>
                                            <tr>
                                                <td>Daños por Viaje al Extranjero</td>
                                                <td><asp:Image ID="Image49" runat="server"  ImageUrl="~/ticket.jpg"/></td>
                                                <td><asp:Image ID="Image50" runat="server"  ImageUrl="~/ticket.jpg"/></td>
                                                <td><asp:Image ID="Image51" runat="server"  ImageUrl="~/ticket.jpg"/></td>
                                                <td>-</td>
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
                                    <td colspan="2">
                                        <asp:CheckBox ID="chk8200" Text="Responsabilidad Civil en Exceso de UF 1000 por UF 1.500"
                                            runat="server" AutoPostBack="true" OnCheckedChanged="chk8200_CheckedChanged" /><a
                                                href="#" class="info">
                                                <asp:Image ID="ImgNota" runat="server" SkinID="ImgNota" />
                                                <span>Responsabilidad Civil en Exceso se extiende a cubrir los riesgos de responsabilidad
                                                    civil por daño emergente, daño moral y lucro cesante, hasta UF 1.500 en exceso de
                                                    UF 1000, como limite único y combinado para las tres subsecciones, bajo los mismos
                                                    términos, condiciones y exclusiones de la cobertura principal.<br>
                                                    Cobertura incluída en Planes Master<br>
                                                </span></a>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:CheckBox ID="chk8201" Text="Responsabilidad Civil en Exceso de UF 1000 por UF 4.000"
                                            runat="server" AutoPostBack="true" OnCheckedChanged="chk8201_CheckedChanged" />
                                        <a href="#" class="info">
                                            <asp:Image ID="Image26" runat="server" SkinID="ImgNota" />
                                            <span>Responsabilidad Civil en Exceso se extiende a cubrir los riesgos de responsabilidad
                                                civil por daño emergente, daño moral y lucro cesante, hasta UF 4.000 en exceso de
                                                UF 1000, como limite único y combinado para las tres subsecciones, bajo los mismos
                                                términos, condiciones y exclusiones de la cobertura principal.<br>
                                            </span></a>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:CheckBox ID="chk8105" Text="daños al vehículo durante viajes al extranjero"
                                            runat="server" AutoPostBack="true" OnCheckedChanged="chk8105_CheckedChanged" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:CheckBox ID="chk8133" runat="server" onclick="return false;" Checked="true" AutoPostBack="true" OnCheckedChanged="chk8133_CheckedChanged" Text="Autoreemplazo 10 días." /> 
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:CheckBox ID="chkExGar" Text="exclusividad de garage" runat="server" AutoPostBack="true"
                                            OnCheckedChanged="chkExGar_CheckedChanged" />
                                    </td>
                                </tr>
                                
                            </table>
                    </fieldset>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="UpdatePanelResultados" runat="server">
        <ContentTemplate>
            <div id="divResultados">
                    <fieldset>
                        <table style="width:90%; text-align:center;background-color: #FFFFFF;font-family: Arial, Verdana;font-size: 11px;font-weight: normal;
	                    text-transform: capitalize;" id="tblDescRec" runat="server" visible="true">
                            <tr>
                                <td Visible="false" id="tdCuadroCom" runat="server" style="width:25%;">
                                <asp:CheckBox ID="chkComisionDif"  Visible="false" runat="server" AutoPostBack="true" OnCheckedChanged="chkComisionDif_CheckedChanged" />
                                    Indique comisión deseada
                                    <asp:DropDownList ID="drpCuadroCom1" Visible="false" OnSelectedIndexChanged="drpCuadroCom_SelectedIndexChanged"
                                        AutoPostBack="true" runat="server">
                                        <asp:ListItem Text="12" Value="12"></asp:ListItem>
                                    </asp:DropDownList>       
                                </td>
                                <td Visible="false" id="tdRecargo" runat="server" style="width:25%;">
                                    % Recargo 
                                    <asp:TextBox ID="txtRecargo1"  Visible="false" OnTextChanged="AplicaRecargos"
                                        AutoPostBack="true" runat="server" MaxLength="2" Width="25"></asp:TextBox>
                                </td>
                                <td  Visible="false" id="tdDscto" runat="server" style="width:25%;">
                                    % Descuento
                                    <asp:DropDownList ID="drpDescuento1"  Visible="false" AutoPostBack="true" OnSelectedIndexChanged="AplicaDescuentos"
                                        runat="server">
                                    </asp:DropDownList>
                                </td>
                                <td style="width:25%;">Indique número de cuotas
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
                            </tr>
                        </table>
                        <br />
                        <asp:Table ID="tblResultados" SkinID="skTblResultados" runat="server">
                            <asp:TableRow ID="tblrowNomPlan" SkinID="skNomPlan" runat="server" Visible="true">
                                <asp:TableCell CssClass="titNombrePlan" Width="500px">
                        CUADRO RESUMEN DE PRIMAS (Valores en UF iva incluído)
                                </asp:TableCell>
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
                                <asp:TableCell CssClass="titPrimaNeta">
                Prima Neta Anual (Comisión Normal)
                                </asp:TableCell>
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
                                    <asp:DropDownList ID="drpCuadroCom" OnSelectedIndexChanged="drpCuadroCom_SelectedIndexChanged"
                                        AutoPostBack="true" runat="server">
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
                            <asp:TableRow ID="tblrowCuota" SkinID="skCuota" runat="server">
                                <asp:TableCell CssClass="titCuota">
                                    Aviso&nbsp;&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="drpValCuota" AutoPostBack="true" Visible="false"
                                        OnSelectedIndexChanged="drpValCuota_SelectedIndexChanged" runat="server">
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
                                    Descuento Campaña comercial Total
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
                            <asp:TableRow ID="tblrowCuotaPAT" SkinID="skCuotaPAT" runat="server">
                                <asp:TableCell CssClass="titCuotaPAT">
                                    PAT
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
                            <asp:TableRow ID="tblrowSelModalidades" SkinID="skSelModalidades" runat="server" Visible="false">
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
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <div id="Botonera">
                <table id="tblBotonera" runat="server">
                    <tr>
                        <td>
                            <%--<asp:ImageButton ID="ImgNuevaCotizacion" runat="server" OnClick="ImgNuevaCotizacion_Click"
                                SkinID="ImgNuevaCotizacion" />
                            <asp:ImageButton ID="ImgCotizar" runat="server" OnClick="ImgCotizar_Click" SkinID="ImgCotizar" />                            
                            <asp:ImageButton ID="ImgEmitir" runat="server" OnClick="ImgEmitirMostrar_Click" OnClientClick="javascript:if (!confirm('¿Esta seguro de emitir el plan seleccionado?')) return false;"
                                SkinID="ImgEmitir" />--%>
                           <asp:Button ID="ImgNuevaCotizacion" runat="server" Text="Nueva simulación" CssClass="estilo_boton" OnClick="ImgNuevaCotizacion_Click"/>
                           <asp:Button ID="ImgCotizar" runat="server" OnClick="ImgCotizar_Click" Text="Imprimir Simulación" CssClass="estilo_boton"/>
                           <asp:Button ID="ImgEmitir" runat="server" OnClick="ImgEmitirMostrar_Click" Text="Generar Propuesta" CssClass="estilo_boton" />
                        </td>
                    </tr>
                </table>
            </div>
            <asp:UpdateProgress ID="UpdateProgress2" AssociatedUpdatePanelID="UpdatePanel2" runat="server">
                <ProgressTemplate>
                    <div class="overlay">
                    </div>
                    <div class="bottomimg">
                        Por favor, Espere un momento mientras cargamos los datos
                    </div>
                </ProgressTemplate>
            </asp:UpdateProgress>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
