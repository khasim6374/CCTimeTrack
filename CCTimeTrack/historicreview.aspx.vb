Public Class historicreview
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub lnkExport_Click(sender As Object, e As EventArgs)
        grdExporter.WriteXlsToResponse()
    End Sub
End Class