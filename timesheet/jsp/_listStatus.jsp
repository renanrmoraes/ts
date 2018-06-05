<%@ page contentType="text/html;charset=ISO-8859-1" language="java" %>
<%@ taglib uri="/WEB-INF/struts-bean-el.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html-el.tld" prefix="html" %>
<html:select size="1" property="statusId">
   <html:option value="">Selecione</html:option>
   <html:optionsCollection name="statusListBean" property="status" value="id" label="name"/>
</html:select>
