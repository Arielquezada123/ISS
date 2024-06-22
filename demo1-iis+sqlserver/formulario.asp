<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>

<!--#include file="registro.asp" -->


<%

Dim MM_editAction
MM_editAction = CStr(Request.ServerVariables("SCRIPT_NAME"))
If (Request.QueryString <> "") Then
  MM_editAction = MM_editAction & "?" & Server.HTMLEncode(Request.QueryString)
End If

' boolean to abort record edit
Dim MM_abortEdit
MM_abortEdit = false
%>
<%
If (CStr(Request("MM_insert")) = "formulario") Then
  If (Not MM_abortEdit) Then
    ' execute the insert
    Dim MM_editCmd

    Set MM_editCmd = Server.CreateObject ("ADODB.Command")
    MM_editCmd.ActiveConnection = MM_registro_STRING
    MM_editCmd.CommandText = "INSERT INTO usuarios (usu_rut, usu_nombre, usu_apellido) VALUES (?, ?, ?)" 
    MM_editCmd.Prepared = true
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param1", 202, 1, 12, Request.Form("rut")) ' adVarWChar
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param2", 202, 1, 20, Request.Form("nombre")) ' adVarWChar
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param3", 202, 1, 20, Request.Form("apellido")) ' adVarWChar
    MM_editCmd.Execute
    MM_editCmd.ActiveConnection.Close

    ' append the query string to the redirect URL
    Dim MM_editRedirectUrl
    MM_editRedirectUrl = "recibe.asp"
    If (Request.QueryString <> "") Then
      If (InStr(1, MM_editRedirectUrl, "?", vbTextCompare) = 0) Then
        MM_editRedirectUrl = MM_editRedirectUrl & "?" & Request.QueryString
      Else
        MM_editRedirectUrl = MM_editRedirectUrl & "&" & Request.QueryString
      End If
    End If
    Response.Redirect(MM_editRedirectUrl)
  End If
End If
%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
</head>

<body>
<form ACTION="<%=MM_editAction%>" METHOD="POST" id="formulario" name="formulario">
  <table width="315" height="112" border="1" align="center">
    <tr>
      <td width="114">escriba su rut</td>
      <td width="144"><input type="text" name="rut" id="rut"   title="ingresar su rut" placeholder="11.111.111-1" minlength="11" maxlength="12" required="true"/></td>
    </tr>
    <tr>
      <td>escriba su nombre</td>
      <td><input type="text" name="nombre" id="nombre" title="ingresar su nombre" placeholder="solo letras"minlength="5" maxlength="20"required="true"/></td>
    </tr>
    <tr>
      <td>escriba su apellido</td>
      <td><input type="text" name="apellido" id="apellido" title="ingresar su apellido" placeholder="solo letras"minlength="5" maxlength="20" required="true"/></td>
    </tr>
    <tr>
      <td><input type="submit" name="grabar" id="grabar" value="grabar" title="desea grabar? "/></td>
      <td><input type="reset" name="borrar" id="borrar" value="borrar" title="desea borrar?" /></td>
    </tr>
  </table>
  <input type="hidden" name="MM_insert" value="formulario" />
</form>
</body>
</html>
