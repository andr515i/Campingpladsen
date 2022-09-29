using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;



namespace Campingpladsen
{
    public partial class WebForm : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
           
                // Code that runs on page load
                ScriptManager.ScriptResourceMapping.AddDefinition("jquery",
                new ScriptResourceDefinition
                {
                    Path = "~/scripts/jquery-1.7.2.min.js",
                    DebugPath = "~/scripts/jquery-1.7.2.js",
                    CdnPath = "http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.4.1.min.js",
                    CdnDebugPath = "http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.4.1.js"
                });
            
        }
        protected void submit_button_Click1(object sender, EventArgs e)
        {
            try
            {
                //sql connection
                   //open sql connection
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["campingpladsenConnectionString"].ConnectionString);

                con.Open();
                // sql query
                string query = "insert into Customers(age, firstName, lastName, phoneNumber, email) values (@age, @firstName, @lastName, @phoneNumber, @email)";
                    // sql command
                    SqlCommand cmd = new SqlCommand(query, con);


                // user input validation checks


                    cmd.Parameters.AddWithValue("@age", age.Text);
                    cmd.Parameters.AddWithValue("@firstName", firstName.Text);
                    cmd.Parameters.AddWithValue("@lastName", lastName.Text);
                    cmd.Parameters.AddWithValue("@phoneNumber", phoneNumber.Text);
                    cmd.Parameters.AddWithValue("@email", email.Text);

                    //execute query

                    cmd.ExecuteNonQuery();

                Response.Redirect("index.aspx");
                con.Close();
                
            
            
            
            
            
            
            
            
            
            
            
            
            
            }
            catch (Exception ex)
            {
                Response.Write("error creating customer - " + ex.ToString());
            }
        }

        protected void SqlDataCustomers_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }


    }
}