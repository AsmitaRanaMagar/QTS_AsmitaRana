<%@ Page Title="Movies" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Movies.aspx.cs" Inherits="QTS_By_Asmita.Movies" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <h2 id="title"><%: Title %>Movies</h2>
<p>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="MV_ID" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="MV_ID" HeaderText="Id" ReadOnly="True" SortExpression="MV_ID" />
            <asp:BoundField DataField="MV_TITLE" HeaderText="Title" SortExpression="MV_TITLE" />
            <asp:BoundField DataField="MV_GENRE" HeaderText="Genre" SortExpression="MV_GENRE" />
            <asp:BoundField DataField="MV_LANG" HeaderText="Language" SortExpression="MV_LANG" />
            <asp:BoundField DataField="MV_RELEASE" HeaderText="Release Date" SortExpression="MV_RELEASE" />
            <asp:BoundField DataField="MV_DURATION" HeaderText="Duration" SortExpression="MV_DURATION" />
            <asp:BoundField DataField="MV_DESC" HeaderText="Desctiption" SortExpression="MV_DESC" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringQTX %>" ProviderName="<%$ ConnectionStrings:ConnectionStringQTX.ProviderName %>" SelectCommand="SELECT * FROM &quot;MOVIES&quot;"></asp:SqlDataSource>
</p>
<p>&nbsp;</p>

        
    </main>
</asp:Content>
