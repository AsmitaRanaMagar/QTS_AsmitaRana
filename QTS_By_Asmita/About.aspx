<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="QTS_By_Asmita.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <h2 id="title"><%: Title %>.</h2>
        <h3>Your applicati<asp:DropDownList ID="ticketCustomerIdselect" runat="server" DataSourceID="SqlDataSource1" DataTextField="CUS_ID" DataValueField="CUS_ID" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringQTX %>" ProviderName="<%$ ConnectionStrings:ConnectionStringQTX.ProviderName %>" SelectCommand="SELECT &quot;TK_ID&quot;, &quot;SW_ID&quot;, &quot;TK_DATE&quot;, &quot;TK_STATUS&quot;, &quot;TK_BOOKED_AT&quot;, &quot;TK_QUANTITY&quot; FROM &quot;TICKETS&quot; WHERE ((&quot;TK_ID&quot; = :TK_ID) AND (&quot;CUS_ID&quot; = :CUS_ID) AND (&quot;CUS_ID&quot; = :CUS_ID2))">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ticketCustomerIdselect" Name="TK_ID" PropertyName="SelectedValue" Type="String" />
                    <asp:ControlParameter ControlID="ticketCustomerIdselect" Name="CUS_ID" PropertyName="SelectedValue" Type="String" />
                    <asp:ControlParameter ControlID="ticketCustomerIdselect" Name="CUS_ID2" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
    </h3>
        <p>Use this area to provide additional information.</p>

    </main>
</asp:Content>
