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
    public partial class HistoriaClinica : System.Web.UI.Page
    {
        PersonaBE personaBE = new PersonaBE();
        HorarioBE horarioBE = new HorarioBE();
        CitaBE citaBE = new CitaBE();
        HistoriaClinicaBE historiaBE = new HistoriaClinicaBE();
        HistoriaClinicaBL historiaBL = new HistoriaClinicaBL();
        DoctorBE doctorBE = new DoctorBE();
        CitaBL citaBL = new CitaBL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["CodHistoria"] == null)
                {
                    Response.Redirect("ListarPacientesNuevos.aspx");

                }
                else
                {
                    txtCodHistoria.Text = Session["CodHistoria"].ToString();
                    txtDniCodHistoria.Text = Session["Dni"].ToString();

                    mostrarDatosDeCitaYPersonales();
                    readOnly();
                    txtFecha.Text = DateTime.Now.Date.ToString("dd/MM/yyyy");
                    txtxCodigo.Text = RandomPassword();
                }

            }

        }



        private void mostrarDatosDeCitaYPersonales()
        {
            citaBE.PK_IC_Cod = int.Parse(txtCodHistoria.Text);
            citaBL.consultarCita(personaBE, citaBE, horarioBE, doctorBE);
            txtNombre.Text = personaBE.VP_Nombre_Completo;
            txtApellidos.Text = personaBE.VP_Apellido_Paterno + " " + personaBE.VP_Apellido_Materno;
            txtCorreo.Text = personaBE.VP_Correo_Electronico;
            txtDoctor.Text = "DR. " + doctorBE.VD_Apellidos;
            txtDni.Text = txtDniCodHistoria.Text;
        }

        private void readOnly()
        {
            txtNombre.ReadOnly = true;
            txtApellidos.ReadOnly = true;
            txtCorreo.ReadOnly = true;
            txtDoctor.ReadOnly = true;
            txtDni.ReadOnly = true;
            txtFecha.ReadOnly = true;
            txtxCodigo.ReadOnly = true;
        }

        public string RandomPassword()
        {
            // Creating object of random class
            Random rand = new Random();

            // Choosing the size of string
            // Using Next() string
            int stringlen = rand.Next(5, 10);
            int randValue;
            string str = "";
            char letter;
            for (int i = 0; i < stringlen; i++)
            {

                // Generating a random number.
                randValue = rand.Next(0, 26);

                // Generating random character by converting
                // the random number into character.
                letter = Convert.ToChar(randValue + 65);

                // Appending the letter to string.
                str = str + letter;
            }

            return str;
        }

        protected void btnatras_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListarPacientesNuevos.aspx");
        }

        
        protected void btnRegistrarHistoria_Click(object sender, EventArgs e)
        {
            var siOno=false;

            if (CheckSI.Checked)
            {
                siOno = true;
            }
            else
            {
                siOno = false;
            }
            if (txtVisita.Text=="")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alerta", "alertErrorFechaCita()", true);
                return;
            }
            else
            {
                if (DateTime.Parse(txtVisita.Text) >= DateTime.Today)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alerta", "alertErrorFechaCita()", true);
                    return;
                }
                else
                {
                    historiaBE.VHC_Codigo = txtxCodigo.Text;
                    historiaBE.DHC_Fecha_Historia = DateTime.Parse(txtFecha.Text);
                    historiaBE.VHC_Motivo_Consulta = txtMotivo.Text;
                    historiaBE.DHC_Ultima_Visita = DateTime.Parse(txtVisita.Text);
                    historiaBE.VHC_Alergias = txtAlergias.Text;
                    historiaBE.BHC_Toma_Medicamento = siOno;
                    historiaBE.VHC_Diagnostico = txtObservacion.Text;
                    historiaBE.FK_IP_Cod = int.Parse(txtCodHistoria.Text);

                    ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "RegistrarHistoriaClinica()", true);
                    historiaBL.RegistrarHistoriaClinica(historiaBE);
                    deshabilitarCampos();
                }
            }
        }


        private void deshabilitarCampos()
        {
            txtMotivo.ReadOnly = true;
            txtVisita.ReadOnly = true;
            txtAlergias.ReadOnly = true;
            txtObservacion.ReadOnly = true;
    
        }
    }
}