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

namespace SWGACO.Paciente
{
    public partial class ProponesPTratamiento : System.Web.UI.Page
    {
        CitaBE citaBE = new CitaBE();
        CitaBL citaBL = new CitaBL();
        PersonaBL personaBL = new PersonaBL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuario_en_sesion"] != null)
            {
                string usuarioensesion = Session["usuario_en_sesion"].ToString();
                citaBE.IP_Dni = int.Parse(usuarioensesion);
                listarPacienteCita();

            }
            else
            {
                Response.Redirect("~/IniciarSesion.aspx");
            }
            
        }

        private void listarPacienteCita()
        {
            gv_Tabla_Lista_Paciente_Cita.DataSource = citaBL.listaPPCita(citaBE);
            //gv_Tabla_Lista_Paciente_Cita.DataSource = personaBL.listaCitasPT();
            gv_Tabla_Lista_Paciente_Cita.DataBind();
        }
        protected void gv_Tabla_Lista_Paciente_Cita_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            
        }

        protected void gv_Tabla_Lista_Paciente_Cita_DataBound(object sender, EventArgs e)
        {

        }

        protected void gv_Tabla_Lista_Paciente_Cita_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }

        protected void gv_Tabla_Lista_Paciente_Cita_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Historia")//VER 

            {
                int index = Convert.ToInt32(e.CommandArgument);
                txtCodCitaPropuesta.Text = gv_Tabla_Lista_Paciente_Cita.Rows[index].Cells[0].Text;
                txtDoctor.Text = gv_Tabla_Lista_Paciente_Cita.Rows[index].Cells[6].Text;
                Session["CodCitaPropuesta"] = "" + txtCodCitaPropuesta.Text;
                Session["Doctor"] = "" + txtDoctor.Text;
                Response.Redirect("DetallePropuestaP.aspx");

            }

            if (e.CommandName == "RegistrarPropuesta")//VER 

            {
                int index = Convert.ToInt32(e.CommandArgument);
                txtCodCitaPropuesta.Text = gv_Tabla_Lista_Paciente_Cita.Rows[index].Cells[0].Text;
                txtDoctor.Text = gv_Tabla_Lista_Paciente_Cita.Rows[index].Cells[6].Text;
                Session["CodCitaPropuesta"] = "" + txtCodCitaPropuesta.Text;
                Session["Doctor"] = "" + txtDoctor.Text;
                Response.Redirect("RegistrarPropuestaP.aspx");

            }
        }

      
    }
}