using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Private_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void GoHome(object sender, EventArgs e)
    {
        Response.Redirect("~/Default.aspx", false);
    }

    protected void Post_click(object sender, EventArgs e)
    {
        if (TextBoxPost.Text == "")
        {
            status.Text = "Empty comment. ";
            return;
        }
        HiddenField1.Value = User.Identity.Name;
        HiddenField2.Value = DateTime.Now.ToString();
        HiddenField3.Value = TextBoxPost.Text.Replace("\r\n", "<br />");
        SqlDataSource1.Insert();
        status.Text = "Succesfully post a comment. ";
        TextBoxPost.Text = "";
        Response.Redirect("~/Default.aspx", false);
    }
}