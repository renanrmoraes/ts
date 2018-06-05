<%@ page contentType="text/html;charset=ISO-8859-1" language="java" %>
<%@ taglib uri="/WEB-INF/struts-bean-el.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html-el.tld" prefix="html" %>

<html:select size="1" property="regraTipoDeslocamentoId" >
   <html:option value="0">Selecione</html:option>
   <html:optionsCollection name="regraTipoDeslocamentoListBean" property="regras" value="id" label="descricao"/>
</html:select>
