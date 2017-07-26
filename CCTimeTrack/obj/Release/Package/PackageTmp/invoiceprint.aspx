<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="invoiceprint.aspx.vb" Inherits="CCTimeTrack.invoiceprint" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .rgtalign {
            text-align:right
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlInvoice" 
            Width="700px">
            <EditItemTemplate>
                Client:
                <asp:TextBox ID="ClientTextBox" runat="server" Text='<%# Bind("Client") %>' />
                <br />
                CAddress:
                <asp:TextBox ID="CAddressTextBox" runat="server" 
                    Text='<%# Bind("CAddress") %>' />
                <br />
                InvoiceNo:
                <asp:TextBox ID="InvoiceNoTextBox" runat="server" 
                    Text='<%# Bind("InvoiceNo") %>' />
                <br />
                InvoiceDate:
                <asp:TextBox ID="InvoiceDateTextBox" runat="server" 
                    Text='<%# Bind("InvoiceDate") %>' />
                <br />
                Terms:
                <asp:TextBox ID="TermsTextBox" runat="server" Text='<%# Bind("Terms") %>' />
                <br />
                PONo:
                <asp:TextBox ID="PONoTextBox" runat="server" Text='<%# Bind("PONo") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                    CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                Client:
                <asp:TextBox ID="ClientTextBox" runat="server" Text='<%# Bind("Client") %>' />
                <br />
                CAddress:
                <asp:TextBox ID="CAddressTextBox" runat="server" 
                    Text='<%# Bind("CAddress") %>' />
                <br />
                InvoiceNo:
                <asp:TextBox ID="InvoiceNoTextBox" runat="server" 
                    Text='<%# Bind("InvoiceNo") %>' />
                <br />
                InvoiceDate:
                <asp:TextBox ID="InvoiceDateTextBox" runat="server" 
                    Text='<%# Bind("InvoiceDate") %>' />
                <br />
                Terms:
                <asp:TextBox ID="TermsTextBox" runat="server" Text='<%# Bind("Terms") %>' />
                <br />
                PONo:
                <asp:TextBox ID="PONoTextBox" runat="server" Text='<%# Bind("PONo") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                    CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                <table class="auto-style1">
                    <tr>
                        <td colspan="2" style="text-align:center"><img src="Images/revenew.png" width="150px" /></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <h2>Invoice</h2>
                        </td>
                    </tr>
                    <tr>
                        <td><b>Client</b></td>
                        <td rowspan="9" >
                            <div style="border:solid thin black; font-weight:bold; width:250px; float:right"><table class="auto-style1">
                                <tr>
                                    <td>Invoice #:</td>
                                    <td>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("InvoiceNo") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Invoice Date:</td>
                                    <td>
                                        <asp:Label ID="Label4" runat="server" 
                                            Text='<%# Eval("InvoiceDate", "{0:d}") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Terms:</td>
                                    <td>
                                        <asp:Label ID="Label5" runat="server" 
                                            Text='<%# Eval("Terms", "Net {0} Days") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>P/O #:</td>
                                    <td>
                                        <asp:Label ID="Label6" runat="server" Text='<%# Eval("PONo") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="text-align:center"><hr /></td>
                                </tr>
                                <tr>
                                    <td>TAX ID #:</td>
                                    <td>&nbsp;</td>
                                </tr>
                            </table></div>
                        </td>
                    </tr>
                    <tr>
                        <td>Attn: 
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Client") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("CAddress") %>'></asp:Label>
                        </td>
                    </tr>
                   
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td><b><u>Remit To:</u></b></td>
                    </tr>
                    <tr>
                        <td>Revenew International LLC</td>
                    </tr>
                    <tr>
                        <td>Attn: Accounts Receivable</td>
                    </tr>
                    <tr>
                        <td>9 Greenway Plaza, Suite 1950</td>
                    </tr>
                    <tr>
                        <td>Houston, TX 77046</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td><b><u>Wire/EFT</u></b></td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>Bank of America</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>ABA routing#</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>ACCT#</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2"><b><u>Description of Services:</u></b></td>
                    </tr>
                    <tr>
                        <td colspan="2">Billing for Contract Language Review - Risk Assessment And Pricing 
                            Template Development</td>
                    </tr>
                    <tr>
                        <td colspan="2">&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <table class="auto-style1">
                                <tr>
                                    <th>No.</th>
                                    <th>Deliverable</th>
                                        <th class="rgtalign">Price</th>
                                        <th class="rgtalign">%</th>
                                        <th class="rgtalign">Total</th>
                                    </caption>
                                </tr>
                                <tr>
                                    <td style="text-align:center">1</td>
                                    <td>&nbsp;</td>
                                    <td class="rgtalign">$63,750.00</td>
                                    <td class="rgtalign">40.0%</td>
                                    <td class="rgtalign">$25,500.00</td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td colspan="3">Estimated hours -14 hours on average per contractor<br />Maximum Contracts Reviewed - fifty (50)</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td class="rgtalign">=======</td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td colspan="3" class="rgtalign">Amount Due this Invoice:</td>
                                    <td class="rgtalign">$25,500.00</td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align:center"><img src="Images/reve.png"/></td>
                    </tr>
                </table>
                <br />
            </ItemTemplate>
        </asp:FormView>
        <asp:SqlDataSource ID="SqlInvoice" runat="server" 
            ConnectionString="<%$ ConnectionStrings:CCUpdate %>" 
            SelectCommand="WebgetInvoice_sp" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="0" Name="InvoiceID" 
                    QueryStringField="iid" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
