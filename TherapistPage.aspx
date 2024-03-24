<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TherapistPage.aspx.cs" Inherits="IT114L_MP_CareBy.TherapistPage" %>

<asp:Content ID="Therapist" ContentPlaceHolderID="MainContent" runat="server">
    <style>

        #appointments-Container {
            display:flex;
            flex-direction: column;
        }

        #pending-upcoming-container {
            width: 100px;
            display: flex;
            background:yellow;
        }

        #upcoming-btn {
            width: 100%;
            padding: 10px 10%;
            align-items: center;
            justify-content: center;
            border-radius: 30px;
            background: transparent;
            border: 1px solid #999;
            font-weight: 500;
            cursor: pointer;
        }

        #pending-btn {
            width: 100%;
            padding: 10px 10%;
            align-items: center;
            justify-content: center;
            border-radius: 30px;
            background: transparent;
            border: 1px solid #999;
            font-weight: 500;
            cursor: pointer;
        }

        #upcoming-btn:hover, #pending-btn:hover {
            color: #FFF3E1;
            background:#3C638A;
        }

        #schedule-box-container {
            height: 50vh;
            background:yellow;
            border-radius: 10px;
            background: transparent;
            border: 1px solid #999;
            font-weight: 500;
            display:flex;
        }

    </style>
    <div id="welcome-page">
        <div id="appointments-Container">
            <h2>Welcome, Dr. Juan Dela Cruz</h2>
            <div id="pending-upcoming-container">
                <div id="upcoming-btn-container">
                    <button type="button" id="upcoming-btn" OnClick="">Upcoming</button>
                </div>
                <div id="pending-btn-container">
                    <button type="button" id="pending-btn" OnClick="">Pending</button>
                </div>
            </div>
            <div id="schedule-box-container">
                <p>dsadasdasd</p>
            </div>
        </div>
    </div>

    <span></span>
</asp:Content>