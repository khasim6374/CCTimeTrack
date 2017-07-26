<%@ Page Language="VB" AutoEventWireup="false" MasterPageFile="~/Site.Master" Inherits="CCTimeTrack.CCTimeTrack.AuditTest" CodeBehind="AuditTest.aspx.vb" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div class="headerbar">
        <div class="tblHeadding">Audit Tests</div>
        <div style="float: right; padding: 5px"><a href="StatusUpdate.aspx">Status Update</a> | <a href="CompletedAudits.aspx">Completed Audits</a></div>
    </div>
    <div style="overflow: auto; clear: both" id="divmain">
        <table width="100%" border="1">
            <tr align="center">
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Supplier Name" Font-Bold="True"
                        Font-Names="Calibri" Font-Size="Medium"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="CmbSupplier" runat="server"
                        DataSourceID="SqlDataSource2" DataTextField="supplierName"
                        DataValueField="supplierid">
                    </asp:DropDownList>
                    <asp:Button ID="ButSubmit" runat="server" Text="Submit" />
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                        ConnectionString="<%$ ConnectionStrings:CCUpdate %>"
                        SelectCommand="WebselectVendors_sp" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="null" Name="USERID" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:Label ID="Lblstatus" runat="server" Font-Bold="True" Font-Names="Calibri"
                        Font-Size="Small" Font-Strikeout="False" ForeColor="Red" Text="Label"
                        Visible="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="left" colspan="2">
                    <asp:CheckBoxList ID="chktests" runat="server"
                        DataSourceID="SqlDataSource1" DataTextField="Description"
                        DataValueField="ID" Font-Names="Calibri" Font-Size="Small">
                    </asp:CheckBoxList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                        ConnectionString="<%$ ConnectionStrings:CCupdate %>"
                        SelectCommand="WebAuditlist_sp" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
