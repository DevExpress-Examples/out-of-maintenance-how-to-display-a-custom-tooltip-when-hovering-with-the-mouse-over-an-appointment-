<!-- default badges list -->
![](https://img.shields.io/endpoint?url=https://codecentral.devexpress.com/api/v1/VersionRange/128546467/18.2.3%2B)
[![](https://img.shields.io/badge/Open_in_DevExpress_Support_Center-FF7200?style=flat-square&logo=DevExpress&logoColor=white)](https://supportcenter.devexpress.com/ticket/details/E3224)
[![](https://img.shields.io/badge/📖_How_to_use_DevExpress_Examples-e9f6fc?style=flat-square)](https://docs.devexpress.com/GeneralInformation/403183)
<!-- default badges end -->
# How to display a custom ToolTip when hovering with the mouse over an appointment


<p>This example illustrates how to customize an appointment ToolTip (by default, it invokes an appointment context menu). To do this, you should override a CustomAppointmentTooltip template of the ASPxScheduler (see <a href="http://documentation.devexpress.com/#AspNet/CustomDocument4550"><u>Templates</u></a>).</p><p>Basically, you can use the <a href="http://documentation.devexpress.com/#AspNet/DevExpressWebASPxSchedulerScriptsASPxClientScheduler_RefreshClientAppointmentPropertiestopic"><u>ASPxClientScheduler.RefreshClientAppointmentProperties Method</u></a> to obtain standard and custom appointment fields (see <a href="https://www.devexpress.com/Support/Center/p/Q277355">CustomFields in AppointmentToolTip</a>). However, in v2010 vol 2 we have implemented a simpler and more flexible mechanism for preparing arbitrary values (not only standard and custom field values) for a client-side appointment object: <a href="https://www.devexpress.com/Support/Center/p/S33646">Provide the ability for the client appointments to always possess certain properties</a>. In previous versions, a similar functionality can be achieved only when using custom JSProperties (see <a href="https://www.devexpress.com/Support/Center/p/Q276425">aspxscheduler tooltip</a>).</p><p>Also, there is a <strong>CalculatePosition()</strong> method in the <strong>ASPxClientToolTipBase</strong> class. You can override it in the inheritor (custom tooltip) to provide custom coordinates as shown in the <a href="https://www.devexpress.com/Support/Center/p/Q273610">Appointment tooltip position</a> thread.</p>

<br/>


