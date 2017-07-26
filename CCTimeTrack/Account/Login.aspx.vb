Imports System.Data.SqlClient
Public Class Login
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        RegisterHyperLink.NavigateUrl = "Register.aspx?ReturnUrl=" + HttpUtility.UrlEncode(Request.QueryString("ReturnUrl"))
        FormsAuthentication.RedirectFromLoginPage(System.Security.Principal.WindowsIdentity.GetCurrent().Name, False)
        'FormsAuthentication.RedirectFromLoginPage("HOUSTON\gramachandran", False)
        Response.Redirect("~/StatusUpdate.aspx")
    End Sub

    Protected Sub LoginButton_Click(sender As Object, e As EventArgs)
        'Dim sqlDb As New SqlDb
        'Dim dtSet As New DataSet
        'Dim dtSet1 As New DataSet
        'Dim sqlDb1 As New SqlDb
        'dtSet = sqlDb.GetDataSet("Login_sp", New SqlParameter("@UserName", LoginUser.UserName), New SqlParameter("@Password", LoginUser.Password))
        'If (dtSet.Tables(0).Rows(0)(0) > 0) Then
        '    FormsAuthentication.RedirectFromLoginPage(LoginUser.UserName, False)
        '    Response.Redirect("~/Default.aspx")

        'Else
        '    LoginUser.FailureText = "Invalid Username and password"
        'End If
    End Sub
End Class