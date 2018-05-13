using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DenemeRegister : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ButtonRegister_Click(object sender, EventArgs e)
    {
        Service registerService = new Service();
        if (!registerService.funcRegister(TextBoxName.Text, TextBoxSurname.Text,TextBoxCity.Text,TextBoxPhone.Text, TextBoxEmail.Text,TextBoxAddress.Text, TextBoxPassword.Text))
            LabelMessage.Text = "Already exists in the database!";
        else LabelMessage.Text = "Successful!";
    }
}