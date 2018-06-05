<%@ page contentType="text/html;charset=ISO-8859-1" language="java" %>
<%@ taglib uri="/WEB-INF/struts-bean-el.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html-el.tld" prefix="html" %>

<%@ page import="com.itth.ttraq.Constantes"%>

<script language="JavaScript" src="<html:rewrite page="/js/timesheet.js"/>"></script>   
<script language="JavaScript" src="<html:rewrite page="/ttraq/dwr/interface/Timesheet.js"/>"></script>
<script language="JavaScript" src="<html:rewrite page="/ttraq/dwr/engine.js"/>"></script>
<script language="JavaScript" src="<html:rewrite page="/ttraq/dwr/util.js"/>"></script>

<script type="text/javascript">

	var TIPO_SITE_F9C = "<%=String.valueOf(Constantes.TIPO_SITE_F9C)%>"; 
	var TIPO_DESCANCO_REMUNERADO ="<%=String.valueOf(Constantes.TIPO_DESCANCO_REMUNERADO)%>";
	var TIPO_EM_CASA ="<%=String.valueOf(Constantes.TIPO_EM_CASA)%>";
	var TIPO_INTERVALO_REFEICAO ="<%=String.valueOf(Constantes.TIPO_INTERVALO_REFEICAO)%>";
	var TIPO_PLANTAO ="<%=String.valueOf(Constantes.TIPO_PLANTAO)%>";
	var TIPO_PONTE_DE_FERIADO ="<%=String.valueOf(Constantes.TIPO_PONTE_DE_FERIADO)%>";
	var TIPO_SITE_CLIENTE ="<%=String.valueOf(Constantes.TIPO_SITE_CLIENTE)%>";
	var TIPO_NO_FABRICANTE ="<%=String.valueOf(Constantes.TIPO_NO_FABRICANTE)%>";

	var CLIENTE_F9C ="<%=String.valueOf(Constantes.CLIENTE_F9C)%>";
	var PROJETO_F9C ="<%=String.valueOf(Constantes.PROJETO_F9C)%>";

	var REGRA_SEM_DESLOCAMENTO ="<%=String.valueOf(Constantes.REGRA_SEM_DESLOCAMENTO)%>";
	
	function desabilitaCamposPorTipo(){
		var Formulario = document.forms[0];
		var codigoTipo = document.forms[0].typeId.value;

		if(codigoTipo == TIPO_SITE_F9C || codigoTipo == TIPO_DESCANCO_REMUNERADO ||
				codigoTipo == TIPO_EM_CASA || codigoTipo == TIPO_PLANTAO || 
				codigoTipo == TIPO_PONTE_DE_FERIADO
				){
			selecionaRegra(REGRA_SEM_DESLOCAMENTO);
			selecionaTipoRegra("0");
			habilitaCampos(document.forms[0]);
			Formulario.regraId.disabled = true;
			Formulario.regraTipoDeslocamentoId.disabled = true;

			if(codigoTipo == TIPO_PLANTAO){
				
				document.forms[0].hoursBegin[0].selected = true;
				document.forms[0].minBegin[0].selected = true;
				document.forms[0].hoursEnd[20].selected = true;
				document.forms[0].minEnd[0].selected = true;
				 
				document.forms[0].hoursBegin.disabled = true;
				document.forms[0].minBegin.disabled = true;
				document.forms[0].hoursEnd.disabled = true;
				document.forms[0].minEnd.disabled = true; 
						
			}

			if(codigoTipo == TIPO_DESCANCO_REMUNERADO){
				
				document.forms[0].hoursBegin[08].selected = true;
				document.forms[0].minBegin[00].selected = true;
				document.forms[0].hoursEnd[16].selected = true;
				document.forms[0].minEnd[00].selected = true;
				 
				document.forms[0].hoursBegin.disabled = true;
				document.forms[0].minBegin.disabled = true;
				document.forms[0].hoursEnd.disabled = true;
				document.forms[0].minEnd.disabled = true; 
						
			}

		}else if (codigoTipo == TIPO_SITE_CLIENTE || codigoTipo == TIPO_NO_FABRICANTE){
			Formulario.regraId.disabled = false;
			Formulario.regraTipoDeslocamentoId.disabled = false;
		}

	}

	function desabilitaIntervaloRefeicao(){

		var Formulario = document.forms[0];
		var codigoTipo = document.forms[0].typeId.value;

		if(codigoTipo == TIPO_INTERVALO_REFEICAO){
			selecionaRegra(REGRA_SEM_DESLOCAMENTO);
			selecionaCliente(CLIENTE_F9C);
			selecionaProjeto(PROJETO_F9C);
			Formulario.oportunidade.value = "";
			Formulario.description.value = "";						
			desabilitaCampos(document.forms[0]);			
		}
		
	}

	function desabilitaCampos(form){
		
		Formulario = form;
		Formulario.regraId.disabled=true;
		Formulario.regraTipoDeslocamentoId.disabled=true
		Formulario.clienteId.disabled=true;
		Formulario.projectId.disabled=true;
		Formulario.oportunidade.disabled=true;
		Formulario.verticalId.disabled=true;
		Formulario.description.disabled=true;
		Formulario.atividadeId.disabled=true;
		
		
	}

	function habilitaCampos(form){
		
		Formulario = form;
		Formulario.regraId.disabled=false;
		Formulario.regraTipoDeslocamentoId.disabled=false;
		Formulario.clienteId.disabled=false;
		Formulario.projectId.disabled=false;
		Formulario.oportunidade.disabled=false;
		Formulario.verticalId.disabled=false;
		Formulario.description.disabled=false;
		Formulario.atividadeId.disabled=false;

		Formulario.hoursBegin.disabled = false;
		Formulario.minBegin.disabled = false;
		Formulario.hoursEnd.disabled = false;
		Formulario.minEnd.disabled = false;
		
	}

	function selecionaRegra(codigo){
		var Formulario = document.forms[0];  
		var combo = Formulario.regraId; 
		for(x=0; x < combo.length; x++){  
			if(combo[x].value == codigo){  
		    	combo[x].selected = true;  
		    }  
		}  
	}

	function selecionaTipoRegra(codigo){
		var Formulario = document.forms[0];  
		var combo = Formulario.regraTipoDeslocamentoId; 
		for(x=0; x < combo.length; x++){  
			if(combo[x].value == codigo){  
		    	combo[x].selected = true;  
		    }  
		}  
	}

	function selecionaCliente(codigo){
		var Formulario = document.forms[0];  
		var combo = Formulario.clienteId; 
		for(x=0; x < combo.length; x++){  
			if(combo[x].value == codigo){  
		    	combo[x].selected = true;  
		    }  
		}  
	}

	function selecionaProjeto(codigo){
		var Formulario = document.forms[0];  
		var combo = Formulario.projectId; 
		for(x=0; x < combo.length; x++){  
			if(combo[x].value == codigo){  
		    	combo[x].selected = true;  
		    }  
		}  
	}
	
		

</script>

<html:select size="1" property="typeId" onchange="desabilitaIntervaloRefeicao();desabilitaCamposPorTipo();">
   <html:option value="0">Selecione</html:option>
   <html:optionsCollection name="typeListBean" property="types" value="id" label="name"/>
</html:select>
