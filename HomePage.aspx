<%@ Page Language="C#" EnableEventValidation = "false" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="IT114L_MP_CareBy.HomePage" %>

<asp:Content ID="HomeContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="whole_container" style="background-color: #FFF3E1;">
        <div id="greet-container">


            <img id="greeting-img" src="pinkpalawer.png" alt="page-img"/>
            <asp:LinkButton ID="profileBtn" runat="server" Text="PROFILE" CssClass="profileBtn" OnClick="profileBtn_Click"> </asp:LinkButton>
            <asp:Button ID="btnLogout" runat="server" Text="LOGOUT" CssClass="btnLogout" OnClick="btnLogout_Click"/>
            

        </div>

        <div id="user-details-container">

             <div id="box-container">
                  <p class="upcoming_appmt_title">UPCOMING APPOINTMENTS</p>

                <div id="appointment-container">
            
                        <div class="appmt_details_container">

                            <div class="detail_container">
                                <img src="doctor.png" class="doctor-avatar" />
                                <p id="doc"><b>Provider:</b> &nbsp;&nbsp;<span id= "displayProvider" runat="server"></span></p>
                            </div>

                            <div class="detail_container">
                                <img src="calendar.png" class="calendar-icon"/>
                                <p id="date"><b>Date:</b> &nbsp;&nbsp;<span id= "displayDate" runat="server"></span></p>
                                <p id="time"><b>Time:</b> &nbsp;&nbsp;<span id= "displayTime" runat="server"></span></p>
                            </div>

                        </div>

                        <div class="cancel_butn_container">
                            <asp:Button ID="cancelBtn" runat="server" Text="CANCEL" CssClass="cancelBtn" OnClick="cancelBtn_Click"/>
                        </div>
                    
                    <div class="start_appmt_btn_container">

                        <asp:Button ID="startBtn2" runat="server" Text="START APPOINTMENT" CssClass="startBtn2" OnClick="startBtn2_Click"/>

                    </div>

                </div>

                 <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"></asp:ScriptManager>

                    <div>
                        <asp:button runat="server" CssClass="setBtn" type="button" Text="Set Appointment" onclick="setAppPage" />
                    </div>

                   
                    
             </div>
            
            <img id="page-img" src="diligart.png" alt="page-img"/>
     
        </div>


        <div class="our-providers-container">

            <h2 class="our-providers-title"> OUR PROVIDERS </h2>

            <div id="providers_container" class="all-providers-container" runat="server">

                <div class="two-providers" runat="server">

                    <div class="provider-prof" runat="server">

                        <img src="user.png" class="user-avatar" />

                        <div class="provider-details" runat="server">
                            <p id="provider_name_title1" class="provider-name-title" runat="server"> Ken De Mertin, MD </p>
                            <p id="provider_role1" class="provider-role" runat="server">PSYCHOMETRICIAN</p>
                        </div>

                        <asp:Button ID="view_profile_btn1" class="view_profile_btn" runat="server" Text="VIEW PROFILE" CssClass="view_profile_btn" OnClick="view_profile_btn_click"/>  
        
                    </div>

                    <div class="provider-prof" runat="server">

                        <img src="user.png" class="user-avatar" />

                        <div class="provider-details" runat="server">
                            <p id="provider_name_title2" class="provider-name-title" runat="server"> Christian Salandanan, MD </p>
                            <p id="provider_role2" class="provider-role" runat="server">PSYCHOMETRICIAN</p>
                        </div>

                        <asp:Button ID="view_profile_btn2" class="view_profile_btn" runat="server" Text="VIEW PROFILE" CssClass="view_profile_btn" OnClick="view_profile_btn_click"/>  

                    </div>
                </div>

                <div class="two-providers">
                    <div class="provider-prof">
                        <img src="user.png" class="user-avatar" />
                        <div class="provider-details">
                            <p id="provider_name_title3" class="provider-name-title" runat="server"> Vincent Nuñez, MD </p>
                            <p id="provider_role3" class="provider-role" runat="server">PSYCHOMETRICIAN</p>
                        </div>
                        <asp:Button ID="view_profile_btn3" class="view_profile_btn" runat="server" Text="VIEW PROFILE" CssClass="view_profile_btn" OnClick="view_profile_btn_click"/>  
                    </div>

                    <div class="provider-prof">
                        <img src="user.png" class="user-avatar" />
                        <div class="provider-details">
                            <p id="provider_name_title4" class="provider-name-title" runat="server"> Carlie Endaya, MD </p>
                            <p id="provider_role4" class="provider-role" runat="server">PSYCHOMETRICIAN</p>
                        </div>
                        <asp:Button ID="view_profile_btn4" class="view_profile_btn" runat="server" Text="VIEW PROFILE" CssClass="view_profile_btn" OnClick="view_profile_btn_click"/>  
                    </div>
                </div>

                <div class="two-providers">
                    <div class="provider-prof">
                        <img src="user.png" class="user-avatar" />
                        <div class="provider-details">
                            <p id="provider_name_title5" class="provider-name-title" runat="server"> Mico Escosura, MD </p>
                            <p id="provider_role5" class="provider-role" runat="server">PSYCHOMETRICIAN</p>
                        </div>
                        <asp:Button ID="view_profile_btn5" class="view_profile_btn" runat="server" Text="VIEW PROFILE" CssClass="view_profile_btn" OnClick="view_profile_btn_click"/>  
                    </div>

                    <div class="provider-prof">
                        <img src="user.png" class="user-avatar" />
                        <div class="provider-details">
                            <p id="provider_name_title6" class="provider-name-title" runat="server"> Phaula Briol, MD </p>
                            <p id="provider_role6" class="provider-role" runat="server">PSYCHOMETRICIAN</p>
                        </div>
                        <asp:Button ID="view_profile_btn6" class="view_profile_btn" runat="server" Text="VIEW PROFILE" CssClass="view_profile_btn" OnClick="view_profile_btn_click" />  
                    </div>
                </div>
            </div>
        </div>

        <!--    SEE PROFILE MODAL START      -->
        <asp:Panel ID="pnlmodal" CssClass="modal" runat="server">

            <div id="modal-content" class="modal-content">
 
                <asp:Button ID="btn_close" runat="server" cssClass="btn-close" Text="Close" OnClick="btn_close_click" />

                <div class="modal-provider-prof">
                     <img src="user.png" class="user-avatar" />
                     <div class="provider-details">
                         <p id="modal_provider_name" class="provider-name-title" runat="server" > Modal Prodier's Name </p>
                         <p id="modal_provider_role" class="provider-role" runat="server" >Modal Provider's Role </p>
                     </div>

                 </div>

                <div class="modal-info">
                      <div class="provider-info">
                          <h3 class="provider-info-title"> Biography </h3>
                          <p class="provider-info-desc"> Friendly Human Being </p>
                      </div>

                    <div class="provider-info">
                        <h3 class="provider-info-title"> Specialization </h3>
                        <p class="provider-info-desc"> Psychometrician </p>
                    </div>
                </div>
            </div>
        </asp:Panel>
        <!--    SEE PROFILE MODAL END      -->
        
</asp:Content>