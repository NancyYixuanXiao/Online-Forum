using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (User.Identity.IsAuthenticated)
        {
            Panel1.Visible = false;
            Panel2.Visible = true;
            hello.Text = User.Identity.Name;
        }
        else
        {
            Panel1.Visible = true;
            Panel2.Visible = false;
        }

        DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
        TableRow r1 = new TableRow();
        TableCell c1 = new TableCell();
        TableCell c2 = new TableCell();
        TableCell c3 = new TableCell();
        r1.Cells.Add(c1);
        r1.Cells.Add(c2);
        r1.Cells.Add(c3);
        c1.BorderWidth = 1;
        c1.BorderColor = Color.CadetBlue;
        c2.BorderWidth = 1;
        c2.BorderColor = Color.CadetBlue;
        c3.BorderWidth = 1;
        c3.BorderColor = Color.CadetBlue;
        c1.Width = 200;
        c2.Width = 220;
        c3.Width = 600;
        c1.Text = "Username";
        c2.Text = "Date and time ";
        c3.Text = "Comment";
        c1.Font.Bold = true;
        c2.Font.Bold = true;
        c3.Font.Bold = true;
        Table1.Rows.Add(r1);

        foreach (DataRow dr in dv.Table.Rows)
        {
            r1 = new TableRow();
            c1 = new TableCell();
            c2 = new TableCell();
            c3 = new TableCell();
            r1.Cells.Add(c1);
            r1.Cells.Add(c2);
            r1.Cells.Add(c3);
            c1.BorderWidth = 1;
            c1.BorderColor = Color.CadetBlue;
            c2.BorderWidth = 1;
            c2.BorderColor = Color.CadetBlue;
            c3.BorderWidth = 1;
            c3.BorderColor = Color.CadetBlue;
            c1.Width = 200;
            c2.Width = 220;
            c3.Width = 600;
            c1.Text = dr["UserName"].ToString();
            c2.Text = dr["DateTime"].ToString();
            c3.Text = dr["Comment"].ToString();
            Table1.Rows.Add(r1);
        }
    }

    protected void logout_Click(object sender, EventArgs e)
    {
        FormsAuthentication.SignOut();
        Panel1.Visible = true;
        Panel2.Visible = false;
    }
}