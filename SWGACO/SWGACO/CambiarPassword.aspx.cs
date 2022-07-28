using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SWGACO
{
    public partial class CambiarPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnCambiarPassword_Click(object sender, EventArgs e)
        {
            lblError.Text = "";
            string conectar = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;

            SqlConnection sqlConectar1 = new SqlConnection(conectar);
            SqlCommand cmd1 = new SqlCommand("sp_revisar", sqlConectar1)
            {
                CommandType = CommandType.StoredProcedure
            };
            cmd1.Connection.Open();
            cmd1.Parameters.Add("@IP_Dni", SqlDbType.Int, 8).Value = txtUsuario.Text;

            SqlDataReader dr = cmd1.ExecuteReader();

            if (dr.Read())
            {
                cmd1.Connection.Close();
                if (txtPasswordNuevo.Text == txtConfirmarPasswordNuevo.Text)
                {
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
            else
            {
                lblError.Text = "No hay usuario registrado con el DNI ingresado";
            }
            
        }
    }
}