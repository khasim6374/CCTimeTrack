<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="fileUpload.aspx.vb" Inherits="CCTimeTrack.fileUpload" %>

<%@ Register Assembly="DevExpress.Web.v15.1, Version=15.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>





<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <dx:ASPxUploadControl ID="fileUpload" ShowUploadButton="true" OnFilesUploadComplete="fileUpload_FilesUploadComplete" AddUploadButtonsHorizontalPosition="Right" runat="server" UploadMode="Advanced" ShowProgressPanel="true" Width="280px">
            <AdvancedModeSettings EnableMultiSelect="true" TemporaryFolder="/files" />
            <ClientSideEvents FileUploadComplete="function(s,e){
                grd.Refresh();
                }" />
        </dx:ASPxUploadControl><br />
    </div>
        <dx:ASPxGridView ID="grd" ClientInstanceName="grd" runat="server" AutoGenerateColumns="False" DataSourceID="sqlDoc" KeyFieldName="Id" Width="100%">
            <Columns>
                <dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" Visible="False" VisibleIndex="0">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TrackID" Visible="False" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="DocType" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Document" FieldName="Attachdocument" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn Caption="Created On" FieldName="Crtd_dttm" VisibleIndex="4">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn Caption="Created by" FieldName="Crtd_user" VisibleIndex="5" Visible = "False">
                </dx:GridViewDataTextColumn>
                <dx:GridViewCommandColumn ShowDeleteButton="True" VisibleIndex="6">
                </dx:GridViewCommandColumn>
            </Columns>
            <SettingsBehavior ConfirmDelete="True" />
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="sqlDoc" runat="server" ConnectionString="<%$ ConnectionStrings:CCUpdate %>" DeleteCommand="USP_DELETE_TRACK_DOCUMENTS" DeleteCommandType="StoredProcedure" SelectCommand="USP_SELECT_TRACK_DOCUMENTS" SelectCommandType="StoredProcedure">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="0" Name="TrackID" QueryStringField="id" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
