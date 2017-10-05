<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="xmaslist.aspx.vb" Inherits="CCTimeTrack.xmaslist" %>

<%@ Register Assembly="DevExpress.Web.v15.1, Version=15.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     <div class="headerbar">
        <div class="tblHeadding">Xmas List</div>
         <div style="float: right; padding-right: 5px">
            <asp:ImageButton ID="btnExport" runat="server" ImageUrl="~/Images/excel.png" />
        </div>
    </div>
    <div style="overflow: auto; clear: both" id="divmain">
        <div style="clear: both"></div>
        <dx:ASPxGridView ID="grdXmazlist" runat="server" AutoGenerateColumns="False" DataSourceID="XmaslistDS" KeyFieldName="Id" OnHeaderFilterFillItems="grdXmazlist_HeaderFilterFillItems">
            <Columns>
                <dx:GridViewCommandColumn ButtonType="Link" ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0">
                    <HeaderStyle BackColor="White" />
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="Group" VisibleIndex="1" Caption="Group">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="column1" VisibleIndex="20" Visible="False">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Picture" VisibleIndex="21" Visible="False">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Favorite_Charity" VisibleIndex="4" Caption="Favorite Charity">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="GiftTier" VisibleIndex="5" Caption="Gift Tier">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Sent" VisibleIndex="22" Visible="False">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Company" VisibleIndex="6" Caption="Company">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="First_Name" VisibleIndex="7" Caption="First Name">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Middle_Name" VisibleIndex="8" Caption="Middle Name">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Last_Name" VisibleIndex="9" Caption="Last Name">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Business_Street" VisibleIndex="10" Caption="Business Street">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Business_Street2" VisibleIndex="11" Caption="Business Street 2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Business_City" VisibleIndex="12" Caption="Business City">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="State" VisibleIndex="13">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Zip_Code" VisibleIndex="14" Caption="Zip Code">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="BusinessPhone" VisibleIndex="15" Caption="Business Phone">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="EmailAddress" VisibleIndex="16" Caption="Email Address">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Id" VisibleIndex="23" Visible="False" ReadOnly="True">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="Mod_dttm" VisibleIndex="24" Visible="False">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="Mod_User" VisibleIndex="25" Visible="False">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="Birthdate" VisibleIndex="17" Caption="Birth Date">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="UniqueID" VisibleIndex="26" Visible="False">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataMemoColumn Caption="Notes" FieldName="Notes" VisibleIndex="19">
                </dx:GridViewDataMemoColumn>
                <dx:GridViewDataComboBoxColumn Caption="Person Responsible" FieldName="Person_responsible_2007" VisibleIndex="3">
                    <PropertiesComboBox DataSourceID="EmployeeDS" TextField="Employee" ValueField="Employee" IncrementalFilteringMode="Contains">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
            </Columns>
            <SettingsBehavior ColumnResizeMode="Control" ConfirmDelete="True" />
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <SettingsText PopupEditFormCaption="Xmas list" />
            <SettingsPopup>
                <EditForm HorizontalAlign="WindowCenter" Modal="True"
                    VerticalAlign="WindowCenter" Height="380px" MinHeight="380px"
                    MinWidth="800px" AllowResize="True"
                    ResizingMode="Postponed" />
            </SettingsPopup>
            <Settings ShowHeaderFilterButton="true" />
            <Styles>
                <Header BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"
                    HorizontalAlign="Center" Wrap="True">
                </Header>
            </Styles>
        </dx:ASPxGridView>
        <dx:ASPxGridViewExporter ID="grdXmazlistEprt" runat="server" GridViewID="grdXmazlist" FileName="Xmas list">
        </dx:ASPxGridViewExporter>
    </div>
    <asp:SqlDataSource ID="XmaslistDS" runat="server" ConnectionString="<%$ ConnectionStrings:CCUpdate %>" DeleteCommand="WebDeleteMasterXmasList_sp" InsertCommand="WebInsertMasterXmasList_sp" SelectCommand="WebSelectMasterXmasList_sp" UpdateCommand="WebUpdateMasterXmasList_sp" DeleteCommandType="StoredProcedure" InsertCommandType="StoredProcedure" SelectCommandType="StoredProcedure" UpdateCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Group" Type="String" />
            <asp:Parameter Name="column1" Type="String" />
            <asp:Parameter Name="Person_responsible_2007" Type="String" />
            <asp:Parameter Name="Picture" Type="String" />
            <asp:Parameter Name="Favorite_Charity" Type="String" />
            <asp:Parameter Name="GiftTier" Type="String" />
            <asp:Parameter Name="Sent" Type="String" />
            <asp:Parameter Name="Company" Type="String" />
            <asp:Parameter Name="First_Name" Type="String" />
            <asp:Parameter Name="Middle_Name" Type="String" />
            <asp:Parameter Name="Last_Name" Type="String" />
            <asp:Parameter Name="Business_Street" Type="String" />
            <asp:Parameter Name="Business_Street2" Type="String" />
            <asp:Parameter Name="Business_City" Type="String" />
            <asp:Parameter Name="State" Type="String" />
            <asp:Parameter Name="Zip_Code" Type="String" />
            <asp:Parameter Name="BusinessPhone" Type="String" />
            <asp:Parameter Name="EmailAddress" Type="String" />
            <asp:Parameter Name="Notes" Type="String" />
            <asp:Parameter Name="Mod_dttm" Type="DateTime" />
            <asp:Parameter Name="Mod_User" Type="String" />
            <asp:Parameter Name="Birthdate" Type="DateTime" />
            <asp:Parameter Name="UniqueID" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Group" Type="String" />
            <asp:Parameter Name="column1" Type="String" />
            <asp:Parameter Name="Person_responsible_2007" Type="String" />
            <asp:Parameter Name="Picture" Type="String" />
            <asp:Parameter Name="Favorite_Charity" Type="String" />
            <asp:Parameter Name="GiftTier" Type="String" />
            <asp:Parameter Name="Sent" Type="String" />
            <asp:Parameter Name="Company" Type="String" />
            <asp:Parameter Name="First_Name" Type="String" />
            <asp:Parameter Name="Middle_Name" Type="String" />
            <asp:Parameter Name="Last_Name" Type="String" />
            <asp:Parameter Name="Business_Street" Type="String" />
            <asp:Parameter Name="Business_Street2" Type="String" />
            <asp:Parameter Name="Business_City" Type="String" />
            <asp:Parameter Name="State" Type="String" />
            <asp:Parameter Name="Zip_Code" Type="String" />
            <asp:Parameter Name="BusinessPhone" Type="String" />
            <asp:Parameter Name="EmailAddress" Type="String" />
            <asp:Parameter Name="Notes" Type="String" />
            <asp:Parameter Name="Mod_dttm" Type="DateTime" />
            <asp:Parameter Name="Mod_User" Type="String" />
            <asp:Parameter Name="Birthdate" Type="DateTime" />
            <asp:Parameter Name="UniqueID" Type="String" />
            <asp:Parameter Name="Id" Type="Int32" />
        </UpdateParameters>
        <SelectParameters>
            <asp:Parameter Name="userid" Type="string" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="EmployeeDS" runat="server" ConnectionString="<%$ ConnectionStrings:CCUpdate %>" SelectCommand="SELECT distinct Employee FROM employees WHERE (Active_ind = 'A')"></asp:SqlDataSource>
</asp:Content>
