<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" MaintainScrollPositionOnPostback="true" CodeBehind="Invoicing.aspx.vb" Inherits="CCTimeTrack.Invoicing" %>

<%@ Register Assembly="DevExpress.Web.v15.1, Version=15.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script type="text/javascript">
        $(function () {
            //Insert
            $('#txtSettlementAmount').blur(function () {
                var clientid = $('#ddlClient').val();
                var billtypeid = $('#ddlBillType1').val();
                var SettlementAmount = $('#txtSettlementAmount').val();
                $.ajax({
                    cache: false,
                    type: 'POST',
                    url: "General.ashx?q=calcinvoiceamt&cid=" + clientid + "&btypeid=" + billtypeid + "&samt=" + SettlementAmount,
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (data) {
                        $('#hdnValue').val(parseFloat(data.split('|')[0]));
                        CalculateInvoiceAmt();
                        if (data.split('|')[1] == '1')
                            alert('Invoice amount is grater than Billing Cap');
                    },
                    error: function (xhr, status, error) {
                        $('#txtInvoiceAmt').val(0);
                    }
                });
            });
            $('#txtTravelAmt').blur(function () {
                var clientid = $('#ddlClient').val();
                var billtypeid = $('#ddlBillType1').val();
                var travelAmt = $('#txtTravelAmt').val();
                $.ajax({
                    cache: false,
                    type: 'POST',
                    url: "General.ashx?q=checktravelamt&cid=" + clientid + "&btypeid=" + billtypeid + "&tamt=" + travelAmt,
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (data) {
                        if (data == '1') {
                            alert('Travel amount exceeding travel cap.');
                        }
                    },
                    error: function (xhr, status, error) {

                    }
                });
                CalculateInvoiceAmt();
            });
            $('#txtSettlementAmt2').blur(function () {
                var clientid = $('#ddlEditClient').val();
                var billtypeid = $('#ddlEditBillType').val();
                var SettlementAmount = $('#txtSettlementAmt2').val();
                $.ajax({
                    cache: false,
                    type: 'POST',
                    url: "General.ashx?q=calcinvoiceamt&cid=" + clientid + "&btypeid=" + billtypeid + "&samt=" + SettlementAmount,
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (data) {
                        $('#hdnValueEdit').val(parseFloat(data.split('|')[0]));
                        CalculateInvoiceAmtEdit();
                        if (data.split('|')[1] == '1')
                            alert('Invoice amount is grater than Billing Cap');
                    },
                    error: function (xhr, status, error) {
                        $('#txtInvoiceAmt2').val(0);
                    }
                });
            });
            $('#txtTravel2').blur(function () {
                var clientid = $('#ddlEditClient').val();
                var billtypeid = $('#ddlEditBillType').val();
                var travelAmt = $('#txtTravel2').val();
                $.ajax({
                    cache: false,
                    type: 'POST',
                    url: "General.ashx?q=checktravelamt&cid=" + clientid + "&btypeid=" + billtypeid + "&tamt=" + travelAmt,
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (data) {
                        if (data == '1') {
                            alert('Travel amount exceeding travel cap.');
                        }
                    },
                    error: function (xhr, status, error) {

                    }
                });
                CalculateInvoiceAmtEdit();
            });
        });
        function CalculateInvoiceAmt() {
            var travelAmt = parseFloat($('#txtTravelAmt').val() == '' ? 0 : $('#txtTravelAmt').val());
            var invoiceAmt = parseFloat($('#hdnValue').val() == '' ? 0 : $('#hdnValue').val());
            $('#txtInvoiceAmt').val(invoiceAmt + travelAmt);
        }
        function CalculateInvoiceAmtEdit() {
            var travelAmt = parseFloat($('#txtTravel2').val() == '' ? 0 : $('#txtTravel2').val());
            var invoiceAmt = parseFloat($('#hdnValueEdit').val() == '' ? 0 : $('#hdnValueEdit').val());
            $('#txtInvoiceAmt2').val(invoiceAmt + travelAmt);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="headerbar">
        <div class="tblHeadding">Invoicing</div>
    </div>
    <div style="overflow: auto; clear: both" id="divmain">
        <asp:DetailsView ID="grdInsertInvoice" runat="server" Height="50px" Width="450px"
            AutoGenerateRows="False" DataKeyNames="Id" DataSourceID="SqlInvoice"
            DefaultMode="Insert" CellPadding="4" ForeColor="#333333" GridLines="None"
            Font-Names="Calibri">
            <AlternatingRowStyle BackColor="White" />
            <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True"
                HorizontalAlign="Right" />
            <EditRowStyle BackColor="#2461BF" />
            <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
            <Fields>
                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False"
                    ReadOnly="True" SortExpression="Id" />
                <asp:TemplateField HeaderText="Client" SortExpression="ClientID">
                    <InsertItemTemplate>
                        <asp:DropDownList ID="ddlClient" runat="server" DataSourceID="SqlClientID"
                            DataTextField="ClientName" DataValueField="ClientID"
                            SelectedValue='<%# Bind("ClientID") %>' AutoPostBack="True"
                            OnSelectedIndexChanged="ddlClient_SelectedIndexChanged"
                            ClientIDMode="Static">
                        </asp:DropDownList>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("ClientID") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle Width="300px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Supplier" SortExpression="SupplierID">
                    <InsertItemTemplate>
                        <asp:DropDownList ID="ddlSupplier" runat="server" AutoPostBack="True"
                            DataSourceID="SqlSupplier" DataTextField="SupplierName"
                            DataValueField="SupplierID"
                            OnSelectedIndexChanged="ddlSupplier_SelectedIndexChanged">
                        </asp:DropDownList>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("SupplierID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Auditor" SortExpression="Auditor">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Auditor") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="ddlAuditor" runat="server" DataSourceID="SqlAuditor"
                            DataTextField="Auditor" DataValueField="Auditor">
                        </asp:DropDownList>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Auditor") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Billing Type" SortExpression="BillingTypeID">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server"
                            DataSourceID="SqlBillingTypes" DataTextField="Invoice_Type" DataValueField="ID"
                            SelectedValue='<%# Bind("BillingTypeID") %>'>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="ddlBillType1" runat="server"
                            DataSourceID="SqlBillingTypes" DataTextField="Invoice_Type" DataValueField="ID"
                            SelectedValue='<%# Bind("BillingTypeID") %>' ClientIDMode="Static">
                        </asp:DropDownList>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server"
                            DataSourceID="SqlBillingTypes" DataTextField="Invoice_Type" DataValueField="ID"
                            SelectedValue='<%# Bind("BillingTypeID") %>'>
                        </asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Invoice Number" SortExpression="InvoiceNumber">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("InvoiceNumber") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("InvoiceNumber") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("InvoiceNumber") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Draft Date" SortExpression="DraftDate">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("DraftDate") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("DraftDate") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("DraftDate") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Progress Payment"
                    SortExpression="ProgressPayment">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("ProgressPayment") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("ProgressPayment") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("ProgressPayment") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Settlement Date" SortExpression="SettlementDate">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("SettlementDate") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("SettlementDate") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("SettlementDate") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Settlement Amount"
                    SortExpression="SettlementAmount">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox8" runat="server"
                            Text='<%# Bind("SettlementAmount") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="txtSettlementAmount" runat="server"
                            Text='<%# Bind("SettlementAmount") %>' ClientIDMode="Static"></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("SettlementAmount") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Client Received Payment/CM"
                    SortExpression="column1">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("column1") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("column1") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label9" runat="server" Text='<%# Bind("column1") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Travel" SortExpression="Travel">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox101" runat="server" Text='<%# Bind("Travel") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="txtTravelAmt" runat="server" Text='<%# Bind("Travel")%>'
                            ClientIDMode="Static"></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:TextBox ID="TextBox103" runat="server" Text='<%# Bind("Travel") %>'
                            Enabled="False"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Invoice Amount" SortExpression="InvoiceAmount">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("InvoiceAmount") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="txtInvoiceAmt" runat="server"
                            Text='<%# Bind("InvoiceAmount") %>' ClientIDMode="Static"></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label10" runat="server" Text='<%# Bind("InvoiceAmount") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Description" SortExpression="Description">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Description") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Description") %>'
                            TextMode="MultiLine"></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label13" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Sent for Approvals"
                    SortExpression="SentforApprovals">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox11" runat="server"
                            Text='<%# Bind("SentforApprovals") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox11" runat="server"
                            Text='<%# Bind("SentforApprovals") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label11" runat="server" Text='<%# Bind("SentforApprovals") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Sent To Client" SortExpression="SentToClient">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox12" runat="server" Text='<%# Bind("SentToClient") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox12" runat="server" Text='<%# Bind("SentToClient") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label12" runat="server" Text='<%# Bind("SentToClient") %>'></asp:Label>
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
        <asp:HiddenField ID="hdnValue" runat="server" ClientIDMode="Static" />
        <asp:HiddenField ID="hdnValueEdit" runat="server" ClientIDMode="Static" />
        <asp:Label ID="lblStatus" runat="server" ForeColor="Red"></asp:Label>

        <br />


        <asp:GridView ID="grdEditInvoice" runat="server" AutoGenerateColumns="False"
            DataKeyNames="Id" DataSourceID="SqlInvoice" CellPadding="4"
            ForeColor="#333333">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:TemplateField HeaderText="Client" SortExpression="ClientID">
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlEditClient" runat="server" DataSourceID="SqlClientID"
                            DataTextField="ClientName" DataValueField="ClientID"
                            SelectedValue='<%# Bind("ClientID")%>' ClientIDMode="Static">
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("ClientName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Supplier" SortExpression="SupplierID">
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlEditSupplier" runat="server" DataSourceID="SqlEditSupplier"
                            DataTextField="SupplierName" DataValueField="SupplierID"
                            SelectedValue='<%# Bind("SupplierID") %>'>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("SupplierName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Auditor" SortExpression="Auditor">
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlEditAuditor" runat="server" DataSourceID="SqlEditAuditor"
                            DataTextField="Auditor" DataValueField="Auditor"
                            SelectedValue='<%# Bind("Auditor") %>'>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label11" runat="server" Text='<%# Bind("Auditor") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Billing Type" SortExpression="Invoice Type">
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlEditBillType" runat="server"
                            DataSourceID="SqlBillingTypes" DataTextField="Invoice_Type" DataValueField="ID"
                            SelectedValue='<%# Eval("BillingTypeID") %>' AppendDataBoundItems="True"
                            ClientIDMode="Static">
                            <asp:ListItem>Select</asp:ListItem>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label12" runat="server" Text='<%# Eval("[Invoice Type]") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="InvoiceNumber" HeaderText="Invoice #"
                    SortExpression="InvoiceNumber" />
                <asp:TemplateField HeaderText="Draft Date" SortExpression="DraftDate">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server"
                            Text='<%# Bind("DraftDate", "{0:d}") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("DraftDate", "{0:d}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Progress Payment"
                    SortExpression="ProgressPayment">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server"
                            Text='<%# Bind("ProgressPayment") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server"
                            Text='<%# Eval("ProgressPayment", "{0:C}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Settlement Date" SortExpression="SettlementDate">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server"
                            Text='<%# Bind("SettlementDate", "{0:d}") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server"
                            Text='<%# Eval("SettlementDate", "{0:d}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Settlement Amount"
                    SortExpression="SettlementAmount">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtSettlementAmt2" runat="server"
                            Text='<%# Bind("SettlementAmount") %>' ClientIDMode="Static"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server"
                            Text='<%# Eval("SettlementAmount", "{0:C}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Client Received Payment/CM"
                    SortExpression="column1">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox8" runat="server"
                            Text='<%# Bind("column1", "{0:d}") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label10" runat="server" Text='<%# Eval("column1", "{0:d}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField SortExpression="Travel" HeaderText="Travel">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtTravel2" runat="server" ClientIDMode="Static"
                            Text='<%# Bind("Travel") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label14" runat="server" Text='<%# Eval("Travel", "{0:C}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Invoice Amount" SortExpression="InvoiceAmount">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtInvoiceAmt2" runat="server"
                            Text='<%# Bind("InvoiceAmount")%>' ClientIDMode="Static"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server"
                            Text='<%# Eval("InvoiceAmount", "{0:C}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Description" HeaderText="Description"
                    SortExpression="Description" />
                <asp:TemplateField HeaderText="Sent for Approvals"
                    SortExpression="SentforApprovals">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server"
                            Text='<%# Bind("SentforApprovals", "{0:d}") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label8" runat="server"
                            Text='<%# Eval("SentforApprovals", "{0:d}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Sent To Client" SortExpression="SentToClient">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox7" runat="server"
                            Text='<%# Bind("SentToClient", "{0:d}") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label9" runat="server"
                            Text='<%# Eval("SentToClient", "{0:d}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <a href="<%# String.Format("report/showreport.aspx?iid={0}&btype={1}", Eval("Id"), Eval("BillingTypeID"))%>">Print</a>
                    </ItemTemplate>
                </asp:TemplateField>
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

        <br />
        <asp:SqlDataSource ID="SqlInvoice" runat="server"
            ConnectionString="<%$ ConnectionStrings:CCUpdate %>"
            DeleteCommand="DELETE FROM [CC_Invoice] WHERE [Id] = @Id"
            InsertCommand="INSERT INTO CC_Invoice(ClientID, SupplierID, Auditor, InvoiceNumber, DraftDate, ProgressPayment, SettlementDate, SettlementAmount, [ClientReceived Payment/CM], Travel, InvoiceAmount, SentforApprovals, SentToClient, Description, BillingTypeID) VALUES (@ClientID, @SupplierID, @Auditor, @InvoiceNumber, @DraftDate, @ProgressPayment, @SettlementDate, @SettlementAmount, @column1, @Travel, @InvoiceAmount, @SentforApprovals, @SentToClient, @Description, @BillingTypeID)"
            SelectCommand="SELECT CC_Invoice.Id, CC_Invoice.ClientID, CC_Invoice.SupplierID, CC_Invoice.Auditor, CC_Invoice.InvoiceNumber, CC_Invoice.DraftDate, CC_Invoice.ProgressPayment, CC_Invoice.SettlementDate, CC_Invoice.SettlementAmount, CC_Invoice.[ClientReceived Payment/CM] AS column1, CC_Invoice.Travel, CC_Invoice.InvoiceAmount, CC_Invoice.SentforApprovals, CC_Invoice.SentToClient, CC_Clientmaster.ClientName, CC_SupplierMaster.SupplierName, CC_Invoice.Description, CC_Invoice.BillingTypeID, InvoiceBillingTypes.[Invoice Type] FROM CC_Invoice LEFT OUTER JOIN CC_Clientmaster ON CC_Invoice.ClientID = CC_Clientmaster.ClientID LEFT OUTER JOIN CC_SupplierMaster ON CC_Invoice.SupplierID = CC_SupplierMaster.SupplierID LEFT OUTER JOIN InvoiceBillingTypes ON CC_Invoice.BillingTypeID = InvoiceBillingTypes.ID"
            UpdateCommand="UPDATE CC_Invoice SET ClientID = @ClientID, SupplierID = @SupplierID, Auditor = @Auditor, InvoiceNumber = @InvoiceNumber, DraftDate = @DraftDate, ProgressPayment = @ProgressPayment, SettlementDate = @SettlementDate, SettlementAmount = @SettlementAmount, [ClientReceived Payment/CM] = @column1, Travel = @Travel, InvoiceAmount = @InvoiceAmount, SentforApprovals = @SentforApprovals, SentToClient = @SentToClient, Description = @Description, BillingTypeID = @BillingTypeID WHERE (Id = @Id)">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ClientID" Type="Int32" />
                <asp:Parameter Name="SupplierID" Type="Int32" />
                <asp:Parameter Name="Auditor" Type="String" />
                <asp:Parameter Name="InvoiceNumber" Type="String" />
                <asp:Parameter DbType="Date" Name="DraftDate" />
                <asp:Parameter Name="ProgressPayment" Type="Decimal" />
                <asp:Parameter DbType="Date" Name="SettlementDate" />
                <asp:Parameter Name="SettlementAmount" Type="Decimal" />
                <asp:Parameter DbType="Date" Name="column1" />
                <asp:Parameter Name="Travel" Type="Decimal" />
                <asp:Parameter Name="InvoiceAmount" Type="Decimal" />
                <asp:Parameter DbType="Date" Name="SentforApprovals" />
                <asp:Parameter DbType="Date" Name="SentToClient" />
                <asp:Parameter Name="Description" />
                <asp:Parameter Name="BillingTypeID" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="ClientID" Type="Int32" />
                <asp:Parameter Name="SupplierID" Type="Int32" />
                <asp:Parameter Name="Auditor" Type="String" />
                <asp:Parameter Name="InvoiceNumber" Type="String" />
                <asp:Parameter DbType="Date" Name="DraftDate" />
                <asp:Parameter Name="ProgressPayment" Type="Decimal" />
                <asp:Parameter DbType="Date" Name="SettlementDate" />
                <asp:Parameter Name="SettlementAmount" Type="Decimal" />
                <asp:Parameter DbType="Date" Name="column1" />
                <asp:Parameter Name="Travel" Type="Decimal" />
                <asp:Parameter Name="InvoiceAmount" Type="Decimal" />
                <asp:Parameter DbType="Date" Name="SentforApprovals" />
                <asp:Parameter DbType="Date" Name="SentToClient" />
                <asp:Parameter Name="Description" />
                <asp:Parameter Name="BillingTypeID" />
                <asp:Parameter Name="Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlClientID" runat="server"
            ConnectionString="<%$ ConnectionStrings:CCUpdate %>"
            SelectCommand="SELECT * FROM [CC_Clientmaster]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlSupplier" runat="server"
            ConnectionString="<%$ ConnectionStrings:CCUpdate %>"
            SelectCommand="SELECT distinct CC_SupplierMaster.SupplierID, CC_SupplierMaster.SupplierName
FROM  CC_SupplierMaster INNER JOIN
               CC_TrackingMain ON CC_SupplierMaster.SupplierID = CC_TrackingMain.SupplierID
WHERE (CC_TrackingMain.ClientID = @ClientID) AND (CC_TrackingMain.[Status] = 20)">
            <SelectParameters>
                <asp:Parameter Name="ClientID" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlAuditor" runat="server"
            ConnectionString="<%$ ConnectionStrings:CCUpdate %>" SelectCommand="SELECT distinct Auditor
FROM  CC_TrackingMain
WHERE (SupplierID = @SupplierID) AND (ClientID = @ClientID)">
            <SelectParameters>
                <asp:Parameter Name="SupplierID" />
                <asp:Parameter Name="ClientID" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlEditSupplier" runat="server"
            ConnectionString="<%$ ConnectionStrings:CCUpdate %>"
            SelectCommand="SELECT distinct CC_SupplierMaster.SupplierID, CC_SupplierMaster.SupplierName
FROM  CC_SupplierMaster INNER JOIN
               CC_TrackingMain ON CC_SupplierMaster.SupplierID = CC_TrackingMain.SupplierID
WHERE  (CC_TrackingMain.StatusID = 20)"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlEditAuditor" runat="server"
            ConnectionString="<%$ ConnectionStrings:CCUpdate %>" SelectCommand="SELECT distinct Auditor
FROM  CC_TrackingMain
"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlBillingTypes" runat="server"
            ConnectionString="<%$ ConnectionStrings:CCUpdate %>"
            SelectCommand="SELECT [ID], [Invoice Type] AS Invoice_Type FROM [InvoiceBillingTypes]"></asp:SqlDataSource>
    </div>
</asp:Content>
