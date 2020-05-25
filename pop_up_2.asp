<%@  language="JAVASCRIPT" %>
<%

var rut = Request.QueryString("R").Item;

%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>MAPFRE</title>
<style>
body{
	margin:0;
	padding:0;
	}
.clearfloat{
	clear:both;
	height:0;
	font-size: 1px;
	line-height: 0px;
}
.popup{
	width:800px;
	height:600px;
	margin-left:auto;
	margin-right:auto;
	background:url(img/img_descuento.jpg) no-repeat;
	font-family:Tahoma, Geneva, sans-serif;
	font-size:11px;
	color:#666666;
	}
</style>
</head>
<body>
<a href="http://mel.mapfre.cl/apps/AP_MAPFRE/Cotizacion/Modalidades.aspx?MOD=164&R=<%=rut%>">
<div class="popup">
</div> </a>
</body>
</html>
