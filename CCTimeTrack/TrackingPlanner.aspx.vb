Imports DevExpress.Web
Imports System.IO
Imports Microsoft.VisualBasic
Imports System
Imports DevExpress.Export
Imports DevExpress.XtraPrinting
Imports System.Data.SqlClient

Partial Class TrackingPlanner
    Inherits System.Web.UI.Page
    Protected Sub grid2_ClientLayout(sender As Object, e As ASPxClientLayoutArgs)
        If e.LayoutMode = ClientLayoutMode.Loading Then
            Session("TPMainLayout") = grid2.SaveClientLayout()
        End If
        If Not String.IsNullOrEmpty(Session("TPMainLayout")) Then
            grid2.LoadClientLayout(Session("TPMainLayout").ToString())
        End If
    End Sub
    Protected Sub MultiGrid_ClientLayout(sender As Object, e As ASPxClientLayoutArgs)
        'If btnDueDiligence.Border.BorderColor = System.Drawing.Color.DarkOrange Then
        If e.LayoutMode = ClientLayoutMode.Loading Then
            Session("TPMainLayout") = MultiGrid.SaveClientLayout()
        End If
        If Not String.IsNullOrEmpty(Session("TPMainLayout")) Then
            MultiGrid.LoadClientLayout(Session("TPMainLayout").ToString())
        End If
        'End If
    End Sub
    Protected Sub SqlDataSource3_Load(sender As Object, e As System.EventArgs) Handles SqlDataSource3.Load
        'SqlDataSource3.SelectParameters("userid").DefaultValue = "Dave George"
        Dim isChecked As Boolean = ChkBox.Checked
        If isChecked = False Then
            Dim command As String = SqlDSEmployee.SelectCommand
            SqlDSEmployee.SelectCommand = "SELECT ID, Employee, UserID from Employees where UserID='" + Context.User.Identity.Name + "'"
            Dim dv As DataView = DirectCast(SqlDSEmployee.[Select](DataSourceSelectArguments.Empty), DataView)
            Dim dt As DataTable = dv.ToTable()
            Dim ds As New DataSet()
            ds.Tables.Add(dt)
            For Each dr As DataRow In dv.Table.Rows
                SqlDataSource3.SelectParameters("userid").DefaultValue = dr(1).ToString()
            Next
        End If
        btnDueDiligence.Border.BorderColor = System.Drawing.Color.Empty
        btnPlanning.Border.BorderColor = System.Drawing.Color.Empty
        btnFieldWorkSettlement.Border.BorderColor = System.Drawing.Color.Empty
        btnHold.Border.BorderColor = System.Drawing.Color.Empty
        btnMasterGrid.Border.BorderColor = System.Drawing.Color.DarkOrange
        If isChecked = True Then
            SqlDataSource3.SelectParameters("userid").DefaultValue = "All"
        End If
    End Sub
    Protected Sub grid2_InitNewRow(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataInitNewRowEventArgs) Handles grid2.InitNewRow
        'e.NewValues("BirthDate") = New DateTime(1970, 1, 10)
        'e.NewValues("Title") = "Sales Representative"
    End Sub
    Protected Sub grid2_RowInserting(sender As Object, e As DevExpress.Web.Data.ASPxDataInsertingEventArgs) Handles grid2.RowInserting
        'e.NewValues("Id") = 15
        'e.NewValues("Clientid") = 25
        'e.NewValues("Planner") = "tyuio"
        'e.NewValues("DDLead") = "5465465"
    End Sub
    Protected Sub grid2_CellEditorInitialize(sender As Object, e As ASPxGridViewEditorEventArgs)
        If (e.Column.FieldName = "NotificationLetterDate" OrElse e.Column.FieldName = "ContractReceiptDate" OrElse e.Column.FieldName = "COQDate" OrElse e.Column.FieldName = "AuditorKickOff" OrElse e.Column.FieldName = "Sample Send") Then
            If Not IsDBNull(e.Value) Then
                e.Editor.Value = Convert.ToDateTime(e.Value)
            Else
                Convert.ToDateTime(DateTime.Today)
            End If
        End If
        If (e.Column.FieldName = "LeadPlanner") Then
            If Not IsDBNull(e.Value) Then
                e.Editor.Value = e.Value
            Else
                e.Editor.Value = e.Value
            End If
        End If
    End Sub
    Protected Sub chkBox_OnCheckedChanged(ByVal sender As Object, ByVal e As EventArgs)
        Dim isChecked As Boolean = ChkBox.Checked
        If isChecked = False Then
            Dim command As String = SqlDSEmployee.SelectCommand
            SqlDSEmployee.SelectCommand = "SELECT ID, Employee, UserID from Employees where UserID='" + Context.User.Identity.Name + "'"
            Dim dv As DataView = DirectCast(SqlDSEmployee.[Select](DataSourceSelectArguments.Empty), DataView)
            Dim dt As DataTable = dv.ToTable()
            Dim ds As New DataSet()
            ds.Tables.Add(dt)
            For Each dr As DataRow In dv.Table.Rows
                SqlDataSource3.SelectParameters("userid").DefaultValue = dr(1).ToString()
            Next
        End If
        If isChecked = True Then
            SqlDataSource3.SelectParameters("userid").DefaultValue = "All"
        End If
    End Sub
    Protected Sub gridSupplier_InitNewRow(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataInitNewRowEventArgs) Handles gridSupplier.InitNewRow

    End Sub
    Protected Sub gridSupplier_RowInserting(sender As Object, e As DevExpress.Web.Data.ASPxDataInsertingEventArgs) Handles gridSupplier.RowInserting

    End Sub
    Protected Sub gridSupplier_CellEditorInitialize(sender As Object, e As ASPxGridViewEditorEventArgs)

    End Sub
    Protected Sub ASPxCallback1_Callback(source As Object, e As CallbackEventArgs)
        SqlDataSource4.InsertParameters("StatusID").DefaultValue = e.Parameter
        SqlDataSource4.InsertParameters("TrackingID").DefaultValue = Convert.ToInt32(Session("ID"))
        SqlDataSource4.InsertParameters("User").DefaultValue = HttpContext.Current.User.Identity.Name.ToString()
        SqlDataSource4.Insert()
    End Sub
    Protected Sub grid2_StartRowEditing(sender As Object, e As DevExpress.Web.Data.ASPxStartRowEditingEventArgs)
        Dim lst As Object() = TryCast(grid2.GetRowValuesByKeyValue(e.EditingKeyValue, New String() {"Id", "ClientName"}), Object())
        Session("ID") = lst(0)
    End Sub
    Protected Sub grid2_AfterPerformCallback(sender As Object, e As DevExpress.Web.ASPxGridViewAfterPerformCallbackEventArgs)
        SqlDSHistoryList.SelectParameters("TrackingID").DefaultValue = Convert.ToInt32(Session("ID"))
        If e.CallbackName = "UPDATEEDIT" Then
            Dim ss = Session("ID").ToString()
            Dim index = grid2.FindVisibleIndexByKeyValue(ss)
            grid2.StartEdit(index)
        End If
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

    Protected Sub ExportToExcel(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnDDReport.Click
        'Get the data from database into datatable
        Dim lnk As ASPxButton = TryCast(sender, ASPxButton)
        Dim Value1 As [String] = lnk.Attributes("CustomParameter").ToString()
        Dim strQuery As String = Value1
        Dim cmd As New SqlCommand(strQuery)
        Dim dt As DataTable = GetData(cmd)

        'Create a dummy GridView
        Dim GridView1 As New GridView()
        GridView1.AllowPaging = False
        GridView1.DataSource = dt
        GridView1.DataBind()

        Response.Clear()
        Response.Buffer = True
        Response.AddHeader("content-disposition", _
             "attachment;filename=" + Value1 + ".xls")
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


    Protected Sub grid2_HeaderFilterFillItems(sender As Object, e As ASPxGridViewHeaderFilterEventArgs)

        If e.Column.FieldName = "Clientid" OrElse e.Column.FieldName = "StatusId" OrElse e.Column.FieldName = "SupplierId" OrElse e.Column.FieldName = "DDLead" OrElse e.Column.FieldName = "LeadPlanner" OrElse e.Column.FieldName = "Planner" Then
            Dim filters As List(Of FilterValue) = e.Values

            'sort by DisplayText.

            Dim sortedFilters As List(Of FilterValue) = filters.OrderBy(Function(n) n.DisplayText).ToList()
            e.Values.Clear()
            e.Values.AddRange(sortedFilters)
        End If
    End Sub

    Protected Sub grid2_CommandButtonInitialize(sender As Object, e As ASPxGridViewCommandButtonEventArgs)
        If e.ButtonType = ColumnCommandButtonType.Update OrElse e.ButtonType = ColumnCommandButtonType.Cancel Then
            e.Visible = False
        End If
    End Sub

    Protected Sub MultiSourceFunction(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnDueDiligence.Click
        Dim lnk As ASPxButton = TryCast(sender, ASPxButton)
        btnDueDiligence.Border.BorderColor = System.Drawing.Color.Empty
        btnPlanning.Border.BorderColor = System.Drawing.Color.Empty
        btnFieldWorkSettlement.Border.BorderColor = System.Drawing.Color.Empty
        btnHold.Border.BorderColor = System.Drawing.Color.Empty
        btnMasterGrid.Border.BorderColor = System.Drawing.Color.Empty
        If lnk.Text = "Due Diligence" Then
            btnDueDiligence.Border.BorderColor = System.Drawing.Color.DarkOrange
        End If
        If lnk.Text = "Planning" Then
            btnPlanning.Border.BorderColor = System.Drawing.Color.DarkOrange
        End If
        If lnk.Text = "Field Work / Settlement" Then
            btnFieldWorkSettlement.Border.BorderColor = System.Drawing.Color.DarkOrange
        End If
        If lnk.Text = "Hold" Then
            btnHold.Border.BorderColor = System.Drawing.Color.DarkOrange
        End If
        If lnk.Text = "Master View" Then
            btnMasterGrid.Border.BorderColor = System.Drawing.Color.DarkOrange
        End If
        grid2.Visible = False
        MultiGrid.CancelEdit()
        MultiGrid.Visible = True
        MultiGrid.Columns.Clear()
        DSMultiSource.SelectParameters("source").DefaultValue = lnk.Attributes("CustomParameter").ToString()
        MultiGrid.AutoGenerateColumns = True
        MultiGrid.DataBind()

        'Dim grid As ASPxGridView = CType(sender, ASPxGridView)
        For Each c As GridViewDataColumn In MultiGrid.Columns
            If lnk.Text = "Due Diligence" OrElse lnk.Text = "Planning" OrElse lnk.Text = "Hold" Then
                If (c.FieldName.ToString()).StartsWith("Type") OrElse (c.FieldName.ToString()).StartsWith("Planner") OrElse (c.FieldName.ToString()).StartsWith("LeadPlanner") OrElse (c.FieldName.ToString()).StartsWith("Supplier") OrElse (c.FieldName.ToString()).StartsWith("Client") OrElse (c.FieldName.ToString()).StartsWith("StatusId") OrElse (c.FieldName.ToString()).StartsWith("Status") OrElse (c.FieldName.ToString()).StartsWith("ClientId") OrElse (c.FieldName.ToString()).StartsWith("SupplierId") OrElse (c.FieldName.ToString()).StartsWith("DDFailedReason") OrElse (c.FieldName.ToString()).StartsWith("SampleSend") Then
                    c.Visible = False
                End If
                If (c.FieldName.ToString()).StartsWith("ContractsReceived") Then
                    c.Caption = "Contract Received Date"
                    c.EditFormSettings.Visible = True
                    c.EditFormSettings.VisibleIndex = "9"
                End If
                If (c.FieldName.ToString()).StartsWith("DDWriteupDate") Then
                    c.Caption = "DD Write Up Completed"
                    c.EditFormSettings.Visible = True
                    c.EditFormSettings.VisibleIndex = "10"
                End If
                If (c.FieldName.ToString()).StartsWith("Data_Received_Date") Then
                    c.Caption = "Data Received Date"
                    c.EditFormSettings.Visible = True
                    c.EditFormSettings.VisibleIndex = "13"
                End If
                If (c.FieldName.ToString()).StartsWith("ContractOwner") Then
                    c.Caption = "Contract Owner Questionnaire"
                    c.EditFormSettings.Visible = False
                    c.Visible = True
                    c.EditFormSettings.VisibleIndex = "17"
                End If
                If (c.FieldName.ToString()).StartsWith("SampleSend") Then
                    c.Caption = "Sample Issued Date"
                    c.EditFormSettings.Visible = True
                    c.EditFormSettings.VisibleIndex = "15"
                End If
                If (c.FieldName.ToString()).StartsWith("NotificationLetterDate") Then
                    c.Caption = "NDR Date"
                    c.EditFormSettings.Visible = True
                    c.EditFormSettings.VisibleIndex = "12"
                End If
                If (c.FieldName.ToString()).StartsWith("SampleApprovaldate") Then
                    c.Caption = "Sample Approval Date"
                    c.EditFormSettings.Visible = True
                    c.EditFormSettings.VisibleIndex = "14"
                End If
                'If (c.FieldName.ToString()).StartsWith("SampleSend") Then
                '    c.Caption = "Sample Sent Date"
                'End If
                If (c.FieldName.ToString()).StartsWith("scheduleddate") Then
                    c.Caption = "Kick-Off Date"
                    If lnk.Text = "Planning" Then
                        c.Visible = True
                        c.VisibleIndex = "11"
                    End If
                    'If lnk.Text = "Due Diligence" Then
                    '    c.Visible = False
                    '    CType(MultiGrid.Columns(c.FieldName), GridViewDataColumn).Visible = DevExpress.Utils.DefaultBoolean.False
                    'End If
                    'If (c.FieldName.ToString()).StartsWith("scheduleddate") Then
                    '    c.Caption = "Kick-Off Date"
                    '    If lnk.Text <> "Due Diligence" Then
                    '        CType(MultiGrid.Columns(c.FieldName), GridViewDataColumn).Visible = DevExpress.Utils.DefaultBoolean.True
                    '        CType(MultiGrid.Columns(c.FieldName), GridViewDataColumn).VisibleIndex = "11"
                    '    End If
                    '    If lnk.Text = "Due Diligence" Then
                    '        CType(MultiGrid.Columns(c.FieldName), GridViewDataColumn).Visible = DevExpress.Utils.DefaultBoolean.False
                    '    End If
                    'End If

                    c.EditFormSettings.Visible = True
                    c.EditFormSettings.VisibleIndex = "16"
                End If
                If (c.FieldName.ToString()).StartsWith("DDSpend") OrElse (c.FieldName.ToString()).StartsWith("DDLead") Then
                    c.PropertiesEdit.DisplayFormatString = "C2"
                    c.EditFormSettings.Visible = True
                    c.EditFormSettings.VisibleIndex = "3"
                    c.Visible = False
                End If
            End If
            If (c.FieldName.ToString()).StartsWith("Id") Then
                c.Visible = False
            End If
            If ((c.FieldName.ToString()).StartsWith("Type") OrElse (c.FieldName.ToString()).StartsWith("SampleSend")) And lnk.Text = "Planning" Then
                c.Visible = True
            End If
            If (lnk.Text = "Field Work / Settlement" OrElse lnk.Text = "Hold") And ((c.FieldName.ToString()).StartsWith("DDSpend") OrElse (c.FieldName.ToString()).StartsWith("DDLead")) Then
                c.PropertiesEdit.DisplayFormatString = "C2"
                'c.Visible = False
            End If
            If lnk.Text = "Hold" Then
                If (c.FieldName.ToString()).StartsWith("Planning Status") OrElse (c.FieldName.ToString()).StartsWith("DDSpend") OrElse (c.FieldName.ToString()).StartsWith("DDWriteupDate") Then
                    c.Visible = False
                End If
                If (c.FieldName.ToString()).StartsWith("DDLead") Then
                    c.Visible = False
                    'CType(MultiGrid.Columns(c.FieldName), GridViewDataColumn).EditFormSettings.Visible = DevExpress.Utils.DefaultBoolean.True
                End If
                If (c.FieldName.ToString()).StartsWith("DDWriteupDate") Then
                    c.Visible = False
                    CType(MultiGrid.Columns(c.FieldName), GridViewDataColumn).EditFormSettings.Visible = DevExpress.Utils.DefaultBoolean.True
                End If
            End If

            If lnk.Text = "Planning" Then
                If (c.FieldName.ToString()).StartsWith("Type") Then
                    c.Visible = False
                End If
                If (c.FieldName.ToString()).StartsWith("DDLead") Then
                    CType(MultiGrid.Columns(c.FieldName), GridViewDataColumn).EditFormSettings.Visible = DevExpress.Utils.DefaultBoolean.True
                    CType(MultiGrid.Columns(c.FieldName), GridViewDataColumn).EditFormSettings.VisibleIndex = "7"
                End If
                If (c.FieldName.ToString()).StartsWith("scheduleddate") Then
                    c.Caption = "Kick-Off Date"
                    CType(MultiGrid.Columns(c.FieldName), GridViewDataColumn).Visible = DevExpress.Utils.DefaultBoolean.True
                    CType(MultiGrid.Columns(c.FieldName), GridViewDataColumn).VisibleIndex = "11"
                End If
                If (c.FieldName.ToString()).StartsWith("DDWriteupDate") OrElse (c.FieldName.ToString()).StartsWith("ContractsReceived") Then
                    c.Visible = False
                    CType(MultiGrid.Columns(c.FieldName), GridViewDataColumn).EditFormSettings.Visible = DevExpress.Utils.DefaultBoolean.True
                End If
            End If

            If (c.FieldName.ToString()).StartsWith("Auditor") OrElse (c.FieldName.ToString()).StartsWith("COQDate") OrElse (c.FieldName.ToString()).StartsWith("NotificationLetterDate") OrElse (c.FieldName.ToString()).StartsWith("Data_Received_Date") OrElse (c.FieldName.ToString()).StartsWith("SampleApprovaldate") OrElse (c.FieldName.ToString()).StartsWith("SampleSend") Then
                If lnk.Text = "Planning" And ((c.FieldName.ToString()).StartsWith("NotificationLetterDate") OrElse (c.FieldName.ToString()).StartsWith("Auditor") OrElse (c.FieldName.ToString()).StartsWith("SampleApprovaldate") OrElse (c.FieldName.ToString()).StartsWith("SampleSend")) Then

                Else
                    c.Visible = False
                    CType(MultiGrid.Columns(c.FieldName), GridViewDataColumn).EditFormSettings.Visible = DevExpress.Utils.DefaultBoolean.True
                    If c.FieldName = "COQDate" Then
                        CType(MultiGrid.Columns(c.FieldName), GridViewDataColumn).EditFormSettings.VisibleIndex = "11"
                    End If
                    If c.FieldName = "NotificationLetterDate" Then
                        CType(MultiGrid.Columns(c.FieldName), GridViewDataColumn).EditFormSettings.VisibleIndex = "12"
                    End If
                    If c.FieldName = "Data_Received_Date" Then
                        If lnk.Text <> "Due Diligence" Then
                            CType(MultiGrid.Columns(c.FieldName), GridViewDataColumn).Visible = True
                        End If
                        CType(MultiGrid.Columns(c.FieldName), GridViewDataColumn).EditFormSettings.VisibleIndex = "13"
                    End If
                    If c.FieldName = "SampleApprovaldate" Then
                        CType(MultiGrid.Columns(c.FieldName), GridViewDataColumn).EditFormSettings.VisibleIndex = "14"
                    End If
                    If c.FieldName = "SampleSend" Then
                        CType(MultiGrid.Columns(c.FieldName), GridViewDataColumn).EditFormSettings.VisibleIndex = "15"
                    End If
                End If
            End If
            If (c.FieldName.ToString()).StartsWith("Auditor") Then
                c.Visible = False
                CType(MultiGrid.Columns(c.FieldName), GridViewDataColumn).EditFormSettings.Visible = DevExpress.Utils.DefaultBoolean.False
            End If
            c.EditFormSettings.ColumnSpan = "2"
        Next c
        'Dim btn As New GridViewDataTextColumn()
        'btn.Visible = False
        'btn.EditFormSettings.Visible = True
        'Dim aspxBtn As New ASPxButton()
        'aspxBtn.ClientSideEvents.Click = "function(s, e) { MultiGrid.UpdateEdit(); }"


        'MultiGrid.ClientSideEvents.CustomButtonClick = "function(s, e) { MultiGrid.UpdateEdit(); }"
        If lnk.Text = "Field Work / Settlement" Then
            Dim ddspend As New GridViewDataTextColumn()
            ddspend.PropertiesTextEdit.DisplayFormatInEditMode = True
            ddspend.PropertiesTextEdit.DisplayFormatString = "C2"
            ddspend.FieldName = "DDSpend"
            MultiGrid.Columns.Add(ddspend)
        End If
        If lnk.Text = "Hold" Then
            Dim AudColumn1 As New GridViewDataComboBoxColumn()
            AudColumn1.PropertiesComboBox.DataSourceID = "SqlDataSource8"
            AudColumn1.PropertiesComboBox.TextField = "Employee"
            AudColumn1.PropertiesComboBox.ValueField = "Employee"
            AudColumn1.FieldName = "Auditor"
            AudColumn1.Visible = True
            AudColumn1.EditFormSettings.Visible = True
            AudColumn1.VisibleIndex = "4"
            AudColumn1.EditFormSettings.VisibleIndex = "5"
            AudColumn1.EditFormSettings.ColumnSpan = "2"
            MultiGrid.Columns.Add(AudColumn1)

            Dim StatusColumn As New GridViewDataComboBoxColumn()
            StatusColumn.PropertiesComboBox.DataSourceID = "SqlDataSource4"
            StatusColumn.PropertiesComboBox.TextField = "Status"
            StatusColumn.PropertiesComboBox.ValueField = "StatusId"
            StatusColumn.FieldName = "StatusId"
            StatusColumn.Caption = "Planning Status"
            'StatusColumn.PropertiesComboBox.ClientSideEvents.SelectedIndexChanged = "function(s, e){if(s.GetValue()=='12'){ TPclb.PerformCallback(s.GetValue()); }}"
            StatusColumn.PropertiesComboBox.ClientSideEvents.SelectedIndexChanged = "function(s, e){if(s.GetText()=='NDR Issued'){MultiGrid.GetEditor('NotificationLetterDate').SetValue(new Date());} if(s.GetValue()=='19'){TPclb.PerformCallback(s.GetValue());pcDDFailedReason.Show();}TPclb.PerformCallback(s.GetValue());}"
            StatusColumn.VisibleIndex = 5
            StatusColumn.EditFormSettings.Visible = True
            StatusColumn.EditFormSettings.VisibleIndex = "8"
            StatusColumn.EditFormSettings.ColumnSpan = "2"
            MultiGrid.Columns.Add(StatusColumn)
            'Client Column
            Dim ClientColumn As New GridViewDataComboBoxColumn()
            ClientColumn.PropertiesComboBox.DataSourceID = "SqlDataSource5"
            ClientColumn.PropertiesComboBox.TextField = "ClientName"
            ClientColumn.PropertiesComboBox.ValueField = "ClientId"
            ClientColumn.FieldName = "ClientId"
            ClientColumn.Caption = "Client"
            ClientColumn.VisibleIndex = 1
            ClientColumn.EditFormSettings.Visible = True
            ClientColumn.EditFormSettings.VisibleIndex = "0"
            ClientColumn.EditFormSettings.ColumnSpan = "2"
            MultiGrid.Columns.Add(ClientColumn)
            'Supplier Column
            Dim SupplierColumn As New GridViewDataComboBoxColumn()
            SupplierColumn.PropertiesComboBox.DataSourceID = "SqlDataSource6"
            SupplierColumn.PropertiesComboBox.TextField = "SupplierName"
            SupplierColumn.PropertiesComboBox.ValueField = "SupplierId"
            SupplierColumn.FieldName = "SupplierId"
            SupplierColumn.Caption = "Supplier"
            SupplierColumn.VisibleIndex = 2
            SupplierColumn.EditFormSettings.Visible = True
            SupplierColumn.EditFormSettings.VisibleIndex = "1"
            SupplierColumn.EditFormSettings.ColumnSpan = "2"
            MultiGrid.Columns.Add(SupplierColumn)
            'Lead Planner/Planner Column
            Dim LPColumn As New GridViewDataComboBoxColumn()
            LPColumn.PropertiesComboBox.DataSourceID = "SqlDataSource7"
            LPColumn.PropertiesComboBox.TextField = "Employee"
            LPColumn.PropertiesComboBox.ValueField = "Employee"
            LPColumn.FieldName = "LeadPlanner"
            LPColumn.Caption = "Lead Planner"
            LPColumn.VisibleIndex = 3
            LPColumn.EditFormSettings.Visible = True
            LPColumn.EditFormSettings.VisibleIndex = "4"
            LPColumn.EditFormSettings.ColumnSpan = "2"
            MultiGrid.Columns.Add(LPColumn)
            'Planner Column
            Dim PColumn As New GridViewDataComboBoxColumn()
            PColumn.PropertiesComboBox.DataSourceID = "SqlDataSource7"
            PColumn.PropertiesComboBox.TextField = "Employee"
            PColumn.PropertiesComboBox.ValueField = "Employee"
            PColumn.FieldName = "Planner"
            PColumn.Caption = "Planner"
            PColumn.VisibleIndex = 4
            PColumn.EditFormSettings.Visible = True
            PColumn.EditFormSettings.VisibleIndex = "6"
            PColumn.EditFormSettings.ColumnSpan = "2"
            MultiGrid.Columns.Add(PColumn)

            Dim ddspend As New GridViewDataTextColumn()
            ddspend.PropertiesTextEdit.DisplayFormatInEditMode = True
            ddspend.PropertiesTextEdit.DisplayFormatString = "C2"
            ddspend.FieldName = "DDSpend"
            ddspend.VisibleIndex = 5
            ddspend.EditFormSettings.Visible = True
            ddspend.EditFormSettings.VisibleIndex = "3"
            ddspend.EditFormSettings.ColumnSpan = "2"
            MultiGrid.Columns.Add(ddspend)

            'Fixed Fee/Gain Share Column
            Dim FixedGainCol As New GridViewDataComboBoxColumn()
            FixedGainCol.PropertiesComboBox.TextField = ""
            FixedGainCol.PropertiesComboBox.ValueField = ""
            FixedGainCol.PropertiesComboBox.Items.Add("Gain Share")
            FixedGainCol.PropertiesComboBox.Items.Add("Fixed Fee")
            FixedGainCol.FieldName = "Type"
            FixedGainCol.VisibleIndex = 9
            FixedGainCol.EditFormSettings.Visible = True
            FixedGainCol.EditFormSettings.VisibleIndex = "2"
            FixedGainCol.Caption = "Fixed Fee/Gain Share"
            FixedGainCol.EditFormSettings.ColumnSpan = "2"
            MultiGrid.Columns.Add(FixedGainCol)

            Dim StatusDate As New GridViewDataDateColumn()
            StatusDate.FieldName = "StatusDate"
            StatusDate.Caption = "On Hold Date"
            StatusDate.VisibleIndex = 8
            StatusDate.EditFormSettings.Visible = True
            StatusDate.EditFormSettings.VisibleIndex = "17"
            StatusDate.EditFormSettings.ColumnSpan = "2"
            MultiGrid.Columns.Add(StatusDate)

            Dim EditBtn As New GridViewCommandColumn()
            EditBtn.VisibleIndex = 0
            EditBtn.Caption = " "
            Dim btn As New GridViewCommandColumnCustomButton()
            btn.ID = "EditBtn"
            btn.Text = "Edit"
            EditBtn.CustomButtons.Add(btn)
            MultiGrid.Columns.Add(EditBtn)
        End If
        If lnk.Text = "Due Diligence" OrElse lnk.Text = "Planning" Then
            'Edit Button
            'Dim col As New GridViewCommandColumn()
            'col.Name = "CommandColumn"
            'col.ShowEditButton = True
            'col.Caption = " "
            'col.VisibleIndex = 0
            ' MultiGrid.Columns.Add(col)
            'Planning Status Column
            Dim AudColumn As New GridViewDataComboBoxColumn()
            AudColumn.PropertiesComboBox.DataSourceID = "SqlDataSource8"
            AudColumn.PropertiesComboBox.TextField = "Employee"
            AudColumn.PropertiesComboBox.ValueField = "Employee"
            AudColumn.FieldName = "Auditor"
            AudColumn.EditFormSettings.ColumnSpan = "2"
            AudColumn.Visible = True
            AudColumn.EditFormSettings.Visible = True
            AudColumn.VisibleIndex = "4"
            AudColumn.EditFormSettings.VisibleIndex = "5"
            MultiGrid.Columns.Add(AudColumn)

            'Fixed Fee/Gain Share Column
            Dim FixedGainCol1 As New GridViewDataComboBoxColumn()
            FixedGainCol1.PropertiesComboBox.TextField = ""
            FixedGainCol1.PropertiesComboBox.ValueField = ""
            FixedGainCol1.PropertiesComboBox.Items.Add("Gain Share")
            FixedGainCol1.PropertiesComboBox.Items.Add("Fixed Fee")
            FixedGainCol1.FieldName = "Type"
            FixedGainCol1.EditFormSettings.Visible = True
            FixedGainCol1.EditFormSettings.VisibleIndex = "2"
            FixedGainCol1.VisibleIndex = "10"
            FixedGainCol1.Caption = "Fixed Fee/Gain Share"
            FixedGainCol1.EditFormSettings.ColumnSpan = "2"
            MultiGrid.Columns.Add(FixedGainCol1)

            Dim StatusColumn As New GridViewDataComboBoxColumn()
            StatusColumn.PropertiesComboBox.DataSourceID = "SqlDataSource4"
            StatusColumn.PropertiesComboBox.TextField = "Status"
            StatusColumn.PropertiesComboBox.ValueField = "StatusId"
            StatusColumn.FieldName = "StatusId"
            StatusColumn.Caption = "Planning Status"
            'StatusColumn.PropertiesComboBox.ClientSideEvents.SelectedIndexChanged = "function(s, e){if(s.GetValue()=='12'){ TPclb.PerformCallback(s.GetValue()); }}"
            StatusColumn.PropertiesComboBox.ClientSideEvents.SelectedIndexChanged = "function(s, e){if(s.GetText()=='NDR Issued'){MultiGrid.GetEditor('NotificationLetterDate').SetValue(new Date());} if(s.GetValue()=='19'){TPclb.PerformCallback(s.GetValue());pcDDFailedReason.Show();}TPclb.PerformCallback(s.GetValue());}"
            StatusColumn.VisibleIndex = 7
            StatusColumn.EditFormSettings.ColumnSpan = "2"
            StatusColumn.EditFormSettings.Visible = True
            StatusColumn.EditFormSettings.VisibleIndex = "8"
            MultiGrid.Columns.Add(StatusColumn)
            'Client Column
            Dim ClientColumn As New GridViewDataComboBoxColumn()
            ClientColumn.PropertiesComboBox.DataSourceID = "SqlDataSource5"
            ClientColumn.PropertiesComboBox.TextField = "ClientName"
            ClientColumn.PropertiesComboBox.ValueField = "ClientId"
            ClientColumn.FieldName = "ClientId"
            ClientColumn.Caption = "Client"
            ClientColumn.VisibleIndex = 1
            ClientColumn.EditFormSettings.Visible = True
            ClientColumn.EditFormSettings.VisibleIndex = "0"
            ClientColumn.EditFormSettings.ColumnSpan = "2"
            MultiGrid.Columns.Add(ClientColumn)
            'Supplier Column
            Dim SupplierColumn As New GridViewDataComboBoxColumn()
            SupplierColumn.PropertiesComboBox.DataSourceID = "SqlDataSource6"
            SupplierColumn.PropertiesComboBox.TextField = "SupplierName"
            SupplierColumn.PropertiesComboBox.ValueField = "SupplierId"
            SupplierColumn.FieldName = "SupplierId"
            SupplierColumn.Caption = "Supplier"
            SupplierColumn.VisibleIndex = 2
            SupplierColumn.EditFormSettings.Visible = True
            SupplierColumn.EditFormSettings.VisibleIndex = "1"
            SupplierColumn.EditFormSettings.ColumnSpan = "2"
            MultiGrid.Columns.Add(SupplierColumn)
            'Lead Planner/Planner Column
            Dim LPColumn As New GridViewDataComboBoxColumn()
            LPColumn.PropertiesComboBox.DataSourceID = "SqlDataSource7"
            LPColumn.PropertiesComboBox.TextField = "Employee"
            LPColumn.PropertiesComboBox.ValueField = "Employee"
            LPColumn.FieldName = "LeadPlanner"
            LPColumn.Caption = "Lead Planner"
            LPColumn.VisibleIndex = 3
            LPColumn.EditFormSettings.Visible = True
            LPColumn.EditFormSettings.VisibleIndex = "4"
            LPColumn.EditFormSettings.ColumnSpan = "2"
            MultiGrid.Columns.Add(LPColumn)
            'Planner Column
            Dim PColumn As New GridViewDataComboBoxColumn()
            PColumn.PropertiesComboBox.DataSourceID = "SqlDataSource7"
            PColumn.PropertiesComboBox.TextField = "Employee"
            PColumn.PropertiesComboBox.ValueField = "Employee"
            PColumn.FieldName = "Planner"
            PColumn.Caption = "Planner"
            PColumn.VisibleIndex = 4
            PColumn.EditFormSettings.Visible = True
            PColumn.EditFormSettings.VisibleIndex = "6"
            PColumn.EditFormSettings.ColumnSpan = "2"
            MultiGrid.Columns.Add(PColumn)

            Dim ddlead As New GridViewDataTextColumn()
            ddlead.PropertiesTextEdit.DisplayFormatInEditMode = True
            ddlead.PropertiesTextEdit.DisplayFormatString = "C2"
            ddlead.FieldName = "DDLead"
            ddlead.EditFormSettings.ColumnSpan = "2"
            If lnk.Text = "Planning" Then
                ddlead.Visible = False
            End If
            ddlead.EditFormSettings.Visible = True
            ddlead.EditFormSettings.VisibleIndex = "7"
            MultiGrid.Columns.Add(ddlead)

            Dim ddspend As New GridViewDataTextColumn()
            ddspend.PropertiesTextEdit.DisplayFormatInEditMode = True
            ddspend.PropertiesTextEdit.DisplayFormatString = "C2"
            ddspend.FieldName = "DDSpend"
            ddspend.EditFormSettings.Visible = True
            ddspend.EditFormSettings.VisibleIndex = "3"
            ddspend.EditFormSettings.ColumnSpan = "2"
            MultiGrid.Columns.Add(ddspend)

            'If lnk.Text = "Due Diligence" Then
            '    'Fixed Fee/Gain Share Column
            '    Dim FixedGainCol As New GridViewDataComboBoxColumn()
            '    FixedGainCol.PropertiesComboBox.TextField = ""
            '    FixedGainCol.PropertiesComboBox.ValueField = ""
            '    FixedGainCol.PropertiesComboBox.Items.Add("Gain Share")
            '    FixedGainCol.PropertiesComboBox.Items.Add("Fixed Fee")
            '    FixedGainCol.FieldName = "Type"
            '    FixedGainCol.Caption = "Fixed Fee/Gain Share"
            '    MultiGrid.Columns.Add(FixedGainCol)
            'End If
            Dim EditBtn As New GridViewCommandColumn()
            EditBtn.VisibleIndex = 0
            EditBtn.Caption = " "
            Dim btn As New GridViewCommandColumnCustomButton()
            btn.ID = "EditBtn"
            btn.Text = "Edit"
            EditBtn.CustomButtons.Add(btn)
            MultiGrid.Columns.Add(EditBtn)
        End If

        If lnk.Text = "Hold" Then
            Dim ddlead As New GridViewDataTextColumn()
            ddlead.PropertiesTextEdit.DisplayFormatInEditMode = True
            ddlead.PropertiesTextEdit.DisplayFormatString = "C2"
            ddlead.FieldName = "DDLead"
            ddlead.EditFormSettings.Visible = True
            ddlead.EditFormSettings.VisibleIndex = "7"
            ddlead.EditFormSettings.ColumnSpan = "2"
            MultiGrid.Columns.Add(ddlead)
        End If

        'If lnk.Text = "Due Diligence" OrElse lnk.Text = "Planning" OrElse lnk.Text = "Hold" Then
        '    Dim StatusLists As New GridViewDataTextColumn()
        '    'StatusLists.Visible = False
        '    'StatusLists.EditFormSettings.Visible = True
        '    StatusLists.EditItemTemplate = New CreateStatusListTemplate()
        '    StatusLists.Name = "colItemTemplate"
        '    StatusLists.Caption = "Template Column"
        '    MultiGrid.Columns.Add(StatusLists)
        '    CType(MultiGrid.Columns("colItemTemplate"), GridViewDataColumn).DataItemTemplate = New CreateStatusListTemplate()
        '    'CType(MultiGrid.Columns("colItemTemplate"), GridViewDataColumn).DataItemTemplate = New CreateStatusListTemplate()
        '    'CType(MultiGrid.Columns("colItemTemplate"), GridViewDataColumn).EditItemTemplate = New CreateStatusListTemplate()
        '    'CType(MultiGrid.Columns("colItemTemplate"), GridViewDataTextColumn).EditItemTemplate = New CreateStatusListTemplate()
        'End If
    End Sub

    'Select_List2.SelectedIndexChanged += new EventHandler(DropDownList_SelectedIndexChanged);



    Protected Sub MasterPlanner(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnMasterGrid.Click
        grid2.Visible = True
        MultiGrid.Visible = False
    End Sub
    Dim UpdatedId
    Protected Sub MultiGrid_OnRowUpdating(sender As Object, e As DevExpress.Web.Data.ASPxDataUpdatingEventArgs)
        Dim txt = ""
        If Session("TempID") IsNot Nothing Then
            txt = Session("TempID")
        End If
        If DSMultiSource.SelectParameters("source").DefaultValue = "Planning" Then
            DSMultiSource.UpdateCommand = "UPDATE CC_TrackingMain SET ClientId=@ClientId,SupplierId =@SupplierId, Planner = @Planner, LeadPlanner = @LeadPlanner,DDLead =@DDLead, [DD Spend] =@DDSpend, Status =@StatusId, NotificationLetterDate =@NotificationLetterDate, SampleApprovaldate =@SampleApprovaldate, [Sample Send] =@SampleSend, Auditor = @Auditor, Type =@Type, ContractsReceived =@ContractsReceived, DDWriteupDate =@DDWriteupDate, COQDate =@COQDate, Data_Received_Date =@Data_Received_Date, scheduleddate =@scheduleddate" + txt + " WHERE Id=@Id"
        End If
        If DSMultiSource.SelectParameters("source").DefaultValue = "DueDiligence" Then
            DSMultiSource.UpdateCommand = "UPDATE CC_TrackingMain SET ClientId=@ClientId,SupplierId =@SupplierId, Planner = @Planner, LeadPlanner = @LeadPlanner,DDLead =@DDLead, [DD Spend] =@DDSpend, Status =@StatusId, ContractsReceived =@ContractsReceived,DDWriteupDate =@DDWriteupDate, ContractOwner =@ContractOwner, Type =@Type, [Sample Send] =@SampleSend, Auditor = @Auditor, COQDate =@COQDate, Data_Received_Date =@Data_Received_Date,SampleApprovaldate =@SampleApprovaldate, scheduleddate =@scheduleddate, NotificationLetterDate =@NotificationLetterDate" + txt + " WHERE Id=@Id"
        End If
        If DSMultiSource.SelectParameters("source").DefaultValue = "Hold" Then
            DSMultiSource.UpdateCommand = "UPDATE CC_TrackingMain SET ClientId=@ClientId,SupplierId =@SupplierId, Planner = @Planner, LeadPlanner = @LeadPlanner, [DD Spend] =@DDSpend, Status =@StatusId, ContractsReceived =@ContractsReceived, StatusDate = @StatusDate, Type =@Type, DDLead =@DDLead, DDWriteupDate =@DDWriteupDate, [Sample Send] =@SampleSend, Auditor = @Auditor, COQDate =@COQDate, Data_Received_Date =@Data_Received_Date,SampleApprovaldate =@SampleApprovaldate, scheduleddate =@scheduleddate, NotificationLetterDate =@NotificationLetterDate" + txt + " WHERE Id=@Id"
        End If
        Session.Remove("TempID")
    End Sub

    Protected Sub grid2_OnRowUpdating(sender As Object, e As DevExpress.Web.Data.ASPxDataUpdatingEventArgs)
        Dim txt = ""
        If Session("TempID") IsNot Nothing Then
            txt = Session("TempID")
        End If
        SqlDataSource3.UpdateCommand = "UPDATE CC_TrackingMain SET Clientid=@Clientid,SupplierId =@SupplierId,Auditor =@Auditor,Planner = @Planner,LeadPlanner = @LeadPlanner,DDLead =@DDLead,[DD Spend] =@DDSpend,Status =@StatusId,NotificationLetterDate =@NotificationLetterDate,ContractReceiptDate =@ContractReceiptDate,Data_Received_Date =@Data_Received_Date,COQDate =@COQDate,AuditorKickOff =@AuditorKickOff,scheduleddate =@scheduleddate,DDWriteupDate =@DDWriteupDate,[Sample Send] =@SampleSend,TargetRevenewShare =@RevenewShare,Type =@Type,SampleApprovaldate = @SampleApprovaldate" + txt + " WHERE Id=@Id"
        Session.Remove("TempID")
    End Sub

    Protected Sub ASPxCallback2TP_Callback(source As Object, e As CallbackEventArgs)
        'SqlDataSource1.InsertParameters("StatusID").DefaultValue = e.Parameter
        'SqlDataSource1.InsertParameters("TrackingID").DefaultValue = Convert.ToInt32(Session("ID"))
        'SqlDataSource1.InsertParameters("User").DefaultValue = HttpContext.Current.User.Identity.Name.ToString()
        'SqlDataSource1.Insert()
        'Column.VisibleIndex = 3
        'Dim Column As New GridViewDataTextColumn()
        'Column.FieldName = "DDFailedReason"
        'MultiGrid.Columns.Add(Column)
        'If e.Parameter = "12" Then
        '    Session("TempID") = ",DDFailedReason =@DDFailedReason "
        'Else
        '    If e.Parameter <> "UpdateDDRessonField" Then
        '        Session.Remove("TempID")
        '    End If
        If e.Parameter = "UpdateDDRessonField" Then
            Session("TempID") = ",DDFailedReason =" + "'" + textarea.Value + "'"
        Else
            Session.Remove("TempID")
        End If
        'End If
    End Sub

    'Protected Sub DSMultiSource_Load(sender As Object, e As System.EventArgs) Handles DSMultiSource.Load
    '    DSMultiSource.SelectParameters("source").DefaultValue = HttpContext.Current.User.Identity.Name.ToString()
    'End Sub
    'Protected Sub btOK_OnClick(ByVal sender As Object, ByVal e As System.EventArgs) Handles btOK.Click
    '    If DSMultiSource.SelectParameters("source").DefaultValue = "Planning" And Session("TempID") And Session("TempID").ToString() = "12" Then
    '        DSMultiSource.UpdateParameters("DDFailedReason").DefaultValue = textarea.Value
    '        DSMultiSource.UpdateCommand = "UPDATE CC_TrackingMain SET ClientId=@ClientId,SupplierId =@SupplierId, Planner = @Planner, LeadPlanner = @LeadPlanner,DDLead =@DDLead, [DD Spend] =@DDSpend, Status =@StatusId, NotificationLetterDate =@NotificationLetterDate, SampleApprovaldate =@SampleApprovaldate, [Sample Send] =@SampleSend, Kickoff =@Kickoff, DDFailedReason = @DDFailedReason WHERE Id=@Id"
    '    End If
    '    If DSMultiSource.SelectParameters("source").DefaultValue = "DueDiligence" And Session("TempID") And Session("TempID").ToString() = "12" Then
    '        DSMultiSource.UpdateParameters("DDFailedReason").DefaultValue = textarea.Value
    '        DSMultiSource.UpdateCommand = "UPDATE CC_TrackingMain SET ClientId=@ClientId,SupplierId =@SupplierId, Planner = @Planner, LeadPlanner = @LeadPlanner,DDLead =@DDLead, [DD Spend] =@DDSpend, Status =@StatusId, ContractsReceived =@ContractsReceived,DDWriteupDate =@DDWriteupDate, ContractOwner =@ContractOwner, Type =@Type, DDFailedReason = @DDFailedReason WHERE Id=@Id"
    '    End If
    'End Sub

    Protected Sub MultiGrid_CommandButtonInitialize(sender As Object, e As ASPxGridViewCommandButtonEventArgs)
        If e.ButtonType = ColumnCommandButtonType.Update OrElse e.ButtonType = ColumnCommandButtonType.Cancel OrElse e.ButtonType = ColumnCommandButtonType.Edit Then
            e.Visible = False
        End If
    End Sub

    Protected Sub MultiGrid_AfterPerformCallback(sender As Object, e As DevExpress.Web.ASPxGridViewAfterPerformCallbackEventArgs)
        If e.CallbackName = "UPDATEEDIT" Then
            Dim ss = Session("hiddenID")
            Dim ii = MultiGrid.FindVisibleIndexByKeyValue(Session("hiddenID"))
            MultiGrid.StartEdit(ii)
        End If
    End Sub

    Protected Sub MultiGrid_StartRowEditing(sender As Object, e As DevExpress.Web.Data.ASPxStartRowEditingEventArgs)
        Session("hiddenID") = DirectCast(sender, ASPxGridView).GetRowValues(DirectCast(sender, ASPxGridView).EditingRowVisibleIndex, "Id").ToString()
        Dim ss = Session("hiddenID")
        CreateTemplate()
    End Sub

    Protected Sub NewReport_Onclick(ByVal sender As Object, ByVal e As System.EventArgs) Handles NewReport.Click
        Response.Redirect("NewReport.aspx")
    End Sub


    'Protected Sub MultiGrid_Load(ByVal sender As Object, ByVal e As EventArgs)
    '    If (Not IsPostBack) AndAlso (Not IsCallback) Then
    '        PopulateColumns()
    '        MultiGrid.DataBind()
    '    Else
    '        CreateTemplate()
    '    End If
    'End Sub

    'Public Sub PopulateColumns()
    '    Dim colID As New GridViewDataTextColumn()
    '    colID.FieldName = "ID"
    '    MultiGrid.Columns.Add(colID)

    '    Dim colItemTemplate As New GridViewDataTextColumn()
    '    colItemTemplate.DataItemTemplate = New MyHyperlinkTemplate() ' Create a template
    '    colItemTemplate.Name = "colItemTemplate"
    '    colItemTemplate.Caption = "Template Column"
    '    MultiGrid.Columns.Add(colItemTemplate)
    'End Sub

    Private Sub CreateTemplate()
        Dim colItemTemplate As New GridViewDataTextColumn()
        'colItemTemplate.DataItemTemplate = New MyHyperlinkTemplate() ' Create a template
        colItemTemplate.Name = "colItemTemplate"
        'colItemTemplate.Caption = "Template Column"
        colItemTemplate.Visible = False

        MultiGrid.Columns.Add(colItemTemplate)
        CType(MultiGrid.Columns("colItemTemplate"), GridViewDataColumn).EditItemTemplate = New MyHyperlinkTemplate()
        CType(MultiGrid.Columns("colItemTemplate"), GridViewDataColumn).EditFormSettings.Visible = DevExpress.Utils.DefaultBoolean.True
        CType(MultiGrid.Columns("colItemTemplate"), GridViewDataColumn).EditFormSettings.RowSpan = "9"
        CType(MultiGrid.Columns("colItemTemplate"), GridViewDataColumn).EditFormSettings.VisibleIndex = "3"
    End Sub
End Class


Friend Class MyHyperlinkTemplate
    Implements ITemplate
    Protected Sub InstantiateIn(ByVal container As UI.Control) Implements ITemplate.InstantiateIn
        'Dim link As New ASPxHyperLink()
        'Dim gridContainer As GridViewEditItemTemplateContainer = DirectCast(link.NamingContainer, GridViewEditItemTemplateContainer)
        'link.NavigateUrl = "vbnm,"
        'link.Text = "xcvbnm,"
        'container.Controls.Add(link)
        Dim SqlDs = New SqlDataSource()
        SqlDs.ID = "SqlDs"
        SqlDs.SelectCommand = "SELECT row_number() OVER (ORDER BY TrackingID) SequenceNo, TrackingID, CC_Planning_History.StatusID, CC_Status.Status, convert(varchar,CC_Planning_History.DateTimeStamp,110) DateTimeStamp FROM CC_Planning_History INNER JOIN CC_Status ON CC_Planning_History.StatusID = CC_Status.StatusId WHERE CC_Planning_History.TrackingID = " + System.Web.HttpContext.Current.Session("hiddenID") + " ORDER BY CC_Planning_History.StatusID"
        SqlDs.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("CCUpdate").ConnectionString
        Dim list As New ASPxListBox()
        Dim gridContainer As GridViewEditItemTemplateContainer = DirectCast(list.NamingContainer, GridViewEditItemTemplateContainer)
        list.Height = "220"
        list.CssClass = "PullListUp2"
        list.DataSource = SqlDs
        list.ValueField = "TrackingID"
        'list.ValueType = "System.Int32"
        list.ID = "MultiSourceList"

        Dim listbox1 As New ListBoxColumn()
        listbox1.FieldName = "SequenceNo"
        listbox1.Caption = " "
        listbox1.Width = "15"
        list.Columns.Add(listbox1)

        Dim listbox2 As New ListBoxColumn()
        listbox2.FieldName = "Status"
        listbox2.Caption = "Status"
        listbox2.Width = "180"
        list.Columns.Add(listbox2)

        Dim listbox3 As New ListBoxColumn()
        listbox3.FieldName = "DateTimeStamp"
        listbox3.Caption = "Date"
        listbox3.Width = "68"
        list.Columns.Add(listbox3)

        container.Controls.Add(list)
    End Sub
End Class
'Friend Class CreateStatusListTemplate
'    Implements ITemplate
'    Public Sub InstantiateIn(ByVal container As UI.Control) Implements ITemplate.InstantiateIn
'        Dim link As New ASPxButton()
'        'Dim gridContainer As GridViewDataItemTemplateContainer = DirectCast(container, GridViewDataItemTemplateContainer)
'        'link.NavigateUrl = String.Format("~/details.aspx?Device={0}", gridContainer.KeyValue)
'        link.Text = "Get details about device"
'        container.Controls.Add(link)
'    End Sub
'End Class
