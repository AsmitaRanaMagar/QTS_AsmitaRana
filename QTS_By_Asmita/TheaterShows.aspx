<%@ Page Title="Shows" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TheaterShows.aspx.cs" Inherits="QTS_By_Asmita.TheaterShows" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <h2 id="title"><%: Title %></h2>

        <div class="max-w-6xl mx-auto my-6 font-sans">
            <asp:GridView ID="GridViewShows" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="SW_ID" CssClass="min-w-full table-auto" PageSize="10" HeaderStyle-CssClass="bg-yellow-400 text-black font-bold text-sm text-left" RowStyle-CssClass="text-white align-top" AlternatingRowStyle-CssClass="bg-black/5 text-white align-top" EditRowStyle-CssClass="bg-black text-white">
                <Columns>
                    <asp:BoundField DataField="SW_ID" HeaderText="Show ID" SortExpression="SW_ID" />
                    <asp:BoundField DataField="MV_TITLE" HeaderText="Movie" SortExpression="MV_TITLE" />
                    <asp:BoundField DataField="H_NAME" HeaderText="Hall" SortExpression="H_NAME" />
                    <asp:BoundField DataField="SW_DATE" HeaderText="Date" DataFormatString="{0:yyyy-MM-dd}" />
                    <asp:BoundField DataField="SW_TIME" HeaderText="Time" />
                    <asp:BoundField DataField="SW_PRICE" HeaderText="Price" />
                    <asp:BoundField DataField="SW_TYPE" HeaderText="Type" />
                </Columns>
            </asp:GridView>

            <asp:SqlDataSource ID="SqlDataSourceShowsByTheater" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringQTX %>" ProviderName="<%$ ConnectionStrings:ConnectionStringQTX.ProviderName %>"
                SelectCommand="SELECT S.&quot;SW_ID&quot;, M.&quot;MV_TITLE&quot;, H.&quot;H_NAME&quot;, S.&quot;SW_DATE&quot;, S.&quot;SW_TIME&quot;, S.&quot;SW_PRICE&quot;, S.&quot;SW_TYPE&quot; FROM &quot;SHOWS&quot; S JOIN &quot;MOVIES&quot; M ON S.&quot;MV_ID&quot; = M.&quot;MV_ID&quot; JOIN &quot;HALLS&quot; H ON S.&quot;H_ID&quot; = H.&quot;H_ID&quot; WHERE H.&quot;THR_ID&quot; = :THR_ID ORDER BY S.&quot;SW_DATE&quot;, S.&quot;SW_TIME&quot;">
                <SelectParameters>
                    <asp:QueryStringParameter Name="THR_ID" QueryStringField="thr" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>

            <asp:Label ID="lblNoShows" runat="server" CssClass="text-yellow-400" Visible="false">No shows found for the selected theater.</asp:Label>
        </div>
    </main>
</asp:Content>
