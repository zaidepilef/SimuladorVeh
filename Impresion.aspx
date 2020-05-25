<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Impresion.aspx.cs" Inherits="Impresion" Title="Impresión de la Póliza" %>
<asp:Content ID="Content1" runat="Server" ContentPlaceHolderID="head">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="ResultadoEmision">
                <table>
                    <tr>
                        <td class="titItem" colspan="2">
                                <asp:Label ID="lblDatosVeh" CssClass="TituloSecundario" runat="server" Text="impresión de la póliza"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 12%;">
                            número de póliza:
                        </td>
                        <td>
                            <strong><asp:Label ID="lblNumPoliza" runat="server"></asp:Label></strong>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            estado:
                        </td>
                        <td>
                            <strong><asp:Label ID="lblEstado" runat="server"></asp:Label></strong>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            fecha:
                        </td>
                        <td>
                            <asp:Label ID="lblFecha" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <table width="100%">
                                <tr>
                                    <td>
                                        <asp:ImageButton ID="ImgImprimirPoliza" runat="server" 
                                            OnClick="ImgImprimirPoliza_Click" SkinID="ImgImprimirPoliza" />
                                        <asp:ImageButton ID="ImgImprimirMandato" runat="server" 
                                            OnClick="ImgImprimirMandato_Click" SkinID="ImgImprimirMandato" />
                                        <asp:ImageButton ID="ImgNuevaCotizacion" runat="server" 
                                            onclick="ImgNuevaCotizacion_Click" SkinID="ImgNuevaCotizacion" />
                                        <asp:ImageButton ID="ImgImprimirSOAP" runat="server" 
                                            onclick="ImgImprimirSOAP_Click" SkinID="ImgImprimirSOAP" />    
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                <input type="hidden" id="hdnNumCotizacion" runat="server" />
            </div>
            <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                <ProgressTemplate>
                    <div class="overlay">
                    </div>
                    <div class="imprimirimg">
                        Por favor, Espere un momento mientras generamos su documento</div>
                </ProgressTemplate>
            </asp:UpdateProgress>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
