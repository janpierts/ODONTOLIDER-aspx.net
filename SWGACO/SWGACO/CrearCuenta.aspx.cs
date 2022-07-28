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
    public partial class CrearCuenta : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCrearCuenta_Click(object sender, EventArgs e)
        {
            lblSuccess.Text = "";
            lblError.Text = "";
            string conectar = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;

            SqlConnection sqlConectar1 = new SqlConnection(conectar);
            SqlCommand cmd1 = new SqlCommand("sp_revisar", sqlConectar1)
            {
                CommandType = CommandType.StoredProcedure
            };
            cmd1.Connection.Open();
            cmd1.Parameters.Add("@IP_Dni", SqlDbType.Int, 8).Value = txtDni.Text;

            SqlDataReader dr = cmd1.ExecuteReader();
            
            if (dr.Read())
            {
                lblError.Text = "Error DNI ya fue registrado";
                cmd1.Connection.Close();
            }
            
            else
            {
                
                if (txtPass.Text == txtConfirmarPass.Text)
                {
                    SqlConnection sqlConectar = new SqlConnection(conectar);
                    SqlCommand cmd = new SqlCommand("sp_Registrar_Usuario", sqlConectar)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Connection.Open();
                    cmd.Parameters.Add("@IP_Dni", SqlDbType.Int, 8).Value = txtDni.Text;
                    cmd.Parameters.Add("@VP_Nombre_Completo", SqlDbType.VarChar, 50).Value = txtNombres.Text;
                    cmd.Parameters.Add("@VP_Apellido_Paterno", SqlDbType.VarChar, 50).Value = txtApellidoP.Text;
                    cmd.Parameters.Add("@VP_Apellido_Materno", SqlDbType.VarChar, 50).Value = txtApellidoM.Text;
                    cmd.Parameters.Add("@VP_Correo_Electronico", SqlDbType.VarChar, 50).Value = txtEmail.Text;
                    cmd.Parameters.Add("@VP_Direccion", SqlDbType.VarChar, 50).Value = txtDireccion.Text;
                    cmd.Parameters.Add("@DP_Fecha_Nacimiento", SqlDbType.Date).Value = txtFechaN.Text;
                    cmd.Parameters.Add("@DP_Fecha_Registro", SqlDbType.Date).Value = DateTime.Now;
                    cmd.Parameters.Add("@IP_Telefono", SqlDbType.Int).Value = txtTel.Text;
                    cmd.Parameters.Add("@Pass", SqlDbType.VarChar, 50).Value = txtPass.Text;
                    lblSuccess.Text = "Cuenta registrada correctamente";
                    cmd.ExecuteNonQuery();
                    cmd.Connection.Close();
                    txtNombres.Text = "";
                    txtApellidoP.Text = "";
                    txtApellidoM.Text = "";
                    txtEmail.Text = "";
                    txtTel.Text = "";
                    txtFechaN.Text = "";
                    txtDireccion.Text = "";
                    txtDni.Text = "";

                }
                else
                {
                    lblError.Text = "La contraseña no coincide";
                }
            }
        }
    }
}