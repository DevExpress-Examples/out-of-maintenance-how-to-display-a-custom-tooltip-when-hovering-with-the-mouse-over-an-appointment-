<%@ Control Language="vb" AutoEventWireup="true" CodeFile="CustomAppointmentTooltip.ascx.vb"
    Inherits="UserForms_CustomAppointmentTooltip" %>
<%@ Register Assembly="DevExpress.Web.v18.2" Namespace="DevExpress.Web"
    TagPrefix="dxe" %>
<link rel="stylesheet" type="text/css" href="CSS/CustomToolTip.css" />
<div class="cToolTipContainer">
    <div class="cToolTipTopLeftCorner">
        &nbsp;</div>
    <div class="cToolTipTopSide">
        &nbsp;</div>
    <div class="cToolTipTopRightCorner">
        &nbsp;</div>
    <div class="cToolTipClearFlow">
        &nbsp;</div>
    <div class="cToolTipLeftSide">
        <div class="cToolTipRightSide">
            <div>
                <div>
                    <table>
                        <tr>
                            <td>
                                Interval:
                            </td>
                            <td>
                                <dxe:ASPxLabel runat="server" ID="lblInterval" EnableClientSideAPI="true" Font-Size="9pt"
                                    Font-Names="Tahoma" ForeColor="black" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Subject:
                            </td>
                            <td>
                                <dxe:ASPxLabel runat="server" ID="lblSubject" EnableClientSideAPI="true" Font-Size="9pt"
                                    Font-Names="Tahoma" ForeColor="black" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Label:
                            </td>
                            <td>
                                <dxe:ASPxLabel runat="server" ID="lblLabel" EnableClientSideAPI="true" Font-Size="9pt"
                                    Font-Names="Tahoma" ForeColor="black" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Status:
                            </td>
                            <td>
                                <dxe:ASPxLabel runat="server" ID="lblStatus" EnableClientSideAPI="true" Font-Size="9pt"
                                    Font-Names="Tahoma" ForeColor="black" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Price:
                            </td>
                            <td>
                                <dxe:ASPxLabel runat="server" ID="lblPrice" EnableClientSideAPI="true" Font-Size="9pt"
                                    Font-Names="Tahoma" ForeColor="black" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Resources:
                            </td>
                            <td>
                                <dxe:ASPxLabel runat="server" ID="lblResources" EnableClientSideAPI="true" Font-Size="9pt"
                                    Font-Names="Tahoma" ForeColor="black" />
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <div class="cToolTipLeftSide cToolTipFooter">
        <div class="cToolTipRightSide">
            <div style="padding: 0 1px;">
                <div class="cToolTipSeparatingStrip">
                    &nbsp;</div>
            </div>
            <div style="padding: 13px 14px 12px 13px;">
                <div style="float: right; width: 50%;">
                    <div style="float: right;">
                        <dxe:ASPxButton runat="server" ID="btnDelete" Text="Delete" EnableClientSideAPI="true"
                            AutoPostBack="false">
                        </dxe:ASPxButton>
                    </div>
                    <div style="float: right; padding-right: 5px;">
                        <dxe:ASPxButton runat="server" ID="btnEdit" Text="Edit" EnableClientSideAPI="true"
                            AutoPostBack="false">
                        </dxe:ASPxButton>
                    </div>
                </div>
                <div runat="server" id="lblShowMenu" style="cursor: pointer; text-decoration: underline;
                    width: 100px; color: #3e6b96; font-family: Tahoma; font-size: 9pt; padding-top: 4px;">
                    Show menu</div>
            </div>
        </div>
    </div>
    <div class="cToolTipClearFlow">
        &nbsp;</div>
    <div class="cToolTipBottomLeftCorner">
        &nbsp;</div>
    <div class="cToolTipBottomSide">
        <div class="cToolTipBottomSideSizeFixer">
            &nbsp;</div>
    </div>
    <div class="cToolTipBottomRightCorner">
        &nbsp;</div>
    <div class="cToolTipClearFlow">
        &nbsp;</div>
</div>

<script type="text/javascript" id="dxss_">
    ASPxClientAppointmentToolTip = ASPx.CreateClass(ASPxClientToolTipBase, {
        Initialize: function() {
            this.controls.btnEdit.Click.AddHandler(ASPx.CreateDelegate(this.OnBtnEditClick, this));
            this.controls.btnDelete.Click.AddHandler(ASPx.CreateDelegate(this.OnBtnDeleteClick, this));
            ASPxClientUtils.AttachEventToElement(this.controls.lblShowMenu, "click", ASPx.CreateDelegate(this.OnLblShowMenuClick, this));
        },
        Update: function(data) {
            var apt = data.GetAppointment();
            this.apt = apt;

            // Update client labels based on the values prepared on the server side
            var textInterval = this.ConvertIntervalToString(apt.interval);
            this.controls.lblInterval.SetText(textInterval);

            this.controls.lblSubject.SetText(apt.cpSubject);
            this.controls.lblLabel.SetText(apt.cpLabel);
            this.controls.lblStatus.SetText(apt.cpStatus);
            this.controls.lblPrice.SetText(apt.cpPrice);
            this.controls.lblResources.SetText(apt.cpResources);

//            if (!apt.updated) {
//                this.scheduler.RefreshClientAppointmentProperties(apt, AppointmentPropertyNames.Normal + ";PriceCustomField", ASPx.CreateDelegate(this.OnAppointmentRefresh, this));
//                this.controls.lblSubject.SetText("Loading...");
//                this.controls.lblPrice.SetText("Loading...");
//            } else {
//                this.controls.lblSubject.SetText(apt.GetSubject());
//                this.controls.lblPrice.SetText(apt.PriceCustomField);
//            }
        },
        OnButtonDivClick: function(s, e) {
            this.ShowAppointmentMenu(s);
        },
        OnBtnEditClick: function() {
            this.scheduler.ShowAppointmentFormByClientId(this.apt.GetId());
            this.Close();
        },
        OnBtnDeleteClick: function() {
            this.scheduler.DeleteAppointment(this.apt);
        },
        OnLblShowMenuClick: function(e) {
            this.ShowAppointmentMenu(e);
        }
    });    
</script>