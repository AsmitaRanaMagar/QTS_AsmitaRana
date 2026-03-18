using System;
using System.Web.UI;
using System.Data;

namespace QTS_By_Asmita
{
    public partial class TheaterShows : Page
    {
        // This runs when the page loads
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GridViewShows.DataBind();
                if (GridViewShows.Rows.Count == 0)
                {
                    lblNoShows.Visible = true;
                }
            }
        }
    }
}
