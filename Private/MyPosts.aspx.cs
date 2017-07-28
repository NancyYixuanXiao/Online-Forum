using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Private_Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        hello.Text = User.Identity.Name;
        HiddenField1.Value = User.Identity.Name;
        DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
        TableRow r1 = new TableRow();
        TableCell c1 = new TableCell();
        TableCell c2 = new TableCell();
        TableCell c3 = new TableCell();
        TableCell c4 = new TableCell();
        LinkButton bt1 = new LinkButton();
        LinkButton bt2 = new LinkButton();
        r1.Cells.Add(c1);
        r1.Cells.Add(c2);
        r1.Cells.Add(c3);
        r1.Cells.Add(c4);
        c1.BorderWidth = 1;
        c1.BorderColor = Color.CadetBlue;
        c2.BorderWidth = 1;
        c2.BorderColor = Color.CadetBlue;
        c3.BorderWidth = 1;
        c3.BorderColor = Color.CadetBlue;
        c4.BorderWidth = 1;
        c4.BorderColor = Color.CadetBlue;
        c1.Width = 200;
        c2.Width = 220;
        c3.Width = 450;
        c4.Width = 150;
        c1.Text = "Username";
        c2.Text = "Date and time ";
        c3.Text = "Comment";
        c4.Text = "Action";
        c1.Font.Bold = true;
        c2.Font.Bold = true;
        c3.Font.Bold = true;
        c4.Font.Bold = true;
        Table1.Rows.Add(r1);

        foreach (DataRow dr in dv.Table.Rows)
        {
            r1 = new TableRow();
            c1 = new TableCell();
            c2 = new TableCell();
            c3 = new TableCell();
            c4 = new TableCell();
            bt1 = new LinkButton();
            bt2 = new LinkButton();
            r1.Cells.Add(c1);
            r1.Cells.Add(c2);
            r1.Cells.Add(c3);
            r1.Cells.Add(c4);
            c1.BorderWidth = 1;
            c1.BorderColor = Color.CadetBlue;
            c2.BorderWidth = 1;
            c2.BorderColor = Color.CadetBlue;
            c3.BorderWidth = 1;
            c3.BorderColor = Color.CadetBlue;
            c4.BorderWidth = 1;
            c4.BorderColor = Color.CadetBlue;
            c1.Width = 200;
            c2.Width = 220;
            c3.Width = 450;
            c4.Width = 150;
            c1.Text = dr["UserName"].ToString();
            c2.Text = dr["DateTime"].ToString();
            c3.Text = dr["Comment"].ToString();
            bt1.Text = "Delete";
            bt2.Text = "Modify";
            c4.Controls.Add(bt1);
            c4.Controls.Add(bt2);
            bt1.Width = 70;
            bt2.Width = 75;
            bt1.Command += new CommandEventHandler(delete_click);
            bt1.CommandArgument = dr["Id"].ToString();
            bt2.Command += new CommandEventHandler(modify_click);
            bt2.CommandArgument = dr["Id"].ToString();
            Table1.Rows.Add(r1);
        }
    }

    void delete_click(Object sender, CommandEventArgs e)
    {
        try
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DatabaseConnectionString1"].ConnectionString))
            {
                con.Open();
                using (SqlCommand command = new SqlCommand("DELETE FROM Posts" + " WHERE Id = " + e.CommandArgument + ";", con))
                {
                    command.ExecuteNonQuery();
                }
                con.Close();
            }
        }
        catch (SystemException ex)
        {
            status.Text = string.Format("An error occurred: {0}", ex.Message);
        }
        Response.Redirect("MyPosts.aspx");
    }

    void modify_click(Object sender, CommandEventArgs e)
    {
        string url = string.Format("Modify.aspx?PostId={0}", e.CommandArgument);
        Response.Redirect(url);
    }

    protected void logout_Click(object sender, EventArgs e)
    {
        FormsAuthentication.SignOut();
        Response.Redirect("../Default.aspx", false);
    }
}