<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="EleccionCotizador.aspx.cs" Inherits="EleccionCotizador" Title="Cotizador de Vehiculos" %>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="head">

    <title>Conversor Vehículos</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=9" />
    <link rel="stylesheet" type="text/css" href="/App_Themes/MenuInicial/css/reset.css" />
    <link rel="stylesheet" type="text/css" href="/App_Themes/MenuInicial/css/estilos.css"/>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanelCuenta" runat="server">
        <ContentTemplate>
            <div id="cuerpo_popup">
                <div id="pregunta">
                    <div class="titulo">
                        Cotizador Vehículos Livianos</div>
                    <div class="encabezado">
                    </div>
                    <div class="bloque">
                        <h2>
                            ¿Cuál sera el uso del o los vehículos cotizados?</h2>
                        <div class="botones clearfix">
                            <%--<input type="button" value="Uso Particular" class="izquierda" onclick="location='EleccionAntiguedad.aspx'">--%>
                            <asp:Button ID="btnUsoParticular" Text="Uso Particular" CssClass="izquierda" 
                                runat="server" onclick="btnUsoParticular_Click" />
                            <asp:Button ID="btnUsoComercial" Text="Uso Comercial" CssClass="izquierda" 
                                runat="server" onclick="btnUsoComercial_Click" />
                        </div>
                    </div>
                </div>
            </div>
        
        
        
        
            <%--<table width="100%" style="height:200px">
                <tr>
                    <td colspan="2" align="center">
                    <h2>¿Cual sera el uso del o los vehículos cotizados?</h1>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <asp:ImageButton ID="imgVehPart" runat="server" SkinID="ImgVehPart" 
                            onclick="imgVehPart_Click"  /></td>
                    <td align="center">
                        <asp:ImageButton ID="imgVehCom" runat="server" SkinID="ImgVehCom" 
                            onclick="imgVehCom_Click"  /></td>
                </tr>
            </table>--%>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>