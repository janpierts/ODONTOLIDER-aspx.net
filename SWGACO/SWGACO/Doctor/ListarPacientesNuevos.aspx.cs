using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;
using System.Data;
using System.Text.RegularExpressions;
using System.Text;
using System.Drawing;
using System.Net;
using System.Net.Mail;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace SWGACO.Doctor
{
    public partial class ListarPacientesNuevos : System.Web.UI.Page
    {

        PersonaBL personaBL = new PersonaBL();
        protected void Page_Load(object sender, EventArgs e)
        {
            listarPacienteNuevo();
        }


        private void listarPacienteNuevo()
        {
            gv_Tabla_Lista_Paciente_Nuevo.DataSource = personaBL.listaPacienteNueva();
            gv_Tabla_Lista_Paciente_Nuevo.DataBind();
        }
        protected void gv_Tabla_Lista_Paciente_Nuevo_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            if (e.CommandName == "Historia")//VER 

            {
                int index = Convert.ToInt32(e.CommandArgument);
                txtCodHistoria.Text = gv_Tabla_Lista_Paciente_Nuevo.Rows[index].Cells[0].Text;
                txtDni.Text = gv_Tabla_Lista_Paciente_Nuevo.Rows[index].Cells[3].Text;
                Session["CodHistoria"] = "" + txtCodHistoria.Text;
                Session["Dni"] = "" + txtDni.Text;
                Response.Redirect("HistoriaClinica.aspx");

            }
        }

        protected void gv_Tabla_Lista_Paciente_Nuevo_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }

        protected void gv_Tabla_Lista_Paciente_Nuevo_DataBound(object sender, EventArgs e)
        {

        }

        protected void gv_Tabla_Lista_Paciente_Nuevo_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }
    }
}