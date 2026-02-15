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
