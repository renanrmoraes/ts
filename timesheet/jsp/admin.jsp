<%@ page contentType="text/html;charset=ISO-8859-1" language="java" %>
<%@ taglib uri="/WEB-INF/struts-bean-el.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html-el.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c" %>

<html:html>
<head>
    <jsp:include page="_headHTML.jsp" />
    <script language="JavaScript" src="<html:rewrite page="/js/picker.js"/>"></script>
</head>

<body >

<jsp:include page="_head.jsp" />

<%-- shows error messages --%>
<jsp:include page="_messages.jsp" />

<fieldset><legend> Usuários </legend>
    <table border="0">
        <tr>
            
            <html:form action="/AdminUser">
                <td>
                    <html:select property="userId">
                        <html:optionsCollection name="adminBean" property="users" label="fullName" value="id" />
                    </html:select>
                    <html:submit property="command" value=" Remove "/>
                    <html:submit property="command" value=" Edit "/>
                    &nbsp;&nbsp;
                    <html:submit property="command" value=" Reset "/>
                </td>
            </html:form>
        </tr>
    </table>
    <hr size=1 noshade>
    <table border="0" cellspacing="2" cellpadding="2" >
        <html:form action="/AddUser">
        <tr>
            <html:hidden property="userId"/>
            <td>First name:<br><html:text property="firstName"/></td>
            <td>Last name:<br><html:text property="lastName"/></td>
            <td>Email:<br><html:text property="email"/></td>
            <td>Administrador:</td><td><html:checkbox property="superuser"/></td>
            <td>Gerente:</td><td><html:checkbox property="isGerente"/></td>
            <td>Bloqueia lancamentos:</td><td><html:checkbox property="bloqueiaLancamentos"/></td>
            
        </tr>
        <tr>
            <td>Login:<br><html:text property="login"/></td>
            <td>Password:<br><html:password property="password1"/></td>
            <td>Repeat password:<br><html:password property="password2"/></td>
            <td><html:submit>Salvar usuário</html:submit></td>
        </tr>
        </html:form>
    </table>
</fieldset>
<p>

<fieldset><legend> Regras </legend>
    <table border="0">
        <tr>
            <html:form action="/AdminRegra">
                <td>
                    <html:select property="regraId">
                        <html:optionsCollection name="adminBean" property="regras" label="descricao" value="id" />
                    </html:select>
                    <html:submit property="command" value=" Remove "/>
                    <html:submit property="command" value=" Edit "/>
                    &nbsp;&nbsp;
                    <html:submit property="command" value=" Reset "/>
                </td>
            </html:form>
        </tr>
    </table>
    <hr size=1 noshade>
    <table border="0" cellspacing="2" cellpadding="2" >
        <html:form action="/AddRegra">
        <tr>
            <html:hidden property="regraId"/>
            <td>Descrição:<br><html:text property="descricao"/></td>
            <td>Percentual Reajuste:<br><html:text property="horas"/></td>
        </tr>
        <tr>
            <td>Horas Deslocamento:<br><html:text property="hora"/></td>
            <td>Deslocamento:</td><td><html:checkbox property="deslocamento"/></td>
            <td>Tipo Deslocamento:</td><td><html:checkbox property="isTipoDeslocamento"/></td>
            <td>Feriado:</td><td><html:text property="dataFeriado"/></td>
            <td><html:submit>Salvar</html:submit></td>
        </tr>
        </html:form>
    </table>
</fieldset>
<p>


<fieldset><legend> Projetos </legend>

    <table>
        <html:form action="/AdminProjects">
        <tr>

            <td>
                <html:select property="projectId">
                    <html:optionsCollection name="projectListBean" property="projects" label="nameIndented" value="id" />
                </html:select>

            </td>

            <td>
                <html:submit property="command" value="Remove" />
                <html:submit disabled="false" property="command" value="Edit" />
                &nbsp;&nbsp;
                <html:submit disabled="false" property="command" value="Reset" />
            </td>
        </tr>
    </table>
    <hr size=1 noshade>
    <table>

        <html:hidden property="projectEditId" />
        <tr>
            <td valign="top">Nome do projeto:<br><html:text property="name"/> </td>
            <td valign="top" rowspan="2">Descrição do projeto:<br><html:textarea rows="3" cols="48" property="description"/> </td>
            <logic:empty name="adminProjectsForm" property="projectId">
                <td valign="top"><br/>Sub-projeto: <html:checkbox property="subproject" /></td>
            </logic:empty>
        </tr>
        <tr>
             <td></td>
             <td valign="bottom"><html:submit property="command" value="Save project" /></td>
        </tr>
        </html:form>
    </table>

</fieldset>
<p>
<fieldset><legend> Associações </legend>
    <bean:message key="hint.assignment" />
    <table>
        <html:form action="/DeleteAssignment">
        <tr>
            <td valign="top">
                <html:select property="id">
                    <html:optionsCollection name="adminBean" property="assignments" label="assignment" value="id"/>
                </html:select>
            </td>
            <td valign="top">
                <html:submit >Desfazer associação</html:submit>
            </td>
        </tr>
        </html:form>
    </table>
    <hr size=1 noshade>
    <table>
        
        <html:form action="/AddAssignment">
        <tr>
        
            <td valign="top">
                <html:select property="projectId">
                    <html:optionsCollection name="projectListBean" property="projectsTop" label="name" value="id" />
                </html:select>
            </td>

            <td valign="top">
                <html:select property="userId">
                    <html:optionsCollection name="adminBean" property="users" label="fullName" value="id" />
                </html:select>
            </td>
            <td valign="top">
                <html:submit>Adicionar</html:submit>
            </td>
            <td>
                Marcar se for gerente:
            </td>
            <td>
                <html:checkbox property="projectManager" />
            </td>

        </tr>
        </html:form>

    </table>
</fieldset>
<p>
<fieldset><legend> Atuações </legend>
    <bean:message key="hint.type" />
    <table border="0">
        <tr>
            <html:form action="/AdminType">
            <html:hidden property="typeEditId" />
                <td>
                    <html:select property="typeId">
                        <html:optionsCollection name="adminBean" property="types" label="name" value="id" />
                    </html:select>
                    <html:submit property="command" value="Remove" />
                    <html:submit disabled="false" property="command" value="Edit" />
                    &nbsp;&nbsp;
                    <html:submit disabled="false" property="command" value="Reset" />
                </td>
        </tr>
    </table>
    <hr size=1 noshade>
    <table border="0" cellspacing="2" cellpadding="2" >
        <tr>
            <td>Nome:<br><html:text property="name"/></td>
            <!-- 
            <td>Default hourly rate: <br>
            	<html:text property="fee"/>
            </td>
            
            <td>
                Time based clearing:
            </td>
            <td>
                <html:checkbox property="timeClearing" />
            </td>
             -->
            <td><html:submit disabled="false" property="command" >Salvar atuação</html:submit></td>
        </tr>
        </html:form>
    </table>
</fieldset>

<p>

<fieldset><legend> Status </legend>
    <bean:message key="hint.status" />
    <table border="0">
        <tr>
            <html:form action="/AdminStatus">
            <html:hidden property="statusEditId" />
                <td>
                    <html:select property="statusId">
                        <html:optionsCollection name="adminBean" property="status" label="name" value="id" />
                    </html:select>
                    <html:submit property="command" value="Remove" />
                    <html:submit disabled="false" property="command" value="Edit" />
                    &nbsp;&nbsp;
                    <html:submit disabled="false" property="command" value="Reset" />
                </td>
        </tr>
    </table>
    <hr size=1 noshade>
    <table border="0" cellspacing="2" cellpadding="2" >
        <tr>
            <td>Nome:<br><html:text property="name"/></td>
            <td>Cor:<br><html:text property="color"/></td><td><a href="javascript:TCP.popup(document.forms['adminStatusForm'].elements['color'], 0)"><html:img width="16" height="16" border="0" alt="Click Here to Pick up the color" page="/images/colors.png"/></a></td>
            <td valign="bottom" ><html:submit disabled="false" property="command" >Salvar status</html:submit></td>
        </tr>
        </html:form>
    </table>
</fieldset>

<p>

    <jsp:include page="_foot.jsp" />

</body>
</html:html>
