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

namespace SWGACO.Secretaria
{
    public partial class PagarCita : System.Web.UI.Page
    {

        PersonaBE personaBE = new PersonaBE();
        HorarioBE horarioBE = new HorarioBE();
        CitaBE citaBE = new CitaBE();
        DoctorBE doctorBE = new DoctorBE();
        CitaBL citaBL = new CitaBL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["CodCitaLista"] == null)
                {
                    Response.Redirect("PagarCita.aspx");

                }
                else
                {

                    txtCodCita.Text = Session["CodCitaLista"].ToString();
                    txtEstadoCita.Text = Session["estadoCita"].ToString();
                    mostrarDatosDeCitaYPersonales();
                    readOnly();
                }
            }
        }


        private void mostrarDatosDeCitaYPersonales()
        {
            citaBE.PK_IC_Cod = int.Parse(txtCodCita.Text);
            citaBL.consultarCita(personaBE, citaBE, horarioBE, doctorBE);
            txtNombre.Text = personaBE.VP_Nombre_Completo;
            txtApellidos.Text = personaBE.VP_Apellido_Paterno + " " + personaBE.VP_Apellido_Materno;
            txtTelefono.Text = Convert.ToString(personaBE.IP_Telefono);
            txtCorreo.Text = personaBE.VP_Correo_Electronico;
            txtDireccion.Text = personaBE.VP_Direccion;
            txtFecha.Text = citaBE.DC_Fecha_Cita.ToString("dd/MM/yyyy");
            txtHora.Text = string.Format("{0:hh\\:mm}", horarioBE.TH_Horario_Atencion);
            txtDoctor.Text ="DR. "+ doctorBE.VD_Apellidos;
            txtTratamiento.Text = citaBE.VC_Tratamiento;
            txtCosto.Text = "S/ " + 50;
            txtCambio.Text = "S/ 0.00";


        }

        private void readOnly()
        {
            txtNombre.ReadOnly = true;
            txtApellidos.ReadOnly = true;
            txtTelefono.ReadOnly = true;
            txtCorreo.ReadOnly = true;
            txtDireccion.ReadOnly = true;
            txtFecha.ReadOnly = true;
            txtHora.ReadOnly = true;
            txtDoctor.ReadOnly = true;
            txtTratamiento.ReadOnly = true;
            txtCosto.ReadOnly = true;
            txtCambio.ReadOnly = true;
        }

        protected void btnHabilitarCita_Click(object sender, EventArgs e)
        {

            if (txtEstadoCita.Text == "Pagado")
            {
                ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "alertError()", true);

            }
            citaBE.PK_IC_Cod = int.Parse(txtCodCita.Text);
            citaBE.FK_IEC_Cod = 2;
            citaBL.ActualizarEstadoSolicitud(citaBE);
            citaBL.insertarCostoCita(citaBE);
            ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "habilitarCita()", true);
         
        }

        protected void btnatras_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListarCitas.aspx");
        }
    }
}