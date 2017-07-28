using System;
using System.Data;
using System.Web.Security;
using System.Web.UI;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void GoHome(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx", false);
    }

    protected void Login_click(object sender, EventArgs e)
    {
        try  //catches blank User name
        {
            DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            if (dv.Table.Rows.Count == 0)
            {
                status.Text = "Username does not exist.";
                return;
            }
            string hashpass = FormsAuthentication.HashPasswordForStoringInConfigFile(TextBoxPW.Text, "SHA1");
            DataRow row = dv.Table.Rows[0];
            string temppass = (string)row["Password"];
            if (temppass == hashpass)
            {
                //authenticated
                status.Text = "Login OK.";
                FormsAuthentication.RedirectFromLoginPage(TextBoxName.Text, false);
                return;
            }
            else
            {
                status.Text = "Password does not match.";
                return;
            }

        }
        catch
        {
            //Not authenticated
            status.Text = "Blank username.";
            return;
        }
    }
}