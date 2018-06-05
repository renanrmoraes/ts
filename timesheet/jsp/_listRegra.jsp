<%@ page contentType="text/html;charset=ISO-8859-1" language="java" %>
<%@ taglib uri="/WEB-INF/struts-bean-el.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html-el.tld" prefix="html" %>

<%@ page import="com.itth.ttraq.Constantes"%>

<script language="JavaScript" src="<html:rewrite page="/js/timesheet.js"/>"></script>

<script type="text/javascript">

	var REGRA_DESLOCAMENTO_ATE_100KM_DE_SAO_PAULO = "<%=String.valueOf(Constantes.REGRA_DESLOCAMENTO_ATE_100KM_DE_SAO_PAULO)%>"; 
	var REGRA_DESLOCAMENTO_ATE_200KM_DE_SAO_PAULO = "<%=String.valueOf(Constantes.REGRA_DESLOCAMENTO_ATE_200KM_DE_SAO_PAULO)%>"; 
	var REGRA_DESLOCAMENTO_RIO_CURITIBA = "<%=String.valueOf(Constantes.REGRA_DESLOCAMENTO_RIO_CURITIBA)%>";
	var REGRA_DESLOCAMENTO_BELO_HORIZONTE_FLORIANOPOLIS = "<%=String.valueOf(Constantes.REGRA_DESLOCAMENTO_BELO_HORIZONTE_FLORIANOPOLIS)%>";
	var REGRA_DESLOCAMENTO_DISTRITO_FEDERAL_PORTO_ALEGRE = "<%=String.valueOf(Constantes.REGRA_DESLOCAMENTO_DISTRITO_FEDERAL_PORTO_ALEGRE)%>";
	var TIPO_DESLOCAMENTO_RESIDENCIA_RESIDENCIA = "<%=String.valueOf(Constantes.TIPO_DESLOCAMENTO_RESIDENCIA_RESIDENCIA)%>";
	
	function desabilitaTipoDeslocamento(){
		var Formulario = document.forms[0];
		var codigoTipo = document.forms[0].regraId.value;

		if(codigoTipo == REGRA_DESLOCAMENTO_ATE_200KM_DE_SAO_PAULO || 
				codigoTipo == REGRA_DESLOCAMENTO_RIO_CURITIBA ||
				codigoTipo == REGRA_DESLOCAMENTO_BELO_HORIZONTE_FLORIANOPOLIS || 
				codigoTipo == REGRA_DESLOCAMENTO_DISTRITO_FEDERAL_PORTO_ALEGRE ||
				codigoTipo == REGRA_DESLOCAMENTO_ATE_100KM_DE_SAO_PAULO
				){
			
			selecionaTipoDeslocamento(TIPO_DESLOCAMENTO_RESIDENCIA_RESIDENCIA);
			Formulario.regraTipoDeslocamentoId.disabled = true;
		}else{ 
			Formulario.regraTipoDeslocamentoId.disabled = false;
		}

	}
	
	function selecionaTipoDeslocamento(codigo){
		var Formulario = document.forms[0];  
		var combo = Formulario.regraTipoDeslocamentoId; 
		for(x=0; x < combo.length; x++){  
			if(combo[x].value == codigo){  
		    	combo[x].selected = true;  
		    }  
		}  
	}

</script>


<html:select size="1" property="regraId" onchange="desabilitaTipoDeslocamento();">
   <html:option value="0">Selecione</html:option>
   <html:optionsCollection name="regraListBean" property="regras" value="id" label="descricao"/>
</html:select>
