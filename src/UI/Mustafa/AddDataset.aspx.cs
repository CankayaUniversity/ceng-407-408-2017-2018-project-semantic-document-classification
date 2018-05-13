using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddCluster : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        USER gelenUser = (USER)Session["User"];
        lblMessage.Visible = true;
        lblMessage.Text = "Merhaba " + gelenUser.Name + " " + gelenUser.Surname;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (String.IsNullOrEmpty(TextBox1.Text) || String.IsNullOrEmpty(FileUpload1.FileName))
        {
            //uyarı ver
        }
        else
        {
            DENEMEEntities db = new DENEMEEntities();
            DATASET d = new DATASET();
            d.IsActive = true;
            d.Name = TextBox1.Text;
            //d.URL = Server.MapPath()
            /*
             * fuImage.SaveAs(Server.MapPath("~/Dataset/" + fuImage.FileName));
               d.URL = (Server.MapPath("~/Dataset/" + fuImage.FileName));
             */

            db.DATASET.Add(d);
            db.SaveChanges();
        }
    }
}