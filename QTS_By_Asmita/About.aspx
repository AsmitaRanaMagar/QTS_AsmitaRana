<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="QTS_By_Asmita.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <h2 id="title"><%: Title %></h2>

        <div class="max-w-xl mx-auto my-6 font-sans">
            <div class="bg-black text-white border-2 border-yellow-400 rounded-lg shadow-sm p-4">
                <h3 class="text-lg font-semibold mb-4 text-yellow-400 text-center">Select Hall for QTX</h3>

                <!-- Halls datasource and dropdown filtered to theatre id T010 -->
                <asp:SqlDataSource ID="SqlDataSourceHallsSelect" runat="server"
                    ConnectionString="<%$ ConnectionStrings:ConnectionStringQTX %>"
                    ProviderName="<%$ ConnectionStrings:ConnectionStringQTX.ProviderName %>"
                    SelectCommand="SELECT H.&quot;H_ID&quot;, H.&quot;H_NAME&quot; FROM &quot;HALLS&quot; H JOIN &quot;THEATRES&quot; T ON H.&quot;THR_ID&quot; = T.&quot;THR_ID&quot; WHERE T.&quot;THR_ID&quot; = 'T010' ORDER BY H.&quot;H_NAME&quot;">
                </asp:SqlDataSource>

                <div class="grid grid-cols-[120px_1fr] gap-x-3 gap-y-3 text-sm w-full max-w-md">
                    <asp:Label ID="lblSelectHall" runat="server" Text="Hall:" AssociatedControlID="ddlHallSelect" CssClass="font-medium leading-none self-center text-right" />
                    <asp:DropDownList ID="ddlHallSelect" runat="server" DataSourceID="SqlDataSourceHallsSelect" DataTextField="H_NAME" DataValueField="H_ID" AppendDataBoundItems="true" AutoPostBack="True" OnSelectedIndexChanged="DdlHallSelect_SelectedIndexChanged" CssClass="w-full bg-transparent text-white border border-white rounded-md px-2 py-1 custom-select">
                        <asp:ListItem Text="-- Select hall --" Value="" />
                    </asp:DropDownList>

                    <div class="col-span-2 flex justify-center mt-4">
                    </div>
                </div>
            </div>
        </div>
        <div class="max-w-6xl mx-auto my-6 font-sans">
            <asp:GridView ID="GridViewShows" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="SW_ID" CssClass="min-w-full table-auto" PageSize="10" HeaderStyle-CssClass="bg-yellow-400 text-black font-bold text-sm text-left" RowStyle-CssClass="text-white align-top" AlternatingRowStyle-CssClass="bg-black/5 text-white align-top" EditRowStyle-CssClass="bg-black text-white" DataSourceID="SqlDataSourceShowsSelect">
                <Columns>
                    <asp:BoundField DataField="MV_TITLE" HeaderText="Movie Title" />
                    <asp:BoundField DataField="MV_GENRE" HeaderText="Genre" />
                    <asp:BoundField DataField="MV_DURATION" HeaderText="Duration(In Min)" />
                    <asp:BoundField DataField="MV_RELEASE" HeaderText="Release Date" DataFormatString="{0:yyyy-MM-dd}" />
                    <asp:BoundField DataField="SW_DATE" HeaderText="Show Date" DataFormatString="{0:yyyy-MM-dd}" />
                    <asp:BoundField DataField="SW_TIME" HeaderText="Show Time" />
                    <asp:BoundField DataField="SW_PRICE" HeaderText="Ticket Price" />
                    <asp:BoundField DataField="SW_TYPE" HeaderText="Show Type" />
                </Columns>
            </asp:GridView>

            <asp:SqlDataSource ID="SqlDataSourceShowsSelect" runat="server"
                ConnectionString="<%$ ConnectionStrings:ConnectionStringQTX %>"
                ProviderName="<%$ ConnectionStrings:ConnectionStringQTX.ProviderName %>"
                SelectCommand="SELECT S.&quot;SW_ID&quot;, M.&quot;MV_TITLE&quot;, M.&quot;MV_GENRE&quot;, M.&quot;MV_DURATION&quot;, M.&quot;MV_RELEASE&quot;, S.&quot;SW_DATE&quot;, S.&quot;SW_TIME&quot;, S.&quot;SW_PRICE&quot;, S.&quot;SW_TYPE&quot; FROM &quot;SHOWS&quot; S JOIN &quot;MOVIES&quot; M ON S.&quot;MV_ID&quot; = M.&quot;MV_ID&quot; JOIN &quot;HALLS&quot; H ON S.&quot;H_ID&quot; = H.&quot;H_ID&quot; JOIN &quot;THEATRES&quot; T ON H.&quot;THR_ID&quot; = T.&quot;THR_ID&quot; WHERE T.&quot;THR_ID&quot; = 'T010' AND H.&quot;H_ID&quot; = :H_ID ORDER BY S.&quot;SW_DATE&quot;, S.&quot;SW_TIME&quot;">
                <SelectParameters>
                    <asp:ControlParameter Name="H_ID" ControlID="ddlHallSelect" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>

    </main>
</asp:Content>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="HeadContent">
    <style type="text/css">
        .auto-style1 { width: 100%; }
    </style>
</asp:Content>

