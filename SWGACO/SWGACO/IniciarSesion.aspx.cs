using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace SWGACO
{
    public partial class IniciarSesion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private void Ingresar()
        {
             if (txtUsuario.Text== "")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alerta", "alertDoctorVacio()", true);
                return;
            }
            Ingresar();
        }
        protected void btnIngresar_Click(object sender, EventArgs e)
        {
           
            string conectar = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
            SqlConnection sqlConectar = new SqlConnection(conectar);
            SqlCommand cmd = new SqlCommand("SP_Validar_Usuario", sqlConectar)
            {
                CommandType = CommandType.StoredProcedure
            };
            cmd.Connection.Open();
            cmd.Parameters.Add("@Documentoidentidad", SqlDbType.Int, 7).Value = txtUsuario.Text;
            cmd.Parameters.Add("@Contrasenia", SqlDbType.VarChar, 50).Value = txtPassword.Text;

            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                Session["usuario_en_sesion"] = txtUsuario.Text;
                Response.Redirect("~/Paciente/ListarPCitas.aspx");
            }

            else
            {
                lblError.Text = "Error de Usuario o Contraseña";
            }
            cmd.Connection.Close();

        }
    }
}