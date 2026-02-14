<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Shows.aspx.cs" Inherits="QTS_By_Asmita.Shows" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
     <div class="max-w-xl mx-auto my-6 font-sans">
         <div class="bg-black text-white border-2 border-yellow-400 rounded-lg shadow-sm p-4">
             <asp:Panel ID="pnlAdd" runat="server">
                 <div class="grid grid-cols-1 md:grid-cols-3 gap-3 items-center text-sm">

                     <h3 class="text-lg font-semibold mb-3 text-yellow-400 md:col-span-3 text-center">Add New Show</h3>

                     <asp:Label ID="lblShowID" runat="server" Text="Show ID:" AssociatedControlID="txtShowID" CssClass="font-medium md:col-span-1" />
                     <asp:TextBox ID="txtShowID" runat="server" CssClass="w-full bg-transparent text-white border border-white rounded-md text-sm px-2 py-1 md:col-span-2" required="required" />

                     <asp:Label ID="lblShowMovieID" runat="server" Text="Movie:" AssociatedControlID="ddlMovie" CssClass="font-medium md:col-span-1" />
                     <asp:DropDownList ID="ddlMovie" runat="server" DataSourceID="SqlDataSourceMovies" DataTextField="MV_TITLE" DataValueField="MV_ID" CssClass="w-full bg-transparent text-white border border-white rounded-md text-sm px-2 py-1 md:col-span-2" AppendDataBoundItems="true">
                        <asp:ListItem Text="Select movie" Value="" />
                     </asp:DropDownList>

                     <asp:Label ID="lblShowHallID" runat="server" Text="Hall:" AssociatedControlID="ddlHallID" CssClass="font-medium md:col-span-1" />
                     <asp:DropDownList ID="ddlHallID" runat="server" DataSourceID="SqlDataSourceHalls" DataTextField="H_NAME" DataValueField="H_ID" CssClass="w-full bg-transparent text-white border border-white rounded-md text-sm px-2 py-1 md:col-span-2" AppendDataBoundItems="true">
                        <asp:ListItem Text="Select hall" Value="" />
                     </asp:DropDownList>

                     <asp:Label ID="lblShowDate" runat="server" Text="Show Date:" AssociatedControlID="txtShowDate" CssClass="font-medium md:col-span-1" />
                     <asp:TextBox ID="txtShowDate" runat="server" TextMode="Date" CssClass="w-full bg-transparent text-white border border-white rounded-md text-sm px-2 py-1 md:col-span-2" />

                     <asp:Label ID="lblShowTime" runat="server" Text="Show Time:" AssociatedControlID="txtShowTime" CssClass="font-medium md:col-span-1" />
                     <asp:TextBox ID="txtShowTime" runat="server" TextMode="Time" CssClass="w-full bg-transparent text-white border border-white rounded-md text-sm px-2 py-1 md:col-span-2" />

                     <asp:Label ID="lblPrice" runat="server" Text="Price:" AssociatedControlID="txtPrice" CssClass="font-medium md:col-span-1" />
                     <asp:TextBox ID="txtPrice" runat="server" TextMode="Number" CssClass="w-full bg-transparent text-white border border-white rounded-md text-sm px-2 py-1 md:col-span-2" />

                     <asp:Label ID="lblType" runat="server" Text="Type:" AssociatedControlID="txtType" CssClass="font-medium md:col-span-1" />
                     <asp:TextBox ID="txtType" runat="server" CssClass="w-full bg-transparent text-white border border-white rounded-md text-sm px-2 py-1 md:col-span-2" />

                     <div class="md:col-span-3 text-center">
                         <asp:Button ID="btnAddShow" runat="server" CssClass="px-3 py-1 text-sm rounded-md" Text="Add Show" OnClick="AddShow_Click" Style="background:var(--gold); color:#000; border:none; display:inline-block;" />
                     </div>
                 </div>
             </asp:Panel>
         </div>
     </div>

        <div class="max-w-6xl mx-auto my-6 font-sans">
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="SW_ID" DataSourceID="SqlDataSource1" CssClass="min-w-full table-auto" PageSize="10" HeaderStyle-CssClass="bg-yellow-400 text-black font-bold text-sm text-left" RowStyle-CssClass="text-white align-top" AlternatingRowStyle-CssClass="bg-black/5 text-white align-top" EditRowStyle-CssClass="bg-black text-white">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="SW_ID" HeaderText="Id" ReadOnly="True" SortExpression="SW_ID" />
                    <asp:BoundField DataField="MV_ID" HeaderText="Movie" SortExpression="MV_ID" />
                    <asp:BoundField DataField="H_ID" HeaderText="Hall" SortExpression="H_ID" />
                    <asp:BoundField DataField="SW_DATE" HeaderText="Date" SortExpression="SW_DATE" DataFormatString="{0:yyyy-MM-dd}" />
                    <asp:BoundField DataField="SW_TIME" HeaderText="Time" SortExpression="SW_TIME" />
                    <asp:BoundField DataField="SW_PRICE" HeaderText="Price" SortExpression="SW_PRICE" />
                    <asp:BoundField DataField="SW_TYPE" HeaderText="Type" SortExpression="SW_TYPE" />
                </Columns>
            </asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringQTX %>" SelectCommand="SELECT * FROM &quot;SHOWS&quot;" DeleteCommand="DELETE FROM &quot;SHOWS&quot; WHERE &quot;SW_ID&quot; = :SW_ID" InsertCommand="INSERT INTO &quot;SHOWS&quot; (&quot;SW_ID&quot;, &quot;MV_ID&quot;, &quot;H_ID&quot;, &quot;SW_DATE&quot;, &quot;SW_TIME&quot;, &quot;SW_PRICE&quot;, &quot;SW_TYPE&quot;) VALUES (:SW_ID, :MV_ID, :H_ID, :SW_DATE, :SW_TIME, :SW_PRICE, :SW_TYPE)" UpdateCommand="UPDATE &quot;SHOWS&quot; SET &quot;MV_ID&quot; = :MV_ID, &quot;H_ID&quot; = :H_ID, &quot;SW_DATE&quot; = :SW_DATE, &quot;SW_TIME&quot; = :SW_TIME, &quot;SW_PRICE&quot; = :SW_PRICE, &quot;SW_TYPE&quot; = :SW_TYPE WHERE &quot;SW_ID&quot; = :SW_ID" ProviderName="<%$ ConnectionStrings:ConnectionStringQTX.ProviderName %>">
                     <DeleteParameters>
                         <asp:Parameter Name="SW_ID" Type="String" />
                     </DeleteParameters>
                     <InsertParameters>
                         <asp:ControlParameter Name="SW_ID" ControlID="txtShowID" PropertyName="Text" Type="String" />
                         <asp:ControlParameter Name="MV_ID" ControlID="ddlMovie" PropertyName="SelectedValue" Type="String" />
                         <asp:ControlParameter Name="H_ID" ControlID="ddlHallID" PropertyName="SelectedValue" Type="String" />
                         <asp:Parameter Name="SW_DATE" Type="DateTime" />
                         <asp:Parameter Name="SW_TIME" Type="String" />
                         <asp:Parameter Name="SW_PRICE" Type="Decimal" />
                         <asp:ControlParameter Name="SW_TYPE" ControlID="txtType" PropertyName="Text" Type="String" />
                     </InsertParameters>
                     <UpdateParameters>
                         <asp:Parameter Name="MV_ID" Type="String" />
                         <asp:Parameter Name="H_ID" Type="String" />
                         <asp:Parameter Name="SW_DATE" Type="DateTime" />
                         <asp:Parameter Name="SW_TIME" Type="String" />
                         <asp:Parameter Name="SW_PRICE" Type="Decimal" />
                         <asp:Parameter Name="SW_TYPE" Type="String" />
                         <asp:Parameter Name="SW_ID" Type="String" />
                     </UpdateParameters>
                 </asp:SqlDataSource>

                <!-- DataSource for Movies (used by ddlMovie) -->
                <asp:SqlDataSource ID="SqlDataSourceMovies" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringQTX %>" SelectCommand="SELECT &quot;MV_ID&quot;, &quot;MV_TITLE&quot; FROM &quot;MOVIES&quot; ORDER BY &quot;MV_ID&quot;" ProviderName="<%$ ConnectionStrings:ConnectionStringQTX.ProviderName %>"></asp:SqlDataSource>

                <!-- DataSource for Halls (used by ddlHallID) -->
                <asp:SqlDataSource ID="SqlDataSourceHalls" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringQTX %>" SelectCommand="SELECT &quot;H_ID&quot;, &quot;H_NAME&quot; FROM &quot;HALLS&quot; ORDER BY &quot;H_ID&quot;" ProviderName="<%$ ConnectionStrings:ConnectionStringQTX.ProviderName %>"></asp:SqlDataSource>
         </div>
</main>
</asp:Content>
