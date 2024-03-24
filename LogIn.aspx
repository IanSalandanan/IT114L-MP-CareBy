<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LogIn.aspx.cs" Inherits="IT114L_MP_CareBy.LogIn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
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
</html>
