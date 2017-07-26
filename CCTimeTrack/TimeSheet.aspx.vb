
Public Class Deleteme
    Inherits System.Web.UI.Page
    Sub Page_Load(ByVal Sender As System.Object, ByVal e As System.EventArgs)

    End Sub
    Protected Sub SqlDataSource4_Selecting(sender As Object, e As System.EventArgs) Handles SqlDataSource1.Load
        SqlDataSource14.SelectParameters("userid").DefaultValue = HttpContext.Current.User.Identity.Name.ToString()
    End Sub

    Protected Sub SqlDataSource1_Selecting(sender As Object, e As System.EventArgs) Handles SqlDataSource1.Load
        SqlDataSource1.SelectParameters("userid").DefaultValue = HttpContext.Current.User.Identity.Name.ToString()
    End Sub

    Protected Sub SqlDataSource6_Selecting(sender As Object, e As System.EventArgs) Handles SqlDataSource1.Load
        SqlDataSource6.SelectParameters("userid").DefaultValue = HttpContext.Current.User.Identity.Name.ToString()
    End Sub

    Protected Sub DetailsView1_DataBound(sender As Object, e As System.EventArgs) Handles DetailsView1.DataBound
        If DetailsView1.CurrentMode = DetailsViewMode.Insert Then
            SqlDataSource14.SelectParameters("userid").DefaultValue = HttpContext.Current.User.Identity.Name.ToString()
            Dim tbdate As TextBox = CType(DetailsView1.FindControl("workdate"), TextBox)
            Dim ddemp As DropDownList = CType(DetailsView1.FindControl("ddlEmployee"), DropDownList)
            tbdate.Text = DateTime.Now.Date()
            ddemp.SelectedValue = HttpContext.Current.User.Identity.Name.ToString()
            SqlDataSource14.SelectParameters("userid").DefaultValue = HttpContext.Current.User.Identity.Name.ToString()
        End If
    End Sub
    Protected Sub DetailsView1_ItemInserting(sender As Object, e As System.Web.UI.WebControls.DetailsViewInsertEventArgs) Handles DetailsView1.ItemInserting
        If DetailsView1.CurrentMode = DetailsViewMode.Insert Then
            SqlDataSource14.SelectParameters("userid").DefaultValue = HttpContext.Current.User.Identity.Name.ToString()
        End If
    End Sub
    Protected Sub DetailsView1_ModeChanged(sender As Object, e As System.EventArgs) Handles DetailsView1.ModeChanged
        If DetailsView1.CurrentMode = DetailsViewMode.Insert Then
            'Dim tbdate As TextBox = DetailsView1.Rows(0).FindControl("workdate")
            'tbdate.Text = DateTime.Now.ToString
        End If
    End Sub
    Protected Sub DetailsView1_ItemCreated(ByVal sender As Object, _
     ByVal e As EventArgs)
        If DetailsView1.CurrentMode = DetailsViewMode.Insert Then
            Dim tbdate As TextBox = DetailsView1.Rows(0).FindControl("workdate")
            'Dim empname As TextBox = DetailsView1.Rows(0).FindControl("txtempins")

            'DetailsView1.Values("InsertName") = "hello"
            tbdate.Text = DateTime.Now.ToString
            SqlDataSource14.SelectParameters("userid").DefaultValue = HttpContext.Current.User.Identity.Name.ToString()

        End If
    End Sub
    

    
End Class
