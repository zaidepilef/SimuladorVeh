<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
     CodeFile="FinSimulacion.aspx.cs" Inherits="FinSimulacion" Title="Emisión de Vehículos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">


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
                        <td><h1 style="font-weight:bold">
                            Propuesta Número: 
                            <asp:Label ID="lblNumPresupuesto" runat="server" Text=""></asp:Label>
                            </h2>
                        </td>
                       </tr>
                       <tr>
                        <td>
                            Estoy en conocimiento que la presente Propuesta no implica Cobertura. Esta empezará una vez aprobada la inspección del riesgo por parte de MAPFRE.
                             <br />
                            Esta propuesta tendrá un plazo máximo de validez de 15 días. Una vez transcurrido este tiempo, se deberá proceder a emitir una nueva.
                            <br /><br />
                        </td>
                       </tr>
                    </table>
                </fieldset>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
