<%@ Page Title="Customer" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Customer.aspx.cs" Inherits="QTS_By_Asmita.Customer" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <h2 id="title"><%: Title %>Customer Details</h2>
<p>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" DataKeyNames="CUS_ID">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
            <asp:BoundField DataField="CUS_ID" HeaderText="ID" SortExpression="CUS_ID" ReadOnly="True" />
            <asp:BoundField DataField="CUS_NAME" HeaderText="NAME" SortExpression="CUS_NAME" />
            <asp:BoundField DataField="CUS_EMAIL" HeaderText="EMAIL" SortExpression="CUS_EMAIL" />
            <asp:BoundField DataField="CUS_PHONE" HeaderText="PHONE" SortExpression="CUS_PHONE" />
            <asp:BoundField DataField="CUS_ADDRESS" HeaderText="ADDRESS" SortExpression="CUS_ADDRESS" />

            <asp:BoundField DataField="CUS_AGE" HeaderText="CUS_AGE" SortExpression="CUS_AGE" />
            <asp:BoundField DataField="CUS_REG_DATE" HeaderText="CUS_REG_DATE" SortExpression="CUS_REG_DATE" />

        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringQTX %>" DeleteCommand="DELETE FROM &quot;CUSTOMERS&quot; WHERE &quot;CUSTOMER_ID&quot; = :CUSTOMER_ID" InsertCommand="INSERT INTO &quot;CUSTOMERS&quot; (&quot;CUSTOMER_ID&quot;, &quot;CUSTOMER_NAME&quot;, &quot;CUSTOMER_ADDRESS&quot;, &quot;PHONE_NUMBER&quot;, &quot;EMAIL&quot;, &quot;GENDER&quot;, &quot;DATE_OF_BIRTH&quot;) VALUES (:CUSTOMER_ID, :CUSTOMER_NAME, :CUSTOMER_ADDRESS, :PHONE_NUMBER, :EMAIL, :GENDER, :DATE_OF_BIRTH)" ProviderName="<%$ ConnectionStrings:ConnectionStringQTX.ProviderName %>" SelectCommand="SELECT * FROM &quot;CUSTOMERS&quot;" UpdateCommand="UPDATE &quot;CUSTOMERS&quot; SET &quot;CUSTOMER_NAME&quot; = :CUSTOMER_NAME, &quot;CUSTOMER_ADDRESS&quot; = :CUSTOMER_ADDRESS, &quot;PHONE_NUMBER&quot; = :PHONE_NUMBER, &quot;EMAIL&quot; = :EMAIL, &quot;GENDER&quot; = :GENDER, &quot;DATE_OF_BIRTH&quot; = :DATE_OF_BIRTH WHERE &quot;CUSTOMER_ID&quot; = :CUSTOMER_ID">
        <DeleteParameters>
            <asp:Parameter Name="CUSTOMER_ID" Type="Decimal" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="CUSTOMER_ID" Type="Decimal" />
            <asp:Parameter Name="CUSTOMER_NAME" Type="String" />
            <asp:Parameter Name="CUSTOMER_ADDRESS" Type="String" />
            <asp:Parameter Name="PHONE_NUMBER" Type="String" />
            <asp:Parameter Name="EMAIL" Type="String" />
            <asp:Parameter Name="GENDER" Type="String" />
            <asp:Parameter Name="DATE_OF_BIRTH" Type="DateTime" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="CUSTOMER_NAME" Type="String" />
            <asp:Parameter Name="CUSTOMER_ADDRESS" Type="String" />
            <asp:Parameter Name="PHONE_NUMBER" Type="String" />
            <asp:Parameter Name="EMAIL" Type="String" />
            <asp:Parameter Name="GENDER" Type="String" />
            <asp:Parameter Name="DATE_OF_BIRTH" Type="DateTime" />
            <asp:Parameter Name="CUSTOMER_ID" Type="Decimal" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringQTX %>" ProviderName="<%$ ConnectionStrings:ConnectionStringQTX.ProviderName %>" SelectCommand="SELECT &quot;CUS_NAME&quot;, &quot;CUS_EMAIL&quot;, &quot;CUS_PHONE&quot;, &quot;CUS_ADDRESS&quot;, &quot;CUS_AGE&quot; FROM &quot;CUSTOMERS&quot;"></asp:SqlDataSource>
</p>
<p>
    &nbsp;</p>
    </main>
</asp:Content>
