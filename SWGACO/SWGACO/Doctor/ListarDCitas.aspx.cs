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
    public partial class ListarDCitas : System.Web.UI.Page
    {
        TratamientoForCitaBL tratamientoForCitaBL = new TratamientoForCitaBL();
        CitaBL citaBL = new CitaBL();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            listarCita();
        
        }


        private void listarCita()
        {
            gv_Tabla_Lista_Cita.DataSource = citaBL.listaDCita();
            gv_Tabla_Lista_Cita.DataBind();
        }
        protected void gv_Tabla_Lista_Cita_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Asistio")//VER 

            {
                int index = Convert.ToInt32(e.CommandArgument);
                txtCodCitaLista.Text = gv_Tabla_Lista_Cita.Rows[index].Cells[0].Text;
                txtEstadoCita.Text = gv_Tabla_Lista_Cita.Rows[index].Cells[8].Text;
                Session["CodCitaLista"] = "" + txtCodCitaLista.Text;
                Session["estadoCita"] = "" + txtEstadoCita.Text;
                tratamientoForCitaBL.asistioDCita(int.Parse(txtCodCitaLista.Text));
                listarCita();

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