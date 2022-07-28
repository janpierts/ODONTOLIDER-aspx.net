using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SWGACO
{
    public partial class PacienteHome : System.Web.UI.MasterPage
    {
        PersonaBE personaBE = new PersonaBE();
        PersonaBL personBL = new PersonaBL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuario_en_sesion"] != null)
            {
                string usuarioensesion = Session["usuario_en_sesion"].ToString();
                personaBE.IP_Dni = int.Parse(usuarioensesion);
                personBL.BuscarPersona(personaBE);
                lblBienvenida.Text = personaBE.VP_Nombre_Completo;
            }
            else
            {
                Response.Redirect("~/IniciarSesion.aspx");
            }
        }
        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Session.Remove("usuario_en_sesion");
            Response.Redirect("~/IniciarSesion.aspx");
        }
    }
}