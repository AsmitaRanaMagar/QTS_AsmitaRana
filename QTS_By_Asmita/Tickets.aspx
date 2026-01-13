<%@ Page Title="Tickets" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Tickets.aspx.cs" Inherits="QTS_By_Asmita.Tickets" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <h2 id="title"><%: Title %>Tickets Details:</h2>
    <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="TK_ID" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="TK_ID" HeaderText="Id" ReadOnly="True" SortExpression="TK_ID" />
                <asp:BoundField DataField="SW_ID" HeaderText="Show" SortExpression="SW_ID" />
                <asp:BoundField DataField="CUS_ID" HeaderText="User_ID" SortExpression="CUS_ID" />
                <asp:BoundField DataField="TK_DATE" HeaderText="Date" SortExpression="TK_DATE" />
                <asp:BoundField DataField="TK_STATUS" HeaderText="Status" SortExpression="TK_STATUS" />
                <asp:BoundField DataField="TK_BOOKED_AT" HeaderText="Book Time" SortExpression="TK_BOOKED_AT" />
                <asp:BoundField DataField="TK_QUANTITY" HeaderText="No of Seats" SortExpression="TK_QUANTITY" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringQTX %>" ProviderName="<%$ ConnectionStrings:ConnectionStringQTX.ProviderName %>" SelectCommand="SELECT * FROM &quot;TICKETS&quot;"></asp:SqlDataSource>
    </p>
        <h3>Your application description page.</h3>
        <p>Use this area to provide additional information.</p>
    </main>
</asp:Content>
