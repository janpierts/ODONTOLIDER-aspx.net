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
    public partial class GestionarDatosPersonales : System.Web.UI.Page
    {
        PersonaBE personaBE = new PersonaBE();
        PersonaBL personaBL = new PersonaBL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                listarPersona();
         
            }

        }
        private void listarPersona()
        {
            gv_Tabla_Lista_Persona.DataSource = personaBL.listaPersona();
            gv_Tabla_Lista_Persona.DataBind();
        }
        private void registrarPersona()
        {
            personaBE.VP_Nombre_Completo = txtNombre.Text;
            personaBE.VP_Apellido_Materno = txtAM.Text;
            personaBE.VP_Apellido_Paterno = txtAP.Text;
            personaBE.VP_Correo_Electronico = txtCorreo.Text;
            personaBE.VP_Direccion = txtDireccion.Text;
            personaBE.IP_Dni = int.Parse(txtDni.Text);
            personaBE.IP_Telefono = int.Parse(txtTelefono.Text);
            personaBE.DP_Fecha_Nacimiento = DateTime.Parse(txtFechaNacimiento.Text);
            personaBE.DP_Fecha_Registro = DateTime.Now;
            personaBL.RegistrarPersona(personaBE);

            Response.Redirect("GestionarDatosPersonales.aspx");
        }

        protected void gv_Tabla_Lista_Persona_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void gv_Tabla_Lista_Persona_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gv_Tabla_Lista_Persona.PageIndex = e.NewPageIndex;
            listarPersona();
        }

        protected void gv_Tabla_Lista_Persona_DataBound(object sender, EventArgs e)
        {

        }

        protected void gv_Tabla_Lista_Persona_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            registrarPersona();

        }

    }
}