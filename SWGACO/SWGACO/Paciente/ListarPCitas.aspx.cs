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

namespace SWGACO
{
    public partial class ListarPCitas : System.Web.UI.Page
    {
        TratamientoForCitaBL tratamientoForCitaBL = new TratamientoForCitaBL();
        CitaBE citaBE = new CitaBE();
        CitaBL citaBL = new CitaBL();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuario_en_sesion"] != null)
            {
                string usuarioensesion = Session["usuario_en_sesion"].ToString();
                citaBE.IP_Dni = int.Parse(usuarioensesion);
                listarPCita();
            }
            else
            {
                Response.Redirect("~/IniciarSesion.aspx");
            }
        
        }


        private void listarPCita()
        {
            gv_Tabla_Lista_Cita.DataSource = citaBL.listaPCita(citaBE);
            gv_Tabla_Lista_Cita.DataBind();
        }
        
        protected void gv_Tabla_Lista_Cita_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Cancelar")//VER 

            {
                int index = Convert.ToInt32(e.CommandArgument);
                txtCodCitaLista.Text = gv_Tabla_Lista_Cita.Rows[index].Cells[0].Text;
                txtEstadoCita.Text = gv_Tabla_Lista_Cita.Rows[index].Cells[8].Text;
                Session["CodCitaLista"] = "" + txtCodCitaLista.Text;
                Session["estadoCita"] = "" + txtEstadoCita.Text;
                tratamientoForCitaBL.CancelarPForCita(int.Parse(txtCodCitaLista.Text));
                //Response.Redirect("ListarPCitas.aspx");
                listarPCita();
            }
        }

        protected void gv_Tabla_Lista_Cita_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }

        protected void gv_Tabla_Lista_Cita_DataBound(object sender, EventArgs e)
        {

        }

        protected void gv_Tabla_Lista_Cita_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }
    }
}