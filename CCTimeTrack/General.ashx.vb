Imports System.Web
Imports System.Web.Services
Imports Newtonsoft.Json
Imports System.Data
Imports System.Data.SqlClient

Public Class General
    Implements System.Web.IHttpHandler

    Sub ProcessRequest(ByVal context As HttpContext) Implements IHttpHandler.ProcessRequest
        Try
            context.Response.ContentType = "text/json"
            Select Case context.Request.QueryString("q")
                Case "calcinvoiceamt"
                    getInvoiceAmount(context)
                Case "checktravelamt"
                    CheckTravelAmt(context)
            End Select
        Catch ex As Exception

        End Try
    End Sub

    Sub getInvoiceAmount(ByVal context As HttpContext)
        Try
            Dim isGrater = 0
            Dim clientid = context.Request.QueryString("cid")
            Dim billtypeid = context.Request.QueryString("btypeid")
            Dim SettlementAmount = context.Request.QueryString("samt")
            Dim InvoiceAmt As Decimal = 0
            Dim Con As New SqlConnection(ConfigurationManager.ConnectionStrings("CCUpdate").ConnectionString.ToString)
            Dim com As SqlCommand
            Con.Open()
            com = New SqlCommand()
            com.CommandText = "WebgetInvoiceAmt_sp"
            com.Connection = Con
            com.CommandType = CommandType.StoredProcedure
            com.Parameters.Add(New SqlParameter("ClientID", clientid))
            com.Parameters.Add(New SqlParameter("BillingType", billtypeid))
            com.Parameters.Add(New SqlParameter("SettlementAmount", SettlementAmount))
            Dim rdr As SqlDataReader = com.ExecuteReader()
            While rdr.Read()
                If Not IsDBNull(rdr.GetValue(0)) Then
                    InvoiceAmt = rdr.GetValue(0)
                End If
                If Not IsDBNull(rdr.GetValue(1)) Then
                    If Convert.ToDecimal(rdr.GetValue(1)) > 0 Then
                        If InvoiceAmt > Convert.ToDecimal(rdr.GetValue(1)) Then
                            isGrater = 1
                        End If
                    End If
                End If
            End While
            context.Response.Write(JsonConvert.SerializeObject(String.Format("{0}|{1}", InvoiceAmt, isGrater)))
        Catch ex As Exception

        End Try
    End Sub

    Sub CheckTravelAmt(ByVal context As HttpContext)
        Try
            Dim TravelCap As Decimal = 0
            Dim clientid = context.Request.QueryString("cid")
            Dim billtypeid = context.Request.QueryString("btypeid")
            Dim travelAmount = Convert.ToDouble(IIf(context.Request.QueryString("tamt") = "", 0, context.Request.QueryString("tamt")))
            Dim Con As New SqlConnection(ConfigurationManager.ConnectionStrings("CCUpdate").ConnectionString.ToString)
            Dim com As SqlCommand
            Con.Open()
            com = New SqlCommand(String.Format("SELECT top 1 Travelcap FROM  InvoiceBillingRate WHERE (ClientID = {0}) AND (BillingType = '{{{1}}}')", clientid, billtypeid), Con)
            Dim rdr As SqlDataReader = com.ExecuteReader()
            While rdr.Read()
                TravelCap = IIf(IsDBNull(rdr.GetValue(0)), 0, rdr.GetValue(0))
            End While
            If TravelCap > 0 Then
                If travelAmount > TravelCap Then
                    context.Response.Write(JsonConvert.SerializeObject(1))
                    Return
                End If
            End If
            context.Response.Write(JsonConvert.SerializeObject(0))
        Catch ex As Exception

        End Try
    End Sub

    ReadOnly Property IsReusable() As Boolean Implements IHttpHandler.IsReusable
        Get
            Return False
        End Get
    End Property

End Class