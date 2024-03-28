<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VideoPage.aspx.cs" Inherits="IT114L_MP_CareBy.VideoPage" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <asp:Button ID="backBtn" runat="server" Text="Back to Homepage" OnClick="endBtn_Click" CssClass="homeBtn"/>
    <div id="vid-container">
        <img class="call-img" src="call.png" alt="page-img"/>
    </div>
</asp:Content>
