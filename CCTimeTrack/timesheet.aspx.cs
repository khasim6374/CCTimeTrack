using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CCtrackNew
{
    public partial class timesheet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void gridTimesheet_InitNewRow(object sender, DevExpress.Web.Data.ASPxDataInitNewRowEventArgs e)
        {
            e.NewValues["Employee"] = Context.User.Identity.Name;
            e.NewValues["WorkDate"] = DateTime.Today;
            e.NewValues["StartTime"] = Convert.ToDateTime(DateTime.Today.ToString("MM/dd/yyyy") + " 8:00 AM");
            e.NewValues["EndTime"] = Convert.ToDateTime(DateTime.Today.ToString("MM/dd/yyyy") + " 5:00 PM");
        }

        protected void sQTimesheet_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            sQTimesheet.SelectParameters[0].DefaultValue = Context.User.Identity.Name;
        }

        protected void sQTimesheet_Init(object sender, EventArgs e)
        {
            sQTimesheet.SelectParameters[0].DefaultValue = Context.User.Identity.Name;
        }
    }
}