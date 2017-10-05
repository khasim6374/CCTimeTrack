Imports DevExpress.Web

Public Class xmaslist
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub grdXmazlist_RowInserting(sender As Object, e As DevExpress.Web.Data.ASPxDataInsertingEventArgs) Handles grdXmazlist.RowInserting
        e.NewValues("Mod_dttm") = Now
        e.NewValues("Mod_User") = HttpContext.Current.User.Identity.Name.ToString()
    End Sub

    Protected Sub grdXmazlist_RowUpdating(sender As Object, e As DevExpress.Web.Data.ASPxDataUpdatingEventArgs) Handles grdXmazlist.RowUpdating
        e.NewValues("Mod_dttm") = Now
        e.NewValues("Mod_User") = HttpContext.Current.User.Identity.Name.ToString()
    End Sub

    Protected Sub btnExport_Click(sender As Object, e As ImageClickEventArgs) Handles btnExport.Click
        grdXmazlistEprt.WriteXlsToResponse()
    End Sub

    Protected Sub XmaslistDS_Load(sender As Object, e As EventArgs) Handles XmaslistDS.Load
        XmaslistDS.SelectParameters("userid").DefaultValue = HttpContext.Current.User.Identity.Name.ToString()
    End Sub

    Protected Sub grdXmazlist_HeaderFilterFillItems(sender As Object, e As ASPxGridViewHeaderFilterEventArgs)
        'If e.Column.FieldName = "Clientid" OrElse e.Column.FieldName = "StatusId" OrElse e.Column.FieldName = "SupplierId" OrElse e.Column.FieldName = "DDLead" OrElse e.Column.FieldName = "LeadPlanner" OrElse e.Column.FieldName = "Planner" Then
        Dim filters As List(Of FilterValue) = e.Values
        Dim sortedFilters As List(Of FilterValue) = filters.OrderBy(Function(n) n.DisplayText).ToList()
        e.Values.Clear()
        e.Values.AddRange(sortedFilters)
        'End If
    End Sub
End Class