<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" SelectCommand="SELECT [CategoryID], [CategoryName], [Description] FROM [Categories]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" SelectCommand="SELECT [EmployeeID], [LastName], [FirstName], [Title], [TitleOfCourtesy], [BirthDate], [HireDate] FROM [Employees]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" SelectCommand="SELECT [ProductID], [ProductName], [QuantityPerUnit], [UnitPrice], [UnitsInStock] FROM [Products]"></asp:SqlDataSource>

        <dx:ASPxGridView ID="ASPxGridView1" runat="server" ViewStateMode="Disabled" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" KeyFieldName="EmployeeID" ClientInstanceName="grid" OnCustomCallback="ASPxGridView1_CustomCallback">
            <Columns>
                <dx:GridViewDataTextColumn FieldName="EmployeeID" ReadOnly="True" VisibleIndex="0">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="LastName" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="FirstName" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Title" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TitleOfCourtesy" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="BirthDate" VisibleIndex="5">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn FieldName="HireDate" VisibleIndex="6">
                </dx:GridViewDataDateColumn>
            </Columns>
        </dx:ASPxGridView>

        <dx:ASPxRadioButtonList ID="ASPxRadioButtonList1" runat="server" SelectedIndex="0" ClientInstanceName="options">
            <ClientSideEvents SelectedIndexChanged="function(s, e) {
	grid.PerformCallback(options.GetSelectedIndex());
}" />
            <Items>
                <dx:ListEditItem Selected="True" Text="Categories" Value="SqlDataSource1" />
                <dx:ListEditItem Text="Employes" Value="SqlDataSource2" />
                <dx:ListEditItem Text="Products" Value="SqlDataSource3" />
            </Items>
        </dx:ASPxRadioButtonList>

    </form>
</body>
</html>
