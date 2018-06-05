<%@ page contentType="text/html;charset=ISO-8859-1" language="java" %>
<%@ taglib uri="/WEB-INF/struts-bean-el.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html-el.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic-el.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c" %>

<head>
    <jsp:include page="_headHTML.jsp" />
</head>

<body >

<jsp:include page="_head.jsp" />

<jsp:include page="_messages.jsp" />

<table border="0" bgcolor="#a0a0a0" cellpadding=1 cellspacing=0 width=100%>
    <tr>
      <td>
          <table border="0" bgcolor="#f9f9f9" cellpadding=2 cellspacing=2 width=100%>
          <tr>
            <html:form action="/EditUserSettings">
                <td>
                    <bean:message key="page.email"/>: <html:text property="email" />
                    &nbsp;&nbsp;&nbsp;
                    <bean:message key="prompt.password"/>: <html:password property="password"/><sup>1</sup>
                    &nbsp;&nbsp;&nbsp;
                    <bean:message key="page.repeat_password"/>: <html:password property="password2"/>
                </td>
                <td><html:submit/></td>
            </html:form>
        </tr>
          <tr>
               <td colspan="2" align="left" valign="top" >
                    <hr noshade size="1">
                    <sup>1</sup> <bean:message key="page.tip_2"/>
                </td>
          </tr>
        </table>
    </td>
    </tr>
</table>

<jsp:include page="_foot.jsp" />
