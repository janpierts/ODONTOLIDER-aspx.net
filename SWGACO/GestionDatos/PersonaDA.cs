using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;
using System.Data;
using System.Data.SqlClient;

namespace GestionDatos
{
    public class PersonaDA
    {
        SqlConnection sqlc;
        private SqlDataAdapter dat;
        private SqlCommand cmd;
        private DataSet ds;
        public PersonaDA()
        {
            sqlc = new SqlConnection(ConexionDA.CadenaConexion);
        }

        public int registrarPersona(PersonaBE objpe)
        {
            cmd = new SqlCommand("sp_Registrar_Persona", sqlc);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@IP_Dni", objpe.IP_Dni);
            cmd.Parameters.AddWithValue("@VP_Nombre_Completo", objpe.VP_Nombre_Completo);
            cmd.Parameters.AddWithValue("@VP_Apellido_Paterno", objpe.VP_Apellido_Paterno);
            cmd.Parameters.AddWithValue("@VP_Apellido_Materno", objpe.VP_Apellido_Materno);
            cmd.Parameters.AddWithValue("@VP_Correo_Electronico", objpe.VP_Correo_Electronico);
            cmd.Parameters.AddWithValue("@VP_Direccion", objpe.VP_Direccion);
            cmd.Parameters.AddWithValue("@DP_Fecha_Nacimiento", objpe.DP_Fecha_Nacimiento);
            cmd.Parameters.AddWithValue("@DP_Fecha_Registro", objpe.DP_Fecha_Registro);
            cmd.Parameters.AddWithValue("@IP_Telefono ", objpe.IP_Telefono);

            sqlc.Open();
            cmd.ExecuteNonQuery();
            sqlc.Close();
            return 1;
        }


        public DataTable listaPersona()
        {
            try
            {
                sqlc.Close();
                sqlc.Open();

                cmd = new SqlCommand("SP_ListarPersona", sqlc);
                cmd.CommandType = CommandType.StoredProcedure;

                dat = new SqlDataAdapter(cmd);
                ds = new DataSet();
                dat.Fill(ds);
                return ds.Tables[0];
            }
            catch (Exception e)
            {
                throw e;
            }
        }


        public DataTable listaPacienteNueva()
        {
            try
            {
                sqlc.Close();
                sqlc.Open();

                cmd = new SqlCommand("SP_Listar_Paciente_Nuevo", sqlc);
                cmd.CommandType = CommandType.StoredProcedure;

                dat = new SqlDataAdapter(cmd);
                ds = new DataSet();
                dat.Fill(ds);
                return ds.Tables[0];
            }
            catch (Exception e)
            {
                throw e;
            }
        }


        public DataTable listaCitasPT()
        {
            try
            {
                sqlc.Close();
                sqlc.Open();

                cmd = new SqlCommand("SP_Listar_CitasPorPaciente", sqlc);
                cmd.CommandType = CommandType.StoredProcedure;

                dat = new SqlDataAdapter(cmd);
                ds = new DataSet();
                dat.Fill(ds);
                return ds.Tables[0];
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public DataTable listaPacienteCita()
        {
            try
            {
                sqlc.Close();
                sqlc.Open();

                cmd = new SqlCommand("SP_Listar_CitasPorPaciente", sqlc);
                cmd.CommandType = CommandType.StoredProcedure;

                dat = new SqlDataAdapter(cmd);
                ds = new DataSet();
                dat.Fill(ds);
                return ds.Tables[0];
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        
        public void buscarPersona(PersonaBE objpe)
        {

            cmd = new SqlCommand("sp_BuscarPersona", sqlc);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Dni", objpe.IP_Dni);
            sqlc.Close();
            sqlc.Open();
            cmd.ExecuteNonQuery();
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                if (reader[0] != DBNull.Value)
                { objpe.PK_IP_Cod = (int)reader[0]; }
                else
                { objpe.PK_IP_Cod = 0; }

                if (reader[1] != DBNull.Value)
                { objpe.IP_Dni = (int)reader[1]; }
                else
                { objpe.IP_Dni = 0; }

                if (reader[2] != DBNull.Value)
                { objpe.VP_Nombre_Completo = (string)reader[2]; }
                else
                { objpe.VP_Nombre_Completo = ""; }

                if (reader[3] != DBNull.Value)
                { objpe.VP_Apellido_Paterno = (string)reader[3]; }
                else
                { objpe.VP_Apellido_Paterno = ""; }

                if (reader[4] != DBNull.Value)
                { objpe.VP_Apellido_Materno = (string)reader[4]; }
                else
                { objpe.VP_Apellido_Materno = ""; }


                if (reader[5] != DBNull.Value)
                { objpe.VP_Correo_Electronico = (string)reader[5]; }
                else
                { objpe.VP_Correo_Electronico = ""; }

                if (reader[6] != DBNull.Value)
                { objpe.VP_Direccion = (string)reader[6]; }
                else
                { objpe.VP_Direccion = ""; }

                if (reader[7] != DBNull.Value)
                { objpe.DP_Fecha_Nacimiento = (DateTime)reader[7]; }
               

                if (reader[8] != DBNull.Value)
                { objpe.DP_Fecha_Registro = (DateTime)reader[8]; }

                if (reader[9] != DBNull.Value)
                { objpe.IP_Telefono = (int)reader[9]; }

                objpe.estado = 99;
            }

            else
            {
                objpe.estado = 1;
            }
            sqlc.Close();
        }


    }
}
