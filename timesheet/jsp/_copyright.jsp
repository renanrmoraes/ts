<%@ page contentType="text/html;charset=ISO-8859-1" language="java" %>
<%@ taglib uri="/WEB-INF/struts-html-el.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic-el.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean-el.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c" %>

<logic:present name="parameterBean" property="copyright">
    &laquo; <c:out escapeXml="false" value="${ parameterBean.copyright } :: ${ parameterBean.version } "></c:out> &raquo;
</logic:present>