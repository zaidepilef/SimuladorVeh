<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="EleccionCotizador.aspx.cs" Inherits="EleccionCotizador" Title="Simulador de Vehiculos" %>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="head">

    <title>Simulador Vehículos</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=9" />
    <link rel="stylesheet" type="text/css" href="/App_Themes/MenuInicial/css/reset.css" />
    <link rel="stylesheet" type="text/css" href="/App_Themes/MenuInicial/css/estilos.css"/>
    <style>
    .tooltip {
        position: relative;
        display: inline-block;
        /*border-bottom: 1px dotted black;*/
        border:none;
    }

    .tooltip .tooltiptext {
        visibility: hidden;
        width: 100%;
        background-color: #555;
        color: #fff;
        text-align: center;
        border-radius: 6px;
        padding: 5px 0;
        position: absolute;
        z-index: 1;
        top: 125%;
        left: 30%;
        margin-left: -60px;
        opacity: 0;
        transition: opacity 1s;
        font-size: 15px;
        text-decoration: none!important;
        margin-right: 20px;
    }

    .tooltip .tooltiptext::after {
        /*content: "";*/
        position: absolute;
        bottom: 100%;
        left: 50%;
        margin-left: -5px;
        border-width: 5px;
        border-style: solid;
        border-color: #555 transparent transparent transparent;
    }

    .tooltip:hover .tooltiptext {
        visibility: visible;
        opacity: 1;
    }
    input.deshabilitado
    {
    	background: #777!important;
    }
    </style>
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
                            ¿Cuál sera el uso del vehículo simulado?</h2>
                        <div class="botones clearfix">
                            <%--<input type="button" value="Uso Particular" class="izquierda" onclick="location='EleccionAntiguedad.aspx'">--%>
                            <asp:Button ID="btnUsoParticular" Text="Uso Particular" CssClass="izquierda" 
                                runat="server" onclick="btnUsoParticular_Click" />
                            <div class="tooltip">
                                <asp:Button ID="btnUsoComercial" Text="Uso Comercial" CssClass="izquierda deshabilitado" 
                                runat="server" onclick="btnUsoComercial_Click" Enabled="False" />
                                <span class="tooltiptext">Vehículos Comerciales 
                              se encuentran deshabilitados por mantención hasta el Lunes 3 de Abril del 2017</span>
                            </div>
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