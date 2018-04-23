Imports Microsoft.VisualBasic
Imports System
Imports System.Data.SqlClient
Imports System.Web.UI.WebControls
Imports DevExpress.Web.ASPxScheduler
Imports DevExpress.XtraScheduler

Partial Public Class _Default
	Inherits System.Web.UI.Page
	Private lastInsertedAppointmentId As Integer

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
		If (Not IsPostBack) Then
			ASPxScheduler1.Start = New DateTime(2008, 7, 12)
		End If
	End Sub

	' Preparing values accessable from the client side
	Protected Sub ASPxScheduler1_InitClientAppointment(ByVal sender As Object, ByVal args As InitClientAppointmentEventArgs)
		args.Properties("cpSubject") = args.Appointment.Subject
		args.Properties("cpLabel") = ASPxScheduler1.Storage.Appointments.Labels(args.Appointment.LabelId).DisplayName
		args.Properties("cpStatus") = ASPxScheduler1.Storage.Appointments.Statuses(args.Appointment.StatusId).DisplayName
		args.Properties("cpPrice") = String.Format("{0:c}", args.Appointment.CustomFields("PriceCustomField"))
		args.Properties("cpResources") = AppointmentResourceIdsToString(args.Appointment)
	End Sub

	Private Function AppointmentResourceIdsToString(ByVal apt As Appointment) As String
		Dim ids(apt.ResourceIds.Count - 1) As String

		For i As Integer = 0 To ids.Length - 1
			ids(i) = ASPxScheduler1.Storage.Resources.GetResourceById(apt.ResourceIds(i)).Caption
		Next i

		Return String.Join(", ", ids)
	End Function

	#Region "Data-Related events"
	Protected Sub ASPxScheduler1_AppointmentRowInserting(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxScheduler.ASPxSchedulerDataInsertingEventArgs)
		e.NewValues.Remove("ID")
	End Sub

	Protected Sub SqlDataSourceAppointments_Inserted(ByVal sender As Object, ByVal e As SqlDataSourceStatusEventArgs)
		Dim connection As SqlConnection = CType(e.Command.Connection, SqlConnection)

		Using command As New SqlCommand("SELECT IDENT_CURRENT('CarScheduling')", connection)
			lastInsertedAppointmentId = Convert.ToInt32(command.ExecuteScalar())
		End Using
	End Sub

	Protected Sub ASPxScheduler1_AppointmentRowInserted(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxScheduler.ASPxSchedulerDataInsertedEventArgs)
		e.KeyFieldValue = lastInsertedAppointmentId
	End Sub

	Protected Sub ASPxScheduler1_AppointmentsInserted(ByVal sender As Object, ByVal e As DevExpress.XtraScheduler.PersistentObjectsEventArgs)
		'int count = e.Objects.Count;
		'System.Diagnostics.Debug.Assert(count == 1);

		Dim apt As Appointment = CType(e.Objects(0), Appointment)
		Dim storage As ASPxSchedulerStorage = CType(sender, ASPxSchedulerStorage)
		storage.SetAppointmentId(apt, lastInsertedAppointmentId)
	End Sub
	#End Region ' Data-Related events
End Class