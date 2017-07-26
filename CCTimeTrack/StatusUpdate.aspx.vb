Imports DevExpress.Web
Imports System.IO
Imports System.Data.SqlClient

Partial Class StatusUpdate
    Inherits System.Web.UI.Page

    Protected Sub SqlDataSource1_Load(sender As Object, e As System.EventArgs) Handles SqlDataSource1.Load
        'SqlDataSource1.SelectParameters("userid").DefaultValue = "HOUSTON\jpizzitola"
        SqlDataSource1.SelectParameters("userid").DefaultValue = HttpContext.Current.User.Identity.Name.ToString()

        'If Not ClientScript.IsStartupScriptRegistered("alert") Then
        'Page.ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alertMe();", True)
        'End If
    End Sub

    'Protected Sub GridView1_RowCancelingEdit(sender As Object, e As System.Web.UI.WebControls.GridViewCancelEditEventArgs) Handles GridView1.RowCancelingEdit
    '    Response.Redirect("StatusUpdate.aspx")
    'End Sub

    'Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowDataBound

    '    If (e.Row.RowState And DataControlRowState.Edit) > 0 Then
    '        Dim txtName As TextBox = CType(e.Row.FindControl("Txtsd"), TextBox)
    '        Dim btnUpdate As LinkButton = CType(e.Row.FindControl("btnUpdate"), LinkButton)
    '        txtName.Focus()
    '        Form.DefaultButton = btnUpdate.UniqueID
    '        ViewState("lastRow") = e.Row.RowIndex
    '        'Else
    '        '    Response.Redirect("StatusUpdate.aspx")
    '    End If

    'End Sub

    'Protected Sub GridView1_RowUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdatedEventArgs) Handles GridView1.RowUpdated
    '    'MsgBox((GridView1.Rows.Count - ViewState("lastRow")))
    '    If GridView1.Rows.Count > ViewState("lastRow") + 1 Then
    '        GridView1.EditIndex = ViewState("lastRow") + 1
    '        e.KeepInEditMode = True
    '    Else
    '        Response.Redirect("StatusUpdate.aspx")
    '    End If
    'End Sub

    'Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridView1.SelectedIndexChanged
    '    GridView1.SelectedRow.Focus()
    'End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        'Dim SqlDataSource1 As New SqlDataSource()
        'SqlDataSource1.ID = "DSFullyPlanned"
        'Me.Page.Controls.Add(SqlDataSource1)
        'SqlDataSource1.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CCUpdate").ConnectionString
        'SqlDataSource1.SelectCommand = "SELECT top 10 ContactName, City, Country, PostalCode from Customers"
        'SqlDataSource1.InsertParameters.Add("Id", 0)
        'SqlDataSource1.InsertParameters.Add("Field", "Yes")
        'SqlDataSource1.InsertParameters.Add("Id", 1)
        'SqlDataSource1.InsertParameters.Add("Field", "No")

    End Sub

    Protected Sub ASPxCheckBoxList1_DataBound(sender As Object, e As EventArgs)
        Dim cbl As ASPxCheckBoxList = TryCast(sender, ASPxCheckBoxList)
        Dim container As GridViewEditItemTemplateContainer = TryCast(cbl.NamingContainer, GridViewEditItemTemplateContainer)
        Dim ean13Value As Object = DataBinder.Eval(container.DataItem, "Fullyplanned")
        Dim ean13 As String = If((ean13Value Is Nothing), [String].Empty, ean13Value.ToString())
        Dim idString As String() = ean13.Split(","c)
        If ean13 Is "" Then
            Dim av = ""
        Else
            If ean13Value = False Then
                cbl.SelectedIndex = 1
                ASPxHiddenField2.Set("val", "0")
            Else
                cbl.SelectedIndex = 0
                ASPxHiddenField2.Set("val", "1")
            End If
        End If
        Dim supplierID As Integer() = New Integer(idString.Length - 1) {}
        For i As Integer = 0 To idString.Length - 1
            If Not Integer.TryParse(idString(i), supplierID(i)) Then
                Return
            End If
        Next
        For Each Item As ListEditItem In cbl.Items
            'If supplierID.Contains(Of Integer)(CInt(Item.Value)) Then
            '    Item.Selected = True
            'End If
            Dim a = Item.Value
        Next
    End Sub

    Protected Sub ASPxGridView1_RowValidating(sender As Object, e As DevExpress.Web.Data.ASPxDataValidationEventArgs)
        Try
            e.NewValues("FPReason").ToString()
            e.NewValues("AuditorStatus").ToString()
            Dim status = IIf(IsDBNull(e.NewValues("AuditorStatus")), String.Empty, e.NewValues("AuditorStatus").ToString())
            Dim file = IIf(IsDBNull(e.OldValues("AttachedDocument1")), String.Empty, e.NewValues("AttachedDocument1").ToString())
            If status.ToString() = "Complete" And (String.IsNullOrEmpty(file) Or file Is Nothing) Then
                e.RowError = "Please upload SMI document before moving the audit to complete."
            End If
        Catch ex As Exception

        End Try
    End Sub
    Protected Sub ASPxGridView1_StartRowEditing(sender As Object, e As DevExpress.Web.Data.ASPxStartRowEditingEventArgs)
        Dim lst As Object() = TryCast(ASPxGridView1.GetRowValuesByKeyValue(e.EditingKeyValue, New String() {"Id", "ClientName"}), Object())
        Session("ID") = lst(0)
        Dim lst2 As Object() = TryCast(ASPxGridView1.GetRowValuesByKeyValue(e.EditingKeyValue, New String() {"FPReason", "ClientName"}), Object())
        ASPxHiddenField3.Set("val", lst2(0))
        'ASPxDropDownEdit1.Text = lst2(0)
    End Sub

    Protected Sub ASPxCallback1_Callback(source As Object, e As CallbackEventArgs)
        SqlDataSource1.InsertParameters("StatusID").DefaultValue = e.Parameter
        SqlDataSource1.InsertParameters("TrackingID").DefaultValue = Convert.ToInt32(Session("ID"))
        SqlDataSource1.InsertParameters("User").DefaultValue = HttpContext.Current.User.Identity.Name.ToString()
        SqlDataSource1.Insert()
    End Sub

    Protected Sub ASPxGridView1_RowUpdating(sender As Object, e As DevExpress.Web.Data.ASPxDataUpdatingEventArgs)
        Dim grid As ASPxGridView = TryCast(sender, ASPxGridView)
        Dim cbl As ASPxCheckBoxList = TryCast(grid.FindEditRowCellTemplateControl(TryCast(grid.Columns("FullyPlanned"), GridViewDataColumn), "ASPxCheckBoxList1"), ASPxCheckBoxList)
        Dim ean13 As String = [String].Empty
        If cbl.SelectedItems.Count > 0 Then
            For Each supplierID As Integer In cbl.SelectedValues
                ean13 += supplierID.ToString() + ","c
            Next
            ean13 = ean13.Trim(","c)
        End If
        e.NewValues("FullyPlanned") = ean13
        If ASPxHiddenField3.Contains("val") Then
            e.NewValues("FPReason") = ASPxHiddenField3.Get("val")
        End If
        'e.Cancel = True
        'COMMENT THIS LINE TO ALLOW UPDATING
    End Sub

    Protected Sub ASPxGridView1_AfterPerformCallback(sender As Object, e As DevExpress.Web.ASPxGridViewAfterPerformCallbackEventArgs)
        If e.CallbackName = "UPDATEEDIT" Then
            ASPxGridView1.StartEdit(ASPxHiddenField1.Get("index"))
        End If
        SqlDSHistoryList.SelectParameters("TrackingID").DefaultValue = Convert.ToInt32(Session("ID"))
    End Sub

    Protected Sub ASPxGridView1_CommandButtonInitialize(sender As Object, e As ASPxGridViewCommandButtonEventArgs)
        If e.ButtonType = ColumnCommandButtonType.Update OrElse e.ButtonType = ColumnCommandButtonType.Cancel Then
            e.Visible = False
        End If
    End Sub

    Protected Sub grid_HeaderFilterFillItems(sender As Object, e As ASPxGridViewHeaderFilterEventArgs)
        If e.Column.FieldName = "Planner" OrElse e.Column.FieldName = "supplierName" OrElse e.Column.FieldName = "Auditor" OrElse e.Column.FieldName = "ClientName" OrElse e.Column.FieldName = "AuditorStatus" Then
            Dim filters As List(Of FilterValue) = e.Values
            Dim sortedFilters As List(Of FilterValue) = filters.OrderBy(Function(n) n.DisplayText).ToList()
            e.Values.Clear()
            e.Values.AddRange(sortedFilters)
        End If
    End Sub

    Protected Sub ASPxCheckBoxList1_SelectedIndexChnaged(sender As Object, e As System.EventArgs)

    End Sub

    'Protected Sub ASPxGridView1_CellEditorInitialize(sender As Object, e As DevExpress.Web.ASPxGridViewEditorEventArgs)
    '    If e.Column.FieldName = "FPReason" Then
    '        ASPxHiddenField3("val") = e.Editor.Value
    '    End If
    'End Sub

    Private Function GetData(ByVal cmd As SqlCommand, ByVal name As String) As DataTable
        Dim dt As New DataTable(name)
        Dim strConnString As [String] = System.Configuration _
            .ConfigurationManager.ConnectionStrings("CCUpdate").ConnectionString
        Dim con As New SqlConnection(strConnString)
        Dim sda As New SqlDataAdapter()
        cmd.CommandType = CommandType.Text
        cmd.Connection = con
        Try
            con.Open()
            sda.SelectCommand = cmd
            sda.Fill(dt)
            Return dt
        Catch ex As Exception
            Throw ex
        Finally
            con.Close()
            sda.Dispose()
            con.Dispose()
        End Try
    End Function

    Protected Sub ExportToExcel(ByVal sender As Object, ByVal e As System.EventArgs) Handles ExportReportBtn.Click
        Dim ds = New DataSet()
        Dim cmd As New SqlCommand("Pipeline_Report")
        Dim dt As DataTable = GetData(cmd, "CCPipeline")

        Dim cmd2 As New SqlCommand("AuditWithNoFinal_Report")
        Dim dt2 As DataTable = GetData(cmd2, "Audits with No final report")

        Dim cmd3 As New SqlCommand("NDRWithNoSD")
        Dim dt3 As DataTable = GetData(cmd3, "NDR with No Scheduled Date")

        ds.Tables.Add(dt)
        ds.Tables.Add(dt2)
        ds.Tables.Add(dt3)
        ExcelHelper.ToExcel(ds, "Report.xls", Page.Response)
    End Sub
End Class

