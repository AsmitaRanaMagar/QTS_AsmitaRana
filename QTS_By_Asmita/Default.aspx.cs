using System;
using System.Web.UI;
using System.Data;

namespace QTS_By_Asmita
{
    public partial class Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Read counts from SqlDataSource controls
                try
                {
                    var dvCust = sdsCustomersCount.Select(DataSourceSelectArguments.Empty) as DataView;
                    if (dvCust != null && dvCust.Count > 0 && dvCust[0]["CNT"] != DBNull.Value)
                    {
                        lblTotalCustomers.Text = dvCust[0]["CNT"].ToString();
                    }

                    var dvMov = sdsMoviesCount.Select(DataSourceSelectArguments.Empty) as DataView;
                    if (dvMov != null && dvMov.Count > 0 && dvMov[0]["CNT"] != DBNull.Value)
                    {
                        lblTotalMovies.Text = dvMov[0]["CNT"].ToString();
                    }

                    var dvShows = sdsShowsTodayCount.Select(DataSourceSelectArguments.Empty) as DataView;
                    if (dvShows != null && dvShows.Count > 0 && dvShows[0]["CNT"] != DBNull.Value)
                    {
                        lblTotalShowsToday.Text = dvShows[0]["CNT"].ToString();
                    }
                }
                catch (Exception ex)
                {
                    // Fail silently; show 0 if queries fail
                    lblTotalCustomers.Text = "0";
                    lblTotalMovies.Text = "0";
                    lblTotalShowsToday.Text = "0";
                }
            }
        }
    }
}