using System;
using System.Web.UI;

namespace QTS_By_Asmita
{
    public partial class Customer : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void AddCustomer_Click(object sender, EventArgs e)
        {
            // Ensure InsertParameters are populated from form controls since the markup only declares parameters
            if (SqlDataSource1 != null)
            {
                SqlDataSource1.InsertParameters["CUS_ID"].DefaultValue = txtCustomerID.Text.Trim();
                SqlDataSource1.InsertParameters["CUS_NAME"].DefaultValue = txtName.Text.Trim();
                SqlDataSource1.InsertParameters["CUS_EMAIL"].DefaultValue = txtEmail.Text.Trim();
                SqlDataSource1.InsertParameters["CUS_PHONE"].DefaultValue = txtPhone.Text.Trim();
                SqlDataSource1.InsertParameters["CUS_ADDRESS"].DefaultValue = txtAddress.Text.Trim();

                // parse age input (accept any numeric value) — default to 0 when empty/invalid
                var ageValue = decimal.TryParse(txtAge.Text, out var parsedAge) ? parsedAge : 0m;
                SqlDataSource1.InsertParameters["CUS_AGE"].DefaultValue = ageValue.ToString();

                // Set registration date to now
                SqlDataSource1.InsertParameters["CUS_REG_DATE"].DefaultValue = DateTime.Now.ToString("s");
            }

            SqlDataSource1.Insert();
            GridView1.DataBind();

            // Clear inputs after successful insert
            txtCustomerID.Text = string.Empty;
            txtName.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtPhone.Text = string.Empty;
            txtAddress.Text = string.Empty;
            ddlGender.SelectedIndex = 0;
            txtAge.Text = string.Empty;
        }

        // Keep handler because markup references it
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
        }
    }
}