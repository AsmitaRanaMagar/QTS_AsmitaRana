<%@ Page Title="Customer" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Customer.aspx.cs" Inherits="QTS_By_Asmita.Customer" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI.WebControls" Assembly="System.Web" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
     <div class="max-w-xl mx-auto my-6 font-sans">
    <div class="bg-black text-white border-2 border-yellow-400 rounded-lg shadow-sm p-4">
        <style>
            .customer-select option { background-color: #000; color: #fff; }
            .customer-select { background-color: transparent; color: #fff; }
        </style>
        <h3 class="text-lg font-semibold mb-4 text-yellow-400 text-center">Add New Customer </h3>
        <asp:Panel ID="pnlAdd" runat="server">
            <div class="flex justify-center">
                <div class="grid grid-cols-[120px_1fr] gap-x-3 gap-y-3 text-sm w-full max-w-md">

                    <asp:Label ID="lblCustomerID" runat="server"
                        Text="Customer ID:"
                        AssociatedControlID="txtCustomerID"
                        CssClass="font-medium leading-none self-center text-right" />

                    <asp:TextBox ID="txtCustomerID" runat="server"
                        CssClass="w-full bg-transparent text-white border border-white rounded-md px-2 py-1"
                        required="required" />

                    <asp:Label ID="lblName" runat="server"
                        Text="Name:"
                        AssociatedControlID="txtName"
                        CssClass="font-medium leading-none self-center text-right" />

                    <asp:TextBox ID="txtName" runat="server"
                        CssClass="w-full bg-transparent text-white border border-white rounded-md px-2 py-1" />

                    <asp:Label ID="lblEmail" runat="server"
                        Text="Email:"
                        AssociatedControlID="txtEmail"
                        CssClass="font-medium leading-none self-center text-right" />

                    <asp:TextBox ID="txtEmail" runat="server"
                        TextMode="Email"
                        CssClass="w-full bg-transparent text-white border border-white rounded-md px-2 py-1"
                        required="required" />

                    <asp:Label ID="lblPhone" runat="server"
                        Text="Phone:"
                        AssociatedControlID="txtPhone"
                        CssClass="font-medium leading-none self-center text-right" />

                    <asp:TextBox ID="txtPhone" runat="server"
                        CssClass="w-full bg-transparent text-white border border-white rounded-md px-2 py-1"
                        required="required" />

                    <asp:Label ID="lblAddress" runat="server"
                        Text="Address:"
                        AssociatedControlID="txtAddress"
                        CssClass="font-medium leading-none self-center text-right" />

                    <asp:TextBox ID="txtAddress" runat="server"
                        TextMode="MultiLine"
                        Rows="2"
                        CssClass="w-full bg-transparent text-white border border-white rounded-md px-2 py-1" />

                    <asp:Label ID="lblGender" runat="server"
                        Text="Gender:"
                        AssociatedControlID="ddlGender"
                        CssClass="font-medium leading-none self-center text-right" />

                    <div class="relative">
                        <asp:DropDownList ID="ddlGender" runat="server"
                            CssClass="w-full bg-transparent text-white border border-white rounded-md px-2 py-1 appearance-none pr-8 customer-select">
                            <asp:ListItem Value="">Select Gender</asp:ListItem>
                            <asp:ListItem Value="MALE">Male</asp:ListItem>
                            <asp:ListItem Value="FEMALE">Female</asp:ListItem>
                            <asp:ListItem Value="OTHER">Other</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <asp:Label ID="lblAge" runat="server"
                        Text="Age:"
                        AssociatedControlID="txtAge"
                        CssClass="font-medium leading-none self-center text-right" />

                    <asp:TextBox ID="txtAge" runat="server"
                        TextMode="Number"
                        placeholder="18"
                        CssClass="w-full bg-transparent text-white border border-white rounded-md px-2 py-1"
                        required="required" />

                    <div class="col-span-2 flex flex-col items-center space-y-2">
                        <asp:Label ID="lblCustomerWarning" runat="server" Text="" CssClass="text-sm text-red-500 text-center w-full max-w-md" Visible="false" Role="alert"></asp:Label>
                        <asp:Label ID="lblAgeWarning" runat="server" Text="" CssClass="text-sm text-red-500 text-center w-full max-w-md" Visible="false" Role="alert"></asp:Label>
                    </div>

                    <div class="col-span-2 flex justify-center mt-4">
                        <asp:Button ID="btnAdd" runat="server"
                            Text="Add Customer"
                            OnClick="AddCustomer_Click"
                            CssClass="px-4 py-1 text-sm rounded-md"
                            Style="background:var(--gold); color:#000; border:none;" />
                    </div>

                </div>
            </div>
        </asp:Panel>
    </div>
</div>


     <div class="max-w-6xl mx-auto my-6 font-sans">
            <div class="flex justify-center mb-3">
                <asp:Label ID="lblCustomerDeleteError" runat="server" Text="" CssClass="text-sm text-red-500 text-center w-full max-w-md" Visible="false" Role="alert"></asp:Label>
            </div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="CUS_ID" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" CssClass="min-w-full table-auto" PageSize="10" HeaderStyle-CssClass="bg-yellow-400 text-black font-bold text-sm text-left" RowStyle-CssClass="text-white align-top" AlternatingRowStyle-CssClass="bg-black/5 text-white align-top" EditRowStyle-CssClass="bg-black text-white" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                 <Columns>
                     <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                     <asp:BoundField DataField="CUS_ID" HeaderText="Id" ReadOnly="True" SortExpression="CUS_ID" />

                     <asp:TemplateField HeaderText="Name" SortExpression="CUS_NAME">
                         <ItemTemplate>
                             <%# Eval("CUS_NAME") %>
                         </ItemTemplate>
                         <EditItemTemplate>
                             <asp:TextBox ID="txtEditName" runat="server" CssClass="w-full bg-transparent text-white border border-white rounded-md px-2 py-1" Text='<%# Bind("CUS_NAME") %>' />
                         </EditItemTemplate>
                     </asp:TemplateField>

                     <asp:TemplateField HeaderText="Email" SortExpression="CUS_EMAIL">
                         <ItemTemplate>
                             <%# Eval("CUS_EMAIL") %>
                         </ItemTemplate>
                         <EditItemTemplate>
                             <asp:TextBox ID="txtEditEmail" runat="server" TextMode="Email" CssClass="w-full bg-transparent text-white border border-white rounded-md px-2 py-1" Text='<%# Bind("CUS_EMAIL") %>' />
                         </EditItemTemplate>
                     </asp:TemplateField>

                     <asp:TemplateField HeaderText="Phone" SortExpression="CUS_PHONE">
                         <ItemTemplate>
                             <%# Eval("CUS_PHONE") %>
                         </ItemTemplate>
                         <EditItemTemplate>
                             <asp:TextBox ID="txtEditPhone" runat="server" CssClass="w-full bg-transparent text-white border border-white rounded-md px-2 py-1" Text='<%# Bind("CUS_PHONE") %>' />
                         </EditItemTemplate>
                     </asp:TemplateField>

                     <asp:TemplateField HeaderText="Address" SortExpression="CUS_ADDRESS">
                         <ItemTemplate>
                             <%# Eval("CUS_ADDRESS") %>
                         </ItemTemplate>
                         <EditItemTemplate>
                             <asp:TextBox ID="txtEditAddress" runat="server" TextMode="MultiLine" Rows="2" CssClass="w-full bg-transparent text-white border border-white rounded-md px-2 py-1" Text='<%# Bind("CUS_ADDRESS") %>' />
                         </EditItemTemplate>
                     </asp:TemplateField>

                     <asp:TemplateField HeaderText="Gender" SortExpression="CUS_GENDER">
                        <ItemTemplate>
                            <%# String.IsNullOrEmpty(Convert.ToString(Eval("CUS_GENDER"))) ? "-" : Eval("CUS_GENDER") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <div class="relative">
                                <asp:DropDownList ID="ddlEditGender" runat="server" CssClass="w-full bg-transparent text-white border border-white rounded-md px-2 py-1 pr-8 custom-select" SelectedValue='<%# Bind("CUS_GENDER") %>'>
                                    <asp:ListItem Value="">Select</asp:ListItem>
                                    <asp:ListItem Value="MALE">Male</asp:ListItem>
                                    <asp:ListItem Value="FEMALE">Female</asp:ListItem>
                                    <asp:ListItem Value="OTHER">Other</asp:ListItem>
                                </asp:DropDownList>
                                <span class="pointer-events-none absolute right-3 top-1/2 transform -translate-y-1/2 text-white text-xs leading-none">&#x25BC;</span>
                            </div>
                        </EditItemTemplate>
                     </asp:TemplateField>

                     <asp:TemplateField HeaderText="Age" SortExpression="CUS_AGE">
                         <ItemTemplate>
                             <%# Eval("CUS_AGE") %>
                         </ItemTemplate>
                         <EditItemTemplate>
                             <asp:TextBox ID="txtEditAge" runat="server" TextMode="Number" CssClass="w-full bg-transparent text-white border border-white rounded-md px-2 py-1" Text='<%# Bind("CUS_AGE") %>' />
                         </EditItemTemplate>
                     </asp:TemplateField>

                     <asp:TemplateField HeaderText="Registered At" SortExpression="CUS_REG_DATE">
                         <ItemTemplate>
                             <%# Eval("CUS_REG_DATE", "{0:yyyy-MM-dd HH:mm}") %>
                         </ItemTemplate>
                         <EditItemTemplate>
                             <asp:TextBox ID="txtEditRegDate" runat="server" TextMode="Date" CssClass="w-full bg-transparent text-white border border-white rounded-md px-2 py-1" Text='<%# Bind("CUS_REG_DATE", "{0:yyyy-MM-dd}") %>' />
                         </EditItemTemplate>
                     </asp:TemplateField>
                 </Columns>
            </asp:GridView>
         </div>

         <asp:SqlDataSource ID="SqlDataSource1" runat="server"
            ConnectionString="<%$ ConnectionStrings:ConnectionStringQTX %>"
            DeleteCommand="DELETE FROM &quot;CUSTOMERS&quot; WHERE &quot;CUS_ID&quot; = :CUS_ID"
            InsertCommand="INSERT INTO &quot;CUSTOMERS&quot; (&quot;CUS_ID&quot;, &quot;CUS_NAME&quot;, &quot;CUS_EMAIL&quot;, &quot;CUS_PHONE&quot;, &quot;CUS_ADDRESS&quot;, &quot;GENDER&quot;, &quot;CUS_AGE&quot;, &quot;CUS_REG_DATE&quot;) VALUES (:CUS_ID, :CUS_NAME, :CUS_EMAIL, :CUS_PHONE, :CUS_ADDRESS, :CUS_GENDER, :CUS_AGE, :CUS_REG_DATE)"
            ProviderName="<%$ ConnectionStrings:ConnectionStringQTX.ProviderName %>"
            SelectCommand="SELECT &quot;CUS_ID&quot;, &quot;CUS_NAME&quot;, &quot;CUS_EMAIL&quot;, &quot;CUS_PHONE&quot;, &quot;CUS_ADDRESS&quot;, &quot;GENDER&quot; AS &quot;CUS_GENDER&quot;, &quot;CUS_AGE&quot;, &quot;CUS_REG_DATE&quot; FROM &quot;CUSTOMERS&quot;"
            UpdateCommand="UPDATE &quot;CUSTOMERS&quot; SET &quot;CUS_NAME&quot; = :CUS_NAME, &quot;CUS_EMAIL&quot; = :CUS_EMAIL, &quot;CUS_PHONE&quot; = :CUS_PHONE, &quot;CUS_ADDRESS&quot; = :CUS_ADDRESS, &quot;GENDER&quot; = :CUS_GENDER, &quot;CUS_AGE&quot; = :CUS_AGE, &quot;CUS_REG_DATE&quot; = :CUS_REG_DATE WHERE &quot;CUS_ID&quot; = :CUS_ID"
            OnDeleted="SqlDataSource1_Deleted">

             <DeleteParameters>
                 <asp:Parameter Name="CUS_ID" Type="String" />
             </DeleteParameters>
             <InsertParameters>
                 <asp:ControlParameter Name="CUS_ID" ControlID="txtCustomerID" PropertyName="Text" Type="String" />
                 <asp:ControlParameter Name="CUS_NAME" ControlID="txtName" PropertyName="Text" Type="String" />
                 <asp:ControlParameter Name="CUS_EMAIL" ControlID="txtEmail" PropertyName="Text" Type="String" />
                 <asp:ControlParameter Name="CUS_PHONE" ControlID="txtPhone" PropertyName="Text" Type="String" />
                 <asp:ControlParameter Name="CUS_ADDRESS" ControlID="txtAddress" PropertyName="Text" Type="String" />
                 <asp:ControlParameter Name="CUS_GENDER" ControlID="ddlGender" PropertyName="SelectedValue" Type="String" />
                 <asp:Parameter Name="CUS_AGE" Type="Decimal" />
                 <asp:Parameter Name="CUS_REG_DATE" Type="DateTime" />
             </InsertParameters>
             <UpdateParameters>
                 <asp:Parameter Name="CUS_NAME" Type="String" />
                 <asp:Parameter Name="CUS_EMAIL" Type="String" />
                 <asp:Parameter Name="CUS_PHONE" Type="String" />
                 <asp:Parameter Name="CUS_ADDRESS" Type="String" />
                 <asp:Parameter Name="CUS_GENDER" Type="String" />
                 <asp:Parameter Name="CUS_AGE" Type="Decimal" />
                 <asp:Parameter Name="CUS_REG_DATE" Type="DateTime" />
                 <asp:Parameter Name="CUS_ID" Type="String" />
             </UpdateParameters>
         </asp:SqlDataSource>

    </main>
</asp:Content>
