<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TherapistPage.aspx.cs" Inherits="IT114L_MP_CareBy.TherapistPage" %>

<asp:Content ID="Therapist" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager> <!-- Add ScriptManager here -->

    <asp:UpdatePanel ID="TherapistUpdatePanel" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div id="main-container">

                <div id="basic-info-container">
                    <img id="top-img" src="pinkpalawer.png" alt="page-img"/>
                    <h2 id="therapist-page-title">APPOINTMENT SCHEDULE</h2>
                    <h3 id="therapist-page-date"> Today:  <%= DateTime.Today %> </h3>
                </div> 

                <div id="details-main-container">

                    <div class="details-outer">
                        <div class="details-container">
                            <div class="detail-block">
                                <img class="schedIcon" src="patient.png" alt="page-img"/>
                                <p class="schedLbl"> <span class="displayPatient" runat="server"></span></p>
                                 <p class="schedLbl">Patient Name: &nbsp;&nbsp;<span id="displayPatient" runat="server"></span></p>
                            </div>

                            <div class="detail-block">
                                <img class="schedIcon" src="calendar.png" alt="page-img"/>
                                <p class="schedLbl"> <span class="displaySched" runat="server"></span></p>
                                <p class="schedLbl">DATE: &nbsp;&nbsp;<span id="displayDate" runat="server"></span></p>
                                <p class="schedLbl">TIME: &nbsp;&nbsp;<span id="displayTime" runat="server"></span></p>
                                <button type="button" class="primary" runat="server">START APPOINTMENT</button>
                            </div>
                        </div>
                    </div>

                </div>

            </div>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="profileBtn" EventName="Click" />
            <asp:AsyncPostBackTrigger ControlID="btnLogout" EventName="Click" />
        </Triggers>
    </asp:UpdatePanel>
     
        <div id="btns-container">
            <asp:LinkButton ID="profileBtn" runat="server" Text="PROFILE" CssClass="profileBtn" OnClick="profileBtn_Click"> </asp:LinkButton>
            <asp:Button ID="btnLogout" runat="server" Text="LOGOUT" CssClass="btnLogout" OnClick="btnLogout_Click"/>
        </div>
</asp:Content>