using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QTS_By_Asmita
{
    public partial class Shows : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void AddShow_Click(object sender, EventArgs e)
        {
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

            SqlDataSource1.Insert();
            GridView1.DataBind();

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