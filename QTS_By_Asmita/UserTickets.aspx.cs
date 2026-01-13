using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QTS_By_Asmita
{
    public partial class UserTickets : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // clear grid initially
                TicketList.DataSource = null;
                TicketList.DataBind();
            }
        }

        protected void CutomerDd_SelectedIndexChanged(object sender, EventArgs e)
        {
            // when customer changes, reset range to default (15 days) and refresh grid
            DateDd.SelectedIndex = 0;
            SetStartDateParameter();
            TicketList.DataBind();
        }

        protected void DateDd_SelectedIndexChanged(object sender, EventArgs e)
        {
            SetStartDateParameter();
            TicketList.DataBind();
        }

        private void SetStartDateParameter()
        {
            var start = DateTime.Today;
            switch (DateDd.SelectedValue)
            {
                case "15d":
                    start = DateTime.Today.AddDays(-15);
                    break;
                case "1m":
                    start = DateTime.Today.AddMonths(-1);
                    break;
                case "3m":
                    start = DateTime.Today.AddMonths(-3);
                    break;
                case "6m":
                    start = DateTime.Today.AddMonths(-6);
                    break;
                case "all":
                    start = new DateTime(1900, 1, 1);
                    break;
            }
            // format as yyyy-MM-dd for the Oracle TO_DATE in SqlDataSource
            var startString = start.ToString("yyyy-MM-dd");
            SqlDataSource2.SelectParameters["START_DATE"].DefaultValue = startString;
        }
    }
}