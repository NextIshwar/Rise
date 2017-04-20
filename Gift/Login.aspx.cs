using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace Gift
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void txtUser_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, ImageClickEventArgs e)
        {
            if (Page.IsValid)
            {
                string str = ConfigurationManager.ConnectionStrings["CSEStudentsConnectionString"].ConnectionString;
                SqlConnection con = new SqlConnection(str);
                try
                {
                    DataSet ds = new DataSet();
                    string pass = String.Format("Select Password from tblStudents where UserName='{0}'", txtUser.Text);
                    SqlDataAdapter da = new SqlDataAdapter(pass, con);
                    da.MissingSchemaAction = MissingSchemaAction.AddWithKey;
                    da.Fill(ds, "tblStudents");
                    string s1 = (ds.Tables["tblStudents"].Rows[0]["Password"].ToString()).Trim();
                    string s2 = (txtPassword.Text).Trim();
                    int n = string.Compare(s1, s2);
                    if (n == 0)
                    {
                        Session["uname"] = txtPassword.Text.Trim();
                        Response.Redirect("Chat.aspx");
                    }
                }
                catch 
                {
                    lblError.Text = "<p style='color:red'    > Error: " + "Invalid user id or Password" + "</p>";
                }



            }
        }
    }
}