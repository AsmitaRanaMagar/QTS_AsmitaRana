using System;
using System.Web.UI;

namespace QTS_By_Asmita
{
    public partial class Customer : Page
    {
        protected void AddCustomer_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrWhiteSpace(txtAge.Text))
            {
                if (int.TryParse(txtAge.Text.Trim(), out var age))
                {
                    if (age < 18)
                    {
                        lblAgeWarning.Text = "Age must be at least 18 years old.";
                        lblAgeWarning.Visible = true;
                        return;
                    }
                }
            }
            lblAgeWarning.Text = string.Empty;
            lblAgeWarning.Visible = false;

            if (SqlDataSource1 != null)
            {
                SqlDataSource1.InsertParameters["CUS_ID"].DefaultValue = txtCustomerID.Text.Trim();
                SqlDataSource1.InsertParameters["CUS_NAME"].DefaultValue = txtName.Text.Trim();
                SqlDataSource1.InsertParameters["CUS_EMAIL"].DefaultValue = txtEmail.Text.Trim();
                SqlDataSource1.InsertParameters["CUS_PHONE"].DefaultValue = txtPhone.Text.Trim();
                SqlDataSource1.InsertParameters["CUS_ADDRESS"].DefaultValue = txtAddress.Text.Trim();
                var ageValue = decimal.TryParse(txtAge.Text, out var parsedAge) ? parsedAge : 0m;
                SqlDataSource1.InsertParameters["CUS_AGE"].DefaultValue = ageValue.ToString();
                SqlDataSource1.InsertParameters["CUS_REG_DATE"].DefaultValue = DateTime.Now.ToString("s");
            }

            SqlDataSource1.Insert();
            GridView1.DataBind();

            txtCustomerID.Text = string.Empty;
            txtName.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtPhone.Text = string.Empty;
            txtAddress.Text = string.Empty;
            ddlGender.SelectedIndex = 0;
            txtAge.Text = string.Empty;
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
        }
    }
}