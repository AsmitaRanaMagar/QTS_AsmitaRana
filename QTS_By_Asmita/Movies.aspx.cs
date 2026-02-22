using System;
using System.Web.UI;
using System.Data;

namespace QTS_By_Asmita
{
    public partial class Movies : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void AddMovie_Click(object sender, EventArgs e)
        {
            var newId = txtMovieID.Text?.Trim();
            if (!string.IsNullOrEmpty(newId))
            {
                try
                {
                    if (SqlDataSource1.Select(DataSourceSelectArguments.Empty) is DataView dv)
                    {
                        foreach (DataRowView row in dv)
                        {
                            var existing = Convert.ToString(row["MOVIE_ID"]);
                            if (string.Equals(existing, newId, StringComparison.OrdinalIgnoreCase))
                            {
                                lblMovieWarning.Text = "Movie id already exists.";
                                lblMovieWarning.Visible = true;
                                return;
                            }
                        }
                    }
                }
                catch
                {
                    // if select fails, continue to attempt insert (optional: log)
                }
            }

            // proceed with insert - hide any previous warning
            lblMovieWarning.Text = string.Empty;
            lblMovieWarning.Visible = false;

            if (SqlDataSource1 != null)
            {
                SqlDataSource1.InsertParameters["MOVIE_ID"].DefaultValue = txtMovieID.Text.Trim();
                SqlDataSource1.InsertParameters["MOVIE_TITLE"].DefaultValue = txtTitle.Text.Trim();
                SqlDataSource1.InsertParameters["GENRE"].DefaultValue = txtGenre.Text.Trim();
                SqlDataSource1.InsertParameters["LANGUAGE"].DefaultValue = txtLang.Text.Trim();
                SqlDataSource1.InsertParameters["RELEASE_DATE"].DefaultValue = txtRelease.Text.Trim();
                SqlDataSource1.InsertParameters["DURATION"].DefaultValue = txtDuration.Text.Trim();
                SqlDataSource1.InsertParameters["DESCRIPTION"].DefaultValue = txtDesc.Text.Trim();
            }

            SqlDataSource1.Insert();
            GridView1.DataBind();

            txtMovieID.Text = string.Empty;
            txtTitle.Text = string.Empty;
            txtGenre.Text = string.Empty;
            txtLang.Text = string.Empty;
            txtRelease.Text = string.Empty;
            txtDuration.Text = string.Empty;
            txtDesc.Text = string.Empty;
        }

        protected void DdlMovieSelect_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Rebind repeater when selection changes
            rptTopHalls?.DataBind();

            // Show/hide no-results label
            if (FindControl("lblNoTopHalls") is System.Web.UI.WebControls.Label noLabel)
            {
                noLabel.Visible = (rptTopHalls == null) || (rptTopHalls.Items.Count == 0);
            }
        }

        protected void SqlDataSourceOccupancy_Selected(object sender, System.Web.UI.WebControls.SqlDataSourceStatusEventArgs e)
        {
            // Use lblNoTopHalls to display errors or no-results
            var noLabel = FindControl("lblNoTopHalls") as System.Web.UI.WebControls.Label;

            if (e.Exception != null)
            {
                if (noLabel != null)
                {
                    noLabel.Text = "Error loading occupancy: " + e.Exception.Message;
                    noLabel.Visible = true;
                }
                e.ExceptionHandled = true;
                return;
            }

            // If affected rows available, use it; otherwise check repeater items after binding
            if (noLabel != null)
            {
                if (e.AffectedRows > 0)
                {
                    noLabel.Visible = false;
                }
                else
                {
                    // If AffectedRows unknown (-1), rely on repeater item count
                    noLabel.Visible = (rptTopHalls == null) || (rptTopHalls.Items.Count == 0);
                    noLabel.Text = "No halls found for selected movie";
                }
            }
        }

        protected void RptTopHalls_ItemCommand(object source, System.Web.UI.WebControls.RepeaterCommandEventArgs e)
        {

        }
    }
}