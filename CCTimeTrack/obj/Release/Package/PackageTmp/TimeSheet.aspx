<%@ Page Language="VB" AutoEventWireup="false" MasterPageFile="~/Site.Master" Inherits="CCTimeTrack.Deleteme" Codebehind="TimeSheet.aspx.vb" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">  
     <div class="tblHeadding" style="float:left">TimeSheet</div>       
    <div style="float:right;padding:5px"><a href="Timesheetsummary.aspx">Summary</a> | <a href="ProjectSummary.aspx">Project Summary</a></div>  
    <div style="clear:both">
       <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:CCUpdate %>" 
        SelectCommand="WebUpdateTimesheet_sp" SelectCommandType="StoredProcedure"
         UpdateCommand="UPDATE Timesheet SET ProjectID = @ProjectId, TaskID = @TaskId, WorkDate = @WorkDate, StartTime = @StartTime, EndTime = @EndTime, EmployeeID = @EmployeeID, Notes = @notes WHERE (ID = @Id)"
          DeleteCommand = "Delete Timesheet where Id = @Id"
        >
        <SelectParameters>
            <asp:Parameter Name="userid" Type="String" />
        </SelectParameters>

             <UpdateParameters> 
                        <asp:Parameter Name="ProjectId" Type ="String"/>
                        <asp:Parameter Name="TaskId"  />
                        <asp:Parameter Name="WorkDate" />
                        <asp:Parameter Name="StartTime"  />
                        <asp:Parameter Name="EndTime"  />
                        <asp:Parameter Name="EmployeeID" />
                        <asp:Parameter Name="Notes"  />
                        <asp:Parameter Name="Id" Type = "Int32" />    
            </UpdateParameters>

             <DeleteParameters>
                        <asp:Parameter Name="Id" Type = "Int32"/>    
            </DeleteParameters>
    </asp:SqlDataSource>

    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
            CellPadding="4" DataKeyNames="ID" DataSourceID="SqlDataSource6" 
            ForeColor="#333333" GridLines="None" Height="50px" Width="564px" 
            Font-Names="Calibri" DefaultMode="Insert">
            <AlternatingRowStyle BackColor="White" />
            <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" HorizontalAlign="Right" />
            <EditRowStyle BackColor="#2461BF" />
            <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
            <Fields>
                <asp:TemplateField HeaderText="Employee" SortExpression="EmployeeID">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("EmployeeID") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="ddlEmployee" runat="server" DataSourceID="SqlEmployee" 
                            DataTextField="Employee" DataValueField="ID" 
                            SelectedValue='<%# Bind("EmployeeID") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlEmployee" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:CCUpdate %>" 
                            SelectCommand="SELECT Employee, ID FROM employees WHERE (PI = 1)"></asp:SqlDataSource>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Employee") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Project" SortExpression="ProjectID">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("ProjectID") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="DropDownList5" runat="server" 
                            DataSourceID="SqlDataSourceproj" DataTextField="Project" 
                            DataValueField="ProjectId" SelectedValue='<%# Bind("ProjectID") %>'>
                        </asp:DropDownList>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("Project") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Task" SortExpression="TaskID">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("TaskID") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="DropDownList4" runat="server" 
                            DataSourceID="SqlDataSource1" DataTextField="Task" DataValueField="TaskID" 
                            SelectedValue='<%# Bind("TaskID") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:CCUpdate %>" 
                            SelectCommand="SELECT Task, TaskID FROM Tasks ORDER BY Task">
                        </asp:SqlDataSource>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("Task") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="WorkDate" SortExpression="WorkDate">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("WorkDate") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="workdate" runat="server" 
                            Text='<%# Bind("WorkDate", "{0:d}") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("WorkDate", "{0:d}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="StartTime" SortExpression="StartTime">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" 
                            Text='<%# Bind("StartTime", "{0:g}") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" 
                            Text='<%# Bind("StartTime", "{0:g}") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("StartTime", "{0:g}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="EndTime" SortExpression="EndTime">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" 
                            Text='<%# Bind("EndTime", "{0:g}") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" 
                            Text='<%# Bind("EndTime", "{0:g}")%>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("EndTime", "{0:g}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowInsertButton="True" ButtonType="Button" 
                    ShowCancelButton="False" />
            </Fields>
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <InsertRowStyle BackColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
                            
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource14" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:CCUpdate %>" 
                        SelectCommand="WebUpdateEmployee_sp" 
            SelectCommandType= "StoredProcedure" >
                       <SelectParameters>
                        <asp:Parameter Name="userid" Type="String" />
                       </SelectParameters>
                    </asp:SqlDataSource>
        <br />
        <br />

        <asp:SqlDataSource ID="SqlDataSource6" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CCUpdate %>" 
            InsertCommand="INSERT INTO Timesheet(EmployeeID, ProjectID, TaskID, WorkDate, StartTime, EndTime) VALUES (@EmployeeID, @ProjectId, @TaskId, @WorkDate, @StartTime, @EndTime)" 
            SelectCommand="WebUpdateTimesheet_sp" SelectCommandType="StoredProcedure" >

            <InsertParameters>
                <asp:Parameter Name="EmployeeID"/>
                <asp:Parameter Name="ProjectId"/>
                <asp:Parameter Name="TaskId"/>
                <asp:Parameter Name="WorkDate" />
                <asp:Parameter Name="StartTime"/>
                <asp:Parameter Name="EndTime"/>
            </InsertParameters>

            <SelectParameters>
                <asp:Parameter Name="userid" Type="String" />
            </SelectParameters>

            </asp:SqlDataSource>
   
        <asp:SqlDataSource ID="SqlDataSourceproj" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CCupdate %>" 
            SelectCommand="SELECT [ProjectId], [Project] FROM [Projects] order by project">
        </asp:SqlDataSource>

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="Id" DataSourceID="SqlDataSource1" EnableViewState="False" 
          AutoGenerateEditButton="True" AllowPaging="True" AllowSorting="True" 
            AutoGenerateDeleteButton="True" CellPadding="4" ForeColor="#333333" 
            PageSize="20" Width="1120px" Font-Names="Calibri">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:TemplateField HeaderText="Employee" SortExpression="Employee">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList3" runat="server" 
                        DataSourceID="SqlDataSource4" DataTextField="Employee" 
                        DataValueField="ID" SelectedValue='<%# Bind("EmployeeID") %>' >
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:CCUpdate %>" 
                        SelectCommand="SELECT Employee, ID FROM employees WHERE (PI = 1)">
                    </asp:SqlDataSource>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("Employee") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" 
                ReadOnly="True" SortExpression="Id" visible="False" />
            <asp:TemplateField HeaderText="Project" SortExpression="ProjectId">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server" 
                        DataSourceID="SqlDataSourceproj" DataTextField="Project" SelectedValue='<%# Bind("projectid") %>'
                        DataValueField="ProjectId" >
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Project") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Task" SortExpression="TaskId">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList2" runat="server" 
                        DataSourceID="SqlDataSource3" DataTextField="Task" DataValueField="TaskId" SelectedValue='<%# Bind("TaskId") %>'>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:CCUpdate %>" 
                        SelectCommand="SELECT [TaskId], [Task] FROM [Tasks] order by task"></asp:SqlDataSource>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("Task") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="workdate" HeaderText="workdate" 
                SortExpression="workdate" DataFormatString="{0:d}"/>
            <asp:BoundField DataField="StartTime" HeaderText="StartTime" 
                SortExpression="StartTime" DataFormatString="{0:g}"/>
            <asp:BoundField DataField="EndTime" HeaderText="EndTime" 
                SortExpression="EndTime" DataFormatString="{0:g}"/>

            <asp:BoundField DataField="Notes" HeaderText="Notes" SortExpression="Notes" />

        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />

    </asp:GridView>
    </asp:Content>
