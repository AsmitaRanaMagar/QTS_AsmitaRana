using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QTS_By_Asmita
{
    public partial class Tickets : Page
    {
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
                    else if (FindControl("txtCustomerID") is TextBox custTextbox)
                    {
                        insertParams["CUS_ID"].DefaultValue = custTextbox.Text.Trim();
                    }
                }

                if (insertParams["TK_DATE"] != null)
                    insertParams["TK_DATE"].DefaultValue = txtDate?.Text.Trim() ?? string.Empty;

                if (insertParams["TK_STATUS"] != null)
                    insertParams["TK_STATUS"].DefaultValue = txtStatus?.Text.Trim() ?? string.Empty;

                if (insertParams["TK_BOOKED_AT"] != null)
                    insertParams["TK_BOOKED_AT"].DefaultValue = DateTime.Now.ToString("s");

                if (insertParams["TK_QUANTITY"] != null)
                    insertParams["TK_QUANTITY"].DefaultValue = txtQuantity?.Text.Trim() ?? string.Empty;
            }

            SqlDataSource1?.Insert();
            GridView1.DataBind();

            txtTicketID.Text = string.Empty;
            if (DropDownList1 != null) DropDownList1.SelectedIndex = 0;
            if (ddlCustomerID != null) ddlCustomerID.SelectedIndex = 0;
            txtDate.Text = string.Empty;
            txtQuantity.Text = string.Empty;
            txtStatus.Text = string.Empty;
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

            string startDate = DateTime.Today.AddMonths(-6).ToString("yyyy-MM-dd");
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