<%@ page contentType="text/html;charset=ISO-8859-1" language="java" %>
<%@ taglib uri="/WEB-INF/struts-bean-el.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html-el.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic-el.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c" %>

<html:html locale="true">
<head>
    <jsp:include page="_headHTML.jsp" />
</head>

<body >
<jsp:include page="_head.jsp" />


<html:javascript formName="logonForm"/>

<html:form action="/Logon" focus="username" onsubmit="return validateLogonForm(this);">
<table bgcolor="#eaeaea" align="center" width="60%" border="0" cellpadding=1 cellspacing=0>
    <tr><td>
        <table bgcolor="#fafafa" width="100%" border="0" cellpadding="2" cellspacing="2">
          <tr>
            <td align=center>
                <table border="0" width="100%">
                  <tr>
                    <td align="center">
                    <table>
                    <tr>
                    <th align="right">
                      <bean:message key="prompt.loginname"/>:
                    </th>
                    <td align="left">
                      <html:text property="username" size="16" maxlength="18"/>
                    </td>
                  </tr>
                  <tr>
                    <th align="right">
                      <bean:message key="prompt.password"/>:
                    </th>
                    <td align="left">
                      <html:password property="password" size="16" maxlength="18" redisplay="false"/>
                    </td>
                    </tr>
                    </table>
                    </td>
                  </tr>
                  <tr>
                    <td align="center">
                        &nbsp;
                        <br/>
                        <html:submit styleClass="Entrar" />
                    </td>
                  </tr>
                  <tr>
                    <td align="center" class="small" >
                    </td>
                  </tr>
                </table>
            </td>
          </tr>
        </table>
    </td></tr>
</table>

</html:form>


<%-- shows error messages --%>
<jsp:include page="_messages.jsp" />


</body>
</html:html>
