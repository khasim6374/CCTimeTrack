Imports System.IO
Imports DevExpress.Web

Public Class documentlibrary
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        ASPxHiddenField1.Set("id", "")
        ASPxHiddenField2.Set("url", "")
    End Sub
    Protected Sub fileUpload_FilesUploadComplete(sender As Object, e As FilesUploadCompleteEventArgs)
        Dim fileUpload = TryCast(sender, ASPxUploadControl)
        If fileUpload.UploadedFiles.Count > 0 Then
            Dim filePath As String = System.Configuration.ConfigurationManager.AppSettings("DocumentLibraryPath")
            If Directory.Exists(Server.MapPath(filePath)) Then
                For i As Integer = 0 To fileUpload.UploadedFiles.Count - 1
                    Dim Ext = Path.GetExtension(fileUpload.UploadedFiles(i).FileName)
                    If Ext IsNot Nothing And Ext IsNot "" Then
                        Dim RandomName = fileUpload.GetRandomFileName()
                        Dim filename = String.Format("{0}\{1}-{2}", Server.MapPath(filePath), DateTime.Today.ToString("yyyyMMdd"), RandomName, Ext)
                        If File.Exists(filename) Then File.Delete(filename)
                        fileUpload.UploadedFiles(i).SaveAs(filename)
                        Dim relativePath = "~/documentlibrary/" + DateTime.Today.ToString("yyyyMMdd") + "-" + RandomName
                        If ASPxHiddenField1.Get("id") IsNot Nothing And ASPxHiddenField1.Get("id") IsNot "" Then
                            sQDocumentLibrary.UpdateCommand = "Update [CCDocument Library] set [DocType]='" + Ext + "', [URL]='" + relativePath + "', [crtd_dttm]=getdate() where ID='" + ASPxHiddenField1.Get("id") + "'"
                            sQDocumentLibrary.Update()
                            ASPxHiddenField1.Set("id", "")
                            Dim uri = New Uri(Server.MapPath(ASPxHiddenField2.Get("url")), UriKind.Absolute)
                            System.IO.File.Delete(uri.LocalPath)
                        Else
                            sQDocumentLibrary.InsertCommand = "INSERT INTO [CCDocument Library] ([DocType], [URL], [crtd_dttm]) VALUES ('" + Ext + "', '" + relativePath + "', getdate())"
                            sQDocumentLibrary.Insert()
                        End If
                    End If
                Next
            End If
        End If
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
            Dim file As New System.IO.FileInfo(path)
            If file.Exists Then
                Response.Clear()
                Response.AddHeader("Content-Disposition", "attachment; filename=" + file.Name)
                Response.AddHeader("Content-Length", file.Length.ToString())
                Response.ContentType = "application/octet-stream"
                Response.WriteFile(file.FullName)
                Response.End()
            Else
                Try
                    Dim filePath As String = ConfigurationSettings.AppSettings("DocumentLibraryPath")
                    Dim filename1 = String.Format("{0}\{1}", Server.MapPath(filePath), aa)
                    Dim file1 As New System.IO.FileInfo(filename1)
                    If file1.Exists Then
                        Response.Clear()
                        Response.AddHeader("Content-Disposition", "attachment; filename=" + file1.Name)
                        Response.AddHeader("Content-Length", file1.Length.ToString())
                        Response.ContentType = "application/octet-stream"
                        Response.WriteFile(file1.FullName)
                        Response.End()
                    Else
                        Response.Write("This file does not exist.")
                    End If
                Catch ex As Exception
                    Response.Write("This file does not exist.")
                End Try
            End If
        End If
    End Sub
    Protected Sub btnDelete_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim btn As ASPxButton = CType(sender, ASPxButton)
        Dim container As GridViewDataItemTemplateContainer = CType(btn.NamingContainer, GridViewDataItemTemplateContainer)
        Dim values As Object() = CType(container.Grid.GetRowValues(container.VisibleIndex, New String() {"ID", "DocType", "URL"}), Object())
        sQDocumentLibrary.DeleteCommand = "Delete From [CCDocument Library] where ID='" + values(0).ToString() + "'"
        sQDocumentLibrary.Delete()
        Dim uri = New Uri(Server.MapPath(values(2)), UriKind.Absolute)
        System.IO.File.Delete(uri.LocalPath)
    End Sub
    Protected Sub btnEdit_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim btn As ASPxButton = CType(sender, ASPxButton)
        Dim container As GridViewDataItemTemplateContainer = CType(btn.NamingContainer, GridViewDataItemTemplateContainer)
        Dim values As Object() = CType(container.Grid.GetRowValues(container.VisibleIndex, New String() {"ID", "DocType", "URL"}), Object())
        ASPxHiddenField1.Set("id", values(0).ToString())
        ASPxHiddenField2.Set("url", values(2))
    End Sub
End Class