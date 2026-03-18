using System;
using System.Web.UI;
using System.Data;
using System.Web.UI.WebControls;

namespace QTS_By_Asmita
{
    public partial class Shows : Page
    {
        // This runs when the page loads
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        // Add a new show 
        protected void AddShow_Click(object sender, EventArgs e)
        {
            // Get the entered show ID
            var newId = txtShowID.Text?.Trim();
            // Check if the show ID already exists
            if (!string.IsNullOrEmpty(newId))
            {
                try
                {
                    if (SqlDataSource1.Select(DataSourceSelectArguments.Empty) is DataView dv)
                    {
                        foreach (DataRowView row in dv)
                        {
                            var existing = Convert.ToString(row["SW_ID"]);
                            // If the ID already exists, show a warning message 
                            if (string.Equals(existing, newId, StringComparison.OrdinalIgnoreCase))
                            {
                                lblShowWarning.Text = "Show id already exists.";
                                lblShowWarning.Visible = true;
                                return;
                            }
                        }
                    }
                }
                catch { }
            }

            // Clear any previous warning
            lblShowWarning.Text = string.Empty;
            lblShowWarning.Visible = false;

            // Set all the values for the new show
            if (SqlDataSource1 != null)
            {
                SqlDataSource1.InsertParameters["SW_ID"].DefaultValue = txtShowID.Text.Trim();

                if (ddlMovie != null)
                {
                    SqlDataSource1.InsertParameters["MV_ID"].DefaultValue = ddlMovie.SelectedValue;
                }
                else if (FindControl("txtShowMovieID") is TextBox movieTextbox)
                {
                    SqlDataSource1.InsertParameters["MV_ID"].DefaultValue = movieTextbox.Text.Trim();
                }

                if (ddlHallID != null)
                {
                    SqlDataSource1.InsertParameters["H_ID"].DefaultValue = ddlHallID.SelectedValue;
                }
                else if (FindControl("txtShowHallID") is TextBox hallTextbox)
                {
                    SqlDataSource1.InsertParameters["H_ID"].DefaultValue = hallTextbox.Text.Trim();
                }
                SqlDataSource1.InsertParameters["SW_DATE"].DefaultValue = txtShowDate.Text.Trim();
                SqlDataSource1.InsertParameters["SW_TIME"].DefaultValue = txtShowTime.Text.Trim();
                if (SqlDataSource1.InsertParameters["SW_PRICE"] != null)
                    SqlDataSource1.InsertParameters["SW_PRICE"].DefaultValue = txtPrice.Text.Trim();
                SqlDataSource1.InsertParameters["SW_TYPE"].DefaultValue = txtType.Text.Trim();
            }

            // Insert the new show into the database
            SqlDataSource1.Insert();
            GridView1.DataBind();

            // Clear all form fields
            txtShowID.Text = string.Empty;
            if (ddlMovie != null) ddlMovie.SelectedIndex = 0;
            if (ddlHallID != null) ddlHallID.SelectedIndex = 0;
            txtShowDate.Text = string.Empty;
            txtShowTime.Text = string.Empty;
            txtPrice.Text = string.Empty;
            txtType.Text = string.Empty;
        }
    }
}