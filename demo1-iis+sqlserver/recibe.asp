<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>

<!--#include file="registro.asp" -->


<%
Dim mostrar
Dim mostrar_cmd
Dim mostrar_numRows

Set mostrar_cmd = Server.CreateObject ("ADODB.Command")
mostrar_cmd.ActiveConnection = MM_registro_STRING
mostrar_cmd.CommandText = "SELECT usu_rut , usu_nombre , usu_apellido FROM usuarios ORDER BY usu_rut ASC;" 
mostrar_cmd.Prepared = true

Set mostrar = mostrar_cmd.Execute
mostrar_numRows = 0
%>
<%
Dim Repeat1__numRows
Dim Repeat1__index

Repeat1__numRows = -1
Repeat1__index = 0
mostrar_numRows = mostrar_numRows + Repeat1__numRows
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
</head>

<body>
<table width="200" border="0" align="center">
  <tr>
    <td>sus datos han sido grabados</td>
  </tr>
</table>

<% 
While ((Repeat1__numRows <> 0) AND (NOT mostrar.EOF)) 
%>
  <table width="464" border="1" align="center">
    <tr>
      <td width="109"><%=(mostrar.Fields.Item("usu_rut").Value)%></td>
      <td width="139"><%=(mostrar.Fields.Item("usu_nombre").Value)%></td>
      <td width="194"><%=(mostrar.Fields.Item("usu_apellido").Value)%></td>
    </tr>
  </table>
  <% 
  Repeat1__index=Repeat1__index+1
  Repeat1__numRows=Repeat1__numRows-1
  mostrar.MoveNext()
Wend
%>
<p><a href="index.asp">volver!!</a></p>
</body>
</html>
<%
mostrar.Close()
Set mostrar = Nothing
%>

