Imports System.Data
Imports System.Data.SqlClient
Public Class Invoicing
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            If Not IsPostBack Then
                Dim ddblClient As DropDownList = CType(grdInsertInvoice.FindControl("ddlClient"), DropDownList)
                SqlSupplier.SelectParameters("ClientID").DefaultValue = ddblClient.SelectedValue
                Dim ddlSupplier As DropDownList = CType(grdInsertInvoice.FindControl("ddlSupplier"), DropDownList)
                ddlSupplier.DataBind()
                SqlAuditor.SelectParameters("SupplierID").DefaultValue = ddlSupplier.SelectedValue
                SqlAuditor.SelectParameters("ClientID").DefaultValue = ddblClient.SelectedValue
            End If
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub ddlClient_SelectedIndexChanged(sender As Object, e As EventArgs)
        Try
            SqlSupplier.SelectParameters("ClientID").DefaultValue = CType(sender, DropDownList).SelectedValue
            Dim ddlSupplier As DropDownList = CType(grdInsertInvoice.FindControl("ddlSupplier"), DropDownList)
            ddlSupplier.DataBind()
            SqlAuditor.SelectParameters("SupplierID").DefaultValue = ddlSupplier.SelectedValue
            SqlAuditor.SelectParameters("ClientID").DefaultValue = CType(sender, DropDownList).SelectedValue
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub grdInsertInvoice_ItemInserting(sender As Object, e As DetailsViewInsertEventArgs) Handles grdInsertInvoice.ItemInserting
        Try
            Dim TravelCap As Decimal = 0
            Dim ClientID = CType(grdInsertInvoice.FindControl("ddlClient"), DropDownList).SelectedValue
            Dim BillType = CType(grdInsertInvoice.FindControl("ddlBillType1"), DropDownList).SelectedValue
            Dim TravelAmt = CType(grdInsertInvoice.FindControl("txtTravelAmt"), TextBox)
            Dim Con As New SqlConnection(ConfigurationManager.ConnectionStrings("CCUpdate").ConnectionString.ToString)
            Dim com As SqlCommand
            Con.Open()
            com = New SqlCommand(String.Format("SELECT Travelcap FROM  InvoiceBillingRate WHERE (ClientID = {0}) AND (BillingType = '{{{1}}}')", ClientID, BillType), Con)
            Dim rdr As SqlDataReader = com.ExecuteReader()
            While rdr.Read()
                TravelCap = IIf(IsDBNull(rdr.GetValue(0)), 0, rdr.GetValue(0))
            End While
            Dim dclTravelAmt As Decimal = IIf(TravelAmt.Text = "", 0, TravelAmt.Text)
            If TravelCap > 0 Then
                If dclTravelAmt > TravelCap Then
                    lblStatus.Text = "Travel amount exceeding travel cap."
                    TravelAmt.BorderColor = Drawing.Color.Red
                    e.Cancel = True
                    Return
                End If
            End If
            e.Values("SupplierID") = CType(grdInsertInvoice.FindControl("ddlSupplier"), DropDownList).SelectedValue
            e.Values("Auditor") = CType(grdInsertInvoice.FindControl("ddlAuditor"), DropDownList).SelectedValue
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub ddlSupplier_SelectedIndexChanged(sender As Object, e As EventArgs)
        Try
            SqlAuditor.SelectParameters("SupplierID").DefaultValue = CType(grdInsertInvoice.FindControl("ddlSupplier"), DropDownList).SelectedValue
            SqlAuditor.SelectParameters("ClientID").DefaultValue = CType(grdInsertInvoice.FindControl("ddlClient"), DropDownList).SelectedValue
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub ddlEditClient_SelectedIndexChanged(sender As Object, e As EventArgs)
        Try
            SqlSupplier.SelectParameters("ClientID").DefaultValue = CType(sender, DropDownList).SelectedValue
            Dim ddlSupplier As DropDownList = CType(grdEditInvoice.Rows(grdEditInvoice.EditIndex).FindControl("ddlEditSupplier"), DropDownList)
            ddlSupplier.DataBind()
            SqlAuditor.SelectParameters("SupplierID").DefaultValue = ddlSupplier.SelectedValue
            SqlAuditor.SelectParameters("ClientID").DefaultValue = CType(sender, DropDownList).SelectedValue
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub ddlEditSupplier_SelectedIndexChanged(sender As Object, e As EventArgs)
        Try
            SqlAuditor.SelectParameters("SupplierID").DefaultValue = CType(grdEditInvoice.Rows(grdEditInvoice.EditIndex).FindControl("ddlEditSupplier"), DropDownList).SelectedValue
            SqlAuditor.SelectParameters("ClientID").DefaultValue = CType(grdEditInvoice.Rows(grdEditInvoice.EditIndex).FindControl("ddlEditClient"), DropDownList).SelectedValue
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub grdEditInvoice_RowUpdating(sender As Object, e As GridViewUpdateEventArgs) Handles grdEditInvoice.RowUpdating
        Try
            e.NewValues("SupplierID") = CType(grdEditInvoice.Rows(grdEditInvoice.EditIndex).FindControl("ddlEditSupplier"), DropDownList).SelectedValue
            e.NewValues("Auditor") = CType(grdEditInvoice.Rows(grdEditInvoice.EditIndex).FindControl("ddlEditAuditor"), DropDownList).SelectedValue
            e.NewValues("BillingTypeID") = CType(grdEditInvoice.Rows(grdEditInvoice.EditIndex).FindControl("ddlEditBillType"), DropDownList).SelectedValue
        Catch ex As Exception

        End Try
    End Sub
End Class