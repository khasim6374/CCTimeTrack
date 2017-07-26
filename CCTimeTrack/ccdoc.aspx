<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ccdoc.aspx.vb" Inherits="CCTimeTrack.ccdoc" %>

<%@ Register assembly="DevExpress.Web.v15.1, Version=15.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" OnHtmlDataCellPrepared="ASPxGridView1_HtmlDataCellPrepared" DataSourceID="sqData" Width="100%">
            <Columns>
                <%--<dx:GridViewDataTextColumn FieldName="Document" VisibleIndex="0">                      
                </dx:GridViewDataTextColumn>--%>
                <dx:GridViewDataHyperLinkColumn runat="server" FieldName="Document" Caption="Document">
                    <DataItemTemplate>
                        <%--<asp:HyperLink runat="server" OnInit="hyperLink_Init">qwert</asp:HyperLink>--%>
                        <%--<asp:Button OnClick="hyperLink_Init" runat="server" CommandArgument='<%#Eval("Document")%>' />--%>
                        <asp:LinkButton OnClick="hyperLink_Init" runat="server" CommandArgument='<%#Eval("Document")%>' Text='<%#Eval("Document")%>' />
                    </DataItemTemplate>
                </dx:GridViewDataHyperLinkColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="sqData" runat="server" ConnectionString="<%$ ConnectionStrings:CCUpdate %>" SelectCommand="FetchCCdoc_sp" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="0" Name="trackid" QueryStringField="tid" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
