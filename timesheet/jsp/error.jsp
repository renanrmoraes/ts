<%@ page contentType="text/html;charset=ISO-8859-1" language="java" %>
<%@ taglib uri="/WEB-INF/struts-bean-el.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html-el.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic-el.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c" %>

<%
    int formcounter=0;
    String bgcolor="#ffffff";
%>

<html>
<head>
    <jsp:include page="_headHTML.jsp" />
</head>
<body >
<jsp:include page="_head.jsp" />

<table bgcolor="#eaeaea" width="100%" border="0" cellpadding=1 cellspacing=0>
    <tr><td>
        <table bgcolor="#fafafa" width="100%" border="0" cellpadding="2" cellspacing="2">
          <tr>
            <td align="left">
                <p>
                <html:link page="/Main.do" >&laquo; <bean:message key="page.back_to_main_view" /></html:link>
                </p>
                <b><bean:message key="error.internal" /></b>
                </p>
                <b><html:errors /></b>
            </td>
          </tr>
        </table>
    </td></tr>
</table>
<jsp:include page="_foot.jsp" />
