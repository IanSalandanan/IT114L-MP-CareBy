<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="IT114L_MP_CareBy._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div id="welcome-page">

        <div id="welcome-title-container">
            <h1 id="welcome-title">MAKE YOUR MENTAL HEALTH A PRIORITY</h1>
            <p id="welcome-statement">You don’t have to struggle in silence</p>
            <asp:Button ID="startbutton" runat="server" Text="Join us now"> </asp:Button>
        </div>

        <div id="page-image-container">
                <img id="page-img" src="vector.png" alt="page-img"/>
        </div>
    </div>

    <span></span>

    <div id="about-page">
        <div id="about-page-title">
            <h2>About</h2>
            <div id="about-container">
                <p id="about-txt">
                    lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum
                    lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum
                    lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum
                    lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum
                    lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum
                </p>
            </div>
        </div>
    </div>

    <span></span>

    <div id="login-signup-page">
        <div id="login-container">
            <h2>Log In</h2>
            <div id="login-user-email">
                <asp:TextBox id="userlogemail" runat="server" CssClass="input-field" placeholder="Username / Email" required=""></asp:TextBox>
            </div>
            <div id="login-password">
                <asp:TextBox ID="passlog" runat="server" TextMode="Password" CssClass="input-field" placeholder="Password" required=""></asp:TextBox>
            </div>
            <div id="login-now">
                <button type="submit" id="login-btnx">Log In</button>
            </div>
            <hr />
            <span></span>
            <p>Don't have an account?</p>
            <div id="register-nowx">
                <button type="button" id="signup-btn" onclick="logSign()">Sign Up</button>
            </div>
        </div>
        <div id="register-container">
            <h2>Sign Up</h2>
            <div id="regis-username">
                <asp:TextBox id="regisuser" runat="server" CssClass="input-field" placeholder="Username" required=""></asp:TextBox>
            </div>
            <div id="regis-email">
                <asp:TextBox id="regisemail" runat="server" TextMode="Email" CssClass="input-field" placeholder="Email" required=""></asp:TextBox>
            </div>
            <div id="regis-password">
                <asp:TextBox id="passregis" runat="server" TextMode="Password" CssClass="input-field" placeholder="Password" required=""></asp:TextBox>
            </div>
            <div id="confirm-pass">
                <asp:TextBox id="confirmpass" runat="server" TextMode="Password" CssClass="input-field" placeholder="Confirm Password" required=""></asp:TextBox>
            </div>
            <div id="register-now">
                <button type="submit" id="regis-btnx">Sign Up</button>
            </div>
            <hr />
            <span></span>
            <p>Already have an account?</p>
            <div id="login-nowx">
                <button type="button" id="login-btn" onclick="logSign()">Log In</button>
            </div>
        </div>
    </div>
    <script>
        function logSign() {
            let x = document.querySelector('#login-container');
            let y = document.querySelector('#register-container');

            if (this.id === 'login-btnx') {
                x.style.display = 'none';
                y.style.display = 'block';
            } else {
                x.style.display = 'block';
                y.style.display = 'none';
            }
        }
    </script>
</asp:Content>
