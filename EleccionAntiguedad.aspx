<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="EleccionAntiguedad.aspx.cs" Inherits="EleccionAntiguedad" Title="Untitled Page" %>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="head">
<title>Simulador Vehículos</title>
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
                        Simulador Vehículos Livianos</div>
                    <div class="encabezado">
                    </div>
                    <div class="bloque">
                        <h2>
                            ¿Qué tipo de plan desea simular?</h2>
                        <div class="botones clearfix">
                            <div class="columna">
                                <input type="button" value="Productos Tradicionales" onclick="location='cotizador.aspx'">
                                <div class="lista">
                                    <ul>
                                        <li>Flex</li>
                                        <li>Master</li>
                                        <li>Balance</li>
                                        <li>Elemental</li>
                                    </ul>
                                </div>
                            </div>
                            <div class="columna">
                                <input type="button" value="Otros Planes" onclick="location='autoantiguo.aspx'">
                                <div class="lista">
                                    <ul>
                                        <li>Auto Senior</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%--            <table width="100%" style="height: 200px">
                <tr>
                    <td colspan="2" align="center">
                        <h2>
                        ¿Que tipo de Plan desea cotizar?</h1>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <asp:ImageButton ID="imgPlanTradicional" runat="server" 
                            SkinID="ImgPlanesTradicionales" onclick="imgPlanTradicional_Click" />
                    </td>
                    <td align="center">
                        <asp:ImageButton ID="imgAutosAntiguos" runat="server" SkinID="ImgAutosAntiguos" 
                            onclick="imgAutosAntiguos_Click" />
                    </td>
                </tr>
            </table>--%>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

