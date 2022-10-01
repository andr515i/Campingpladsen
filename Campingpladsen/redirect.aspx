<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="redirect.aspx.cs" Inherits="Campingpladsen.redirect" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <table>
            <tr>
                <td>

                    <asp:GridView ID="gridview" runat="server" AutoGenerateColumns="False" DataKeyNames="placeId" DataSourceID="SqlDataPlaces">
                        <Columns>
                            <asp:BoundField DataField="placeId" HeaderText="placeId" InsertVisible="False" ReadOnly="True" SortExpression="placeId" />
                            <asp:CheckBoxField DataField="IsReserved" HeaderText="IsReserved" SortExpression="IsReserved" />
                            <asp:BoundField DataField="customerID" HeaderText="customerID" SortExpression="customerID" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataPlaces" runat="server" ConnectionString="<%$ ConnectionStrings:campingpladsenConnectionString %>" SelectCommand="SELECT [placeId], [IsReserved], [customerID] FROM [Places] ORDER BY [placeId]"></asp:SqlDataSource>
                </td>
                <td>


                    <asp:GridView ID="grid" runat="server" AutoGenerateColumns="False" DataKeyNames="customerID" DataSourceID="SqlDataCustomers">
                        <Columns>
                            <asp:BoundField DataField="CustomerID" HeaderText="customer number" />
                            <asp:BoundField DataField="age" HeaderText="age" SortExpression="age" />
                            <asp:BoundField DataField="firstName" HeaderText="first Name" SortExpression="firstName" />
                            <asp:BoundField DataField="lastName" HeaderText="last Name" SortExpression="lastName" />
                            <asp:BoundField DataField="phoneNumber" HeaderText="phone Number" SortExpression="phoneNumber" />
                            <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataCustomers" runat="server" ConnectionString="<%$ ConnectionStrings:campingpladsenConnectionString %>" SelectCommand="SELECT * FROM [Customers] ORDER BY [customerID]"></asp:SqlDataSource>
                </td>
            </tr>
        </table>
        <div>
            <h3>book a spot</h3>
            <form action="/" name="BookPlace" method="post">
                <div>
                    <asp:DropDownList runat="server" ID="placeID" DataSourceID="SqlDataPlaces" DataTextField="placeId" DataValueField="placeId">
                    </asp:DropDownList>
                    <asp:DropDownList runat="server" ID="customerID" DataSourceID="SqlDataCustomers" DataTextField="firstName" DataValueField="customerID">
                    </asp:DropDownList>

                    <asp:Button Text="submit" type="submit" runat="server" ID="BookSpot" OnClick="BookSpot_Click1" />
                </div>
            </form>
        </div>
    </form>
</body>
</html>
