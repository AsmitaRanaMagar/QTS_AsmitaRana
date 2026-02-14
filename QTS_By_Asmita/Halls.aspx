<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Halls.aspx.cs" Inherits="QTS_By_Asmita.Halls" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
     <div class="max-w-xl mx-auto my-6 font-sans">
         <div class="bg-black text-white border-2 border-yellow-400 rounded-lg shadow-sm p-4">
             <asp:Panel ID="pnlAdd" runat="server">
                 <div class="grid grid-cols-1 md:grid-cols-3 gap-3 items-center text-sm">

                     <h3 class="text-lg font-semibold mb-3 text-yellow-400 md:col-span-3 text-center">Add New Hall</h3>

                     <asp:Label ID="lblHallID" runat="server" Text="Hall ID:" AssociatedControlID="txtHallID" CssClass="font-medium md:col-span-1" />
                     <asp:TextBox ID="txtHallID" runat="server" CssClass="w-full bg-transparent text-white border border-white rounded-md text-sm px-2 py-1 md:col-span-2" required="required" />

                     <asp:Label ID="lblTheaterID" runat="server" Text="Theater ID:" AssociatedControlID="txtTheaterID" CssClass="font-medium md:col-span-1" />
                     <asp:DropDownList ID="ddlTheaterID" runat="server" DataSourceID="SqlDataSourceTheatres" DataTextField="THR_ID" DataValueField="THR_ID" CssClass="w-full bg-transparent text-white border border-white rounded-md text-sm px-2 py-1 md:col-span-2" AppendDataBoundItems="true">
                        <asp:ListItem Text="Select theatre" Value="" />
                     </asp:DropDownList>

                     <asp:Label ID="lblHallName" runat="server" Text="Hall Name:" AssociatedControlID="txtHallName" CssClass="font-medium md:col-span-1" />
                     <asp:TextBox ID="txtHallName" runat="server" CssClass="w-full bg-transparent text-white border border-white rounded-md text-sm px-2 py-1 md:col-span-2" />

                     <asp:Label ID="lblCapacity" runat="server" Text="Capacity:" AssociatedControlID="txtCapacity" CssClass="font-medium md:col-span-1" />
                     <asp:TextBox ID="txtCapacity" runat="server" TextMode="Number" CssClass="w-full bg-transparent text-white border border-white rounded-md text-sm px-2 py-1 md:col-span-2" />

                     <asp:Label ID="lblStatus" runat="server" Text="Status:" AssociatedControlID="txtStatus" CssClass="font-medium md:col-span-1" />
                     <asp:TextBox ID="txtStatus" runat="server" CssClass="w-full bg-transparent text-white border border-white rounded-md text-sm px-2 py-1 md:col-span-2" />

                     <div class="md:col-span-3 text-center">
                         <asp:Button ID="btnAddHall" runat="server" CssClass="px-3 py-1 text-sm rounded-md" Text="Add Hall" OnClick="AddHall_Click" Style="background:var(--gold); color:#000; border:none; display:inline-block;" />
                     </div>
                 </div>
             </asp:Panel>
         </div>
     </div>
            <div class="max-w-6xl mx-auto my-6 font-sans">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="H_ID" DataSourceID="SqlDataSource1" CssClass="min-w-full table-auto" PageSize="10" HeaderStyle-CssClass="bg-yellow-400 text-black font-bold text-sm text-left" RowStyle-CssClass="text-white align-top" AlternatingRowStyle-CssClass="bg-black/5 text-white align-top" EditRowStyle-CssClass="bg-black text-white">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                        <asp:BoundField DataField="H_ID" HeaderText="Id" ReadOnly="True" SortExpression="H_ID" />
                        <asp:BoundField DataField="THR_ID" HeaderText="Theater" SortExpression="THR_ID" />
                        <asp:BoundField DataField="H_NAME" HeaderText="Name" SortExpression="H_NAME" />
                        <asp:BoundField DataField="H_CAPACITY" HeaderText="Capacity" SortExpression="H_CAPACITY" />
                        <asp:BoundField DataField="H_STATUS" HeaderText="Status" SortExpression="H_STATUS" />
                    </Columns>
                </asp:GridView>

                <!-- DataSource for Halls (used by GridView) -->
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringQTX %>" DeleteCommand="DELETE FROM &quot;HALLS&quot; WHERE &quot;H_ID&quot; = :H_ID" InsertCommand="INSERT INTO &quot;HALLS&quot; (&quot;H_ID&quot;, &quot;THR_ID&quot;, &quot;H_NAME&quot;, &quot;H_CAPACITY&quot;, &quot;H_STATUS&quot;) VALUES (:H_ID, :THR_ID, :H_NAME, :H_CAPACITY, :H_STATUS)" ProviderName="<%$ ConnectionStrings:ConnectionStringQTX.ProviderName %>" SelectCommand="SELECT * FROM &quot;HALLS&quot;" UpdateCommand="UPDATE &quot;HALLS&quot; SET &quot;THR_ID&quot; = :THR_ID, &quot;H_NAME&quot; = :H_NAME, &quot;H_CAPACITY&quot; = :H_CAPACITY, &quot;H_STATUS&quot; = :H_STATUS WHERE &quot;H_ID&quot; = :H_ID">
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
