<%@ page contentType="text/html;charset=ISO-8859-1" language="java" %>
<%@ taglib uri="/WEB-INF/struts-bean-el.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html-el.tld" prefix="html" %>

<script type='text/javascript' src='/timesheet/dwr/interface/Timesheet.js'></script>
<script type='text/javascript' src='/timesheet/dwr/engine.js'></script>
<script type='text/javascript' src='/timesheet/dwr/util.js'></script>

<script type="text/javascript">

function consultaListaProjetoPorClienteTest(){

	DWRUtil.removeAllOptions("projectId");
	DWRUtil.setValue("oportunidade","");
	
	var codigoCliente = document.forms[0].clienteId.value;
	
	Timesheet.consultaListaProjetoPorCliente(codigoCliente, obterTipoParceiroHandle);
}

function obterTipoParceiroHandle(projects) {

	DWRUtil.addOptions("projectId", {'0':'Selecione'});
	DWRUtil.addOptions("projectId", projects, "id", "name");
} 

</script>



<html:select size="1" property="clienteId" style="width:250px;" onchange="consultaListaProjetoPorClienteTest();">
   <html:option value="0" >Selecione</html:option>
   <html:optionsCollection name="clienteListBean" property="clientes" value="id" label="nome" />
</html:select>

