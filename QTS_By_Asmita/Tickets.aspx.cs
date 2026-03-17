using System;
using System.Web.UI;
using System.Data;
using System.Web.UI.WebControls;

namespace QTS_By_Asmita
{
    public partial class Tickets : Page
    {
        private System.Web.UI.WebControls.Label GetLblTicketSuccess()
        {
            // recursive lookup because Content controls can nest the label
            System.Web.UI.Control root = this;
            return FindControlRecursive(root, "lblTicketSuccess") as System.Web.UI.WebControls.Label;
        }

        private System.Web.UI.Control FindControlRecursive(System.Web.UI.Control root, string id)
        {
            if (root == null) return null;
            var c = root.FindControl(id);
            if (c != null) return c;
            foreach (System.Web.UI.Control child in root.Controls)
            {
                var found = FindControlRecursive(child, id);
                if (found != null) return found;
            }
            return null;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SetStartDateToSixMonthsAgo();

                if (SqlDataSource1?.SelectParameters["CUS_ID"] != null)
                {
                    SqlDataSource1.SelectParameters["CUS_ID"].DefaultValue = "%";
                }
            }
        }
        protected void AddTicket_Click(object sender, EventArgs e)
        {
            // Clear previous success message
            var lblTicketSuccess = GetLblTicketSuccess();
            if (lblTicketSuccess != null)
            {
                lblTicketSuccess.Text = string.Empty;
                lblTicketSuccess.Visible = false;
            }

            // Duplicate TK_ID check (similar to Shows.AddShow_Click)
            var newId = txtTicketID.Text?.Trim();
            if (!string.IsNullOrEmpty(newId))
            {
                try
                {
                    if (SqlDataSource1.Select(DataSourceSelectArguments.Empty) is DataView dv)
                    {
                        foreach (DataRowView row in dv)
                        {
                            var existing = Convert.ToString(row["TK_ID"]);
                            if (string.Equals(existing, newId, StringComparison.OrdinalIgnoreCase))
                            {
                                lblTicketWarning.Text = "Ticket id already exists.";
                                lblTicketWarning.Visible = true;
                                return;
                            }
                        }
                    }
                }
                catch { }
            }

            // hide previous warning
            lblTicketWarning.Text = string.Empty;
            lblTicketWarning.Visible = false;

            var insertParams = SqlDataSource1?.InsertParameters;
            if (insertParams != null)
            {
                if (insertParams["TK_ID"] != null)
                    insertParams["TK_ID"].DefaultValue = txtTicketID?.Text.Trim() ?? string.Empty;

                if (insertParams["SW_ID"] != null)
                {
                    if (DropDownList1 != null)
                    {
                        insertParams["SW_ID"].DefaultValue = DropDownList1.SelectedValue;
                    }
                    else if (FindControl("txtShowID") is TextBox showTextbox)
                    {
                        insertParams["SW_ID"].DefaultValue = showTextbox.Text.Trim();
                    }
                }

                if (insertParams["CUS_ID"] != null)
                {
                    if (ddlCustomerID != null)
                    {
                        insertParams["CUS_ID"].DefaultValue = ddlCustomerID.SelectedValue;
                    }
                    else if (FindControl("txtCustomerID") is TextBox customerTextbox)
                    {
                        insertParams["CUS_ID"].DefaultValue = customerTextbox.Text.Trim();
                    }
                }

                if (insertParams["TK_DATE"] != null)
                    insertParams["TK_DATE"].DefaultValue = txtDate?.Text.Trim() ?? string.Empty;

                if (insertParams["TK_STATUS"] != null)
                    insertParams["TK_STATUS"].DefaultValue = txtStatus?.Text.Trim() ?? string.Empty;

                if (insertParams["TK_BOOKED_AT"] != null)
                    insertParams["TK_BOOKED_AT"].DefaultValue = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");

                if (insertParams["TK_QUANTITY"] != null)
                    insertParams["TK_QUANTITY"].DefaultValue = txtQuantity?.Text.Trim() ?? string.Empty;
            }

            try
            {
                SqlDataSource1?.Insert();
                GridView1.DataBind();

                // show success message above the form
                lblTicketSuccess = GetLblTicketSuccess();
                if (lblTicketSuccess != null)
                {
                    lblTicketSuccess.Text = "Ticket added successfully.";
                    lblTicketSuccess.Visible = true;
                }

                // clear form fields
                txtTicketID.Text = string.Empty;
                if (DropDownList1 != null) DropDownList1.SelectedIndex = 0;
                if (ddlCustomerID != null) ddlCustomerID.SelectedIndex = 0;
                txtDate.Text = string.Empty;
                txtQuantity.Text = string.Empty;
                txtStatus.Text = string.Empty;
            }
            catch
            {
                // in case of error ensure success label is hidden
                lblTicketSuccess = GetLblTicketSuccess();
                if (lblTicketSuccess != null)
                {
                    lblTicketSuccess.Text = string.Empty;
                    lblTicketSuccess.Visible = false;
                }
            }
        }

        protected void DdlFilterCustomer_SelectedIndexChanged(object sender, EventArgs e)
        {
            SetStartDateToSixMonthsAgo();
            if (SqlDataSource1?.SelectParameters["CUS_ID"] != null)
            {
                var selected = ddlFilterCustomer.SelectedValue;
                SqlDataSource1.SelectParameters["CUS_ID"].DefaultValue = string.IsNullOrEmpty(selected) ? "%" : selected;
            }

            GridView1.PageIndex = 0;
            GridView1.DataBind();
        }

        private void SetStartDateToSixMonthsAgo()
        {
            if (SqlDataSource1 == null)
                return;

            var dt = DateTime.Today.AddMonths(-6);
            // Oracle TO_DATE in the SelectCommand expects 'YYYY-MM-DD' format — provide that exact string
            string startDate = dt.ToString("yyyy-MM-dd");
            if (SqlDataSource1.SelectParameters["START_DATE"] != null)
            {
                SqlDataSource1.SelectParameters["START_DATE"].DefaultValue = startDate;
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}