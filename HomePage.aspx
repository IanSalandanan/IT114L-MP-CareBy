<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="IT114L_MP_CareBy.HomePage" %>

<asp:Content ID="HomeContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="whole_container" style="background-color: #FFF3E1;">
        <div id="greet-container">

            <h2 id="welcome-title">Welcome To CareBy</h2>
            <asp:LinkButton ID="profileBtn" runat="server" Text="Profile" CssClass="profileBtn" OnClick="profileBtn_Click"> </asp:LinkButton>

        </div>

        <div id="user-details-container">

             <div id="box-container">
                  <p class="upcoming_appmt_title">UPCOMING APPOINTMENTS</p>

                <div id="appointment-container">
            
                    <div class="details_cancel_container">
                        <div class="appmt_details_container">
                            <div class="detail_container">
                                <img src="doctor.png" class="doctor-avatar" />
                                <p class="doctor_name"> Benet Versoza, MD</p>
                            </div>
                            <div class="detail_container">
                                <img src="calendar.png" class="calendar-icon"/>
                                <p class="appmt_date"> 24 Mar 2024, 3:30 PM </p>
                            </div>
                        </div>
                        <div class="cancel_butn_container">
                            <asp:Button ID="cancelBtn" runat="server" Text="Cancel" CssClass="cancelBtn"/>
                        </div>
                    </div>
                    <div class="start_appmt_btn_container">
                        <asp:Button ID="startBtn2" runat="server" Text="Start Appointment" CssClass="startBtn2"/>
                    </div>
                </div>
                <asp:Button ID="setBtn" runat="server" Text="Set Appointment" CssClass="setBtn"/>
             </div>
 
             <img id="page-img" src="homepageart.png" alt="page-img"/>
     
        </div>


        <div class="our-providers-container">
            <h2 class="our-providers-title"> OUR PROVIDERS </h2>

            <div id="providers_container" class="all-providers-container" runat="server">
                <div class="two-providers" runat="server">
                    <div class="provider-prof" runat="server">
                        <img src="user.png" class="user-avatar" />
                        <div class="provider-details" runat="server">
                            <p id="provider_name_title1" class="provider-name-title" runat="server"> Benet Versoza, MD </p>
                            <p id="provider_role1" class="provider-role" runat="server">PSYCHOMETRICIAN</p>
                        </div>
                        <asp:Button ID="see_profile_btn1" runat="server" Text="SEE PROFILE" CssClass="see_profile_btn" OnClick="see_profile_btn_click" />    
                    </div>

                    <div class="provider-prof" runat="server">
                        <img src="user.png" class="user-avatar" />
                        <div class="provider-details" runat="server">
                            <p id="provider_name_title2" class="provider-name-title" runat="server"> Annie Smith, MD </p>
                            <p id="provider_role2" class="provider-role" runat="server">PSYCHOMETRICIAN</p>
                        </div>
                        <asp:Button ID="see_profile_btn2" runat="server" Text="SEE PROFILE" CssClass="see_profile_btn" OnClick="see_profile_btn_click" />
                    </div>
                </div>

                <div class="two-providers">
                    <div class="provider-prof">
                        <img src="user.png" class="user-avatar" />
                        <div class="provider-details">
                            <p id="provider_name_title3" class="provider-name-title" runat="server"> Kyle De Leno, MD </p>
                            <p id="provider_role3" class="provider-role" runat="server">PSYCHOMETRICIAN</p>
                        </div>
                        <asp:Button ID="see_profile_btn3" runat="server" Text="SEE PROFILE" CssClass="see_profile_btn" OnClick="see_profile_btn_click" />
                    </div>

                    <div class="provider-prof">
                        <img src="user.png" class="user-avatar" />
                        <div class="provider-details">
                            <p id="provider_name_title4" class="provider-name-title" runat="server"> Casey Hollister, MD </p>
                            <p id="provider_role4" class="provider-role" runat="server">PSYCHOMETRICIAN</p>
                        </div>
                        <asp:Button ID="see_profile_btn4" runat="server" Text="SEE PROFILE" CssClass="see_profile_btn" OnClick="see_profile_btn_click" />
                    </div>
                </div>

                <div class="two-providers">
                    <div class="provider-prof">
                        <img src="user.png" class="user-avatar" />
                        <div class="provider-details">
                            <p id="provider_name_title5" class="provider-name-title" runat="server"> Olivia Rodriguez, MD </p>
                            <p id="provider_role5" class="provider-role" runat="server">PSYCHOMETRICIAN</p>
                        </div>
                        <asp:Button ID="see_profile_btn5" runat="server" Text="SEE PROFILE" CssClass="see_profile_btn" OnClick="see_profile_btn_click" />
                    </div>

                    <div class="provider-prof">
                        <img src="user.png" class="user-avatar" />
                        <div class="provider-details">
                            <p id="provider_name_title6" class="provider-name-title" runat="server"> Edward Go, MD </p>
                            <p id="provider_role6" class="provider-role" runat="server">PSYCHOMETRICIAN</p>
                        </div>
                        <asp:Button ID="see_profile_btn6" runat="server" Text="SEE PROFILE" CssClass="see_profile_btn" OnClick="see_profile_btn_click" />
                    </div>
                </div>
        
          
    
            <!-- ============================== -->
            <!--        M O D A L    START      -->
            <!-- ============================== -->
            <asp:Panel ID="pnlmodal" CssClass="modal" runat="server">

                <div id="modal-content" class="modal-content">
             
                    <div class="modal-close-btn">
                        <asp:Button ID="btn_close" runat="server" cssClass="btn-close" Text="x" OnClick="btn_close_click" />
                   </div>

                    <div class="modal-provider-prof">
                         <img src="user.png" class="user-avatar" />
                         <div class="provider-details">
                             <p id="modal_provider_name" class="provider-name-title" runat="server" > Modal Prodier's Name </p>
                             <p id="modal_provider_role" class="provider-role" runat="server" >Modal Provider's Role </p>
                         </div>
                         <asp:Button ID="Book_Appointment_Button" runat="server" Text="BOOK APPOINTMENT" CssClass="book_appmt_btn"  />
                     </div>

                    <div class="modal-info">
                          <div class="provider-info">
                              <p class="provider-info-title"> Biography </p>
                              <p class="provider-info-desc">Psychometrician</p>
                          </div>

                        <div class="provider-info">
                            <p class="provider-info-title"> Specialization </p>
                            <p class="provider-info-desc">Psychometrician</p>
                        </div>
                    </div>
                </div>
            </asp:Panel>

            <!-- ============================== -->
            <!--        M O D A L    END        -->
            <!-- ============================== -->

            <!-- HEALTH CONCERN MODAL -->
            <%--<asp:Panel ID="pnlmodal_bk_appmt" CssClass="modal_bk_appmt" runat="server">

                <div class="modal_bk_appmt_content">

                    <!-- <div class="modal-close-btn">
                            <asp:Button ID="btn_close_bk_appmt" runat="server" cssClass="btn-close" Text="x" />
                    </div>-->
                    <div>
                        <p>WHAT IS YOUR HEALTH CONCERN TODAY?</p>
                
                        <div class="health_concern_container">
                            <p>Reason for Visit (Optional):</p>
                            <asp:TextBox ID="txtTextArea" CssClass="health_conc_textarea" runat="server" TextMode="MultiLine" Rows="4" Columns="20"  Height="100px" Width="600px"></asp:TextBox>

                        </div>

                        <div class="calendar_schedule_container">
                            <div class="calendar_container">
                                <p>Please Select Your Available Schedule:</p>
                                <asp:Calendar ID="Appointment_Calendar" CssClass="appointment_calendar" runat="server" OnSelectionChanged="Appointment_Calendar_SelectionChanged"></asp:Calendar>
                                <br />
                                <asp:Label ID="SelectedDateLabel" runat="server" Text="Selected Date:"></asp:Label>
                            </div>
                            <div class="provider_time_container">
                                <div class="provider_container">
                                    <asp:DropDownList ID="Provider_DDL" runat="server">
                                        <asp:ListItem Text="Benet Versoza" Value=""></asp:ListItem>
                                        <asp:ListItem Text="Annie Smith" Value=""></asp:ListItem>
                                        <asp:ListItem Text="Kyle De Leno" Value=""></asp:ListItem>
                                        <asp:ListItem Text="Casey Hollister" Value=""></asp:ListItem>
                                        <asp:ListItem Text="Olivia Rodriguez" Value=""></asp:ListItem>
                                        <asp:ListItem Text="Edward Go" Value=""></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="time_container">

                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </asp:Panel>--%>

            </div>
     
        </div>
    </div>
</asp:Content>