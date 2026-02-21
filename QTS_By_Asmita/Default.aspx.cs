using System;
using System.Web.UI;
using System.Data;
using System.Configuration;
using System.Data.Common;

namespace QTS_By_Asmita
{
    public partial class Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    // Try direct DB access using the connection string/provider for more reliable counts
                    try
                    {
                        lblTotalCustomers.Text = GetCount("SELECT COUNT(*) AS CNT FROM \"CUSTOMERS\"").ToString();
                        lblTotalMovies.Text = GetCount("SELECT COUNT(*) AS CNT FROM \"MOVIES\"").ToString();
                        lblTotalShowsToday.Text = GetCount("SELECT COUNT(*) AS CNT FROM \"SHOWS\" WHERE TRUNC(\"SW_DATE\") = TRUNC(SYSDATE)").ToString();
                    }
                    catch
                    {
                        // Fallback to reading from SqlDataSource controls if direct DB access fails
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

                    // Ensure repeaters load their data from the SqlDataSource controls so real data is shown
                    try { rptHallsTheatre.DataBind(); } catch { }
                    try { rptTopMovies.DataBind(); } catch { }
                }
                catch (Exception)
                {
                    // If counts failed, set zeros and still attempt to bind lists so UI shows available data
                    lblTotalCustomers.Text = "0";
                    lblTotalMovies.Text = "0";
                    lblTotalShowsToday.Text = "0";

                    try { rptHallsTheatre.DataBind(); } catch { }
                    try { rptTopMovies.DataBind(); } catch { }
                }
            }
        }

        private int GetCount(string sql)
        {
            try
            {
                var cs = ConfigurationManager.ConnectionStrings["ConnectionStringQTX"];
                if (cs == null || string.IsNullOrEmpty(cs.ConnectionString))
                    return 0;

                var factory = DbProviderFactories.GetFactory(cs.ProviderName);
                using (var conn = factory.CreateConnection())
                {
                    conn.ConnectionString = cs.ConnectionString;
                    using (var cmd = conn.CreateCommand())
                    {
                        cmd.CommandText = sql;
                        conn.Open();
                        var result = cmd.ExecuteScalar();
                        if (result == null || result == DBNull.Value)
                            return 0;
                        return Convert.ToInt32(result);
                    }
                }
            }
            catch
            {
                return 0;
            }
        }
    }
}