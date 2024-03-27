<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TherapistPage.aspx.cs" Inherits="IT114L_MP_CareBy.TherapistPage" %>

<asp:Content ID="Therapist" ContentPlaceHolderID="MainContent" runat="server">

    <div id="main-container">

        <div id="basic-info-container">
            <h2 id="therapist-page-title">APPOINTMENT SCHEDULE</h2>
            <h3 id="therapist-page-date"> Today:  <%= DateTime.Today %> </h3>
        </div> 

        <div id="details-main-container">

            <div class="details-outer">
                <div class="details-container">
                    <div class="detail-block">
                        <img class="schedIcon" src="patient.png" alt="page-img"/>
                        <p class="schedLbl">Patient Name: <span class="displayPatient" runat="server"></span></p>
                    </div>

                    <div class="detail-block">
                        <img class="schedIcon" src="calendar.png" alt="page-img"/>
                        <p class="schedLbl">Scheduled Date: <span class="displaySched" runat="server"></span></p>
                        <button type="button" class="primary" runat="server">START APPOINTMENT</button>
                    </div>
                </div>
            </div>

            <div class="details-outer">
                <div class="details-container">
                    <div class="detail-block">
                        <img class="schedIcon" src="patient.png" alt="page-img"/>
                        <p class="schedLbl">Patient Name: <span class="displayPatient" runat="server"></span></p>
                    </div>

                    <div class="detail-block">
                        <img class="schedIcon" src="calendar.png" alt="page-img"/>
                        <p class="schedLbl">Scheduled Date: <span class="displaySched" runat="server"></span></p>
                        <button type="button" class="primary" runat="server">START APPOINTMENT</button>
                    </div>
                </div>
            </div>

        </div>

    </div>

</asp:Content>