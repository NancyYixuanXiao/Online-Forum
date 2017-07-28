using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Private_Modify : System.Web.UI.Page
{
    string previous = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        HiddenField4.Value = Request.QueryString["PostId"];
        DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
        DataRow row = dv.Table.Rows[0];
       previous += row["Comment"].ToString() + "<br />";
    }

    protected void Modify_click(object sender, EventArgs e)
    {
        if (TextBoxPost.Text == "")
        {
            status.Text = "Empty comment. ";
            return;
        }
        HiddenField2.Value = DateTime.Now.ToString();
        HiddenField3.Value = previous + TextBoxPost.Text.Replace("\r\n", "<br />");
        SqlDataSource1.Update();
        Response.Redirect("MyPosts.aspx", false);
    }

    protected void goMyPosts(object sender, EventArgs e)
    {
        Response.Redirect("MyPosts.aspx", false);
    }
}