<%@ page contentType="text/html;charset=ISO-8859-1" language="java" %>
<%@ taglib uri="/WEB-INF/struts-bean-el.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html-el.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic-el.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c" %>
<p>

<div align="center">
<table bgcolor="#eaeaea" width="100%" border="0" cellpadding=1 cellspacing=0>
    <tr><td>
        <table bgcolor="#fafafa" width="100%" border="0" cellpadding="2" cellspacing="2">
          <tr>
            <td align=right>
                <jsp:include page="_copyright.jsp"/>
            </td>
          </tr>
        </table>
    </td></tr>
</table>
<br/>
<logic:present name="parameterBean" property="fortune">
    <c:out value="${parameterBean.fortune}"/>
</logic:present>
</div>
</body>
</html>
