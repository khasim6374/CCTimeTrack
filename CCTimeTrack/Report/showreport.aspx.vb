Imports System.IO
Imports DevExpress.XtraPrinting
Imports DevExpress.XtraReports.Web
Public Class showreport
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        RoutingSlipReport()
    End Sub
    Private Sub RoutingSlipReport()
        Dim InvoiceID As Int32 = Convert.ToInt32(Request.QueryString("iid"))
        Dim btype = Convert.ToString(Request.QueryString("btype"))
        Dim objStatus As New rptInvoiceMaster(InvoiceID, btype)
        Dim rptViewer As New ReportViewer()
        Dim ms As New MemoryStream()
        rptViewer.Report = objStatus
        objStatus.CreateDocument()
        Dim pdfExpo As New PdfExportOptions()
        objStatus.ExportToPdf(ms, pdfExpo)
        ms.Seek(0, SeekOrigin.Begin)
        Dim reportData = ms.ToArray()
        Response.Clear()
        Response.AddHeader("Content-Disposition", "attachment; filename=Invoice.pdf")
        Response.AddHeader("Content-Length", reportData.Length.ToString())
        Response.ContentType = "application/pdf"
        Response.BinaryWrite(reportData)
    End Sub
End Class