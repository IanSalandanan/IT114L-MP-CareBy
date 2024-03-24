<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProfilePage.aspx.cs" Inherits="IT114L_MP_CareBy.ProfilePage" %>

<asp:Content ID="ProfileForm" ContentPlaceHolderID="MainContent" runat="server">

    <div id="form-container">
         <div id="fillUp-container">
             <form id="fillUpForm" cssclass="form-column">

                 <h3> General Info </h3>

                 <asp:Label class="Label" runat="server" Text="Email"></asp:Label>
                 <br/>
                 <asp:TextBox class="txtbox" ID="email" runat="server" ></asp:TextBox>
                 </br>

                 <asp:Label class="Label" runat="server" Text="Full Name"></asp:Label>
                 <br/>
                 <asp:TextBox class="nametxtbox" ID="fname" runat="server" Placeholder="First Name"></asp:TextBox>
                 <asp:TextBox class="nametxtbox" ID="lname" runat="server" Placeholder="Last Name"></asp:TextBox>
                 </br>

                 <asp:Label class="Label" runat="server" Text="Gender"></asp:Label>
                 <br/>
                 <asp:TextBox class="txtbox" ID="gender" runat="server" ></asp:TextBox>
                 </br>


                 <asp:Label class="Label" runat="server" Text="Age"></asp:Label>
                 <br/>
                 <asp:TextBox class="txtbox" ID="bday" runat="server" ></asp:TextBox>
                 </br>

                 <asp:Button ID="submitBtn" runat="server" Text="Submit" cssclass="submitBtn" OnClick="submitBtn_Click"/>

             </form>
         </div>

        <div id="dp-container">
            <img id="page-img" src="defaultdp.png" alt="page-img"/>
        </div>
    </div>
   


</asp:Content>
