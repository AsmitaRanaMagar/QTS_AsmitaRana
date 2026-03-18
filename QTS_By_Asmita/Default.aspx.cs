using System;
using System.Web.UI;
using System.Data;
using System.Configuration;
using System.Data.Common;

namespace QTS_By_Asmita
{
    public partial class Default : Page
    {
        // This runs when the page loads
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    try
                    {
                        lblTotalCustomers.Text = GetCount("SELECT COUNT(*) AS CNT FROM \"CUSTOMERS\"").ToString();
                        lblTotalMovies.Text = GetCount("SELECT COUNT(*) AS CNT FROM \"MOVIES\"").ToString();
                        lblTotalShowsToday.Text = GetCount("SELECT COUNT(*) AS CNT FROM \"SHOWS\" WHERE TRUNC(\"SW_DATE\") = TRUNC(SYSDATE)").ToString();
                    }
                    catch
                    {
                        if (sdsCustomersCount.Select(DataSourceSelectArguments.Empty) is DataView dvCust && dvCust.Count > 0 && dvCust[0]["CNT"] != DBNull.Value)
                        {
                            lblTotalCustomers.Text = dvCust[0]["CNT"].ToString();
                        }

                        if (sdsMoviesCount.Select(DataSourceSelectArguments.Empty) is DataView dvMov && dvMov.Count > 0 && dvMov[0]["CNT"] != DBNull.Value)
                        {
                            lblTotalMovies.Text = dvMov[0]["CNT"].ToString();
                        }

                        if (sdsShowsTodayCount.Select(DataSourceSelectArguments.Empty) is DataView dvShows && dvShows.Count > 0 && dvShows[0]["CNT"] != DBNull.Value)
                        {
                            lblTotalShowsToday.Text = dvShows[0]["CNT"].ToString();
                        }
                    }

                    try { rptHallsTheatre.DataBind(); } catch { }
                    try { rptTopMovies.DataBind(); } catch { }
                }
                catch (Exception)
                {
                    lblTotalCustomers.Text = "0";
                    lblTotalMovies.Text = "0";
                    lblTotalShowsToday.Text = "0";

                    try { rptHallsTheatre.DataBind(); } catch { }
                    try { rptTopMovies.DataBind(); } catch { }
                }
            }
        }

        // Get the count from the database using SQL
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