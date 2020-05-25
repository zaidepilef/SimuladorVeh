<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Inspeccion.aspx.cs" Inherits="_Default" Title="Inspeccion Express" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="DatosAsegurado">
                <fieldset>
                    <table>
                        <tr>
                            <td colspan="4" class="titItem">
                                <asp:Label ID="lblDatosAsegurado" CssClass="TituloSecundario" runat="server" Text="datos del asegurado"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 12%;">
                                rut:
                            </td>
                            <td>
                                <asp:Label ID="lblCodDocumAseg" runat="server"></asp:Label>
                            </td>
                            <td style="width: 12%;">
                                nombres:
                            </td>
                            <td>
                                <asp:Label ID="lblNomAseg" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 12%;">
                                apellido paterno:
                            </td>
                            <td>
                                <asp:Label ID="lblApePaterno" runat="server"></asp:Label>
                            </td>
                            <td style="width: 12%;">
                                apellido materno:
                            </td>
                            <td>
                                <asp:Label ID="lblApeMaterno" runat="server"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </div>
            <div id="DatosVehiculo">
                <fieldset>
                    <table>
                        <tr>
                            <td colspan="4" class="titItem">
                                <asp:Label ID="lblDatosVeh" CssClass="TituloSecundario" runat="server" Text="datos del vehículo"></asp:Label>
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
                            <td style="width: 12%;">
                                modelo:
                            </td>
                            <td>
                                <asp:Label ID="lblNomModelo" runat="server"></asp:Label>
                            </td>
                            <td style="width: 12%;">
                                sub modelo:
                            </td>
                            <td>
                                <asp:Label ID="lblNomSubModelo" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 12%;">
                                nro motor:
                            </td>
                            <td>
                                <asp:Label ID="lblNroMotor" runat="server"></asp:Label>
                            </td>
                            <td style="width: 12%;">
                                nro chasis:
                            </td>
                            <td>
                                <asp:Label ID="lblNroChasis" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 12%;">
                                color:
                            </td>
                            <td>
                                <asp:Label ID="lblColor" runat="server"></asp:Label>
                            </td>
                            <td style="width: 12%;">
                                año fabricacion:
                            </td>
                            <td>
                                <asp:Label ID="lblAño" runat="server"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </div>
            <div id="DatosDanosPrevios">
                <fieldset>
                    <table>
                        <tr>
                            <td class="titItem">
                                <asp:Label ID="lblDanosPrevios" CssClass="TituloSecundario" runat="server" Text="estado del vehículo"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:RadioButton ID="rdbSinDanosPrevios" AutoPostBack="true" runat="server" Checked="true"
                                    Text="sin daños previos" GroupName="rdbDanosPrevios" OnCheckedChanged="rdbSinDanosPrevios_CheckedChanged" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:RadioButton ID="rdbDanosPreexistentes" AutoPostBack="true" runat="server" Text="daños preexistentes"
                                    GroupName="rdbDanosPrevios" OnCheckedChanged="rdbDanosPreexistentes_CheckedChanged" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div id="DivPartesVehiculo" runat="server">
                                    <fieldset>
                                        <table border="0" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td colspan="5">
                                                    partes del vehiculo
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="5">
                                                    <asp:Table ID="tblDaños" runat="server" BorderWidth="1" CellPadding="0" CellSpacing="0"
                                                        BorderColor="#CCCCCC">
                                                        <asp:TableRow ID="tblrow0" runat="server">
                                                            <asp:TableCell SkinID="skCeldaEliminar">
                                                                <asp:ImageButton ID="imgEliminarOriginal" Visible="false" SkinID="ImgEliminar" runat="server"
                                                                    OnClick="imgEliminar_Click" /></asp:TableCell>
                                                            <asp:TableCell SkinID="skCeldaDesc">descripción accesorios</asp:TableCell>
                                                            <asp:TableCell SkinID="skCeldaDaño">daño</asp:TableCell>
                                                            <asp:TableCell SkinID="skCeldaObs">observación</asp:TableCell>
                                                        </asp:TableRow>
                                                    </asp:Table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 70px">
                                                    &nbsp;
                                                </td>
                                                <td class="CeldaDescIng">
                                                    <asp:DropDownList ID="drpDescripcionParte" AutoPostBack="True" runat="server">
                                                    </asp:DropDownList>
                                                </td>
                                                <td class="CeldaDañoIng">
                                                    <asp:DropDownList ID="drpDaños" AutoPostBack="True" runat="server">
                                                    </asp:DropDownList>
                                                </td>
                                                <td class="CeldaObsIng">
                                                    <asp:TextBox ID="txtObservacion" runat="server" Width="205px"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:ImageButton ID="ImgAgregar" SkinID="ImgAgregar" runat="server" OnClick="ImgAgregar_Click" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="5" style="height: 10px">
                                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                                </td>
                                            </tr>
                                        </table>
                                    </fieldset>
                                </div>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </div>
            <div id="DatosAccesorios">
                <fieldset>
                    <table>
                        <tr>
                            <td class="titItem">
                                <asp:Label ID="lblAccesorios" CssClass="TituloSecundario" runat="server" Text="Accesorios"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:RadioButton ID="rdbSinAccesorios" AutoPostBack="true" runat="server" Checked="true"
                                    Text="sin accesorios" GroupName="rdbAccesorios" OnCheckedChanged="rdbSinAccesorios_CheckedChanged" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:RadioButton ID="rdbConAccesorios" AutoPostBack="true" runat="server" Text="con accesorios"
                                    GroupName="rdbAccesorios" OnCheckedChanged="rdbConAccesorios_CheckedChanged" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div id="DivAccesorios" runat="server">
                                    <fieldset>
                                        <table border="0" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td colspan="4">
                                                    detalles
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <asp:Table ID="tblAccesorios" runat="server" BorderWidth="1" CellPadding="0" CellSpacing="0"
                                                        BorderColor="#CCCCCC">
                                                        <asp:TableRow ID="tblrowAccesorio0" runat="server">
                                                            <asp:TableCell SkinID="skCeldaEliminar">
                                                                <asp:ImageButton ID="ImgEliminarAcc" Visible="false" SkinID="ImgEliminar" runat="server"
                                                                    OnClick="imgEliminar_Click" /></asp:TableCell>
                                                            <asp:TableCell SkinID="skCeldaDesc">descripción</asp:TableCell>
                                                            <asp:TableCell SkinID="skCeldaObs">observación</asp:TableCell>
                                                        </asp:TableRow>
                                                    </asp:Table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 70px">
                                                    &nbsp;
                                                </td>
                                                <td class="CeldaDescIng">
                                                    <asp:DropDownList ID="drpAccesorios" AutoPostBack="True" runat="server">
                                                    </asp:DropDownList>
                                                </td>
                                                <td class="CeldaObsIng">
                                                    <asp:TextBox ID="txtObservacionAccesorios" runat="server" Width="205px"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:ImageButton ID="ImgAgregarAcc" SkinID="ImgAgregar" runat="server" OnClick="ImgAgregarAcc_Click" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" style="height: 10px">
                                                    &nbsp; &nbsp; &nbsp; &nbsp;
                                                </td>
                                            </tr>
                                        </table>
                                    </fieldset>
                                </div>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </div>
            <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                <ProgressTemplate>
                    <div class="overlay">
                    </div>
                    <div class="bottomimg">
                        Por favor, Espere mientras registramos los datos ingresados.
                    </div>
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
                            <asp:ImageButton ID="ImgGuardar" runat="server" SkinID="ImgGuardar" OnClientClick="javascript:if (!confirm('Certifico que los datos registrados en la presente inspeccion son veridicos, haciendome responsable por la informacion registrada')) return false;"
                                OnClick="ImgGuardar_Click" />
                        </td>
                        <td>
                            <asp:ImageButton ID="ImgCancelar" SkinID="ImgCancelar" runat="server" OnClientClick="javaScript:window.close(); return false;" 
                             OnClick="ImgCancelar_Click" />
                        </td>
                    </tr>
                </table>
            </div>
            <asp:UpdateProgress ID="UpdateProgress2" runat="server" AssociatedUpdatePanelID="UpdatePanel3">
                <ProgressTemplate>
                    <div class="overlay">
                    </div>
                    <div class="bottomimg">
                        Por favor, Espere mientras registramos la inspeccion
                    </div>
                </ProgressTemplate>
            </asp:UpdateProgress>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
