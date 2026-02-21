<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="QTS_By_Asmita.Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main class="max-w-7xl mx-auto px-4 py-8">
        <!-- Totals row -->
        <section class="grid grid-cols-1 md:grid-cols-3 gap-4">
            <div class="p-4 bg-gradient-to-br from-gray-900 to-black rounded-lg border border-gray-800 shadow-sm text-center">
                <div class="flex items-center justify-center space-x-2">
                    <!-- users SVG -->
                    <svg class="w-6 h-6 text-yellow-400" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M17 20h5v-2a4 4 0 0 0-4-4h-1M9 20H4v-2a4 4 0 0 1 4-4h1m1-7a4 4 0 1 1-8 0 4 4 0 0 1 8 0zM21 8a4 4 0 1 1-8 0 4 4 0 0 1 8 0z"></path></svg>
                    <div class="text-sm text-gray-400">Total Customers</div>
                </div>
                <div class="mt-2 text-3xl font-bold text-white"><asp:Label ID="lblTotalCustomers" runat="server" Text="0" /></div>
            </div>
            <div class="p-4 bg-gradient-to-br from-gray-900 to-black rounded-lg border border-gray-800 shadow-sm text-center">
                <div class="flex items-center justify-center space-x-2">
                    <!-- film SVG -->
                    <svg class="w-6 h-6 text-yellow-400" fill="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path d="M5 3h14a1 1 0 0 1 1 1v16a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1V4a1 1 0 0 1 1-1zm1 2v2h2V5H6zm10 0v2h2V5h-2zM6 9v2h2V9H6zm10 0v2h2V9h-2zM6 13v2h2v-2H6zm10 0v2h2v-2h-2z"/></svg>
                    <div class="text-sm text-gray-400">Total Movies</div>
                </div>
                <div class="mt-2 text-3xl font-bold text-white"><asp:Label ID="lblTotalMovies" runat="server" Text="0" /></div>
            </div>
            <div class="p-4 bg-gradient-to-br from-gray-900 to-black rounded-lg border border-gray-800 shadow-sm text-center">
                <div class="flex items-center justify-center space-x-2">
                    <!-- calendar/show SVG -->
                    <svg class="w-6 h-6 text-yellow-400" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M8 7V3m8 4V3M3 11h18M5 21h14a2 2 0 0 0 2-2V7a2 2 0 0 0-2-2H5a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2z"></path></svg>
                    <div class="text-sm text-gray-400">Active Shows (Today)</div>
                </div>
                <div class="mt-2 text-3xl font-bold text-white"><asp:Label ID="lblTotalShowsToday" runat="server" Text="0" /></div>
            </div>
        </section>

        <!-- Data sources for counts -->
        <asp:SqlDataSource ID="sdsCustomersCount" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringQTX %>" ProviderName="<%$ ConnectionStrings:ConnectionStringQTX.ProviderName %>" SelectCommand="SELECT COUNT(*) AS CNT FROM &quot;CUSTOMERS&quot;"></asp:SqlDataSource>
        <asp:SqlDataSource ID="sdsMoviesCount" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringQTX %>" ProviderName="<%$ ConnectionStrings:ConnectionStringQTX.ProviderName %>" SelectCommand="SELECT COUNT(*) AS CNT FROM &quot;MOVIES&quot;"></asp:SqlDataSource>
        <asp:SqlDataSource ID="sdsShowsTodayCount" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringQTX %>" ProviderName="<%$ ConnectionStrings:ConnectionStringQTX.ProviderName %>" SelectCommand="SELECT COUNT(*) AS CNT FROM &quot;SHOWS&quot; WHERE TRUNC(&quot;SW_DATE&quot;) = TRUNC(SYSDATE)"></asp:SqlDataSource>

        <!-- Quick Actions -->
        <section class="mt-8">
            <h2 class="text-lg font-semibold text-yellow-400">Quick Actions</h2>
            <div class="mt-4 grid grid-cols-2 sm:grid-cols-3 lg:grid-cols-6 gap-4">
                <asp:HyperLink runat="server" NavigateUrl="~/Movies" CssClass="block p-4 bg-gray-900 border border-gray-800 rounded-lg hover:shadow-lg">
                    <div class="flex items-center space-x-2">
                        <!-- search film SVG -->
                        <svg class="w-5 h-5 text-yellow-400" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M21 21l-4.35-4.35M10 18a8 8 0 1 0 0-16 8 8 0 0 0 0 16z"></path></svg>
                        <div>
                            <div class="text-sm text-gray-400">Movies</div>
                            <div class="mt-1 text-white font-bold">Browse</div>
                        </div>
                    </div>
                </asp:HyperLink>

                <asp:HyperLink runat="server" NavigateUrl="~/Shows" CssClass="block p-4 bg-gray-900 border border-gray-800 rounded-lg hover:shadow-lg">
                    <div class="flex items-center space-x-2">
                        <svg class="w-5 h-5 text-yellow-400" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M9 17v-6a1 1 0 0 1 1-1h4a1 1 0 0 1 1 1v6M5 7h14"></path></svg>
                        <div>
                            <div class="text-sm text-gray-400">Shows</div>
                            <div class="mt-1 text-white font-bold">Manage</div>
                        </div>
                    </div>
                </asp:HyperLink>

                <asp:HyperLink runat="server" NavigateUrl="~/Halls" CssClass="block p-4 bg-gray-900 border border-gray-800 rounded-lg hover:shadow-lg">
                    <div class="flex items-center space-x-2">
                        <svg class="w-5 h-5 text-yellow-400" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M3 7h18M6 7v10a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V7"></path></svg>
                        <div>
                            <div class="text-sm text-gray-400">Halls</div>
                            <div class="mt-1 text-white font-bold">Inventory</div>
                        </div>
                    </div>
                </asp:HyperLink>

                <asp:HyperLink runat="server" NavigateUrl="~/Tickets" CssClass="block p-4 bg-gray-900 border border-gray-800 rounded-lg hover:shadow-lg">
                    <div class="flex items-center space-x-2">
                        <svg class="w-5 h-5 text-yellow-400" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M3 10h18M7 6v12M17 6v12"></path></svg>
                        <div>
                            <div class="text-sm text-gray-400">Tickets</div>
                            <div class="mt-1 text-white font-bold">Sales</div>
                        </div>
                    </div>
                </asp:HyperLink>

                <asp:HyperLink runat="server" NavigateUrl="~/Customer" CssClass="block p-4 bg-gray-900 border border-gray-800 rounded-lg hover:shadow-lg">
                    <div class="flex items-center space-x-2">
                        <svg class="w-5 h-5 text-yellow-400" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M16 11c1.657 0 3-1.567 3-3.5S17.657 4 16 4s-3 1.567-3 3.5S14.343 11 16 11zM8 11c1.657 0 3-1.567 3-3.5S9.657 4 8 4 5 5.567 5 7.5 6.343 11 8 11zM3 20c0-3.333 2.667-6 6-6h6c3.333 0 6 2.667 6 6"></path></svg>
                        <div>
                            <div class="text-sm text-gray-400">Customers</div>
                            <div class="mt-1 text-white font-bold">Users</div>
                        </div>
                    </div>
                </asp:HyperLink>

                <asp:HyperLink runat="server" NavigateUrl="~/Halls" CssClass="block p-4 bg-gray-900 border border-gray-800 rounded-lg hover:shadow-lg">
                    <div class="flex items-center space-x-2">
                        <svg class="w-5 h-5 text-yellow-400" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M3 3h18v18H3z"></path></svg>
                        <div>
                            <div class="text-sm text-gray-400">Analytics</div>
                            <div class="mt-1 text-white font-bold">Top Halls</div>
                        </div>
                    </div>
                </asp:HyperLink>
            </div>
        </section>

        <!-- Locations and Top Movies -->
        <section class="mt-8 grid grid-cols-1 lg:grid-cols-3 gap-6">
            <!-- Locations card -->
            <div class="lg:col-span-1 bg-gradient-to-br from-gray-900 to-black p-6 rounded-lg border border-gray-800 shadow-sm">
                <div class="flex items-center justify-between">
                    <h3 class="text-yellow-400 font-semibold">Locations</h3>
                    <div class="text-sm text-green-400">+4.34%</div>
                </div>
                <div class="mt-4 space-y-3">
                    <asp:Repeater ID="rptHallsTheatre" runat="server" DataSourceID="sdsHallsForT010">
                        <ItemTemplate>
                            <div class="flex items-center justify-between">
                                <div class="flex items-center space-x-3">
                                    <span class="w-3 h-3 rounded-full" style='background-color:<%# Container.ItemIndex==0 ? "#F97316" : (Container.ItemIndex==1 ? "#FDE047" : (Container.ItemIndex==2 ? "#60A5FA" : "#34D399")) %>'></span>
                                    <div class="text-sm text-white"><%# Eval("H_NAME") %></div>
                                </div>
                                <div class="text-sm text-gray-300"><%# Eval("H_CAPACITY") %></div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>

                    <asp:SqlDataSource ID="sdsHallsForT010" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringQTX %>" ProviderName="<%$ ConnectionStrings:ConnectionStringQTX.ProviderName %>" SelectCommand="SELECT &quot;H_ID&quot;, &quot;H_NAME&quot;, &quot;H_CAPACITY&quot; FROM &quot;HALLS&quot; WHERE &quot;THR_ID&quot; = 'T010' ORDER BY &quot;H_NAME&quot;"></asp:SqlDataSource>
                </div>
            </div>

            <!-- Top movies -->
            <div class="lg:col-span-2 bg-gradient-to-br from-gray-900 to-black p-6 rounded-lg border border-gray-800 shadow-sm">
                <h3 class="text-yellow-400 font-semibold">Top Movies</h3>
                <div class="mt-4 grid grid-cols-1 sm:grid-cols-2 gap-4">
                    <asp:Repeater ID="rptTopMovies" runat="server" DataSourceID="sdsTopMovies">
                        <ItemTemplate>
                            <div class="p-4 bg-gray-800 rounded flex items-start space-x-4">
                                <div class="flex-shrink-0">
                                    <svg class="w-10 h-10 text-yellow-400" fill="currentColor" viewBox="0 0 24 24"><path d="M12 2a10 10 0 1 0 0 20 10 10 0 0 0 0-20zM8 10h8v2H8v-2zm0 4h5v2H8v-2z"/></svg>
                                </div>
                                <div>
                                    <div class="text-white font-semibold"><%# Eval("MV_TITLE") %></div>
                                    <div class="text-xs text-gray-400">Shows: <%# Eval("SHOW_COUNT") %></div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>

                    <asp:SqlDataSource ID="sdsTopMovies" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringQTX %>" ProviderName="<%$ ConnectionStrings:ConnectionStringQTX.ProviderName %>" SelectCommand="SELECT * FROM (SELECT M.&quot;MV_ID&quot; AS MV_ID, M.&quot;MV_TITLE&quot; AS MV_TITLE, COUNT(S.&quot;SW_ID&quot;) AS SHOW_COUNT FROM &quot;MOVIES&quot; M JOIN &quot;SHOWS&quot; S ON S.&quot;MV_ID&quot; = M.&quot;MV_ID&quot; GROUP BY M.&quot;MV_ID&quot;, M.&quot;MV_TITLE&quot; ORDER BY SHOW_COUNT DESC) WHERE ROWNUM &lt;= 5"></asp:SqlDataSource>
                </div>
            </div>
        </section>

    </main>
</asp:Content>
