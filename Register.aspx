<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Register.aspx.cs" Inherits="IT114L_MP_CareBy.Register" %>
 
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div id="signup-page">

        <div id="register-container">

            <h2>Registration</h2>
            <div id="regis-fname">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtfname" ErrorMessage="*" ForeColor="red" Display="Dynamic" ValidationGroup="Register" />
                <asp:TextBox ID="txtfname" runat="server" TextMode="SingleLine" CssClass="input-field" placeholder="First Name"></asp:TextBox>
            </div>

            <div id="regis-lname">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtlname" ErrorMessage="*" ForeColor="red" Display="Dynamic" ValidationGroup="Register" />
                <asp:TextBox ID="txtlname" runat="server" TextMode="SingleLine" CssClass="input-field" placeholder="Last Name"></asp:TextBox>
            </div>

            <div id="regis-age">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtage" ErrorMessage="*" ForeColor="red" Display="Dynamic" ValidationGroup="Register" />
                <asp:TextBox ID="txtage" runat="server" TextMode="SingleLine" CssClass="input-field" placeholder="Age"></asp:TextBox>
            </div>

            <div id="regis-gender">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtgender" ErrorMessage="*" ForeColor="red" Display="Dynamic" ValidationGroup="Register" />
                <asp:TextBox ID="txtgender" runat="server" TextMode="SingleLine" CssClass="input-field" placeholder="Gender"></asp:TextBox>
            </div>

            <div id="regis-username">
                <asp:RequiredFieldValidator ID="rfvRegisterUser" runat="server" ControlToValidate="txtUsername" ErrorMessage="*" ForeColor="red" Display="Dynamic" ValidationGroup="Register" />
                <asp:TextBox ID="txtUsername" runat="server" CssClass="input-field" placeholder="Username"></asp:TextBox>
            </div>
            
            <div id="regis-email">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="*" ForeColor="red" Display="Dynamic" ValidationGroup="Register" />
                <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="input-field" placeholder="Email"></asp:TextBox>
            </div>
            
            <div id="regis-password">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword" ErrorMessage="*" ForeColor="red" Display="Dynamic" ValidationGroup="Register" />
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="input-field" placeholder="Password"></asp:TextBox>
            </div>
            
            <div id="confirm-pass">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtConfirmpass" ErrorMessage="*" ForeColor="red" Display="Dynamic" ValidationGroup="Register" />
                <asp:TextBox ID="txtConfirmpass" runat="server" TextMode="Password" CssClass="input-field" placeholder="Confirm Password"></asp:TextBox>
            </div>

            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="txtPassword" ControlToCompare="txtConfirmpass" ErrorMessage="Passwords do not match" ForeColor="red" ValidationGroup="Register"/>

            <asp:Button runat="server" ID="Button1" Text="Sign Up" CssClass="signup-btn" OnClick="btnRegister_Click" ValidationGroup="Register"/>
            <hr />

            <span></span>

            <asp:Button runat="server" ID="Button2" Text="Already have an account?" CssClass="have" OnClick="AcctHave" />

        </div>

    </div>

</asp:Content>
