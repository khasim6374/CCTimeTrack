<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Status.aspx.vb" Inherits="CCTimeTrack.Status" %>

<%@ Register Assembly="DevExpress.Web.v15.1, Version=15.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="tblHeadding">Status</div> 
    <p>
        Client</p>
    <dx:ASPxComboBox ID="cboClient" runat="server" ValueType="System.Int32" 
        ClientInstanceName="cboClient" DataSourceID="Sqlclent" TextField="ClientName" 
        ValueField="ClientID">
        <ClientSideEvents SelectedIndexChanged="function(s, e) {
	cboSupplier.PerformCallback(cboClient.GetValue());
}" />
    </dx:ASPxComboBox>
    <asp:SqlDataSource ID="Sqlclent" runat="server" 
        ConnectionString="<%$ ConnectionStrings:CCUpdate %>" 
        SelectCommand="SELECT [ClientID], [ClientName] FROM [CC_Clientmaster]">
    </asp:SqlDataSource>
    <p>
        Supplier</p>
    <dx:ASPxComboBox ID="cboSupplier" runat="server" 
        ClientInstanceName="cboSupplier" ValueType="System.Int32">
        <ClientSideEvents SelectedIndexChanged="function(s, e) {
	grdShowDetails.PerformCallback(cboClient.GetValue()+'|'+cboSupplier.GetValue());
}" />
    </dx:ASPxComboBox>
    <asp:SqlDataSource ID="SqlSupplier" runat="server" 
        ConnectionString="<%$ ConnectionStrings:CCUpdate %>" 
        SelectCommand="SELECT DISTINCT TM.ClientID, TM.UserID, SM.SupplierID, SM.SupplierName
FROM  CC_TrackingMain AS TM INNER JOIN
               CC_SupplierMaster AS SM ON TM.SupplierID = SM.SupplierID
WHERE (TM.StatusID = 20) AND (TM.ClientID = @ClientID) AND (TM.UserID = @UserID)">
        <SelectParameters>
            <asp:Parameter Name="ClientID" />
            <asp:Parameter Name="UserID" />
        </SelectParameters>
    </asp:SqlDataSource>
    <p>
        <dx:ASPxGridView ID="grdShowDetails" runat="server" AutoGenerateColumns="False" 
            ClientInstanceName="grdShowDetails" Width="500px">
            <Columns>
                <dx:GridViewDataTextColumn FieldName="Auditor" ReadOnly="True" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="BD" ReadOnly="True" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Planner" ReadOnly="True" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="GShare" ReadOnly="True" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="SqlCctrackMain" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CCUpdate %>" 
            SelectCommand="WebCcTrackData" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:Parameter Name="ClientID" Type="Int32" />
                <asp:Parameter Name="SupplierID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
</asp:Content>
