<%@ page contentType="text/html;charset=ISO-8859-1" language="java" %>
<%@ taglib uri="/WEB-INF/struts-bean-el.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html-el.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic-el.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c" %>

<table bgcolor="#eaeaea" width="100%" border="0" cellpadding=1 cellspacing=0>
   <tr><td>
      <table bgcolor="#fafafa" width="100%" border="0" cellpadding="2" cellspacing="2">
         <tr>
            <td align=left valign=baseline>
               <bean:message key="index.title"/>
               <%-- shows additional information if user is validated (login) --%>
               <logic:present name="logonDataBean" scope="session">
                  <logic:present name="managerParameterBean" scope="request">
                     - <c:out value="${logonDataBean.userDataBean.date}"/>
                     <br/>
                     <bean:message key="page.user"/>: <b><c:out value="${user.userLogin.fullName}"/></b>
                    <input type="hidden" name="loginAdminId" value="<c:out value="${user.userLogin.id}"/>"> 
                     
                     &nbsp;&nbsp;&nbsp;
                     <bean:message key="page.viewing"/>: <b><c:out value="${user.fullName}"/></b>
					<input type="hidden" name="loginUserViewId" value="<c:out value="${user.id}"/>"> 

                     <%-- showing time total, if parameterBean is present --%>
                     <logic:present name="parameterBean" property="summary">
                        &nbsp;<bean:message key="page.time_total"/>:
                        <b><c:out value="${parameterBean.summary}"/></b>
                         &nbsp;<bean:message key="page.time_total_adicional"/>:
                        <b><c:out value="${parameterBean.summaryAdicionais}"/></b>
                         &nbsp;<bean:message key="page.time_total_deslocamento"/>:
                        <b><c:out value="${parameterBean.summaryDeslocamento}"/></b>
                        &nbsp;<bean:message key="page.time_total_bonus"/>:
                        <b><c:out value="${parameterBean.summaryBonusGestor}"/></b>
                        &nbsp;&nbsp;-&nbsp;&nbsp;<b><bean:message key="page.time_total_geral"/>:
                        <b><c:out value="${parameterBean.summaryTotalGeral}"/></b>
                     </logic:present>
						
                    <html:button property="buttonDetalheHoras" value="Horas Aprovadas" onclick="exibeDetalheHoras();"/>
					<br>
               		<div id="detalheHoras" style="width: 100%; height: 100%; display: none;"> 
		            	<logic:present name="parameterBean">
		                	&nbsp;<bean:message key="page.time_total_aprovadas"/>:
		                    <b><c:out value="${parameterBean.summaryAprovadas}"/></b>
		                    &nbsp;<bean:message key="page.time_total_bloqueadas"/>:
		                    <b><c:out value="${parameterBean.summaryBloequeadas}"/></b>
		                    &nbsp;<bean:message key="page.time_total_rejeitadas"/>:
		                    <b><c:out value="${parameterBean.summaryRejeitadas}"/></b>
		                    &nbsp;<bean:message key="page.time_total_abertas"/>:
		                    <b><c:out value="${parameterBean.summaryAbertas}"/></b>
		                    
		              	</logic:present>
					</div>
   
                  </logic:present>

                  <%-- simple display if user is not administrator --%>
                  <logic:notPresent name="managerParameterBean" scope="request">
                     - <c:out value="${logonDataBean.userDataBean.date}"/>
                     <br/>
                     <bean:message key="page.user"/>: <b><c:out value="${user.userLogin.fullName}"/></b>
                     <input type="hidden" name="loginUserId" value="<c:out value="${user.userLogin.id}"/>">

                     <%-- showing time total, if parameterBean is present --%>
                     <logic:present name="parameterBean">
                        &nbsp;<bean:message key="page.time_total"/>:
                        <b><c:out value="${parameterBean.summary}"/></b>
                         &nbsp;<bean:message key="page.time_total_adicional"/>:
                        <b><c:out value="${parameterBean.summaryAdicionais}"/></b>
                         &nbsp;<bean:message key="page.time_total_deslocamento"/>:
                        <b><c:out value="${parameterBean.summaryDeslocamento}"/></b>
                        &nbsp;<bean:message key="page.time_total_bonus"/>:
                        <b><c:out value="${parameterBean.summaryBonusGestor}"/></b>
                        &nbsp;&nbsp;-&nbsp;&nbsp;<b><bean:message key="page.time_total_geral"/>:
                        <c:out value="${parameterBean.summaryTotalGeral}"/></b>
                     </logic:present>
                     
                    <html:button property="buttonDetalheHoras" value="Horas Aprovadas" onclick="exibeDetalheHoras();"/>
					<br>
               		<div id="detalheHoras" style="width: 100%; height: 100%; display: none;"> 
		            	<logic:present name="parameterBean">
		                	&nbsp;<bean:message key="page.time_total_aprovadas"/>:
		                    <b><c:out value="${parameterBean.summaryAprovadas}"/></b>
		                    &nbsp;<bean:message key="page.time_total_bloqueadas"/>:
		                    <b><c:out value="${parameterBean.summaryBloequeadas}"/></b>
		                    &nbsp;<bean:message key="page.time_total_rejeitadas"/>:
		                    <b><c:out value="${parameterBean.summaryRejeitadas}"/></b>
		                    &nbsp;<bean:message key="page.time_total_abertas"/>:
		                    <b><c:out value="${parameterBean.summaryAbertas}"/></b>
		                    
		              	</logic:present>
					</div>
                     
                  </logic:notPresent>
               </logic:present>
            </td>
            <td align=right>
               <html:link page="/Main.do">
                  <html:img page="/images/xclock32.png" width="32" height="32" border="0"/>
               </html:link>
            </td>
         </tr>
         
      </table>
   </td></tr>
         
</table>
<logic:present name="logonDataBean" scope="session">
   <table border="0" height=19 cellpadding="0" cellspacing="0">
      <tr>
         <td align="center" width="100" background="<html:rewrite page="/images/button-back-left.png"/>"><html:link
               styleClass="menu" page="/Main.do"><bean:message key="menu.Main"/></html:link></td>

			<c:choose>
			    <c:when test="${user.userLogin.superuser or user.userLogin.isGerente}">
		         	<td align="center" width="100" background="<html:rewrite page="/images/button-back.png"/>"><html:link
		               styleClass="menu" page="/ExportAll.do"><bean:message key="menu.Export"/></html:link></td>
			    </c:when>
			    <c:otherwise>
		         	<td align="center" width="100" background="<html:rewrite page="/images/button-back.png"/>"><html:link
		               styleClass="menu" page="/Export.do"><bean:message key="menu.Export"/></html:link></td>
			    </c:otherwise>
			</c:choose>

         <td align="center" width="100" background="<html:rewrite page="/images/button-back.png"/>"><html:link
               styleClass="menu" page="/ViewUserSettings.do"><bean:message key="menu.Settings"/></html:link></td>
            <%-- showing administration link if user is administrator --%>
         <c:if test="${user.userLogin.superuser}">
            <td align="center" width="100" background="<html:rewrite page="/images/button-back.png"/>"><html:link
                  styleClass="menu" page="/Admin.do"><bean:message key="menu.Administration"/></html:link></td>
         </c:if>
         <!--
         <c:if test="${user.userLogin.superuser}">
            <td align="center" width="100" background="<html:rewrite page="/images/button-back.png"/>"><html:link
                  styleClass="menu" page="/Setup.do"><bean:message key="menu.Setup"/></html:link></td>
         </c:if>
         -->
         <td align="center" width="100" background="<html:rewrite page="/images/button-back-right.png"/>"><html:link
               styleClass="menu" page="/Logout.do"><bean:message key="menu.Logout"/></html:link></td>
      </tr>
   </table>
</logic:present>
<br>
<table border="0" heigth="10">
   <tr><td>&nbsp;</td></tr>
</table>
