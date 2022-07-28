using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SWGACO.Paciente
{
    public partial class CambiarPasswordP : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuario_en_sesion"] != null)
            {
                string usuarioensesion = Session["usuario_en_sesion"].ToString();

                txtUsuario.Text = usuarioensesion;
                deshabilitarCampo();
                
            }
            else
            {
                Response.Redirect("~/IniciarSesion.aspx");
            }
        }

        private void deshabilitarCampo()
        {
            txtUsuario.ReadOnly = true;
        }
        protected void btnCambiarPassword_Click(object sender, EventArgs e)
        {
            if (txtPasswordNuevo.Text == txtConfirmarPasswordNuevo.Text)
            {
                string conectar = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
                SqlConnection sqlConectar = new SqlConnection(conectar);
                SqlCommand cmd = new SqlCommand("SP_Actualizar_Password", sqlConectar)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Connection.Open();
                cmd.Parameters.Add("@Documentoidentidad", SqlDbType.Int, 8).Value = txtUsuario.Text;
                cmd.Parameters.Add("@Contrasenia", SqlDbType.VarChar, 50).Value = txtPassword.Text;
                cmd.Parameters.Add("@Contrasenia_Nueva", SqlDbType.VarChar, 50).Value = txtPasswordNuevo.Text;
                
                lblSuccess.Text = "La contraseña fue actualizada correctamente";
                cmd.ExecuteNonQuery();
                cmd.Connection.Close();
            }
            else
            {
                lblError.Text = "La contraseña nueva no coincide";
            }
        }
    }
}