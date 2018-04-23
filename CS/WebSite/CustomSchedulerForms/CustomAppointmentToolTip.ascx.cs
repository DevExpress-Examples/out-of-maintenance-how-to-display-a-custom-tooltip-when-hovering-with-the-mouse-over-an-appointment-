using System;
using System.Web.UI;
using DevExpress.Web.ASPxScheduler;

public partial class UserForms_CustomAppointmentTooltip : ASPxSchedulerToolTipBase {
    public override bool ToolTipShowStem { get { return false; } }
    public override string ClassName { get { return "ASPxClientAppointmentToolTip"; } }
    protected override void OnLoad(EventArgs e) {
        base.OnLoad(e);
    }
    protected override Control[] GetChildControls() {
        Control[] controls = new Control[] { lblSubject, lblPrice, lblStatus, lblLabel,lblResources, lblInterval, lblShowMenu, btnDelete, btnEdit};
        return controls;
    }
}
