using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DevExpress.Web;

public partial class _Default : System.Web.UI.Page
{
    protected override void OnInit(EventArgs e)
    {
        SwitchSource(ASPxRadioButtonList1.Items[Convert.ToInt32(Request.Params["ASPxRadioButtonList1"])].Value.ToString());

        base.OnInit(e);
    }

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    private void SwitchSource(String s)
    {
        SqlDataSource source = FindControl(s) as SqlDataSource;
        if (source == null) return;

        ASPxGridView1.DataSourceID = s;
        ASPxGridView1.Columns.Clear();
        ASPxGridView1.AutoGenerateColumns = true;
        ASPxGridView1.DataBind();
    }
    protected void ASPxGridView1_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
    {
        SwitchSource(ASPxRadioButtonList1.Items[Convert.ToInt32(e.Parameters[0].ToString())].Value.ToString());
    }
}