<%@ page contentType="text/html;charset=ISO-8859-1" language="java" %>
<%@ taglib uri="/WEB-INF/struts-bean-el.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html-el.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic-el.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
    <jsp:include page="_headHTML.jsp" />
    <script language="JavaScript" src="<html:rewrite page="/js/popcalendar.js"/>"></script>
</head>

<jsp:include page="_head.jsp" />

<%-- shows error messages --%>
<jsp:include page="_messages.jsp" />


<table border="0" bgcolor="#a0a0a0" cellpadding=1 cellspacing=0 width=100%>
      <html:form action="/ExportAll.do">
                          <tr>
                              <td>
                                  <table border="0" bgcolor="#f9f9f9" cellpadding=2 cellspacing=2 width=100%>
                                      <tr bgcolor="#e1e1e1">
                                          <th> <bean:message key="page.Period"/> </th>
                                          <th> <bean:message key="page.type"/> </th>
                                          <th> <bean:message key="page.filter"/>  </th>
                                          <th> &nbsp; </th>
                                      </tr>
                                      <tr>
                                      <td>
                                          <html:text style="width:80px" property="dateBegin"/>
                                          <html:img page="/images/bttn_calendar.gif" onclick="popUpCalendar(this, exportForm.dateBegin, 'yyyy-MM-dd')" style="font-size:11px"/>
                                          <br>
                                          <html:text style="width:80px" property="dateEnd"/>
                                          <html:img page="/images/bttn_calendar.gif" onclick="popUpCalendar(this, exportForm.dateEnd, 'yyyy-MM-dd')" style="font-size:11px"/>
                                      </td>
                                      <td>
                                          <html:select property="exportFormat">
                                              <!--  <option value="CSV">CSV</option>  -->
                                              <option value="HTML">HTML</option>
                                              <option value="Excel">Excel/HTML</option>
                                              <!--  <option value="XML">XML</option>  -->
                                          </html:select>
                                      </td>
                                      <td>
                                            <table border="0" >
                                                <tr>
                                                    <td valign="top">
                                                        <bean:message key="page.status"/>:
                                                    </td>
                                                    <td valign="top">
                                                        <jsp:include page="_listStatus.jsp"/>
                                                    </td>
                                                </tr>
                                                                              	
                                                <tr>
                                            		<td colspan="2"><hr/>
                                            		</td>
                                            	</tr>
                                            	
                                            	<tr>
                                            		<td valign="top">
                                               			<bean:message key="page.type"/>:
                                                	</td>
                                                	<td valign="top">
                                                		<jsp:include page="_listType.jsp"/>
                                            		</td>
                                            	</tr>
                                            	
                                            	<tr>
                                            		<td colspan="2"><hr/>
                                            		</td>
                                            	</tr>
                                            	
                                            	<tr>
                                            		<td valign="top">
                                               			<bean:message key="page.project"/>:
                                                	</td>
                                                	<td valign="top">
													      <html:select size="1" property="projectId" style="width:250px;" value="${userDataBean.projectId}">
													         <html:option value="Todos" >Todos</html:option>
													         <html:optionsCollection name="projectListBean" property="projects" value="id" label="nameIndented"/>
													      </html:select>
                                            		</td>
                                            	</tr>
                                            	
                                            	<tr>
                                            		<td colspan="2"><hr/>
                                            		</td>
                                            	</tr>
                                            	
                                            	<tr>
                                            		<td valign="top">
                                               			<bean:message key="page.consultor"/>:
                                                	</td>
                                                	<td valign="top">
                                                		 <%-- shows the users of a project if the current is privileged to do so --%>
													      <logic:present name="managerParameterBean">
													      		<c:if test="${managerParameterBean.superuser or managerParameterBean.gerente}">
															         <html:select property="viewUserId" value="${userDataBean.id}" >
															            <logic-elx:notEmpty name="managerParameterBean" property="viewUsers">
															             	<html:option value="0" >Selecione</html:option>
															              	<html:optionsCollection name="managerParameterBean" property="viewUsers" label="fullName" value="id"/>
															            </logic-elx:notEmpty>
															         </html:select>
														         </c:if>
													      </logic:present>
                                            		</td>
                                            	</tr>
                                            	
                                            	<tr>
                                            		<td colspan="2"><hr/>
                                            		</td>
                                            	</tr>
                                            
                                         </table>
                                      </td>

                                      <td>
                                          	<html:submit styleClass="submit" property="exportForward"><bean:message key="page.Start_All_Export"/></html:submit>
                                      </td>
                                      
                                      </tr>
                                  </table>
                                </td>
                           </tr>
                      </table>
      </html:form>

<jsp:include page="_foot.jsp" />
