<%@ page import="org.wso2.carbon.andes.ui.Constants" %>
<%@ page import="org.apache.axis2.context.ConfigurationContext" %>
<%@ page import="org.wso2.carbon.CarbonConstants" %>
<%@ page import="org.wso2.carbon.ui.CarbonUIUtil" %>
<%@ page import="org.wso2.carbon.utils.ServerConstants" %>
<%@ page import="org.wso2.carbon.ui.CarbonUIMessage" %>
<%@ taglib uri="http://wso2.org/projects/carbon/taglibs/carbontags.jar" prefix="carbon" %>
<%@ page import="org.wso2.carbon.andes.stub.AndesAdminServiceStub" %>
<%@ page import="org.wso2.carbon.andes.stub.admin.types.QueueRolePermission" %>
<%@ page import="org.wso2.carbon.andes.ui.UIUtils" %>
<%@ page import="org.wso2.carbon.andes.stub.AndesAdminServiceBrokerManagerAdminException" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="org.wso2.carbon.andes.dataAgent.ui.DataAgentClient" %>
<%@ page import="org.wso2.carbon.andes.dataAgent.stub.*" %>
<%@ page import="javax.print.DocFlavor" %>
<script type="text/javascript" src="../ajax/js/prototype.js"></script>
<script type="text/javascript" src="../resources/js/resource_util.js"></script>
<!--Yahoo includes for dom event handling-->
<script src="../yui/build/yahoo-dom-event/yahoo-dom-event.js" type="text/javascript"></script>

<!--Yahoo includes for animations-->
<script src="../yui/build/animation/animation-min.js" type="text/javascript"></script>

<!--Yahoo includes for menus-->
<link rel="stylesheet" type="text/css" href="../yui/build/menu/assets/skins/sam/menu.css"/>
<script type="text/javascript" src="../yui/build/container/container_core-min.js"></script>
<script type="text/javascript" src="../yui/build/menu/menu-min.js"></script>

<!--EditArea javascript syntax hylighter -->
<script language="javascript" type="text/javascript" src="../editarea/edit_area_full.js"></script>

<!--Local js includes-->

<script type="text/javascript" src="js/toggle.js"></script>

<link href="css/tree-styles.css" media="all" rel="stylesheet"/>
<link href="css/dsxmleditor.css" media="all" rel="stylesheet"/>
<fmt:bundle basename="org.wso2.carbon.andes.dataAgent.ui.i18n.Resources">

    <%
        String serverURL = CarbonUIUtil.getServerURL(config.getServletContext(), session);
        ConfigurationContext configContext =
                (ConfigurationContext) config.getServletContext().getAttribute(CarbonConstants.CONFIGURATION_CONTEXT);
        String cookie = (String) session.getAttribute(ServerConstants.ADMIN_SERVICE_COOKIE);

        DataAgentClient client;
        boolean status;
        String ip_address="";
        int port_num=0;
        try {
            client = new DataAgentClient(configContext, serverURL, cookie);
            status = client.ipchecker("123.567.88",7865);
        } catch (Exception e) {
            CarbonUIMessage.sendCarbonUIMessage(e.getMessage(), CarbonUIMessage.ERROR, request, e);
    %>
    <script type="text/javascript">
        location.href = "../admin/error.jsp";
    </script>


    <%
            return;
        }

    %>

    <%
        String responsestr="no";
        boolean rr=false;



        if(!(request.getAttribute("resp")==null)){

            responsestr=(String)request.getAttribute("resp");

    %>
    <script type="text/javascript">
        alertMessage("<%=responsestr%>");
    </script>

    <%
        }
    %>
    <div id="middle">
        <div id="workArea">
            <h2>
                <fmt:message key="stat.bam" />
            </h2>

            <table class="styledLeft" style="width: 20%">
                <form action="/carbon/publisher/dataAgentServlet" method="POST">
                    <tbody>
                    <tr>
                        <td colspan="5">Enable Publisher</td>
                        <td><input type="checkbox" id="enable_check" name="enable_check" value="true" onclick="toggleTable();"></td>
                    </tr>
                    </tbody>
            </table>


            <br><br>
            <div id="toggle">
                <table class="styledLeft" style="width: 100%" id="tbl_auth" >
                    <col width=20%>
                    <col width=30%>
                    <col width=50%>
                    <thead>
                    <tr>
                        <th colspan="2">Authentication</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td class="formRaw"><fmt:message key="username" /><span
                                class="required">*</span></td>
                        <td>&nbsp<input type="text" id="username" name="username"/> </td>
                    </tr>
                    <tr>
                        <td class="formRaw"><fmt:message key="password" /><span
                                class="required">*</span></td>
                        <td>&nbsp<input type="text" id="password" name="password"/></td>
                    </tr>
                </table>

                <br><br>

                <table class="styledLeft" style="width: 100%" id="tbl_trans">
                    <col width=20%>
                    <col width=30%>
                    <col width=50%>
                    <thead>
                    <tr>
                        <th colspan="2">Transport</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>

                        <td class="formRaw"><fmt:message key="ip"  /><span
                                class="required">*</span></td>
                        <td><input type="text" id="ip_address" name="ip_address"/></td>
                    </tr>
                    <tr>
                        <td class="formRaw"><fmt:message key="port" /><span
                                class="required">*</span></td>
                        <td><input type="text" id="port_num" name="port_num"/>
                            <input type="button" class="button" id="testButton" value="<fmt:message key="test"/>" /></td>

                    </tr>
                    <tr>
                        <td colspan="2" class="buttonRow"><input type="submit" class="button" id="saveButton"
                                                                 value="<fmt:message key="save"/>"
                                />
                        </td>
                        <input type="hidden" name="publisher_name" value="CEP"/>
                    </tr>
                    </form>
                </table>

            </div>
        </div>
    </div>

    <script>


    </script>

</fmt:bundle>