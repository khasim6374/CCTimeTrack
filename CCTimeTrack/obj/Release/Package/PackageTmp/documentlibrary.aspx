<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="documentlibrary.aspx.vb" Inherits="CCTimeTrack.documentlibrary" %>
<%@ Register Assembly="DevExpress.Web.v15.1, Version=15.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script type="text/javascript">
        function uploadFile() {
            //pnlDocumentLibrary.SetContentUrl("document_fileUpload.aspx");
            //pnlDocumentLibrary.SetHeaderText("Document Upload");
            pnlDocumentLibrary.SetSize(500, 250);
            pnlDocumentLibrary.Show();
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="headerbar">
        <div class="tblHeadding">Document Library</div>
    </div>

    <div style="overflow: auto; clear: both" id="divmain">
       <%-- <button onclick='javascript:uploadFile()' type="button">Upload File(s)</button>--%>
       <dx:ASPxHiddenField ID="ASPxHiddenField1" runat="server" ClientInstanceName="ASPxHiddenField1"></dx:ASPxHiddenField>
       <dx:ASPxHiddenField ID="ASPxHiddenField2" runat="server" ClientInstanceName="ASPxHiddenField2"></dx:ASPxHiddenField>
        <dx:ASPxPopupControl ID="pnlDocumentLibrary" runat="server" Height="665px" ClientInstanceName="pnlDocumentLibrary"
            Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter"
            Width="610px" HeaderText="Document Upload">
            <ClientSideEvents Closing="function(s, e) { ASPxHiddenField1.Set('id', '');ASPxHiddenField2.Set('url', ''); }" />
            <ContentCollection>
                <dx:PopupControlContentControl>
                    <div>
                        <dx:ASPxUploadControl ID="fileUpload" OnFilesUploadComplete="fileUpload_FilesUploadComplete" ShowUploadButton="true" AddUploadButtonsHorizontalPosition="Right" runat="server" UploadMode="Advanced" ShowProgressPanel="true" Width="280px">
                            <AdvancedModeSettings EnableMultiSelect="true" TemporaryFolder="/documentlibrary" />
                            <ClientSideEvents FileUploadComplete="function(s,e){pnlDocumentLibrary.Hide();gridDocumentLibrary.Refresh();}" />
                        </dx:ASPxUploadControl>
                    </div>
                </dx:PopupControlContentControl>
            </ContentCollection>

        </dx:ASPxPopupControl>
        <dx:ASPxGridView ClientInstanceName="gridDocumentLibrary" ID="gridDocumentLibrary" runat="server" DataSourceID="sQDocumentLibrary" AutoGenerateColumns="False" KeyFieldName="ID" Width="100%" >
            <Columns>
                <dx:GridViewDataTextColumn FieldName="ID" VisibleIndex="0" Visible="False">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="DocType" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
 <%--               <dx:GridViewDataTextColumn FieldName="URL" VisibleIndex="2">
                </dx:GridViewDataTextColumn>--%>
                <dx:GridViewDataHyperLinkColumn FieldName="URL" VisibleIndex="2">
                    <DataItemTemplate>
                        <asp:LinkButton ID="LinkButton1" OnClick="hyperLink_Init" runat="server" CommandArgument='<%#Eval("URL")%>' Text='<%#Eval("URL")%>' />
                    </DataItemTemplate>
                </dx:GridViewDataHyperLinkColumn>
                <dx:GridViewDataTextColumn VisibleIndex="3">
                    <HeaderTemplate>
                        <dx:ASPxButton ID="btnNew" RenderMode = "Link" EnableTheming = "False" runat="server" Image-IconID="actions_addfile_16x16" AutoPostBack="false">
                            <ClientSideEvents Click="function(s,e){ uploadFile(); }" />
                        </dx:ASPxButton>
                    </HeaderTemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                    <DataItemTemplate>
                        <dx:ASPxButton ID="btnEdit" OnClick="btnEdit_Click" RenderMode = "Link" EnableTheming = "False" runat="server" Image-IconID="edit_edit_16x16" AutoPostBack="false">
                            <ClientSideEvents Click="function(s,e){ uploadFile(); }" />
                        </dx:ASPxButton>
                        <dx:ASPxButton ID="btnDelete" OnClick="btnDelete_Click" RenderMode = "Link" EnableTheming = "False" runat="server" Image-IconID="edit_delete_16x16" AutoPostBack="false">
                            <ClientSideEvents Click="function(s,e){  }" />
                        </dx:ASPxButton>
                    </DataItemTemplate>
                    <CellStyle HorizontalAlign="Center"></CellStyle>
                </dx:GridViewDataTextColumn>
            </Columns>
            <SettingsPager PageSize="20">
            </SettingsPager>
            <SettingsEditing Mode="Inline">
            </SettingsEditing>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="sQDocumentLibrary" runat="server" ConnectionString="<%$ ConnectionStrings:CCUpdate%>" SelectCommand="SELECT [ID], [DocType], [URL] FROM [CCDocument Library] ORDER BY [DocType]" InsertCommand="INSERT INTO [CCDocument Library] ([DocType], [URL], [crtd_dttm]) VALUES (@DocType, @URL, getdate())" DeleteCommand="Delete from [CCDocument Library] where ID=@ID" UpdateCommand="Update [CCDocument Library] set [DocType]=@DocType, [URL]=@URL, [crtd_dttm]=getdate() where ID =@ID" >
            <DeleteParameters>
                <asp:Parameter Name="ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="DocType" Type="String" />
                <asp:Parameter Name="URL" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="DocType" Type="String" />
                <asp:Parameter Name="URL" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
