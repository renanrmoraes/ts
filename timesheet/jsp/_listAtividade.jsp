<%@ page contentType="text/html;charset=ISO-8859-1" language="java" %>
<%@ taglib uri="/WEB-INF/struts-bean-el.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html-el.tld" prefix="html" %>
<html:select size="1" property="atividadeId">
   <html:option value="0">Selecione</html:option>
   <html:optionsCollection name="atividadeListBean" property="atividades" value="id" label="descricao"/>
</html:select>
