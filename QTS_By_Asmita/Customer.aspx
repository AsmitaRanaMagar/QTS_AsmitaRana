<%@ Page Title="Customer" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Customer.aspx.cs" Inherits="QTS_By_Asmita.Customer" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">

    <style>
        /* Use root color from Site.Master for accents */
        .accent-bg { background: var(--gold); }
        .accent-text { color: var(--gold); }

        /* Compact form and table styling */
        .small-input { padding: 6px 8px; font-size: 0.875rem; }
        .small-textarea { padding: 6px 8px; font-size: 0.875rem; min-height: 48px; }
        .small-btn { padding: 6px 10px; font-size: 0.9rem; border-radius: 6px; }

        /* Ensure Add button inside add-form is gold */
        .add-form .small-btn {
            background: var(--gold) !important;
            color: #000000 !important;
            border: none !important;
        }

        .grid-header { background: var(--gold); color: #000; font-weight: 700; font-size: 0.9rem; text-align: left; }
        .grid-header th { text-align: left; }

         /* Left-align all data cells and force consistent font/anchor styling so odd/even rows match */
         .grid-row td, .grid-alt td {
             padding: 6px 8px;
             font-size: 0.95rem;
             font-weight: 400;
             line-height: 1.2;
             text-align: left;
             color: #ffffff;
         }
         .grid-alt td { background: rgba(255,255,255,0.02); }

         /* Ensure links inside command cells use the same size and color */
         .grid-row td a,
         .grid-alt td a,
         .grid-row td a:link,
         .grid-row td a:visited,
         .grid-alt td a:link,
         .grid-alt td a:visited {
             font-size: inherit;
             color: inherit;
             text-decoration: none;
             font-weight: 400;
         }

         /* Add-form styling: black background, white text, gold border */
         .add-form {
             background: #000000;
             color: #ffffff;
             border: 2px solid var(--gold);
         }

         /* Inputs inside the add-form should be dark with clear white borders and white text */
         .add-form input,
         .add-form textarea,
         .add-form select,
         .add-form .small-input,
         .add-form .small-textarea,
         .add-form .w-full {
             background: transparent !important;
             color: #ffffff !important;
             border: 1px solid #ffffff !important;
             padding: 6px 8px !important;
             border-radius: 6px;
         }

         /* Make select dropdown match inputs and ensure options are readable */
         .add-form select {
             -webkit-appearance: none;
             -moz-appearance: none;
             appearance: none;
             background: transparent !important;
             color: #ffffff !important;
         }
         .add-form select option {
             background: #000000;
             color: #ffffff;
         }

         .add-form label,
         .add-form .font-medium {
             color: #ffffff;
         }

         /* Title and button centering inside add-form */
         .add-form h3 { color: #ffffff; text-align: center; }
         .add-form .text-center button, .add-form .text-center input[type=submit] { display: inline-block; }
         .add-form .small-btn { cursor: pointer; }

        /* Edit-row styling: make edit row visually match other rows (black background, white text) */
        .grid-edit td {
            background: #000000 !important;
            color: #ffffff !important;
            text-align: left;
        }
        .grid-edit input[type="text"],
        .grid-edit input[type="email"],
        .grid-edit input[type="number"],
        .grid-edit input[type="date"],
        .grid-edit textarea,
        .grid-edit select {
            background: transparent !important;
            color: #ffffff !important;
            border: 1px solid #ffffff !important;
            width: 100% !important;
            padding: 6px 8px !important;
            box-sizing: border-box !important;
            border-radius: 4px !important;
        }
        .grid-edit td a,
        .grid-edit td a:link,
        .grid-edit td a:visited {
            color: #ffffff !important;
            text-decoration: none !important;
        }
     </style>

     <!-- Make the Add form narrower than the table below -->
     <div class="max-w-xl mx-auto my-6 font-sans">
         <div class="add-form rounded-lg shadow-sm p-4">
             <h3 class="text-lg font-semibold mb-3 accent-text">Add New Customer</h3>

             <asp:Panel ID="pnlAdd" runat="server">
                 <div class="grid grid-cols-1 md:grid-cols-3 gap-3 items-center text-sm">

                     <asp:Label ID="lblCustomerID" runat="server" Text="Customer ID:" AssociatedControlID="txtCustomerID" CssClass="font-medium md:col-span-1" />
                     <asp:TextBox ID="txtCustomerID" runat="server" CssClass="w-full border border-gray-300 rounded text-sm small-input md:col-span-2" required="required" />

                     <asp:Label ID="lblName" runat="server" Text="Name:" AssociatedControlID="txtName" CssClass="font-medium md:col-span-1" />
                     <asp:TextBox ID="txtName" runat="server" CssClass="w-full border border-gray-300 rounded text-sm small-input md:col-span-2" />

                     <asp:Label ID="lblEmail" runat="server" Text="Email:" AssociatedControlID="txtEmail" CssClass="font-medium md:col-span-1" />
                     <asp:TextBox ID="txtEmail" runat="server" CssClass="w-full border border-gray-300 rounded text-sm small-input md:col-span-2" TextMode="Email" required="required" />

                     <asp:Label ID="lblPhone" runat="server" Text="Phone:" AssociatedControlID="txtPhone" CssClass="font-medium md:col-span-1" />
                     <asp:TextBox ID="txtPhone" runat="server" CssClass="w-full border border-gray-300 rounded text-sm small-input md:col-span-2" required="required" />

                     <asp:Label ID="lblAddress" runat="server" Text="Address:" AssociatedControlID="txtAddress" CssClass="font-medium md:col-span-1" />
                     <asp:TextBox ID="txtAddress" runat="server" CssClass="w-full border border-gray-300 rounded text-sm small-textarea md:col-span-2" TextMode="MultiLine" Rows="2" Columns="40" />

                     <asp:Label ID="lblGender" runat="server" Text="Gender:" AssociatedControlID="ddlGender" CssClass="font-medium md:col-span-1" />
                     <asp:DropDownList ID="ddlGender" runat="server" CssClass="w-full border border-gray-300 rounded text-sm small-input md:col-span-2">
                         <asp:ListItem Value="">Select</asp:ListItem>
                         <asp:ListItem Value="Male">Male</asp:ListItem>
                         <asp:ListItem Value="Female">Female</asp:ListItem>
                         <asp:ListItem Value="Other">Other</asp:ListItem>
                     </asp:DropDownList>

                     <asp:Label ID="lblAge" runat="server" Text="Age:" AssociatedControlID="txtAge" CssClass="font-medium md:col-span-1" />
                     <asp:TextBox ID="txtAge" runat="server" TextMode="Number" CssClass="w-full border border-gray-300 rounded text-sm small-input md:col-span-2" required="required" placeholder="18" />

                     <div class="md:col-span-3 text-center">
                         <asp:Button ID="btnAdd" runat="server" CssClass="small-btn" Text="Add Customer" OnClick="AddCustomer_Click" Style="background:var(--gold); color:#000; border:none; display:inline-block;" />
                     </div>
                 </div>
             </asp:Panel>
         </div>
     </div>
 <!-- Customer Details Table -->
     <div class="max-w-6xl mx-auto my-6 font-sans">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="CUS_ID" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" CssClass="min-w-full" PageSize="10" HeaderStyle-CssClass="grid-header" RowStyle-CssClass="grid-row" AlternatingRowStyle-CssClass="grid-alt" EditRowStyle-CssClass="grid-edit" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                 <Columns>
                     <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                     <asp:BoundField DataField="CUS_ID" HeaderText="Id" ReadOnly="True" SortExpression="CUS_ID" />
                     <asp:BoundField DataField="CUS_NAME" HeaderText="Name" SortExpression="CUS_NAME" />
                     <asp:BoundField DataField="CUS_EMAIL" HeaderText="Email" SortExpression="CUS_EMAIL" />
                     <asp:BoundField DataField="CUS_PHONE" HeaderText="Phone" SortExpression="CUS_PHONE" />
                     <asp:BoundField DataField="CUS_ADDRESS" HeaderText="Address" SortExpression="CUS_ADDRESS" />
                     <asp:BoundField DataField="CUS_AGE" HeaderText="Age" SortExpression="CUS_AGE" />
                     <asp:BoundField DataField="CUS_REG_DATE" HeaderText="Registered At" SortExpression="CUS_REG_DATE" DataFormatString="{0:yyyy-MM-dd HH:mm}" />
                 </Columns>
            </asp:GridView>
        </div>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringQTX %>" DeleteCommand="DELETE FROM &quot;CUSTOMERS&quot; WHERE &quot;CUS_ID&quot; = :CUS_ID" InsertCommand="INSERT INTO &quot;CUSTOMERS&quot; (&quot;CUS_ID&quot;, &quot;CUS_NAME&quot;, &quot;CUS_EMAIL&quot;, &quot;CUS_PHONE&quot;, &quot;CUS_ADDRESS&quot;, &quot;CUS_AGE&quot;, &quot;CUS_REG_DATE&quot;) VALUES (:CUS_ID, :CUS_NAME, :CUS_EMAIL, :CUS_PHONE, :CUS_ADDRESS, :CUS_AGE, :CUS_REG_DATE)" ProviderName="<%$ ConnectionStrings:ConnectionStringQTX.ProviderName %>" SelectCommand="SELECT * FROM &quot;CUSTOMERS&quot;" UpdateCommand="UPDATE &quot;CUSTOMERS&quot; SET &quot;CUS_NAME&quot; = :CUS_NAME, &quot;CUS_EMAIL&quot; = :CUS_EMAIL, &quot;CUS_PHONE&quot; = :CUS_PHONE, &quot;CUS_ADDRESS&quot; = :CUS_ADDRESS, &quot;CUS_AGE&quot; = :CUS_AGE, &quot;CUS_REG_DATE&quot; = :CUS_REG_DATE WHERE &quot;CUS_ID&quot; = :CUS_ID">
            <DeleteParameters>
                <asp:Parameter Name="CUS_ID" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter Name="CUS_ID" ControlID="txtCustomerID" PropertyName="Text" Type="String" />
                <asp:ControlParameter Name="CUS_NAME" ControlID="txtName" PropertyName="Text" Type="String" />
                <asp:ControlParameter Name="CUS_EMAIL" ControlID="txtEmail" PropertyName="Text" Type="String" />
                <asp:ControlParameter Name="CUS_PHONE" ControlID="txtPhone" PropertyName="Text" Type="String" />
                <asp:ControlParameter Name="CUS_ADDRESS" ControlID="txtAddress" PropertyName="Text" Type="String" />
                <asp:Parameter Name="CUS_AGE" Type="Decimal" />
                <asp:Parameter Name="CUS_REG_DATE" Type="DateTime" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="CUS_NAME" Type="String" />
                <asp:Parameter Name="CUS_EMAIL" Type="String" />
                <asp:Parameter Name="CUS_PHONE" Type="String" />
                <asp:Parameter Name="CUS_ADDRESS" Type="String" />
                <asp:Parameter Name="CUS_AGE" Type="Decimal" />
                <asp:Parameter Name="CUS_REG_DATE" Type="DateTime" />
                <asp:Parameter Name="CUS_ID" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </main>
</asp:Content>
