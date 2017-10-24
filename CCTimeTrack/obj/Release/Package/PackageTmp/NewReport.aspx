<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="NewReport.aspx.vb" Inherits="CCTimeTrack.NewReport" %>

<%@ Register Assembly="DevExpress.Web.v15.1, Version=15.1.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="headerbar">
        <div class="tblHeadding">New Report</div>
        <div style="float: right; padding: 5px">
            <asp:LinkButton ID="lnkExport" OnClick="lnkExport_Click" runat="server">Export (xls)</asp:LinkButton>
            <dx:ASPxGridViewExporter ID="grdExporter" GridViewID="NewReport" runat="server"></dx:ASPxGridViewExporter>
        </div>
    </div>
    <div style="overflow: auto; clear: both" id="divmain">
        <dx:ASPxGridView ID="NewReport" runat="server" ClientInstanceName="grid" DataSourceID="sqData" AutoGenerateColumns="False" KeyFieldName="Id">
            <Columns>
                <dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" Visible="False" VisibleIndex="0">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ClientName" Caption="Client" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="supplierName" VisibleIndex="2" Caption="Supplier">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Status" Caption="Planning Status" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="BDContact" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Auditor" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="LeadPlanner" VisibleIndex="6">
                </dx:GridViewDataTextColumn> 
                <dx:GridViewDataTextColumn FieldName="Planner" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="DDLead" Caption="DD Lead" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="ContractReceiptDate" Caption="Contract Receipt Date" ShowInCustomizationForm="True" VisibleIndex="9">
                    <PropertiesDateEdit DisplayFormatString="MM/dd/yyyy" EditFormat="Date"></PropertiesDateEdit>
                    <EditFormSettings ColumnSpan="2" />
                    <Settings AllowHeaderFilter="False" />
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn FieldName="DDWriteupDate" VisibleIndex="10">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn FieldName="COQDate" VisibleIndex="11">
                    <PropertiesDateEdit DisplayFormatInEditMode="True">
                    </PropertiesDateEdit>
                </dx:GridViewDataDateColumn> 
                <dx:GridViewDataDateColumn FieldName="NotificationLetterDate" Caption="NDR Date" ShowInCustomizationForm="True" VisibleIndex="12">
                    <PropertiesDateEdit DisplayFormatString="MM/dd/yyyy" EditFormat="Date"></PropertiesDateEdit>
                    <EditFormSettings ColumnSpan="2" />
                    <Settings AllowHeaderFilter="False" />
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn FieldName="Data_Received_Date" Caption="Data Received Date" ShowInCustomizationForm="True" VisibleIndex="13">
                    <PropertiesDateEdit DisplayFormatString="MM/dd/yyyy" EditFormat="Date"></PropertiesDateEdit>
                    <EditFormSettings ColumnSpan="2" />
                    <Settings AllowHeaderFilter="False" />
                </dx:GridViewDataDateColumn>      
                <dx:GridViewDataDateColumn FieldName="SampleSend" Caption="Sample Issued Date" ShowInCustomizationForm="True" VisibleIndex="14">
                    <PropertiesDateEdit DisplayFormatString="MM/dd/yyyy" EditFormat="Date"></PropertiesDateEdit>
                    <EditFormSettings ColumnSpan="2" />
                    <Settings AllowHeaderFilter="False" />
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn Caption="Kick Off Date" FieldName="scheduleddate" ShowInCustomizationForm="True" VisibleIndex="15">
                    <PropertiesDateEdit DisplayFormatString="MM/dd/yyyy" EditFormat="Date"></PropertiesDateEdit>
                    <EditFormSettings ColumnSpan="2" />
                    <Settings AllowHeaderFilter="False" />
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="DDSpend" Caption="DD Spend" VisibleIndex="16">
                    <PropertiesTextEdit DisplayFormatInEditMode="True" DisplayFormatString="C2">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn Caption="DD Failed Date" FieldName="DDFaileddate" ShowInCustomizationForm="True" VisibleIndex="17">
                    <PropertiesDateEdit DisplayFormatString="MM/dd/yyyy" EditFormat="Date"></PropertiesDateEdit>
                    <EditFormSettings ColumnSpan="2" />
                    <Settings AllowHeaderFilter="False" />
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="Type" VisibleIndex="18" Caption="Fixed Fee/Gain Share">
                </dx:GridViewDataTextColumn>

                <%--<dx:GridViewDataDateColumn FieldName="NotificationLetterDate" ShowInCustomizationForm="True" VisibleIndex="8" Visible="False">
                <PropertiesDateEdit DisplayFormatString="MM/dd/yyyy" EditFormatString="MM/dd/yyyy"></PropertiesDateEdit>
                <EditFormSettings ColumnSpan="2" Visible="True" />
            </dx:GridViewDataDateColumn>--%>
           <%-- <dx:GridViewDataDateColumn FieldName="ContractReceiptDate" ShowInCustomizationForm="True" VisibleIndex="9" Visible="False">
                <PropertiesDateEdit DisplayFormatString="MM/dd/yyyy" EditFormat="Date"></PropertiesDateEdit>
                <EditFormSettings ColumnSpan="2" Visible="True" />
            </dx:GridViewDataDateColumn>--%>
            <%--<dx:GridViewDataDateColumn FieldName="COQDate" ShowInCustomizationForm="True" VisibleIndex="10" Visible="False">
                <PropertiesDateEdit DisplayFormatString="MM/dd/yyyy" EditFormat="Date"></PropertiesDateEdit>
                <EditFormSettings ColumnSpan="2" Visible="True" />
            </dx:GridViewDataDateColumn>--%>
            <%--<dx:GridViewDataDateColumn FieldName="SampleApprovaldate" Caption="Sample Approval Date" ShowInCustomizationForm="True" VisibleIndex="10">
                <PropertiesDateEdit DisplayFormatString="MM/dd/yyyy" EditFormat="Date"></PropertiesDateEdit>
                <EditFormSettings ColumnSpan="2" />
                <Settings AllowHeaderFilter="False" />
            </dx:GridViewDataDateColumn>--%>
            <%--<dx:GridViewDataDateColumn FieldName="Data_Received_Date" Caption="Data Received Date" ShowInCustomizationForm="True" VisibleIndex="13" Visible="False">
                <PropertiesDateEdit DisplayFormatString="MM/dd/yyyy" EditFormat="Date"></PropertiesDateEdit>
                <EditFormSettings ColumnSpan="2" Visible="True" />
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="LeadPlanner" VisibleIndex="14">
                </dx:GridViewDataTextColumn> --%>
                <%--<dx:GridViewDataDateColumn FieldName="LeadPlanner" VisibleIndex="10">
                </dx:GridViewDataDateColumn>                
                <dx:GridViewDataTextColumn FieldName="TargetGrossRecovery" VisibleIndex="17">
                    <PropertiesTextEdit DisplayFormatString="c2">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="SpendReviewed" VisibleIndex="18">
                    <PropertiesTextEdit DisplayFormatString="c2">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TargetRevenewShare" VisibleIndex="19">
                    <PropertiesTextEdit DisplayFormatString="c2">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ActualRevenewShare" VisibleIndex="20">
                    <PropertiesTextEdit DisplayFormatString="c2">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ActualGrossRecovery" VisibleIndex="21">
                    <PropertiesTextEdit DisplayFormatString="c2">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>--%>
                <%--<dx:GridViewDataTextColumn FieldName="AmouniIdentified" VisibleIndex="22">
                    <PropertiesTextEdit DisplayFormatString="c2">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>--%>
                <%--<dx:GridViewDataDateColumn FieldName="ActualInvoiceDate" VisibleIndex="23">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="LINK" VisibleIndex="24" Caption="Document">
                    <DataItemTemplate>
                        <a href="javascript:void(0)" onclick='showPopup(<%#Eval("Id")%>)'><%#Eval("LINK")%></a>
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="comments" VisibleIndex="26" Caption="Comments">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="AuditorWat" Caption="Action Items" VisibleIndex="14">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="AuditorKickOff" VisibleIndex="16">
                    <PropertiesDateEdit DisplayFormatString="">
                    </PropertiesDateEdit>
                </dx:GridViewDataDateColumn>
                --%>  <%--<dx:GridViewDataTextColumn FieldName="IssuesIdentfied" VisibleIndex="17">                 
                </dx:GridViewDataTextColumn>--%>
                 <%--<dx:GridViewDataTextColumn FieldName="ClientType" VisibleIndex="18">                 
                </dx:GridViewDataTextColumn>--%>
                
            
            </Columns>
            <SettingsBehavior ColumnResizeMode="Control" EnableRowHotTrack="True" />
            <SettingsPager PageSize="25">
            </SettingsPager>
            <Settings HorizontalScrollBarMode="Visible" VerticalScrollBarMode="Visible" ShowFilterBar="Visible" ShowFilterRow="True" ShowFilterRowMenu="True" ShowHeaderFilterButton="True" />
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="sqData" runat="server" ConnectionString="<%$ ConnectionStrings:CCUpdate %>" SelectCommand="CCTrackingPlannerReport_sp" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:Parameter Name="userid" Type="string" />
            </SelectParameters>
        </asp:SqlDataSource>
        <dx:ASPxPopupControl ID="pnlPopup" runat="server" Height="665px" ClientInstanceName="pnlPopup" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Width="610px" HeaderText="">
        </dx:ASPxPopupControl>
    </div>
    <script type="text/javascript">
        adjustSize();
        function adjustSize() {
            var width = Math.max(0, document.documentElement.clientWidth);
            var height = Math.max(0, document.documentElement.clientHeight);
            grid.SetHeight(height - 106);
            if (hidden)
                grid.SetWidth($(window).innerWidth() - 12);
            else
                grid.SetWidth($(window).innerWidth() - 208);
            grid.AdjustControl();
        }
        function showPopup(id) {
            pnlPopup.SetContentUrl('ccdoc.aspx?tid=' + id);
            pnlPopup.Show();
        }
        function updateView() {
            adjustSize();
        }
    </script>
</asp:Content>

