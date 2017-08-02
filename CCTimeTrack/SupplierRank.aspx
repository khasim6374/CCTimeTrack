<%@ Page Language="VB" Debug="True" AutoEventWireup="false" Inherits="CCTimeTrack.SupplierRank"
    MasterPageFile="~/Site.Master" MaintainScrollPositionOnPostback="true" CodeBehind="SupplierRank.aspx.vb" %>

<%@ Register Assembly="DevExpress.Web.v15.1, Version=15.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <style type="text/css">
        body
        {
            overflow: hidden;
        }
        .hyperlink:link { color:blue; }
    </style>
    <script type="text/javascript">
        function adjustSize() {
            var width = Math.max(0, document.documentElement.clientWidth);
            var height = Math.max(0, document.documentElement.clientHeight);
            grid.SetHeight(height - 106);
            if (hidden)
                grid.SetWidth($(window).innerWidth() - 12);
            else
                grid.SetWidth($(window).innerWidth() - 216);
            grid.AdjustControl();
        }
        function refreshGrid() {
            grid.Refresh();
            pnlPlanningScoreCard.Hide();
        }
        function updateView() {
            adjustSize();
        }
    </script>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div class="headerbar">
        <div class="tblHeadding">
            Supplier Rank</div>
    </div>
    <div style="overflow: auto; clear: both" id="divmain">
        <asp:SqlDataSource ID="ClientMasterDS" runat="server" ConnectionString="<%$ ConnectionStrings:CCUpdate %>"
        SelectCommand="select * from CC_ClientMaster ORDER BY ClientName ASC"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SupplierRankDS" runat="server" ConnectionString="<%$ ConnectionStrings:CCUpdate %>"
            SelectCommand="select [Start Date] as StartDate,* from CC_SupplierRank" 
            UpdateCommand="UPDATE CC_SupplierRank SET ClientId =@ClientId, 
                                    Location = @Location, 
                                    [Start Date] =@StartDate, 
                                    EndDate = @EndDate,
                                    Crtd_user =@Crtd_user,
                                    Crd_date =GetDate()
                                    WHERE ID =@Id" 
            InsertCommand="INSERT INTO CC_SupplierRank values(@ClientId, @Location, @StartDate, @EndDate, @Crtd_user, GetDate())"
            DeleteCommand="Delete from CC_SupplierRank where ID =@Id">
            <UpdateParameters>
                <asp:Parameter Name="ClientId" />
                <asp:Parameter Name="Location" />
                <asp:Parameter Name="StartDate" />
                <asp:Parameter Name="EndDate" />
                <asp:Parameter Name="Crtd_user" />
                <asp:Parameter Name="Id" Type="Int32" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="ClientId" />
                <asp:Parameter Name="Location" />
                <asp:Parameter Name="StartDate" />
                <asp:Parameter Name="EndDate" />
                <asp:Parameter Name="Crtd_user" />
                <asp:Parameter Name="Id" Type="Int32" />
            </InsertParameters>
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
        </asp:SqlDataSource>
        <dx:ASPxGridView runat="server" ID="grid" OnRowUpdating="grid_OnRowUpdating" OnRowInserting="grid_OnRowInserting" SettingsEditing-EditFormColumnCount="4" ClientInstanceName="grid" AutoGenerateColumns="False" DataSourceID="SupplierRankDS" KeyFieldName="ID" Width="100%" >
            <ClientSideEvents CustomButtonClick="function(s, e) { if(e.buttonID == 'myButton'){ s.StartEditRow(e.visibleIndex); } }" />
            <Columns>
                <dx:GridViewCommandColumn ShowDeleteButton="true" Caption=" ">
                </dx:GridViewCommandColumn>
                <dx:GridViewCommandColumn ShowNewButtonInHeader="true" Caption=" ">
                    <CustomButtons>
                        <dx:GridViewCommandColumnCustomButton ID="myButton" Text="Edit">
                        </dx:GridViewCommandColumnCustomButton>
                    </CustomButtons>
                </dx:GridViewCommandColumn>
                <dx:GridViewDataComboBoxColumn Caption="Client" FieldName="ClientId" EditFormCaptionStyle-Font-Bold="true" PropertiesComboBox-EnableCallbackMode="True">
                    <PropertiesComboBox DataSourceID="ClientMasterDS" TextField="ClientName" ValueField="ClientId">
                    </PropertiesComboBox>
                    <EditFormCaptionStyle Font-Bold="True">
                    </EditFormCaptionStyle>
                    <EditFormSettings ColumnSpan="2" />
                </dx:GridViewDataComboBoxColumn>
                <%--<dx:GridViewDataTextColumn Caption="Location" FieldName="Location">
	                <EditFormSettings ColumnSpan="2" />
                </dx:GridViewDataTextColumn>--%>
                <%--<dx:GridViewDataHyperLinkColumn FieldName="Location">
                    <PropertiesHyperLinkEdit NavigateUrlFormatString="Link#\\sehale\CC_Clients\12 Summary of Monetary Issues\2011\ConocoPhillips - Baker Hughes - 05-20-2011.zip#" TextField="Location">
                        <Style CssClass="hyperlink"></Style>
                    </PropertiesHyperLinkEdit>
                    <CellStyle HorizontalAlign="left">
                    </CellStyle>
                </dx:GridViewDataHyperLinkColumn>--%>
                <dx:GridViewDataHyperLinkColumn runat="server" FieldName="Location" Caption="Location">
                    <DataItemTemplate>
                        <%--<asp:HyperLink runat="server" OnInit="hyperLink_Init">qwert</asp:HyperLink>--%>
                        <%--<asp:Button OnClick="hyperLink_Init" runat="server" CommandArgument='<%#Eval("Document")%>' />--%>
                        <asp:LinkButton ID="LinkButton1" OnClick="hyperLink_Init" runat="server" CommandArgument='<%#Eval("Location")%>' Text='<%#Eval("Location")%>' />
                    </DataItemTemplate>
                </dx:GridViewDataHyperLinkColumn>
                <dx:GridViewDataDateColumn FieldName="StartDate" ShowInCustomizationForm="True">
	                <PropertiesDateEdit DisplayFormatString="MM/dd/yyyy" EditFormatString="MM/dd/yyyy"></PropertiesDateEdit>
	                <EditFormSettings ColumnSpan="2" />
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn FieldName="EndDate" ShowInCustomizationForm="True">
	                <PropertiesDateEdit DisplayFormatString="MM/dd/yyyy" EditFormat="Date"></PropertiesDateEdit>
	                <EditFormSettings ColumnSpan="2" />
                </dx:GridViewDataDateColumn>
            </Columns>
            <SettingsPager Mode="ShowAllRecords">
            </SettingsPager>
            <SettingsBehavior ColumnResizeMode="Control" ConfirmDelete="true" />
            <SettingsEditing Mode="EditFormAndDisplayRow">
            </SettingsEditing>
            <%--<StylesPopup Common-Content-Border-BorderStyle="Double">
                <EditForm CloseButton-BackColor="Red">
                    <Header Font-Bold="true" Font-Size="Medium" HorizontalAlign="Center">
                    </Header>
                </EditForm>
            </StylesPopup>--%>
            <Settings VerticalScrollBarMode="Visible" />
            <SettingsText PopupEditFormCaption="Status Update" />
            <%--<SettingsPopup>
                <EditForm HorizontalAlign="WindowCenter" Modal="True" VerticalAlign="WindowCenter"
                    Height="100%" MinHeight="100%" MinWidth="1150px" AllowResize="True" ResizingMode="Postponed" />
            </SettingsPopup>--%>
            <%--<SettingsCommandButton>
                <UpdateButton>
                    <Styles Style-Font-Size="11" Style-Paddings-PaddingRight="8" />
                </UpdateButton>
                <CancelButton>
                    <Styles Style-Font-Size="11" />
                </CancelButton>
            </SettingsCommandButton>--%>
            <%--<SettingsDataSecurity AllowDelete="False" AllowInsert="False" />--%>
            <Styles>
                <Header BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Center"
                    Wrap="True">
                </Header>
            </Styles>
        </dx:ASPxGridView>
    </div>
</asp:Content>
