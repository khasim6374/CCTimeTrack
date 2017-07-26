Public Class PlanningScoreCard
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        lblClient.Text = Request.QueryString("c")
        lblSupplier.Text = Request.QueryString("s")
        lblAuditor.Text = Request.QueryString("a")
    End Sub

    Protected Sub frmPlanningScoreCard_ItemInserting(sender As Object, e As FormViewInsertEventArgs) Handles frmPlanningScoreCard.ItemInserting
        e.Values("Tracking_id") = Request.QueryString("tid")
        e.Values("crtd_dttm") = DateTime.Now
        e.Values("crtd_user") = HttpContext.Current.User.Identity.Name.ToString()
    End Sub

    Protected Sub frmPlanningScoreCard_ItemUpdating(sender As Object, e As FormViewUpdateEventArgs) Handles frmPlanningScoreCard.ItemUpdating
        e.NewValues("Tracking_id") = Request.QueryString("tid")
        e.NewValues("crtd_dttm") = DateTime.Now
        e.NewValues("crtd_user") = HttpContext.Current.User.Identity.Name.ToString()
    End Sub

    Protected Sub frmPlanningScoreCard_DataBound(sender As Object, e As EventArgs) Handles frmPlanningScoreCard.DataBound
        If frmPlanningScoreCard.DataItemCount = 0 Then
            frmPlanningScoreCard.ChangeMode(FormViewMode.Insert)
        End If
    End Sub

    Protected Sub frmPlanningScoreCard_ItemUpdated(sender As Object, e As FormViewUpdatedEventArgs) Handles frmPlanningScoreCard.ItemUpdated
        ClientScript.RegisterStartupScript(Me.GetType(), "Updated", "alert('Updated successfully.');parent.pnlPlanningScoreCard.Hide();", True)
    End Sub

    Protected Sub frmPlanningScoreCard_ItemInserted(sender As Object, e As FormViewInsertedEventArgs) Handles frmPlanningScoreCard.ItemInserted
        ClientScript.RegisterStartupScript(Me.GetType(), "Inserted", "alert('Inserted successfully.');parent.pnlPlanningScoreCard.Hide();", True)
    End Sub
End Class