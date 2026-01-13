<%@ Page Title="Halls" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Halls.aspx.cs" Inherits="QTS_By_Asmita.Halls" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <h2 id="title"><%: Title %></h2>
        <h3>About Halls</h3>
        <p>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="H_ID" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="H_ID" HeaderText="Id" ReadOnly="True" SortExpression="H_ID" />
                    <asp:BoundField DataField="THR_ID" HeaderText="Threater" SortExpression="THR_ID" />
                    <asp:BoundField DataField="H_NAME" HeaderText="Hall Name" SortExpression="H_NAME" />
                    <asp:BoundField DataField="H_CAPACITY" HeaderText="Capacity" SortExpression="H_CAPACITY" />
                    <asp:BoundField DataField="H_STATUS" HeaderText="Status" SortExpression="H_STATUS" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringQTX %>" ProviderName="<%$ ConnectionStrings:ConnectionStringQTX.ProviderName %>" SelectCommand="SELECT * FROM &quot;HALLS&quot;"></asp:SqlDataSource>
    </p>
    </main>
</asp:Content>
