<%@ page contentType="text/html;charset=ISO-8859-1" language="java" %>
<%@ taglib uri="/WEB-INF/struts-bean-el.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html-el.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic-el.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c" %>

<%-- JSP for include to display the messages by the actions --%>

<%-- error messages --%>
<logic:messagesPresent>
<table bgcolor="#eaeaea" width="100%" border="0" cellpadding=1 cellspacing=0>
    <tr><td>
        <table bgcolor="#fafafa" width="100%" border="0" cellpadding="2" cellspacing="2">
          <tr>
            <td align="left">
                <bean:message key="error.header" /><br/>
                <html:messages id="error">
                    <font class="red"><c:out value="${error}"/></font><br />
                </html:messages>
            </td>
          </tr>
        </table>
    </td></tr>
</table>
<p/>
</logic:messagesPresent>

<%-- standard messages --%>
<logic:messagesPresent message="true">
<table bgcolor="#eaeaea" width="100%" border="0" cellpadding=1 cellspacing=0>
    <tr><td>
        <table bgcolor="#fafafa" width="100%" border="0" cellpadding="2" cellspacing="2">
          <tr>
            <td align="left">
                <ul compact>
                <html:messages id="message" message="true">
                    <li><c:out value="${message}"/></li>
                </html:messages>
                </ul>
            </td>
          </tr>
        </table>
    </td></tr>
</table>
<p/>
</logic:messagesPresent>
