<%@ Page Language="VB" AutoEventWireup="false" MasterPageFile="~/Site.Master" Inherits="CCTimeTrack.CompletedAudits" Codebehind="CompletedAudits.aspx.vb" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
     <div class="headerbar">
        <div class="tblHeadding">Completed Audits</div>
         <div style="float:right;padding:5px"><a href="StatusUpdate.aspx"> Status Update</a> | <a href="AuditTest.aspx"> Audit Tests</a>  </div>
    </div>
    <div style="overflow: auto; clear: both" id="divmain">                          
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" Font-Names="Calibri" 
            DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" 
            PageSize="30">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="ClientName" HeaderText="Client Name" 
                    SortExpression="ClientName" />
                <asp:BoundField DataField="supplierName" HeaderText="Supplier Name" 
                    SortExpression="supplierName" />
                <asp:BoundField DataField="Year" HeaderText="Year" SortExpression="Year" />
                <asp:BoundField DataField="Recovery Amount" HeaderText="Recovery Amount" 
                    SortExpression="Recovery Amount" DataFormatString="{0:c}"/>
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CCUpdate %>" 
            SelectCommand="WebCompleted_sp" SelectCommandType="StoredProcedure" 
            ProviderName="<%$ ConnectionStrings:CCUpdate.ProviderName %>">
        </asp:SqlDataSource>
    
    </div>
   
</asp:Content>
