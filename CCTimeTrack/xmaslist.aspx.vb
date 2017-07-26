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
End Class