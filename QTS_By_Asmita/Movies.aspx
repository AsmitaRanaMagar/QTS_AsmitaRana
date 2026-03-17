<%@ Page Title="Movies" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Movies.aspx.cs" Inherits="QTS_By_Asmita.Movies" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
     <main aria-labelledby="title">
    <div class="max-w-xl mx-auto my-6 font-sans">
        <div class="bg-black text-white border-2 border-yellow-400 rounded-lg shadow-sm p-4">
            <h3 class="text-lg font-semibold mb-4 text-yellow-400 text-center">
                Add Movie
                
            </h3>
            <asp:Panel ID="pnlAdd" runat="server">
                <div class="flex justify-center">
                    <div class="grid grid-cols-[120px_1fr] gap-x-3 gap-y-3 text-sm w-full max-w-md">
                        <asp:Label ID="lblMovieID" runat="server"
                            Text="Movie ID:"
                            AssociatedControlID="txtMovieID"
                            CssClass="font-medium leading-none self-center text-right" />
                        <asp:TextBox ID="txtMovieID" runat="server"
                            CssClass="w-full bg-transparent text-white border border-white rounded-md px-2 py-1"
                            required="required" />

                        <asp:Label ID="lblTitle" runat="server"
                            Text="Title:"
                            AssociatedControlID="txtTitle"
                            CssClass="font-medium leading-none self-center text-right" />
                        <asp:TextBox ID="txtTitle" runat="server"
                            CssClass="w-full bg-transparent text-white border border-white rounded-md px-2 py-1"
                            required="required" />

                        <asp:Label ID="lblGenre" runat="server"
                            Text="Genre:"
                            AssociatedControlID="txtGenre"
                            CssClass="font-medium leading-none self-center text-right" />
                        <asp:TextBox ID="txtGenre" runat="server"
                            CssClass="w-full bg-transparent text-white border border-white rounded-md px-2 py-1" />

                        <asp:Label ID="lblLang" runat="server"
                            Text="Language:"
                            AssociatedControlID="txtLang"
                            CssClass="font-medium leading-none self-center text-right" />
                        <asp:TextBox ID="txtLang" runat="server"
                            CssClass="w-full bg-transparent text-white border border-white rounded-md px-2 py-1" />

                        <asp:Label ID="lblRelease" runat="server"
                            Text="Release Date:"
                            AssociatedControlID="txtRelease"
                            CssClass="font-medium leading-none self-center text-right" />
                        <asp:TextBox ID="txtRelease" runat="server" TextMode="Date"
                            CssClass="w-full bg-transparent text-white border border-white rounded-md px-2 py-1" />

                        <asp:Label ID="lblDuration" runat="server"
                            Text="Duration (min):"
                            AssociatedControlID="txtDuration"
                            CssClass="font-medium leading-none self-center text-right" />
                        <asp:TextBox ID="txtDuration" runat="server" TextMode="Number"
                            CssClass="w-full bg-transparent text-white border border-white rounded-md px-2 py-1" />

                        <asp:Label ID="lblDesc" runat="server"
                            Text="Description:"
                            AssociatedControlID="txtDesc"
                            CssClass="font-medium leading-none self-center text-right" />
                        <asp:TextBox ID="txtDesc" runat="server" TextMode="MultiLine"
                            CssClass="w-full bg-transparent text-white border border-white rounded-md px-2 py-1 min-h-12" Rows="3" />

                        <div class="col-span-2 flex justify-center">
                            <asp:Label ID="lblMovieWarning" runat="server" Text="" CssClass="text-sm text-red-500 text-center w-full max-w-md" Visible="false" Role="alert"></asp:Label>
                        </div>

                        <div class="col-span-2 flex justify-center mt-4">
                            <asp:Button ID="btnAddMovie" runat="server"
                                Text="Add Movie"
                                OnClick="AddMovie_Click"
                                CssClass="px-4 py-1 text-sm rounded-md"
                                Style="background:var(--gold); color:#000; border:none;" />
                        </div>
                    </div>
                </div>
            </asp:Panel>
        </div>
    </div>

    <!-- New section: select a movie and show top 3 halls by occupancy -->
    <div class="max-w-6xl mx-auto my-6 font-sans">
        <div class="bg-black text-white border-2 border-yellow-400 rounded-lg shadow-sm p-4">
            <h3 class="text-lg font-semibold mb-4 text-yellow-400 text-center">Top 3 Halls by Occupancy for Selected Movie</h3>
            <div class="flex justify-center mb-4">
                &nbsp;&nbsp;&nbsp;&nbsp; Select Movies:&nbsp;&nbsp;
                <asp:DropDownList ID="ddlMovieSelect" runat="server" AutoPostBack="True" CssClass="w-full max-w-md bg-transparent text-white border border-white rounded-md px-2 py-1 custom-select" OnSelectedIndexChanged="DdlMovieSelect_SelectedIndexChanged" DataSourceID="SqlDataSourceMovies" DataTextField="MV_TITLE" DataValueField="MV_ID">
                    <asp:ListItem Text="Select movie" Value="" />
                </asp:DropDownList>
            </div>

            <!-- Repeater for top 3 halls -->
            <asp:Repeater ID="rptTopHalls" runat="server" DataSourceID="SqlDataSourceOccupancy" OnItemCommand="RptTopHalls_ItemCommand">
                <HeaderTemplate>
                    <div class="grid grid-cols-1 md:grid-cols-3 gap-4 max-w-4xl mx-auto">
                </HeaderTemplate>
                <ItemTemplate>
                    <div class="p-4 border border-yellow-400 rounded-md bg-black/40">
                        <div class="text-sm text-yellow-400 font-semibold">Rank <%# Container.ItemIndex + 1 %></div>
                        <div class="mt-2 text-white text-sm"><strong>Theatre:</strong> <%# Eval("THR_NAME") %></div>
                        <div class="text-white text-sm"><strong>City:</strong> <%# Eval("THR_CITY") %></div>
                        <div class="text-white text-sm"><strong>Hall:</strong> <%# Eval("H_ID") %></div>
                        <div class="text-white text-sm"><strong>Occupancy:</strong> <%# string.Format("{0:N2}%", Eval("OCCUPANCY_PCT")) %></div>
                    </div>
                </ItemTemplate>
                <FooterTemplate>
                    </div>
                </FooterTemplate>
            </asp:Repeater>

            <asp:Label ID="lblNoTopHalls" runat="server" Text="No halls found for selected movie" CssClass="text-sm text-white" Visible="false"></asp:Label>

            <asp:SqlDataSource ID="SqlDataSourceMovies" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringQTX %>" ProviderName="<%$ ConnectionStrings:ConnectionStringQTX.ProviderName %>" SelectCommand='SELECT "MV_ID", "MV_TITLE" FROM "MOVIES" ORDER BY "MV_TITLE"'>
            </asp:SqlDataSource>

            <asp:SqlDataSource ID="SqlDataSourceOccupancy" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringQTX %>" ProviderName="<%$ ConnectionStrings:ConnectionStringQTX.ProviderName %>"
                SelectCommand="SELECT * FROM (SELECT h.&quot;H_ID&quot; AS &quot;H_ID&quot;, th.&quot;THR_NAME&quot; AS &quot;THR_NAME&quot;, th.&quot;THR_CITY&quot; AS &quot;THR_CITY&quot;, NVL(SUM(t.&quot;TK_QUANTITY&quot;),0) AS PAID_TICKETS, h.&quot;H_CAPACITY&quot; AS &quot;H_CAPACITY&quot;, CASE WHEN h.&quot;H_CAPACITY&quot; IS NULL OR h.&quot;H_CAPACITY&quot; = 0 THEN 0 ELSE (NVL(SUM(t.&quot;TK_QUANTITY&quot;),0) / h.&quot;H_CAPACITY&quot;) * 100 END AS OCCUPANCY_PCT FROM &quot;HALLS&quot; h JOIN &quot;THEATRES&quot; th ON h.&quot;THR_ID&quot; = th.&quot;THR_ID&quot; JOIN &quot;SHOWS&quot; s ON s.&quot;H_ID&quot; = h.&quot;H_ID&quot; LEFT JOIN &quot;TICKETS&quot; t ON t.&quot;SW_ID&quot; = s.&quot;SW_ID&quot; AND t.&quot;TK_STATUS&quot; = 'Paid' WHERE s.&quot;MV_ID&quot; = :MOVIE_ID GROUP BY h.&quot;H_ID&quot;, th.&quot;THR_NAME&quot;, th.&quot;THR_CITY&quot;, h.&quot;H_CAPACITY&quot; ORDER BY OCCUPANCY_PCT DESC) WHERE ROWNUM &lt;= 3"
                OnSelected="SqlDataSourceOccupancy_Selected">
                <SelectParameters>
                    <asp:ControlParameter Name="MOVIE_ID" ControlID="ddlMovieSelect" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </div>

      <div class="max-w-6xl mx-auto my-6 font-sans">
             <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="MOVIE_ID" CssClass="min-w-full table-auto" PageSize="10" HeaderStyle-CssClass="bg-yellow-400 text-black font-bold text-sm text-left" RowStyle-CssClass="text-white align-top" AlternatingRowStyle-CssClass="bg-black/5 text-white align-top" EditRowStyle-CssClass="bg-black text-white">
                 <Columns>
                     <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                     <asp:BoundField DataField="MOVIE_ID" HeaderText="Id" ReadOnly="True" SortExpression="MOVIE_ID" />

                     <asp:TemplateField HeaderText="Title" SortExpression="MOVIE_TITLE">
                         <ItemTemplate>
                             <%# Eval("MOVIE_TITLE") %>
                         </ItemTemplate>
                         <EditItemTemplate>
                             <asp:TextBox ID="txtEditTitle" runat="server" CssClass="w-full bg-transparent text-white border border-white rounded-md px-2 py-1" Text='<%# Bind("MOVIE_TITLE") %>' />
                         </EditItemTemplate>
                     </asp:TemplateField>

                     <asp:TemplateField HeaderText="Genre" SortExpression="GENRE">
                         <ItemTemplate>
                             <%# Eval("GENRE") %>
                         </ItemTemplate>
                         <EditItemTemplate>
                             <asp:TextBox ID="txtEditGenre" runat="server" CssClass="w-full bg-transparent text-white border border-white rounded-md px-2 py-1" Text='<%# Bind("GENRE") %>' />
                         </EditItemTemplate>
                     </asp:TemplateField>

                     <asp:TemplateField HeaderText="Language" SortExpression="LANGUAGE">
                         <ItemTemplate>
                             <%# Eval("LANGUAGE") %>
                         </ItemTemplate>
                         <EditItemTemplate>
                             <asp:TextBox ID="txtEditLang" runat="server" CssClass="w-full bg-transparent text-white border border-white rounded-md px-2 py-1" Text='<%# Bind("LANGUAGE") %>' />
                         </EditItemTemplate>
                     </asp:TemplateField>

                     <asp:TemplateField HeaderText="Release Date" SortExpression="RELEASE_DATE">
                         <ItemTemplate>
                             <%# Eval("RELEASE_DATE", "{0:yyyy-MM-dd}") %>
                         </ItemTemplate>
                         <EditItemTemplate>
                             <asp:TextBox ID="txtEditRelease" runat="server" TextMode="Date" CssClass="w-full bg-transparent text-white border border-white rounded-md px-2 py-1" Text='<%# Bind("RELEASE_DATE", "{0:yyyy-MM-dd}") %>' />
                         </EditItemTemplate>
                     </asp:TemplateField>

                     <asp:TemplateField HeaderText="Duration" SortExpression="DURATION">
                         <ItemTemplate>
                             <%# Eval("DURATION") %>
                         </ItemTemplate>
                         <EditItemTemplate>
                             <asp:TextBox ID="txtEditDuration" runat="server" TextMode="Number" CssClass="w-full bg-transparent text-white border border-white rounded-md px-2 py-1" Text='<%# Bind("DURATION") %>' />
                         </EditItemTemplate>
                     </asp:TemplateField>

                     <asp:TemplateField HeaderText="Description" SortExpression="DESCRIPTION">
                         <ItemTemplate>
                             <%# Eval("DESCRIPTION") %>
                         </ItemTemplate>
                         <EditItemTemplate>
                             <asp:TextBox ID="txtEditDesc" runat="server" TextMode="MultiLine" Rows="2" CssClass="w-full bg-transparent text-white border border-white rounded-md px-2 py-1" Text='<%# Bind("DESCRIPTION") %>' />
                         </EditItemTemplate>
                     </asp:TemplateField>
                 </Columns>
             </asp:GridView>
             <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringQTX %>"
                 SelectCommand='SELECT "MV_ID" AS "MOVIE_ID", "MV_TITLE" AS "MOVIE_TITLE", "MV_GENRE" AS "GENRE", "MV_LANG" AS "LANGUAGE", "MV_RELEASE" AS "RELEASE_DATE", "MV_DURATION" AS "DURATION", "MV_DESC" AS "DESCRIPTION" FROM "MOVIES"'
                 DeleteCommand='DELETE FROM "MOVIES" WHERE "MV_ID" = :MOVIE_ID'
                 InsertCommand='INSERT INTO "MOVIES" ("MV_ID", "MV_TITLE", "MV_GENRE", "MV_LANG", "MV_RELEASE", "MV_DURATION", "MV_DESC") VALUES (:MOVIE_ID, :MOVIE_TITLE, :GENRE, :LANGUAGE, :RELEASE_DATE, :DURATION, :DESCRIPTION)'
                 UpdateCommand='UPDATE "MOVIES" SET "MV_TITLE" = :MOVIE_TITLE, "MV_GENRE" = :GENRE, "MV_LANG" = :LANGUAGE, "MV_RELEASE" = :RELEASE_DATE, "MV_DURATION" = :DURATION, "MV_DESC" = :DESCRIPTION WHERE "MV_ID" = :MOVIE_ID'
                 ProviderName="<%$ ConnectionStrings:ConnectionStringQTX.ProviderName %>">
                 <DeleteParameters>
                     <asp:Parameter Name="MOVIE_ID" Type="String" />
                 </DeleteParameters>
                 <InsertParameters>
                     <asp:ControlParameter Name="MOVIE_ID" ControlID="txtMovieID" PropertyName="Text" Type="String" />
                     <asp:ControlParameter Name="MOVIE_TITLE" ControlID="txtTitle" PropertyName="Text" Type="String" />
                     <asp:ControlParameter Name="GENRE" ControlID="txtGenre" PropertyName="Text" Type="String" />
                     <asp:ControlParameter Name="LANGUAGE" ControlID="txtLang" PropertyName="Text" Type="String" />
                     <asp:Parameter Name="RELEASE_DATE" Type="DateTime" />
                     <asp:Parameter Name="DURATION" Type="Decimal" />
                     <asp:ControlParameter Name="DESCRIPTION" ControlID="txtDesc" PropertyName="Text" Type="String" />
                 </InsertParameters>
                 <UpdateParameters>
                     <asp:Parameter Name="MOVIE_TITLE" Type="String" />
                     <asp:Parameter Name="GENRE" Type="String" />
                     <asp:Parameter Name="LANGUAGE" Type="String" />
                     <asp:Parameter Name="RELEASE_DATE" Type="DateTime" />
                     <asp:Parameter Name="DURATION" Type="Decimal" />
                     <asp:Parameter Name="DESCRIPTION" Type="String" />
                     <asp:Parameter Name="MOVIE_ID" Type="String" />
                 </UpdateParameters>
             </asp:SqlDataSource>
         </div>
 
     </main>
 </asp:Content>
