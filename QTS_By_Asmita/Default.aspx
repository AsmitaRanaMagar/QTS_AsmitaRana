<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="QTS_By_Asmita.Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .theater-bg {
            background: url('Assets/Images/theater.jpg') no-repeat center center fixed;
            background-size: cover;
            min-height: 500px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            color: #fff;
            text-shadow: 2px 2px 8px #000;
            border-radius: 20px;
            margin-top: 30px;
            margin-bottom: 30px;
        }
        .home-title {
            font-size: 3em;
            font-weight: bold;
        }
        .home-btn {
            margin-top: 30px;
            font-size: 1.5em;
        }
    </style>
    <div class="theater-bg">
        <div class="home-title">Welcome to QTS Movie Booking</div>
        <div style="font-size:1.5em; margin-top:10px;">Book your favorite movies, halls, and shows easily!</div>
        <asp:Button ID="btnGetStarted" runat="server" Text="Get Started" CssClass="btn btn-primary home-btn" PostBackUrl="~/Customer.aspx" />
    </div>
</asp:Content>
