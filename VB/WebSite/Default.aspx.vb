Imports Microsoft.VisualBasic
Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Data
Imports DevExpress.Web

Partial Public Class _Default
	Inherits System.Web.UI.Page
	Protected Overrides Sub OnInit(ByVal e As EventArgs)
		SwitchSource(ASPxRadioButtonList1.Items(Convert.ToInt32(Request.Params("ASPxRadioButtonList1"))).Value.ToString())

		MyBase.OnInit(e)
	End Sub

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)

	End Sub

	Private Sub SwitchSource(ByVal s As String)
		Dim source As SqlDataSource = TryCast(FindControl(s), SqlDataSource)
		If source Is Nothing Then
			Return
		End If

		ASPxGridView1.DataSourceID = s
		ASPxGridView1.Columns.Clear()
		ASPxGridView1.AutoGenerateColumns = True
		ASPxGridView1.DataBind()
	End Sub
	Protected Sub ASPxGridView1_CustomCallback(ByVal sender As Object, ByVal e As ASPxGridViewCustomCallbackEventArgs)
		SwitchSource(ASPxRadioButtonList1.Items(Convert.ToInt32(e.Parameters(0).ToString())).Value.ToString())
	End Sub
End Class