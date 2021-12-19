<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="TechAssessment.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h1>Admin Console</h1>
        <p class="lead">For User Creation</p>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Please enter the new user's details below</h2>
            <asp:Label ID="lblUser" runat="server" Text="Username:"></asp:Label> 
            <asp:TextBox ID="txtUser" runat="server"></asp:TextBox> 
            <asp:RequiredFieldValidator validationgroup="Create" ID="RF_User" runat="server" ForeColor="Red" ErrorMessage="*Username Required" ControlToValidate="txtUser"/>
            <br /><br />


            <asp:Label ID="lblPass" runat="server" Text="Password:"></asp:Label> 
            <asp:TextBox ID="txtPass" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ValidationGroup="Create" ID="RF_Pass" runat="server" ForeColor="Red" ErrorMessage="*Password Required" ControlToValidate="txtPass"/>
            <br /><br />

            <asp:Label ID="lblIsAdmin" runat="server" Text="Is the user an admin?:"></asp:Label> 
            <asp:RadioButtonList ID="rblIsAdmin" runat="server">
                <asp:ListItem>
                    Yes
                </asp:ListItem>
                <asp:ListItem>
                    No
                </asp:ListItem>
            </asp:RadioButtonList>
            <asp:RequiredFieldValidator ValidationGroup="Create" ID="RF_IsAdmin" runat="server" ForeColor="Red" ErrorMessage="*Must Select An Answer" ControlToValidate="rblIsAdmin"/>
            <br />

            <asp:LinkButton ID="btnCreate" runat="server" Text="Create User" ValidationGroup="Create" OnClick="btnCreate_Click"></asp:LinkButton>
            <asp:Label ID="lblCreated" runat="server"></asp:Label>
            <br />
        </div>
    </div>
</asp:Content>
