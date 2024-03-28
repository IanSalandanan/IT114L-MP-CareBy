<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="SetAppointment.aspx.cs" Inherits="IT114L_MP_CareBy.SetAppointment" %>

<asp:Content ID="HomeContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="appointment-main-container">
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"></asp:ScriptManager>

                <div id="outer-container">

                     <div id="container1">
                         <h2 class="Popup-Title">Appointment Form</h2>
                         <h3 class="Popup-SubTitle">Reasons for Visit</h3>
                         <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Rows="10" Columns="66" CssClass="txtDescription" placeholder="Optional"></asp:TextBox><br />
                         <h3 class="dateLbl">Select a Preferred Schedule</h3>
                         <asp:TextBox ID="txtDate" runat="server" TextMode="Date" CssClass="txtDate"></asp:TextBox><br />
                     </div>
        
                    <div id="container2">
                         <h3 class="Popup-SubTitle">Select Provider</h3> <br />
                         <asp:DropDownList ID="ddlProvidersPopup1" runat="server" CssClass="providerList">
                             <asp:ListItem Text="Select a Provider" Value="" />
                         </asp:DropDownList>
                         <asp:RequiredFieldValidator 
                             ValidationGroup ="SetAppointment"
                             ID="rfvProvider" 
                             runat="server" 
                             ControlToValidate="ddlProvidersPopup1"
                             InitialValue="" 
                             ErrorMessage="Please select a provider." 
                             Text="*" 
                             ForeColor="Red" 
                             Display="Dynamic">
                         </asp:RequiredFieldValidator>
                    </div>
        
                    <div id="container3">
                         <asp:Label ID="lblSelectedProvider" runat="server" Style="display: block;"></asp:Label>
                              <h3 class="Popup-SubTitle">Available Time Blocks</h3>
                              <asp:Label ID="lblTimeBlocks" runat="server" Text=""></asp:Label>
                              <div id="timeBlocksContainer">
                                  <asp:DropDownList ID="DropDownList1" runat="server" CssClass="providerList">
                                      <asp:ListItem Text="Select a Time Block" Value="" />
                                  </asp:DropDownList>
                                  <asp:RequiredFieldValidator 
                                      ValidationGroup ="SetAppointment"
                                      ID="RequiredFieldValidator1" 
                                      runat="server" 
                                      ControlToValidate="DropDownList1"
                                      InitialValue="" 
                                      ErrorMessage="Select Time Stamp." 
                                      Text="*" 
                                      ForeColor="Red" 
                                      Display="Dynamic">
                                  </asp:RequiredFieldValidator>
                              </div>
                              <asp:Button ID="submitAppointment" runat="server" Text="Submit" onclick="btnSubmitAppointment_Click" CssClass="subBut"/>

                    </div>

                </div>

            </ContentTemplate>
        </asp:UpdatePanel>

    </div>

</asp:Content>