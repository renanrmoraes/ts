<%@ page contentType="text/html;charset=ISO-8859-1" language="java" %>
<%@ taglib uri="/WEB-INF/struts-bean-el.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html-el.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic-el.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c" %>

<script type='text/javascript' src='/timesheet/dwr/interface/Timesheet.js'></script>
<script type='text/javascript' src='/timesheet/dwr/engine.js'></script>
<script type='text/javascript' src='/timesheet/dwr/util.js'></script>
<script language="JavaScript" src="<html:rewrite page="/js/timesheet.js"/>"></script> 

<script type="text/javascript">

	function consultaProjeto(){
		DWRUtil.setValue("oportunidade",""); 
		var codigoProjeto = document.forms[0].projectId.value;
		Timesheet.consultaProjeto(codigoProjeto, oportunidadeHandle);
	}

	function oportunidadeHandle(project) {
		DWRUtil.setValue("oportunidade",project.oportunidade);
		DWRUtil.setValue("verticalId",project.vertical);
	} 

	function executarSalvar(){

		if (document.forms[0].typeId.value == '0'){
				alert('Atuação não informada.');
				document.forms[0].typeId.focus();
				return false;
			
		}
		
		if (document.forms[0].typeId.value == '4'){

			if (document.forms[0].regraId.value == '0'){
				alert('Deslocamento não informado.');
				document.forms[0].regraId.focus();
				return false;
			}
		}

		if (document.forms[0].regraId.value == '17'){
			selecionaTipoDeslocamento("0");
			document.forms[0].regraTipoDeslocamentoId.disabled = true;
			
		}
		
		if (document.forms[0].clienteId.value == '0'){
			alert('Cliente não informado.');
			document.forms[0].clienteId.focus();
			return false;
		}

		if (document.forms[0].projectId.value == '0'){
			alert('Projeto não informado.');
			document.forms[0].projectId.focus();
			return false;
		}
		
		document.forms[0].successForward.disabled=true;
		document.forms[0].operacao.value = " Salvar ";
		
		salvar(document.forms[0]);
	}

	function executarSalvarNovo(){

		document.forms[0].successForward.disabled=true;
		document.forms[0].successForward.value = " Salvar e Novo... ";
		document.forms[0].operacao.value = " Salvar e Novo... ";

		salvar(document.forms[0]);
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

<html>
<head>
   <jsp:include page="_headHTML.jsp"/>
   <script language="JavaScript" src="<html:rewrite page="/js/popcalendar.js"/>"></script>
   <script language="JavaScript" src="<html:rewrite page="/js/timesheet.js"/>"></script>    
   <script language="JavaScript" src="<html:rewrite page="/timesheet/dwr/interface/Timesheet.js"/>"></script>
   <script language="JavaScript" src="<html:rewrite page="/timesheet/dwr/engine.js"/>"></script>
   <script language="JavaScript" src="<html:rewrite page="/timesheet/dwr/util.js"/>"></script>

</head>

<body>
<jsp:include page="_head.jsp"/>

<%-- shows error messages --%>
<jsp:include page="_messages.jsp"/>


<table border="0" bgcolor="#a0a0a0" cellpadding=1 cellspacing=0 width=100%>
   <tr>
      <td>
         <table border="0" bgcolor="#f9f9f9" cellpadding=2 cellspacing=2 width=100%>
            <html:form action="/EditTimestamp.do" method="post">
            
             		<input type="hidden" name="operacao" value=" Salvar " > 
             		  <input type="hidden" name="loginAdminId" value="<c:out value="${user.userLogin.id}"/>"> 
             		  <input type="hidden" name="loginUserViewId" value="<c:out value="${user.id}"/>"> 
             		  <input type="hidden" name="loginUserNameViewId" value="<c:out value="${user.login}"/>">
             		  
            
               <tr bgcolor="#ffffff">
                  <td align="right" colspan="1" valign="top">
                     <bean:message key="page.start"/>:
                  </td>
                  <td align="left" colspan="3" valign="bottom">
                     <html:text style="width:80px"
                                onchange="if ( editTimeStampForm.dateEnd.value != '') { editTimeStampForm.dateEnd.value = editTimeStampForm.dateBegin.value }"
                                property="dateBegin" name="editTimeStampForm"/>
                                
                   
                     <html:img page="/images/bttn_calendar.gif"
                               onclick="popUpCalendar(this, editTimeStampForm.dateBegin, 'yyyy-MM-dd')"
                               style="font-size:11px"/>
                 

                     &nbsp;&nbsp;&nbsp;&nbsp;
                     <bean:message key="page.Time_Start"/>:          
                     <html:select property="hoursBegin" >
                     	<html:option value="0">0</html:option>
                     	<html:option value="1">1</html:option>
						<html:option value="2">2</html:option>
						<html:option value="3">3</html:option>
						<html:option value="4">4</html:option>
						<html:option value="5">5</html:option>
						<html:option value="6">6</html:option>
						<html:option value="7">7</html:option>
						<html:option value="8">8</html:option>
						<html:option value="9">9</html:option>
						<html:option value="10">10</html:option>
						<html:option value="11">11</html:option>
						<html:option value="12">12</html:option>
						<html:option value="13">13</html:option>
						<html:option value="14">14</html:option>
						<html:option value="15">15</html:option>
						<html:option value="16">16</html:option>
						<html:option value="17">17</html:option>
						<html:option value="18">18</html:option>
						<html:option value="19">19</html:option>
						<html:option value="20">20</html:option>
						<html:option value="21">21</html:option>
						<html:option value="22">22</html:option>
						<html:option value="23">23</html:option>
					</html:select>
					<b>:</b>
					<html:select property="minBegin" >
                     	<html:option value="0">0</html:option>
						<html:option value="10">10</html:option>
						<html:option value="20">20</html:option>
						<html:option value="30">30</html:option>
						<html:option value="40">40</html:option>
						<html:option value="50">50</html:option>
					</html:select>
					
					&nbsp;&nbsp;&nbsp;&nbsp;
					<bean:message key="page.Time_End"/>: 
					<html:select property="hoursEnd" >
						<html:option value="0">0</html:option>
                     	<html:option value="1">1</html:option>
						<html:option value="2">2</html:option>
						<html:option value="3">3</html:option>
						<html:option value="4">4</html:option>
						<html:option value="5">5</html:option>
						<html:option value="6">6</html:option>
						<html:option value="7">7</html:option>
						<html:option value="8">8</html:option>
						<html:option value="9">9</html:option>
						<html:option value="10">10</html:option>
						<html:option value="11">11</html:option>
						<html:option value="12">12</html:option>
						<html:option value="13">13</html:option>
						<html:option value="14">14</html:option>
						<html:option value="15">15</html:option>
						<html:option value="16">16</html:option>
						<html:option value="17">17</html:option>
						<html:option value="18">18</html:option>
						<html:option value="19">19</html:option>
						<html:option value="20">20</html:option>
						<html:option value="21">21</html:option>
						<html:option value="22">22</html:option>
						<html:option value="23">23</html:option>
						
					</html:select>
					<b>:</b>
					<html:select property="minEnd" >
                     	<html:option value="0">0</html:option>
						<html:option value="10">10</html:option>
						<html:option value="20">20</html:option>
						<html:option value="30">30</html:option>
						<html:option value="40">40</html:option>
						<html:option value="50">50</html:option>
					</html:select>
					 
                     &nbsp;&nbsp;&nbsp;&nbsp;
                     <bean:message key="page.type"/>:
                     <jsp:include page="_listType.jsp"/>
                     
                  </td>
               </tr>
               
               
				<tr bgcolor="#ffffff">
                  
                  <td align="right" colspan="1" valign="top">
                     <bean:message key="page.label.deslocamento"/>: 
                  </td>

                  <td align="left" colspan="3" valign="top">

                     <jsp:include page="_listRegra.jsp"/>
                     
                     &nbsp;&nbsp;&nbsp;&nbsp;
                     <bean:message key="page.label.tipo.deslocamento"/>                     
                     <jsp:include page="_listDeslocamento.jsp"/>
                     
                     <c:choose>
                           <c:when test="${managerParameterBean != null}">
	                       		<c:if test="${managerParameterBean.superuser}">
	                           		 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                     			<bean:message key="page.bonus"/>:
	                     			<html:text style="width:20px" maxlength="2" property="hoursBonus" />:
	            			        <html:text style="width:20px" maxlength="2" property="minBonus" />
	            			        <html:checkbox property="deduct"/><bean:message key="page.hora.negativa"/><br/>
            			        </c:if>
                           </c:when>
                     </c:choose>
                  </td>
               	</tr>

               
               <tr bgcolor="#ffffff">
                  
                  <td align="right" colspan="1" valign="top">
                     <bean:message key="page.client"/>: 
                  </td>
                  <td align="left" colspan="3" valign="top">
                     
					 <jsp:include page="_listCliente.jsp"/>
                     
                     &nbsp;&nbsp;&nbsp;&nbsp;
                     <bean:message key="page.project"/>:
                    	<html:select property="projectId" styleId="projectId" style="width:250px;" onchange="consultaProjeto();">
							<html:optionsCollection name="projectListBean" property="projects" value="id" label="name"/>						     			
						</html:select>																	    			
					
					&nbsp;&nbsp;&nbsp;&nbsp;
					 <bean:message key="page.opportunity"/>:
                     <html:text style="width:55px" property="oportunidade" value="${editTimeStampForm.oportunidade}"/>

                  </td>
               </tr>
               
               <tr bgcolor="#ffffff">
                  
                  <td align="right" colspan="1" valign="top">
                     <bean:message key="page.activity"/>: 
                  </td>
                  <td align="left" colspan="3" valign="top">

                     <jsp:include page="_listAtividade.jsp"/>
					 					
					 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;					 					
					 <bean:message key="page.vertical"/>:
					 <jsp:include page="_listVertical.jsp"/>
					
                  </td>
               </tr>
               
               
               <tr>
                  <td rowspan="2" align="right" valign="top"><bean:message key="page.description"/>:</td>
                  <td align="left" rowspan="2">
                     <textarea cols="80" rows="8" name="description" maxlength="1024" wrap="off"><c:out
                           value="${editTimeStampForm.description}"/></textarea>
                  </td>
                   
               </tr>
               <tr>
                  <td valign="top" align="left">
                     <html:hidden property="timeStampId" value="${editTimeStampForm.timeStampId}"/>
                     <html:hidden property="operation" value="${editTimeStampForm.operation}"/>
                     <html:hidden property="dateEnd" value=""/>
                     <html:hidden property="navegador" value=""/>

                     <c:if test="${editTimeStampForm.operation == 'modify'}">
                        <html:button property="successForward" value="Alterar" onclick="executarSalvar();"/>
                     </c:if>
                     <c:if test="${editTimeStampForm.operation == 'create'}">
                        <html:button property="successForward" value=" Salvar " onclick="executarSalvar();"/>
                        <html:button property="successForward" value=" Salvar e Novo... " onclick="executarSalvarNovo();" />
                     </c:if>
                     <html:submit property="_action"><bean:message key="button.cancel"/></html:submit>
                  </td>
               </tr>
               <tr>
                  <td colspan="4" align="left" valign="top">
                     <hr noshade size="1">
                     <sup>1</sup> <bean:message key="page.tip_1"/>
                     <br>
                     <sup>2</sup> <bean:message key="page.tip_3"/>
                  </td>
               </tr>
            </html:form>
         </table>

      </td>
   </tr>

</table>

<script type="text/javascript">

	desabilitaCamposPorTipo();
	
    
</script>

<jsp:include page="_foot.jsp"/>
