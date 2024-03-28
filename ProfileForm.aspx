<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProfileForm.aspx.cs" Inherits="IT114L_MP_CareBy.ProfileForm" %>

<asp:Content ID="ProfileForm" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />

    <div id="form-container">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <div id="fillUp-container" class="form-column">
                    <h3>General Info </h3>

                    <asp:Label class="Label" runat="server" Text="Email" CssClass="Label1"></asp:Label>
                    <asp:TextBox class="txtbox" ID="email" runat="server" CssClass="TextBoxes"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidatorEmail" runat="server" ControlToValidate="email" ErrorMessage="Invalid email format" ForeColor="Red" ValidationExpression="^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[\w-]+$" />

                    <asp:Label class="Label" runat="server" Text="Full Name" CssClass="Label2"></asp:Label>
                    <asp:TextBox class="nametxtbox" ID="fname" runat="server" Placeholder="First Name" CssClass="TextBoxes"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorFName" runat="server" ControlToValidate="fname" ErrorMessage="First Name is required" ForeColor="Red" />
                    <asp:TextBox class="nametxtbox" ID="lname" runat="server" Placeholder="Last Name" CssClass="TextBoxes"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorLName" runat="server" ControlToValidate="lname" ErrorMessage="Last Name is required" ForeColor="Red" />

                    <asp:Label class="Label" runat="server" Text="Gender" CssClass="Label3"></asp:Label>
                    <asp:TextBox class="txtbox" ID="gender" runat="server" CssClass="TextBoxes"></asp:TextBox>
                    <asp:CustomValidator ID="CustomValidatorGender" runat="server" ControlToValidate="gender" ErrorMessage="Gender must be MALE, FEMALE, or OTHER" ForeColor="Red" OnServerValidate="ValidateGender" />
    
                    <asp:Label class="Label" runat="server" Text="Age" CssClass="Label4"></asp:Label>
                    <asp:TextBox class="txtbox" ID="age" runat="server" CssClass="TextBoxes"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorAge" runat="server" ControlToValidate="age" ErrorMessage="Age is required" ForeColor="Red" />
     
                    <asp:Button ID="editBtn2" runat="server" Text="Back to Profile" OnClick="BackBtnProfile_Click" CssClass="profBtn"/>
                    <asp:Button ID="editBtn" runat="server" Text="Edit Profile" OnClick="EditBtn_Click" CssClass="editBtn"/>
                    <asp:Button ID="saveBtn" runat="server" Text="Save" OnClick="SaveBtn_Click" CssClass="saveBtn"/>
                    <asp:Button ID="backBtn" runat="server" Text="Back to Homepage" OnClick="BackBtn_Click" CssClass="homeBtn"/>

                    <asp:Button ID="Button1" runat="server" Text="Back to Therapist" OnClick="BackBtn2_Click" CssClass="backBtn"/>

                </div>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="editBtn2" EventName="Click"/>
                <asp:AsyncPostBackTrigger ControlID="saveBtn" EventName="Click"/>
                <asp:AsyncPostBackTrigger ControlID="backBtn" EventName="Click"/>
                <asp:AsyncPostBackTrigger ControlID="editBtn" EventName="Click"/>
                
            </Triggers>
        </asp:UpdatePanel>

        <div id="dp-container">
            <img id="dp-img" src="defaultdp.png" alt="page-img"/>
        </div>
    </div>
</asp:Content>
