<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="PlanningScoreCard.aspx.vb" Inherits="CCTimeTrack.PlanningScoreCard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="~/Styles/Site.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        a:link, a:visited
        {
            color: #556F8D;
            text-decoration: none;
        }

        .clstbl
        {
            width: 100%;
            font: Arial;
            font-size: 13px;
            border-collapse: collapse;
        }

            .clstbl table, th, td
            {
                border: 1px solid gray;
                border-collapse: collapse;
            }

            .clstbl tr th
            {
                background-color: #4f81bd;
                color: white;
                text-align: center;
                height: 40px;
            }

        .clxtext
        {
            width: 100%;
        }

        .clschkbox
        {
            text-align: center;
        }
    </style>

</head>
<body style="background-color: white; color: black">
    <form id="form1" runat="server">
        <div>
            <table class="clstbl">
                <tr>
                    <td colspan="3" style="text-align: center; font-weight: bold; font-size: 15px">Planning Scorecard</td>
                </tr>
                <tr>
                    <td style="border-right: none; border-bottom: none">Client :
                        <asp:Label ID="lblClient" runat="server" Text="" Font-Bold="True"></asp:Label></td>
                    <td style="border: none">Supplier :
                        <asp:Label ID="lblSupplier" runat="server" Text="" Font-Bold="True"></asp:Label></td>
                    <td style="border-left: none; border-bottom: none">Auditor :
                        <asp:Label ID="lblAuditor" runat="server" Text="" Font-Bold="True"></asp:Label></td>
                </tr>
            </table>
            <asp:FormView runat="server" DataKeyNames="Tracking_id" DefaultMode="Edit" DataSourceID="DSPlanningScoreCard" Width="100%" ID="frmPlanningScoreCard">
                <EditItemTemplate>
                    <table class="clstbl" border="0">
                        <tr>
                            <th>Items</th>
                            <th style="width: 60px;">Yes / No</th>
                            <th>Additional Comments</th>
                        </tr>
                        <tr>
                            <td>Contract Summary</td>
                            <td class="clschkbox">
                                <asp:CheckBox ID="ContractSummaryCheckBox" runat="server" Checked='<%# Bind("ContractSummary") %>' /></td>
                            <td>
                                <asp:TextBox CssClass="clxtext" ID="ContractSummaryCommentsTextBox" runat="server" Text='<%# Bind("ContractSummaryComments") %>' /></td>
                        </tr>
                        <tr>
                            <td>Client Requirements</td>
                            <td class="clschkbox">
                                <asp:CheckBox ID="ClientRequirementsCheckBox" runat="server" Checked='<%# Bind("ClientRequirements") %>' /></td>
                            <td>
                                <asp:TextBox CssClass="clxtext" ID="ClientRequirementsCommentsTextBox" runat="server" Text='<%# Bind("ClientRequirementsComments") %>' /></td>
                        </tr>
                        <tr>
                            <td>Contact Information</td>
                            <td class="clschkbox">
                                <asp:CheckBox ID="ContactInformationCheckBox" runat="server" Checked='<%# Bind("ContactInformation") %>' /></td>
                            <td>
                                <asp:TextBox CssClass="clxtext" ID="ContactInformationCommentsTextBox" runat="server" Text='<%# Bind("ContactInformationComments") %>' /></td>
                        </tr>
                        <tr>
                            <td>Contract Owner Questionnaire</td>
                            <td class="clschkbox">
                                <asp:CheckBox ID="COQCheckBox" runat="server" Checked='<%# Bind("COQ") %>' /></td>
                            <td>
                                <asp:TextBox CssClass="clxtext" ID="COQCommentsTextBox" runat="server" Text='<%# Bind("COQComments") %>' /></td>
                        </tr>
                        <tr>
                            <td>Due Diligence Write-Up</td>
                            <td class="clschkbox">
                                <asp:CheckBox ID="DueDiligenceWriteUpCheckBox" runat="server" Checked='<%# Bind("DueDiligenceWriteUp") %>' /></td>
                            <td>
                                <asp:TextBox CssClass="clxtext" ID="DueDiligenceWriteUpCommentsTextBox" runat="server" Text='<%# Bind("DueDiligenceWriteUpComments") %>' /></td>
                        </tr>
                        <tr>
                            <td>Planning E-mails</td>
                            <td class="clschkbox">
                                <asp:CheckBox ID="PlanningEmailsCheckBox" runat="server" Checked='<%# Bind("PlanningEmails") %>' /></td>
                            <td>
                                <asp:TextBox CssClass="clxtext" ID="PlanningEmailsCommentsTextBox" runat="server" Text='<%# Bind("PlanningEmailsComments") %>' /></td>
                        </tr>
                        <tr>
                            <td>Known Items (if any)</td>
                            <td class="clschkbox">
                                <asp:CheckBox ID="KnownItemsCheckBox" runat="server" Checked='<%# Bind("KnownItems") %>' /></td>
                            <td>
                                <asp:TextBox CssClass="clxtext" ID="KnownItemsCommentsTextBox" runat="server" Text='<%# Bind("KnownItemsComments") %>' /></td>
                        </tr>
                        <tr>
                            <td>Contract Documents</td>
                            <td class="clschkbox">
                                <asp:CheckBox ID="ContractDocumentsCheckBox" runat="server" Checked='<%# Bind("ContractDocuments") %>' /></td>
                            <td>
                                <asp:TextBox CssClass="clxtext" ID="ContractDocumentsCommentsTextBox" runat="server" Text='<%# Bind("ContractDocumentsComments") %>' /></td>
                        </tr>
                        <tr>
                            <td>Notification Letter</td>
                            <td class="clschkbox">
                                <asp:CheckBox ID="NotificationLetterCheckBox" runat="server" Checked='<%# Bind("NotificationLetter") %>' /></td>
                            <td>
                                <asp:TextBox CssClass="clxtext" ID="NotificationLetterCommentsTextBox" runat="server" Text='<%# Bind("NotificationLetterComments") %>' /></td>
                        </tr>
                        <tr>
                            <td>Signed Attachment A (if signed)</td>
                            <td class="clschkbox">
                                <asp:CheckBox ID="SignedAttachmentCheckBox" runat="server" Checked='<%# Bind("SignedAttachment") %>' /></td>
                            <td>
                                <asp:TextBox CssClass="clxtext" ID="SignedAttachmentCommentsTextBox" runat="server" Text='<%# Bind("SignedAttachmentComments") %>' /></td>
                        </tr>
                        <tr>
                            <td>Onsite Letter</td>
                            <td class="clschkbox">
                                <asp:CheckBox ID="OnsiteLetterCheckBox" runat="server" Checked='<%# Bind("OnsiteLetter") %>' /></td>
                            <td>
                                <asp:TextBox CssClass="clxtext" ID="OnsiteLetterCommentsTextBox" runat="server" Text='<%# Bind("OnsiteLetterComments") %>' /></td>
                        </tr>
                        <tr>
                            <td>A/R Aging</td>
                            <td class="clschkbox">
                                <asp:CheckBox ID="ARAgingCheckBox" runat="server" Checked='<%# Bind("ARAging") %>' /></td>
                            <td>
                                <asp:TextBox CssClass="clxtext" ID="ARAgingCommentsTextBox" runat="server" Text='<%# Bind("ARAgingComments") %>' /></td>
                        </tr>
                        <tr>
                            <td>2 Sample Invoices with Back-Up</td>
                            <td class="clschkbox">
                                <asp:CheckBox ID="SampleInvoicesCheckBox" runat="server" Checked='<%# Bind("SampleInvoices") %>' /></td>
                            <td>
                                <asp:TextBox CssClass="clxtext" ID="SampleInvoicesCommentsTextBox" runat="server" Text='<%# Bind("SampleInvoicesComments") %>' /></td>
                        </tr>
                        <tr>
                            <td>Pay History and Duplicate Report</td>
                            <td class="clschkbox">
                                <asp:CheckBox ID="PayHistoryandDuplicateReportCheckBox" runat="server" Checked='<%# Bind("PayHistoryandDuplicateReport") %>' /></td>
                            <td>
                                <asp:TextBox CssClass="clxtext" ID="PayHistoryandDuplicateReportCommentsTextBox" runat="server" Text='<%# Bind("PayHistoryandDuplicateReportComments") %>' /></td>
                        </tr>
                        <tr>
                            <td>Billing Data at Line Item Level</td>
                            <td class="clschkbox">
                                <asp:CheckBox ID="BillingDatatLineItemLevelCheckBox" runat="server" Checked='<%# Bind("BillingDatatLineItemLevel") %>' /></td>
                            <td>
                                <asp:TextBox CssClass="clxtext" ID="BillingDatatLineItemLevelCommentsTextBox" runat="server" Text='<%# Bind("BillingDatatLineItemLevelComments") %>' /></td>
                        </tr>
                        <tr>
                            <td>Audit Sample<br />
                            </td>
                            <td class="clschkbox" rowspan="2">
                                <asp:CheckBox ID="AuditSampleCheckBox" runat="server" Checked='<%# Bind("AuditSample") %>' /></td>
                            <td rowspan="2">
                                <asp:TextBox CssClass="clxtext" ID="AuditSampleCommentsTextBox" runat="server" Text='<%# Bind("AuditSampleComments") %>' /></td>
                        </tr>
                        <tr>
                            <td>(Along with Sampling Strategy)</td>
                        </tr>
                        <tr>
                            <td>Payroll FilePlanning</td>
                            <td class="clschkbox">
                                <asp:CheckBox ID="PayrollFileCheckBox" runat="server" Checked='<%# Bind("PayrollFile") %>' /></td>
                            <td>
                                <asp:TextBox CssClass="clxtext" ID="PayrollFileCommentsTextBox" runat="server" Text='<%# Bind("PayrollFileComments") %>' /></td>
                        </tr>
                        <tr>
                            <td>Data Source Document</td>
                            <td class="clschkbox">
                                <asp:CheckBox ID="DataSourceDocumentCheckBox" runat="server" Checked='<%# Bind("DataSourceDocument") %>' /></td>
                            <td>
                                <asp:TextBox CssClass="clxtext" ID="DataSourceDocumentCommentsTextBox" runat="server" Text='<%# Bind("DataSourceDocumentComments") %>' /></td>
                        </tr>
                        <tr>
                            <td>SPR Claims</td>
                            <td class="clschkbox">
                                <asp:CheckBox ID="SPRClaimsCheckBox" runat="server" Checked='<%# Bind("SPRClaims") %>' /></td>
                            <td>
                                <asp:TextBox CssClass="clxtext" ID="SPRClaimsCommentsTextBox" runat="server" Text='<%# Bind("SPRClaimsComments") %>' /></td>
                        </tr>
                        <tr>
                            <td>CD Containing Digital Copies of Items</td>
                            <td class="clschkbox">
                                <asp:CheckBox ID="DigitalCopiesCheckBox" runat="server" Checked='<%# Bind("DigitalCopies") %>' /></td>
                            <td>
                                <asp:TextBox CssClass="clxtext" ID="DigitalCopiesCommentsTextBox" runat="server" Text='<%# Bind("DigitalCopiesComments") %>' /></td>
                        </tr>
                        <tr>
                            <td colspan="3" style="text-align: right">
                                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                                <a href="javascript:void();" onclick="parent.pnlPlanningScoreCard.Hide();">Cancel</a> </td>
                        </tr>
                    </table>

                </EditItemTemplate>
                <InsertItemTemplate>
                    <table class="clstbl" border="0">
                        <tr>
                            <th>Items</th>
                            <th style="width: 60px;">Yes / No</th>
                            <th>Additional Comments</th>
                        </tr>
                        <tr>
                            <td>Contract Summary</td>
                            <td class="clschkbox">
                                <asp:CheckBox ID="ContractSummaryCheckBox0" runat="server" Checked='<%# Bind("ContractSummary") %>' /></td>
                            <td>
                                <asp:TextBox CssClass="clxtext" ID="ContractSummaryCommentsTextBox0" runat="server" Text='<%# Bind("ContractSummaryComments") %>' /></td>
                        </tr>
                        <tr>
                            <td>Client Requirements</td>
                            <td class="clschkbox">
                                <asp:CheckBox ID="ClientRequirementsCheckBox0" runat="server" Checked='<%# Bind("ClientRequirements") %>' /></td>
                            <td>
                                <asp:TextBox CssClass="clxtext" ID="ClientRequirementsCommentsTextBox0" runat="server" Text='<%# Bind("ClientRequirementsComments") %>' /></td>
                        </tr>
                        <tr>
                            <td>Contact Information</td>
                            <td class="clschkbox">
                                <asp:CheckBox ID="ContactInformationCheckBox0" runat="server" Checked='<%# Bind("ContactInformation") %>' /></td>
                            <td>
                                <asp:TextBox CssClass="clxtext" ID="ContactInformationCommentsTextBox0" runat="server" Text='<%# Bind("ContactInformationComments") %>' /></td>
                        </tr>
                        <tr>
                            <td>Contract Owner Questionnaire</td>
                            <td class="clschkbox">
                                <asp:CheckBox ID="COQCheckBox0" runat="server" Checked='<%# Bind("COQ") %>' /></td>
                            <td>
                                <asp:TextBox CssClass="clxtext" ID="COQCommentsTextBox0" runat="server" Text='<%# Bind("COQComments") %>' /></td>
                        </tr>
                        <tr>
                            <td>Due Diligence Write-Up</td>
                            <td class="clschkbox">
                                <asp:CheckBox ID="DueDiligenceWriteUpCheckBox0" runat="server" Checked='<%# Bind("DueDiligenceWriteUp") %>' /></td>
                            <td>
                                <asp:TextBox CssClass="clxtext" ID="DueDiligenceWriteUpCommentsTextBox0" runat="server" Text='<%# Bind("DueDiligenceWriteUpComments") %>' /></td>
                        </tr>
                        <tr>
                            <td>Planning E-mails</td>
                            <td class="clschkbox">
                                <asp:CheckBox ID="PlanningEmailsCheckBox0" runat="server" Checked='<%# Bind("PlanningEmails") %>' /></td>
                            <td>
                                <asp:TextBox CssClass="clxtext" ID="PlanningEmailsCommentsTextBox0" runat="server" Text='<%# Bind("PlanningEmailsComments") %>' /></td>
                        </tr>
                        <tr>
                            <td>Known Items (if any)</td>
                            <td class="clschkbox">
                                <asp:CheckBox ID="KnownItemsCheckBox0" runat="server" Checked='<%# Bind("KnownItems") %>' /></td>
                            <td>
                                <asp:TextBox CssClass="clxtext" ID="KnownItemsCommentsTextBox0" runat="server" Text='<%# Bind("KnownItemsComments") %>' /></td>
                        </tr>
                        <tr>
                            <td>Contract Documents</td>
                            <td class="clschkbox">
                                <asp:CheckBox ID="ContractDocumentsCheckBox0" runat="server" Checked='<%# Bind("ContractDocuments") %>' /></td>
                            <td>
                                <asp:TextBox CssClass="clxtext" ID="ContractDocumentsCommentsTextBox0" runat="server" Text='<%# Bind("ContractDocumentsComments") %>' /></td>
                        </tr>
                        <tr>
                            <td>Notification Letter</td>
                            <td class="clschkbox">
                                <asp:CheckBox ID="NotificationLetterCheckBox0" runat="server" Checked='<%# Bind("NotificationLetter") %>' /></td>
                            <td>
                                <asp:TextBox CssClass="clxtext" ID="NotificationLetterCommentsTextBox0" runat="server" Text='<%# Bind("NotificationLetterComments") %>' /></td>
                        </tr>
                        <tr>
                            <td>Signed Attachment A (if signed)</td>
                            <td class="clschkbox">
                                <asp:CheckBox ID="SignedAttachmentCheckBox0" runat="server" Checked='<%# Bind("SignedAttachment") %>' /></td>
                            <td>
                                <asp:TextBox CssClass="clxtext" ID="SignedAttachmentCommentsTextBox0" runat="server" Text='<%# Bind("SignedAttachmentComments") %>' /></td>
                        </tr>
                        <tr>
                            <td>Onsite Letter</td>
                            <td class="clschkbox">
                                <asp:CheckBox ID="OnsiteLetterCheckBox0" runat="server" Checked='<%# Bind("OnsiteLetter") %>' /></td>
                            <td>
                                <asp:TextBox CssClass="clxtext" ID="OnsiteLetterCommentsTextBox0" runat="server" Text='<%# Bind("OnsiteLetterComments") %>' /></td>
                        </tr>
                        <tr>
                            <td>A/R Aging</td>
                            <td class="clschkbox">
                                <asp:CheckBox ID="ARAgingCheckBox0" runat="server" Checked='<%# Bind("ARAging") %>' /></td>
                            <td>
                                <asp:TextBox CssClass="clxtext" ID="ARAgingCommentsTextBox0" runat="server" Text='<%# Bind("ARAgingComments") %>' /></td>
                        </tr>
                        <tr>
                            <td>2 Sample Invoices with Back-Up</td>
                            <td class="clschkbox">
                                <asp:CheckBox ID="SampleInvoicesCheckBox0" runat="server" Checked='<%# Bind("SampleInvoices") %>' /></td>
                            <td>
                                <asp:TextBox CssClass="clxtext" ID="SampleInvoicesCommentsTextBox0" runat="server" Text='<%# Bind("SampleInvoicesComments") %>' /></td>
                        </tr>
                        <tr>
                            <td>Pay History and Duplicate Report</td>
                            <td class="clschkbox">
                                <asp:CheckBox ID="PayHistoryandDuplicateReportCheckBox0" runat="server" Checked='<%# Bind("PayHistoryandDuplicateReport") %>' /></td>
                            <td>
                                <asp:TextBox CssClass="clxtext" ID="PayHistoryandDuplicateReportCommentsTextBox0" runat="server" Text='<%# Bind("PayHistoryandDuplicateReportComments") %>' /></td>
                        </tr>
                        <tr>
                            <td>Billing Data at Line Item Level</td>
                            <td class="clschkbox">
                                <asp:CheckBox ID="BillingDatatLineItemLevelCheckBox0" runat="server" Checked='<%# Bind("BillingDatatLineItemLevel") %>' /></td>
                            <td>
                                <asp:TextBox CssClass="clxtext" ID="BillingDatatLineItemLevelCommentsTextBox0" runat="server" Text='<%# Bind("BillingDatatLineItemLevelComments") %>' /></td>
                        </tr>
                        <tr>
                            <td>Audit Sample<br />
                            </td>
                            <td class="clschkbox" rowspan="2">
                                <asp:CheckBox ID="AuditSampleCheckBox0" runat="server" Checked='<%# Bind("AuditSample") %>' /></td>
                            <td rowspan="2">
                                <asp:TextBox CssClass="clxtext" ID="AuditSampleCommentsTextBox0" runat="server" Text='<%# Bind("AuditSampleComments") %>' /></td>
                        </tr>
                        <tr>
                            <td>(Along with Sampling Strategy)</td>
                        </tr>
                        <tr>
                            <td>Payroll FilePlanning</td>
                            <td class="clschkbox">
                                <asp:CheckBox ID="PayrollFileCheckBox0" runat="server" Checked='<%# Bind("PayrollFile") %>' /></td>
                            <td>
                                <asp:TextBox CssClass="clxtext" ID="PayrollFileCommentsTextBox0" runat="server" Text='<%# Bind("PayrollFileComments") %>' /></td>
                        </tr>
                        <tr>
                            <td>Data Source Document</td>
                            <td class="clschkbox">
                                <asp:CheckBox ID="DataSourceDocumentCheckBox0" runat="server" Checked='<%# Bind("DataSourceDocument") %>' /></td>
                            <td>
                                <asp:TextBox CssClass="clxtext" ID="DataSourceDocumentCommentsTextBox0" runat="server" Text='<%# Bind("DataSourceDocumentComments") %>' /></td>
                        </tr>
                        <tr>
                            <td>SPR Claims</td>
                            <td class="clschkbox">
                                <asp:CheckBox ID="SPRClaimsCheckBox0" runat="server" Checked='<%# Bind("SPRClaims") %>' /></td>
                            <td>
                                <asp:TextBox CssClass="clxtext" ID="SPRClaimsCommentsTextBox0" runat="server" Text='<%# Bind("SPRClaimsComments") %>' /></td>
                        </tr>
                        <tr>
                            <td>CD Containing Digital Copies of Items</td>
                            <td class="clschkbox">
                                <asp:CheckBox ID="DigitalCopiesCheckBox0" runat="server" Checked='<%# Bind("DigitalCopies") %>' /></td>
                            <td>
                                <asp:TextBox CssClass="clxtext" ID="DigitalCopiesCommentsTextBox0" runat="server" Text='<%# Bind("DigitalCopiesComments") %>' /></td>
                        </tr>
                        <tr>
                            <td colspan="3" style="text-align: right">
                                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                                <a href="javascript:void();" onclick="parent.pnlPlanningScoreCard.Hide();">Cancel</a> </td>
                        </tr>
                    </table>

                </InsertItemTemplate>

            </asp:FormView>


            <asp:SqlDataSource runat="server" ConnectionString="<%$ ConnectionStrings:CCUpdate %>" InsertCommand="WebInsertPlanningScoreCard" SelectCommand="WebSelectPlanningScoreCard" UpdateCommand="WebUpdatePlanningScoreCard" ID="DSPlanningScoreCard" InsertCommandType="StoredProcedure" SelectCommandType="StoredProcedure" UpdateCommandType="StoredProcedure">
                <InsertParameters>
                    <asp:Parameter Name="ContractSummary" Type="Boolean"></asp:Parameter>
                    <asp:Parameter Name="ContractSummaryComments" Type="String"></asp:Parameter>
                    <asp:Parameter Name="ClientRequirements" Type="Boolean"></asp:Parameter>
                    <asp:Parameter Name="ClientRequirementsComments" Type="String"></asp:Parameter>
                    <asp:Parameter Name="ContactInformation" Type="Boolean"></asp:Parameter>
                    <asp:Parameter Name="ContactInformationComments" Type="String"></asp:Parameter>
                    <asp:Parameter Name="COQ" Type="Boolean"></asp:Parameter>
                    <asp:Parameter Name="COQComments" Type="String"></asp:Parameter>
                    <asp:Parameter Name="DueDiligenceWriteUp" Type="Boolean"></asp:Parameter>
                    <asp:Parameter Name="DueDiligenceWriteUpComments" Type="String"></asp:Parameter>
                    <asp:Parameter Name="PlanningEmails" Type="Boolean"></asp:Parameter>
                    <asp:Parameter Name="PlanningEmailsComments" Type="String"></asp:Parameter>
                    <asp:Parameter Name="KnownItems" Type="Boolean"></asp:Parameter>
                    <asp:Parameter Name="KnownItemsComments" Type="String"></asp:Parameter>
                    <asp:Parameter Name="ContractDocuments" Type="Boolean"></asp:Parameter>
                    <asp:Parameter Name="ContractDocumentsComments" Type="String"></asp:Parameter>
                    <asp:Parameter Name="NotificationLetter" Type="Boolean"></asp:Parameter>
                    <asp:Parameter Name="NotificationLetterComments" Type="String"></asp:Parameter>
                    <asp:Parameter Name="SignedAttachment" Type="Boolean"></asp:Parameter>
                    <asp:Parameter Name="SignedAttachmentComments" Type="String"></asp:Parameter>
                    <asp:Parameter Name="OnsiteLetter" Type="Boolean"></asp:Parameter>
                    <asp:Parameter Name="OnsiteLetterComments" Type="String"></asp:Parameter>
                    <asp:Parameter Name="ARAging" Type="Boolean"></asp:Parameter>
                    <asp:Parameter Name="ARAgingComments" Type="String"></asp:Parameter>
                    <asp:Parameter Name="SampleInvoices" Type="Boolean"></asp:Parameter>
                    <asp:Parameter Name="SampleInvoicesComments" Type="String"></asp:Parameter>
                    <asp:Parameter Name="PayHistoryandDuplicateReport" Type="Boolean"></asp:Parameter>
                    <asp:Parameter Name="PayHistoryandDuplicateReportComments" Type="String"></asp:Parameter>
                    <asp:Parameter Name="BillingDatatLineItemLevel" Type="Boolean"></asp:Parameter>
                    <asp:Parameter Name="BillingDatatLineItemLevelComments" Type="String"></asp:Parameter>
                    <asp:Parameter Name="AuditSample" Type="Boolean"></asp:Parameter>
                    <asp:Parameter Name="AuditSampleComments" Type="String"></asp:Parameter>
                    <asp:Parameter Name="PayrollFile" Type="Boolean"></asp:Parameter>
                    <asp:Parameter Name="PayrollFileComments" Type="String"></asp:Parameter>
                    <asp:Parameter Name="DataSourceDocument" Type="Boolean"></asp:Parameter>
                    <asp:Parameter Name="DataSourceDocumentComments" Type="String"></asp:Parameter>
                    <asp:Parameter Name="SPRClaims" Type="Boolean"></asp:Parameter>
                    <asp:Parameter Name="SPRClaimsComments" Type="String"></asp:Parameter>
                    <asp:Parameter Name="DigitalCopies" Type="Boolean"></asp:Parameter>
                    <asp:Parameter Name="DigitalCopiesComments" Type="String"></asp:Parameter>
                    <asp:Parameter Name="crtd_dttm" Type="DateTime"></asp:Parameter>
                    <asp:Parameter Name="crtd_user" Type="String"></asp:Parameter>
                    <asp:Parameter Name="Tracking_id" Type="Int32"></asp:Parameter>
                </InsertParameters>
                <SelectParameters>
                    <asp:QueryStringParameter DefaultValue="0" Name="Tracking_id" QueryStringField="tid" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="ContractSummary" Type="Boolean"></asp:Parameter>
                    <asp:Parameter Name="ContractSummaryComments" Type="String"></asp:Parameter>
                    <asp:Parameter Name="ClientRequirements" Type="Boolean"></asp:Parameter>
                    <asp:Parameter Name="ClientRequirementsComments" Type="String"></asp:Parameter>
                    <asp:Parameter Name="ContactInformation" Type="Boolean"></asp:Parameter>
                    <asp:Parameter Name="ContactInformationComments" Type="String"></asp:Parameter>
                    <asp:Parameter Name="COQ" Type="Boolean"></asp:Parameter>
                    <asp:Parameter Name="COQComments" Type="String"></asp:Parameter>
                    <asp:Parameter Name="DueDiligenceWriteUp" Type="Boolean"></asp:Parameter>
                    <asp:Parameter Name="DueDiligenceWriteUpComments" Type="String"></asp:Parameter>
                    <asp:Parameter Name="PlanningEmails" Type="Boolean"></asp:Parameter>
                    <asp:Parameter Name="PlanningEmailsComments" Type="String"></asp:Parameter>
                    <asp:Parameter Name="KnownItems" Type="Boolean"></asp:Parameter>
                    <asp:Parameter Name="KnownItemsComments" Type="String"></asp:Parameter>
                    <asp:Parameter Name="ContractDocuments" Type="Boolean"></asp:Parameter>
                    <asp:Parameter Name="ContractDocumentsComments" Type="String"></asp:Parameter>
                    <asp:Parameter Name="NotificationLetter" Type="Boolean"></asp:Parameter>
                    <asp:Parameter Name="NotificationLetterComments" Type="String"></asp:Parameter>
                    <asp:Parameter Name="SignedAttachment" Type="Boolean"></asp:Parameter>
                    <asp:Parameter Name="SignedAttachmentComments" Type="String"></asp:Parameter>
                    <asp:Parameter Name="OnsiteLetter" Type="Boolean"></asp:Parameter>
                    <asp:Parameter Name="OnsiteLetterComments" Type="String"></asp:Parameter>
                    <asp:Parameter Name="ARAging" Type="Boolean"></asp:Parameter>
                    <asp:Parameter Name="ARAgingComments" Type="String"></asp:Parameter>
                    <asp:Parameter Name="SampleInvoices" Type="Boolean"></asp:Parameter>
                    <asp:Parameter Name="SampleInvoicesComments" Type="String"></asp:Parameter>
                    <asp:Parameter Name="PayHistoryandDuplicateReport" Type="Boolean"></asp:Parameter>
                    <asp:Parameter Name="PayHistoryandDuplicateReportComments" Type="String"></asp:Parameter>
                    <asp:Parameter Name="BillingDatatLineItemLevel" Type="Boolean"></asp:Parameter>
                    <asp:Parameter Name="BillingDatatLineItemLevelComments" Type="String"></asp:Parameter>
                    <asp:Parameter Name="AuditSample" Type="Boolean"></asp:Parameter>
                    <asp:Parameter Name="AuditSampleComments" Type="String"></asp:Parameter>
                    <asp:Parameter Name="PayrollFile" Type="Boolean"></asp:Parameter>
                    <asp:Parameter Name="PayrollFileComments" Type="String"></asp:Parameter>
                    <asp:Parameter Name="DataSourceDocument" Type="Boolean"></asp:Parameter>
                    <asp:Parameter Name="DataSourceDocumentComments" Type="String"></asp:Parameter>
                    <asp:Parameter Name="SPRClaims" Type="Boolean"></asp:Parameter>
                    <asp:Parameter Name="SPRClaimsComments" Type="String"></asp:Parameter>
                    <asp:Parameter Name="DigitalCopies" Type="Boolean"></asp:Parameter>
                    <asp:Parameter Name="DigitalCopiesComments" Type="String"></asp:Parameter>
                    <asp:Parameter Name="crtd_dttm" Type="DateTime"></asp:Parameter>
                    <asp:Parameter Name="crtd_user" Type="String"></asp:Parameter>
                    <asp:Parameter Name="Tracking_id" Type="Int32"></asp:Parameter>
                </UpdateParameters>
            </asp:SqlDataSource>


        </div>
    </form>
</body>
</html>
