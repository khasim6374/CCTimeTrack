<%@ Page Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="false" Inherits="CCTimeTrack.Timesheetsummary" Codebehind="Timesheetsummary.aspx.vb" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div class="tblHeadding" style="float:left">TimeSheet Summary</div>       
    <div style="float:right;padding:5px"><a href="Timesheet.aspx">Timesheet</a> | <a href="ProjectSummary.aspx">Project Summary</a></div>  
    <div style="clear:both">
      <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
          ConnectionString="<%$ ConnectionStrings:CCupdate %>" 
          SelectCommand="Webtimesheetsummary_sp" SelectCommandType="StoredProcedure">
          <SelectParameters>
              <asp:Parameter Name="userid" Type="String" />
          </SelectParameters>
      </asp:SqlDataSource>
      <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
          AllowSorting="True" AutoGenerateColumns="False" 
          DataSourceID="SqlDataSource1" CellPadding="4" 
          Font-Names="Calibri" ForeColor="#333333" PageSize="20" 
          style="margin-left: 0px" Width="651px">
          <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
          <Columns>
              <asp:BoundField DataField="Employee" HeaderText="Employee" 
                  SortExpression="Employee" />
              <asp:BoundField DataField="WorkDate" HeaderText="WorkDate" 
                  SortExpression="WorkDate" />
              <asp:BoundField DataField="StartTime" HeaderText="StartTime" ReadOnly="True" 
                  SortExpression="StartTime" />
              <asp:BoundField DataField="EndTime" HeaderText="EndTime" ReadOnly="True" 
                  SortExpression="EndTime" />
              <asp:BoundField DataField="WorkedHours" HeaderText="WorkedHours" 
                  ReadOnly="True" SortExpression="WorkedHours" />
          </Columns>
          <EditRowStyle BackColor="#999999" />
          <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
          <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
          <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
          <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
          <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />

          <SortedAscendingCellStyle BackColor="#E9E7E2" />
          <SortedAscendingHeaderStyle BackColor="#506C8C" />
          <SortedDescendingCellStyle BackColor="#FFFDF8" />
          <SortedDescendingHeaderStyle BackColor="#6F8DAE" />

      </asp:GridView>
        </div>
     
</asp:Content>
