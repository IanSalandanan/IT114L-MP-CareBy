<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="LogIn.aspx.cs" Inherits="IT114L_MP_CareBy.LogIn" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div id="login-page">
        <div id="login-container">
            <h2>Log In</h2>
            <div id="login-user-email">
                <asp:RequiredFieldValidator ID="rfvloginUserEmail" runat="server" ControlToValidate="txtLoginUsername" ErrorMessage="*" ForeColor="red" Display="Dynamic" ValidationGroup="Login" />
                <asp:TextBox ID="txtLoginUsername" runat="server" CssClass="input-field" placeholder="Username / Email"></asp:TextBox>
            </div>
            <div id="login-password">
                <asp:RequiredFieldValidator ID="rfvloginPass" runat="server" ControlToValidate="txtLoginPassword" ErrorMessage="*" ForeColor="red" Display="Dynamic" ValidationGroup="Login" />
                <asp:TextBox ID="txtLoginPassword" runat="server" TextMode="Password" CssClass="input-field" placeholder="Password"></asp:TextBox>
            </div>
            <div id="login-now">
                <asp:Button runat="server" ID="Button1" Text="Log In" OnClick="btnLogin_Click" CssClass="login-btn" ValidationGroup="Login" />
            </div>
            <hr />
            <span></span>
            <asp:Button runat="server" ID="Button2" Text="Don't have an account?" OnClick="NoAcct" CssClass="donthave" />
        </div>
    </div>

</asp:Content>
