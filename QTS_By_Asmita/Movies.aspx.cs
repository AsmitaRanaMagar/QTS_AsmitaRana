using System;
using System.Web.UI;
using System.Data;

namespace QTS_By_Asmita
{
    public partial class Movies : Page
    {
        // This runs when the page loads
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        // Add a new movie when the button is clicked
        protected void AddMovie_Click(object sender, EventArgs e)
        {
            // Get the entered movie ID
            var newId = txtMovieID.Text?.Trim();
            // Check if the movie ID already exists
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
                }
            }

            // Clear any previous warning message
            lblMovieWarning.Text = string.Empty;
            lblMovieWarning.Visible = false;

            // Set all the values for the new movie
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

            // Insert the new movie into the database
            SqlDataSource1.Insert();
            GridView1.DataBind();

            // Clear all form fields after adding
            txtMovieID.Text = string.Empty;
            txtTitle.Text = string.Empty;
            txtGenre.Text = string.Empty;
            txtLang.Text = string.Empty;
            txtRelease.Text = string.Empty;
            txtDuration.Text = string.Empty;
            txtDesc.Text = string.Empty;
        }

        // This runs when the movie dropdown is changed
        protected void DdlMovieSelect_SelectedIndexChanged(object sender, EventArgs e)
        {
            rptTopHalls?.DataBind();

            if (FindControl("lblNoTopHalls") is System.Web.UI.WebControls.Label noLabel)
            {
                noLabel.Visible = (rptTopHalls == null) || (rptTopHalls.Items.Count == 0);
            }
        }

        // This runs when the occupancy data source is selected
        protected void SqlDataSourceOccupancy_Selected(object sender, System.Web.UI.WebControls.SqlDataSourceStatusEventArgs e)
        {
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

            if (noLabel != null)
            {
                if (e.AffectedRows > 0)
                {
                    noLabel.Visible = false;
                }
                else
                {
                    noLabel.Visible = (rptTopHalls == null) || (rptTopHalls.Items.Count == 0);
                    noLabel.Text = "No halls found for selected movie";
                }
            }
        }

        // This runs when a command is triggered on the repeater
        protected void RptTopHalls_ItemCommand(object source, System.Web.UI.WebControls.RepeaterCommandEventArgs e)
        {

        }
    }
}