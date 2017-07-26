
Partial Class Timesheetsummary
    Inherits System.Web.UI.Page
    Protected Sub TimesheetSummaryDS_Selecting(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs) Handles SqlDataSource1.Selecting
        SqlDataSource1.SelectParameters("userid").DefaultValue = HttpContext.Current.User.Identity.Name.ToString()
    End Sub


    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        SqlDataSource1.SelectParameters("userid").DefaultValue = HttpContext.Current.User.Identity.Name.ToString()

    End Sub
   
End Class
