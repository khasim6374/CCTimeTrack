Imports DevExpress.Web
Imports System.IO
Imports System.Data.SqlClient

Partial Class SupplierRank
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

    End Sub

    Protected Sub hyperLink_Init(ByVal sender As Object, ByVal e As EventArgs)
        Dim btn As LinkButton = DirectCast(sender, LinkButton)
        Dim aa = btn.CommandArgument.ToString()
        'Response.Clear()
        Dim ee = Path.GetFileName(aa)
        'Response.ContentType = "application/octet-stream"
        'Response.AddHeader("Content-Disposition", "attachment; filename=" + ee)
        'Response.Output.Write(aa)
        'Response.End()


        Dim filename As String = aa
        If filename <> "" Then
            Dim path As String = Server.MapPath(filename)
            Dim file As New System.IO.FileInfo(filename)
            If file.Exists Then
                Response.Clear()
                Response.AddHeader("Content-Disposition", "attachment; filename=" + file.Name)
                Response.AddHeader("Content-Length", file.Length.ToString())
                Response.ContentType = "application/octet-stream"
                Response.WriteFile(file.FullName)
                Response.End()
            Else
                Try
                    Dim filePath As String = ConfigurationSettings.AppSettings("FilePath")
                    Dim filename1 = String.Format("{0}\{1}", Server.MapPath(filePath), aa)
                    Dim file1 As New System.IO.FileInfo(filename1)
                    If file1.Exists Then
                        Response.Clear()
                        Response.AddHeader("Content-Disposition", "attachment; filename=" + file1.Name)
                        Response.AddHeader("Content-Length", file1.Length.ToString())
                        Response.ContentType = "application/octet-stream"
                        Response.WriteFile(file1.FullName)
                        Response.End()
                        'Else
                        'Response.Write("This file does not exist.")
                    End If
                Catch ex As Exception
                    'Response.Write("This file does not exist.")
                End Try
            End If
        End If
    End Sub

    Protected Sub grid_OnRowUpdating(sender As Object, e As DevExpress.Web.Data.ASPxDataUpdatingEventArgs)
        SupplierRankDS.UpdateParameters("Crtd_user").DefaultValue = HttpContext.Current.User.Identity.Name.ToString()
    End Sub
    Protected Sub grid_OnRowInserting(sender As Object, e As DevExpress.Web.Data.ASPxDataInsertingEventArgs)
        SupplierRankDS.InsertParameters("Crtd_user").DefaultValue = HttpContext.Current.User.Identity.Name.ToString()
    End Sub
End Class

