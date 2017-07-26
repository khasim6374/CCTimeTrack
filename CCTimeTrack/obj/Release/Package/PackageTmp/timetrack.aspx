<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="timetrack.aspx.vb" Inherits="CCTimeTrack.timetrack" %>

<%@ Register Assembly="DevExpress.Web.v15.1, Version=15.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="headerbar">
        <div class="tblHeadding">Timesheet</div>
        <div class="tblHeadding" style="float:right;font-size: 14px;padding-right:10px;padding-top:3px;">
            <a href="Timesheetsummary.aspx">Summary</a>
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
        <asp:SqlDataSource ID="sQTimesheet"  OnSelecting="sQTimesheet_Selecting" runat="server" ConnectionString="<%$ ConnectionStrings:CCUpdate%>" SelectCommandType="StoredProcedure" SelectCommand="WebUpdateTimesheet_sp" DeleteCommand="DELETE FROM [Timesheet] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Timesheet] ([Employee], [ProjectId], [TaskId], [WorkDate], [StartTime], [EndTime], [Notes], [mod_user], [mod_dttm]) VALUES (@Employee, @ProjectId, @TaskId, @WorkDate, @StartTime, @EndTime, @Notes, @mod_user, @mod_dttm)" UpdateCommand="UPDATE [Timesheet] SET [Employee] = @Employee, [ProjectId] = @ProjectId, [TaskId] = @TaskId, [WorkDate] = @WorkDate, [StartTime] = @StartTime, [EndTime] = @EndTime, [Notes] = @Notes, [mod_user] = @mod_user, [mod_dttm] = @mod_dttm WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
            <SelectParameters>
                <asp:Parameter Name="UserID" Type="String" />
            </SelectParameters>
            <InsertParameters>
                <asp:Parameter Name="Employee" Type="String" />
                <asp:Parameter Name="ProjectId" Type="String" />
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
