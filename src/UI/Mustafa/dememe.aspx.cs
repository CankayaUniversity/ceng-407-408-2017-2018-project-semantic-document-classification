using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class dememe : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            semantıcEntities db = new semantıcEntities();
            DATASET[] dataSetList = (from x in db.DATASET where x.IsActive == true select x).ToArray();

            for (int i = 0; i < dataSetList.Length; i++)
                listSol.Items.Add(dataSetList[i].Name);
        }
    }

    protected void listSol_SelectedIndexChanged(object sender, EventArgs e)
    {
        listOrta.Items.Clear();
        listOrta.Visible = true;
        semantıcEntities db = new semantıcEntities();

        DATASET ds = (from x in db.DATASET where x.Name == listSol.SelectedItem.Value && x.IsActive == true select x).SingleOrDefault();

        CLUSTER[] clusterList = (from x in db.CLUSTER where x.DataSetID == ds.DatasetID select x).ToArray();

        for (int i = 0; i < clusterList.Length; i++)
            listOrta.Items.Add(clusterList[i].Name);
    }
}