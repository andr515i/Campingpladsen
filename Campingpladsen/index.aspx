<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Campingpladsen.WebForm" %>

<!DOCTYPE html>

<form id="form1" runat="server">
    <html xmlns="http://www.w3.org/1999/xhtml">

    <head runat="server">
        <title>campingpladsen</title>
        <link href="style.css" rel="stylesheet" />
    </head>
    <body>
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
                    <asp:SqlDataSource ID="SqlDataCustomers" runat="server" ConnectionString="<%$ ConnectionStrings:campingpladsenConnectionString %>" SelectCommand="SELECT * FROM [Customers] ORDER BY [customerID]" OnSelecting="SqlDataCustomers_Selecting"></asp:SqlDataSource>
                </td>
            </tr>
        </table>
        <form action="/" method="post">
            <div>
                <asp:DropDownList runat="server" ID="placeID" DataSourceID="SqlDataPlaces" DataTextField="placeId" DataValueField="placeId">
                </asp:DropDownList>
                <asp:DropDownList runat="server" ID="customerID" DataSourceID="SqlDataCustomers" DataTextField="firstName" DataValueField="customerID">
                </asp:DropDownList>

            </div>
            <asp:Button Text="submit" type="submit" runat="server" ID="BookSpot" OnClick="BookSpot_Click1" />
        </form>

       <%-- <form action="/" method="post">
            <asp:Label Text="book a spot" runat="server" />
            <div>

                <asp:TextBox runat="server" required="required" type="text" ID="age" name="age" value="" placeholder="age?" />
                <asp:TextBox runat="server" required="required" type="text" ID="firstName" name="firstName" value="" placeholder="first name" />
                <asp:TextBox runat="server" required="required" type="text" ID="lastName" name="lastName" value="" placeholder="last name" />
                <asp:TextBox runat="server" required="required" type="text" ID="phoneNumber" name="phoneNumber" value="" placeholder="phone number. eg: 12345678" />
                <asp:TextBox runat="server" required="required" type="text" ID="email" name="email" value="" placeholder="email. eg: test@test.com" />
            </div>
            <asp:Button type="submit" Text="submit" runat="server" ID="submit_button" OnClick="submit_button_Click1" />
        </form>--%>



    </body>
    </html>
</form>
