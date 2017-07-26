Imports System.Data
Imports System.Data.SqlClient
Namespace CCTimeTrack
    Partial Class AuditTest
        Inherits System.Web.UI.Page
        Protected Sub ButSubmit_Click(sender As Object, e As System.EventArgs) Handles ButSubmit.Click

            If chktests.SelectedValue = "" Then
                Lblstatus.Visible = True
                Lblstatus.Text = "Please select at least one item"
            Else


                Dim Con As New SqlConnection(ConfigurationManager.ConnectionStrings("CCUpdate").ConnectionString.ToString)
                Dim com As SqlCommand
                Con.Open()
                com = New SqlCommand("Delete from CC_Supplier_Audit_Tests where supplier ='" + CmbSupplier.Text.ToString + "'", Con)
                com.ExecuteNonQuery()
                For Each item As ListItem In chktests.Items
                    If item.Selected Then
                        com = New SqlCommand("INSERT INTO CC_Supplier_Audit_Tests (Supplier,TestId) VALUES ('" + CmbSupplier.Text.ToString + "','" + item.Value + "')", Con)
                        com.ExecuteNonQuery()
                    End If
                Next
                Con.Close()
                Lblstatus.Visible = True
                Lblstatus.Text = "Updated Succesfully"
            End If
        End Sub

        Protected Sub SqlDataSource2_Load(sender As Object, e As System.EventArgs) Handles SqlDataSource2.Load
            SqlDataSource2.SelectParameters("userid").DefaultValue = HttpContext.Current.User.Identity.Name.ToString()
        End Sub

        Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load



        End Sub

        Sub BindData(ByVal sortExpr As String)

            Dim sqlcon As SqlConnection

            Dim cmd As SqlCommand

            Dim dt As DataTable

            Dim dr As DataRow

            Dim DBConnectionString As String

            Try

                DBConnectionString = "server=Riker;database=Revenew;trusted_connection=yes"

                sqlcon = New SqlConnection(DBConnectionString)

                cmd = New SqlCommand("Select testid from CC_Supplier_Audit_Tests where supplier = '" + CmbSupplier.Text.ToString + "'", sqlcon)

                'cmd.CommandType = CommandType.StoredProcedure

                ' cmd.Parameters.Add(New SqlParameter("@OrderByClause", SqlDbType.VarChar)).Value = sortExpr

                sqlcon.Open()

                'Set the datagrid's datasource to the dataset and databind

                Dim daSps As New SqlDataAdapter(cmd)

                Dim DSSps As New DataSet

                daSps.Fill(DSSps)

                sqlcon.Close()

                dt = DSSps.Tables(0)

                For Each dr In dt.Rows

                    'chktests.Items.
                    ''MessageBox.Show(dr("chkSelection")) ' This returns "True" so procedure is working and dataset is filled

                Next

                'DatagridSy.DataSource = DSSps

                'DatagridSy.DataBind()

            Catch ex As Exception

                ' lblMessage.Text = "Error: " & ex.Message.ToString

            End Try

        End Sub
    End Class
End Namespace