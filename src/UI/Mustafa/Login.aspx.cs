using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            if (Request.Cookies["Email"] != null && Request.Cookies["Password"] != null)
            {
                txtUsername.Text = Request.Cookies["Email"].Value;
                txtPassword.Text = Request.Cookies["Password"].Value;
            }
        }
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        if (cbRememberMe.Checked)
        {
            Response.Cookies["Email"].Value = txtUsername.Text;
            Response.Cookies["Email"].Expires = DateTime.Now.AddDays(30);

            Response.Cookies["Password"].Value = txtPassword.Text;
            Response.Cookies["Password"].Expires = DateTime.Now.AddDays(30);
        }

        if (string.IsNullOrEmpty(txtUsername.Text) || string.IsNullOrEmpty(txtPassword.Text))
        {
            lblMessage.Visible = true;
            lblMessage.Text = "Please fill all necessary fields!";
        }
        else
        {
            string email = txtUsername.Text;
            string password = txtPassword.Text;

            DENEMEEntities db = new DENEMEEntities();

            USER u = (from x in db.USER
                           where x.Email == email && x.Password == password && x.IsActive == true
                           select x).SingleOrDefault();
           
            ADMIN a = (from x in db.ADMIN
                            where x.Email == email && x.Password == password && x.IsActive == true
                            select x).SingleOrDefault();

            if(u==null&&  a==null)
            {
                
                    lblMessage.Visible = true;
                    lblMessage.Text = "Please check your information!";
                
            }

            if (u != null)
            {
                Session["User"] = u;
                Response.Redirect("UserHomepage.aspx");               
            }
            else {
                    lblMessage.Visible = true;
                    lblMessage.Text = "Please check your information!";
                }                    
            if(a!=null)
            {
                Session["Admin"]=a;
                Response.Redirect("AdminHomepage.aspx");
            }
            else
            {
                lblMessage.Visible = true;
                lblMessage.Text = "Please check your information!";
            }    
          }
            
        }
        
    
}
