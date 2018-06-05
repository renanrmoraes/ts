<%@ page contentType="text/html;charset=ISO-8859-1" language="java" %>
<%@ taglib uri="/WEB-INF/struts-bean-el.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html-el.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic-el.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c" %>

<html>
<head>
<title><bean:message key="index.title"/></title>
<link rel="STYLESHEET" type="text/css" href="<html:rewrite page="/css/ttraq.css"/>">

<%
    int formcounter=0;
    String bgcolor="#ffffff";
%>

</head>
<body>
<table border="0" >
<tr>
    <tr><td colspan=6><b><u>F9C Global Security - Relatório de horas.</u></b></td></tr>
    <!-- 
    <tr><td align=left><b><bean:message key="page.Name"/>:</b></td><td colspan=5><c:out value="${exportBean.userName}"/></td></tr>
    <tr><td align=left><b><bean:message key="page.Project"/>:</b></td><td colspan=5><c:out value="${exportBean.projectName}"/></td></tr>
    
    <tr><td align=left><b><bean:message key="page.Period"/>:</b></td><td colspan=5><c:out value="${exportBean.beginDate} - ${exportBean.endDate}"/></td></tr>
    --> 
</tr>

<tr><td>&nbsp;</td></tr>


        <logic:iterate collection="${listaBeans}" id="exportBean">
        
        <tr><td>&nbsp;</td></tr>
        <tr>
        	<th align="left"><c:out value="c"/></th>
            <th><c:out value="Consultor"/></th>
            <th><c:out value="Normais"/></th>
            <th><c:out value="Deslocamentos"/></th>
            <th><c:out value="Adicionais"/></th>
            <th><c:out value="Ajuste Gestor"/></th>
            <th><c:out value="Sábado"/></th>
            <th><c:out value="Domingo"/></th>
            <th><c:out value="Total"/></th>
            <th><c:out value="Total Pgto"/></th>
        </tr>
        
	        <% if(formcounter/2.0 == formcounter++/2)
	           bgcolor = "#f1f1f1";
	            else
	           bgcolor = "#ffffff";
	        %>
        	<tr bgcolor="<%= bgcolor %>">
        	
        		<td width=10 valign="top" align="left" >r</td>
                
        		<td valign="top" align="center" >
                	<c:out value="${exportBean.userName}"/><br>
                </td>
    
             	<td valign="top" align="center" >
                	<c:out value="${exportBean.summary}" />
                </td>
                
         		<td valign="top" align="center" >
                	<c:out value="${exportBean.summaryViewDeslocamento}" />
                </td>
                
				<td valign="top" align="center" >
                	<c:out value="${exportBean.summaryViewAdicionais}" />
                </td>
                
                <td valign="top" align="center" >
                	<c:out value="${exportBean.summaryViewBonusGestor}" />
                </td>
   
                <td valign="top" align="center" >
                	<c:out value="${exportBean.summaryViewTotalSabado}" />
                </td>
   
                <td valign="top" align="center" >
                	<c:out value="${exportBean.summaryViewTotalDomingo}" />
                </td>
   
                <td valign="top" align="center" >
                	<c:out value="${exportBean.summaryViewTotalGeral}" />
                </td>
                
                <td valign="top" align="center" >
                	<c:out value="${exportBean.summaryViewTotalGeralPagamento}" />
                </td>
           
        	</tr>
        
        
         <tr><td>&nbsp;</td></tr>
        <tr>
        	<th align="left"><c:out value="c"/></th>
        	<th><c:out value="Consultor"/></th>
            <th><c:out value="Data"/></th>
            <th><c:out value="Hr Início"/></th>
            <th><c:out value="Hr Fim"/></th>
            <th><c:out value="Desloc"/></th>
            <th><c:out value="Hr Normal"/></th>
            <th><c:out value="Desloc"/></th>
            <th><c:out value="Adicio"/></th>
            <th><c:out value="Ajuste"/></th>
            <th><c:out value="Neg"/></th>
            <th><c:out value="Projeto"/></th>
            <th><c:out value="Cliente"/></th>
            <th><c:out value="Atividade"/></th>
            <th><c:out value="Oportunidade"/></th>
            <th><c:out value="Atuação"/></th>
            <th><c:out value="Deslocam"/></th>
            <th><c:out value="Tipo Deslocam"/></th>
            <th><c:out value="Descrição"/></th>
            <th><c:out value="Status"/></th>
        </tr>
        
        		<logic:iterate collection="${exportBean.timeStamps}" id="tsForm">

			        <% if(formcounter/2.0 == formcounter++/2)
			           bgcolor = "#f1f1f1";
			            else
			           bgcolor = "#ffffff";
			        %>
			        <tr bgcolor="<%= bgcolor %>">
			            
			            		<td width=10 valign="top" align="left" >d</td>
			                    
			                    <td valign="top" align="left" >
			                        <c:out value="${exportBean.userName}"/><br>
			                    </td>
			            
			                    <td valign="top" align="left" >
			                        <c:out value="${tsForm.formattedDateBegin}"/><br>
			                    </td>
			                    
			                    <td valign="top" align="center" >
			                        <c:out value="${tsForm.formattedBeginTime}" />
			                    </td>
			
			                    <td valign="top" align="center" >
			                        <c:out value="${tsForm.formattedEndTime}" />
			                    </td>
			
								<td valign="top" align="center" >
			                        <c:out value="${tsForm.deslocamentoIda}"/>
			                    </td>
			                    
			                    <td valign="top" align="center" >
			                        <c:out value="${tsForm.differenceAsString}"/>
			                    </td>
			                    
			                    <td valign="top" align="center" >
			                        <c:out value="${tsForm.deslocamentoVolta}"/>
			                    </td>
			                    
			                    <td valign="top" align="center" >
			                        <c:out value="${tsForm.totalAdicionaisDia}"/>
			                    </td>
			                    
			                    			                    
			                     <c:choose>
									<c:when test="${tsForm.deduct}">
										<td valign="top" align="center" bgcolor="#fabec4" >
			                        		<c:out value="${tsForm.totalBonusDia}"/>
			                    		</td>
									</c:when>
									<c:when test="${tsForm.totalBonusDia eq '00:00'}">
										<td valign="top" align="center"  >
			                        		<c:out value="${tsForm.totalBonusDia}"/>
			                    		</td>
									</c:when>
									<c:otherwise>
										<td valign="top" align="center" bgcolor="#a5bcfa" >
											<c:out value="${tsForm.totalBonusDia}"/>
										</td>
									</c:otherwise>
 							    </c:choose>
			                    
			                    <c:choose>
									<c:when test="${tsForm.deduct}">
										<td valign="top" align="center" >
			                        		Sim
			                    		</td>
									</c:when>
									<c:otherwise>
										<td valign="top" align="center" >
											Não
										</td>
									</c:otherwise>
 							    </c:choose>
			                    
			                    <td valign="top" align="center" >
			                        <c:out value="${tsForm.project.nameExport}" />
			                    </td>
			                    
			                    <td valign="top" align="center" >
			                    	&nbsp;&nbsp;<c:out value="${tsForm.cliente.nome}" />
			                    </td>
			    
			                    <td valign="top" align="center" >
			                        &nbsp;&nbsp;<c:out value="${tsForm.atividade.descricao}" />
			                    </td>
			                    
			                    <td valign="top" align="center" >
			                        <c:out value="${tsForm.oportunidade}" />
			                    </td>
			                    
			                    <td valign="top" align="center" >
			                        <c:out value="${tsForm.type.name}" />
			                    </td>
			                    
			                    <td valign="top" align="center" >
			                        <c:out value="${tsForm.regra.descricao}" />
			                    </td>
			                    
			                    <td valign="top" align="center" >
			                        <c:out value="${tsForm.regraTipoDeslocamento.descricao}" />
			                    </td>
			                    
			                    <td valign="top" align="center" >
			                        <c:out value="${tsForm.description}" />
			                    </td>
			                    
			                    <td valign="top" align="center" >
			                        <c:out value="${tsForm.status.name}" />
			                    </td>
			                    
			        </tr>
			    </logic:iterate>
        
        
    </logic:iterate>
    
    <tr><td>&nbsp;</td></tr>

</table>
</html>
</body>
</html>