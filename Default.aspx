<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="IT114L_MP_CareBy._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div id="welcome-page">

        <div id="welcome-title-container">
            <h1 id="welcome-title">MAKE YOUR MENTAL HEALTH A PRIORITY</h1>
            <br />
            <p id="welcome-statement">You don’t have to struggle in silence</p>
            <div id="startBtn-container">
                <asp:LinkButton ID="startbutton" runat="server" Text="Join us today" CssClass="startBtn" OnClick="startbutton_Click"> </asp:LinkButton>
            </div>
        </div>

        <div id="page-image-container">
                <img id="page-art" src="vector.png" alt="page-img"/>
        </div>
    </div>

    <span></span>

    <div id="about-page">

        <img id="page-art2" src="mental-health.png" alt="page-img"/>
    

        <div id="about-page-title">
            <h1>Our Goals</h1>
            <div id="about-container">
                <p id="about-txt">
                    A world where mental well-being is a cornerstone of a healthy society, achieved through the seamless integration of mental healthcare into everyday life. 
                    <br /> <br /> <br />
                    To be the leading online resource for mental health information and support, fostering a global community that dismantles stigma, empowers individuals, and equips them with the tools they need to navigate their mental health journey, one step at a time. 
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
            <p id="hatdog">Don't have an account?</p>
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
            <p id="hatdogx">Already have an account?</p>
        </div>
    </div>

    
    <script>

        window.addEventListener('load', function () {
            document.getElementById('login-container').style.display = 'block';
            document.getElementById('register-container').style.display = 'none';
        });
        const hatdog = document.getElementById('hatdog');
        hatdog.addEventListener('click', function () {
            document.getElementById('login-container').style.display = 'none';
            document.getElementById('register-container').style.display = 'block';
        });

        const hatdogx = document.getElementById('hatdogx');
        hatdogx.addEventListener('click', function () {
            document.getElementById('login-container').style.display = 'block';
            document.getElementById('register-container').style.display = 'none';
        })
        
        function myButton_Click(sender, e) {
            var targetSection = "section-id"; // Replace with the ID of your target section
            window.location.hash = "#" + targetSection;
        }
 
    </script>
</asp:Content>
