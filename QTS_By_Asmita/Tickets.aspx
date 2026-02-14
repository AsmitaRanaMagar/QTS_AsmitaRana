<%@ Page Title="Tickets" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Tickets.aspx.cs" Inherits="QTS_By_Asmita.Tickets" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <h2 id="title">&nbsp;</h2>

        <style>
            .custom-select {
                background-color: transparent !important;
                color: #ffffff !important;
                border: 1px solid #ffffff !important;
                border-radius: .375rem !important; /* rounded-md */
                padding: .25rem .5rem !important;
            }
            .custom-select option {
                background-color: #000000 !important;
                color: #ffffff !important;
            }
            /* For WebKit browsers try to keep the dropdown arrow visible */
            .custom-select::-ms-expand { display: block; }
        </style>

    <!-- Add ticket panel -->
    <div class="max-w-xl mx-auto my-6 font-sans">
        <div class="bg-black text-white border-2 border-yellow-400 rounded-lg shadow-sm p-4">
            <asp:Panel ID="pnlAdd" runat="server">
                <div class="grid grid-cols-1 md:grid-cols-2 gap-3 items-center text-sm">

                    <h3 class="text-lg font-semibold mb-3 text-yellow-400 md:col-span-2 text-center">Add New Ticket</h3>

                    <asp:Label ID="lblTicketID" runat="server" Text="Ticket ID:" AssociatedControlID="txtTicketID" CssClass="font-medium md:col-span-1" />
                    <asp:TextBox ID="txtTicketID" runat="server" CssClass="w-full bg-transparent text-white border border-white rounded-md text-sm px-2 py-1 md:col-span-1" required="required" />

                    <asp:Label ID="lblShowID" runat="server" Text="Show:" AssociatedControlID="DropDownList1" CssClass="font-medium md:col-span-1" />
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSourceShows" DataTextField="SW_ID" DataValueField="SW_ID" CssClass="w-full bg-transparent text-white border border-white rounded-md text-sm px-2 py-1 md:col-span-1 custom-select" AppendDataBoundItems="true" AutoPostBack="False" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                        <asp:ListItem Text="Select show" Value="" />
                    </asp:DropDownList>

                    <asp:Label ID="lblCustomerID" runat="server" Text="Customer:" AssociatedControlID="ddlCustomerID" CssClass="font-medium md:col-span-1" />
                    <asp:DropDownList ID="ddlCustomerID" runat="server" DataSourceID="SqlDataSourceCust" DataTextField="CUS_NAME" DataValueField="CUS_ID" CssClass="w-full bg-transparent text-white border border-white rounded-md text-sm px-2 py-1 md:col-span-1 custom-select" AppendDataBoundItems="true">
                        <asp:ListItem Text="Select customer" Value="" />
                    </asp:DropDownList>

                    <asp:Label ID="lblDate" runat="server" Text="Ticket Date:" AssociatedControlID="txtDate" CssClass="font-medium md:col-span-1" />
                    <asp:TextBox ID="txtDate" runat="server" TextMode="Date" CssClass="w-full bg-transparent text-white border border-white rounded-md text-sm px-2 py-1 md:col-span-1" required="required" />

                    <asp:Label ID="lblQuantity" runat="server" Text="Quantity:" AssociatedControlID="txtQuantity" CssClass="font-medium md:col-span-1" />
                    <asp:TextBox ID="txtQuantity" runat="server" TextMode="Number" CssClass="w-full bg-transparent text-white border border-white rounded-md text-sm px-2 py-1 md:col-span-1" />

                    <asp:Label ID="lblStatus" runat="server" Text="Status:" AssociatedControlID="txtStatus" CssClass="font-medium md:col-span-1" />
                    <asp:TextBox ID="txtStatus" runat="server" CssClass="w-full bg-transparent text-white border border-white rounded-md text-sm px-2 py-1 md:col-span-1" />

                    <div class="md:col-span-2 text-center">
                        <asp:Button ID="btnAddTicket" runat="server" CssClass="px-3 py-1 text-sm rounded-md" Text="Add Ticket" OnClick="AddTicket_Click" Style="background:var(--gold); color:#000; border:none; display:inline-block;" />
                    </div>
                    <div class="md:col-span-3 md:col-start-1 mt-2">
                        <asp:Label ID="lblTicketError" runat="server" ForeColor="#ff6b6b" CssClass="text-sm" Style="display:none"></asp:Label>
                    </div>
                 </div>
             </asp:Panel>
         </div>
     </div>

    <!-- Filter panel: User ID + Customer details (fixed last 6 months) -->
    <div class="max-w-6xl mx-auto my-6 font-sans">
        <div class="bg-black text-white border-2 border-yellow-400 rounded-lg shadow-sm p-4">
            <asp:Panel ID="pnlFilter" runat="server">
                <div class="grid grid-cols-1 md:grid-cols-6 gap-3 items-center text-sm">
                    <h3 class="text-lg font-semibold mb-3 text-yellow-400 md:col-span-6 text-center">Filter Tickets (last 6 months)</h3>

                    <label class="font-medium md:col-span-1 text-white">User ID</label>
                    <asp:DropDownList ID="ddlFilterCustomer" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceCust" DataTextField="CUS_ID" DataValueField="CUS_ID" OnSelectedIndexChanged="DdlFilterCustomer_SelectedIndexChanged" CssClass="w-full bg-transparent text-white border border-white rounded-md text-sm px-2 py-1 md:col-span-2 custom-select" AppendDataBoundItems="true">
                        <asp:ListItem Text="All users" Value="%" />
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceCust" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringQTX %>" ProviderName="<%$ ConnectionStrings:ConnectionStringQTX.ProviderName %>" SelectCommand="SELECT &quot;CUS_ID&quot;, &quot;CUS_NAME&quot; FROM &quot;CUSTOMERS&quot; ORDER BY &quot;CUS_NAME&quot;">
                    </asp:SqlDataSource>

                    <!-- DataSource for Shows (used by DropDownList1) -->
                    <asp:SqlDataSource ID="SqlDataSourceShows" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringQTX %>" ProviderName="<%$ ConnectionStrings:ConnectionStringQTX.ProviderName %>" SelectCommand="SELECT &quot;SW_ID&quot; FROM &quot;SHOWS&quot; ORDER BY &quot;SW_ID&quot;">
                    </asp:SqlDataSource>

                    <!-- helpers to validate foreign keys server-side -->
                    <asp:SqlDataSource ID="SqlDataSourceCheckShow" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringQTX %>" ProviderName="<%$ ConnectionStrings:ConnectionStringQTX.ProviderName %>" SelectCommand="SELECT COUNT(*) AS CNT FROM &quot;SHOWS&quot; WHERE &quot;SW_ID&quot; = :SW_ID">
                        <SelectParameters>
                            <asp:Parameter Name="SW_ID" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSourceCheckCustomer" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringQTX %>" ProviderName="<%$ ConnectionStrings:ConnectionStringQTX.ProviderName %>" SelectCommand="SELECT COUNT(*) AS CNT FROM &quot;CUSTOMERS&quot; WHERE &quot;CUS_ID&quot; = :CUS_ID">
                        <SelectParameters>
                            <asp:Parameter Name="CUS_ID" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                    <!-- Customer details -->
                    <div class="md:col-span-4">&nbsp;</div>
                 </div>
             </asp:Panel>
        </div>
    </div>
    <div class="max-w-6xl mx-auto my-6 font-sans">
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="TK_ID" DataSourceID="SqlDataSource1" CssClass="min-w-full table-auto" HeaderStyle-CssClass="bg-yellow-400 text-black font-bold text-sm text-left" RowStyle-CssClass="text-white align-top" AlternatingRowStyle-CssClass="bg-black/5 text-white align-top" EditRowStyle-CssClass="bg-black text-white">
<AlternatingRowStyle CssClass="bg-black/5 text-white align-top"></AlternatingRowStyle>
            <Columns>
                <asp:BoundField DataField="TK_ID" HeaderText="TK_ID" ReadOnly="True" SortExpression="TK_ID" />
                <asp:BoundField DataField="SW_ID" HeaderText="SW_ID" SortExpression="SW_ID" />
                <asp:BoundField DataField="CUS_ID" HeaderText="Customer ID" SortExpression="CUS_ID" />
                <asp:BoundField DataField="TK_DATE" HeaderText="TK_DATE" SortExpression="TK_DATE" />
                <asp:BoundField DataField="TK_STATUS" HeaderText="TK_STATUS" SortExpression="TK_STATUS" />
                <asp:BoundField DataField="TK_BOOKED_AT" HeaderText="TK_BOOKED_AT" SortExpression="TK_BOOKED_AT" />
                <asp:BoundField DataField="TK_QUANTITY" HeaderText="TK_QUANTITY" SortExpression="TK_QUANTITY" />
            </Columns>

<EditRowStyle CssClass="bg-black text-white"></EditRowStyle>

<HeaderStyle CssClass="bg-yellow-400 text-black font-bold text-sm text-left"></HeaderStyle>

<RowStyle CssClass="text-white align-top"></RowStyle>
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringQTX %>" DeleteCommand="DELETE FROM &quot;TICKETS&quot; WHERE &quot;TK_ID&quot; = :TK_ID" InsertCommand="INSERT INTO &quot;TICKETS&quot; (&quot;TK_ID&quot;, &quot;SW_ID&quot;, &quot;CUS_ID&quot;, &quot;TK_DATE&quot;, &quot;TK_STATUS&quot;, &quot;TK_BOOKED_AT&quot;, &quot;TK_QUANTITY&quot;) VALUES (:TK_ID, :SW_ID, :CUS_ID, :TK_DATE, :TK_STATUS, :TK_BOOKED_AT, :TK_QUANTITY)" ProviderName="<%$ ConnectionStrings:ConnectionStringQTX.ProviderName %>" SelectCommand="SELECT t.&quot;TK_ID&quot;, t.&quot;SW_ID&quot;, t.&quot;CUS_ID&quot;, c.&quot;CUS_NAME&quot; AS &quot;CUS_NAME&quot;, t.&quot;TK_DATE&quot;, t.&quot;TK_STATUS&quot;, t.&quot;TK_BOOKED_AT&quot;, t.&quot;TK_QUANTITY&quot; FROM &quot;TICKETS&quot; t LEFT JOIN &quot;CUSTOMERS&quot; c ON t.&quot;CUS_ID&quot; = c.&quot;CUS_ID&quot; ORDER BY t.&quot;TK_DATE&quot; DESC" UpdateCommand="UPDATE &quot;TICKETS&quot; SET &quot;SW_ID&quot; = :SW_ID, &quot;CUS_ID&quot; = :CUS_ID, &quot;TK_DATE&quot; = :TK_DATE, &quot;TK_STATUS&quot; = :TK_STATUS, &quot;TK_BOOKED_AT&quot; = :TK_BOOKED_AT, &quot;TK_QUANTITY&quot; = :TK_QUANTITY WHERE &quot;TK_ID&quot; = :TK_ID">
            <DeleteParameters>
                <asp:Parameter Name="TK_ID" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="TK_ID" Type="String" />
                <asp:Parameter Name="SW_ID" Type="String" />
                <asp:Parameter Name="CUS_ID" Type="String" />
                <asp:Parameter Name="TK_DATE" Type="DateTime" />
                <asp:Parameter Name="TK_STATUS" Type="String" />
                <asp:Parameter Name="TK_BOOKED_AT" Type="DateTime" />
                <asp:Parameter Name="TK_QUANTITY" Type="Decimal" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="SW_ID" Type="String" />
                <asp:Parameter Name="CUS_ID" Type="String" />
                <asp:Parameter Name="TK_DATE" Type="DateTime" />
                <asp:Parameter Name="TK_STATUS" Type="String" />
                <asp:Parameter Name="TK_BOOKED_AT" Type="DateTime" />
                <asp:Parameter Name="TK_QUANTITY" Type="Decimal" />
                <asp:Parameter Name="TK_ID" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource12" runat="server"></asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringQTX %>" DeleteCommand="DELETE FROM &quot;TICKETS&quot; WHERE &quot;TK_ID&quot; = :TK_ID" InsertCommand="INSERT INTO &quot;TICKETS&quot; (&quot;TK_ID&quot;, &quot;SW_ID&quot;, &quot;CUS_ID&quot;, &quot;TK_DATE&quot;, &quot;TK_STATUS&quot;, &quot;TK_BOOKED_AT&quot;, &quot;TK_QUANTITY&quot;) VALUES (:TK_ID, :SW_ID, :CUS_ID, :TK_DATE, :TK_STATUS, :TK_BOOKED_AT, :TK_QUANTITY)" ProviderName="<%$ ConnectionStrings:ConnectionStringQTX.ProviderName %>"
            SelectCommand="SELECT * FROM &quot;TICKETS&quot; WHERE (:CUS_ID = '%' OR :CUS_ID IS NULL OR :CUS_ID = '' OR &quot;CUS_ID&quot; = :CUS_ID) AND (:START_DATE IS NOT NULL AND &quot;TK_DATE&quot; >= TO_DATE(:START_DATE,'YYYY-MM-DD')) ORDER BY &quot;TK_DATE&quot; DESC" UpdateCommand="UPDATE &quot;TICKETS&quot; SET &quot;SW_ID&quot; = :SW_ID, &quot;CUS_ID&quot; = :CUS_ID, &quot;TK_DATE&quot; = :TK_DATE, &quot;TK_STATUS&quot; = :TK_STATUS, &quot;TK_BOOKED_AT&quot; = :TK_BOOKED_AT, &quot;TK_QUANTITY&quot; = :TK_QUANTITY WHERE &quot;TK_ID&quot; = :TK_ID">
                    <DeleteParameters>
                        <asp:Parameter Name="TK_ID" Type="String" />
                    </DeleteParameters>
                    <SelectParameters>
                        <asp:Parameter Name="CUS_ID" Type="String" DefaultValue="%" />
                        <asp:Parameter Name="START_DATE" Type="String" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:Parameter Name="TK_ID" Type="String" />
                        <asp:Parameter Name="SW_ID" Type="String" />
                        <asp:Parameter Name="CUS_ID" Type="String" />
                        <asp:Parameter Name="TK_DATE" Type="DateTime" />
                        <asp:Parameter Name="TK_STATUS" Type="String" />
                        <asp:Parameter Name="TK_BOOKED_AT" Type="DateTime" />
                        <asp:Parameter Name="TK_QUANTITY" Type="Decimal" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="SW_ID" Type="String" />
                        <asp:Parameter Name="CUS_ID" Type="String" />
                        <asp:Parameter Name="TK_DATE" Type="DateTime" />
                        <asp:Parameter Name="TK_STATUS" Type="String" />
                        <asp:Parameter Name="TK_BOOKED_AT" Type="DateTime" />
                        <asp:Parameter Name="TK_QUANTITY" Type="Decimal" />
                        <asp:Parameter Name="TK_ID" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
    </div>

</main>
</asp:Content>
