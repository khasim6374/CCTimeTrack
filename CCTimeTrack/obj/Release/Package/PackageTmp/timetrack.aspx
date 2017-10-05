<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="timetrack.aspx.vb" Inherits="CCTimeTrack.timetrack" %>

<%@ Register Assembly="DevExpress.Web.v15.1, Version=15.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script type="text/javascript">
        var textSeparator = ";";
        function OnListBoxSelectionChanged(cbMultiOptions, args) {
            if (args.index == 0)
                args.isSelected ? cbMultiOptions.SelectAll() : cbMultiOptions.UnselectAll();
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
            var texts = [];
            for (var i = 0; i < items.length; i++)
                if (items[i].index != 0)
                    texts.push(items[i].text);
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
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="headerbar">
        <div class="tblHeadding">Timesheet</div>
            
        <div class="tblHeadding" style="float:right;font-size: 14px;padding-right:10px;padding-top:3px;">
            <a href="Timesheetsummary.aspx">Summary</a>
        </div>
        <div style="margin-left:300px;">
            <asp:SqlDataSource ID="DSOptions" runat="server" ConnectionString="<%$ ConnectionStrings:CCUpdate %>" SelectCommand=""></asp:SqlDataSource>
            <dx:ASPxComboBox CssClass="timetrackButtons" ID="cbOptions" runat="server" ValueType="System.String" DropDownStyle="DropDownList" AutoPostBack="true" OnSelectedIndexChanged="cbOptions_SelectedIndexChanged">
                <Items>
                    <dx:ListEditItem Value="Select" Text="---Select---" Selected="True" />
                    <dx:ListEditItem Value="Project" Text="Project" />
                    <dx:ListEditItem Value="Task" Text="Task" />
                    <dx:ListEditItem Value="Employee" Text="Employee" />
                </Items>
            </dx:ASPxComboBox>

            <dx:ASPxDropDownEdit CssClass="timetrackButtons" NullText="---Select---" ClientInstanceName="checkComboBox" ID="ASPxDropDownEdit1" Width="170px" runat="server" AnimationType="None">
                <DropDownWindowStyle BackColor="#EDEDED" />
                <DropDownWindowTemplate>
                    <dx:ASPxListBox Width="100%" ID="cbMultiOptions" ClientInstanceName="checkListBox" SelectionMode="CheckColumn"
                        runat="server" DataSourceID="DSOptions" ValueType="System.String" OnDataBound="cbMultiOptions_DataBound">
                        <Border BorderStyle="None" />
                        <BorderBottom BorderStyle="Solid" BorderWidth="1px" BorderColor="#DCDCDC" />
                        <%--<Items>
                            <dx:ListEditItem Text="(Select all)" />
                            <dx:ListEditItem Text="Chrome" Value="1" />
                            <dx:ListEditItem Text="Firefox" Value="2" />
                            <dx:ListEditItem Text="IE" Value="3" />
                            <dx:ListEditItem Text="Opera" Value="4" />
                            <dx:ListEditItem Text="Safari" Value="5" />
                        </Items>--%>
                        <ClientSideEvents SelectedIndexChanged="OnListBoxSelectionChanged" />
                    </dx:ASPxListBox>
                    <table style="width: 100%">
                        <tr>
                            <td style="padding: 4px">
                                <%--<dx:ASPxButton ID="SelectAll" AutoPostBack="False" runat="server" Text="Select All" style="float: right">
                                    <ClientSideEvents Click="function(s, e){ checkListBox.SelectAll(); }" />
                                </dx:ASPxButton>--%>
                                <dx:ASPxButton ID="ASPxButton1" AutoPostBack="False" runat="server" Text="Close" style="float: right">
                                    <ClientSideEvents Click="function(s, e){ checkComboBox.HideDropDown(); }" />
                                </dx:ASPxButton>
                            </td>
                        </tr>
                    </table>
                </DropDownWindowTemplate>
                <ClientSideEvents TextChanged="SynchronizeListBoxValues" DropDown="SynchronizeListBoxValues" />
            </dx:ASPxDropDownEdit>

            <%--<dx:ASPxComboBox CssClass="timetrackButtons" ID="cbMultiOptions" runat="server" ValueType="System.String" DropDownStyle="DropDownList" DataSourceID="DSOptions" AutoPostBack="true" NullText="---Select---" OnSelectedIndexChanged="cbMultiOptions_SelectedIndexChanged"></dx:ASPxComboBox>--%>
            <dx:ASPxDateEdit CssClass="timetrackButtons" ID="dtStartdate" runat="server" NullText="Start Date">
            </dx:ASPxDateEdit>
            <dx:ASPxDateEdit CssClass="timetrackButtons" ID="dtEnddate" runat="server" NullText="End Date">
            </dx:ASPxDateEdit>
            <dx:ASPxButton CssClass="LinkCursor" BorderBottom-BorderColor="#5D7B9D" BorderBottom-BorderWidth="3" ID="btnExport" runat="server" Cursor="pointer" EnableDefaultAppearance="false" Font-Underline="true" ForeColor="Blue" Text="Export" OnInit="btnExport_Init" AutoPostBack="false" OnClick="ExportToExcel" CustomParameter="TTNew_Report"></dx:ASPxButton>
        </div>
    </div>
    <div style="overflow: auto; clear: both" id="divmain">
        <dx:ASPxGridView ID="gridTimesheet" runat="server" DataSourceID="sQTimesheet" OnCellEditorInitialize="gridTimesheet_CellEditorInitialize" AutoGenerateColumns="False" KeyFieldName="Id" Width="100%" OnInitNewRow="gridTimesheet_InitNewRow">
            <Columns>
                <%--<dx:GridViewDataTextColumn FieldName="Employee" ReadOnly="true" VisibleIndex="1">
                </dx:GridViewDataTextColumn>--%>
                 <dx:GridViewDataComboBoxColumn Caption="Employee" FieldName="Employee" VisibleIndex="1">
                    <PropertiesComboBox DataSourceID="sQEmployee" IncrementalFilteringMode="Contains" TextField="Employee" ValueField="Employee">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataDateColumn FieldName="WorkDate" VisibleIndex="7">
                </dx:GridViewDataDateColumn>
                <dx:GridViewCommandColumn ShowCancelButton="True" ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="17">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTimeEditColumn FieldName="StartTime" VisibleIndex="9">
                    <PropertiesTimeEdit DisplayFormatString="hh:mm tt" DisplayFormatInEditMode="True" EditFormat="Custom" EditFormatString="hh:mm tt">
                    </PropertiesTimeEdit>
                </dx:GridViewDataTimeEditColumn>
                <dx:GridViewDataTimeEditColumn FieldName="EndTime" VisibleIndex="11">
                    <PropertiesTimeEdit DisplayFormatString="hh:mm tt" DisplayFormatInEditMode="True" EditFormat="Custom" EditFormatString="hh:mm tt">
                    </PropertiesTimeEdit>
                </dx:GridViewDataTimeEditColumn>
                <dx:GridViewDataComboBoxColumn Caption="Project" FieldName="ProjectId" VisibleIndex="4">
                    <PropertiesComboBox DataSourceID="sQProject" IncrementalFilteringMode="Contains" TextField="Project" ValueField="ProjectId">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataCheckColumn FieldName="Billable" Caption="Billable" VisibleIndex="5">
                    <PropertiesCheckEdit ValueChecked="Yes" ValueUnchecked="No" ValueType="System.String" />
                </dx:GridViewDataCheckColumn>
                <dx:GridViewDataComboBoxColumn Caption="Task" FieldName="TaskId" VisibleIndex="6">
                    <PropertiesComboBox DataSourceID="sQTasks" IncrementalFilteringMode="Contains" TextField="Task" ValueField="TaskId">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataMemoColumn FieldName="Notes" Width="300" VisibleIndex="13">
                    <PropertiesMemoEdit MaxLength="500">
                    </PropertiesMemoEdit>
                </dx:GridViewDataMemoColumn>
            </Columns>
            <SettingsCommandButton>
                <NewButton ButtonType="Image">
                    <Image IconID="actions_addfile_16x16">
                    </Image>
                </NewButton>
                <UpdateButton ButtonType="Image">
                    <Image IconID="save_save_16x16">
                    </Image>
                </UpdateButton>
                <CancelButton ButtonType="Image">
                    <Image IconID="actions_cancel_16x16">
                    </Image>
                </CancelButton>
                <EditButton ButtonType="Image">
                    <Image IconID="edit_edit_16x16">
                    </Image>
                </EditButton>
                <DeleteButton ButtonType="Image">
                    <Image IconID="edit_delete_16x16">
                    </Image>
                </DeleteButton>
            </SettingsCommandButton>
            <SettingsPager PageSize="20">
            </SettingsPager>
            <SettingsEditing Mode="Inline">
            </SettingsEditing>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="sQTimesheet"  OnSelecting="sQTimesheet_Selecting" runat="server" ConnectionString="<%$ ConnectionStrings:CCUpdate%>" SelectCommandType="StoredProcedure" SelectCommand="WebUpdateTimesheet_sp" DeleteCommand="DELETE FROM [Timesheet] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Timesheet] ([Employee], [ProjectId], [Billable], [TaskId], [WorkDate], [StartTime], [EndTime], [Notes], [mod_user], [mod_dttm]) VALUES (@Employee, @ProjectId, @Billable, @TaskId, @WorkDate, @StartTime, @EndTime, @Notes, @mod_user, @mod_dttm)" UpdateCommand="UPDATE [Timesheet] SET [Employee] = @Employee, [ProjectId] = @ProjectId, Billable = @Billable, [TaskId] = @TaskId, [WorkDate] = @WorkDate, [StartTime] = @StartTime, [EndTime] = @EndTime, [Notes] = @Notes, [mod_user] = @mod_user, [mod_dttm] = @mod_dttm WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
            <SelectParameters>
                <asp:Parameter Name="UserID" Type="String" />
            </SelectParameters>
            <InsertParameters>
                <asp:Parameter Name="Employee" Type="String" />
                <asp:Parameter Name="ProjectId" Type="String" />
                <asp:Parameter Name="Billable" Type="String" />
                <asp:Parameter Name="TaskId" Type="String" />
                <asp:Parameter Name="WorkDate" Type="DateTime" />
                <asp:Parameter Name="StartTime" Type="DateTime" />
                <asp:Parameter Name="EndTime" Type="DateTime" />
                <asp:Parameter Name="Notes" Type="String" />
                <asp:Parameter Name="mod_user" Type="String" />
                <asp:Parameter Name="mod_dttm" Type="DateTime" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Employee" Type="String" />
                <asp:Parameter Name="ProjectId" Type="String" />
                <asp:Parameter Name="Billable" Type="String" />
                <asp:Parameter Name="TaskId" Type="String" />
                <asp:Parameter Name="WorkDate" Type="DateTime" />
                <asp:Parameter Name="StartTime" Type="DateTime" />
                <asp:Parameter Name="EndTime" Type="DateTime" />
                <asp:Parameter Name="Notes" Type="String" />
                <asp:Parameter Name="mod_user" Type="String" />
                <asp:Parameter Name="mod_dttm" Type="DateTime" />
                <asp:Parameter Name="Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="sQEmployee" runat="server" ConnectionString="<%$ ConnectionStrings:CCUpdate %>" SelectCommand="SELECT [ID], [Employee], [UserID] FROM Employees ORDER BY [Employee]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="sQProject" runat="server" ConnectionString="<%$ ConnectionStrings:CCUpdate %>" SelectCommand="SELECT [ProjectId], [Project] FROM [Projects] ORDER BY [Project]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="sQTasks" runat="server" ConnectionString="<%$ ConnectionStrings:CCUpdate %>" SelectCommand="SELECT [TaskId], [Task] FROM [Tasks] ORDER BY [Task]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDSEmployee" runat="server" ConnectionString="<%$ ConnectionStrings:CCUpdate %>"></asp:SqlDataSource>
    </div>
</asp:Content>
