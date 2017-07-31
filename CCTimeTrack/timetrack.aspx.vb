Imports DevExpress.Web
Imports System.IO
Imports System.Data.SqlClient
Imports Microsoft.VisualBasic
Imports System
Imports DevExpress.Export
Imports DevExpress.XtraPrinting

Public Class timetrack
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'sQTimesheet.SelectParameters(0).DefaultValue = "ECHIDNA\khasim.a"
        sQTimesheet.SelectParameters(0).DefaultValue = HttpContext.Current.User.Identity.Name.ToString()
        'If Not IsPostBack Then
        '    cbMultiOptions.Visible = False
        '    dtStartdate.Visible = False
        '    dtEnddate.Visible = False
        '    hlExport.Visible = False
        'End If
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

    Protected Sub cbOptions_SelectedIndexChanged(sender As Object, e As EventArgs)
        Dim cmb As ASPxComboBox = DirectCast(sender, ASPxComboBox)
        Dim index = cmb.SelectedIndex
        If index = "0" Then
            DSOptions.SelectCommand = ""
            cbMultiOptions.ValueField = ""
            cbMultiOptions.TextField = ""
            'cbMultiOptions.Visible = False
            'dtStartdate.Visible = False
            'dtEnddate.Visible = False
            'hlExport.Visible = False
        End If
        If index = "1" Then
            DSOptions.SelectCommand = "SELECT ProjectId,Project FROM Projects WHERE (Act_Inact_ind = N'A') ORDER BY Project"
            cbMultiOptions.ValueField = "Project"
            cbMultiOptions.TextField = "Project"
            'cbMultiOptions.Visible = True
        End If
        If index = "2" Then
            DSOptions.SelectCommand = "SELECT TaskId,Task FROM Tasks ORDER BY Task"
            cbMultiOptions.ValueField = "Task"
            cbMultiOptions.TextField = "Task"
            'cbMultiOptions.Visible = True
        End If
        If index = "3" Then
            DSOptions.SelectCommand = "SELECT Id,Employee, Active_ind FROM employees WHERE (Active_ind = 'A') ORDER BY Employee"
            cbMultiOptions.ValueField = "Employee"
            cbMultiOptions.TextField = "Employee"
            'cbMultiOptions.Visible = True
        End If
    End Sub

    Protected Sub cbMultiOptions_SelectedIndexChanged(sender As Object, e As EventArgs)
        'Dim cmb As ASPxComboBox = DirectCast(sender, ASPxComboBox)
        'Dim index = cmb.SelectedIndex
        'Dim val = cmb.Value
        'If Not String.IsNullOrEmpty(val) Then
        '    dtStartdate.Visible = True
        '    dtEnddate.Visible = True
        '    hlExport.Visible = True
        'End If
    End Sub

    Private Function GetData(ByVal cmd As SqlCommand) As DataTable
        Dim dt As New DataTable()
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

    Protected Sub ASPxCallback1_Callback(source As Object, e As CallbackEventArgs)
        Dim cmd As New SqlCommand("TTNew_Report")
        Dim dt As DataTable = GetData(cmd)

        'Create a dummy GridView
        Dim GridView1 As New GridView()
        GridView1.AllowPaging = False
        GridView1.DataSource = dt
        GridView1.DataBind()

        Response.Clear()
        Response.Buffer = True
        Response.AddHeader("content-disposition", _
             "attachment;filename=TTNew_Report.xls")
        Response.Charset = ""
        Response.ContentType = "application/vnd.ms-excel"
        Dim sw As New StringWriter()
        Dim hw As New HtmlTextWriter(sw)

        For i As Integer = 0 To GridView1.Rows.Count - 1
            'Apply text style to each Row
            GridView1.Rows(i).Attributes.Add("class", "textmode")
        Next
        GridView1.RenderControl(hw)

        'style to format numbers to string
        Dim style As String = "<style> .textmode{mso-number-format:\@;}</style>"
        Response.Write(style)
        Response.Output.Write(sw.ToString())
        Response.Flush()
        Response.End()
    End Sub
End Class