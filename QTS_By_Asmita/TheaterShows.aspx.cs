using System;
using System.Web.UI;
using System.Data;

namespace QTS_By_Asmita
{
    public partial class TheaterShows : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GridViewShows.DataBind();
                // Show message if no rows
                if (GridViewShows.Rows.Count == 0)
                {
                    lblNoShows.Visible = true;
                }
            }
        }
    }
}
