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
    public partial class redirect : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BookSpot_Click1(object sender, EventArgs e)
        {
            try
            {
                //sql connection
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["campingpladsenConnectionString"].ConnectionString);

                //open sql connection to database
                con.Open();

                // sql query for command to execute                     for reference (@age, @firstName, @lastName, @phoneNumber, @email)
                string query = "update Places set IsReserved = @isReserved, customerID = @customerID where placeId = @placeId; ";

                // sql command that has the query and the database connection 
                SqlCommand cmd = new SqlCommand(query, con);


                //check if place is already booked
                bool placeBooked = false;
                string val = placeID.SelectedValue.ToString();
                foreach (GridViewRow rows in gridview.Rows)
                {
                    string cellText = rows.Cells[0].Text;
                    if (val == cellText)
                    {
                        if (rows.Cells[1].Text == customerID.SelectedValue)
                        {
                            placeBooked = true;
                        }
                    }
                }


                if (!placeBooked) // if the place is not booked then we want to book it
                {
                    //add parameters to command
                    cmd.Parameters.AddWithValue("@placeId", placeID.SelectedValue);
                    cmd.Parameters.AddWithValue("@isReserved", 1);
                    cmd.Parameters.AddWithValue("@customerID", customerID.SelectedValue);

                    //execute the query and insert into the place table
                    cmd.ExecuteNonQuery();
                }

                //refresh the page to see cha
                Response.Redirect("index.aspx");
                //close the connection to the data
                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("error creating customer - " + ex.ToString());
            }
        }

    }
}