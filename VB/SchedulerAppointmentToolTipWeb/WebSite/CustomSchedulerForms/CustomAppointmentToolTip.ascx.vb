Imports System
Imports System.Web.UI
Imports DevExpress.Web.ASPxScheduler

Partial Public Class UserForms_CustomAppointmentTooltip
    Inherits ASPxSchedulerToolTipBase

    Public Overrides ReadOnly Property ToolTipShowStem() As Boolean
        Get
            Return False
        End Get
    End Property
    Public Overrides ReadOnly Property ClassName() As String
        Get
            Return "ASPxClientAppointmentToolTip"
        End Get
    End Property
    Protected Overrides Sub OnLoad(ByVal e As EventArgs)
        MyBase.OnLoad(e)
    End Sub
    Protected Overrides Function GetChildControls() As Control()

        Dim controls_Renamed() As Control = { lblSubject, lblPrice, lblStatus, lblLabel,lblResources, lblInterval, lblShowMenu, btnDelete, btnEdit}
        Return controls_Renamed
    End Function
End Class
