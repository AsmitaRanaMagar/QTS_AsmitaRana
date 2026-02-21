using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QTS_By_Asmita
{
    public partial class About : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Ensure halls dropdown is bound on first load so user sees entries
                ddlHallSelect.DataBind();
            }
        }

        protected void SqlDataSourceHallsSelect_Selected(object sender, SqlDataSourceStatusEventArgs e)
        {
            // Diagnostic: show number of rows returned or any exception if label exists
            var lbl = this.FindControl("lblHallsError") as Label;
            if (lbl == null)
            {
                // No label present in markup; do nothing further
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
                var affected = e.AffectedRows; // may be -1 for some providers
                lbl.Text = "Halls rows returned: " + affected.ToString();
                lbl.Visible = true;
            }
        }

        protected void DdlHallSelect_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Bind shows grid when a hall is selected
            if (!string.IsNullOrEmpty(ddlHallSelect.SelectedValue))
            {
                // GridView already has DataSourceID set to SqlDataSourceShowsSelect in markup.
                GridViewShows.DataBind();
                GridViewShows.Visible = GridViewShows.Rows.Count > 0;
            }
            else
            {
                GridViewShows.Visible = false;
            }
        }

        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            // Same behavior as selecting hall: show shows if a hall is selected
            DdlHallSelect_SelectedIndexChanged(sender, e);
        }
    }
}