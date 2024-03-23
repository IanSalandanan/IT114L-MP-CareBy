<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="IT114L_MP_CareBy.HomePage" %>

<asp:Content ID="HomeContent" ContentPlaceHolderID="MainContent" runat="server">

    <div id="greet-container">

        <h2>Welcome To CareBy</h2>

    </div>

    <div id="user-details-container">

         <div id="box-container">
              <p>UPCOMING APPOINTMENTS</p>

            <div id="appointment-container">
                <asp:Button ID="cancelBtn" runat="server" Text="Cancel" CssClass="cancelBtn"/>
                <asp:Button ID="viewBtn" runat="server" Text="View Therapist Profile" CssClass="viewBtn"/>
                <asp:Button ID="startBtn" runat="server" Text="Start Appointment" CssClass="startBtn"/>
    
            </div>
            <asp:Button ID="setBtn" runat="server" Text="Set Appointment" CssClass="setBtn"/>
         </div>
 
         <img id="page-img" src="homepageart.png" alt="page-img"/>
     
    </div>


</asp:Content>