using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ListWorkerInformation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            semantıcEntities db = new semantıcEntities();

            USER [] listOfUsers = (from x in db.USER where x.IsActive == true select x).ToArray();

            grdList.DataSource = listOfUsers;
            grdList.DataBind();
        }
    }
    protected void grdList_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridViewRow row = (GridViewRow)grdList.Rows[e.RowIndex];
        Label lbldeleteid = (Label)row.FindControl("lblID");
        semantıcEntities db = new semantıcEntities();
        int id = Convert.ToInt32(lbldeleteid.Text);

        USER m = (from x in db.USER where x.UserID == id && x.IsActive == true select x).SingleOrDefault();
        m.IsActive = false;
        db.SaveChanges();

        USER[] m1 = (from x in db.USER where x.IsActive == true select x).ToArray();
        grdList.DataSource = m1;
        grdList.DataBind();
    }
    protected void grdList_RowEditing(object sender, GridViewEditEventArgs e)
    {
        grdList.EditIndex = e.NewEditIndex;

        semantıcEntities db = new semantıcEntities();

        USER[] m = (from x in db.USER where x.IsActive == true select x).ToArray();
        grdList.DataSource = m;
        grdList.DataBind();
    }
    protected void grdList_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        grdList.EditIndex = -1;
        semantıcEntities db = new semantıcEntities();

        USER[] m = (from x in db.USER where x.IsActive == true select x).ToArray();
        grdList.DataSource = m;
        grdList.DataBind();
    }
    protected void grdList_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        Label id = (Label)grdList.Rows[e.RowIndex].FindControl("lblUserID");
        TextBox name = (TextBox)grdList.Rows[e.RowIndex].FindControl("txtName");
        TextBox surname = (TextBox)grdList.Rows[e.RowIndex].FindControl("txtSurname");        
        TextBox emailaddress = (TextBox)grdList.Rows[e.RowIndex].FindControl("txtEMailAddress");
        TextBox phone = (TextBox)grdList.Rows[e.RowIndex].FindControl("txtPhone");
        TextBox address = (TextBox)grdList.Rows[e.RowIndex].FindControl("txtAddress");
        TextBox city = (TextBox)grdList.Rows[e.RowIndex].FindControl("txtCity");
        TextBox password = (TextBox)grdList.Rows[e.RowIndex].FindControl("txtPassword");
        semantıcEntities db = new semantıcEntities();

        int id1 = Convert.ToInt32(id.Text);

        USER m = (from x in db.USER where x.UserID == id1 && x.IsActive == true select x).SingleOrDefault();
        m.Name = name.Text;
        m.Surname = surname.Text;       
        m.Email = emailaddress.Text;
        m.Phone = phone.Text;
        m.Address = address.Text;
        m.City = city.Text;
        m.Password = password.Text;

        db.SaveChanges();

        USER[] m1 = (from x in db.USER where x.IsActive == true select x).ToArray();
        grdList.DataSource = m1;
        grdList.DataBind();
    }
}