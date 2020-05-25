<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SessionTerminada.aspx.cs" Inherits="_Default" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<p>
    	<table width="755" height="287" border="0" cellpadding="0" cellspacing="0">
					<tr>
				<td height="38" colspan="2"><span class="fuente2">Su Sesión ha sido cancelada por Inactividad. </span></td>
			</tr>
			<tr>
				<td height="185" colspan="2" class="fuente2">
					<p>Estimado Cliente,</p>
					<p>Por motivos de seguridad su sesión cuenta con un tiempo de inactividad de 10 
						minutos. Estos han terminado por lo que deberá <a href="http://mel.mapfre.cl/enlinea">
							reingresar al sistema</a>.</p>
					<p>Si considera que esta información es incorrecta le sugerimos contactarse con el <a href="mailto:webmaster@mapfre.cl">
							administrador del sistema</a> indicándole su cuenta de acceso y la de su 
						empresa - <b>no incluya su password</b>. A partir de esta información podremos 
						corregir la situación si corresponde.</p>
					<p align="left">Atentamente,</p>
					<p align="left"><b>Atención al Cliente</b>.</p>
				</td>
			</tr>
		</table>
		<p>&nbsp;</p>
		<p>&nbsp;</p>
        
        
    </p>
</asp:Content>

