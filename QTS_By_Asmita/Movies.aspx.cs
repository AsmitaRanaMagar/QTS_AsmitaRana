using System;
using System.Web.UI;

namespace QTS_By_Asmita
{
    public partial class Movies : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void AddMovie_Click(object sender, EventArgs e)
        {
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

            SqlDataSource1.Insert();
            GridView1.DataBind();

            txtMovieID.Text = string.Empty;
            txtTitle.Text = string.Empty;
            txtGenre.Text = string.Empty;
            txtLang.Text = string.Empty;
            txtRelease.Text = string.Empty;
            txtDuration.Text = string.Empty;
            txtDesc.Text = string.Empty;
        }
    }
}