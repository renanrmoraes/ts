<%@ page contentType="text/html;charset=ISO-8859-1" language="java" %>
<%@ taglib uri="/WEB-INF/struts-bean-el.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html-el.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic-el.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c" %>

<html>
<head>
    <jsp:include page="_headHTML.jsp" />
</head>
<body >
<jsp:include page="_head.jsp" />

<logic:present name="user">
    <c:if test="${ ! user.userLogin.superuser }">
        <jsp:forward page="/Main.do" />
    </c:if>
</logic:present>

<logic:notPresent name="logonDataBean">
<%--    <c:if test="${ setupDataBean.init }">--%>
<%--        <jsp:forward page="/jsp/logon.jsp" />--%>
<%--    </c:if>--%>
</logic:notPresent>

<logic:present parameter="noinit" >
    <logic:match value="true" parameter="noinit">
        <table bgcolor="#eaeaea" width="100%" border="0" cellpadding=1 cellspacing=0>
            <tr><td>
                <table bgcolor="#fafafa" width="100%" border="0" cellpadding="2" cellspacing="2">
                  <tr>
                    <td align="left">
                        <bean:message key="page.setupStart"/><br/>
                    </td>
                  </tr>
                </table>
            </td></tr>
        </table>
        <p/>
    </logic:match>
</logic:present>

<jsp:include page="_messages.jsp" />

<fieldset><legend> Database initialization </legend>

    <bean:message key="page.setupInit"/>
    <p>

   <html:form action="/Setup">
            <table border="0" width="100%" cellspacing="2" cellpadding="2" >
                <tr>
                    <td colspan="3" ><hr noshade size="1" /></td>
                </tr>
                <tr>
                    <td>Database manager:</td>
                    <td>
                        <html:select property="databaseProduct">
                            <html:options name="setupDataBean" property="databaseProducts"/>
                        </html:select>
                    </td>
                </tr>
                <tr>
                    <td>Database driver:</td>
                    <td>
                        <html:text property="databaseDriver" size="48" /><br/>
                        <bean:message key="page.Sample"/>: HSQLDB - org.hsqldb.jdbcDriver &nbsp;&nbsp;&nbsp; MySQL - org.gjt.mm.mysql.Driver
                    </td>
                </tr>
                <tr>
                    <td>Database name:</td>
                    <td>
                        <html:text property="databaseName" size="48" /><br/>
                        <bean:message key="page.Sample"/>: ttraq
                    </td>
                </tr>
                <tr>
                    <td>
                        Database URL:
                    </td>
                    <td>
                        <html:text property="databaseURL" size="48" /><br/>
                        <bean:message key="page.Sample"/>: HSQLDB - jdbc:hsqldb:file:/tmp/ttraq &nbsp;&nbsp;&nbsp; MySQL - jdbc:mysql://localhost:3306/ttraq
                    </td>
                </tr>
                <tr>
                    <td>
                        Database admin URL:
                    </td>
                    <td>
                        <html:text property="databaseAdminURL" size="48" /><br/>
                        <bean:message key="page.Sample"/>: jdbc:mysql://localhost:3306/mysql
                    </td>
                </tr>
                <tr>
                    <td>Database user:</td><td><html:text property="databaseUser" size="48" /></td>
                </tr>
                <tr>
                    <td>Database password:</td><td><html:password property="databasePassword" size="48" /></td>
                </tr>
                <tr>
                   <td colspan="3" ><hr noshade size="1" /></td>
                </tr>
                <tr>
                    <td align="left" colspan="3" >
                        <html:checkbox property="databaseInitDefault">
                            Init the database with some default data (recommended)
                        </html:checkbox>
                        <html:checkbox property="databaseInitDemo">
                            Init the database with a demo user account
                        </html:checkbox>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" ><hr noshade size="1" /></td>
                </tr>
            </table>
        <html:hidden property="action" value="Init" />
        <html:submit styleClass="submit" value="Initialze database"/><sup>1</sup>

        </html:form>
</fieldset>

<p>&nbsp;</p>

<fieldset><legend> Application setup </legend>

    <p>
    <bean:message key="page.setupHelp"/><br/>
    </p>

   <html:form action="/Setup">
            <table border="0" width="100%" cellspacing="2" cellpadding="2" >
                <tr>
                    <td colspan="3" ><hr noshade size="1" /></td>
                </tr>
                <tr>
                    <td>Database manager:</td>
                    <td>
                        <html:select property="databaseProduct">
                            <html:options name="setupDataBean" property="databaseProducts"/>
                        </html:select>
                    </td>
                </tr>
                <tr>
                    <td>Database driver:</td>
                    <td>
                        <html:text property="databaseDriver" size="48" /><br/>
                        <bean:message key="page.Sample"/>: HSQLDB - org.hsqldb.jdbcDriver &nbsp;&nbsp;&nbsp; MySQL - org.gjt.mm.mysql.Driver
                    </td>
                </tr>
                <tr>
                    <td>
                        Database URL:<br/>
                    </td>
                    <td>
                        <html:text property="databaseURL" size="48" /><br/>
                        <bean:message key="page.Sample"/>: HSQLDB - jdbc:hsqldb:file:/tmp/ttraq &nbsp;&nbsp;&nbsp; MySQL - jdbc:mysql://localhost:3306/ttraq 
                    </td>
                </tr>
                <tr>
                    <td>Database user:</td><td><html:text property="databaseUser" size="48" /></td>
                </tr>
                <tr>
                    <td>Database password:</td><td><html:password property="databasePassword" size="48" /></td>
                </tr>
                <tr>
                    <td colspan="3" ><hr/></td>
                </tr>
                <tr>
                    <td align="left" colspan="3" >
                        <html:checkbox property="demo">
                            Run TTraq in demo mode. This setup page will be locked then.<sup>2</sup>
                        </html:checkbox>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" ><hr /></td>
                </tr>
                <tr>
                    <td align="left" colspan="3" >
                        Copyright<sup>3</sup>: <html:text property="copyright" size="64" />
                    </td>
                </tr>
<%--                <tr>--%>
<%--                    <td colspan="3" ><hr /></td>--%>
<%--                </tr>--%>
<%--                <tr>--%>
<%--                    <td align="left" colspan="3" >--%>
<%--                        Date format<sup></sup>: <html:text property="formatDate" size="32" />--%>
<%--                    </td>--%>
<%--                </tr>--%>
<%--                <tr>--%>
<%--                    <td align="left" colspan="3" >--%>
<%--                        Time format<sup></sup>: <html:text property="formatTime" size="32" />--%>
<%--                    </td>--%>
<%--                </tr>--%>
                <tr>
                    <td colspan="3" ><hr /><br/>
                    <bean:message key="page.setupMail"/>
                    </td>
                </tr>
                <tr>
                    <td>Disable sending mail:</td>
                    <td>
                        <html:checkbox property="smtpDisable"/>
                    </td>
                </tr>
<%--                <tr>--%>
<%--                    <td>SMTP server:</td>--%>
<%--                    <td>--%>
<%--                        <html:text property="smtpServer" size="48" />--%>
<%--                    </td>--%>
<%--                </tr>--%>
<%--                <tr>--%>
<%--                    <td>--%>
<%--                        SMTP port:<br/>--%>
<%--                    </td>--%>
<%--                    <td>--%>
<%--                        <html:text property="smtpPort" size="48" />--%>
<%--                    </td>--%>
<%--                </tr>--%>
<%--                <tr>--%>
<%--                    <td>SMTP user:</td><td><html:text property="smtpUser" size="48" /></td>--%>
<%--                </tr>--%>
<%--                <tr>--%>
<%--                    <td>SMTP password:</td><td><html:password property="smtpPassword" size="48" /></td>--%>
<%--                </tr>--%>
                <tr>
                    <td colspan="3" ><hr noshade size="1" /></td>
                </tr>
            </table>
        <html:hidden property="action" value="Save" />
        <html:submit styleClass="submit" value="Save settings"/><sup>1</sup>
        </html:form>
</fieldset>
<hr noshade size="1" />
<sup>1</sup> <bean:message key="page.tip_4"/><br/>
<sup>2</sup> <bean:message key="page.tip_5"/><br/>
<sup>3</sup> <bean:message key="page.tip_6"/><br/>

<jsp:include page="_foot.jsp" />

