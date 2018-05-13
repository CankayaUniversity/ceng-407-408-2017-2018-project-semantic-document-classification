using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class denemeGrid : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DENEMEEntities db = new DENEMEEntities();
            DATASET[] dataSetList = (from x in db.DATASET where x.IsActive == true select x).ToArray();

            GridView1.DataSource = dataSetList;
            GridView1.DataBind();
        }
    }

    protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        GridView2.Visible = true;
        string secilenDeger = e.CommandName;

        DENEMEEntities db = new DENEMEEntities();
        DATASET ds = (from x in db.DATASET where x.Name == secilenDeger && x.IsActive == true select x).SingleOrDefault();

        CLUSTER[] clusterList = (from x in db.CLUSTER where x.DataSetID == ds.DatasetID select x).ToArray();

        GridView2.DataSource = clusterList;
        GridView2.DataBind();
    }
}