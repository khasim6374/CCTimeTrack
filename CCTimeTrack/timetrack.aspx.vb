Imports DevExpress.Web

Public Class timetrack
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'sQTimesheet.SelectParameters(0).DefaultValue = "ECHIDNA\khasim.a"
        sQTimesheet.SelectParameters(0).DefaultValue = HttpContext.Current.User.Identity.Name.ToString()
    End Sub

    Protected Sub gridTimesheet_InitNewRow(sender As Object, e As DevExpress.Web.Data.ASPxDataInitNewRowEventArgs)
        'e.NewValues("Employee") = Context.User.Identity.Name
        e.NewValues("WorkDate") = DateTime.Today
        e.NewValues("StartTime") = Convert.ToDateTime(DateTime.Today.ToString("MM/dd/yyyy") + " 8:00 AM")
        e.NewValues("EndTime") = Convert.ToDateTime(DateTime.Today.ToString("MM/dd/yyyy") + " 5:00 PM")

        Dim command As String = SqlDSEmployee.SelectCommand
        SqlDSEmployee.SelectCommand = "SELECT ID, Employee, UserID from Employees where UserID='" + Context.User.Identity.Name + "'"
        Dim dv As DataView = DirectCast(SqlDSEmployee.[Select](DataSourceSelectArguments.Empty), DataView)
        Dim dt As DataTable = dv.ToTable()
        Dim ds As New DataSet()
        ds.Tables.Add(dt)
        For Each dr As DataRow In dv.Table.Rows
            e.NewValues("Employee") = dr(1).ToString()
        Next
    End Sub

    Protected Sub sQTimesheet_Selecting(sender As Object, e As SqlDataSourceSelectingEventArgs)
        sQTimesheet.SelectParameters(0).DefaultValue = Context.User.Identity.Name
    End Sub

    Protected Sub gridTimesheet_CellEditorInitialize(sender As Object, e As ASPxGridViewEditorEventArgs)
        If (e.Column.FieldName = "StartTime") Then
            If Not IsDBNull(e.Value) Then
                e.Editor.Value = Convert.ToDateTime(e.Value)
            Else
                Convert.ToDateTime(DateTime.Today.ToString("MM/dd/yyyy") + " 8:00 AM")
            End If
        End If
        If (e.Column.FieldName = "WorkDate") Then
            If Not IsDBNull(e.Value) Then
                e.Editor.Value = Convert.ToDateTime(e.Value)
            Else
                e.Editor.Value = DateTime.Today
            End If
        End If
        If (e.Column.FieldName = "EndTime") Then
            If Not IsDBNull(e.Value) Then
                e.Editor.Value = Convert.ToDateTime(e.Value)
            Else
                e.Editor.Value = Convert.ToDateTime(DateTime.Today.ToString("MM/dd/yyyy") + " 5:00 PM")
            End If
        End If
    End Sub
End Class