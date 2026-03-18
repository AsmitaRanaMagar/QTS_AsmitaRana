using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QTS_By_Asmita
{
    public partial class About : Page
    {
        // This runs when the page loads
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlHallSelect.DataBind();
            }
        }

        // This runs when the halls data source is selected
        protected void SqlDataSourceHallsSelect_Selected(object sender, SqlDataSourceStatusEventArgs e)
        {
            var lbl = this.FindControl("lblHallsError") as Label;
            if (lbl == null)
            {
                return;
            }

            if (e.Exception != null)
            {
                lbl.Text = "Error loading halls: " + e.Exception.Message;
                lbl.Visible = true;
                e.ExceptionHandled = true;
            }
            else
            {
                var affected = e.AffectedRows;
                lbl.Text = "Halls rows returned: " + affected.ToString();
                lbl.Visible = true;
            }
        }

        // This runs when the hall dropdown is changed
        protected void DdlHallSelect_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(ddlHallSelect.SelectedValue))
            {
                GridViewShows.DataBind();
                GridViewShows.Visible = GridViewShows.Rows.Count > 0;
            }
            else
            {
                GridViewShows.Visible = false;
            }
        }

        // This runs when the submit button is clicked
        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            DdlHallSelect_SelectedIndexChanged(sender, e);
        }
    }
}