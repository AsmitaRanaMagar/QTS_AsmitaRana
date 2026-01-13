<%@ Page Title="UserTickets" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserTickets.aspx.cs" Inherits="QTS_By_Asmita.UserTickets" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <h2 id="title"><%: Title %>.</h2>
    <p>User ID
        <asp:DropDownList ID="CutomerDd" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="CUS_ID" DataValueField="CUS_ID" OnSelectedIndexChanged="CutomerDd_SelectedIndexChanged">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringQTX %>" ProviderName="<%$ ConnectionStrings:ConnectionStringQTX.ProviderName %>" SelectCommand="SELECT &quot;CUS_ID&quot; FROM &quot;CUSTOMERS&quot;"></asp:SqlDataSource>
    </p>
    <p>&nbsp;</p>
    <p>Select Date
        <asp:DropDownList ID="DateDd" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DateDd_SelectedIndexChanged">
            <asp:ListItem Text="Last 15 days" Value="15d" />
            <asp:ListItem Text="Last 1 month" Value="1m" />
            <asp:ListItem Text="Last 3 months" Value="3m" />
            <asp:ListItem Text="Last 6 months" Value="6m" />
            <asp:ListItem Text="All time" Value="all" />
        </asp:DropDownList>
    </p>
    <p>&nbsp;</p>
        <h3>User Tickets Details</h3>
    <p>
        <asp:GridView ID="TicketList" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="TK_ID" DataSourceID="SqlDataSource2">
            <Columns>
                <asp:BoundField DataField="TK_ID" HeaderText="Id" ReadOnly="True" SortExpression="TK_ID" />
                <asp:BoundField DataField="SW_ID" HeaderText="Show" SortExpression="SW_ID" />
                <asp:BoundField DataField="CUS_ID" HeaderText="User" SortExpression="CUS_ID" />
                <asp:BoundField DataField="TK_DATE" HeaderText="Date" SortExpression="TK_DATE" DataFormatString="{0:MM/dd/yyyy}" />
                <asp:BoundField DataField="TK_STATUS" HeaderText="Status" SortExpression="TK_STATUS" />
                <asp:BoundField DataField="TK_BOOKED_AT" HeaderText="Booked Time" SortExpression="TK_BOOKED_AT" />
                <asp:BoundField DataField="TK_QUANTITY" HeaderText="Total Seats" SortExpression="TK_QUANTITY" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringQTX %>" ProviderName="<%$ ConnectionStrings:ConnectionStringQTX.ProviderName %>"
            SelectCommand="SELECT * FROM &quot;TICKETS&quot; WHERE (&quot;CUS_ID&quot; = :CUS_ID) AND (&quot;TK_DATE&quot; &gt;= TO_DATE(:START_DATE,'YYYY-MM-DD')) AND (&quot;TK_DATE&quot; &lt;= ADD_MONTHS(TO_DATE(:START_DATE,'YYYY-MM-DD'),6))">
            <SelectParameters>
                <asp:ControlParameter ControlID="CutomerDd" Name="CUS_ID" PropertyName="SelectedValue" Type="String" />
                <asp:Parameter Name="START_DATE" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
        <p>&nbsp;</p>
    </main>
</asp:Content>
