<%-- In Textdateien zählt jedes Leerzeichen! --%><%@ page contentType="text/plain;charset=ISO-8859-1" language="java" %><%@ taglib uri="/WEB-INF/struts-logic-el.tld" prefix="logic" %><%@ taglib uri="/WEB-INF/c.tld" prefix="c" %><%@ taglib uri="/WEB-INF/struts-bean-el.tld" prefix="bean" %>

TTraq CVS Export
<bean:message key="page.Name"/>: <c:out value="${exportBean.userName}"/>
<bean:message key="page.Project"/>: <c:out value="${exportBean.projectName}"/>
<bean:message key="page.Period"/>: <c:out value="${exportBean.beginDate} - ${exportBean.endDate}"/>

<logic:iterate id="column" property="columns" name="exportBean"><c:out value="${column}"/>;</logic:iterate>
<c:out escapeXml="false" value="${exportBean.csvAsString}" />
<bean:message key="page.Time_total"/>: <c:out value="${exportBean.summary}h"/> = <c:out value="${exportBean.summaryAsFloat}h"/> = <c:out value="${exportBean.summaryAsDays}d"/>
<bean:message key="page.Time_at_weekdays"/>: <c:out value="${exportBean.timeWeekDay}h"/> = <c:out value="${exportBean.timeWeekDayAsFloat}h"/> = <c:out value="${exportBean.timeWeekAsDays}d"/>
<bean:message key="page.Time_at_weekends"/>: <c:out value="${exportBean.timeWeekEnd}h"/> = <c:out value="${exportBean.timeWeekEndAsFloat}h"/> = <c:out value="${exportBean.timeWeekEndAsDays}d"/>

<logic:present name="managerParameterBean" ><c:out value="Total Amount: ${exportBean.summaryAmount}"/></logic:present>
