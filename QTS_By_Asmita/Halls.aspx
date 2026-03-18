<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Halls.aspx.cs" Inherits="QTS_By_Asmita.Halls" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
    <div class="max-w-xl mx-auto my-6 font-sans">
        <div class="bg-black text-white border-2 border-yellow-400 rounded-lg shadow-sm p-4">
            <h3 class="text-lg font-semibold mb-4 text-yellow-400 text-center">
                Add New Hall
            </h3>
            <asp:Panel ID="pnlAdd" runat="server">
                <div class="flex justify-center">
                    <div class="grid grid-cols-[120px_1fr] gap-x-3 gap-y-3 text-sm w-full max-w-md">
                        <asp:Label ID="lblHallID" runat="server"
                            Text="Hall ID:"
                            AssociatedControlID="txtHallID"
                            CssClass="font-medium leading-none self-center text-right" />
                        <asp:TextBox ID="txtHallID" runat="server"
                            CssClass="w-full bg-transparent text-white border border-white rounded-md px-2 py-1"
                            required="required" />

                        <asp:Label ID="lblTheaterID" runat="server"
                            Text="Theater:"
                            AssociatedControlID="ddlTheaterID"
                            CssClass="font-medium leading-none self-center text-right" />
                        <asp:DropDownList ID="ddlTheaterID" runat="server" DataSourceID="SqlDataSourceTheatres" DataTextField="THR_NAME" DataValueField="THR_ID" CssClass="w-full bg-transparent text-white border border-white rounded-md px-2 py-1 custom-select" AppendDataBoundItems="true">
                            <asp:ListItem Text="Select theatre" Value="" />
                        </asp:DropDownList>

                        <asp:Label ID="lblHallName" runat="server"
                            Text="Hall Name:"
                            AssociatedControlID="txtHallName"
                            CssClass="font-medium leading-none self-center text-right" />
                        <asp:TextBox ID="txtHallName" runat="server"
                            CssClass="w-full bg-transparent text-white border border-white rounded-md px-2 py-1" />

                        <asp:Label ID="lblCapacity" runat="server"
                            Text="Capacity:"
                            AssociatedControlID="txtCapacity"
                            CssClass="font-medium leading-none self-center text-right" />
                        <asp:TextBox ID="txtCapacity" runat="server" TextMode="Number"
                            CssClass="w-full bg-transparent text-white border border-white rounded-md px-2 py-1" />

                        <asp:Label ID="lblStatus" runat="server"
                            Text="Status:"
                            AssociatedControlID="txtStatus"
                            CssClass="font-medium leading-none self-center text-right" />
                        <asp:TextBox ID="txtStatus" runat="server"
                            CssClass="w-full bg-transparent text-white border border-white rounded-md px-2 py-1" />

                        <div class="col-span-2 flex justify-center mb-3">
                            <asp:Label ID="lblHallWarning" runat="server" Text="" CssClass="text-sm text-red-500 text-center w-full max-w-md" Visible="false" Role="alert"></asp:Label>
                        </div>
                        <div class="col-span-2 flex justify-center mt-4">
                            <asp:Button ID="btnAddHall" runat="server"
                                Text="Add Hall"
                                OnClick="AddHall_Click"
                                CssClass="px-4 py-1 text-sm rounded-md"
                                Style="background:var(--gold); color:#000; border:none;" />
                        </div>
                    </div>
                </div>
            </asp:Panel>
        </div>
    </div>

    
    <div class="max-w-xl mx-auto my-6 font-sans">
        <div class="bg-black text-white border-2 border-yellow-400 rounded-lg shadow-sm p-4">
            <h3 class="text-lg font-semibold mb-4 text-yellow-400 text-center">Select Hall for QTX</h3>

            <asp:SqlDataSource ID="SqlDataSourceHallsSelect" runat="server"
                ConnectionString="<%$ ConnectionStrings:ConnectionStringQTX %>"
                ProviderName="<%$ ConnectionStrings:ConnectionStringQTX.ProviderName %>"
                SelectCommand="SELECT H.&quot;H_ID&quot;, H.&quot;H_NAME&quot; FROM &quot;HALLS&quot; 
                H JOIN &quot;THEATRES&quot; T ON H.&quot;THR_ID&quot; = T.&quot;THR_ID&quot; 
                WHERE T.&quot;THR_ID&quot; = 'T010' ORDER BY H.&quot;H_NAME&quot;">
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
                <asp:BoundField DataField="SW_PRICE" HeaderText="Show Price" />
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

            <div class="max-w-6xl mx-auto my-6 font-sans">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="H_ID" DataSourceID="SqlDataSource1" CssClass="min-w-full table-auto" PageSize="10" HeaderStyle-CssClass="bg-yellow-400 text-black font-bold text-sm text-left" RowStyle-CssClass="text-white align-top" AlternatingRowStyle-CssClass="bg-black/5 text-white align-top" EditRowStyle-CssClass="bg-black text-white">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                        <asp:BoundField DataField="H_ID" HeaderText="Id" ReadOnly="True" SortExpression="H_ID" />

                        <asp:TemplateField HeaderText="Theater" SortExpression="THR_ID">
                            <ItemTemplate>
                                <%# Eval("THR_ID") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlEditTheatre" runat="server" CssClass="w-full bg-transparent text-white border border-white rounded-md px-2 py-1 custom-select" DataSourceID="SqlDataSourceTheatres" DataTextField="THR_NAME" DataValueField="THR_ID" AppendDataBoundItems="true" SelectedValue='<%# Bind("THR_ID") %>'>
                                    <asp:ListItem Text="Select theatre" Value="" />
                                </asp:DropDownList>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Name" SortExpression="H_NAME">
                            <ItemTemplate>
                                <%# Eval("H_NAME") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtEditHallName" runat="server" CssClass="w-full bg-transparent text-white border border-white rounded-md px-2 py-1" Text='<%# Bind("H_NAME") %>' />
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Capacity" SortExpression="H_CAPACITY">
                            <ItemTemplate>
                                <%# Eval("H_CAPACITY") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtEditCapacity" runat="server" TextMode="Number" CssClass="w-full bg-transparent text-white border border-white rounded-md px-2 py-1" Text='<%# Bind("H_CAPACITY") %>' />
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Status" SortExpression="H_STATUS">
                            <ItemTemplate>
                                <%# Eval("H_STATUS") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtEditStatus" runat="server" CssClass="w-full bg-transparent text-white border border-white rounded-md px-2 py-1" Text='<%# Bind("H_STATUS") %>' />
                            </EditItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                    ConnectionString="<%$ ConnectionStrings:ConnectionStringQTX %>"
                    ProviderName="<%$ ConnectionStrings:ConnectionStringQTX.ProviderName %>"
                    SelectCommand="SELECT * FROM &quot;HALLS&quot;"
                    DeleteCommand="DELETE FROM &quot;HALLS&quot; WHERE &quot;H_ID&quot; = :H_ID"
                    InsertCommand="INSERT INTO &quot;HALLS&quot; (&quot;H_ID&quot;, &quot;THR_ID&quot;, &quot;H_NAME&quot;, &quot;H_CAPACITY&quot;, &quot;H_STATUS&quot;) VALUES (:H_ID, :THR_ID, :H_NAME, :H_CAPACITY, :H_STATUS)"
                    UpdateCommand="UPDATE &quot;HALLS&quot; SET &quot;THR_ID&quot; = :THR_ID, &quot;H_NAME&quot; = :H_NAME, &quot;H_CAPACITY&quot; = :H_CAPACITY, &quot;H_STATUS&quot; = :H_STATUS WHERE &quot;H_ID&quot; = :H_ID">
                    <DeleteParameters>
                        <asp:Parameter Name="H_ID" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:ControlParameter Name="H_ID" ControlID="txtHallID" PropertyName="Text" Type="String" />
                        <asp:ControlParameter Name="THR_ID" ControlID="ddlTheaterID" PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter Name="H_NAME" ControlID="txtHallName" PropertyName="Text" Type="String" />
                        <asp:Parameter Name="H_CAPACITY" Type="Decimal" />
                        <asp:ControlParameter Name="H_STATUS" ControlID="txtStatus" PropertyName="Text" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="THR_ID" Type="String" />
                        <asp:Parameter Name="H_NAME" Type="String" />
                        <asp:Parameter Name="H_CAPACITY" Type="Decimal" />
                        <asp:Parameter Name="H_STATUS" Type="String" />
                        <asp:Parameter Name="H_ID" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceTheatres" runat="server"
                    ConnectionString="<%$ ConnectionStrings:ConnectionStringQTX %>"
                    ProviderName="<%$ ConnectionStrings:ConnectionStringQTX.ProviderName %>"
                    SelectCommand="SELECT THR_ID, THR_NAME FROM THEATRES ORDER BY THR_ID">
                </asp:SqlDataSource>
            </div>
    </div>

</main>
</asp:Content>