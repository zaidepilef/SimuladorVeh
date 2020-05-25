<%@  language="JAVASCRIPT" %>
<%
/**/
//var MM_Cuenta = Request.QueryString("R").Item;
/*
var MM_UserAuthorization = Session( "MM_UserAuthorization" );
var MM_Agente = Session( "MM_Agente" );
var MM_CuentaMaestra = Session( "MM_CuentaMaestra");
var MM_TipoMaestro = Session( "MM_TipoMaestro");
var MM_GUID = Session( "MM_GUID");  
*/
var CONV = Request.QueryString("CONV").Item;


//var MM_Cuenta = "774724206";
var MM_Cuenta = "88058496";

//var MM_Cuenta = "88058496";
var MM_UserAuthorization = "19";
var MM_Agente = "4100";
var MM_CuentaMaestra = "19";
var MM_TipoMaestro = "1";
var MM_GUID = "18111";  

//var CONV = "RIPLEY";
var CONV = "KPMG";
	 
		
%>
<html>
<head>
    <title>MAPFRE Seguros</title>

    <script language="javascript">

function subm()
{
    MM_Cuenta = "<%=MM_Cuenta%>";
    MM_UserAuthorization = "<%=MM_UserAuthorization%>";
    MM_Agente = "<%=MM_Agente%>";
    MM_CuentaMaestra = "<%=MM_CuentaMaestra%>";
    MM_TipoMaestro = "<%=MM_TipoMaestro%>";
    MM_GUID = "<%=MM_GUID%>";
    CONV = "<%=CONV%>";

    document.frmEnvia.MM_Cuenta.value = MM_Cuenta;
    document.frmEnvia.MM_UserAuthorization.value = MM_UserAuthorization;
    document.frmEnvia.MM_Agente.value = MM_Agente;
    document.frmEnvia.MM_CuentaMaestra.value = MM_CuentaMaestra;
    document.frmEnvia.MM_TipoMaestro.value = MM_TipoMaestro;
    document.frmEnvia.MM_GUID.value = MM_GUID;
    document.frmEnvia.CONV.value = CONV;
    
    document.frmEnvia.method = 'post';
    document.frmEnvia.action = 'load.aspx'
    document.frmEnvia.submit();
}

    </script>

</head>
<body onload="subm();">
    <form name="frmEnvia">
    <input type="hidden" name="MM_Cuenta" />
    <input type="hidden" name="MM_UserAuthorization" />
    <input type="hidden" name="MM_Agente" />
    <input type="hidden" name="MM_CuentaMaestra" />
    <input type="hidden" name="MM_TipoMaestro" />
    <input type="hidden" name="MM_GUID" />    
    <input type="hidden" name="CONV" /> 
    </form>
</body>
</html>
