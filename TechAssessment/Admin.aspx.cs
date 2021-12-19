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
    public partial class Contact : Page
    {
        static string con = System.Configuration.ConfigurationManager.ConnectionStrings["UsersContainer"].ConnectionString;

        static System.Data.Entity.Core.EntityClient.EntityConnectionStringBuilder e = new System.Data.Entity.Core.EntityClient.EntityConnectionStringBuilder(con);
        string ProviderConnectionString = e.ProviderConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            string User = txtUser.Text;
            string Password = txtPass.Text;
            bool IsAdmin = false;

            if (rblIsAdmin.SelectedIndex == 0)
            {
                IsAdmin = true;
            }
            
            SqlConnection conn = new SqlConnection(ProviderConnectionString);
            conn.Open();
            string query = "INSERT INTO Users (Username, Password, IsAdmin) VALUES (@User, @Pass, @IsAdmin)";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@User", User);
            cmd.Parameters.AddWithValue("@Pass", Password);
            cmd.Parameters.AddWithValue("@IsAdmin", IsAdmin);

            int Created = cmd.ExecuteNonQuery();

            if(Created < 0)
            {
                lblCreated.Text = "Error creating new user.";
            }
            else
            {
                lblCreated.Text = "User has been created successfully.";
            }
        }
    }
}