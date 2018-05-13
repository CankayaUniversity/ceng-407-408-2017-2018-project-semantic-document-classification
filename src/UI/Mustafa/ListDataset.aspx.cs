using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        USER gelenUser = (USER)Session["User"];
        lblMessage.Visible = true;
        lblMessage.Text = "Merhaba " + gelenUser.Name + " " + gelenUser.Surname;

        if (!IsPostBack)
        {
            DENEMEEntities db = new DENEMEEntities();
            DATASET[] dataSetList = (from x in db.DATASET where x.IsActive == true select x).ToArray();

            for (int i = 0; i < dataSetList.Length; i++)
            {
                TreeNode t = new TreeNode();
                t.Text = dataSetList[i].Name;
                int dataSetid = dataSetList[i].DatasetID;

                CLUSTER[] clusterList = (from x in db.CLUSTER where x.DataSetID == dataSetid select x).ToArray();

                for (int j = 0; j < clusterList.Length; j++)
                {
                    TreeNode c = new TreeNode();
                    c.Text = clusterList[j].Name;

                    int clusterId = clusterList[j].ClusterID;

                    DOCUMENT[] documentList = (from x in db.DOCUMENT where x.ClusterID == clusterId select x).ToArray();

                    for (int k = 0; k < documentList.Length; k++)
                    {
                        TreeNode d = new TreeNode();
                        d.Text = documentList[k].Name;
                        c.ChildNodes.Add(d);
                    }

                    t.ChildNodes.Add(c);
                }
                treeList.Nodes.Add(t);

                
            }

            
        }
    }
}