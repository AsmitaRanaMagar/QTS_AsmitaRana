using System;
using System.Web.UI;
using System.Data;

namespace QTS_By_Asmita
{
    public partial class Halls : Page
    {
        // This runs when the page loads
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        // Add a new hall when the button is clicked
        protected void AddHall_Click(object sender, EventArgs e)
        {
            var newId = txtHallID.Text?.Trim();
            if (!string.IsNullOrEmpty(newId))
            {
                try
                {
                    if (SqlDataSource1.Select(DataSourceSelectArguments.Empty) is DataView dv)
                    {
                        foreach (DataRowView row in dv)
                        {
                            var existing = Convert.ToString(row["H_ID"]);
                            if (string.Equals(existing, newId, StringComparison.OrdinalIgnoreCase))
                            {
                                lblHallWarning.Text = "Hall id already exists.";
                                lblHallWarning.Visible = true;
                                return;
                            }
                        }
                    }
                }
                catch { }
            }

            lblHallWarning.Text = string.Empty;
            lblHallWarning.Visible = false;

            if (SqlDataSource1 != null)
            {
                SqlDataSource1.InsertParameters["H_ID"].DefaultValue = txtHallID.Text.Trim();
                if (ddlTheaterID != null)
                {
                    SqlDataSource1.InsertParameters["THR_ID"].DefaultValue = ddlTheaterID.SelectedValue;
                }
                SqlDataSource1.InsertParameters["H_NAME"].DefaultValue = txtHallName.Text.Trim();
                SqlDataSource1.InsertParameters["H_CAPACITY"].DefaultValue = txtCapacity.Text.Trim();
                SqlDataSource1.InsertParameters["H_STATUS"].DefaultValue = txtStatus.Text.Trim();
            }

            SqlDataSource1.Insert();
            GridView1.DataBind();

            txtHallID.Text = string.Empty;
            if (ddlTheaterID != null) ddlTheaterID.SelectedIndex = 0;
            txtHallName.Text = string.Empty;
            txtCapacity.Text = string.Empty;
            txtStatus.Text = string.Empty;
        }

        // This runs when the hall dropdown is changed
        public void DdlHallSelect_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlHallSelect?.SelectedValue is string selected && !string.IsNullOrEmpty(selected))
            {
                GridViewShows.DataBind();
                GridViewShows.Visible = GridViewShows.Rows.Count > 0;
            }
            else
            {
                GridViewShows.Visible = false;
            }
        }
    }
}