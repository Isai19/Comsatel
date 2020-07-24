using ServiceReference;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class Sample : System.Web.UI.Page
{

    #region Variable Declaration  

    ServiceReference.IService1 obj = new ServiceReference.Service1Client();
    #endregion  
    private void ClearControls()
    {
        txtDescripcion.Text = string.Empty;
        txtEstado.Text = string.Empty;
        btnSubmit.Text = "Submit";
        txtDescripcion.Focus();
    }
    private void BindEmpDetails(int? Id)
    {
        grdTareas.DataSource = obj.Listar();
        grdTareas.DataBind();
    }
    private void SaveEmpDetails()
    {
        lblStatus.Text = Convert.ToString(obj.Agregar(txtDescripcion.Text.Trim(), Convert.ToBoolean(txtEstado.Text.Trim())));
        ClearControls();
        BindEmpDetails(null);
    }
    private void UpdateEmpDetails()
    {
        //Tarea eDetails = new Tarea();
        int id = Convert.ToInt32(ViewState["id"].ToString());
        string descripcion = txtDescripcion.Text.Trim();
        bool estado = Convert.ToBoolean(txtEstado.Text.Trim());
        obj.Editar(id, descripcion, estado);
        lblStatus.Text = Convert.ToString(obj.Editar(id, descripcion, estado));
        ClearControls();
        BindEmpDetails(null);
    }
    //#endregion
    //#region Page Event Handlers  
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            BindEmpDetails(null);
            ClearControls();
            lblStatus.Text = String.Empty;
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (btnSubmit.Text == "Update")
        {
            UpdateEmpDetails();
        }
        else
        {
            SaveEmpDetails();
        }
    }
    protected void lnkEdit_Command(object sender, System.Web.UI.WebControls.CommandEventArgs e)
    {
        Tarea tareas = new Tarea();
        tareas.id = int.Parse(e.CommandArgument.ToString());
        ViewState["id"] = tareas.id;
        /*código para guardar el id en memoria*/

        DataSet ds = new DataSet();
        ds = obj.ListarId(int.Parse(e.CommandArgument.ToString()));
        if (ds.Tables[0].Rows.Count > 0)
        {
            txtDescripcion.Text = ds.Tables[0].Rows[0]["tarea_descripcion"].ToString();
            txtEstado.Text = ds.Tables[0].Rows[0]["tarea_estado"].ToString();
            btnSubmit.Text = "Update";
        }
    }
    protected void lnkDelete_Command(object sender, System.Web.UI.WebControls.CommandEventArgs e)
    {
        int id = int.Parse(e.CommandArgument.ToString());
        if (obj.Eliminar(id)==true)
        {
            lblStatus.Text = "Record deleted Successfully";
        }
        else
        {
            lblStatus.Text = "Record couldn't be deleted";
        }
        BindEmpDetails(null);
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        ClearControls();
        lblStatus.Text = string.Empty;
    }
    //#endregion
}