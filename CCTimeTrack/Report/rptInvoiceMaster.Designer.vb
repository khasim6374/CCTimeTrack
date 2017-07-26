<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Public Class rptInvoiceMaster
    Inherits DevExpress.XtraReports.UI.XtraReport

    'XtraReport overrides dispose to clean up the component list.
    <System.Diagnostics.DebuggerNonUserCode()> _
    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        If disposing AndAlso components IsNot Nothing Then
            components.Dispose()
        End If
        MyBase.Dispose(disposing)
    End Sub

    'Required by the Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Designer
    'It can be modified using the Designer.  
    'Do not modify it using the code editor.
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(rptInvoiceMaster))
        Dim XrSummary1 As DevExpress.XtraReports.UI.XRSummary = New DevExpress.XtraReports.UI.XRSummary()
        Dim XrSummary2 As DevExpress.XtraReports.UI.XRSummary = New DevExpress.XtraReports.UI.XRSummary()
        Dim XrSummary3 As DevExpress.XtraReports.UI.XRSummary = New DevExpress.XtraReports.UI.XRSummary()
        Me.Detail = New DevExpress.XtraReports.UI.DetailBand()
        Me.TopMargin = New DevExpress.XtraReports.UI.TopMarginBand()
        Me.BottomMargin = New DevExpress.XtraReports.UI.BottomMarginBand()
        Me.DsReport1 = New DSReport()
        Me.WebgetInvoice_spTableAdapter = New DSReportTableAdapters.WebgetInvoice_spTableAdapter()
        Me.ReportHeader = New DevExpress.XtraReports.UI.ReportHeaderBand()
        Me.XrPictureBox1 = New DevExpress.XtraReports.UI.XRPictureBox()
        Me.PageHeader = New DevExpress.XtraReports.UI.PageHeaderBand()
        Me.XrLine8 = New DevExpress.XtraReports.UI.XRLine()
        Me.XrLine7 = New DevExpress.XtraReports.UI.XRLine()
        Me.XrLine6 = New DevExpress.XtraReports.UI.XRLine()
        Me.XrLine5 = New DevExpress.XtraReports.UI.XRLine()
        Me.XrLine4 = New DevExpress.XtraReports.UI.XRLine()
        Me.XrLabel37 = New DevExpress.XtraReports.UI.XRLabel()
        Me.XrLabel36 = New DevExpress.XtraReports.UI.XRLabel()
        Me.XrLabel35 = New DevExpress.XtraReports.UI.XRLabel()
        Me.XrLabel34 = New DevExpress.XtraReports.UI.XRLabel()
        Me.XrLabel33 = New DevExpress.XtraReports.UI.XRLabel()
        Me.XrLabel32 = New DevExpress.XtraReports.UI.XRLabel()
        Me.XrLabel31 = New DevExpress.XtraReports.UI.XRLabel()
        Me.XrLabel25 = New DevExpress.XtraReports.UI.XRLabel()
        Me.showPGCol = New DevExpress.XtraReports.UI.FormattingRule()
        Me.XrLabel24 = New DevExpress.XtraReports.UI.XRLabel()
        Me.showGSCol = New DevExpress.XtraReports.UI.FormattingRule()
        Me.XrLabel23 = New DevExpress.XtraReports.UI.XRLabel()
        Me.XrLabel22 = New DevExpress.XtraReports.UI.XRLabel()
        Me.ShowColHead = New DevExpress.XtraReports.UI.FormattingRule()
        Me.XrLabel21 = New DevExpress.XtraReports.UI.XRLabel()
        Me.XrLabel20 = New DevExpress.XtraReports.UI.XRLabel()
        Me.XrLabel19 = New DevExpress.XtraReports.UI.XRLabel()
        Me.XrLabel18 = New DevExpress.XtraReports.UI.XRLabel()
        Me.XrLabel17 = New DevExpress.XtraReports.UI.XRLabel()
        Me.XrLabel16 = New DevExpress.XtraReports.UI.XRLabel()
        Me.XrLabel15 = New DevExpress.XtraReports.UI.XRLabel()
        Me.XrLabel14 = New DevExpress.XtraReports.UI.XRLabel()
        Me.XrLabel13 = New DevExpress.XtraReports.UI.XRLabel()
        Me.XrLabel12 = New DevExpress.XtraReports.UI.XRLabel()
        Me.XrLabel11 = New DevExpress.XtraReports.UI.XRLabel()
        Me.XrLabel10 = New DevExpress.XtraReports.UI.XRLabel()
        Me.XrLabel9 = New DevExpress.XtraReports.UI.XRLabel()
        Me.XrLabel8 = New DevExpress.XtraReports.UI.XRLabel()
        Me.XrLabel7 = New DevExpress.XtraReports.UI.XRLabel()
        Me.XrLabel6 = New DevExpress.XtraReports.UI.XRLabel()
        Me.XrLabel5 = New DevExpress.XtraReports.UI.XRLabel()
        Me.XrLabel4 = New DevExpress.XtraReports.UI.XRLabel()
        Me.XrLabel3 = New DevExpress.XtraReports.UI.XRLabel()
        Me.XrLabel2 = New DevExpress.XtraReports.UI.XRLabel()
        Me.XrLabel1 = New DevExpress.XtraReports.UI.XRLabel()
        Me.DetailReport = New DevExpress.XtraReports.UI.DetailReportBand()
        Me.Detail1 = New DevExpress.XtraReports.UI.DetailBand()
        Me.lblLowerShare = New DevExpress.XtraReports.UI.XRLabel()
        Me.XrTable1 = New DevExpress.XtraReports.UI.XRTable()
        Me.XrTableRow1 = New DevExpress.XtraReports.UI.XRTableRow()
        Me.lblRowCount = New DevExpress.XtraReports.UI.XRTableCell()
        Me.lblShareStatus = New DevExpress.XtraReports.UI.XRTableCell()
        Me.XrTableCell4 = New DevExpress.XtraReports.UI.XRTableCell()
        Me.XrTableCell5 = New DevExpress.XtraReports.UI.XRTableCell()
        Me.lblTotal = New DevExpress.XtraReports.UI.XRTableCell()
        Me.WebgetInvoiceDetails_spTableAdapter = New DSReportTableAdapters.WebgetInvoiceDetails_spTableAdapter()
        Me.IsShowPerGurCol = New DevExpress.XtraReports.UI.FormattingRule()
        Me.lblTotalFees = New DevExpress.XtraReports.UI.XRLabel()
        Me.XrLabel27 = New DevExpress.XtraReports.UI.XRLabel()
        Me.ReportFooter = New DevExpress.XtraReports.UI.ReportFooterBand()
        Me.TravelAmtLine = New DevExpress.XtraReports.UI.XRLine()
        Me.XrLabel39 = New DevExpress.XtraReports.UI.XRLabel()
        Me.showTravelAmt = New DevExpress.XtraReports.UI.FormattingRule()
        Me.lblTravelAmt = New DevExpress.XtraReports.UI.XRLabel()
        Me.lblTotalInvoice = New DevExpress.XtraReports.UI.XRLabel()
        Me.XrLabel29 = New DevExpress.XtraReports.UI.XRLabel()
        Me.XrLabel28 = New DevExpress.XtraReports.UI.XRLabel()
        Me.PageFooter = New DevExpress.XtraReports.UI.PageFooterBand()
        Me.XrLabel26 = New DevExpress.XtraReports.UI.XRLabel()
        Me.Revenewgainshare = New DevExpress.XtraReports.UI.CalculatedField()
        Me.sumPGAmt = New DevExpress.XtraReports.UI.CalculatedField()
        Me.sumGSAmt = New DevExpress.XtraReports.UI.CalculatedField()
        Me.TotalInvoice = New DevExpress.XtraReports.UI.CalculatedField()
        Me.SumTotal = New DevExpress.XtraReports.UI.CalculatedField()
        CType(Me.DsReport1, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.XrTable1, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me, System.ComponentModel.ISupportInitialize).BeginInit()
        '
        'Detail
        '
        Me.Detail.HeightF = 0.0!
        Me.Detail.Name = "Detail"
        Me.Detail.Padding = New DevExpress.XtraPrinting.PaddingInfo(0, 0, 0, 0, 100.0!)
        Me.Detail.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopLeft
        '
        'TopMargin
        '
        Me.TopMargin.Font = New System.Drawing.Font("Calibri", 9.75!)
        Me.TopMargin.HeightF = 4.166667!
        Me.TopMargin.Name = "TopMargin"
        Me.TopMargin.Padding = New DevExpress.XtraPrinting.PaddingInfo(0, 0, 0, 0, 100.0!)
        Me.TopMargin.StylePriority.UseFont = False
        Me.TopMargin.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopLeft
        '
        'BottomMargin
        '
        Me.BottomMargin.HeightF = 43.33333!
        Me.BottomMargin.Name = "BottomMargin"
        Me.BottomMargin.Padding = New DevExpress.XtraPrinting.PaddingInfo(0, 0, 0, 0, 100.0!)
        Me.BottomMargin.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopLeft
        '
        'DsReport1
        '
        Me.DsReport1.DataSetName = "DSReport"
        Me.DsReport1.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema
        '
        'WebgetInvoice_spTableAdapter
        '
        Me.WebgetInvoice_spTableAdapter.ClearBeforeFill = True
        '
        'ReportHeader
        '
        Me.ReportHeader.Controls.AddRange(New DevExpress.XtraReports.UI.XRControl() {Me.XrPictureBox1})
        Me.ReportHeader.HeightF = 86.66666!
        Me.ReportHeader.Name = "ReportHeader"
        '
        'XrPictureBox1
        '
        Me.XrPictureBox1.Image = CType(resources.GetObject("XrPictureBox1.Image"), System.Drawing.Image)
        Me.XrPictureBox1.LocationFloat = New DevExpress.Utils.PointFloat(211.1666!, 0.0!)
        Me.XrPictureBox1.Name = "XrPictureBox1"
        Me.XrPictureBox1.SizeF = New System.Drawing.SizeF(204.1667!, 65.0!)
        Me.XrPictureBox1.Sizing = DevExpress.XtraPrinting.ImageSizeMode.AutoSize
        '
        'PageHeader
        '
        Me.PageHeader.Controls.AddRange(New DevExpress.XtraReports.UI.XRControl() {Me.XrLine8, Me.XrLine7, Me.XrLine6, Me.XrLine5, Me.XrLine4, Me.XrLabel37, Me.XrLabel36, Me.XrLabel35, Me.XrLabel34, Me.XrLabel33, Me.XrLabel32, Me.XrLabel31, Me.XrLabel25, Me.XrLabel24, Me.XrLabel23, Me.XrLabel22, Me.XrLabel21, Me.XrLabel20, Me.XrLabel19, Me.XrLabel18, Me.XrLabel17, Me.XrLabel16, Me.XrLabel15, Me.XrLabel14, Me.XrLabel13, Me.XrLabel12, Me.XrLabel11, Me.XrLabel10, Me.XrLabel9, Me.XrLabel8, Me.XrLabel7, Me.XrLabel6, Me.XrLabel5, Me.XrLabel4, Me.XrLabel3, Me.XrLabel2, Me.XrLabel1})
        Me.PageHeader.HeightF = 482.5002!
        Me.PageHeader.Name = "PageHeader"
        '
        'XrLine8
        '
        Me.XrLine8.LocationFloat = New DevExpress.Utils.PointFloat(467.1667!, 45.5!)
        Me.XrLine8.Name = "XrLine8"
        Me.XrLine8.SizeF = New System.Drawing.SizeF(249.6667!, 2.0!)
        '
        'XrLine7
        '
        Me.XrLine7.LineDirection = DevExpress.XtraReports.UI.LineDirection.Vertical
        Me.XrLine7.LocationFloat = New DevExpress.Utils.PointFloat(713.5001!, 47.5!)
        Me.XrLine7.Name = "XrLine7"
        Me.XrLine7.SizeF = New System.Drawing.SizeF(3.333313!, 124.5!)
        '
        'XrLine6
        '
        Me.XrLine6.LineDirection = DevExpress.XtraReports.UI.LineDirection.Vertical
        Me.XrLine6.LocationFloat = New DevExpress.Utils.PointFloat(467.1667!, 47.5!)
        Me.XrLine6.Name = "XrLine6"
        Me.XrLine6.SizeF = New System.Drawing.SizeF(2.0!, 124.5!)
        '
        'XrLine5
        '
        Me.XrLine5.LocationFloat = New DevExpress.Utils.PointFloat(467.1667!, 172.0!)
        Me.XrLine5.Name = "XrLine5"
        Me.XrLine5.SizeF = New System.Drawing.SizeF(249.6667!, 2.0!)
        '
        'XrLine4
        '
        Me.XrLine4.LocationFloat = New DevExpress.Utils.PointFloat(474.6668!, 120.0!)
        Me.XrLine4.Name = "XrLine4"
        Me.XrLine4.SizeF = New System.Drawing.SizeF(234.8333!, 23.0!)
        '
        'XrLabel37
        '
        Me.XrLabel37.DataBindings.AddRange(New DevExpress.XtraReports.UI.XRBinding() {New DevExpress.XtraReports.UI.XRBinding("Text", Nothing, "WebgetInvoice_sp.TaxID")})
        Me.XrLabel37.Font = New System.Drawing.Font("Calibri", 9.75!, System.Drawing.FontStyle.Bold)
        Me.XrLabel37.LocationFloat = New DevExpress.Utils.PointFloat(474.6668!, 143.0!)
        Me.XrLabel37.Name = "XrLabel37"
        Me.XrLabel37.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.XrLabel37.SizeF = New System.Drawing.SizeF(234.8333!, 23.0!)
        Me.XrLabel37.StylePriority.UseFont = False
        Me.XrLabel37.StylePriority.UseTextAlignment = False
        Me.XrLabel37.Text = "XrLabel37"
        Me.XrLabel37.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleCenter
        '
        'XrLabel36
        '
        Me.XrLabel36.DataBindings.AddRange(New DevExpress.XtraReports.UI.XRBinding() {New DevExpress.XtraReports.UI.XRBinding("Text", Nothing, "WebgetInvoice_sp.Terms")})
        Me.XrLabel36.Font = New System.Drawing.Font("Calibri", 9.75!, System.Drawing.FontStyle.Bold)
        Me.XrLabel36.LocationFloat = New DevExpress.Utils.PointFloat(598.0!, 97.00001!)
        Me.XrLabel36.Name = "XrLabel36"
        Me.XrLabel36.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.XrLabel36.SizeF = New System.Drawing.SizeF(111.5001!, 22.99999!)
        Me.XrLabel36.StylePriority.UseFont = False
        Me.XrLabel36.Text = "XrLabel36"
        '
        'XrLabel35
        '
        Me.XrLabel35.DataBindings.AddRange(New DevExpress.XtraReports.UI.XRBinding() {New DevExpress.XtraReports.UI.XRBinding("Text", Nothing, "WebgetInvoice_sp.InvoiceNumber")})
        Me.XrLabel35.Font = New System.Drawing.Font("Calibri", 9.75!, System.Drawing.FontStyle.Bold)
        Me.XrLabel35.LocationFloat = New DevExpress.Utils.PointFloat(598.0!, 51.00001!)
        Me.XrLabel35.Name = "XrLabel35"
        Me.XrLabel35.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.XrLabel35.SizeF = New System.Drawing.SizeF(111.5001!, 23.0!)
        Me.XrLabel35.StylePriority.UseFont = False
        Me.XrLabel35.Text = "XrLabel35"
        '
        'XrLabel34
        '
        Me.XrLabel34.DataBindings.AddRange(New DevExpress.XtraReports.UI.XRBinding() {New DevExpress.XtraReports.UI.XRBinding("Text", Nothing, "WebgetInvoice_sp.InvoiceDate", "{0:MM/dd/yyyy}")})
        Me.XrLabel34.Font = New System.Drawing.Font("Calibri", 9.75!, System.Drawing.FontStyle.Bold)
        Me.XrLabel34.LocationFloat = New DevExpress.Utils.PointFloat(598.0!, 74.00001!)
        Me.XrLabel34.Name = "XrLabel34"
        Me.XrLabel34.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.XrLabel34.SizeF = New System.Drawing.SizeF(111.5001!, 23.0!)
        Me.XrLabel34.StylePriority.UseFont = False
        Me.XrLabel34.Text = "XrLabel34"
        '
        'XrLabel33
        '
        Me.XrLabel33.Font = New System.Drawing.Font("Calibri", 9.75!, System.Drawing.FontStyle.Bold)
        Me.XrLabel33.LocationFloat = New DevExpress.Utils.PointFloat(474.6668!, 97.00001!)
        Me.XrLabel33.Name = "XrLabel33"
        Me.XrLabel33.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.XrLabel33.SizeF = New System.Drawing.SizeF(123.3332!, 23.0!)
        Me.XrLabel33.StylePriority.UseFont = False
        Me.XrLabel33.Text = "Terms:"
        '
        'XrLabel32
        '
        Me.XrLabel32.Font = New System.Drawing.Font("Calibri", 9.75!, System.Drawing.FontStyle.Bold)
        Me.XrLabel32.LocationFloat = New DevExpress.Utils.PointFloat(474.6668!, 74.00001!)
        Me.XrLabel32.Name = "XrLabel32"
        Me.XrLabel32.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.XrLabel32.SizeF = New System.Drawing.SizeF(123.3332!, 23.0!)
        Me.XrLabel32.StylePriority.UseFont = False
        Me.XrLabel32.Text = "Invoice Date:"
        '
        'XrLabel31
        '
        Me.XrLabel31.Font = New System.Drawing.Font("Calibri", 9.75!, System.Drawing.FontStyle.Bold)
        Me.XrLabel31.LocationFloat = New DevExpress.Utils.PointFloat(474.6668!, 51.00001!)
        Me.XrLabel31.Name = "XrLabel31"
        Me.XrLabel31.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.XrLabel31.SizeF = New System.Drawing.SizeF(123.3332!, 23.0!)
        Me.XrLabel31.StylePriority.UseFont = False
        Me.XrLabel31.Text = "Invoice Number:"
        '
        'XrLabel25
        '
        Me.XrLabel25.Font = New System.Drawing.Font("Calibri", 9.75!)
        Me.XrLabel25.FormattingRules.Add(Me.showPGCol)
        Me.XrLabel25.LocationFloat = New DevExpress.Utils.PointFloat(509.5001!, 442.0001!)
        Me.XrLabel25.Name = "XrLabel25"
        Me.XrLabel25.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.XrLabel25.SizeF = New System.Drawing.SizeF(88.49994!, 23.00003!)
        Me.XrLabel25.StylePriority.UseFont = False
        Me.XrLabel25.StylePriority.UseTextAlignment = False
        Me.XrLabel25.Text = "%"
        Me.XrLabel25.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleCenter
        '
        'showPGCol
        '
        Me.showPGCol.Condition = "[sumPGAmt]<1"
        Me.showPGCol.DataMember = "WebgetInvoiceDetails_sp"
        '
        '
        '
        Me.showPGCol.Formatting.Visible = DevExpress.Utils.DefaultBoolean.[False]
        Me.showPGCol.Name = "showPGCol"
        '
        'XrLabel24
        '
        Me.XrLabel24.Font = New System.Drawing.Font("Calibri", 9.75!)
        Me.XrLabel24.FormattingRules.Add(Me.showGSCol)
        Me.XrLabel24.LocationFloat = New DevExpress.Utils.PointFloat(413.9927!, 442.0001!)
        Me.XrLabel24.Name = "XrLabel24"
        Me.XrLabel24.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.XrLabel24.SizeF = New System.Drawing.SizeF(95.50739!, 23.00003!)
        Me.XrLabel24.StylePriority.UseFont = False
        Me.XrLabel24.StylePriority.UseTextAlignment = False
        Me.XrLabel24.Text = "%"
        Me.XrLabel24.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleCenter
        '
        'showGSCol
        '
        Me.showGSCol.Condition = "[sumGSAmt]<1"
        Me.showGSCol.DataMember = "WebgetInvoiceDetails_sp"
        '
        '
        '
        Me.showGSCol.Formatting.Visible = DevExpress.Utils.DefaultBoolean.[False]
        Me.showGSCol.Name = "showGSCol"
        '
        'XrLabel23
        '
        Me.XrLabel23.Font = New System.Drawing.Font("Calibri", 9.75!)
        Me.XrLabel23.LocationFloat = New DevExpress.Utils.PointFloat(10.0!, 442.0001!)
        Me.XrLabel23.Name = "XrLabel23"
        Me.XrLabel23.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.XrLabel23.SizeF = New System.Drawing.SizeF(347.8144!, 23.00003!)
        Me.XrLabel23.StylePriority.UseFont = False
        Me.XrLabel23.Text = "Revenew gainshare rate:"
        '
        'XrLabel22
        '
        Me.XrLabel22.Font = New System.Drawing.Font("Calibri", 9.75!)
        Me.XrLabel22.FormattingRules.Add(Me.ShowColHead)
        Me.XrLabel22.LocationFloat = New DevExpress.Utils.PointFloat(509.5001!, 419.0001!)
        Me.XrLabel22.Multiline = True
        Me.XrLabel22.Name = "XrLabel22"
        Me.XrLabel22.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.XrLabel22.SizeF = New System.Drawing.SizeF(88.49994!, 22.99997!)
        Me.XrLabel22.StylePriority.UseFont = False
        Me.XrLabel22.StylePriority.UseTextAlignment = False
        Me.XrLabel22.Text = "*PG"
        Me.XrLabel22.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleCenter
        '
        'ShowColHead
        '
        Me.ShowColHead.Condition = "[sumPGAmt]<1"
        Me.ShowColHead.DataMember = "WebgetInvoiceDetails_sp"
        '
        '
        '
        Me.ShowColHead.Formatting.Visible = DevExpress.Utils.DefaultBoolean.[False]
        Me.ShowColHead.Name = "ShowColHead"
        '
        'XrLabel21
        '
        Me.XrLabel21.DataBindings.AddRange(New DevExpress.XtraReports.UI.XRBinding() {New DevExpress.XtraReports.UI.XRBinding("Text", Nothing, "WebgetInvoice_sp.Invoice Type")})
        Me.XrLabel21.Font = New System.Drawing.Font("Calibri", 9.75!)
        Me.XrLabel21.LocationFloat = New DevExpress.Utils.PointFloat(600.3334!, 219.0!)
        Me.XrLabel21.Name = "XrLabel21"
        Me.XrLabel21.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.XrLabel21.SizeF = New System.Drawing.SizeF(15.66687!, 23.00003!)
        Me.XrLabel21.StylePriority.UseFont = False
        Me.XrLabel21.Text = "XrLabel21"
        Me.XrLabel21.Visible = False
        '
        'XrLabel20
        '
        Me.XrLabel20.DataBindings.AddRange(New DevExpress.XtraReports.UI.XRBinding() {New DevExpress.XtraReports.UI.XRBinding("Text", Nothing, "WebgetInvoice_sp.SettlementAmount", "{0:c2}")})
        Me.XrLabel20.Font = New System.Drawing.Font("Calibri", 9.75!)
        Me.XrLabel20.LocationFloat = New DevExpress.Utils.PointFloat(616.8334!, 400.0001!)
        Me.XrLabel20.Name = "XrLabel20"
        Me.XrLabel20.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.XrLabel20.SizeF = New System.Drawing.SizeF(100.0001!, 22.99997!)
        Me.XrLabel20.StylePriority.UseFont = False
        Me.XrLabel20.StylePriority.UseTextAlignment = False
        Me.XrLabel20.Text = "XrLabel20"
        Me.XrLabel20.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleRight
        '
        'XrLabel19
        '
        Me.XrLabel19.Font = New System.Drawing.Font("Calibri", 9.75!)
        Me.XrLabel19.LocationFloat = New DevExpress.Utils.PointFloat(10.0!, 400.0001!)
        Me.XrLabel19.Name = "XrLabel19"
        Me.XrLabel19.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.XrLabel19.SizeF = New System.Drawing.SizeF(380.0!, 23.0!)
        Me.XrLabel19.StylePriority.UseFont = False
        Me.XrLabel19.Text = "Total amount recovered"
        '
        'XrLabel18
        '
        Me.XrLabel18.DataBindings.AddRange(New DevExpress.XtraReports.UI.XRBinding() {New DevExpress.XtraReports.UI.XRBinding("Text", Nothing, "WebgetInvoice_sp.Description")})
        Me.XrLabel18.Font = New System.Drawing.Font("Calibri", 9.75!)
        Me.XrLabel18.LocationFloat = New DevExpress.Utils.PointFloat(0.0!, 363.0001!)
        Me.XrLabel18.Name = "XrLabel18"
        Me.XrLabel18.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.XrLabel18.SizeF = New System.Drawing.SizeF(716.8334!, 32.0!)
        Me.XrLabel18.StylePriority.UseFont = False
        Me.XrLabel18.Text = "XrLabel18"
        '
        'XrLabel17
        '
        Me.XrLabel17.Font = New System.Drawing.Font("Calibri", 9.75!, CType((System.Drawing.FontStyle.Bold Or System.Drawing.FontStyle.Underline), System.Drawing.FontStyle))
        Me.XrLabel17.LocationFloat = New DevExpress.Utils.PointFloat(0.0!, 340.0001!)
        Me.XrLabel17.Name = "XrLabel17"
        Me.XrLabel17.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.XrLabel17.SizeF = New System.Drawing.SizeF(300.5!, 23.0!)
        Me.XrLabel17.StylePriority.UseFont = False
        Me.XrLabel17.Text = "Description of Services:"
        '
        'XrLabel16
        '
        Me.XrLabel16.DataBindings.AddRange(New DevExpress.XtraReports.UI.XRBinding() {New DevExpress.XtraReports.UI.XRBinding("Text", Nothing, "WebgetInvoice_sp.PSANO")})
        Me.XrLabel16.Font = New System.Drawing.Font("Calibri", 9.75!)
        Me.XrLabel16.LocationFloat = New DevExpress.Utils.PointFloat(643.5001!, 219.0!)
        Me.XrLabel16.Name = "XrLabel16"
        Me.XrLabel16.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.XrLabel16.SizeF = New System.Drawing.SizeF(10.91666!, 23.0!)
        Me.XrLabel16.StylePriority.UseFont = False
        Me.XrLabel16.Text = "XrLabel16"
        Me.XrLabel16.Visible = False
        '
        'XrLabel15
        '
        Me.XrLabel15.Font = New System.Drawing.Font("Calibri", 9.75!, System.Drawing.FontStyle.Bold)
        Me.XrLabel15.LocationFloat = New DevExpress.Utils.PointFloat(665.9584!, 219.0!)
        Me.XrLabel15.Name = "XrLabel15"
        Me.XrLabel15.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.XrLabel15.SizeF = New System.Drawing.SizeF(10.91663!, 23.0!)
        Me.XrLabel15.StylePriority.UseFont = False
        Me.XrLabel15.Text = "PROFESSIONAL SERVICES AGREEMENT NO."
        Me.XrLabel15.Visible = False
        '
        'XrLabel14
        '
        Me.XrLabel14.DataBindings.AddRange(New DevExpress.XtraReports.UI.XRBinding() {New DevExpress.XtraReports.UI.XRBinding("Text", Nothing, "WebgetInvoice_sp.BDetails")})
        Me.XrLabel14.Font = New System.Drawing.Font("Calibri", 9.75!)
        Me.XrLabel14.LocationFloat = New DevExpress.Utils.PointFloat(0.0!, 317.0001!)
        Me.XrLabel14.Name = "XrLabel14"
        Me.XrLabel14.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.XrLabel14.SizeF = New System.Drawing.SizeF(716.8334!, 23.0!)
        Me.XrLabel14.StylePriority.UseFont = False
        Me.XrLabel14.Text = "XrLabel14"
        '
        'XrLabel13
        '
        Me.XrLabel13.DataBindings.AddRange(New DevExpress.XtraReports.UI.XRBinding() {New DevExpress.XtraReports.UI.XRBinding("Text", Nothing, "WebgetInvoice_sp.BAddress")})
        Me.XrLabel13.Font = New System.Drawing.Font("Calibri", 9.75!)
        Me.XrLabel13.LocationFloat = New DevExpress.Utils.PointFloat(0.0!, 294.0001!)
        Me.XrLabel13.Name = "XrLabel13"
        Me.XrLabel13.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.XrLabel13.SizeF = New System.Drawing.SizeF(716.8334!, 23.0!)
        Me.XrLabel13.StylePriority.UseFont = False
        Me.XrLabel13.Text = "XrLabel13"
        '
        'XrLabel12
        '
        Me.XrLabel12.DataBindings.AddRange(New DevExpress.XtraReports.UI.XRBinding() {New DevExpress.XtraReports.UI.XRBinding("Text", Nothing, "WebgetInvoice_sp.BName")})
        Me.XrLabel12.Font = New System.Drawing.Font("Calibri", 9.75!)
        Me.XrLabel12.LocationFloat = New DevExpress.Utils.PointFloat(0.0!, 271.0001!)
        Me.XrLabel12.Name = "XrLabel12"
        Me.XrLabel12.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.XrLabel12.SizeF = New System.Drawing.SizeF(716.8334!, 23.0!)
        Me.XrLabel12.StylePriority.UseFont = False
        Me.XrLabel12.Text = "XrLabel12"
        '
        'XrLabel11
        '
        Me.XrLabel11.Font = New System.Drawing.Font("Calibri", 9.75!, CType((System.Drawing.FontStyle.Bold Or System.Drawing.FontStyle.Underline), System.Drawing.FontStyle))
        Me.XrLabel11.LocationFloat = New DevExpress.Utils.PointFloat(0.0!, 245.0001!)
        Me.XrLabel11.Name = "XrLabel11"
        Me.XrLabel11.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.XrLabel11.SizeF = New System.Drawing.SizeF(100.0!, 23.0!)
        Me.XrLabel11.StylePriority.UseFont = False
        Me.XrLabel11.Text = "ACH:"
        '
        'XrLabel10
        '
        Me.XrLabel10.DataBindings.AddRange(New DevExpress.XtraReports.UI.XRBinding() {New DevExpress.XtraReports.UI.XRBinding("Text", Nothing, "WebgetInvoice_sp.RZip")})
        Me.XrLabel10.Font = New System.Drawing.Font("Calibri", 9.75!)
        Me.XrLabel10.LocationFloat = New DevExpress.Utils.PointFloat(0.0!, 219.0!)
        Me.XrLabel10.Name = "XrLabel10"
        Me.XrLabel10.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.XrLabel10.SizeF = New System.Drawing.SizeF(451.6667!, 23.00002!)
        Me.XrLabel10.StylePriority.UseFont = False
        Me.XrLabel10.Text = "XrLabel10"
        '
        'XrLabel9
        '
        Me.XrLabel9.DataBindings.AddRange(New DevExpress.XtraReports.UI.XRBinding() {New DevExpress.XtraReports.UI.XRBinding("Text", Nothing, "WebgetInvoice_sp.RAddress")})
        Me.XrLabel9.Font = New System.Drawing.Font("Calibri", 9.75!)
        Me.XrLabel9.LocationFloat = New DevExpress.Utils.PointFloat(0.0!, 196.0001!)
        Me.XrLabel9.Name = "XrLabel9"
        Me.XrLabel9.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.XrLabel9.SizeF = New System.Drawing.SizeF(451.6667!, 23.00002!)
        Me.XrLabel9.StylePriority.UseFont = False
        Me.XrLabel9.Text = "XrLabel9"
        '
        'XrLabel8
        '
        Me.XrLabel8.DataBindings.AddRange(New DevExpress.XtraReports.UI.XRBinding() {New DevExpress.XtraReports.UI.XRBinding("Text", Nothing, "WebgetInvoice_sp.RAttn")})
        Me.XrLabel8.Font = New System.Drawing.Font("Calibri", 9.75!, System.Drawing.FontStyle.Italic)
        Me.XrLabel8.LocationFloat = New DevExpress.Utils.PointFloat(0.0!, 173.0!)
        Me.XrLabel8.Name = "XrLabel8"
        Me.XrLabel8.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.XrLabel8.SizeF = New System.Drawing.SizeF(451.6667!, 23.0!)
        Me.XrLabel8.StylePriority.UseFont = False
        Me.XrLabel8.Text = "XrLabel8"
        '
        'XrLabel7
        '
        Me.XrLabel7.DataBindings.AddRange(New DevExpress.XtraReports.UI.XRBinding() {New DevExpress.XtraReports.UI.XRBinding("Text", Nothing, "WebgetInvoice_sp.RName")})
        Me.XrLabel7.Font = New System.Drawing.Font("Calibri", 9.75!)
        Me.XrLabel7.LocationFloat = New DevExpress.Utils.PointFloat(0.0!, 150.0!)
        Me.XrLabel7.Name = "XrLabel7"
        Me.XrLabel7.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.XrLabel7.SizeF = New System.Drawing.SizeF(451.6667!, 23.0!)
        Me.XrLabel7.StylePriority.UseFont = False
        Me.XrLabel7.Text = "XrLabel7"
        '
        'XrLabel6
        '
        Me.XrLabel6.Font = New System.Drawing.Font("Calibri", 10.2!, CType((System.Drawing.FontStyle.Bold Or System.Drawing.FontStyle.Underline), System.Drawing.FontStyle))
        Me.XrLabel6.LocationFloat = New DevExpress.Utils.PointFloat(0.0!, 125.0!)
        Me.XrLabel6.Name = "XrLabel6"
        Me.XrLabel6.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.XrLabel6.SizeF = New System.Drawing.SizeF(257.5!, 23.00001!)
        Me.XrLabel6.StylePriority.UseFont = False
        Me.XrLabel6.Text = "Remit To:"
        '
        'XrLabel5
        '
        Me.XrLabel5.DataBindings.AddRange(New DevExpress.XtraReports.UI.XRBinding() {New DevExpress.XtraReports.UI.XRBinding("Text", Nothing, "WebgetInvoice_sp.CZip")})
        Me.XrLabel5.Font = New System.Drawing.Font("Calibri", 9.75!)
        Me.XrLabel5.LocationFloat = New DevExpress.Utils.PointFloat(0.0!, 97.00002!)
        Me.XrLabel5.Name = "XrLabel5"
        Me.XrLabel5.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.XrLabel5.SizeF = New System.Drawing.SizeF(451.6666!, 23.0!)
        Me.XrLabel5.StylePriority.UseFont = False
        Me.XrLabel5.Text = "XrLabel5"
        '
        'XrLabel4
        '
        Me.XrLabel4.DataBindings.AddRange(New DevExpress.XtraReports.UI.XRBinding() {New DevExpress.XtraReports.UI.XRBinding("Text", Nothing, "WebgetInvoice_sp.CAddress")})
        Me.XrLabel4.Font = New System.Drawing.Font("Calibri", 9.75!)
        Me.XrLabel4.LocationFloat = New DevExpress.Utils.PointFloat(0.0!, 74.00004!)
        Me.XrLabel4.Name = "XrLabel4"
        Me.XrLabel4.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.XrLabel4.SizeF = New System.Drawing.SizeF(451.6666!, 23.0!)
        Me.XrLabel4.StylePriority.UseFont = False
        Me.XrLabel4.Text = "XrLabel4"
        '
        'XrLabel3
        '
        Me.XrLabel3.DataBindings.AddRange(New DevExpress.XtraReports.UI.XRBinding() {New DevExpress.XtraReports.UI.XRBinding("Text", Nothing, "WebgetInvoice_sp.CAttn")})
        Me.XrLabel3.Font = New System.Drawing.Font("Calibri", 9.75!, System.Drawing.FontStyle.Italic)
        Me.XrLabel3.LocationFloat = New DevExpress.Utils.PointFloat(0.0!, 51.00001!)
        Me.XrLabel3.Name = "XrLabel3"
        Me.XrLabel3.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.XrLabel3.SizeF = New System.Drawing.SizeF(451.6666!, 23.0!)
        Me.XrLabel3.StylePriority.UseFont = False
        Me.XrLabel3.Text = "XrLabel3"
        '
        'XrLabel2
        '
        Me.XrLabel2.DataBindings.AddRange(New DevExpress.XtraReports.UI.XRBinding() {New DevExpress.XtraReports.UI.XRBinding("Text", Nothing, "WebgetInvoice_sp.ClientName")})
        Me.XrLabel2.Font = New System.Drawing.Font("Calibri", 9.75!)
        Me.XrLabel2.LocationFloat = New DevExpress.Utils.PointFloat(0.0!, 28.00001!)
        Me.XrLabel2.Name = "XrLabel2"
        Me.XrLabel2.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.XrLabel2.SizeF = New System.Drawing.SizeF(451.6666!, 23.0!)
        Me.XrLabel2.StylePriority.UseFont = False
        Me.XrLabel2.Text = "XrLabel2"
        '
        'XrLabel1
        '
        Me.XrLabel1.Font = New System.Drawing.Font("Calibri", 16.2!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.XrLabel1.LocationFloat = New DevExpress.Utils.PointFloat(0.0!, 0.0!)
        Me.XrLabel1.Name = "XrLabel1"
        Me.XrLabel1.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.XrLabel1.SizeF = New System.Drawing.SizeF(257.5!, 23.0!)
        Me.XrLabel1.StylePriority.UseFont = False
        Me.XrLabel1.Text = "Invoice"
        '
        'DetailReport
        '
        Me.DetailReport.Bands.AddRange(New DevExpress.XtraReports.UI.Band() {Me.Detail1})
        Me.DetailReport.DataAdapter = Me.WebgetInvoiceDetails_spTableAdapter
        Me.DetailReport.DataMember = "WebgetInvoiceDetails_sp"
        Me.DetailReport.DataSource = Me.DsReport1
        Me.DetailReport.Level = 0
        Me.DetailReport.Name = "DetailReport"
        '
        'Detail1
        '
        Me.Detail1.Controls.AddRange(New DevExpress.XtraReports.UI.XRControl() {Me.lblLowerShare, Me.XrTable1})
        Me.Detail1.HeightF = 25.83333!
        Me.Detail1.Name = "Detail1"
        '
        'lblLowerShare
        '
        Me.lblLowerShare.DataBindings.AddRange(New DevExpress.XtraReports.UI.XRBinding() {New DevExpress.XtraReports.UI.XRBinding("Text", Nothing, "WebgetInvoiceDetails_sp.Lower Limit")})
        Me.lblLowerShare.LocationFloat = New DevExpress.Utils.PointFloat(8.33333!, 5.0!)
        Me.lblLowerShare.Name = "lblLowerShare"
        Me.lblLowerShare.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.lblLowerShare.SizeF = New System.Drawing.SizeF(15.0!, 10.83333!)
        Me.lblLowerShare.Visible = False
        '
        'XrTable1
        '
        Me.XrTable1.Font = New System.Drawing.Font("Calibri", 9.75!)
        Me.XrTable1.LocationFloat = New DevExpress.Utils.PointFloat(23.33333!, 0.0!)
        Me.XrTable1.Name = "XrTable1"
        Me.XrTable1.Rows.AddRange(New DevExpress.XtraReports.UI.XRTableRow() {Me.XrTableRow1})
        Me.XrTable1.SizeF = New System.Drawing.SizeF(693.5001!, 25.0!)
        Me.XrTable1.StylePriority.UseFont = False
        '
        'XrTableRow1
        '
        Me.XrTableRow1.Cells.AddRange(New DevExpress.XtraReports.UI.XRTableCell() {Me.lblRowCount, Me.lblShareStatus, Me.XrTableCell4, Me.XrTableCell5, Me.lblTotal})
        Me.XrTableRow1.Name = "XrTableRow1"
        Me.XrTableRow1.Weight = 11.5R
        '
        'lblRowCount
        '
        Me.lblRowCount.Name = "lblRowCount"
        XrSummary1.FormatString = "Tier {0:n0}:"
        XrSummary1.Func = DevExpress.XtraReports.UI.SummaryFunc.RecordNumber
        XrSummary1.Running = DevExpress.XtraReports.UI.SummaryRunning.Report
        Me.lblRowCount.Summary = XrSummary1
        Me.lblRowCount.Weight = 0.1253686743749014R
        '
        'lblShareStatus
        '
        Me.lblShareStatus.DataBindings.AddRange(New DevExpress.XtraReports.UI.XRBinding() {New DevExpress.XtraReports.UI.XRBinding("Text", Nothing, "WebgetInvoiceDetails_sp.Revenewgainshare", "{0:$0.00}")})
        Me.lblShareStatus.Name = "lblShareStatus"
        Me.lblShareStatus.Padding = New DevExpress.XtraPrinting.PaddingInfo(5, 0, 0, 0, 100.0!)
        Me.lblShareStatus.StylePriority.UsePadding = False
        Me.lblShareStatus.StylePriority.UseTextAlignment = False
        Me.lblShareStatus.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleLeft
        Me.lblShareStatus.Weight = 0.77614411631241143R
        '
        'XrTableCell4
        '
        Me.XrTableCell4.DataBindings.AddRange(New DevExpress.XtraReports.UI.XRBinding() {New DevExpress.XtraReports.UI.XRBinding("Text", Nothing, "WebgetInvoiceDetails_sp.GainSharePercent", "{0}%")})
        Me.XrTableCell4.Name = "XrTableCell4"
        Me.XrTableCell4.StylePriority.UseTextAlignment = False
        Me.XrTableCell4.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleCenter
        Me.XrTableCell4.Weight = 0.21960239418540911R
        '
        'XrTableCell5
        '
        Me.XrTableCell5.DataBindings.AddRange(New DevExpress.XtraReports.UI.XRBinding() {New DevExpress.XtraReports.UI.XRBinding("Text", Nothing, "WebgetInvoiceDetails_sp.PerformanceGurantee", "{0}%")})
        Me.XrTableCell5.FormattingRules.Add(Me.showPGCol)
        Me.XrTableCell5.Name = "XrTableCell5"
        Me.XrTableCell5.StylePriority.UseTextAlignment = False
        Me.XrTableCell5.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleCenter
        Me.XrTableCell5.Weight = 0.20049054644898284R
        '
        'lblTotal
        '
        Me.lblTotal.DataBindings.AddRange(New DevExpress.XtraReports.UI.XRBinding() {New DevExpress.XtraReports.UI.XRBinding("Text", Nothing, "WebgetInvoiceDetails_sp.Total", "{0:c2}")})
        Me.lblTotal.Name = "lblTotal"
        Me.lblTotal.StylePriority.UseTextAlignment = False
        Me.lblTotal.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleRight
        Me.lblTotal.Weight = 0.27329060041673225R
        '
        'WebgetInvoiceDetails_spTableAdapter
        '
        Me.WebgetInvoiceDetails_spTableAdapter.ClearBeforeFill = True
        '
        'IsShowPerGurCol
        '
        Me.IsShowPerGurCol.Condition = "([PerformanceGurantee]  == ''  Or  [PerformanceGurantee]<1)"
        Me.IsShowPerGurCol.DataMember = "WebgetInvoiceDetails_sp"
        '
        '
        '
        Me.IsShowPerGurCol.Formatting.Visible = DevExpress.Utils.DefaultBoolean.[False]
        Me.IsShowPerGurCol.Name = "IsShowPerGurCol"
        '
        'lblTotalFees
        '
        Me.lblTotalFees.Borders = DevExpress.XtraPrinting.BorderSide.Top
        Me.lblTotalFees.BorderWidth = 2.0!
        Me.lblTotalFees.DataBindings.AddRange(New DevExpress.XtraReports.UI.XRBinding() {New DevExpress.XtraReports.UI.XRBinding("Text", Nothing, "WebgetInvoiceDetails_sp.Total")})
        Me.lblTotalFees.Font = New System.Drawing.Font("Calibri", 9.75!)
        Me.lblTotalFees.LocationFloat = New DevExpress.Utils.PointFloat(616.8334!, 0.0!)
        Me.lblTotalFees.Name = "lblTotalFees"
        Me.lblTotalFees.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.lblTotalFees.SizeF = New System.Drawing.SizeF(100.0!, 19.0!)
        Me.lblTotalFees.StylePriority.UseBorders = False
        Me.lblTotalFees.StylePriority.UseBorderWidth = False
        Me.lblTotalFees.StylePriority.UseFont = False
        Me.lblTotalFees.StylePriority.UseTextAlignment = False
        XrSummary2.FormatString = "{0:c2}"
        XrSummary2.Running = DevExpress.XtraReports.UI.SummaryRunning.Page
        Me.lblTotalFees.Summary = XrSummary2
        Me.lblTotalFees.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopRight
        '
        'XrLabel27
        '
        Me.XrLabel27.Font = New System.Drawing.Font("Calibri", 9.75!)
        Me.XrLabel27.LocationFloat = New DevExpress.Utils.PointFloat(516.0001!, 2.0!)
        Me.XrLabel27.Name = "XrLabel27"
        Me.XrLabel27.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 10, 0, 0, 100.0!)
        Me.XrLabel27.SizeF = New System.Drawing.SizeF(100.0!, 19.0!)
        Me.XrLabel27.StylePriority.UseFont = False
        Me.XrLabel27.StylePriority.UsePadding = False
        Me.XrLabel27.StylePriority.UseTextAlignment = False
        Me.XrLabel27.Text = "Total Fees:"
        Me.XrLabel27.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopRight
        '
        'ReportFooter
        '
        Me.ReportFooter.Controls.AddRange(New DevExpress.XtraReports.UI.XRControl() {Me.TravelAmtLine, Me.XrLabel39, Me.lblTravelAmt, Me.lblTotalInvoice, Me.XrLabel29, Me.XrLabel28, Me.lblTotalFees, Me.XrLabel27})
        Me.ReportFooter.HeightF = 90.0!
        Me.ReportFooter.Name = "ReportFooter"
        '
        'TravelAmtLine
        '
        Me.TravelAmtLine.LineWidth = 2
        Me.TravelAmtLine.LocationFloat = New DevExpress.Utils.PointFloat(617.0001!, 37.99998!)
        Me.TravelAmtLine.Name = "TravelAmtLine"
        Me.TravelAmtLine.SizeF = New System.Drawing.SizeF(100.0002!, 3.0!)
        '
        'XrLabel39
        '
        Me.XrLabel39.Font = New System.Drawing.Font("Calibri", 9.75!)
        Me.XrLabel39.FormattingRules.Add(Me.showTravelAmt)
        Me.XrLabel39.LocationFloat = New DevExpress.Utils.PointFloat(481.1668!, 21.0!)
        Me.XrLabel39.Name = "XrLabel39"
        Me.XrLabel39.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 10, 0, 0, 100.0!)
        Me.XrLabel39.SizeF = New System.Drawing.SizeF(134.8334!, 19.0!)
        Me.XrLabel39.StylePriority.UseFont = False
        Me.XrLabel39.StylePriority.UsePadding = False
        Me.XrLabel39.StylePriority.UseTextAlignment = False
        Me.XrLabel39.Text = "Travel Expenses:"
        Me.XrLabel39.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleRight
        '
        'showTravelAmt
        '
        Me.showTravelAmt.Condition = "[Travel]<1"
        '
        '
        '
        Me.showTravelAmt.Formatting.Visible = DevExpress.Utils.DefaultBoolean.[False]
        Me.showTravelAmt.Name = "showTravelAmt"
        '
        'lblTravelAmt
        '
        Me.lblTravelAmt.DataBindings.AddRange(New DevExpress.XtraReports.UI.XRBinding() {New DevExpress.XtraReports.UI.XRBinding("Text", Nothing, "WebgetInvoice_sp.Travel", "{0:$0.00}")})
        Me.lblTravelAmt.Font = New System.Drawing.Font("Calibri", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.lblTravelAmt.FormattingRules.Add(Me.showTravelAmt)
        Me.lblTravelAmt.LocationFloat = New DevExpress.Utils.PointFloat(617.0001!, 19.0!)
        Me.lblTravelAmt.Name = "lblTravelAmt"
        Me.lblTravelAmt.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.lblTravelAmt.SizeF = New System.Drawing.SizeF(100.0!, 19.0!)
        Me.lblTravelAmt.StylePriority.UseFont = False
        Me.lblTravelAmt.StylePriority.UseTextAlignment = False
        Me.lblTravelAmt.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleRight
        '
        'lblTotalInvoice
        '
        Me.lblTotalInvoice.Borders = CType((((DevExpress.XtraPrinting.BorderSide.Left Or DevExpress.XtraPrinting.BorderSide.Top) _
            Or DevExpress.XtraPrinting.BorderSide.Right) _
            Or DevExpress.XtraPrinting.BorderSide.Bottom), DevExpress.XtraPrinting.BorderSide)
        Me.lblTotalInvoice.BorderWidth = 2.0!
        Me.lblTotalInvoice.Font = New System.Drawing.Font("Calibri", 9.75!)
        Me.lblTotalInvoice.LocationFloat = New DevExpress.Utils.PointFloat(616.8334!, 57.16664!)
        Me.lblTotalInvoice.Name = "lblTotalInvoice"
        Me.lblTotalInvoice.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.lblTotalInvoice.SizeF = New System.Drawing.SizeF(100.0!, 23.0!)
        Me.lblTotalInvoice.StylePriority.UseBorders = False
        Me.lblTotalInvoice.StylePriority.UseBorderWidth = False
        Me.lblTotalInvoice.StylePriority.UseFont = False
        Me.lblTotalInvoice.StylePriority.UseTextAlignment = False
        XrSummary3.FormatString = "{0:$0.00}"
        Me.lblTotalInvoice.Summary = XrSummary3
        Me.lblTotalInvoice.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopRight
        '
        'XrLabel29
        '
        Me.XrLabel29.Font = New System.Drawing.Font("Calibri", 9.75!)
        Me.XrLabel29.LocationFloat = New DevExpress.Utils.PointFloat(0.0!, 57.16666!)
        Me.XrLabel29.Name = "XrLabel29"
        Me.XrLabel29.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.XrLabel29.SizeF = New System.Drawing.SizeF(400.8333!, 23.0!)
        Me.XrLabel29.StylePriority.UseFont = False
        Me.XrLabel29.Text = "Total amount due this invoice:"
        '
        'XrLabel28
        '
        Me.XrLabel28.Font = New System.Drawing.Font("Calibri", 9.75!)
        Me.XrLabel28.LocationFloat = New DevExpress.Utils.PointFloat(0.0!, 33.99998!)
        Me.XrLabel28.Name = "XrLabel28"
        Me.XrLabel28.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.XrLabel28.SizeF = New System.Drawing.SizeF(400.8333!, 23.0!)
        Me.XrLabel28.StylePriority.UseFont = False
        Me.XrLabel28.Text = "Deduction, if any, based on Client's final determination"
        '
        'PageFooter
        '
        Me.PageFooter.Controls.AddRange(New DevExpress.XtraReports.UI.XRControl() {Me.XrLabel26})
        Me.PageFooter.HeightF = 50.83333!
        Me.PageFooter.Name = "PageFooter"
        '
        'XrLabel26
        '
        Me.XrLabel26.Font = New System.Drawing.Font("Calibri", 8.5!)
        Me.XrLabel26.LocationFloat = New DevExpress.Utils.PointFloat(0.00002543131!, 0.0!)
        Me.XrLabel26.Multiline = True
        Me.XrLabel26.Name = "XrLabel26"
        Me.XrLabel26.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.XrLabel26.SizeF = New System.Drawing.SizeF(727.0!, 47.49999!)
        Me.XrLabel26.StylePriority.UseFont = False
        Me.XrLabel26.StylePriority.UseTextAlignment = False
        Me.XrLabel26.Text = "Revenew International, LLC" & Global.Microsoft.VisualBasic.ChrW(13) & Global.Microsoft.VisualBasic.ChrW(10) & "9 Greenway Plaza, Suite 1950, Houston, Texas 77046" & Global.Microsoft.VisualBasic.ChrW(13) & Global.Microsoft.VisualBasic.ChrW(10) & "2" & _
    "81-276-4500 | www.revenew.net"
        Me.XrLabel26.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleCenter
        '
        'Revenewgainshare
        '
        Me.Revenewgainshare.DataMember = "WebgetInvoiceDetails_sp"
        Me.Revenewgainshare.Expression = "'$'+Round([Lower Limit], 2)+' to '+'$'+Round([Upper Limit],2 )"
        Me.Revenewgainshare.Name = "Revenewgainshare"
        '
        'sumPGAmt
        '
        Me.sumPGAmt.DataMember = "WebgetInvoiceDetails_sp"
        Me.sumPGAmt.Expression = "Sum([PerformanceGurantee])"
        Me.sumPGAmt.Name = "sumPGAmt"
        '
        'sumGSAmt
        '
        Me.sumGSAmt.DataMember = "WebgetInvoiceDetails_sp"
        Me.sumGSAmt.Expression = "sum([GainSharePercent])"
        Me.sumGSAmt.Name = "sumGSAmt"
        '
        'TotalInvoice
        '
        Me.TotalInvoice.Expression = "[WebgetInvoiceDetails_sp.SumTotal]"
        Me.TotalInvoice.Name = "TotalInvoice"
        '
        'SumTotal
        '
        Me.SumTotal.DataMember = "WebgetInvoiceDetails_sp"
        Me.SumTotal.Expression = "Sum([Total])"
        Me.SumTotal.Name = "SumTotal"
        '
        'rptInvoiceMaster
        '
        Me.Bands.AddRange(New DevExpress.XtraReports.UI.Band() {Me.Detail, Me.TopMargin, Me.BottomMargin, Me.ReportHeader, Me.PageHeader, Me.DetailReport, Me.ReportFooter, Me.PageFooter})
        Me.CalculatedFields.AddRange(New DevExpress.XtraReports.UI.CalculatedField() {Me.Revenewgainshare, Me.sumPGAmt, Me.sumGSAmt, Me.TotalInvoice, Me.SumTotal})
        Me.DataAdapter = Me.WebgetInvoice_spTableAdapter
        Me.DataMember = "WebgetInvoice_sp"
        Me.DataSource = Me.DsReport1
        Me.FormattingRuleSheet.AddRange(New DevExpress.XtraReports.UI.FormattingRule() {Me.IsShowPerGurCol, Me.showPGCol, Me.showGSCol, Me.ShowColHead, Me.showTravelAmt})
        Me.Margins = New System.Drawing.Printing.Margins(50, 50, 4, 43)
        Me.PageHeight = 1169
        Me.PageWidth = 827
        Me.PaperKind = System.Drawing.Printing.PaperKind.A4
        Me.ScriptLanguage = DevExpress.XtraReports.ScriptLanguage.VisualBasic
        Me.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleLeft
        Me.Version = "13.2"
        CType(Me.DsReport1, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.XrTable1, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me, System.ComponentModel.ISupportInitialize).EndInit()

    End Sub
    Friend WithEvents Detail As DevExpress.XtraReports.UI.DetailBand
    Friend WithEvents TopMargin As DevExpress.XtraReports.UI.TopMarginBand
    Friend WithEvents BottomMargin As DevExpress.XtraReports.UI.BottomMarginBand
    Friend WithEvents DsReport1 As DSReport
    Friend WithEvents WebgetInvoice_spTableAdapter As DSReportTableAdapters.WebgetInvoice_spTableAdapter
    Friend WithEvents ReportHeader As DevExpress.XtraReports.UI.ReportHeaderBand
    Friend WithEvents PageHeader As DevExpress.XtraReports.UI.PageHeaderBand
    Friend WithEvents XrPictureBox1 As DevExpress.XtraReports.UI.XRPictureBox
    Friend WithEvents XrLabel25 As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents XrLabel24 As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents XrLabel23 As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents XrLabel22 As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents XrLabel21 As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents XrLabel20 As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents XrLabel19 As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents XrLabel18 As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents XrLabel17 As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents XrLabel16 As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents XrLabel15 As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents XrLabel14 As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents XrLabel13 As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents XrLabel12 As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents XrLabel11 As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents XrLabel10 As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents XrLabel9 As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents XrLabel8 As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents XrLabel7 As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents XrLabel6 As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents XrLabel5 As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents XrLabel4 As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents XrLabel3 As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents XrLabel2 As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents XrLine8 As DevExpress.XtraReports.UI.XRLine
    Friend WithEvents XrLine7 As DevExpress.XtraReports.UI.XRLine
    Friend WithEvents XrLine6 As DevExpress.XtraReports.UI.XRLine
    Friend WithEvents XrLine5 As DevExpress.XtraReports.UI.XRLine
    Friend WithEvents XrLine4 As DevExpress.XtraReports.UI.XRLine
    Friend WithEvents XrLabel37 As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents XrLabel36 As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents XrLabel35 As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents XrLabel34 As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents XrLabel33 As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents XrLabel32 As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents XrLabel31 As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents DetailReport As DevExpress.XtraReports.UI.DetailReportBand
    Friend WithEvents Detail1 As DevExpress.XtraReports.UI.DetailBand
    Friend WithEvents XrTable1 As DevExpress.XtraReports.UI.XRTable
    Friend WithEvents XrTableRow1 As DevExpress.XtraReports.UI.XRTableRow
    Friend WithEvents lblRowCount As DevExpress.XtraReports.UI.XRTableCell
    Friend WithEvents lblShareStatus As DevExpress.XtraReports.UI.XRTableCell
    Friend WithEvents XrTableCell4 As DevExpress.XtraReports.UI.XRTableCell
    Friend WithEvents XrTableCell5 As DevExpress.XtraReports.UI.XRTableCell
    Friend WithEvents lblTotal As DevExpress.XtraReports.UI.XRTableCell
    Friend WithEvents WebgetInvoiceDetails_spTableAdapter As DSReportTableAdapters.WebgetInvoiceDetails_spTableAdapter
    Friend WithEvents lblTotalFees As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents XrLabel27 As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents ReportFooter As DevExpress.XtraReports.UI.ReportFooterBand
    Friend WithEvents lblTotalInvoice As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents XrLabel29 As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents XrLabel28 As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents PageFooter As DevExpress.XtraReports.UI.PageFooterBand
    Friend WithEvents XrLabel1 As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents lblTravelAmt As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents XrLabel39 As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents TravelAmtLine As DevExpress.XtraReports.UI.XRLine
    Friend WithEvents Revenewgainshare As DevExpress.XtraReports.UI.CalculatedField
    Friend WithEvents IsShowPerGurCol As DevExpress.XtraReports.UI.FormattingRule
    Friend WithEvents sumPGAmt As DevExpress.XtraReports.UI.CalculatedField
    Friend WithEvents showPGCol As DevExpress.XtraReports.UI.FormattingRule
    Friend WithEvents showGSCol As DevExpress.XtraReports.UI.FormattingRule
    Friend WithEvents ShowColHead As DevExpress.XtraReports.UI.FormattingRule
    Friend WithEvents sumGSAmt As DevExpress.XtraReports.UI.CalculatedField
    Friend WithEvents TotalInvoice As DevExpress.XtraReports.UI.CalculatedField
    Friend WithEvents SumTotal As DevExpress.XtraReports.UI.CalculatedField
    Friend WithEvents lblLowerShare As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents showTravelAmt As DevExpress.XtraReports.UI.FormattingRule
    Friend WithEvents XrLabel26 As DevExpress.XtraReports.UI.XRLabel
End Class
