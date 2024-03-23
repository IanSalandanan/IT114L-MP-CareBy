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

    <div id="about-page">
        <div id="about-page-title">
            <p>YOLO</p>
        </div>
    </div>

    <div id="login-signup-page">
        <div id="login-box">
            <div id="login-box">
                <div id="login-box-form">
                    <h2>Log In</h2>
                    <input id="username-log" type="text" placeholder="Username" required />
                    <input id="password-log" type="password" placeholder="Password" required />
                    <button id="login-button" type="sumbit" onclick="logIn()">Login</button>
                </div>
            <div id="login-box-form">
                <hr /> <span></span> <p>Don't have an account?</p>
            </div>
                <div id="login-box-form">
                    <button type="button" id="signup-btn" linkhref="./About.aspx">Sign Up</button>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
