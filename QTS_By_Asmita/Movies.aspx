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
      <div class="max-w-6xl mx-auto my-6 font-sans">
             <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="MOVIE_ID" CssClass="min-w-full table-auto" PageSize="10" HeaderStyle-CssClass="bg-yellow-400 text-black font-bold text-sm text-left" RowStyle-CssClass="text-white align-top" AlternatingRowStyle-CssClass="bg-black/5 text-white align-top" EditRowStyle-CssClass="bg-black text-white">
                 <Columns>
                     <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                     <asp:BoundField DataField="MOVIE_ID" HeaderText="Id" ReadOnly="True" SortExpression="MOVIE_ID" />
                     <asp:BoundField DataField="MOVIE_TITLE" HeaderText="Title" SortExpression="MOVIE_TITLE" />
                     <asp:BoundField DataField="GENRE" HeaderText="Genre" SortExpression="GENRE" />
                     <asp:BoundField DataField="LANGUAGE" HeaderText="Language" SortExpression="LANGUAGE" />
                     <asp:BoundField DataField="RELEASE_DATE" HeaderText="Release Date" SortExpression="RELEASE_DATE" DataFormatString="{0:yyyy-MM-dd}" />
                     <asp:BoundField DataField="DURATION" HeaderText="Duration" SortExpression="DURATION" />
                     <asp:BoundField DataField="DESCRIPTION" HeaderText="Description" SortExpression="DESCRIPTION" />
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
