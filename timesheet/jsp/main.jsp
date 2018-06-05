<%@ page import="org.apache.struts.Globals"%> 
<%@ page import="org.apache.struts.taglib.html.Constants"%> 
<%@ page import="java.util.*" %>

<%@ page contentType="text/html;charset=ISO-8859-1" language="java" %>
<%@ taglib uri="/WEB-INF/struts-bean-el.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html-el.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic-el.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic-elx" %>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c" %>

<!-- 1. Add these JavaScript inclusions in the head of your page -->
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
<script language="JavaScript" src="<html:rewrite page="/js/highcharts.js"/>"></script> 

<!-- 1b) Optional: the exporting module -->
<script language="JavaScript" src="<html:rewrite page="/js/modules/exporting.js"/>"></script>
		
<!-- 2b) Optional: the exporting themes-->		
<script language="JavaScript" src="<html:rewrite page="/js/themes/gray.js"/>"></script>
<script language="JavaScript" src="<html:rewrite page="/js/themes/dark-blue.js"/>"></script>
<script language="JavaScript" src="<html:rewrite page="/js/themes/dark-green.js"/>"></script>
<script language="JavaScript" src="<html:rewrite page="/js/themes/grid.js"/>"></script>
		

<%
   int formcounter = 0;
   String bgcolor = "#ffffff";


  
%>
 
<html>
<head>

<script type="text/javascript">
<%--
$(document).ready(function() {

	var cor = Array(4)
	cor[0] = "#00B3FF";
	cor[1] = "#00EAFF";
	cor[2] = "#F5E90A";
	cor[3] = "#45F50A";
	cor[4] = "#8BF50A";
	
	var nomeCor = Array(4)
	nomeCor[0] = "Norma";
	nomeCor[1] = "Deslo";
	nomeCor[2] = "Horas";
	nomeCor[3] = "Adici";
	nomeCor[4] = "A par";

	var valores = new Array(100);
	valores = <%= session.getAttribute("listaDadosgrafico") %>;
	
	var descricoes = new Array(100);
	descricoes = <%= session.getAttribute("listaDescricoesDadosgrafico") %>;
	 
	
	var options = {

			chart: {
				renderTo: 'container',
				height: 250,
				defaultSeriesType: 'bar'
			},
			title: {
				text: 'Gráfico de consumo de horas'
			},
			xAxis: {
				 min: 0,
		        categories: ['Horas']
			},
			yAxis: {
		         min: 0,
		         minorTickInterval: 10,
		         minorTickLength: 0,
		         title: {
		            text: 'Horas em minutos'
		         }
		    },
			legend: {
				backgroundColor: '#FFFFFF',
				reversed: true
			},
			tooltip: {
				formatter: function() {
					return ''+
						 this.series.name ;
				}
			},
			plotOptions: {
				series: {
					stacking: 'normal'
				}
			},
		series: []

	};
	
	for(j=0; j < valores.length; j++){

		var series = {data: []};
				
		series.name = descricoes[j];
		series.data.push(parseFloat(valores[j]));

		var corBarra = descricoes[j];
		corBarra = corBarra.substring(0,5);

		for(m=0; m < nomeCor.length; m++){
			if(nomeCor[m] == corBarra){
				series.color = cor[m];
			}
		}
		
		
		
		options.series.push(series);
		
	}

			

			
var chart = new Highcharts.Chart(options);
	
});

function exibeGrafico(){   
    
    if(document.getElementById('container').style.display == "none"){   
        document.getElementById('container').style.display = "inline";   
    }else {   
        document.getElementById('container').style.display = "none";   
    }   
}  

function desabilitaBotaoGrafico(value){   

	if(value == 'Todos'){
		document.getElementById('grafico').disabled = true;
	}else{
		document.getElementById('grafico').disabled = false;
	}
       
}  


--%>

function exibeDetalheHoras(){   
    
    if(document.getElementById('detalheHoras').style.display == "none"){   
        document.getElementById('detalheHoras').style.display = "inline";   
    }else {   
        document.getElementById('detalheHoras').style.display = "none";   
    }   
}
</script>
   
<jsp:include page="_headHTML.jsp" />

<script language="JavaScript" src="<html:rewrite page="/js/popcalendar.js"/>"></script>
<script language="JavaScript" src="<html:rewrite page="/js/timesheet.js"/>"></script>
<script language="JavaScript" src="<html:rewrite page="/ttraq/dwr/interface/Timesheet.js"/>"></script>
<script language="JavaScript" src="<html:rewrite page="/ttraq/dwr/engine.js"/>"></script>
<script language="JavaScript" src="<html:rewrite page="/ttraq/dwr/util.js"/>"></script>

</head>

<body>

<jsp:include page="_head.jsp"/>

 
<div align="center">
   <html:form action="/SelectProject.do" method="post">
   
   <input type="hidden" name="<%= Constants.TOKEN_KEY %>" 
		value="<%= session.getAttribute(Globals.TRANSACTION_TOKEN_KEY) %>" > 
   
   	   &nbsp;&nbsp;&nbsp;&nbsp;
      <bean:message key="page.project"/>:
      <html:select size="1" property="projectId" style="width:250px;" value="${userDataBean.projectId}">
         <html:option value="Todos" >Todos</html:option>
         <html:optionsCollection name="projectListBean" property="projects" value="id" label="nameIndented"/>
      </html:select>

		<!-- 
	      <html:select property="timeFilter" value="${userDataBean.timeFilter}" onchange="selectProjectForm.submit();desabilitaBotaoGrafico(this.value);">
	         <logic-elx:notEmpty name="parameterBean" property="selectableTimefilter">
	            <html:options name="parameterBean" property="selectableTimefilter"/>
	         </logic-elx:notEmpty>
	      </html:select>
 		-->

 				
 	  &nbsp;&nbsp;&nbsp;&nbsp;
      <bean:message key="page.Date_Start"/>: 					
      <html:text style="width:80px" property="dataInicio"/>
      <html:img page="/images/bttn_calendar.gif" onclick="popUpCalendar(this, selectProjectForm.dataInicio, 'dd/MM/yyyy')" style="font-size:11px"/>
      
      &nbsp;&nbsp;&nbsp;&nbsp;
	  <bean:message key="page.Date_End"/>: 
      <html:text style="width:80px" property="dataFim"/>
      <html:img page="/images/bttn_calendar.gif" onclick="popUpCalendar(this, selectProjectForm.dataFim, 'dd/MM/yyyy')" style="font-size:11px"/>
                                    
 		
      <%-- shows the users of a project if the current is privileged to do so --%>
      <logic:present name="managerParameterBean">
         <html:select property="viewUserId" value="${userDataBean.id}" onchange="selectProjectForm.submit()">
            <logic-elx:notEmpty name="managerParameterBean" property="viewUsers">
               <html:optionsCollection name="managerParameterBean" property="viewUsers" label="fullName" value="id"/>
            </logic-elx:notEmpty>
         </html:select>
      </logic:present>

      <!-- 
      <html:text property="query" name="userDataBean"/> 
       -->
       
      &nbsp;&nbsp;&nbsp;&nbsp;
      <html:submit value="Buscar" titleKey="search"/>
      
      <%--
      <html:button property="grafico" value="Gráfico" onclick="exibeGrafico();"/>
      --%>
      
      
      <%-- set the user in a hidden field, if he has no privileges to show all users --%>
      <logic:notPresent name="managerParameterBean">
         <html:hidden property="viewUserId" value="${userDataBean.id}"/>
      </logic:notPresent>
   </html:form>
</div>

<jsp:include page="_messages.jsp"/>

<table border="0" bgcolor="#a0a0a0" cellpadding=1 cellspacing=0 width=100%>

<tr>
<td>
<table border="0" bgcolor="#f9f9f9" cellpadding=2 cellspacing=2 width=100%>
<tr bgcolor="#e1e1e1">
   <th width="150"><bean:message key="page.day"/></th>
   <th><bean:message key="page.project"/></th>
   <th width="10"><bean:message key="page.deslocamento"/></th>
   <th width="15"><bean:message key="page.amount"/></th>
   <th width="10"><bean:message key="page.deslocamento"/></th>
   <th width="10"><bean:message key="page.adicional"/></th>
   <th width="10"><bean:message key="page.bonus"/></th>
   <th><bean:message key="page.description"/></th>
   <th><bean:message key="page.status"/></th>
   <th width="48">
      <html:link page="/CreateTimestamp.do?projectId=${userDataBean.projectId}&operation=create"><html:img border="0"
                                                                                                           width="22"
                                                                                                           height="22"
                                                                                                           page="/images/add.png"
                                                                                                           alt="Add timestamp"/>
      </html:link>
   </th>
</tr>
<tbody rules="group">

   <html:form action="/EditTimestamps.do" method="post">
   
 
      <logic:iterate name="editTimeStampsForm" property="timeStampForms" indexId="idx" id="ts">
      
      <c:choose>
       <c:when test="${managerParameterBean == null}">
       <c:if test="${ts.isNormal or ts.typeId == 10}" >
      
      
         <% if (formcounter / 2.0 == formcounter / 2)
            bgcolor = "#f1f1f1";
         else
            bgcolor = "#ffffff";
         %>
         
         <c:if test="${ts.typeId == 10}" >
          	
			<% 
          	  bgcolor = "#e1e1e1";
         	%>
                
         </c:if>
         
         <tr bgcolor="<%= bgcolor %>">


            <c:if test="${ts.open}">
            <td valign="top" align=left bgcolor="#e2e2e2">
               </c:if>
               <c:if test="${ ! ts.open}">
            <td width="150" valign="top" align=left>
               </c:if>
               <c:out value="${ts.formattedDateBegin}"/>
               <% formcounter++; %>
               &nbsp;&nbsp;<nobr><b><c:out value="${ts.formattedBeginTime}"/> - <c:out value="${ts.formattedEndTime}"/></b></nobr>
            </td>

            <td valign="top" align=left>
               <c:out value="${ts.project.name}"/>
            </td>

 			<!--  
 			<td width="10" valign="top" align=left>
               <c:out value="${ts.totalDeslocamentoDia}"/>
            </td>
            -->
            
            <td width="10" valign="top" align=left>
               <c:out value="${ts.deslocamentoIda}"/>
            </td>
            
            <td width="15" valign="top" align=left>
               <b><c:out value="${ts.differenceAsString}"/></b>
            </td>

			<td width="10" valign="top" align=left>
               <c:out value="${ts.deslocamentoVolta}"/>
            </td>
            
 			<td width="10" valign="top" align=left>
               <c:out value="${ts.totalAdicionaisDia}"/>
            </td>
            
            <td width="10" valign="top" align=left <c:if test="${ts.deduct}">bgcolor="#ffa0a0"</c:if>>
               <c:out value="${ts.totalBonusDia}"/>
            </td>
            
            <td valign="top" align=left>
               <c:out value="${ts.formattedDescriptionNewline}" escapeXml="false"/>
                  <%--				    				<c:out value="${ts.description}" />--%>
            </td>
            <td valign="middle" align="center">
               <table border="0">
                  <tr>
                     <c:choose>
                        <c:when test="${ ts.status != null }">
                           <td bgcolor="<c:out value="${ts.status.color}"/>">&nbsp;</td>
                        </c:when>
                        <c:otherwise>
                           <td>&nbsp;</td>
                        </c:otherwise>
                     </c:choose>
                     <td align="center">
                        <c:choose>
                           <c:when test="${managerParameterBean != null}">
                              <html:select size="1" property="timeStampForms[${idx}].statusId"
                                           name="editTimeStampsForm">
                                 <html:option value="">---</html:option>
                                 <html:optionsCollection name="statusListBean" property="status" label="name"
                                                         value="id"/>
                              </html:select>
                           </c:when>
                        </c:choose>
                     </td>
                  </tr>
               </table>
            </td>
            <c:if test="${managerParameterBean != null || ts.modifyable}">
               <td align="center" valign="top">
                  <html:link page="/SelectTimestamp.do?timeStampId=${ts.timeStampId}"><html:img border="0" width="16"
                                                                                                height="16"
                                                                                                page="/images/edit.png"
                                                                                                alt="Edit"/></html:link>
                  &nbsp;&nbsp;
                  <html:link page="/DeleteTimestamp.do?id=${ts.timeStampId}"><html:img border="0" width="16" height="16"
                                                                                       page="/images/trash.png"
                                                                                       alt="Delete"/></html:link>
               </td>
            </c:if>
               <%--<c:if test="${managerParameterBean == null && ! ts.modifyable}">--%>
               <%-- showing only modification date if the user is not allowed to change --%>
            <!--<td align="center">-->
               <%--<c:out value="${ts.ctime}" />--%>
               <%--<c:if test="${!ts.unmodified}">--%>
            <!--<br/>-->
               <%--<c:out value="${ts.mtime}"/>--%>
               <%--</c:if>--%>
            <!--</td>-->
               <%--</c:if>--%>
         </tr>
         
        </c:if>
        </c:when>
        
         <c:when test="${managerParameterBean != null}">
         <c:if test="${ts.isNormal or ts.typeId == 10}" >
      
      
         <% if (formcounter / 2.0 == formcounter / 2)
            bgcolor = "#f1f1f1";
         else
            bgcolor = "#ffffff";
         %>
         
         <c:if test="${ts.typeId == 10}" >
          	
			<% 
          	  bgcolor = "#e1e1e1";
         	%>
                
         </c:if>
         
         <tr bgcolor="<%= bgcolor %>">


            <c:if test="${ts.open}">
            <td valign="top" align=left bgcolor="#ffcccc">
               </c:if>
               <c:if test="${ ! ts.open}">
            <td width="150" valign="top" align=left>
               </c:if>
               <c:out value="${ts.formattedDateBegin}"/><br>
               <% formcounter++; %>
               &nbsp;&nbsp;<nobr><c:out value="${ts.formattedBeginTime}"/> - <c:out
                  value="${ts.formattedEndTime}"/></nobr>
            </td>

            <td valign="top" align=left>
               <c:out value="${ts.project.name}"/>
            </td>

			<!--  
 			<td width="10" valign="top" align=left>
               <c:out value="${ts.totalDeslocamentoDia}"/>
            </td>
            -->
            
            <td width="10" valign="top" align=left>
               <c:out value="${ts.deslocamentoIda}"/>
            </td>
            
            <td width="15" valign="top" align=left>
               <b><c:out value="${ts.differenceAsString}"/></b>
            </td>

			<td width="10" valign="top" align=left>
               <c:out value="${ts.deslocamentoVolta}"/>
            </td>
            
 			<td width="10" valign="top" align=left>
               <c:out value="${ts.totalAdicionaisDia}"/>
            </td>
            
            <td width="10" valign="top" align=left <c:if test="${ts.deduct}">bgcolor="#ffa0a0"</c:if>>
               <c:out value="${ts.totalBonusDia}"/>
            </td>
            
            <td valign="top" align=left>
               <c:out value="${ts.formattedDescriptionNewline}" escapeXml="false"/>
                  <%--				    				<c:out value="${ts.description}" />--%>
            </td>
            <td valign="middle" align="center">
               <table border="0">
                  <tr>
                     <c:choose>
                        <c:when test="${ ts.status != null }">
                           <td bgcolor="<c:out value="${ts.status.color}"/>">&nbsp;</td>
                        </c:when>
                        <c:otherwise>
                           <td>&nbsp;</td>
                        </c:otherwise>
                     </c:choose>
                     <td align="center">
                        <c:choose>
                           <c:when test="${managerParameterBean != null}">
                              <html:select size="1" property="timeStampForms[${idx}].statusId"
                                           name="editTimeStampsForm">
                                 <html:option value="">---</html:option>
                                 <html:optionsCollection name="statusListBean" property="status" label="name"
                                                         value="id"/>
                              </html:select>
                           </c:when>
                        </c:choose>
                     </td>
                  </tr>
               </table>
            </td>
            <c:if test="${managerParameterBean != null || ts.modifyable}">
               <td align="center" valign="top">
                  <html:link page="/SelectTimestamp.do?timeStampId=${ts.timeStampId}"><html:img border="0" width="16"
                                                                                                height="16"
                                                                                                page="/images/edit.png"
                                                                                                alt="Edit"/></html:link>
                  &nbsp;&nbsp;
                  <html:link page="/DeleteTimestamp.do?id=${ts.timeStampId}"><html:img border="0" width="16" height="16"
                                                                                       page="/images/trash.png"
                                                                                       alt="Delete"/></html:link>
               </td>
            </c:if>
               <%--<c:if test="${managerParameterBean == null && ! ts.modifyable}">--%>
               <%-- showing only modification date if the user is not allowed to change --%>
            <!--<td align="center">-->
               <%--<c:out value="${ts.ctime}" />--%>
               <%--<c:if test="${!ts.unmodified}">--%>
            <!--<br/>-->
               <%--<c:out value="${ts.mtime}"/>--%>
               <%--</c:if>--%>
            <!--</td>-->
               <%--</c:if>--%>
         </tr>
         
        </c:if>
        </c:when>
        
        
        </c:choose>
        
        
        
        
      </logic:iterate>
      <c:if test="${managerParameterBean != null}">
         <tr bgcolor="#ffffff">
            <td>&nbsp;</td>
            <td align="right" colspan="4">
               <bean:message key="page.Set_all"/>:
               <jsp:include page="_listStatus.jsp"/>
               <html:submit disabled="false" styleClass="submit"><bean:message key="page.save_changes"/></html:submit>
            </td>
         </tr>
      </c:if>
   </html:form>
</tbody>
</table>
</td>
</tr>
</table>
<table border="0">
   <tr>
      <td align="right"><b><bean:message key="page.status"/></b>:</td>
      <logic:iterate id="status" name="statusListBean" property="status">
         <td align="right" bgcolor="<c:out value="${status.color}"/>">&nbsp;</td>
         <td align="left"><c:out value="${status.name}"/></td>
      </logic:iterate>
   </tr>
</table>

<!-- 3. Add the container --> 
<div id="container" style="width: 850px; height: 200px; margin: 0 auto; display: none" align="center"></div>

<jsp:include page="_foot.jsp"/>
</body>

<script type="text/javascript">

<%--
desabilitaBotaoGrafico(document.forms[0].timeFilter.value);   
--%>
</script>
   
</html>


