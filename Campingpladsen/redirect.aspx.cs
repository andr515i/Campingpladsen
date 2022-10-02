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
            //we try catch the whole thing incase of errors, and throw them out. right now theres not supposed to be any protection or safety at all
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
                foreach (GridViewRow rows in gridview.Rows)  // foreach row in gridview
                {
                    string cellText = rows.Cells[0].Text;
                    if (val == cellText)  //check if selected placeid is equal to the placeid coloumn cell's placeid
                    {
                        if (rows.Cells[1].Text == customerID.SelectedValue) // also check if its also the same customer
                        {
                            placeBooked = true;  // we dont use this currently, but in future it will be used to ask for a rebook and then initiate a rebooking schema
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
            catch (Exception ex)// catch any exceptions and write them out
            {
                Response.Write("error creating customer - " + ex.ToString());
            }
        }

    }
}