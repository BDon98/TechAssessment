using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Security;

namespace TechAssessment
{
    public partial class _Default : Page
    {
        static string con = System.Configuration.ConfigurationManager.ConnectionStrings["UsersContainer"].ConnectionString;

        static System.Data.Entity.Core.EntityClient.EntityConnectionStringBuilder e = new System.Data.Entity.Core.EntityClient.EntityConnectionStringBuilder(con);
        string ProviderConnectionString = e.ProviderConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            bool userMatch = false;
            bool passMatch = false;
            bool IsAdmin = false;
            string User = txtUser.Text;
            string Password = txtPass.Text;
            SqlConnection conn = new SqlConnection(ProviderConnectionString);
            conn.Open();
            string query = "SELECT Id FROM Users Where Username = @User";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@User", User);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                userMatch = true;
                query = "SELECT IsAdmin FROM Users Where Username = @User AND Password = @Pass";
                cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@User", User);
                cmd.Parameters.AddWithValue("@Pass", Password);
                using (rdr = cmd.ExecuteReader())
                {
                    if (rdr.Read())
                    {
                        passMatch = true;
                        IsAdmin = rdr.GetBoolean(0);
                    }
                }
            }
            conn.Close();

            if (userMatch)
            {
                if (passMatch)
                {
                    err_Login.Visible = false;
                    FormsAuthentication.SetAuthCookie(User, true);
                    if(IsAdmin)
                    {
                        Response.Redirect("~/Home.aspx/?IsAdmin=1");
                    }
                    else
                    {
                        Response.Redirect("~/Home.aspx");
                    }
                }
                else
                {
                    err_Login.Text = "*Incorrect Password";
                    err_Login.IsValid = false;
                }
            }
            else
            {
                err_Login.Text = "*Incorrect Username";
                err_Login.IsValid = false;
            }
        }
    }
}