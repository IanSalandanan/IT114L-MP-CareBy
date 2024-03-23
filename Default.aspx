<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="IT114L_MP_CareBy._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
    #login-box {
        display: block;
        padding: 50px 33%;
        width: 550px;
        transform: scale(1);
        transition: transform 0.5s ease;
        text-align: center;
    }

    #login-box input {
        width: 100%;
        background: transparent;
        border: 1px solid #000;
        outline: 0;
        padding: 15px 10px;
        border-radius: 4px;
        margin: 10px 0;
    }

    #login-box button {
        width: 100%;
        padding: 10px 0;
        display: flex;
        align-items: center;
        justify-content: center;
        margin: 20px 0;
        border-radius: 30px;
        background: transparent;
        border: 1px solid #999;
        font-weight: 500;
        cursor: pointer;
    }

</style>

    <div id="welcome-page">

        <div id="welcome-title-container">
            <h1 id="welcome-title">MAKE YOUR MENTAL HEALTH A PRIORITY</h1>
            <p id="welcome-statement">You don’t have to struggle in silence</p>
        </div>

        <div id="page-image-container">
              <img id="page-img" src="vector.png" alt="page-img"/>
        </div>

    </div>

    <head>
        <title>Welcome to Careby</title>
        <link rel="stylesheet" href="LogInPageStyles.css">
    </head>
    <body>
        <form id="form1">
            <div>
                <form id="login-box">
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
                </form>
            </div>
        </form>
    </body>

</asp:Content>
