Imports GemBox.Spreadsheet
Imports System.Data.SqlClient
Imports System.Data
Public Class auditormatrix
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            SpreadsheetInfo.SetLicense("E65I-Y08C-L0TB-S13N")
            Dim workbook As New ExcelFile()
            Dim CurrentYear = 0
            Dim conn1 As New SqlConnection(ConfigurationManager.ConnectionStrings("CCUpdate").ConnectionString)
            Dim cmd1 As New SqlCommand()
            cmd1.CommandText = "GetYears"
            cmd1.CommandType = CommandType.StoredProcedure
            cmd1.Connection = conn1
            conn1.Open()
            Dim reader = cmd1.ExecuteReader()
            If reader.HasRows Then
                While reader.Read()
                    CurrentYear = reader.GetValue(0)
                    Dim worksheetTask = workbook.Worksheets.Add(CurrentYear.ToString())
                    Dim conn As New SqlConnection(ConfigurationManager.ConnectionStrings("CCUpdate").ConnectionString)
                    Dim cmd As New SqlCommand()
                    cmd.CommandText = "GetAuditorMatrix"
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.Add(New SqlParameter("@Year", CurrentYear))
                    cmd.Connection = conn
                    conn.Open()
                    Dim Adapter = New SqlDataAdapter(cmd)
                    Dim dt = New DataSet()
                    Adapter.Fill(dt)
                    Dim data = dt.Tables(0)
                    Adapter.Dispose()
                    dt.Dispose()
                    conn.Close()
                    'worksheetTask.InsertDataTable(dt.Tables(0), "A1", True)
                    Dim Headerstyle = New CellStyle()
                    Headerstyle.FillPattern.SetSolid(Drawing.ColorTranslator.FromHtml("#BFBFBF"))
                    Headerstyle.HorizontalAlignment = HorizontalAlignmentStyle.Center
                    Headerstyle.VerticalAlignment = VerticalAlignmentStyle.Center
                    Headerstyle.WrapText = True
                    Headerstyle.Font.Weight = ExcelFont.BoldWeight
                    Headerstyle.Borders.SetBorders(MultipleBorders.Outside, System.Drawing.Color.Black, LineStyle.Thin)
                    For index = 0 To data.Columns.Count() - 3
                        worksheetTask.Columns(index).Cells(0).Value = data.Columns(index + 2).Caption
                        worksheetTask.Columns(index).Cells(0).Style = Headerstyle
                        worksheetTask.Columns(index).Style.HorizontalAlignment = HorizontalAlignmentStyle.Center
                        If index > 2 Then worksheetTask.Columns(index).Width = 23 * 256
                    Next
                    worksheetTask.Columns(0).Width = 17 * 256
                    worksheetTask.Columns(0).Cells(0).Value = ""
                    worksheetTask.Columns(1).Width = 11 * 256
                    worksheetTask.Columns(1).Cells(0).Value = "# of audit kicked off by CC"
                    worksheetTask.Columns(2).Width = 7 * 256
                    worksheetTask.Columns(2).Cells(0).Value = "Goal"
                    Dim FirstGroup As String = ""
                    Dim SecondGroup As String = ""
                    Dim RowIndex = 0
                    Dim StartRow = 2
                    Dim SecondStartRow = 2
                    Dim subKickCount = 0
                    Dim sumCellReferneceKick = ""
                    Dim sumCellReferneceGoal = ""
                    Dim GrandTotalRefKick = ""
                    Dim GrandTotalRefGoal = ""
                    Dim lastCol = data.Columns.Count() - 2
                    For i = 0 To data.Rows.Count() - 1
                        RowIndex = RowIndex + 1
                        If StartRow = 0 Then StartRow = RowIndex
                        If SecondStartRow = 0 Then SecondStartRow = RowIndex
                        If FirstGroup = "" Then FirstGroup = data.Rows(i).Item("Mth").ToString()
                        If SecondGroup = "" Then SecondGroup = data.Rows(i).Item("Qtr").ToString()
                        If FirstGroup <> data.Rows(i).Item("Mth").ToString() Then
                            worksheetTask.Rows(RowIndex - 1).OutlineLevel = 1
                            sumCellReferneceKick += ExcelColumnCollection.ColumnIndexToName(1) + (RowIndex + 1).ToString() + "+"
                            sumCellReferneceGoal += ExcelColumnCollection.ColumnIndexToName(2) + (RowIndex + 1).ToString() + "+"
                            CellBackGroundColoring(lastCol - 1, RowIndex, "#BFBFBF", worksheetTask)
                            worksheetTask.Columns(0).Cells(RowIndex).Value = FirstGroup + " Totals"
                            worksheetTask.Columns(1).Cells(RowIndex).Value = subKickCount
                            worksheetTask.Columns(2).Cells(RowIndex).Value = 25
                            For index = 3 To data.Columns.Count() - 3
                                worksheetTask.Columns(index).Cells(RowIndex).Formula = "=COUNTIF(" + ExcelColumnCollection.ColumnIndexToName(index) + StartRow.ToString() + ":" + ExcelColumnCollection.ColumnIndexToName(index) + RowIndex.ToString() + ",""*"")"
                            Next
                            subKickCount = 0
                            RowIndex = RowIndex + 1
                            FirstGroup = data.Rows(i).Item("Mth").ToString()
                            StartRow = 0
                        End If
                        If SecondGroup <> data.Rows(i).Item("Qtr").ToString() Then
                            'worksheetTask.Rows(RowIndex).OutlineLevel = 1
                            GrandTotalRefKick += ExcelColumnCollection.ColumnIndexToName(1) + (RowIndex + 1).ToString() + "+"
                            GrandTotalRefGoal += ExcelColumnCollection.ColumnIndexToName(2) + (RowIndex + 1).ToString() + "+"
                            worksheetTask.Columns(0).Cells(RowIndex).Value = SecondGroup + " Totals"
                            worksheetTask.Columns(1).Cells(RowIndex).Formula = "=sum(" + sumCellReferneceKick.Remove(sumCellReferneceKick.Length - 1, 1) + ")"
                            worksheetTask.Columns(2).Cells(RowIndex).Formula = "=sum(" + sumCellReferneceGoal.Remove(sumCellReferneceGoal.Length - 1, 1) + ")"
                            sumCellReferneceKick = ""
                            sumCellReferneceGoal = ""
                            CellBackGroundColoring(lastCol - 1, RowIndex, "#00CCFF", worksheetTask)
                            For index = 3 To data.Columns.Count() - 3
                                worksheetTask.Columns(index).Cells(RowIndex).Formula = "=COUNTIF(" + ExcelColumnCollection.ColumnIndexToName(index) + SecondStartRow.ToString() + ":" + ExcelColumnCollection.ColumnIndexToName(index) + RowIndex.ToString() + ",""*"")"
                            Next
                            worksheetTask.Rows(RowIndex).Style.Font.Weight = ExcelFont.BoldWeight
                            RowIndex = RowIndex + 1
                            SecondGroup = data.Rows(i).Item("Qtr").ToString()
                            SecondStartRow = 0
                            StartRow = 0
                        End If
                        subKickCount += data.Rows(i).Item("KickedCount")
                        For j = 0 To data.Columns.Count() - 3
                            worksheetTask.Rows(RowIndex).OutlineLevel = 1
                            If j > 2 And i >= 0 Then
                                If data.Rows(i).Item(j + 2).ToString().Trim().Length > 0 Then
                                    Dim strMainText = data.Rows(i).Item(j + 2).ToString().Substring(0, data.Rows(i).Item(j + 2).ToString().IndexOf("#"))
                                    Dim strBkColorText = data.Rows(i).Item(j + 2).ToString().Substring(data.Rows(i).Item(j + 2).ToString().IndexOf("#") + 1, data.Rows(i).Item(j + 2).ToString().LastIndexOf("#") - strMainText.Length - 1)
                                    worksheetTask.Columns(j).Cells(RowIndex).Value = strMainText
                                    worksheetTask.Columns(j).Cells(RowIndex).Style = CellColorPattern(strBkColorText)
                                Else
                                    worksheetTask.Columns(j).Cells(RowIndex).Value = Nothing
                                End If
                            Else
                                If j = 0 Then 'Date format
                                    worksheetTask.Columns(j).Cells(RowIndex).Value = Convert.ToDateTime(data.Rows(i).Item(j + 2))
                                    worksheetTask.Columns(j).Cells(RowIndex).Style.NumberFormat = "[$-409]d\-mmm;@"
                                Else
                                    worksheetTask.Columns(j).Cells(RowIndex).Value = Convert.ToDouble(data.Rows(i).Item(j + 2).ToString())
                                End If
                            End If
                        Next j
                    Next i
                    If StartRow = 0 Then StartRow = RowIndex + 1
                    If SecondStartRow = 0 Then SecondStartRow = RowIndex
                    sumCellReferneceKick += ExcelColumnCollection.ColumnIndexToName(1) + (RowIndex + 2).ToString() + "+"
                    sumCellReferneceGoal += ExcelColumnCollection.ColumnIndexToName(2) + (RowIndex + 2).ToString() + "+"
                    worksheetTask.Columns(0).Cells(RowIndex + 1).Value = FirstGroup + " Totals"
                    worksheetTask.Columns(1).Cells(RowIndex + 1).Value = subKickCount
                    worksheetTask.Columns(2).Cells(RowIndex + 1).Value = 25
                    For index = 3 To data.Columns.Count() - 3
                        worksheetTask.Columns(index).Cells(RowIndex + 1).Formula = "=COUNTIF(" + ExcelColumnCollection.ColumnIndexToName(index) + StartRow.ToString() + ":" + ExcelColumnCollection.ColumnIndexToName(index) + (RowIndex + 1).ToString() + ",""*"")"
                    Next
                    subKickCount = 0
                    CellBackGroundColoring(lastCol - 1, RowIndex + 1, "#BFBFBF", worksheetTask)
                    RowIndex = RowIndex + 1
                    worksheetTask.Columns(0).Cells(RowIndex + 1).Value = SecondGroup + " Totals"
                    GrandTotalRefKick += ExcelColumnCollection.ColumnIndexToName(1) + (RowIndex + 2).ToString() + "+"
                    GrandTotalRefGoal += ExcelColumnCollection.ColumnIndexToName(2) + (RowIndex + 2).ToString() + "+"
                    worksheetTask.Columns(1).Cells(RowIndex + 1).Formula = "=sum(" + sumCellReferneceKick.Remove(sumCellReferneceKick.Length - 1, 1) + ")"
                    worksheetTask.Columns(2).Cells(RowIndex + 1).Formula = "=sum(" + sumCellReferneceGoal.Remove(sumCellReferneceGoal.Length - 1, 1) + ")"
                    CellBackGroundColoring(lastCol - 1, RowIndex + 1, "#00CCFF", worksheetTask)
                    For index = 3 To data.Columns.Count() - 3
                        worksheetTask.Columns(index).Cells(RowIndex + 1).Formula = "=COUNTIF(" + ExcelColumnCollection.ColumnIndexToName(index) + SecondStartRow.ToString() + ":" + ExcelColumnCollection.ColumnIndexToName(index) + (RowIndex + 1).ToString() + ",""*"")"
                    Next
                    worksheetTask.Rows(RowIndex + 1).Style.Font.Weight = ExcelFont.BoldWeight
                    RowIndex = RowIndex + 1
                    worksheetTask.Columns(0).Cells(RowIndex + 1).Value = "Totals - ACTUAL"
                    worksheetTask.Columns(1).Cells(RowIndex + 1).Formula = "=sum(" + GrandTotalRefKick.Remove(GrandTotalRefKick.Length - 1, 1) + ")"
                    worksheetTask.Columns(2).Cells(RowIndex + 1).Formula = "=sum(" + GrandTotalRefGoal.Remove(GrandTotalRefGoal.Length - 1, 1) + ")"
                    CellBackGroundColoring(lastCol - 1, RowIndex + 1, "#00CCFF", worksheetTask)
                    For index = 3 To data.Columns.Count() - 3
                        worksheetTask.Columns(index).Cells(RowIndex + 1).Formula = "=COUNTIF(" + ExcelColumnCollection.ColumnIndexToName(index) + "2:" + ExcelColumnCollection.ColumnIndexToName(index) + (RowIndex + 1).ToString() + ",""*"")"
                    Next
                    worksheetTask.Rows(RowIndex + 1).Style.Font.Weight = ExcelFont.BoldWeight
                    worksheetTask.ViewOptions.Zoom = 80
                    RowIndex += 2
                    worksheetTask.Columns(1).Cells(RowIndex + 1).Value = "Audit Kicked-Off"
                    worksheetTask.Columns(0).Cells(RowIndex + 1).Style.FillPattern.SetSolid(Drawing.ColorTranslator.FromHtml("#FFFF00"))
                    worksheetTask.Columns(0).Cells(RowIndex + 1).Style.Borders.SetBorders(MultipleBorders.Outside, Drawing.Color.Navy, LineStyle.Thin)
                    worksheetTask.Columns(1).Cells(RowIndex + 1).Style.HorizontalAlignment = HorizontalAlignmentStyle.Left
                    RowIndex += 1
                    worksheetTask.Columns(1).Cells(RowIndex + 1).Value = "Onsite Confirmed"
                    worksheetTask.Columns(0).Cells(RowIndex + 1).Style.FillPattern.SetSolid(Drawing.ColorTranslator.FromHtml("#00B050"))
                    worksheetTask.Columns(0).Cells(RowIndex + 1).Style.Borders.SetBorders(MultipleBorders.Outside, Drawing.Color.Navy, LineStyle.Thin)
                    worksheetTask.Columns(1).Cells(RowIndex + 1).Style.HorizontalAlignment = HorizontalAlignmentStyle.Left
                    RowIndex += 1
                    worksheetTask.Columns(1).Cells(RowIndex + 1).Value = "Billing Data Received/Soft Confirmation"
                    worksheetTask.Columns(0).Cells(RowIndex + 1).Style.FillPattern.SetSolid(Drawing.ColorTranslator.FromHtml("#99FF66"))
                    worksheetTask.Columns(0).Cells(RowIndex + 1).Style.Borders.SetBorders(MultipleBorders.Outside, Drawing.Color.Navy, LineStyle.Thin)
                    worksheetTask.Columns(1).Cells(RowIndex + 1).Style.HorizontalAlignment = HorizontalAlignmentStyle.Left
                    RowIndex += 1
                    worksheetTask.Columns(1).Cells(RowIndex + 1).Value = "Notification Letter Sent to Supplier/Onsite Not Yet Confirmed"
                    worksheetTask.Columns(0).Cells(RowIndex + 1).Style.FillPattern.SetSolid(Drawing.ColorTranslator.FromHtml("#F4B084"))
                    worksheetTask.Columns(0).Cells(RowIndex + 1).Style.Borders.SetBorders(MultipleBorders.Outside, Drawing.Color.Navy, LineStyle.Thin)
                    worksheetTask.Columns(1).Cells(RowIndex + 1).Style.HorizontalAlignment = HorizontalAlignmentStyle.Left
                    RowIndex += 1
                    worksheetTask.Columns(1).Cells(RowIndex + 1).Value = "Need Client Assistance/On Hold"
                    worksheetTask.Columns(0).Cells(RowIndex + 1).Style.FillPattern.SetSolid(Drawing.ColorTranslator.FromHtml("#FFC000"))
                    worksheetTask.Columns(0).Cells(RowIndex + 1).Style.Borders.SetBorders(MultipleBorders.Outside, Drawing.Color.Navy, LineStyle.Thin)
                    worksheetTask.Columns(1).Cells(RowIndex + 1).Style.HorizontalAlignment = HorizontalAlignmentStyle.Left

                    RowIndex += 2
                    worksheetTask.Columns(0).Cells(RowIndex + 1).Value = "*  Auditor can perform work in Canada"
                    worksheetTask.Columns(0).Cells(RowIndex + 1).Style.HorizontalAlignment = HorizontalAlignmentStyle.Left
                    Dim lastRow = RowIndex + 1
                    worksheetTask.Cells.GetSubrange("A1", ExcelColumnCollection.ColumnIndexToName(lastCol - 1) + (lastRow - 1).ToString()).SetBorders(MultipleBorders.Outside, Drawing.Color.Navy, LineStyle.Thin)
                    worksheetTask.NamedRanges.SetPrintArea(worksheetTask.Cells.GetSubrange("A1", ExcelColumnCollection.ColumnIndexToName(lastCol - 1) + (lastRow - 1).ToString()))
                    worksheetTask.Panes = New WorksheetPanes(PanesState.Frozen, 0, 1, "A2", PanePosition.BottomLeft)
                    worksheetTask.HorizontalPageBreaks.Clear()
                    worksheetTask.VerticalPageBreaks.Clear()
                    worksheetTask.HorizontalPageBreaks.Add(lastRow)
                    worksheetTask.VerticalPageBreaks.Add(lastCol)
                    worksheetTask.ViewOptions.ViewType = ViewType.PageBreakPreview
                End While
            End If
            conn1.Close()
            cmd1.Dispose()
            Dim path = "~/tmp/AuditMatrix_" + DateTime.Now.ToString("ddyyyyhhMMss") + ".xls"
            Dim outFileName = Server.MapPath(path)
            workbook.Save(outFileName)
            Response.Redirect(path, True)
        Catch ex As Exception

        End Try
    End Sub

    Function CellColorPattern(ByVal val As String) As CellStyle
        Dim sty As New CellStyle()
        Select Case val
            Case "Audit Kicked-Off"
                sty.FillPattern.SetSolid(Drawing.ColorTranslator.FromHtml("#FFFF00"))
            Case "Onsite Confirmed"
                sty.FillPattern.SetSolid(Drawing.ColorTranslator.FromHtml("#00B050"))
            Case "Billing Data Received/Soft Confirmation"
                sty.FillPattern.SetSolid(Drawing.ColorTranslator.FromHtml("#99FF66"))
            Case "Notification Letter Sent to Supplier/Onsite Not Yet Confirmed"
                sty.FillPattern.SetSolid(Drawing.ColorTranslator.FromHtml("#F4B084"))
            Case "Need Client Assistance/On Hold"
                sty.FillPattern.SetSolid(Drawing.ColorTranslator.FromHtml("#FFC000"))
        End Select
        sty.WrapText = False
        sty.HorizontalAlignment = HorizontalAlignmentStyle.Center
        sty.VerticalAlignment = VerticalAlignmentStyle.Center
        Return sty
    End Function

    Public Sub CellBackGroundColoring(ByVal cols As Integer, ByVal row As Integer, ByVal clr As String, ByRef worksheetTask As ExcelWorksheet)
        For col = 0 To cols
            worksheetTask.Columns(col).Cells(row).Style.FillPattern.SetSolid(Drawing.ColorTranslator.FromHtml(clr))
        Next

    End Sub

End Class