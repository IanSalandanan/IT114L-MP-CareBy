<%@ Page Language="C#" EnableEventValidation = "false" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="IT114L_MP_CareBy.HomePage" %>

<asp:Content ID="HomeContent" ContentPlaceHolderID="MainContent" runat="server">

    <script>

        // Variable to store the selected provider
        var selectedProvider = "";

        // Function to show the appointment popup
        function showAppointmentPopup() {
            document.getElementById("appointmentPopup").style.display = "block";
        }

        // Function to cancel the appointment popup
        function cancelAppointmentPopup() {
            document.getElementById("appointmentPopup").style.display = "none";
            document.getElementById("appointmentPopup1").style.display = "none";
            document.getElementById("appointmentPopup2").style.display = "none";
            document.getElementById("<%= txtDescription.ClientID %>").value = ""; // Clear description
            document.getElementById("<%= txtDate.ClientID %>").value = ""; // Clear date
            document.getElementById("ddlProvidersPopup1").selectedIndex = 0; // Reset provider dropdown to default option
            document.getElementById("timeBlocksContainer").innerHTML = ""; // Clear time blocks container
        }

        // Function to show the second popup and fetch available providers based on selected date
        function showAppointmentPopup1() {
            var date = document.getElementById("<%= txtDate.ClientID %>").value;
            if (date === "") {
                alert("Please select a date first.");
                return;
            }
            else {
                document.getElementById("appointmentPopup1").style.display = "block";
                document.getElementById("appointmentPopup").style.display = "none";

                PageMethods.GetAvailableProviders(date, onSuccessProviders, onErrorProvider);
            }
        }

        // Function to handle successful retrieval of available providers
        function onSuccessProviders(result) {
            var ddlProviders = document.getElementById("ddlProvidersPopup1");
            var selectProvider = document.getElementById("selectProvider");
            ddlProviders.innerHTML = ""; // Clear existing options
            selectProvider.innerHTML = "Select your provider:"

            // Check if there are providers available
            if (result.length > 0) {
                ddlProviders.disabled = false;
                ddlProviders.style.display = "block"; 

                var defaultOption = document.createElement("option");
                defaultOption.text = "Select your provider";
                defaultOption.value = ""; // You can set the value to an empty string or any default value you prefer
                ddlProviders.add(defaultOption);

                for (var i = 0; i < result.length; i++) {
                    var option = document.createElement("option");
                    option.text = result[i];
                    option.value = result[i]; // Set the value of the option to the provider's name
                    ddlProviders.add(option);                    
                }
            } else {
                // If no providers available, display "No providers available" and disable dropdown
                var option = document.createElement("option");
                selectProvider.innerHTML = "No providers available.<br/> Please choose another date."
                ddlProviders.disabled = true; // Disable dropdown
                ddlProviders.style.display = "none"; // Hide dropdown
            }

            document.getElementById("appointmentPopup1").style.display = "block";
            document.getElementById("appointmentPopup").style.display = "none";
        }

        // Function to handle error in retrieving providers
        function onErrorProvider(error) {
            console.error("An error occurred while fetching available providers:", error);
        }

        // Function to go back to the first popup
        function prevAppointmentPopup() {
            document.getElementById("appointmentPopup1").style.display = "none";
            document.getElementById("appointmentPopup").style.display = "block";
        }

        // Function to go back to the second popup
        function prevAppointmentPopup1() {
            document.getElementById("appointmentPopup2").style.display = "none";
            document.getElementById("appointmentPopup1").style.display = "block";
        }

        // Function to show the third popup and fetch time blocks for the selected provider
        function showAppointmentPopup2() {
            var selectedProvider = document.getElementById("<%= ddlProvidersPopup1.ClientID %>").value;
            if (selectedProvider === "") {
                alert("Please select a provider.");
                return;
            }
            else {
                document.getElementById("appointmentPopup2").style.display = "block";
                document.getElementById("appointmentPopup1").style.display = "none";
                PageMethods.GetTimeBlocksForProvider(selectedProvider, onSuccessTimeBlocks, onErrorTimeBlocks);
            }
        }

        // Variable to store the selected time block
        var selectedTimeBlock = "";

        // Function to handle successful retrieval of time blocks
        function onSuccessTimeBlocks(result) {
            var timeBlocksContainer = document.getElementById("timeBlocksContainer");
            timeBlocksContainer.innerHTML = "";
            for (var i = 0; i < result.length; i++) {
                var button = document.createElement("button");
                button.type = "button";
                button.className = "timeBlockButton";
                button.innerHTML = result[i];
                button.onclick = function () {
                    // Set the selected time block when a button is clicked
                    selectedTimeBlock = this.innerHTML;
                    document.getElementById("hidSelectedTimeBlock").value = selectedTimeBlock; // Set the value of the hidden field
                    alert("Selected time block: " + selectedTimeBlock);
                };
                timeBlocksContainer.appendChild(button);
            }
        }

        // Function to handle error in retrieving time blocks
        function onErrorTimeBlocks(error) {
            console.error("An error occurred while fetching time blocks:", error);
        }

     </script>

    <div class="whole_container" style="background-color: #FFF3E1;">
        <div id="greet-container">


            <img id="greeting-img" src="pinkpalawer.png" alt="page-img"/>
            <asp:LinkButton ID="profileBtn" runat="server" Text="PROFILE" CssClass="profileBtn" OnClick="profileBtn_Click"> </asp:LinkButton>

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
                            <asp:Button ID="cancelBtn" runat="server" Text="CANCEL" CssClass="cancelBtn"/>
                        </div>
                    </div>
                    <div class="start_appmt_btn_container">
                        <asp:Button ID="startBtn2" runat="server" Text="START APPOINTMENT" CssClass="startBtn2"/>
                    </div>
                </div>

                 <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"></asp:ScriptManager>

                    <div>
                        <button class="setBtn" type="button" onclick="showAppointmentPopup()">SET APPOINTMENT</button>
                    </div>

                    <!-- Appointment Popup -->
                    <div id="appointmentPopup" style="display: none;">
                        <h2 class="Popup-Title">Appointment Form</h2>
                        <h3 class="Popup-SubTitle">Reasons for Visit (optional):</h3>
                        <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Rows="10" Columns="66" CssClass="txtDescription"></asp:TextBox><br />
                        <h3 class="dateLbl">Select a Preferred Schedule</h3>
                        <asp:TextBox ID="txtDate" runat="server" TextMode="Date" CssClass="txtDate"></asp:TextBox><br />
                        <div class="btnContainer">
                            <button type="button" id="btnCancel" text="Cancel" onclick=" cancelAppointmentPopup()">Cancel</button>
                            <button type="button" id="btnNext" text="Next" onclick="showAppointmentPopup1()">Next</button>
                        </div>
                    </div>

                    <!-- Second Popup for Selecting Provider -->
                    <div id="appointmentPopup1" style="display: none;">
                        <h2 class="Popup-Title">Appointment Form</h2>
                        <asp:Label ID="selectProvider" runat="server">Select Provider:</asp:Label>
                        <asp:DropDownList ID="ddlProvidersPopup1" runat="server"></asp:DropDownList>
                        <asp:Label ID="lblSelectedProvider" runat="server" Style="display: block;"></asp:Label>
                        <button type="button" id="btnCance1" runat="server" onclick=" cancelAppointmentPopup()">Cancel</button>
                        <button type="button" id="btnPrevious" runat="server" onclick="prevAppointmentPopup()">Previous</button>
                        <button type="button" id="btnNext1" runat="server" onclick="showAppointmentPopup2()">Next</button>
                    </div>

                    <!-- Third Popup for Displaying Time Blocks -->
                    <div id="appointmentPopup2" style="display: none;">
                        <h2>Available Time Blocks:</h2>
                        <asp:Label ID="lblTimeBlocks" runat="server" Text=""></asp:Label>
                        <div id="timeBlocksContainer"></div>

                        <%--for containing the chosen timeblock in an ID--%>
                        <input type="hidden" id="hidSelectedTimeBlock" runat="server" />
                        <button type="button" id="btnCancel2" runat="server" onclick="cancelAppointmentPopup()">Close</button>
                        <button type="button" id="btnPrevious1" runat="server" onclick="prevAppointmentPopup1()">Previous</button>
                        <asp:Button ID="submitAppointment" runat="server" Text="Submit"/>
                        <%--onclick="btnSubmitAppointment_Click"--%>
                    </div>
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
                        <asp:Button class="view_profile_btn" runat="server" Text="VIEW PROFILE" CssClass="view_profile_btn"/>    
                    </div>

                    <div class="provider-prof" runat="server">
                        <img src="user.png" class="user-avatar" />
                        <div class="provider-details" runat="server">
                            <p id="provider_name_title2" class="provider-name-title" runat="server"> Annie Smith, MD </p>
                            <p id="provider_role2" class="provider-role" runat="server">PSYCHOMETRICIAN</p>
                        </div>
                        <asp:Button class="view_profile_btn" runat="server" Text="VIEW PROFILE" CssClass="view_profile_btn"/>  
                    </div>
                </div>

                <div class="two-providers">
                    <div class="provider-prof">
                        <img src="user.png" class="user-avatar" />
                        <div class="provider-details">
                            <p id="provider_name_title3" class="provider-name-title" runat="server"> Kyle De Leno, MD </p>
                            <p id="provider_role3" class="provider-role" runat="server">PSYCHOMETRICIAN</p>
                        </div>
                        <asp:Button class="view_profile_btn" runat="server" Text="VIEW PROFILE" CssClass="view_profile_btn"/>  
                    </div>

                    <div class="provider-prof">
                        <img src="user.png" class="user-avatar" />
                        <div class="provider-details">
                            <p id="provider_name_title4" class="provider-name-title" runat="server"> Casey Hollister, MD </p>
                            <p id="provider_role4" class="provider-role" runat="server">PSYCHOMETRICIAN</p>
                        </div>
                        <asp:Button class="view_profile_btn" runat="server" Text="VIEW PROFILE" CssClass="view_profile_btn"/>  
                    </div>
                </div>

                <div class="two-providers">
                    <div class="provider-prof">
                        <img src="user.png" class="user-avatar" />
                        <div class="provider-details">
                            <p id="provider_name_title5" class="provider-name-title" runat="server"> Olivia Rodriguez, MD </p>
                            <p id="provider_role5" class="provider-role" runat="server">PSYCHOMETRICIAN</p>
                        </div>
                        <asp:Button class="view_profile_btn" runat="server" Text="VIEW PROFILE" CssClass="view_profile_btn"/>  
                    </div>

                    <div class="provider-prof">
                        <img src="user.png" class="user-avatar" />
                        <div class="provider-details">
                            <p id="provider_name_title6" class="provider-name-title" runat="server"> Edward Go, MD </p>
                            <p id="provider_role6" class="provider-role" runat="server">PSYCHOMETRICIAN</p>
                        </div>
                        <asp:Button class="view_profile_btn" runat="server" Text="VIEW PROFILE" CssClass="view_profile_btn"/>  
                    </div>
                </div>
            </div>
        </div>
    </div>
    
        
</asp:Content>

