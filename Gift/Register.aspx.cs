using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace Gift
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        { 
            Page.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void signup_Click(object sender, ImageClickEventArgs e)
        {
            if(Page.IsValid)
            {
                using (cseDataContextDataContext context = new cseDataContextDataContext())
                {
                    tblStudent cse = new tblStudent();
                    cse.UserName = txtName.Text;
                    cse.Year = txtYear.Text;
                    cse.Roll_No = txtRoll_No.Text;
                    cse.Password = txtPassword.Text;
                    cse.Email = txtEmail.Text;
                    context.tblStudents.InsertOnSubmit(cse);
                    context.SubmitChanges();
                    
                }
          
            }
        }
    }
}