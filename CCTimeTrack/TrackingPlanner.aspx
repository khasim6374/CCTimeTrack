<%@ Page Language="VB" Debug="True" AutoEventWireup="false" Inherits="CCTimeTrack.TrackingPlanner"
    MasterPageFile="~/Site.Master" MaintainScrollPositionOnPostback="true" CodeBehind="TrackingPlanner.aspx.vb" %>

<%@ Register Assembly="DevExpress.Web.v15.1, Version=15.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <style type="text/css">
        body
        {
            overflow: hidden;
        }
        .PullListUp
        {
            margin-top:-32px;
        }
        .PullListUp2
        {
            margin-top:-32px;
        }
        .MultiGridClass
        {
            margin-left:0.5%;
        }
    </style>
    <script type="text/javascript">
        function adjustSize() {
            var width = Math.max(0, document.documentElement.clientWidth);
            var height = Math.max(0, document.documentElement.clientHeight);
            grid2.SetHeight(height - 106);
            if (hidden)
                grid2.SetWidth($(window).innerWidth() - 12);
            else
                grid2.SetWidth($(window).innerWidth() - 216);
            grid2.AdjustControl();
        }
        function adjustSizeSupplier() {
            var width = Math.max(0, document.documentElement.clientWidth);
            var height = Math.max(0, document.documentElement.clientHeight);
            gridSupplier.SetHeight(height - 150);
            if (hidden)
                gridSupplier.SetWidth($(window).innerWidth() - 100);
            else
                gridSupplier.SetWidth($(window).innerWidth() - 300);
            gridSupplier.AdjustControl();
        }
        function ShowSupplier() {
            supplier.Show();
        }
        function OnEndCallBack2(s, e) {
            if (e.command == "UPDATEEDIT") { }
        }
        function AdjustMultiGridSize() {
            var width = Math.max(0, document.documentElement.clientWidth);
            var height = Math.max(0, document.documentElement.clientHeight);
            MultiGrid.SetHeight(height - 150);
            MultiGrid.AdjustControl();
        }
        $(window).resize(function () {
            adjustSize();
        });
    </script>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div class="headerbar">
        <dx:ASPxButton ID="btnAddSupplier" runat="server" Text="Add Supplier" AutoPostBack="false">
            <ClientSideEvents Click="function(s, e) { ShowSupplier(); }" />
        </dx:ASPxButton>
        <%--<dx:ASPxButton ID="btnClientUpdate" runat="server" Text="Client Update" AutoPostBack="false"></dx:ASPxButton>--%>
        <dx:ASPxButton ID="btnDDReport" runat="server" Text="DD Report" AutoPostBack="false" OnClick="ExportToExcel" CustomParameter="DD_Report"></dx:ASPxButton>
        <dx:ASPxButton ID="btnPlanReport" runat="server" Text="Planning Report" AutoPostBack="false" OnClick="ExportToExcel" CustomParameter="Planning_Report"></dx:ASPxButton>
        <dx:ASPxButton ID="btnDDFailed" runat="server" Text="DD Failed" AutoPostBack="false" OnClick="ExportToExcel" CustomParameter="DD_Failed"></dx:ASPxButton>
        <dx:ASPxButton ID="btnPipelineReport" runat="server" Text="Pipeline Report" AutoPostBack="false" OnClick="ExportToExcel" CustomParameter="Pipeline_Report"></dx:ASPxButton>
        <%--<dx:ASPxButton ID="btnAuditPlanned" runat="server" Text="Audits Planned" AutoPostBack="false"></dx:ASPxButton>--%>
        <dx:ASPxButton ID="btnBDReport" runat="server" Text="Audits By BD report" AutoPostBack="false" OnClick="ExportToExcel" CustomParameter="BD_Report"></dx:ASPxButton>
        <dx:ASPxButton ID="btnCycleTimeReport" runat="server" Text="Cycle Time report" AutoPostBack="false" OnClick="ExportToExcel" CustomParameter="CT_Report"></dx:ASPxButton>
        
        <div class="tblHeadding">
            Tracking - Planner</div>
        <%--<div style="float: right; padding: 5px;color:#000;">
            <a style="color:#FFF;" href="CompletedAudits.aspx">Completed Audits</a> | <a style="color:#FFF;" href="AuditTest.aspx">Audit
                Tests</a>
        </div>--%>
    </div>
    <table style="margin-top:3px">
        <tr>
            <td style="width:15%">
                <dx:ASPxCheckBox ID="ChkBox" runat="server" ForeColor="Black" Text="Show All" OnCheckedChanged="chkBox_OnCheckedChanged" AutoPostBack="true">
                </dx:ASPxCheckBox>
            </td>
            <td>
                <dx:ASPxButton CssClass="subButtons" BorderBottom-BorderColor="#5D7B9D" BorderBottom-BorderWidth="3" ID="btnDueDiligence" runat="server" Text="Due Diligence" AutoPostBack="false" CustomParameter="DueDiligence" OnClick="MultiSourceFunction"></dx:ASPxButton>
            </td>
            <td>
                <dx:ASPxButton AllowFocus="False" CssClass="subButtons" BorderBottom-BorderColor="#5D7B9D" BorderBottom-BorderWidth="3" ID="btnPlanning" runat="server" Text="Planning" AutoPostBack="false" CustomParameter="Planning" OnClick="MultiSourceFunction">
                </dx:ASPxButton>
            </td>
            <td>
                <dx:ASPxButton CssClass="subButtons" BorderBottom-BorderColor="#5D7B9D" BorderBottom-BorderWidth="3" ID="btnFieldWorkSettlement" runat="server" Text="Field Work / Settlement" AutoPostBack="false" CustomParameter="FieldWorkSettlement" OnClick="MultiSourceFunction"></dx:ASPxButton>
            </td>
            <td>
                <dx:ASPxButton CssClass="subButtons" BorderBottom-BorderColor="#5D7B9D" BorderBottom-BorderWidth="3" ID="btnHold" runat="server" Text="Hold" AutoPostBack="false" CustomParameter="Hold" OnClick="MultiSourceFunction"></dx:ASPxButton>
            </td>
            <td>
                <dx:ASPxButton CssClass="subButtons" BorderBottom-BorderColor="#5D7B9D" BorderBottom-BorderWidth="3" ID="btnMasterGrid" runat="server" Text="Master View" AutoPostBack="false" OnClick="MasterPlanner"></dx:ASPxButton>
            </td>
            <td>
                <dx:ASPxButton CssClass="subButtons" BorderBottom-BorderColor="#5D7B9D" BorderBottom-BorderWidth="3" ID="NewReport" runat="server" Text="Report" AutoPostBack="false" OnClick="NewReport_Onclick"></dx:ASPxButton>
            </td>
        </tr>
    </table>
    <div style="overflow: auto; clear: both" id="divmain">
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:CCUpdate %>"
            SelectCommand="CCTrackingPlanner_sp" DeleteCommand="Delete from CC_TrackingMain WHERE Id=@Id" SelectCommandType="StoredProcedure" UpdateCommand="UPDATE CC_TrackingMain SET Clientid=@Clientid, 
                           SupplierId =@SupplierId, 
                           Auditor =@Auditor, 
                           Planner = @Planner,
                           LeadPlanner = @LeadPlanner,
                           DDLead =@DDLead,
                           [DD Spend] =@DDSpend,
                           Status =@StatusId,
                           NotificationLetterDate =@NotificationLetterDate,
                           ContractReceiptDate =@ContractReceiptDate,
                           Data_Received_Date =@Data_Received_Date,
                           COQDate =@COQDate,
                           AuditorKickOff =@AuditorKickOff,
                           scheduleddate =@scheduleddate,
                           DDWriteupDate =@DDWriteupDate,
                           [Sample Send] =@SampleSend, 
                           TargetRevenewShare =@RevenewShare,
                           Type =@Type,
                           SampleApprovaldate = @SampleApprovaldate
                           WHERE Id=@Id" InsertCommand="INSERT INTO CC_TrackingMain(Clientid, SupplierId, Auditor, Planner, LeadPlanner, DDLead, [DD Spend], Status, NotificationLetterDate, ContractReceiptDate, Data_Received_Date, COQDate, AuditorKickOff, scheduleddate, DDWriteupDate, [Sample Send], TargetRevenewShare, Type, SampleApprovaldate)
                           values(@Clientid, @SupplierId, @Auditor, @Planner, @LeadPlanner, @DDLead, @DDSpend, @StatusId, @NotificationLetterDate, @ContractReceiptDate, @Data_Received_Date, @COQDate, @AuditorKickOff, @scheduleddate, @DDWriteupDate, @SampleSend, @RevenewShare, @Type, @SampleApprovaldate)">
            <UpdateParameters>
                <asp:Parameter Name="Clientid" />
                <asp:Parameter Name="SupplierId" />
                <asp:Parameter Name="StatusId" />
                <asp:Parameter Name="Auditor" />
                <asp:Parameter Name="Planner" />
                <asp:Parameter Name="LeadPlanner" />
                <asp:Parameter Name="DDLead" />
                <asp:Parameter Name="DDSpend" />
                <asp:Parameter Name="Status" />
                <asp:Parameter Name="NotificationLetterDate" />
                <asp:Parameter Name="ContractReceiptDate" />
                <asp:Parameter Name="Data_Received_Date" />
                <asp:Parameter Name="COQDate" />
                <asp:Parameter Name="AuditorKickOff" />
                <asp:Parameter Name="scheduleddate" />
                <asp:Parameter Name="DDWriteupDate" />
                <asp:Parameter Name="SampleSend" />
                <asp:Parameter Name="RevenewShare" />
                <asp:Parameter Name="Type" />
                <asp:Parameter Name="SampleApprovaldate" />
                <asp:Parameter Name="Id" Type="Int32" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="Clientid" Type="Int32" />
                <asp:Parameter Name="SupplierId" Type="Int32" />
                <asp:Parameter Name="Auditor" />
                <asp:Parameter Name="Planner" />
                <asp:Parameter Name="LeadPlanner" />
                <asp:Parameter Name="DDLead" />
                <asp:Parameter Name="DDSpend" />
                <asp:Parameter Name="StatusId" />
                <asp:Parameter Name="NotificationLetterDate" />
                <asp:Parameter Name="ContractReceiptDate" />
                <asp:Parameter Name="Data_Received_Date" />
                <asp:Parameter Name="COQDate" />
                <asp:Parameter Name="AuditorKickOff" />
                <asp:Parameter Name="scheduleddate" />
                <asp:Parameter Name="DDWriteupDate" />
                <asp:Parameter Name="SampleSend" />
                <asp:Parameter Name="RevenewShare" />
                <asp:Parameter Name="Type" />
                <asp:Parameter Name="SampleApprovaldate" />
                <asp:Parameter Name="Status" />
            </InsertParameters>
            <SelectParameters>
                <asp:Parameter Name="userid" Type="string" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
        </asp:SqlDataSource>
        <%--<dx:ASPxButton ID="btnNew" runat="server" Text="New" AutoPostBack="false">
                            <ClientSideEvents Click="function (s, e) { OnNewClick(s, e); }" />
                        </dx:ASPxButton>--%>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:CCUpdate %>"
            SelectCommand="select * from CC_Status where act_Inact_ind = 'A' ORDER BY sortorderPlanningWeb ASC" InsertCommand="INSERT INTO CC_Planning_History values(@TrackingID, @StatusID, GETDATE(), @User)">
            <InsertParameters>
                <asp:Parameter Name="TrackingID" Type="Int32" />
                <asp:Parameter Name="User" Type="String" />
                <asp:Parameter Name="StatusID" Type="Int32" />
            </InsertParameters>
            </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:CCUpdate %>"
        SelectCommand="select * from CC_ClientMaster ORDER BY ClientName ASC"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:CCUpdate %>"
        SelectCommand="select * from CC_SupplierMaster ORDER BY supplierName ASC" InsertCommand="INSERT INTO CC_SupplierMaster(supplierName, Act_Inact_Ind, SupplierType, Mod_Dttm) values(@supplierName, @Act_Inact_Ind, @SupplierType, @Mod_Dttm)" 
        UpdateCommand="UPDATE CC_SupplierMaster SET supplierName=@supplierName, Act_Inact_Ind=@Act_Inact_Ind, SupplierType=@SupplierType, Mod_Dttm=@Mod_Dttm where supplierid=@supplierid">
        <UpdateParameters>
                <asp:Parameter Name="supplierid" Type="Int32" />
                <asp:Parameter Name="SupplierName" />
                <asp:Parameter Name="Act_Inact_Ind" />
                <asp:Parameter Name="SupplierType" />
                <asp:Parameter Name="Mod_Dttm" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="SupplierName" />
                <asp:Parameter Name="Act_Inact_Ind" />
                <asp:Parameter Name="SupplierType" />
                <asp:Parameter Name="Mod_Dttm" />
            </InsertParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:CCUpdate %>"
        SelectCommand="select * from Employees where businessunit='CC' and IsPlanner <> 0 and (Active_ind = 'A') ORDER BY Employee ASC"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:CCUpdate %>"
        SelectCommand="select * from Employees WHERE ([Is CC] <> 0) AND IsAuditor <> 0 ORDER BY Employee ASC"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:CCUpdate %>"
        SelectCommand="select Employee from employees where IsDD<>0"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDSEmployee" runat="server" ConnectionString="<%$ ConnectionStrings:CCUpdate %>"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDSHistoryList" runat="server" ConnectionString="<%$ ConnectionStrings:CCUpdate %>"
            SelectCommand="SELECT row_number() OVER (ORDER BY TrackingID) SequenceNo, TrackingID, CC_Planning_History.StatusID, CC_Status.Status, convert(varchar,CC_Planning_History.DateTimeStamp,110) DateTimeStamp
FROM CC_Planning_History INNER JOIN CC_Status ON CC_Planning_History.StatusID = CC_Status.StatusId
WHERE CC_Planning_History.TrackingID = @TrackingID
ORDER BY CC_Planning_History.StatusID">
            <SelectParameters>
                <asp:Parameter Name="TrackingID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <dx:ASPxGridView OnCustomColumnSort="grid2_CustomColumnSort" OnClientLayout="grid2_ClientLayout" CssClass="TopMargin" ID="grid2" ClientInstanceName="grid2" OnHeaderFilterFillItems="grid2_HeaderFilterFillItems" OnCommandButtonInitialize="grid2_CommandButtonInitialize" SettingsEditing-EditFormColumnCount="5" runat="server" DataSourceID="SqlDataSource3" KeyFieldName="Id" OnAfterPerformCallback="grid2_AfterPerformCallback" OnStartRowEditing="grid2_StartRowEditing" OnCellEditorInitialize="grid2_CellEditorInitialize" Width="100%" EnableRowsCache="False" OnInitNewRow="grid2_InitNewRow" OnRowUpdating="grid2_OnRowUpdating">
        <%--<ClientSideEvents CustomButtonClick="function(s, e) {if(e.buttonID == 'myButton3'){alert();grid2.AddNewRow();alert();}}" />--%>
        <ClientSideEvents EndCallback="OnEndCallBack2" BeginCallback="function(s,e){
            if(e.command=='UPDATEEDIT'){OnEndCallBack2(s,e);}}" CustomButtonClick="function(s, e) { if(e.buttonID == 'myButton'){ASPxHiddenField1.Set('index', e.visibleIndex);s.StartEditRow(e.visibleIndex);}}" />
        <Columns>
            <dx:GridViewCommandColumn ShowDeleteButton="true" Caption=" " VisibleIndex="0">
            </dx:GridViewCommandColumn>
            <dx:GridViewCommandColumn ShowNewButtonInHeader="true" Caption=" " VisibleIndex="1">
                <CustomButtons>
                    <dx:GridViewCommandColumnCustomButton ID="myButton" Text="Edit">
                    </dx:GridViewCommandColumnCustomButton>
                </CustomButtons>
            </dx:GridViewCommandColumn>
            <dx:GridViewDataComboBoxColumn Visible="True" VisibleIndex="2" Caption="Client" FieldName="Clientid" EditFormCaptionStyle-Font-Bold="true" PropertiesComboBox-EnableCallbackMode="True">
                <PropertiesComboBox DataSourceID="SqlDataSource5" TextField="ClientName" ValueField="Clientid">
                </PropertiesComboBox>
                <EditFormCaptionStyle Font-Bold="True">
                </EditFormCaptionStyle>
                <EditFormSettings ColumnSpan="2" Visible="True" VisibleIndex="0" />
                <Settings AllowAutoFilter="Default" AllowSort="True" SortMode="DisplayText" />
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn Visible="True" VisibleIndex="3" Caption="Supplier" FieldName="SupplierId" EditFormCaptionStyle-Font-Bold="true" PropertiesComboBox-EnableCallbackMode="True">
                <PropertiesComboBox DataSourceID="SqlDataSource6" TextField="supplierName" ValueField="SupplierId">
                </PropertiesComboBox>
                <EditFormCaptionStyle Font-Bold="True">
                </EditFormCaptionStyle>
                <EditFormSettings ColumnSpan="2" Visible="True" VisibleIndex="1" />
                <Settings AllowAutoFilter="Default" AllowSort="True" SortMode="DisplayText" />
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn Visible="True" VisibleIndex="4" Caption="Auditor" FieldName="Auditor" EditFormCaptionStyle-Font-Bold="true" PropertiesComboBox-EnableCallbackMode="True">
	            <PropertiesComboBox DataSourceID="SqlDataSource8" TextField="Employee" ValueField="Employee">
	            </PropertiesComboBox>
	            <EditFormCaptionStyle Font-Bold="True">
	            </EditFormCaptionStyle>
	            <EditFormSettings ColumnSpan="2" Visible="True" VisibleIndex="5" />
	            <Settings AllowHeaderFilter="False" />
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn Visible="True" VisibleIndex="5" Caption="Planner" FieldName="Planner" EditFormCaptionStyle-Font-Bold="true" PropertiesComboBox-EnableCallbackMode="True">
	            <PropertiesComboBox DataSourceID="SqlDataSource7" TextField="Employee" ValueField="Employee">
	            </PropertiesComboBox>
	            <EditFormCaptionStyle Font-Bold="True">
	            </EditFormCaptionStyle>
	            <EditFormSettings ColumnSpan="2" Visible="True" VisibleIndex="6" />
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataTextColumn Visible="True" VisibleIndex="6" Caption="DD Lead" FieldName="DDLead">
	            <PropertiesTextEdit DisplayFormatInEditMode="True" DisplayFormatString="C2">
	            </PropertiesTextEdit>
	            <EditFormSettings ColumnSpan="2" Visible="True" VisibleIndex="7" />
	            <Settings AllowHeaderFilter="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="DD Spend" FieldName="DDSpend" Visible="True" VisibleIndex="6">
	            <PropertiesTextEdit DisplayFormatInEditMode="True" DisplayFormatString="C2">
	            </PropertiesTextEdit>
	            <EditFormSettings ColumnSpan="2" Visible="True" VisibleIndex="3" />
	            <Settings AllowHeaderFilter="False" />
            </dx:GridViewDataTextColumn>

            <dx:GridViewDataComboBoxColumn Visible="True" VisibleIndex="7" Caption="Planning Status" FieldName="StatusId" EditFormCaptionStyle-Font-Bold="true" PropertiesComboBox-EnableCallbackMode="True">
	            <PropertiesComboBox DataSourceID="SqlDataSource4" TextField="Status" ValueField="StatusId">
	             <ClientSideEvents SelectedIndexChanged="function(s, e) {
	                 if(grid2.GetEditor('StatusId').GetValue()=='10'){
		                grid2.GetEditor('ContractReceiptDate').SetValue(new Date());
	                 }
	                 if(grid2.GetEditor('StatusId').GetValue()=='12'){
		                grid2.GetEditor('scheduleddate').SetValue(new Date());
	                 }
	                 if(grid2.GetEditor('StatusId').GetValue()=='18'){
		                grid2.GetEditor('NotificationLetterDate').SetValue(new Date());
	                 }
	                 if(grid2.GetEditor('StatusId').GetValue()=='24'){
		                grid2.GetEditor('DDWriteupDate').SetValue(new Date());
	                 }
                     if(grid2.GetEditor('StatusId').GetValue()=='19'){
                        TPclb.PerformCallback(s.GetValue());
                        pcDDFailedReason.Show();
	                 }else{
	                    clb.PerformCallback(s.GetValue())
                     }
	             }" />
	            </PropertiesComboBox>
	            <EditFormCaptionStyle Font-Bold="True">
	            </EditFormCaptionStyle>
	            <EditFormSettings ColumnSpan="2" Visible="True" VisibleIndex="8" />
                <Settings SortMode="Custom" />
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataDateColumn Visible="True" VisibleIndex="9" FieldName="NotificationLetterDate" ShowInCustomizationForm="True">
	            <PropertiesDateEdit DisplayFormatString="MM/dd/yyyy" EditFormatString="MM/dd/yyyy"></PropertiesDateEdit>
	            <EditFormSettings ColumnSpan="2" Visible="True" VisibleIndex="12" />
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataDateColumn FieldName="ContractReceiptDate" ShowInCustomizationForm="True" Visible="False">
	            <PropertiesDateEdit DisplayFormatString="MM/dd/yyyy" EditFormat="Date"></PropertiesDateEdit>
	            <EditFormSettings ColumnSpan="2" Visible="True" VisibleIndex="9" />
            </dx:GridViewDataDateColumn>
            
            <dx:GridViewDataDateColumn FieldName="COQDate" ShowInCustomizationForm="True" Visible="False">
	            <PropertiesDateEdit DisplayFormatString="MM/dd/yyyy" EditFormat="Date"></PropertiesDateEdit>
	            <EditFormSettings ColumnSpan="2" Visible="True" VisibleIndex="11" />
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataDateColumn Visible="True" VisibleIndex="10" Caption="Kick Off Date" FieldName="scheduleddate" ShowInCustomizationForm="True">
	            <PropertiesDateEdit DisplayFormatString="MM/dd/yyyy" EditFormat="Date"></PropertiesDateEdit>
	            <EditFormSettings ColumnSpan="2" Visible="True" VisibleIndex="16" />
	            <Settings AllowHeaderFilter="False" />
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataDateColumn FieldName="Data_Received_Date" Caption="Data Received Date" ShowInCustomizationForm="True" Visible="False">
	            <PropertiesDateEdit DisplayFormatString="MM/dd/yyyy" EditFormat="Date"></PropertiesDateEdit>
	            <EditFormSettings ColumnSpan="2" Visible="True" VisibleIndex="13" />
            </dx:GridViewDataDateColumn>

            <dx:GridViewDataComboBoxColumn Visible="True" VisibleIndex="11" Caption="Lead Planner" FieldName="LeadPlanner" EditFormCaptionStyle-Font-Bold="true" PropertiesComboBox-EnableCallbackMode="True">
	            <PropertiesComboBox DataSourceID="SqlDataSource7" TextField="Employee" ValueField="Employee">
	            </PropertiesComboBox>
	            <EditFormCaptionStyle Font-Bold="True">
	            </EditFormCaptionStyle>
	            <EditFormSettings ColumnSpan="2" Visible="True" VisibleIndex="4" />
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn Caption="Fixed Fee/Gain Share" FieldName="Type" Visible="True" VisibleIndex="12">
	            <PropertiesComboBox TextField="" ValueField="">
		            <Items>
			            <dx:ListEditItem Text="Gain Share" Value="Gain Share" />
			            <dx:ListEditItem Text="Fixed Fee" Value="Fixed Fee" />
		            </Items>
	            </PropertiesComboBox>
	            <EditFormSettings ColumnSpan="2" Visible="True" VisibleIndex="2" />
	            <Settings AllowHeaderFilter="False" />
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataDateColumn FieldName="DDWriteupDate" ShowInCustomizationForm="True" Visible="False">
	            <PropertiesDateEdit DisplayFormatString="MM/dd/yyyy" EditFormat="Date"></PropertiesDateEdit>
	            <EditFormSettings ColumnSpan="2" Visible="True" VisibleIndex="10" />
            </dx:GridViewDataDateColumn>

            <dx:GridViewDataDateColumn FieldName="SampleSend" Caption="Sample Issued Date" Visible="False" ShowInCustomizationForm="True">
	            <PropertiesDateEdit DisplayFormatString="MM/dd/yyyy" EditFormat="Date"></PropertiesDateEdit>
	            <EditFormSettings ColumnSpan="2" Visible="True" VisibleIndex="15" />
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataDateColumn FieldName="SampleApprovaldate" Caption="Sample Approved Date" Visible="False" ShowInCustomizationForm="True">
	            <PropertiesDateEdit DisplayFormatString="MM/dd/yyyy" EditFormat="Date"></PropertiesDateEdit>
	            <EditFormSettings ColumnSpan="2" Visible="True" VisibleIndex="14" />
            </dx:GridViewDataDateColumn>

            <dx:GridViewDataTextColumn Visible="False">
	             <EditFormSettings Visible="True" RowSpan="9" VisibleIndex="3" />
	             <EditItemTemplate>
		            <dx:ASPxListBox ID="ASPxListBox1" runat="server" DataSourceID="SqlDSHistoryList"
			             ValueField="TrackingID" ValueType="System.Int32" Height="220px" CssClass="PullListUp" ItemStyle-Border-BorderColor="White" ItemStyle-Border-BorderStyle="None" Border-BorderStyle="Solid" CaptionCellStyle-BackColor="#DCDCDC" Border-BorderColor="Blue">
			            <Columns>
				            <dx:ListBoxColumn FieldName="SequenceNo" Caption=" " Width="15px" />
				            <dx:ListBoxColumn FieldName="Status" Caption="Status" Width="180px" />
				            <dx:ListBoxColumn FieldName="DateTimeStamp" Caption="Date" Width="68px" />
			            </Columns>
		            </dx:ASPxListBox>
	              </EditItemTemplate>
	            <Settings AllowHeaderFilter="False" />
            </dx:GridViewDataTextColumn>

            <dx:GridViewDataTextColumn Visible="False">
	            <EditFormSettings ColumnSpan="5" Visible="True" VisibleIndex="50" />
	            <EditItemTemplate>
		            <dx:ASPxButton ID="ASPxButton2" runat="server" Text="Close" AutoPostBack="false">
			            <ClientSideEvents Click="function(s, e) { grid2.CancelEdit();}" />
		            </dx:ASPxButton>
		            <dx:ASPxButton ID="ASPxButton1" runat="server" Text="Update" AutoPostBack="false">
			            <ClientSideEvents Click="function(s, e) { if(grid2.GetEditor('StatusId').GetValue()=='12' && grid2.GetEditor('Auditor').GetValue()==null){ alert('Please select the auditor'); } else {grid2.UpdateEdit();} }" />
		            </dx:ASPxButton>
		            <dx:ASPxButton ID="ASPxButton4" runat="server" Text="Next>" AutoPostBack="false">
			            <ClientSideEvents Click="function(s,e){grid2.StartEditRow(ASPxHiddenField1.Get('index')+1); ASPxHiddenField1.Set('index', ASPxHiddenField1.Get('index')+1)}" />
		            </dx:ASPxButton>
		            <dx:ASPxButton ID="ASPxButton3" runat="server" Text="<Previous" AutoPostBack="false">
			            <ClientSideEvents Click="function(s,e){grid2.StartEditRow(ASPxHiddenField1.Get('index')-1); ASPxHiddenField1.Set('index', ASPxHiddenField1.Get('index')-1)}" />
		            </dx:ASPxButton>
	            </EditItemTemplate>
            </dx:GridViewDataTextColumn>
        </Columns>
        <%--<SettingsDetail ShowDetailRow="True" />--%>
        <SettingsPager Mode="ShowAllRecords">
            </SettingsPager>
            <%--<SettingsBehavior ColumnResizeMode="Control" ConfirmDelete="true" />--%>
            <SettingsBehavior ColumnResizeMode="NextColumn" ConfirmDelete="true" />
            <ClientSideEvents ColumnResized="function(s, e) { e.processOnServer = true; }" />
            <SettingsEditing Mode="EditFormAndDisplayRow">
            </SettingsEditing>
            <%--<StylesPopup Common-Content-Border-BorderStyle="Double">
                <EditForm CloseButton-BackColor="Red">
                    <Header Font-Bold="true" Font-Size="Medium" HorizontalAlign="Center">
                    </Header>
                </EditForm>
            </StylesPopup>--%>
            <Settings HorizontalScrollBarMode="Auto" VerticalScrollBarMode="Visible" ShowFooter="True" ShowHeaderFilterButton="true" />
            <SettingsCookies CookiesID="SaveViewState" Version="1" Enabled="true" StoreColumnsWidth="True" StoreColumnsVisiblePosition="true" />
            <SettingsText PopupEditFormCaption="Tracking - Planner" />
            <%--<SettingsPopup>
                <EditForm HorizontalAlign="WindowCenter" Modal="True" VerticalAlign="WindowCenter"
                    Height="100%" MinHeight="100%" MinWidth="900px" AllowResize="True" ResizingMode="Postponed" />
            </SettingsPopup>--%>
            <SettingsDataSecurity AllowInsert="True" />
            <Styles>
                <Header BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Center"
                    Wrap="True">
                </Header>
            </Styles>
    </dx:ASPxGridView>
    <dx:ASPxHiddenField ID="ASPxHiddenField1" runat="server" ClientInstanceName="ASPxHiddenField1"></dx:ASPxHiddenField>
    <dx:ASPxHiddenField ID="hdnField" runat="server" ClientInstanceName="hdnField"></dx:ASPxHiddenField>
    </div>
    <script type="text/javascript">
        adjustSize();
    </script>
    <dx:ASPxPopupControl ID="supplier" runat="server" CloseAction="CloseButton" CloseOnEscape="true" Modal="True"
        PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ClientInstanceName="supplier"
        HeaderText="Supplier" AllowDragging="True" PopupAnimationType="None" EnableViewState="False">
        <ClientSideEvents PopUp="function(s, e) { }" Shown="function(s, e) { setTimeout(function() {s.UpdatePosition();}, 0);}" />
        <ContentCollection>
            <dx:PopupControlContentControl runat="server">
                <dx:ASPxGridView ID="gridSupplier" ClientInstanceName="gridSupplier" runat="server" DataSourceID="SqlDataSource6" KeyFieldName="supplierid" OnCellEditorInitialize="gridSupplier_CellEditorInitialize" EnableRowsCache="False" OnInitNewRow="gridSupplier_InitNewRow">
                    <Columns>
                        <dx:GridViewCommandColumn ShowEditButton="true" ShowNewButtonInHeader="true" VisibleIndex="0" Caption=" " />
                        <dx:GridViewDataTextColumn Caption="Supplier Name" FieldName="supplierName" VisibleIndex="1">
                            <PropertiesTextEdit DisplayFormatInEditMode="True" DisplayFormatString="C2">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <%--<dx:GridViewDataTextColumn Caption="Act_Inact_Ind" FieldName="Act_Inact_Ind" VisibleIndex="2">
                            <PropertiesTextEdit DisplayFormatInEditMode="True" DisplayFormatString="C2">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                         <dx:GridViewDataDateColumn Caption="Modified Date" FieldName="Mod_Dttm" ShowInCustomizationForm="True" VisibleIndex="3">
                            <PropertiesDateEdit DisplayFormatString="MM/dd/yyyy" EditFormat="Date"></PropertiesDateEdit>
                        </dx:GridViewDataDateColumn>--%>
                        <dx:GridViewDataTextColumn Caption="Supplier Type" FieldName="SupplierType" VisibleIndex="4">
                            <PropertiesTextEdit DisplayFormatInEditMode="True" DisplayFormatString="C2">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                    </Columns>
                   <SettingsPager Mode="ShowAllRecords">
                        </SettingsPager>
                        <SettingsBehavior ColumnResizeMode="Control" />
                        <SettingsEditing Mode="EditFormAndDisplayRow">
                        </SettingsEditing>
                        <Settings VerticalScrollBarMode="Visible" />
                        <SettingsText PopupEditFormCaption="Tracking - Planner" />
                        <SettingsDataSecurity AllowInsert="True" />
                        <Styles>
                            <Header BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Center"
                                Wrap="True">
                            </Header>
                        </Styles>
                </dx:ASPxGridView>
            </dx:PopupControlContentControl>
        </ContentCollection>
        <ContentStyle>
            <Paddings PaddingBottom="5px" />
        </ContentStyle>
    </dx:ASPxPopupControl>
    <dx:ASPxCallback ID="ASPxCallback1" runat="server" ClientInstanceName="clb" OnCallback="ASPxCallback1_Callback">
    </dx:ASPxCallback>
    <script type="text/javascript">
        adjustSizeSupplier();
    </script>


    <asp:SqlDataSource ID="DSMultiSource" runat="server" ConnectionString="<%$ ConnectionStrings:CCUpdate %>" 
    SelectCommand="CCMultiSource_sp" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:Parameter Name="source" Type="String" />
        </SelectParameters>
        <UpdateParameters>
                <asp:Parameter Name="Id" Type="Int32" />
                <asp:Parameter Name="ClientId" />
                <asp:Parameter Name="SupplierId" />
                <asp:Parameter Name="StatusId" />
                <asp:Parameter Name="Planner" />
                <asp:Parameter Name="LeadPlanner" />
                <asp:Parameter Name="DDLead" />
                <asp:Parameter Name="DDSpend" />
                <asp:Parameter Name="ContractsReceived" />
                <asp:Parameter Name="DDWriteupDate" />
                <asp:Parameter Name="ContractOwner" />
                <asp:Parameter Name="Type" />
                <asp:Parameter Name="StatusDate" />
                <asp:Parameter Name="NotificationLetterDate" />
                <asp:Parameter Name="SampleApprovaldate" />
                <asp:Parameter Name="SampleSend" />
                <asp:Parameter Name="scheduleddate" />
                <asp:Parameter Name="COQDate" />
                <asp:Parameter Name="Auditor" />
                <asp:Parameter Name="Data_Received_Date" />
                <asp:Parameter Name="DDFailedReason" />
                <asp:Parameter Name="WriteUpGoal" />
            </UpdateParameters>
    </asp:SqlDataSource>
    <dx:ASPxGridView OnCustomColumnSort="MultiGrid_CustomColumnSort" OnClientLayout="MultiGrid_ClientLayout" Width="99%" SettingsEditing-EditFormColumnCount="5" OnStartRowEditing="MultiGrid_StartRowEditing" OnCommandButtonInitialize="MultiGrid_CommandButtonInitialize" OnRowUpdating="MultiGrid_OnRowUpdating" CssClass="MultiGridClass" ID="MultiGrid" ClientInstanceName="MultiGrid" runat="server" AutoGenerateColumns="true" DataSourceID="DSMultiSource" KeyFieldName="Id" OnAfterPerformCallback="MultiGrid_AfterPerformCallback" EnableRowsCache="False">
        <%--<Columns>
            
        </Columns>--%>
        <ClientSideEvents CustomButtonClick="function(s, e) { if(e.buttonID == 'EditBtn'){hdnField.Set('index', e.visibleIndex);s.StartEditRow(e.visibleIndex);}}" />
            <SettingsPager Mode="ShowAllRecords">
            </SettingsPager>
            <SettingsBehavior ColumnResizeMode="NextColumn" />
            <ClientSideEvents ColumnResized="function(s, e) { e.processOnServer = true; }" />
            <SettingsEditing Mode="EditFormAndDisplayRow">
            </SettingsEditing>
            <Settings VerticalScrollBarMode="Visible" ShowFooter="True" ShowHeaderFilterButton="true" />
            <SettingsCookies CookiesID="SaveViewState1" Version="2" Enabled="true" StoreColumnsWidth="True" StoreColumnsVisiblePosition="true" />
            <SettingsText PopupEditFormCaption="Tracking - Planner" />
            <SettingsDataSecurity AllowInsert="True" />
            <Styles>
                <Header BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" Wrap="True">
                </Header>
            </Styles>
            <Templates>
                <EditForm>
                <div style="text-align: right;">
                <dx:ASPxGridViewTemplateReplacement runat="server" ID="content" ReplacementType="EditFormContent" />
		            <dx:ASPxButton ID="PreviousBtn" runat="server" Text="<Previous" AutoPostBack="false">
			            <ClientSideEvents Click="function(s,e){MultiGrid.StartEditRow(hdnField.Get('index')-1); hdnField.Set('index', hdnField.Get('index')-1)}" />
		            </dx:ASPxButton>
                    <dx:ASPxButton ID="NextBtn" runat="server" Text="Next>" AutoPostBack="false">
			            <ClientSideEvents Click="function(s,e){MultiGrid.StartEditRow(hdnField.Get('index')+1); hdnField.Set('index', hdnField.Get('index')+1)}" />
		            </dx:ASPxButton>
                    <dx:ASPxButton ID="UpdateBtn" runat="server" Text="Update" AutoPostBack="false">
                        <ClientSideEvents Click="function(s, e) { MultiGrid.UpdateEdit(); }" />
                    </dx:ASPxButton>
                    <dx:ASPxButton ID="CancelBtn" runat="server" Text="Close" AutoPostBack="false">
                        <ClientSideEvents Click="function(s, e) { MultiGrid.CancelEdit();}" />
                    </dx:ASPxButton>
                    </div>
                </EditForm>
            </Templates>
    </dx:ASPxGridView>
    <script type="text/javascript">
        AdjustMultiGridSize();
    </script>
    <dx:ASPxCallback ID="ASPxCallback2TP" runat="server" ClientInstanceName="TPclb" OnCallback="ASPxCallback2TP_Callback">
    </dx:ASPxCallback>

    <dx:ASPxPopupControl ID="pcDDFailedReason" runat="server" CloseAction="CloseButton" CloseOnEscape="true" Modal="True"
        PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ClientInstanceName="pcDDFailedReason"
        HeaderText="Enter DD Failed Reason" AllowDragging="True" PopupAnimationType="None" EnableViewState="False" Width="250px" Height="200px">
        <ClientSideEvents PopUp="function(s, e) { ASPxClientEdit.ClearGroup('entryGroup'); textarea.Focus(); }" />
        <ContentCollection>
            <dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
                <dx:ASPxPanel ID="Panel1" runat="server" DefaultButton="btOK">
                    <PanelCollection>
                        <dx:PanelContent ID="PanelContent1" runat="server">
                            <table>
                                <tr>
                                    <td class="pcmCellText">
                                        <%--<dx:ASPxTextBox ID="tbDDReason" runat="server" Width="150px" ClientInstanceName="tbDDReason">
                                            <ValidationSettings EnableCustomValidation="True" ValidationGroup="entryGroup" SetFocusOnError="True"
                                                ErrorDisplayMode="Text" ErrorTextPosition="Bottom" CausesValidation="True">
                                                <RequiredField ErrorText="Reason required" IsRequired="True" />
                                                <ErrorFrameStyle Font-Size="10px">
                                                    <ErrorTextPaddings PaddingLeft="0px" />
                                                </ErrorFrameStyle>
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>--%>
                                        <dx:ASPxMemo runat="server" ID="textarea" Width="230px" Height="70px">
                                            <ValidationSettings EnableCustomValidation="True" ValidationGroup="entryGroup" SetFocusOnError="True"
                                                ErrorDisplayMode="Text" ErrorTextPosition="Bottom" CausesValidation="True">
                                                <RequiredField ErrorText="* Reason required" IsRequired="True" />
                                                <ErrorFrameStyle Font-Size="10px">
                                                    <ErrorTextPaddings PaddingLeft="0px" />
                                                </ErrorFrameStyle>
                                            </ValidationSettings>
                                        </dx:ASPxMemo>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <div class="pcmButton">
                                            <dx:ASPxButton CssClass="AlignButtonCenter" HorizontalAlign="Center" ID="btOK" runat="server" Text="OK" Width="80px" AutoPostBack="False">
                                                <ClientSideEvents Click="function(s, e) { if(ASPxClientEdit.ValidateGroup('entryGroup')){ TPclb.PerformCallback('UpdateDDRessonField'); pcDDFailedReason.Hide(); }}" />
                                            </dx:ASPxButton>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </dx:PanelContent>
                    </PanelCollection>
                </dx:ASPxPanel>
            </dx:PopupControlContentControl>
        </ContentCollection>
        <ContentStyle>
            <Paddings PaddingBottom="5px" />
        </ContentStyle>
    </dx:ASPxPopupControl>
</asp:Content>
