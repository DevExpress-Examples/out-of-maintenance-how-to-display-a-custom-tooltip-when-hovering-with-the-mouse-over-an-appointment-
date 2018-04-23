using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using DevExpress.Web.ASPxScheduler;
using DevExpress.XtraScheduler;

public partial class _Default : System.Web.UI.Page {
    private int lastInsertedAppointmentId;

    protected void Page_Load(object sender, EventArgs e) {
        if(!IsPostBack) {
            ASPxScheduler1.Start = new DateTime(2008, 7, 12);
        }
    }

    // Preparing values accessable from the client side
    protected void ASPxScheduler1_InitClientAppointment(object sender, InitClientAppointmentEventArgs args) {
        args.Properties["cpSubject"] = args.Appointment.Subject;
        args.Properties["cpLabel"] = ASPxScheduler1.Storage.Appointments.Labels[args.Appointment.LabelId].DisplayName;
        args.Properties["cpStatus"] = ASPxScheduler1.Storage.Appointments.Statuses[args.Appointment.StatusId].DisplayName;
        args.Properties["cpPrice"] = string.Format("{0:c}", args.Appointment.CustomFields["PriceCustomField"]);
        args.Properties["cpResources"] = AppointmentResourceIdsToString(args.Appointment);
    }

    private string AppointmentResourceIdsToString(Appointment apt) {
        string[] ids = new string[apt.ResourceIds.Count];

        for (int i = 0; i < ids.Length; i++) {
            ids[i] = ASPxScheduler1.Storage.Resources.GetResourceById(apt.ResourceIds[i]).Caption;
        }

        return string.Join(", ", ids);
    }

    #region Data-Related events
    protected void ASPxScheduler1_AppointmentRowInserting(object sender, DevExpress.Web.ASPxScheduler.ASPxSchedulerDataInsertingEventArgs e) {
        e.NewValues.Remove("ID");
    }

    protected void SqlDataSourceAppointments_Inserted(object sender, SqlDataSourceStatusEventArgs e) {
        SqlConnection connection = (SqlConnection)e.Command.Connection;

        using(SqlCommand command = new SqlCommand("SELECT IDENT_CURRENT('CarScheduling')", connection)) {
            lastInsertedAppointmentId = Convert.ToInt32(command.ExecuteScalar());
        }
    }

    protected void ASPxScheduler1_AppointmentRowInserted(object sender, DevExpress.Web.ASPxScheduler.ASPxSchedulerDataInsertedEventArgs e) {
        e.KeyFieldValue = lastInsertedAppointmentId;
    }

    protected void ASPxScheduler1_AppointmentsInserted(object sender, DevExpress.XtraScheduler.PersistentObjectsEventArgs e) {
        //int count = e.Objects.Count;
        //System.Diagnostics.Debug.Assert(count == 1);

        Appointment apt = (Appointment)e.Objects[0];
        ASPxSchedulerStorage storage = (ASPxSchedulerStorage)sender;
        storage.SetAppointmentId(apt, lastInsertedAppointmentId);
    }
    #endregion Data-Related events
}