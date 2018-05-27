using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IronPython;
using IronPython.Hosting;
using IronPython.Runtime;
using Microsoft.Scripting.Hosting;
using Microsoft.Scripting;
//using Newtonsoft.Json.Linq;
using System.Web.Script.Serialization;
using System.Web.Script;
//using System.Web.UI.DataVisualization.Charting;


public partial class TextFile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string path = Request["path"];
        if (!String.IsNullOrEmpty(path))
        {
            string text = System.IO.File.ReadAllText(path);
            lblMessage.Text = text;
        }
    }
    protected void btnSiniflandir_Click(object sender, EventArgs e)
    {
        // run python code
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        ScriptEngine engine = Python.CreateEngine();
        ScriptScope scope = engine.CreateScope();
        engine.ExecuteFile(@"C:\Users\CASPER-\Desktop\semantıcclassificatiıon\doc2vec.py", scope);
        var result = scope.GetVariable("a");
        //Label1.Text = Convert.ToString(result);
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        ScriptEngine engine = Python.CreateEngine();
        ScriptScope scope = engine.CreateScope();
        engine.ExecuteFile(@"C:\Users\CASPER-\Desktop\semantıcclassificatiıon\word2vec.py", scope);
        var result = scope.GetVariable("a");
        //Label1.Text = Convert.ToString(result);
    }
}