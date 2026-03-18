using System;
using System.Web.UI;
using System.Data;
using System.Web.UI.WebControls;

namespace QTS_By_Asmita
{
    public partial class Customer : Page
    {
        // Add a new customer
        protected void AddCustomer_Click(object sender, EventArgs e)
        {
            // Get the entered customer ID
            var newId = txtCustomerID.Text?.Trim();
            // Check if customer ID already exists
            if (!string.IsNullOrEmpty(newId))
            {
                try
                {
                    if (SqlDataSource1.Select(DataSourceSelectArguments.Empty) is DataView dv)
                    {
                        foreach (DataRowView row in dv)
                        {
                            var existing = Convert.ToString(row["CUS_ID"]);
                            if (string.Equals(existing, newId, StringComparison.OrdinalIgnoreCase))
                            {
                                lblCustomerWarning.Text = "Customer id already exists.";
                                lblCustomerWarning.Visible = true;
                                return;
                            }
                        }
                    }
                }
                catch { }
            }

            // Check if age is entered and valid
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

            // warning messages
            lblAgeWarning.Text = string.Empty;
            lblAgeWarning.Visible = false;
            lblCustomerWarning.Text = string.Empty;
            lblCustomerWarning.Visible = false;
            lblCustomerDeleteError.Text = string.Empty;
            lblCustomerDeleteError.Visible = false;

            // Set values for new customer
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

            // Add customer to database
            SqlDataSource1.Insert();
            GridView1.DataBind();

            // Clear form fields
            txtCustomerID.Text = string.Empty;
            txtName.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtPhone.Text = string.Empty;
            txtAddress.Text = string.Empty;
            ddlGender.SelectedIndex = 0;
            txtAge.Text = string.Empty;
        }

        // Handle row selection in the customer table
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        // Handle customer delete event
        protected void SqlDataSource1_Deleted(object sender, SqlDataSourceStatusEventArgs e)
        {
            // Show error if delete fails
            if (e.Exception != null)
            {
                var msg = e.Exception.Message ?? string.Empty;
                if (msg.Contains("ORA-02292") || msg.Contains("FK_TICKETS_CUSTOMERS"))
                {
                    lblCustomerDeleteError.Text = "Cannot delete this customer because the customer has booked tickets.";
                    lblCustomerDeleteError.Visible = true;
                    e.ExceptionHandled = true;
                    return;
                }

                lblCustomerDeleteError.Text = "Error deleting customer: " + msg;
                lblCustomerDeleteError.Visible = true;
                e.ExceptionHandled = true;
            }
        }
    }
}