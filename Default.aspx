<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="IT114L_MP_CareBy._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <div id="welcome-page">
        <div id="welcome-title-container">
            <h1 id="welcome-title">MAKE YOUR MENTAL HEALTH A PRIORITY</h1>
            <p id="welcome-statement">You don’t have to struggle in silence</p>
            <asp:LinkButton ID="startbutton" runat="server" Text="Join us today" CssClass="startBtn" OnClick="startbutton_Click"> </asp:LinkButton>
        </div>
        <div id="page-image-container">
            <img id="page-art" src="vector.png" alt="page-img"/>

        </div>

    </div>
    
    <div id="about-page">
        
        <img id="page-art2" src="goalart1.png" alt="page-img"/>
        
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
    
    <div id="contact-page">

        <h1>Reach Us</h1>

        <div id="contact-main-container">
            <div id="contact-details-container">

                <div class="contact-container">
                    <img class="contact-img" src="phone.png" alt="page-img"/>
                    <p class="contact-statement">123-456-7890</p>
                </div>

                <div class="contact-container">
                    <img class="contact-img" src="mail.png" alt="page-img"/>
                    <p class="contact-statement">careby@gmail.com</p>
                </div>

                <div class="contact-container">
                    <img class="contact-img" src="www.png" alt="page-img"/>
                    <p class="contact-statement">www.careby.com</p>

                </div>

            </div>
        </div>
    </div>

</asp:Content>
