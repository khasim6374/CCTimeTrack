Imports System.IO

Partial Class ProjectSummary
    Inherits System.Web.UI.Page
    Protected Sub GridView1_DataBinding(sender As Object, e As System.EventArgs) Handles GridView1.DataBinding

        ProjsummaryDataSource.SelectParameters("userid").DefaultValue = HttpContext.Current.User.Identity.Name.ToString()

    End Sub

    Protected Sub ButExport_Click(sender As Object, e As System.EventArgs) Handles ButExport.Click
        'Response.AddHeader("content-disposition", _
        ' "attachment;filename=FileName.xls")

        'Response.Charset = String.Empty

        'Response.ContentType = "application/vnd.xls"

        'Dim sw As System.IO.StringWriter = _
        '  New System.IO.StringWriter()

        'Dim hw As System.Web.UI.HtmlTextWriter = _
        '    New HtmlTextWriter(sw)

        'GridView1.RenderControl(hw)

        'Response.Write(sw.ToString())

        'Response.End()

        Dim sw As New StringWriter()
        Dim hw As New System.Web.UI.HtmlTextWriter(sw)
        Dim frm As HtmlForm = New HtmlForm()

        Page.Response.AddHeader("content-disposition", "attachment=Team.xls")
        Page.Response.ContentType = "application/vnd.ms-excel"
        Page.Response.Charset = ""
        Page.EnableViewState = False
        frm.Attributes("runat") = "server"
        Controls.Add(frm)
        frm.Controls.Add(GridView1)
        frm.RenderControl(hw)
        Response.Write(sw.ToString())
        Response.End()
    End Sub

End Class
