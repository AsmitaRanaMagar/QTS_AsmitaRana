<%@ Page Title="Shows" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Shows.aspx.cs" Inherits="QTS_By_Asmita.Shows" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <h2 id="title"><%: Title %>.</h2>
        <h3>Shows Pages.</h3>
        <p>Use this area to provide additional information.</p>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="SW_ID" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="SW_ID" HeaderText="Id" ReadOnly="True" SortExpression="SW_ID" />
                <asp:BoundField DataField="MV_ID" HeaderText="Movie" SortExpression="MV_ID" />
                <asp:BoundField DataField="H_ID" HeaderText="Hall" SortExpression="H_ID" />
                <asp:BoundField DataField="SW_DATE" HeaderText="Date" SortExpression="SW_DATE" />
                <asp:BoundField DataField="SW_TIME" HeaderText="Time" SortExpression="SW_TIME" />
                <asp:BoundField DataField="SW_PRICE" HeaderText="Price" SortExpression="SW_PRICE" />
                <asp:BoundField DataField="SW_TYPE" HeaderText="Type" SortExpression="SW_TYPE" />
            </Columns>
    </asp:GridView>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringQTX %>" ProviderName="<%$ ConnectionStrings:ConnectionStringQTX.ProviderName %>" SelectCommand="SELECT * FROM &quot;SHOWS&quot;"></asp:SqlDataSource>

    </main>
</asp:Content>
