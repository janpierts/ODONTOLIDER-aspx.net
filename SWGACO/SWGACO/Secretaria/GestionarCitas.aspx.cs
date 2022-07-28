using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Web.ClientServices;
using System.Net;
using System.IO;
using System.Drawing;
using System.Windows.Forms;

namespace SWGACO.Secretaria
{
    public partial class GestionarCitas : System.Web.UI.Page
    {
        CitaBE citaBE = new CitaBE();
        CitaBL citaBL = new CitaBL();
        PersonaBE personaBE = new PersonaBE();
        PersonaBL personBL = new PersonaBL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                deshabilitarCampos();
                listarCamposDdl();
            }

        }


        private void listarCamposDdl()
        {
            //DOCTOR
            ddlDoctor.DataSource = citaBL.listarDoctor();
            ddlDoctor.DataTextField = "apellido";
            ddlDoctor.DataValueField = "PK_ID_Cod";
            ddlDoctor.DataBind();
            ddlDoctor.Items.Insert(0, "--seleccionar--");


            //HORA
            ddlHora.DataSource = citaBL.listarHorario();
            ddlHora.DataTextField = "HORA";
            ddlHora.DataValueField = "PK_IH_Cod";
            ddlHora.DataBind();
            ddlHora.Items.Insert(0, "--seleccionar--");
        }

        private void buscarPersona()
        { 
            personaBE.IP_Dni = int.Parse(txtBuscar.Text);
            personBL.BuscarPersona(personaBE);
            txtpkip.Text = Convert.ToString(personaBE.PK_IP_Cod);
            txtNombre.Text = personaBE.VP_Nombre_Completo;
            txtApellidos.Text = personaBE.VP_Apellido_Paterno + " " + personaBE.VP_Apellido_Materno;
            txtTelefono.Text = Convert.ToString(personaBE.IP_Telefono);
            txtCorreo.Text = personaBE.VP_Correo_Electronico;
            txtDireccion.Text = personaBE.VP_Direccion;
     

        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            if (txtBuscar.Text =="")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alerta", "alertDnivacio()", true);
                limpiarCamposDatosPersonales();
              
                return;
            }

            if (txtBuscar.Text.Trim().Length != 8)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alerta", "alertDnidigitos()", true);
                return;
            }
            buscarPersona();
        }


        private void limpiarCamposDatosPersonales()
        {
            txtBuscar.Text = "";
            txtNombre.Text = "";
            txtApellidos.Text = "";
            txtTelefono.Text = "";
            txtCorreo.Text = "";
            txtDireccion.Text = "";
        }
        private void limpiarCitas()
        {
            ddlDoctor.Items.Clear();
            ddlHora.Items.Clear();
            ddlTratamiento.Items.Clear();
            txtfechaCita.Text = "";
        }

        void deshabilitarCampos()
        {
            txtNombre.ReadOnly = true;
            txtApellidos.ReadOnly = true;
            txtTelefono.ReadOnly = true;
            txtCorreo.ReadOnly = true;
            txtDireccion.ReadOnly = true;
        }
        private void registrarCita()
        {

            if (DateTime.Parse(txtfechaCita.Text) < DateTime.Today)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alerta", "alertErrorFechaCita()", true);
                return;
            }
            else
            {
                citaBE.DC_Fecha_Cita = DateTime.Parse(txtfechaCita.Text);
                citaBE.VC_Tratamiento = ddlTratamiento.SelectedValue;
                citaBE.FK_ID_Cod = ddlDoctor.SelectedIndex;
                citaBE.FK_IH_Cod = ddlHora.SelectedIndex;
                citaBE.FK_IP_Cod = int.Parse(txtpkip.Text);
                citaBE.FK_IEC_Cod = 1;
                ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "RegistrarCita()", true);
                citaBL.RegistrarCita(citaBE);
                limpiarCitas();
                limpiarCamposDatosPersonales();
            }
        }

        protected void btnRegistrarCita_Click(object sender, EventArgs e)
        {


            if (ddlDoctor.SelectedIndex == 0)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alerta", "alertDoctorVacio()", true);
                return;
            }

            if (ddlHora.SelectedIndex == 0)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alerta", "alertHoraVacio()", true);
                return;
            }
            if (ddlTratamiento.SelectedIndex == 0)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alerta", "alertTratamientoVacio() ", true);
                return;
            }
            if (txtfechaCita.Text == "")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alerta", "alertFechaCitaVacio()", true);
                return;
            }
            registrarCita();
        }

        protected void btnatras_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListarCitas.aspx");
        }
    }
}