using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminHomepage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        admın gelenAdmin = (admın)Session["Admin"];
        lblMessage.Visible = true;
        lblMessage.Text = "Merhaba " + gelenAdmin.Name + " " + gelenAdmin.Surname;
    }
}