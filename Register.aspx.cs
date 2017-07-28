using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void GoHome(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx", false);
    }

    protected void Register_click(object sender, EventArgs e)
    {
        if (TextBoxName.Text == "")
        {
            status.Text = "Please enter a username.";
            return;
        }

        if (TextBoxPW.Text == "" || TextBoxPW2.Text == "")
        {
            status.Text = "Please enter a password and re-enter it.";
            return;
        }

        if (TextBoxPW.Text != TextBoxPW2.Text)
        {
            status.Text = "Passwords do not match";
            return;
        }

        //Validate password length or characters (optional)
        if (TextBoxPW.Text.Length < 6)
        {
            status.Text = "Enter a password at least six characters.";
            return;
        }

        //Check that the user is not in the database
        DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
        if (dv.Table.Rows.Count != 0)
        {
            status.Text = "Username already exists.";
            return;
        }

        //Add user
        Hashpass.Value = FormsAuthentication.HashPasswordForStoringInConfigFile(TextBoxPW.Text, "SHA1");
        SqlDataSource1.Insert();
        status.Text = "User Added";
        FormsAuthentication.RedirectFromLoginPage(TextBoxName.Text, false);
    }
}