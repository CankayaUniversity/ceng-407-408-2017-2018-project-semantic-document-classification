using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Reflection;
public partial class denemeGrid : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        

        if (!IsPostBack)
        {
            semantıcEntities db = new semantıcEntities();
            DATASET[] dataSetList = (from x in db.DATASET where x.IsActive == true select x).ToArray();

            GridView1.DataSource = dataSetList;
            GridView1.DataBind();
        }
    }

    

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        GridView2.Visible = true;
        string secilenDeger = e.CommandName;

        semantıcEntities db = new semantıcEntities();
        DATASET ds = (from x in db.DATASET where x.Name == secilenDeger && x.IsActive == true select x).SingleOrDefault();

        CLUSTER[] clusterList = (from x in db.CLUSTER where x.DataSetID == ds.DatasetID select x).ToArray();

        GridView2.DataSource = clusterList;
        GridView2.DataBind();
    }
    protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)

    {
        GridView3.Visible = true;
        string secilenDeger = e.CommandName;

        semantıcEntities db = new semantıcEntities();
        CLUSTER ds = (from x in db.CLUSTER where x.Name == secilenDeger select x).SingleOrDefault();

        // DOCUMENT[] documentList = (from x in db.DOCUMENT where x.ClusterID == ds.ClusterID select x).ToArray();

        FILE[] fileList = (from x in db.FILE where x.DocumentID == ds.ClusterID select x).ToArray();
       

        GridView3.DataSource = fileList;
        GridView3.DataBind();

    }
    protected void GridView3_RowCommand(object sender, GridViewCommandEventArgs e)
    
    {

        GridView3.Visible = true;
        string secilenDeger = e.CommandName;

        Response.Redirect("TextFile.aspx?path=" + secilenDeger.ToString());

       // semantıcEntities8 db = new semantıcEntities8();
       // DOCUMENT ds = (from x in db.DOCUMENT where x.Name == secilenDeger select x).SingleOrDefault();

       //FILE[] fileList = (from x in db.FILE where x.DocumentID == ds.DocumentID select x).ToArray();

       // GridView4.DataSource = fileList;
       // GridView4.DataBind();

    }
 
   
    /*protected void GridView5_RowCommand(object sender, GridViewCommandEventArgs e)
    {

        GridView5.Visible = true;
        string secilenDeger = e.CommandName;

        semantıcEntities6 db = new semantıcEntities6();
        DATASET ds = (from x in db.DATASET where x.Name == secilenDeger select x).SingleOrDefault();

      FILE [] fileList = (from x in db.FILE where x.FILE == ds.DatasetID select x).ToArray();

        GridView6.DataSource =dboList;
        GridView6.DataBind();
    }*/

    protected void btnDataSet1_Click(object sender, EventArgs e)
    {
       

        Response.Redirect("Login.aspx" + ToString());
    }

    protected void Button1_Click(object sender, EventArgs e)
    {

    }
}
