<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LogIn.aspx.cs" Inherits="TechAssessment._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Log In</h1>
        
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Please enter your details below</h2>
            <asp:Label ID="lblUser" runat="server" Text="Username:"></asp:Label> 
            <asp:TextBox ID="txtUser" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator validationgroup="Login" ID="RF_User" runat="server" ForeColor="Red" ErrorMessage="*Username Required" ControlToValidate="txtUser"/>
            <br /><br />

            <asp:Label ID="lblPass" runat="server" Text="Password:"></asp:Label> 
            <asp:TextBox ID="txtPass" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ValidationGroup="Login" ID="RF_Pass" runat="server" ForeColor="Red" ErrorMessage="*Password Required" ControlToValidate="txtPass"/>
            <br />
            <asp:CustomValidator ValidationGroup="SignIn" ID="err_Login" runat="server" ForeColor = "Red"/>
            <br />
            <asp:LinkButton ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" validationgroup="Login"></asp:LinkButton>
            <br />
        </div>
    </div>

</asp:Content>
