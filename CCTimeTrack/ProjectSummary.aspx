<%@ Page Language="VB" AutoEventWireup="FALSE" MasterPageFile="~/Site.Master" Inherits="CCTimeTrack.ProjectSummary"  Codebehind="ProjectSummary.aspx.vb" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div class="tblHeadding" style="float:left">Project Summary</div>       
    <div style="float:right;padding:5px"><a href="Timesheet.aspx">Timesheet</a> | <a href="Timesheetsummary.aspx">Timesheet Summary</a></div>  
    <div style="clear:both">
        <div style="float:right;"><asp:Button 
                        ID="ButExport" runat="server" Text="Export to Excel" 
                        ToolTip="Export to Excel" /></div>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" 
        DataSourceID="ProjsummaryDataSource" ForeColor="#333333" 
        Font-Names="Calibri"  PageSize="30" 
          style="margin-left: 0px" Width="651px">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="WeekEnding" HeaderText="WeekEnding" ReadOnly="True" 
                SortExpression="WeekEnding" />
            <asp:BoundField DataField="Employee" HeaderText="Employee" 
                SortExpression="Employee" />
            <asp:BoundField DataField="Project" HeaderText="Project" 
                SortExpression="Project" />
            <asp:BoundField DataField="WorkedHours" HeaderText="WorkedHours" 
                ReadOnly="True" SortExpression="WorkedHours" />
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
    <asp:SqlDataSource ID="ProjsummaryDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:CCupdate %>" 
        SelectCommand="Webprojectsummary_sp" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:Parameter Name="userid" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>    
    </div>
</asp:Content>
