Imports DevExpress.XtraReports.UI
Imports System.Drawing

Public Class rptInvoiceMaster
    Dim dblTotal As Decimal
    Dim TotalRow As Integer
    Public Sub New(invID As Integer, btype As String)

        ' This call is required by the designer.
        InitializeComponent()
        WebgetInvoice_spTableAdapter.GetData(invID, "{" + btype + "}")
        WebgetInvoiceDetails_spTableAdapter.GetData(invID)
        ' Add any initialization after the InitializeComponent() call.
        TotalRow = DsReport1.WebgetInvoiceDetails_sp.Count
        dblTotal = 0
        TotalRow = 0
    End Sub


    Private Sub lblTotal_BeforePrint(sender As Object, e As Drawing.Printing.PrintEventArgs) Handles lblTotal.BeforePrint
        Try
            dblTotal = dblTotal + Val(lblTotal.Text.Replace("$", "").Replace(",", ""))
        Catch ex As Exception

        End Try
    End Sub

    Private Sub lblTotalInvoice_BeforePrint(sender As Object, e As Drawing.Printing.PrintEventArgs) Handles lblTotalInvoice.BeforePrint
        Try
            lblTotalInvoice.Text = Val(dblTotal + Val(GetCurrentColumnValue("Travel"))).ToString("C2")
        Catch ex As Exception

        End Try
    End Sub

    Private Sub lblShareStatus_BeforePrint(sender As Object, e As Drawing.Printing.PrintEventArgs) Handles lblShareStatus.BeforePrint
        TotalRow += 1
        If TotalRow = DsReport1.WebgetInvoiceDetails_sp.Count Then
            CType(sender, XRTableCell).Text = "Over " + Val(lblLowerShare.Text).ToString("C2").Replace(",", "")
        End If
    End Sub

    Private Sub lblTravelAmt_BeforePrint(sender As Object, e As Drawing.Printing.PrintEventArgs) Handles lblTravelAmt.BeforePrint
        If Val(GetCurrentColumnValue("Travel")) < 1 Then
            TravelAmtLine.LocationF = New PointF(617, 19)
        Else
            TravelAmtLine.LocationF = New PointF(617, 38)
        End If
    End Sub
End Class