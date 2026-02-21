<%@ Page Title="Dashboard"
Language="C#"
MasterPageFile="~/Site.Master"
AutoEventWireup="true"
CodeBehind="Default.aspx.cs"
Inherits="QTS_By_Asmita.Default" %>

<asp:Content ID="BodyContent"
ContentPlaceHolderID="MainContent"
runat="server">

<main class="max-w-7xl mx-auto px-6 py-8">
    <!-- SUMMARY CARDS -->
    <section class="grid grid-cols-1 md:grid-cols-3 gap-6">

        <!-- Customers -->
        <div class="bg-gradient-to-br from-gray-900 to-black p-6 rounded-lg border border-gray-800 shadow hover:shadow-lg transition">

            <div class="flex items-center justify-between">

                <div>
                    <p class="text-gray-400 text-sm">Total Customers</p>

                    <h2 class="text-3xl font-bold text-white mt-1">
                        <asp:Label ID="lblTotalCustomers"
                        runat="server"
                        Text="0" />
                    </h2>
                </div>

                <div class="bg-yellow-400/10 p-3 rounded-full">

                    <svg class="w-6 h-6 text-yellow-400"
                    fill="currentColor"
                    viewBox="0 0 24 24">

                        <path d="M12 12c2.7 0 5-2.3 5-5s-2.3-5-5-5-5 2.3-5 5 2.3 5 5 5zm0 2c-3.3 0-10 1.7-10 5v3h20v-3c0-3.3-6.7-5-10-5z"/>

                    </svg>

                </div>

            </div>

        </div>


        <!-- Movies -->
        <div class="bg-gradient-to-br from-gray-900 to-black p-6 rounded-lg border border-gray-800 shadow hover:shadow-lg transition">

            <div class="flex items-center justify-between">

                <div>

                    <p class="text-gray-400 text-sm">Total Movies</p>

                    <h2 class="text-3xl font-bold text-white mt-1">

                        <asp:Label ID="lblTotalMovies"
                        runat="server"
                        Text="0" />

                    </h2>

                </div>

                <div class="bg-yellow-400/10 p-3 rounded-full">

                    <svg class="w-6 h-6 text-yellow-400"
                    fill="currentColor"
                    viewBox="0 0 24 24">

                        <path d="M4 4h16v16H4V4zm3 2v4h4V6H7zm6 0v4h4V6h-4zM7 12v4h4v-4H7zm6 0v4h4v-4h-4z"/>

                    </svg>

                </div>

            </div>

        </div>


        <!-- Shows Today -->
        <div class="bg-gradient-to-br from-gray-900 to-black p-6 rounded-lg border border-gray-800 shadow hover:shadow-lg transition">

            <div class="flex items-center justify-between">

                <div>

                    <p class="text-gray-400 text-sm">Active Shows Today</p>

                    <h2 class="text-3xl font-bold text-white mt-1">

                        <asp:Label ID="lblTotalShowsToday"
                        runat="server"
                        Text="0" />

                    </h2>

                </div>

                <div class="bg-yellow-400/10 p-3 rounded-full">

                    <svg class="w-6 h-6 text-yellow-400"
                    fill="none"
                    stroke="currentColor"
                    stroke-width="2"
                    viewBox="0 0 24 24">

                        <path d="M8 7V3m8 4V3M3 11h18M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"/>

                    </svg>

                </div>

            </div>

        </div>

    </section>


    <!-- QUICK ACTIONS -->
    <section class="mt-10">

        <h2 class="text-yellow-400 font-semibold mb-4">
            Quick Actions
        </h2>

        <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-5 gap-6">

            <!-- Movies -->
            <asp:HyperLink runat="server"
            NavigateUrl="~/Movies"
            CssClass="block bg-gradient-to-br from-gray-900 to-black p-6 rounded-lg border border-gray-800 hover:shadow-lg transition text-center flex flex-col items-center justify-center min-h-28">

                <svg class="w-7 h-7 text-yellow-400 mb-3" viewBox="0 0 24 24" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                    <path d="M3 7.5V19a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V7.5H3z"/>
                    <path d="M21 5.5L17 2 10 6l-7-1V6h18z"/>
                </svg>

                <span class="text-white text-sm font-semibold">
                    Movies
                </span>

            </asp:HyperLink>


            <!-- Shows -->
            <asp:HyperLink runat="server"
            NavigateUrl="~/Shows"
            CssClass="block bg-gradient-to-br from-gray-900 to-black p-6 rounded-lg border border-gray-800 hover:shadow-lg transition text-center flex flex-col items-center justify-center min-h-28">

                <svg class="w-7 h-7 text-yellow-400 mb-3" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" xmlns="http://www.w3.org/2000/svg">
                    <rect x="3" y="5" width="18" height="16" rx="2"/>
                    <path d="M16 3v4M8 3v4" stroke-linecap="round" stroke-linejoin="round"/>
                </svg>

                <span class="text-white text-sm font-semibold">
                    Shows
                </span>

            </asp:HyperLink>


            <!-- Halls -->
            <asp:HyperLink runat="server"
            NavigateUrl="~/Halls"
            CssClass="block bg-gradient-to-br from-gray-900 to-black p-6 rounded-lg border border-gray-800 hover:shadow-lg transition text-center flex flex-col items-center justify-center min-h-28">

                <svg class="w-7 h-7 text-yellow-400 mb-3" viewBox="0 0 24 24" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                    <path d="M4 21h16V3H4v18zM8 7h2v2H8V7zm0 4h2v2H8v-2zM14 7h2v2h-2V7z"/>
                </svg>

                <span class="text-white text-sm font-semibold">
                    Halls
                </span>

            </asp:HyperLink>


            <!-- Tickets -->
            <asp:HyperLink runat="server"
            NavigateUrl="~/Tickets"
            CssClass="block bg-gradient-to-br from-gray-900 to-black p-6 rounded-lg border border-gray-800 hover:shadow-lg transition text-center flex flex-col items-center justify-center min-h-28">

                <svg class="w-7 h-7 text-yellow-400 mb-3" viewBox="0 0 24 24" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                    <path d="M2 10a2 2 0 0 1 2-2h2v8H4a2 2 0 0 1-2-2v-4zM20 8h-2v8h2a2 2 0 0 0 2-2v-4a2 2 0 0 0-2-2zM8 8h8v8H8V8z"/>
                </svg>

                <span class="text-white text-sm font-semibold">
                    Tickets
                </span>

            </asp:HyperLink>


            <!-- Customers -->
            <asp:HyperLink runat="server"
            NavigateUrl="~/Customer"
            CssClass="block bg-gradient-to-br from-gray-900 to-black p-6 rounded-lg border border-gray-800 hover:shadow-lg transition text-center flex flex-col items-center justify-center min-h-28">

                <svg class="w-7 h-7 text-yellow-400 mb-3" viewBox="0 0 24 24" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                    <path d="M12 12a4 4 0 1 0 0-8 4 4 0 0 0 0 8zM4 20a8 8 0 0 1 16 0H4z"/>
                </svg>

                <span class="text-white text-sm font-semibold">
                    Customers
                </span>

            </asp:HyperLink>

        </div>

    </section>



    <!-- LOWER SECTION -->
    <section class="mt-10 grid lg:grid-cols-3 gap-6">


        <!-- HALLS -->
        <div class="bg-gradient-to-br from-gray-900 to-black p-6 rounded-lg border border-gray-800">

            <h3 class="text-yellow-400 font-semibold mb-4">
                Theatre Halls
            </h3>

            <asp:Repeater ID="rptHallsTheatre"
            runat="server"
            DataSourceID="sdsHallsForT010">

                <ItemTemplate>

                    <div class="flex justify-between border-b border-gray-800 py-2">

                        <span class="text-white">
                            <%# Eval("H_NAME") %>
                        </span>

                        <span class="text-gray-400">
                            <%# Eval("H_CAPACITY") %> seats
                        </span>

                    </div>

                </ItemTemplate>

            </asp:Repeater>

        </div>



        <!-- TOP MOVIES TABLE -->
        <div class="lg:col-span-2 bg-gradient-to-br from-gray-900 to-black p-6 rounded-lg border border-gray-800">

            <h3 class="text-yellow-400 font-semibold mb-4">
                Top Movies
            </h3>

            <table class="w-full">

                <thead>

                    <tr class="text-gray-400 text-sm border-b border-gray-800">

                        <th class="py-2 text-left">Movie</th>

                        <th class="py-2 text-left">Genre</th>

                        <th class="py-2 text-left">Duration</th>

                        <th class="py-2 text-center">Shows</th>

                    </tr>

                </thead>

                <tbody>

                    <asp:Repeater ID="rptTopMovies"
                    runat="server"
                    DataSourceID="sdsTopMovies">

                        <ItemTemplate>

                            <tr class="border-b border-gray-800 hover:bg-gray-800">

                                <td class="py-3 text-white">
                                    <%# Eval("MV_TITLE") %>
                                </td>

                                <td class="text-gray-400">
                                    <%# Eval("GENRE") %>
                                </td>

                                <td class="text-gray-400">
                                    <%# Eval("DURATION") %> min
                                </td>

                                <td class="text-center">

                                    <span class="bg-yellow-400 text-black px-2 py-1 rounded text-xs font-bold">

                                        <%# Eval("SHOW_COUNT") %>

                                    </span>

                                </td>

                            </tr>

                        </ItemTemplate>

                    </asp:Repeater>

                </tbody>

            </table>

        </div>

    </section>


    <!-- Data sources for counts -->
    <asp:SqlDataSource ID="sdsCustomersCount" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringQTX %>" ProviderName="<%$ ConnectionStrings:ConnectionStringQTX.ProviderName %>" SelectCommand="SELECT COUNT(*) AS CNT FROM &quot;CUSTOMERS&quot;;"></asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsMoviesCount" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringQTX %>" ProviderName="<%$ ConnectionStrings:ConnectionStringQTX.ProviderName %>" SelectCommand="SELECT COUNT(*) AS CNT FROM &quot;MOVIES&quot;;"></asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsShowsTodayCount" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringQTX %>" ProviderName="<%$ ConnectionStrings:ConnectionStringQTX.ProviderName %>" SelectCommand="SELECT COUNT(*) AS CNT FROM &quot;SHOWS&quot; WHERE TRUNC(&quot;SW_DATE&quot;) = TRUNC(SYSDATE)"></asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsHallsForT010" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringQTX %>" ProviderName="<%$ ConnectionStrings:ConnectionStringQTX.ProviderName %>" SelectCommand="SELECT &quot;H_ID&quot;, &quot;H_NAME&quot;, &quot;H_CAPACITY&quot; FROM &quot;HALLS&quot; WHERE &quot;THR_ID&quot; = 'T010' ORDER BY &quot;H_NAME&quot;"></asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsTopMovies" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringQTX %>" ProviderName="<%$ ConnectionStrings:ConnectionStringQTX.ProviderName %>" SelectCommand='SELECT * FROM (SELECT M.&quot;MV_ID&quot; AS MV_ID, M.&quot;MV_TITLE&quot; AS MV_TITLE, M.&quot;MV_GENRE&quot; AS GENRE, M.&quot;MV_DURATION&quot; AS DURATION, M.&quot;MV_RELEASE&quot; AS RELEASE_DATE, M.&quot;MV_LANG&quot; AS LANGUAGE, COUNT(S.&quot;SW_ID&quot;) AS SHOW_COUNT FROM &quot;MOVIES&quot; M JOIN &quot;SHOWS&quot; S ON S.&quot;MV_ID&quot; = M.&quot;MV_ID&quot; GROUP BY M.&quot;MV_ID&quot;, M.&quot;MV_TITLE&quot;, M.&quot;MV_GENRE&quot;, M.&quot;MV_DURATION&quot;, M.&quot;MV_RELEASE&quot;, M.&quot;MV_LANG&quot; ORDER BY SHOW_COUNT DESC) WHERE ROWNUM &lt;= 5'></asp:SqlDataSource>

</main>

</asp:Content>