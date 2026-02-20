using System;
using System.Web.UI;

namespace QTS_By_Asmita
{
    public partial class Halls : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void AddHall_Click(object sender, EventArgs e)
        {
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
    }
}