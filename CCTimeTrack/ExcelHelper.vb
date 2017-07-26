Imports System.IO

Public Class ExcelHelper
    'Row limits older excel verion per sheet, the row limit for excel 2003 is 65536
    Const rowLimit As Integer = 65000

    Private Shared Function getWorkbookTemplate() As String
        Dim sb = New StringBuilder(818)
        sb.AppendFormat("<?xml version=""1.0""?>{0}", Environment.NewLine)
        sb.AppendFormat("<?mso-application progid=""Excel.Sheet""?>{0}", Environment.NewLine)
        sb.AppendFormat("<Workbook xmlns=""urn:schemas-microsoft-com:office:spreadsheet""{0}", Environment.NewLine)
        sb.AppendFormat(" xmlns:o=""urn:schemas-microsoft-com:office:office""{0}", Environment.NewLine)
        sb.AppendFormat(" xmlns:x=""urn:schemas-microsoft-com:office:excel""{0}", Environment.NewLine)
        sb.AppendFormat(" xmlns:ss=""urn:schemas-microsoft-com:office:spreadsheet""{0}", Environment.NewLine)
        sb.AppendFormat(" xmlns:html=""http://www.w3.org/TR/REC-html40"">{0}", Environment.NewLine)
        sb.AppendFormat(" <Styles>{0}", Environment.NewLine)
        sb.AppendFormat("  <Style ss:ID=""Default"" ss:Name=""Normal"">{0}", Environment.NewLine)
        sb.AppendFormat("   <Alignment ss:Horizontal=""Center""/>{0}", Environment.NewLine)
        sb.AppendFormat("   <Borders/>{0}", Environment.NewLine)
        sb.AppendFormat("   <Font ss:FontName=""Calibri"" x:Family=""Swiss"" ss:Size=""11"" ss:Color=""#000000""/>{0}", Environment.NewLine)
        sb.AppendFormat("   <Interior/>{0}", Environment.NewLine)
        sb.AppendFormat("   <NumberFormat/>{0}", Environment.NewLine)
        sb.AppendFormat("   <Protection/>{0}", Environment.NewLine)
        sb.AppendFormat("  </Style>{0}", Environment.NewLine)
        sb.AppendFormat("  <Style ss:ID=""s62"">{0}", Environment.NewLine)
        sb.AppendFormat("   <Alignment ss:Horizontal=""Center""/>{0}", Environment.NewLine)
        sb.AppendFormat("   <Font ss:FontName=""Calibri"" x:Family=""Swiss"" ss:Size=""11"" ss:Color=""#000000""{0}", Environment.NewLine)
        sb.AppendFormat("    ss:Bold=""1""/>{0}", Environment.NewLine)
        sb.AppendFormat("  </Style>{0}", Environment.NewLine)
        sb.AppendFormat("  <Style ss:ID=""s63"">{0}", Environment.NewLine)
        sb.AppendFormat("   <Alignment ss:Horizontal=""Center""/>{0}", Environment.NewLine)
        sb.AppendFormat("   <NumberFormat ss:Format=""Short Date""/>{0}", Environment.NewLine)
        sb.AppendFormat("  </Style>{0}", Environment.NewLine)
        sb.AppendFormat(" </Styles>{0}", Environment.NewLine)
        sb.Append("{0}\r\n</Workbook>")
        Return sb.ToString()
    End Function

    Private Shared Function replaceXmlChar(input As String) As String
        input = input.Replace("&", "&amp")
        input = input.Replace("<", "&lt;")
        input = input.Replace(">", "&gt;")
        input = input.Replace("""", "&quot;")
        input = input.Replace("'", "&apos;")
        Return input
    End Function

    Private Shared Function getCell(type As Type, cellData As Object) As String
        Dim data = If((TypeOf cellData Is DBNull), "", cellData)
        If type.Name.Contains("Int") OrElse type.Name.Contains("Double") OrElse type.Name.Contains("Decimal") Then
            Return String.Format("<Cell><Data ss:Type=""Number"">{0}</Data></Cell>", data)
        End If
        If type.Name.Contains("Date") AndAlso data.ToString() <> String.Empty Then
            Return String.Format("<Cell ss:StyleID=""s63""><Data ss:Type=""DateTime"">{0}</Data></Cell>", Convert.ToDateTime(data).ToString("yyyy-MM-dd"))
        End If
        Return String.Format("<Cell><Data ss:Type=""String"">{0}</Data></Cell>", replaceXmlChar(data.ToString()))
    End Function
    Private Shared Function getWorksheets(source As DataSet) As String
        Dim sw = New StringWriter()
        If source Is Nothing OrElse source.Tables.Count = 0 Then
            sw.Write("<Worksheet ss:Name=""Sheet1"">" & vbCr & vbLf & "<Table>" & vbCr & vbLf & "<Row><Cell><Data ss:Type=""String""></Data></Cell></Row>" & vbCr & vbLf & "</Table>" & vbCr & vbLf & "</Worksheet>")
            Return sw.ToString()
        End If
        For Each dt As DataTable In source.Tables
            If dt.Rows.Count = 0 Then
                sw.Write((Convert.ToString("<Worksheet ss:Name=""") & replaceXmlChar(dt.TableName)) + """>" & vbCr & vbLf & "<Table>" & vbCr & vbLf & "<Row><Cell  ss:StyleID=""s62""><Data ss:Type=""String""></Data></Cell></Row>" & vbCr & vbLf & "</Table>" & vbCr & vbLf & "</Worksheet>")
            Else
                'write each row data                
                Dim sheetCount = 0
                For i As Integer = 0 To dt.Rows.Count - 1
                    If (i Mod rowLimit) = 0 Then
                        'add close tags for previous sheet of the same data table
                        If (i \ rowLimit) > sheetCount Then
                            sw.Write(vbCr & vbLf & "</Table>" & vbCr & vbLf & "</Worksheet>")
                            sheetCount = (i \ rowLimit)
                        End If
                        sw.Write((Convert.ToString(vbCr & vbLf & "<Worksheet ss:Name=""") & replaceXmlChar(dt.TableName)) + (If(((i \ rowLimit) = 0), "", Convert.ToString(i \ rowLimit))) + """>" & vbCr & vbLf & "<Table ss:DefaultColumnWidth=""150"">")
                        'write column name row
                        sw.Write(vbCr & vbLf & "<Row>")
                        For Each dc As DataColumn In dt.Columns
                            sw.Write(String.Format("<Cell ss:StyleID=""s62""><Data ss:Type=""String"">{0}</Data></Cell>", replaceXmlChar(dc.ColumnName)))
                        Next
                        sw.Write("</Row>")
                    End If
                    sw.Write(vbCr & vbLf & "<Row>")
                    For Each dc As DataColumn In dt.Columns
                        sw.Write(getCell(dc.DataType, dt.Rows(i)(dc.ColumnName)))
                    Next
                    sw.Write("</Row>")
                Next
                sw.Write(vbCr & vbLf & "</Table>" & vbCr & vbLf & "</Worksheet>")
            End If
        Next

        Return sw.ToString()
    End Function
    Public Shared Function GetExcelXml(dtInput As DataTable, filename As String) As String
        Dim excelTemplate = getWorkbookTemplate()
        Dim ds = New DataSet()
        ds.Tables.Add(dtInput.Copy())
        Dim worksheets = getWorksheets(ds)
        Dim excelXml = String.Format(excelTemplate, worksheets)
        Return excelXml
    End Function

    Public Shared Function GetExcelXml(dsInput As DataSet, filename As String) As String
        Dim excelTemplate = getWorkbookTemplate()
        Dim worksheets = getWorksheets(dsInput)
        Dim excelXml = String.Format(excelTemplate, worksheets)
        Return excelXml
    End Function

    Public Shared Sub ToExcel(dsInput As DataSet, filename As String, response As HttpResponse)
        Dim excelXml = GetExcelXml(dsInput, filename)
        response.Clear()
        response.AppendHeader("Content-Type", "application/vnd.ms-excel")
        response.AppendHeader("Content-disposition", Convert.ToString("attachment; filename=") & filename)
        response.Write(excelXml)
        response.Flush()
        response.[End]()
    End Sub

    Public Shared Sub ToExcel(dtInput As DataTable, filename As String, response As HttpResponse)
        Dim ds = New DataSet()
        ds.Tables.Add(dtInput.Copy())
        ToExcel(ds, filename, response)
    End Sub
End Class
