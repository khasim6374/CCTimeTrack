<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="documentlibrary.aspx.vb" Inherits="CCTimeTrack.documentlibrary" %>
<%@ Register Assembly="DevExpress.Web.v15.1, Version=15.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="headerbar">
        <div class="tblHeadding">Document Library</div>
    </div>

    <div style="overflow: auto; clear: both" id="divmain">
        <dx:ASPxGridView ID="gridDocumentLibrary" runat="server" DataSourceID="sQDocumentLibrary" AutoGenerateColumns="False" KeyFieldName="ID" Width="100%" >
            <Columns>
                <dx:GridViewDataTextColumn FieldName="ID" VisibleIndex="0" Visible="False">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="DocType" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="URL" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewCommandColumn ShowCancelButton="True" ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="3">
                </dx:GridViewCommandColumn>
            </Columns>
            <SettingsCommandButton>
                <NewButton ButtonType="Image">
                    <Image IconID="actions_addfile_16x16">
                    </Image>
                </NewButton>
                <UpdateButton ButtonType="Image">
                    <Image IconID="save_save_16x16">
                    </Image>
                </UpdateButton>
                <CancelButton ButtonType="Image">
                    <Image IconID="actions_cancel_16x16">
                    </Image>
                </CancelButton>
                <EditButton ButtonType="Image">
                    <Image IconID="edit_edit_16x16">
                    </Image>
                </EditButton>
                <DeleteButton ButtonType="Image">
                    <Image IconID="edit_delete_16x16">
                    </Image>
                </DeleteButton>
            </SettingsCommandButton>
            <SettingsPager PageSize="20">
            </SettingsPager>
            <SettingsEditing Mode="Inline">
            </SettingsEditing>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="sQDocumentLibrary" runat="server" ConnectionString="<%$ ConnectionStrings:CCUpdate%>" SelectCommand="SELECT [ID], [DocType], [URL] FROM [CCDocument Library] ORDER BY [DocType]" InsertCommand="INSERT INTO [CCDocument Library] ([DocType], [URL], [crtd_dttm]) VALUES (@DocType, @URL, getdate())" DeleteCommand="Delete from [CCDocument Library] where ID=@ID" UpdateCommand="Update [CCDocument Library] set [DocType]=@DocType, [URL]=@URL, [crtd_dttm]=getdate()" >
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
