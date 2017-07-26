Imports System.IO
Imports DevExpress.Web
Imports System.Data.SqlClient

Public Class fileUpload
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub fileUpload_FileUploadComplete(sender As Object, e As DevExpress.Web.FileUploadCompleteEventArgs)
       
    End Sub
    Private Function GetSafeFilename(filename As String) As String
        Return String.Join("_", filename.Split(Path.GetInvalidFileNameChars()))
    End Function

    Protected Sub grd_RowDeleted(sender As Object, e As DevExpress.Web.Data.ASPxDataDeletedEventArgs) Handles grd.RowDeleted
        Try
            Dim filename1 = e.Values("Attachdocument")
            Dim filePath As String = ConfigurationSettings.AppSettings("FilePath")
            Dim clientName As String = Request.QueryString("c")
            Dim supName As String = Request.QueryString("s")
            clientName = GetSafeFilename(clientName)
            supName = GetSafeFilename(supName)
            Dim filename = String.Format("{0}\{1}", Server.MapPath(filePath), filename1)
            If File.Exists(filename) Then File.Delete(filename)
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub fileUpload_FilesUploadComplete(sender As Object, e As FilesUploadCompleteEventArgs)
        Dim fileUpload = TryCast(sender, ASPxUploadControl)
        If fileUpload.UploadedFiles.Count > 0 Then
            Dim filePath As String = ConfigurationSettings.AppSettings("FilePath")
            If Directory.Exists(Server.MapPath(filePath)) Then
                Dim clientName As String = Request.QueryString("c")
                Dim supName As String = Request.QueryString("s")
                clientName = GetSafeFilename(clientName)
                supName = GetSafeFilename(supName)
                For i As Integer = 0 To fileUpload.UploadedFiles.Count - 1
                    Dim filename = String.Format("{0}\{1}-{2}-{3}_{4}{5}", Server.MapPath(filePath), clientName, supName, DateTime.Today.ToString("yyyyMMdd"), fileUpload.GetRandomFileName(), Path.GetExtension(fileUpload.UploadedFiles(i).FileName))
                    If File.Exists(filename) Then File.Delete(filename)
                    fileUpload.UploadedFiles(i).SaveAs(filename)
                    Dim db = New SqlDb()
                    db.GetDataSet("USP_INSERT_TRACK_DOCUMENTS",
                                  New SqlParameter("TrackID", Request.QueryString("id")),
                                  New SqlParameter("filename", Path.GetFileName(filename)),
                                  New SqlParameter("Ext", Path.GetExtension(filename).TrimStart(".")),
                                  New SqlParameter("User", Context.User.Identity.Name))
                Next
            End If
        End If
    End Sub
End Class