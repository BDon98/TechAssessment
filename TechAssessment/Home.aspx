<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="TechAssessment.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Home</h2>
    <h3>Welcome to this site.</h3>
    <p>This is the homepage for this site.</p>
    <asp:LinkButton runat="server" ID="btnAdmin" Text="Admin Console" Visible="false" OnClick="btnAdmin_Click"></asp:LinkButton>
    <br />
    <asp:LinkButton runat="server" ID="btnLogout" Text="Log Out" OnClick="btnLogout_Click"></asp:LinkButton>
    <br />
</asp:Content>
