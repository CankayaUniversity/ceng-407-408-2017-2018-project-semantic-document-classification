using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserHomepage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        USER gelenUser = (USER)Session["User"];
        lblMessage.Visible = true;
        lblMessage.Text = "Merhaba " + gelenUser.Name + " " + gelenUser.Surname;
    }
}