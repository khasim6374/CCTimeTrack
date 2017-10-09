<%@ Page Language="VB" Debug="True" AutoEventWireup="false" Inherits="CCTimeTrack.StatusUpdate"
    MasterPageFile="~/Site.Master" MaintainScrollPositionOnPostback="true" CodeBehind="StatusUpdate.aspx.vb" %>

<%@ Register Assembly="DevExpress.Web.v15.1, Version=15.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <style type="text/css">
        body
        {
            overflow: hidden;
        }
        .dxeListBox td.dxeLTM,
        .dxeListBox td.dxeTM,
        .dxeListBox td.dxeMIM
        {
            border-style: none !important; 
        }
    </style>
    <script type="text/javascript">
        function adjustSize() {
            var width = Math.max(0, document.documentElement.clientWidth);
            var height = Math.max(0, document.documentElement.clientHeight);
            grid.SetHeight(height - 106);
            if (hidden)
                grid.SetWidth($(window).innerWidth() - 12);
            else
                grid.SetWidth($(window).innerWidth() - 216);
            grid.AdjustControl();
        }

        function showPopup(id, clnt, splr, adtr) {
            pnlPlanningScoreCard.SetContentUrl('PlanningScoreCard.aspx?tid=' + id + '&c=' + clnt + '&s=' + splr + '&a=' + adtr);
            pnlPlanningScoreCard.Show();
        }
        function uploadFile(id) {
            var clientName = $("#lblClientName").html();
            var supName = $("#lblSupplierName").html();
            pnlPlanningScoreCard.SetContentUrl('fileUpload.aspx?id=' + id + "&c=" + encodeURIComponent(clientName) + "&s=" + encodeURIComponent(supName));
            pnlPlanningScoreCard.SetHeaderText("SMI File Upload");
            pnlPlanningScoreCard.SetSize(650, 520);
            pnlPlanningScoreCard.Show();
        }
        function refreshGrid() {
            grid.Refresh();
            pnlPlanningScoreCard.Hide();
        }
        function updateView() {
            adjustSize();
        }
        function OnEndCallBack(s, e) {
            alertMe();
            if (e.command == "UPDATEEDIT") { setTimeout(function () { msg2.SetText(''); msg.SetText('Data updated successfully...'); }, 500); }
           // msg.SetText('Data updated successfully...');
        }
        function OnSelectedIndexChanged(s, e) {
            console.log(s); console.log("--"+e.isSelected)
            if (e.isSelected) {
                if (e.index == 0) {
                    console.log("----" + e.isSelected)
                    cbList.SelectIndices([0]);
                    cbList.UnselectIndices([1]);
                    ASPxHiddenField2.Set('val', "1");console.log("=1=");
                } else {
                    console.log("---" + e.isSelected)
                    cbList.SelectIndices([1]);
                    cbList.UnselectIndices([0]);
                    ASPxHiddenField2.Set('val', "0"); console.log("=2=");
                }
            } else {
                ASPxHiddenField2.Set('val', null); console.log("=3=");
            }
        }
//        function SetComboBox(s) {
//            ASPxHiddenField3.Set('val', s.GetSelectedItem().value);
//        }
        function OnUpdateClick(s, e) {
            //console.log(grid.GetEditor("AuditorStatus").GetValue() + "---" + grid.GetEditor("FPReason").GetValue()+"==="+ASPxHiddenField2.Get('val'));
            if (grid.GetEditor("AuditorStatus").GetValue() == 12) {
                if (ASPxHiddenField2.Get('val') == 'undefined' || ASPxHiddenField2.Get('val') == null) {
                    setTimeout(function () {
                        msg.SetText('');
                        msg2.SetText('Please select fully planned reason.');
                    }, 300);
                } else {
                    if (ASPxHiddenField2.Get('val') == '0' && (grid.GetEditor("FPReason").GetValue() == null || grid.GetEditor("FPReason").GetValue() == 'undefined')) {
                        if (checkListBox.GetSelectedItems().length == 0) {
                            setTimeout(function () {
                                msg.SetText('');
                                msg2.SetText('Please select reason.');
                            }, 300);
                        } else {
                            grid.UpdateEdit();
                        }
                    } else {
                        grid.UpdateEdit();
                    }
                }
            } else {
                if (ASPxHiddenField2.Get('val') == '0' && (grid.GetEditor("FPReason").GetValue() == null || grid.GetEditor("FPReason").GetValue() == 'undefined')) {
                    if (checkListBox.GetSelectedItems().length == 0) {
                        setTimeout(function () {
                            msg.SetText('');
                            msg2.SetText('Please select reason.');
                        }, 300);
                    } else {
                        grid.UpdateEdit();     
                    }
                } else {
                    grid.UpdateEdit();
                }
            }
        }





        var textSeparator = ";";
        function OnListBoxSelectionChanged(listBox, args) {
            if (args.index == 0)
                args.isSelected ? listBox.SelectAll() : listBox.UnselectAll();
            UpdateSelectAllItemState();
            UpdateText();
        }
        function UpdateSelectAllItemState() {
            IsAllSelected() ? checkListBox.SelectIndices([0]) : checkListBox.UnselectIndices([0]);
        }
        function IsAllSelected() {
            var selectedDataItemCount = checkListBox.GetItemCount() - (checkListBox.GetItem(0).selected ? 0 : 1);
            return checkListBox.GetSelectedItems().length == selectedDataItemCount;
        }
        function UpdateText() {
            var selectedItems = checkListBox.GetSelectedItems();
            checkComboBox.SetText(GetSelectedItemsText(selectedItems));
            console.log("-->" + GetSelectedItemsText(selectedItems));
            console.log("==>>" + checkListBox.GetSelectedItems().length);
            if (checkListBox.GetSelectedItems().length == 0) {
                ASPxHiddenField3.Set('val', null);
                grid.GetEditor("FPReason").SetValue(null);
            }
        }
        function SynchronizeListBoxValues(dropDown, args) {
            checkListBox.UnselectAll();
            var texts = dropDown.GetText().split(textSeparator);
            var values = GetValuesByTexts(texts);
            checkListBox.SelectValues(values);
            UpdateSelectAllItemState();
            UpdateText(); // for remove non-existing texts
        }
        function GetSelectedItemsText(items) {
            var texts = [], text = null;
            for (var i = 0; i < items.length; i++) {
                if (items[i].index != 0) {
                    texts.push(items[i].text);
                    if (text) {
                        text = text + ";" + items[i].text;
                    } else {
                        text = items[i].text;
                    }
                }
            }
            ASPxHiddenField3.Set('val', text); console.log("GetSelectedItemsText");
            return texts.join(textSeparator);
        }
        function GetValuesByTexts(texts) {
            var actualValues = [];
            var item;
            for (var i = 0; i < texts.length; i++) {
                item = checkListBox.FindItemByText(texts[i]);
                if (item != null)
                    actualValues.push(item.value);
            }
            return actualValues;
        }

        function alertMe() {
            setTimeout(function () {
                //alert(grid.GetEditor("FPReason").GetValue());
                $(grid.GetEditor("FPReason").mainElement).parents("table").first().hide()
                var str = grid.GetEditor("FPReason").GetValue();
                if (cbList.savedSelectedIndex==0) {
                    ASPxHiddenField2.Set('val', "1");
                }
                if (cbList.savedSelectedIndex == 1) {
                    ASPxHiddenField2.Set('val', "0");
                }
                var str_array = str.split(';');
                var obj = { "0": "(Select all)", "1": "Incomplete Contracts", "2": "Incomplete Payroll", "3": "Incomplete Supporting Documentation", "4": "No Line Item Data", "5": "No Pay History Data", "6": "No Aging Statement", "7": "Other" };
                var arr = [];
                var arrayOfIndices = new Array();
                for (var i = 0; i < str_array.length; i++) {
                    str_array[i] = str_array[i].replace(/^\s*/, "").replace(/\s*$/, "");
                    //alert(str_array[i]);
                    for (var n in obj) {
                        //obj[n];
                        if (obj[n] == str_array[i]) {
                            arrayOfIndices[i] = parseInt(n);
                        }
                    }
                }
                //arrayOfIndices[0] = 1;
                //arrayOfIndices[1] = 3;
                checkListBox.SelectIndices(arrayOfIndices);
                var selectedItems = checkListBox.GetSelectedItems();
                checkComboBox.SetText(GetSelectedItemsText(selectedItems));
                console.log("-->" + GetSelectedItemsText(selectedItems));
            }, 1000);
        }
    </script>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div class="headerbar">
        <div class="tblHeadding">
            Status Update</div>
        <%--<div style="float: right; padding: 5px">
            <a href="CompletedAudits.aspx">Completed Audits</a> | <a href="AuditTest.aspx">Audit
                Tests</a>
        </div>--%>
    </div>
    <div style="overflow: auto; clear: both" id="divmain">
        <asp:SqlDataSource ID="EmployeeDS" runat="server" ConnectionString="<%$ ConnectionStrings:CCUpdate %>"
        SelectCommand="select * from Employees where businessunit='CC' ORDER BY Employee ASC"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CCUpdate %>"
            SelectCommand="WebUpdateCCTrack_sp" SelectCommandType="StoredProcedure" UpdateCommand="UPDATE CC_TrackingMain SET Percentcomplete =@Percentcomplete, 
                                    AuditorStatus = @AuditorStatus, 
                                    AuditorWat =@current_status_action_items, 
                                    TravelBookDate = @TravelBookDate,
                                    AuditorKickOff =@AuditorKickOff,
                                    AccrualAmount =@AccrualAmount,
                                    AmouniIdentified =@AmouniIdentified,
                                    TargetGrossRecovery = @TargetGrossRecovery,
                                    TargetRevenewShare = @TargetRevenewShare,
                                    ActualRevenewShare = @ActualRevenewShare,
                                    ActualDraftReport =@ActualDraftReport, 
                                    TargetSettlementDate =@TargetSettlementDate, 
                                    ActualFinalReport =@ActualFinalReport, 
                                    ActualSettlementDate =@ActualSettlementDate ,
                                    StatusDate  = @statusdate,
                                    StatusDescription = @StatusDescription, 
                                    IssuesIdentifiedandamount= @IssuesIdentifiedandamount,
                                    ActionItemLead= @ActionItemLead,
                                    ActualGrossRecovery= @ActualGrossRecovery,
                                    FullyPlanned = @FullyPlanned,
                                    Comments=@Comments,
                                    Planner = @Planner,
                                    FPReason=@FPReason,
                                    ARComment =@ARComment
                                    WHERE Id=@Id" InsertCommand="INSERT INTO CC_AuditorStatus_History values(@TrackingID, @StatusID, GETDATE(), @User)">
            <UpdateParameters>
                <asp:Parameter Name="Percentcomplete" />
                <asp:Parameter Name="AuditorStatus" />
                <asp:Parameter Name="AuditorWat" />
                <asp:Parameter Name="TravelBookDate" />
                <asp:Parameter Name="AuditorKickOff" />
                 <asp:Parameter Name="AccrualAmount" />
                <asp:Parameter Name="AmouniIdentified" />
                <asp:Parameter Name="TargetGrossRecovery" />
                <asp:Parameter Name="TargetRevenewShare" />
                <asp:Parameter Name="ActualRevenewShare" />
                <asp:Parameter Name="ActualDraftReport" />
                <asp:Parameter Name="TargetSettlementDate" />
                <asp:Parameter Name="ActualFinalReport" />
                <asp:Parameter Name="ActualSettlementDate" />
                <asp:Parameter Name="current_status_action_items" />
                <asp:Parameter Name="statusdate" />
                <asp:Parameter Name="StatusDescription" />
                <asp:Parameter Name="IssuesIdentifiedandamount" />
                <asp:Parameter Name="ActualGrossRecovery" />
                <asp:Parameter Name="ActionItemLead" />
                <asp:Parameter Name="FullyPlanned" />
                <asp:Parameter Name="Comments" />
                <asp:Parameter Name="Planner" />
                <asp:Parameter Name="FPReason" />
                <asp:Parameter Name="ARComment" />
                <asp:Parameter Name="Id" Type="Int32" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="TrackingID" Type="Int32" />
                <asp:Parameter Name="User" Type="String" />
                <asp:Parameter Name="StatusID" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:Parameter Name="userid" Type="string" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CCUpdate %>"
            SelectCommand="AuditorStatus_sp" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
        <%--<asp:SqlDataSource ID="DSFullyPlanned" runat="server" ConnectionString="<%$ ConnectionStrings:CCUpdate %>" SelectCommand="select * from FullyPlannedSelection"></asp:SqlDataSource>--%>
        <dx:ASPxGridView ID="ASPxGridView1" ClientInstanceName="grid" OnHeaderFilterFillItems="grid_HeaderFilterFillItems" OnCommandButtonInitialize="ASPxGridView1_CommandButtonInitialize" OnAfterPerformCallback="ASPxGridView1_AfterPerformCallback" OnRowValidating="ASPxGridView1_RowValidating"
            SettingsEditing-EditFormColumnCount="5" runat="server" AutoGenerateColumns="False"
            DataSourceID="SqlDataSource1" KeyFieldName="Id" Width="100%" OnStartRowEditing="ASPxGridView1_StartRowEditing" OnRowUpdating="ASPxGridView1_RowUpdating">
            <ClientSideEvents EndCallback="OnEndCallBack" BeginCallback="function(s,e){if(e.command=='UPDATEEDIT'){OnEndCallBack(s,e);}}" CustomButtonClick="function(s, e) {if(e.buttonID == 'myButton'){ASPxHiddenField1.Set('index', e.visibleIndex);s.StartEditRow(e.visibleIndex);}}" />
            <Columns>
                <dx:GridViewCommandColumn Width="13%" VisibleIndex="0" Caption=" ">
                    <HeaderTemplate>
                        <dx:ASPxButton ID="ExportReportBtn" runat="server" Text="Extract Report" AutoPostBack="false" OnClick="ExportToExcel">
                        </dx:ASPxButton>
                    </HeaderTemplate>
                    <CustomButtons>
                        <dx:GridViewCommandColumnCustomButton ID="myButton" Text="Edit">
                        </dx:GridViewCommandColumnCustomButton>
                    </CustomButtons>
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn Caption="Client" FieldName="ClientName" ReadOnly="True"
                    VisibleIndex="1" Width="15%">
                    <EditFormCaptionStyle ForeColor="White">
                    </EditFormCaptionStyle>
                    <EditFormSettings ColumnSpan="4" Caption="Audit" />
                    <EditItemTemplate>
                        <asp:Label ID="lblClientName" ClientIDMode="Static" runat="server" Font-Size="Small"
                            Text='<%# Eval("ClientName") %>' Font-Bold="true"></asp:Label>
                        -
                        <asp:Label ID="lblSupplierName" ClientIDMode="Static" runat="server" Font-Size="Small"
                            Text='<%# Eval("supplierName") %>' Font-Bold="true"></asp:Label>
                        -
                        <asp:Label ID="Label5" ClientIDMode="Static" runat="server" Font-Size="Small" Text='<%# Eval("Auditor") %>'
                            Font-Bold="true"></asp:Label>
                    </EditItemTemplate>
                    <Settings AllowHeaderFilter="True" />
                    <HeaderStyle Font-Bold="True" />
                </dx:GridViewDataTextColumn>

                <dx:GridViewDataTextColumn VisibleIndex="4" Visible="False">
                 <EditFormSettings Visible="True" RowSpan="10" />
                    <EditItemTemplate>
                 <dx:ASPxListBox ID="ASPxListBox1" runat="server" DataSourceID="SqlDSHistoryList"
                         ValueField="TrackingID" ValueType="System.Int32" Height="420px" ItemStyle-Border-BorderColor="White" ItemStyle-Border-BorderStyle="None" Border-BorderStyle="Solid" CaptionCellStyle-BackColor="#DCDCDC" Border-BorderColor="Blue">
                        <Columns>
                            <dx:ListBoxColumn FieldName="SequenceNo" Caption=" " Width="15px" />
                            <dx:ListBoxColumn FieldName="AuditorStatus" Caption="Status" Width="180px" />
                            <dx:ListBoxColumn FieldName="DateTimeStamp" Caption="Date" Width="68px" />
                        </Columns>
                    </dx:ASPxListBox>
                    </EditItemTemplate>
                     </dx:GridViewDataTextColumn>

                <dx:GridViewDataTextColumn Width="11%" Caption="Auditor" FieldName="Auditor" ReadOnly="True"
                    VisibleIndex="2" Visible="True">
                    <EditFormSettings ColumnSpan="2" Visible="False" />
                    <HeaderStyle Font-Bold="True" />
                    <Settings AllowHeaderFilter="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Width="15%" Caption="Supplier" FieldName="supplierName" ReadOnly="True"
                    VisibleIndex="3">
                    <EditFormSettings ColumnSpan="2" Visible="False" />
                    <HeaderStyle Font-Bold="True" />
                    <Settings AllowHeaderFilter="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Action Item Lead" EditFormCaptionStyle-Font-Bold="true"
                    FieldName="ActionItemLead" VisibleIndex="25" Visible="False">
                    <PropertiesTextEdit>
                        <ValidationSettings Display="Dynamic">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesTextEdit>
                    <EditFormSettings ColumnSpan="2" Visible="True" />
                    <EditFormCaptionStyle Font-Bold="True">
                    </EditFormCaptionStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataMemoColumn Caption="Status Description" EditFormCaptionStyle-Font-Bold="true"
                    Width="250px" FieldName="StatusDescription" VisibleIndex="19" Visible="False">
                    <PropertiesMemoEdit Height="100px">
                        <ValidationSettings Display="Dynamic">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesMemoEdit>
                    <EditFormSettings ColumnSpan="4" Visible="False" />
                    <EditFormCaptionStyle Font-Bold="True">
                    </EditFormCaptionStyle>
                </dx:GridViewDataMemoColumn>
                <dx:GridViewDataMemoColumn Caption="Current Status and Action Items" EditFormCaptionStyle-Font-Bold="true"
                    Width="150px" FieldName="current_status_action_items" VisibleIndex="24" Visible="False">
                    <PropertiesMemoEdit Height="100px">
                        <ValidationSettings Display="Dynamic">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesMemoEdit>
                    <EditFormSettings ColumnSpan="4" Visible="True" />
                    <EditFormCaptionStyle Font-Bold="True">
                    </EditFormCaptionStyle>
                </dx:GridViewDataMemoColumn>
                <dx:GridViewDataMemoColumn Caption="Issues Identified" Width="250px" Visible="False"
                    FieldName="IssuesIdentifiedandamount" EditFormCaptionStyle-Font-Bold="true" VisibleIndex="23">
                    <PropertiesMemoEdit Height="100px">
                        <ValidationSettings Display="Dynamic">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesMemoEdit>
                    <EditFormSettings ColumnSpan="4" Visible="True" />
                    <EditFormCaptionStyle Font-Bold="True">
                    </EditFormCaptionStyle>
                </dx:GridViewDataMemoColumn>
                <dx:GridViewDataTextColumn Caption="Accrual Amount" FieldName="AccrualAmount"
                    VisibleIndex="47" Visible="False">
                    <PropertiesTextEdit DisplayFormatInEditMode="True" DisplayFormatString="C2">
                    </PropertiesTextEdit>
                    <EditFormSettings ColumnSpan="2" Visible="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Amount Identified" FieldName="AmouniIdentified"
                    VisibleIndex="48" Visible="False">
                    <PropertiesTextEdit DisplayFormatInEditMode="True" DisplayFormatString="C2">
                    </PropertiesTextEdit>
                    <EditFormSettings ColumnSpan="2" Visible="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Target Gross Recovery" FieldName="TargetGrossRecovery"
                    VisibleIndex="51" Visible="False">
                    <PropertiesTextEdit DisplayFormatInEditMode="True" DisplayFormatString="C2">
                    </PropertiesTextEdit>
                    <EditFormSettings ColumnSpan="2" Visible="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Actual Gross Recovery" FieldName="ActualGrossRecovery"
                    VisibleIndex="52" Visible="False">
                    <PropertiesTextEdit DisplayFormatInEditMode="True" DisplayFormatString="C2">
                    </PropertiesTextEdit>
                    <EditFormSettings ColumnSpan="2" Visible="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Target Revenew Share" FieldName="TargetRevenewShare"
                    VisibleIndex="54" Visible="False">
                    <PropertiesTextEdit DisplayFormatInEditMode="True" DisplayFormatString="C2">
                    </PropertiesTextEdit>
                    <EditFormSettings ColumnSpan="2" Visible="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Actual Revenew Share" FieldName="ActualRevenewShare"
                    VisibleIndex="56" Visible="False">
                    <PropertiesTextEdit DisplayFormatInEditMode="True" DisplayFormatString="C2">
                    </PropertiesTextEdit>
                    <EditFormSettings ColumnSpan="2" Visible="True" />
                </dx:GridViewDataTextColumn>

                <dx:GridViewDataComboBoxColumn Width="11%" Caption="Planner" FieldName="Planner" EditFormCaptionStyle-Font-Bold="true"
                    VisibleIndex="15" PropertiesComboBox-EnableCallbackMode="True">
                    <PropertiesComboBox Width="250px" DataSourceID="EmployeeDS" TextField="Employee"
                        ValueField="ID">
                        <ValidationSettings Display="Dynamic">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesComboBox>
                    <EditFormCaptionStyle Font-Bold="True">
                    </EditFormCaptionStyle>
                    <EditFormSettings ColumnSpan="4" />
                    <Settings AllowHeaderFilter="True" />
                </dx:GridViewDataComboBoxColumn>

                <dx:GridViewDataComboBoxColumn Width="16%" Caption="Status" FieldName="AuditorStatus" EditFormCaptionStyle-Font-Bold="true"
                    VisibleIndex="16" PropertiesComboBox-EnableCallbackMode="True">
                    <PropertiesComboBox Width="250px" DataSourceID="SqlDataSource2" TextField="AuditorStatus"
                        ValueField="AuditorStatusId">
                        <ClientSideEvents SelectedIndexChanged="function(s, e) {clb.PerformCallback(s.GetValue())}" />
                        <ValidationSettings Display="Dynamic">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesComboBox>
                    <EditFormCaptionStyle Font-Bold="True">
                    </EditFormCaptionStyle>
                    <EditFormSettings ColumnSpan="4" />
                    <Settings AllowHeaderFilter="True" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataDateColumn Caption="Status Date" PropertiesDateEdit-DisplayFormatString="d"
                    PropertiesDateEdit-DisplayFormatInEditMode="true" FieldName="StatusDate" VisibleIndex="18"
                    Visible="True" Width="14%">
                    <PropertiesDateEdit DisplayFormatInEditMode="True">
                    </PropertiesDateEdit>
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn Caption="Target Settlement Date" EditFormCaptionStyle-Font-Bold="true"
                    PropertiesDateEdit-DisplayFormatString="d" PropertiesDateEdit-DisplayFormatInEditMode="true"
                    FieldName="TargetSettlementDate" VisibleIndex="63" Visible="False">
                    <PropertiesDateEdit>
                        <ValidationSettings Display="Dynamic">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesDateEdit>
                    <EditFormSettings ColumnSpan="2" Visible="True" />
                    <EditFormCaptionStyle Font-Bold="True">
                    </EditFormCaptionStyle>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn Caption=" " VisibleIndex="87" EditFormSettings-Visible="False"
                    Width="14%">
                    <PropertiesTextEdit>
                        <Style HorizontalAlign="Center">
                            
                        </Style>
                    </PropertiesTextEdit>
                    <DataItemTemplate>
                        <div style="text-align: center">
                            <a href="javascript:void();" onclick="showPopup('<%# Eval("Id")%>','<%# Eval("ClientName")%>','<%# Eval("supplierName")%>','<%# Eval("Auditor")%>');">
                                Planning ScoreCard</a></div>
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataCheckColumn Caption="Fully Planned" FieldName="Fullyplanned" Visible="true" VisibleIndex="87" Width="7%">
                    <EditFormSettings ColumnSpan="2" Visible="false" />
                </dx:GridViewDataCheckColumn>
                <%--<dx:GridViewDataColumn Caption="Details" VisibleIndex="8" Width="15%">
                <DataItemTemplate>
                 <dx:ASPxRadioButtonList ID="ASPxRadioButtonList1" runat="server" SelectedIndex="0">
                <Items>
                    <dx:ListEditItem Text="some text 1" Selected="True" />
                    <dx:ListEditItem Text="some text 2"  />
                </Items>
            </dx:ASPxRadioButtonList>
                </DataItemTemplate>
            </dx:GridViewDataColumn>--%>
            <dx:GridViewDataTextColumn VisibleIndex="85" EditFormSettings-ColumnSpan="6" FieldName="Fullyplanned" Caption="Fully Planned">
                    <EditItemTemplate>
                        <dx:ASPxCheckBoxList OnDataBound="ASPxCheckBoxList1_DataBound" RepeatColumns="2" ID="ASPxCheckBoxList1" runat="server" ClientInstanceName="cbList" OnSelectedIndexChanged="ASPxCheckBoxList1_SelectedIndexChnaged" TextField="Field" ValueField="Id" ValueType="System.Int32">
                            <Items>
                                <dx:ListEditItem Text="Yes" Value="1" />
                                <dx:ListEditItem Text="No" Value="0" />
                            </Items>
                            <ClientSideEvents SelectedIndexChanged="OnSelectedIndexChanged" />
                        </dx:ASPxCheckBoxList>
                </EditItemTemplate>
                <EditFormSettings ColumnSpan="2" />
             </dx:GridViewDataTextColumn>

            <dx:GridViewDataComboBoxColumn FieldName="FPReason" Caption=" " Visible="False" EditFormCaptionStyle-Font-Bold="true" PropertiesComboBox-EnableCallbackMode="True">
                    <PropertiesComboBox Width="0px" ValueField="FPReason" TextField="FPReason">
                        <Items>
                            <dx:ListEditItem Text="Incomplete Contracts" Value="0" />
                            <dx:ListEditItem Text="Incomplete Payroll" Value="1" />
                            <dx:ListEditItem Text="Incomplete Supporting Documentation" Value="2" />
                            <dx:ListEditItem Text="No Line Item Data" Value="3" />
                            <dx:ListEditItem Text="No Pay History Data" Value="4" />
                            <dx:ListEditItem Text="No Aging Statement" Value="5" />
                            <dx:ListEditItem Text="Other" Value="6" />
                        </Items>
                        <%--<ClientSideEvents SelectedIndexChanged="function(s, e) { SetComboBox(s); }" />--%>
                   </PropertiesComboBox>
                    <EditFormCaptionStyle Font-Bold="True">
                    </EditFormCaptionStyle>
                    <EditFormSettings ColumnSpan="2" Visible="True" />
                    <Settings AllowHeaderFilter="True" />
                </dx:GridViewDataComboBoxColumn>

                 <dx:GridViewDataDropDownEditColumn Caption="Reason" VisibleIndex="86">
                <EditItemTemplate>
                    <dx:ASPxDropDownEdit ClientInstanceName="checkComboBox" ID="ASPxDropDownEdit1" Width="210px" runat="server" AnimationType="None">
                        <DropDownWindowStyle BackColor="#EDEDED" />
                        <DropDownWindowTemplate>
                            <dx:ASPxListBox Width="100%" ID="listBox" ClientInstanceName="checkListBox" SelectionMode="CheckColumn"
                                runat="server">
                                <Border BorderStyle="None" />
                                <BorderBottom BorderStyle="Solid" BorderWidth="1px" BorderColor="#DCDCDC" />
                                <Items>
                                    <dx:ListEditItem Text="(Select all)" Value="0" />
                                    <dx:ListEditItem Text="Incomplete Contracts" Value="1" />
                                    <dx:ListEditItem Text="Incomplete Payroll" Value="2" />
                                    <dx:ListEditItem Text="Incomplete Supporting Documentation" Value="3" />
                                    <dx:ListEditItem Text="No Line Item Data" Value="4" />
                                    <dx:ListEditItem Text="No Pay History Data" Value="5" />
                                    <dx:ListEditItem Text="No Aging Statement" Value="6" />
                                    <dx:ListEditItem Text="Other" Value="7" />
                                </Items>
                                <ClientSideEvents SelectedIndexChanged="OnListBoxSelectionChanged" />
                            </dx:ASPxListBox>
                            <table style="width: 100%">
                                <tr>
                                    <td style="padding: 4px">
                                        <dx:ASPxButton ID="ASPxButton1" AutoPostBack="False" runat="server" Text="Close" style="float: right">
                                            <ClientSideEvents Click="function(s, e){ checkComboBox.HideDropDown(); }" />
                                        </dx:ASPxButton>
                                    </td>
                                </tr>
                            </table>
                        </DropDownWindowTemplate>
                        <ClientSideEvents TextChanged="SynchronizeListBoxValues" DropDown="SynchronizeListBoxValues" />
                    </dx:ASPxDropDownEdit>
                    </EditItemTemplate>
                </dx:GridViewDataDropDownEditColumn>

                
                <dx:GridViewDataTextColumn Caption="SMI" VisibleIndex="87" FieldName="AttachedDocument1"
                    Visible="False">
                    <EditItemTemplate>
                        <button onclick='javascript:uploadFile(<%# Eval("ID")%>)' type="button">
                            Upload File(s)</button>
                    </EditItemTemplate>
                    <EditFormSettings ColumnSpan="2" Visible="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Aging Report Comment" EditFormCaptionStyle-Font-Bold="true"
                    FieldName="ARComment" VisibleIndex="88" Visible="False">
                    <EditFormSettings ColumnSpan="2" Visible="True" />
                    <EditFormCaptionStyle Font-Bold="True">
                    </EditFormCaptionStyle>
                </dx:GridViewDataTextColumn>
                <%--<dx:GridViewDataMemoColumn Caption="Comments" FieldName="comments" PropertiesMemoEdit-MaxLength="2000"
                    VisibleIndex="88" Visible="False">
                    <EditFormSettings ColumnSpan="2" Visible="False" />
                </dx:GridViewDataMemoColumn>--%>
                <dx:GridViewDataTextColumn VisibleIndex="89" Visible="False">
                    <EditFormSettings ColumnSpan="4" Visible="True" />
                    <EditItemTemplate>
                        <%--<dx:ASPxHyperLink CssClass="previousNav" ID="ASPxHyperLink2" runat="server" Text="<Previous">
                            <ClientSideEvents Click="function(s,e){grid.StartEditRow(ASPxHiddenField1.Get('index')-1); ASPxHiddenField1.Set('index', ASPxHiddenField1.Get('index')-1)}" />
                        </dx:ASPxHyperLink>
                        <dx:ASPxHyperLink CssClass="nextNav" ID="ASPxHyperLink1" runat="server" Text="Next>">
                            <ClientSideEvents Click="function(s,e){grid.StartEditRow(ASPxHiddenField1.Get('index')+1); ASPxHiddenField1.Set('index', ASPxHiddenField1.Get('index')+1)}" />
                        </dx:ASPxHyperLink>--%>
                        <dx:ASPxLabel ID="ASPxLabel1" ForeColor="Red" Font-Bold="true" runat="server" ClientInstanceName="msg" Text="">
                        </dx:ASPxLabel>
                        <dx:ASPxLabel ID="ASPxLabel2" ForeColor="Red" Font-Bold="true" runat="server" ClientInstanceName="msg2" Text="">
                        </dx:ASPxLabel>
                        <dx:ASPxButton ID="ASPxButton2" runat="server" Text="Cancel" AutoPostBack="false">
                            <ClientSideEvents Click="function(s, e) { grid.CancelEdit();}" />
                        </dx:ASPxButton>
                        <dx:ASPxButton ID="ASPxButton1" runat="server" Text="Update" AutoPostBack="false">
                            <ClientSideEvents Click="function(s, e) {OnUpdateClick(s,e);}" />
                        </dx:ASPxButton>
                        <dx:ASPxButton ID="ASPxButton4" runat="server" Text="Next>" AutoPostBack="false">
                            <ClientSideEvents Click="function(s,e){grid.StartEditRow(ASPxHiddenField1.Get('index')+1); ASPxHiddenField1.Set('index', ASPxHiddenField1.Get('index')+1)}" />
                        </dx:ASPxButton>
                        <dx:ASPxButton ID="ASPxButton3" runat="server" Text="<Previous" AutoPostBack="false">
                            <ClientSideEvents Click="function(s,e){grid.StartEditRow(ASPxHiddenField1.Get('index')-1); ASPxHiddenField1.Set('index', ASPxHiddenField1.Get('index')-1)}" />
                        </dx:ASPxButton>
                    </EditItemTemplate>
                </dx:GridViewDataTextColumn>
            </Columns>
            <SettingsPager Mode="ShowAllRecords">
            </SettingsPager>
            <SettingsBehavior ColumnResizeMode="Control" />
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <StylesPopup Common-Content-Border-BorderStyle="Double">
                <EditForm CloseButton-BackColor="Red">
                    <Header Font-Bold="true" Font-Size="Medium" HorizontalAlign="Center">
                    </Header>
                </EditForm>
            </StylesPopup>
            <Settings VerticalScrollBarMode="Visible" />
            <SettingsText PopupEditFormCaption="Status Update" />
            <SettingsPopup>
                <EditForm HorizontalAlign="WindowCenter" Modal="True" VerticalAlign="WindowCenter"
                    Height="100%" MinHeight="100%" MinWidth="1150px" AllowResize="True" ResizingMode="Postponed" />
            </SettingsPopup>
            <%--<SettingsCommandButton>
                <UpdateButton>
                    <Styles Style-Font-Size="11" Style-Paddings-PaddingRight="8" />
                </UpdateButton>
                <CancelButton>
                    <Styles Style-Font-Size="11" />
                </CancelButton>
            </SettingsCommandButton>--%>
            <SettingsDataSecurity AllowDelete="False" AllowInsert="False" />
            <Styles>
                <Header BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Center"
                    Wrap="True">
                </Header>
            </Styles>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="SqlDSHistoryList" runat="server" ConnectionString="<%$ ConnectionStrings:CCUpdate %>"
            SelectCommand="SELECT row_number() OVER (ORDER BY TrackingID) SequenceNo, TrackingID, CC_AuditorStatus_History.StatusID, CC_AuditorStatus.AuditorStatus, convert(varchar,CC_AuditorStatus_History.DateTimeStamp,110) DateTimeStamp
FROM CC_AuditorStatus_History INNER JOIN CC_AuditorStatus ON CC_AuditorStatus_History.StatusID = CC_AuditorStatus.AuditorStatusId
WHERE CC_AuditorStatus_History.TrackingID = @TrackingID
ORDER BY CC_AuditorStatus_History.StatusID">
<SelectParameters>
    <asp:Parameter Name="TrackingID" Type="Int32" />
</SelectParameters>
</asp:SqlDataSource>
    </div>
    <dx:ASPxPopupControl ID="pnlPlanningScoreCard" runat="server" Height="665px" ClientInstanceName="pnlPlanningScoreCard"
        Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter"
        Width="610px" HeaderText="">
    </dx:ASPxPopupControl>
    <dx:ASPxCallback ID="ASPxCallback1" runat="server" ClientInstanceName="clb" OnCallback="ASPxCallback1_Callback">
    </dx:ASPxCallback>
    <dx:ASPxHiddenField ID="ASPxHiddenField1" runat="server" ClientInstanceName="ASPxHiddenField1"></dx:ASPxHiddenField>
    <dx:ASPxHiddenField ID="ASPxHiddenField2" runat="server" ClientInstanceName="ASPxHiddenField2"></dx:ASPxHiddenField>
    <dx:ASPxHiddenField ID="ASPxHiddenField3" runat="server" ClientInstanceName="ASPxHiddenField3"></dx:ASPxHiddenField>
    <%--<dx:ASPxHiddenField ID="ASPxHiddenField4" runat="server" ClientInstanceName="ASPxHiddenField4"></dx:ASPxHiddenField>--%>
    <script type="text/javascript">
        adjustSize();
    </script>
</asp:Content>
