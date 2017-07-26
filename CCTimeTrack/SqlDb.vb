Imports System.Data.SqlClient
Public Class SqlDb
    Public Function GetDataSet(ByRef sqlCommnd As String, ParamArray sqlParameter() As SqlParameter) As DataSet
        Try
            Dim connString As String = Web.Configuration.WebConfigurationManager.ConnectionStrings("CCupdate").ToString()
            Dim sqlConn As SqlConnection = New SqlConnection(connString)
            Dim sqlCmd As SqlCommand = sqlConn.CreateCommand()
            sqlCmd.CommandType = CommandType.StoredProcedure
            sqlCmd.CommandText = sqlCommnd
            For Each Parameter As SqlParameter In sqlParameter
                sqlCmd.Parameters.Add(Parameter)
            Next
            sqlConn.Open()
            Dim sqlDa As New SqlDataAdapter(sqlCmd)
            Dim sqlDt As New DataSet()
            sqlDa.Fill(sqlDt)
            sqlConn.Close()
            Return sqlDt
        Catch ex As Exception
            Return Nothing
        End Try
    End Function
End Class
