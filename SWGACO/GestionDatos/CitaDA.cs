using Dominio;
using System;
using System.Data;
using System.Data.SqlClient;


namespace GestionDatos
{
    public class CitaDA
    {
        SqlConnection sqlc;
        private SqlDataAdapter dat;
        private SqlCommand cmd;
        private DataSet ds;
        public CitaDA()
        {
            sqlc = new SqlConnection(ConexionDA.CadenaConexion);

        }

        public int registrarCita(CitaBE citaBE)
        {
            cmd = new SqlCommand("sp_Registrar_Cita", sqlc);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@DC_Fecha_Cita", citaBE.DC_Fecha_Cita);
            cmd.Parameters.AddWithValue("@VC_Tratamiento ", citaBE.VC_Tratamiento);
            cmd.Parameters.AddWithValue("@FK_IP_Cod ", citaBE.FK_IP_Cod);
            cmd.Parameters.AddWithValue("@FK_ID_Cod", citaBE.FK_ID_Cod);
            cmd.Parameters.AddWithValue("@FK_IH_Cod", citaBE.FK_IH_Cod);
            cmd.Parameters.AddWithValue("@FK_IEC_Cod", citaBE.FK_IEC_Cod);
            sqlc.Open();
            cmd.ExecuteNonQuery();
            sqlc.Close();
            return 1;
        }

        public DataTable listarDoctor()
        {
            try
            {
                dat = new SqlDataAdapter("SP_Listar_Doctor_ddl", sqlc);
                dat.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataSet ds = new DataSet();
                dat.Fill(ds);
                return ds.Tables[0];
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        
        public DataTable listarHorario()
        {
            try
            {
                dat = new SqlDataAdapter("SP_Listar_Hora_ddl", sqlc);
                dat.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataSet ds = new DataSet();
                dat.Fill(ds);
                return ds.Tables[0];
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public DataTable listaCita()
        {
            try
            {
                sqlc.Close();
                sqlc.Open();

                cmd = new SqlCommand("SP_Listar_Citas", sqlc);
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

        public DataTable listaDCita()
        {
            try
            {
                sqlc.Close();
                sqlc.Open();

                cmd = new SqlCommand("SP_ListarDCitas", sqlc);
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

        public DataTable listapcita(CitaBE citaBE)
        {
            try
            {
                sqlc.Close();
                sqlc.Open();

                cmd = new SqlCommand("SP_ListarPCitas", sqlc);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@documentoidentidad", citaBE.IP_Dni);

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
        public DataTable listappcita(CitaBE citaBE)
        {
            try
            {
                sqlc.Close();
                sqlc.Open();

                cmd = new SqlCommand("SP_ListarPPCitas", sqlc);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@documentoidentidad", citaBE.IP_Dni);

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
        public DataTable listarpcita(CitaBE citaBE)
        {
            try
            {
                sqlc.Close();
                sqlc.Open();

                cmd = new SqlCommand("SP_ListarRPCitas", sqlc);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@documentoidentidad", citaBE.IP_Dni);

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


        public void actualizarEstadoCita(CitaBE citaBE)
        {
            cmd = new SqlCommand("sp_actualizarEstadoCita", sqlc);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@PK_IC_Cod", citaBE.PK_IC_Cod);
            cmd.Parameters.AddWithValue("@FK_IEC_Cod", citaBE.FK_IEC_Cod);

            sqlc.Open();
            cmd.ExecuteNonQuery();
            sqlc.Close();
        }


        public void insertarCostoCita(CitaBE citaBE)
        {
            cmd = new SqlCommand("sp_Registrar_CostoCita", sqlc);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@PK_IC_Cod", citaBE.PK_IC_Cod);
            sqlc.Open();
            cmd.ExecuteNonQuery();
            sqlc.Close();
        }



        public void ConsultarCitaPk(PersonaBE personaBE, CitaBE citaBE,HorarioBE horarioBE ,DoctorBE doctoBE)
        {

            cmd = new SqlCommand("SP_Mostrar_DatosCitaYPersonales", sqlc);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@PK_IC_Cod", citaBE.PK_IC_Cod);
            sqlc.Close();
            sqlc.Open();
            cmd.ExecuteNonQuery();
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                if (reader[0] != DBNull.Value)
                { personaBE.VP_Nombre_Completo = (string)reader[0]; }
                else
                { personaBE.VP_Nombre_Completo = ""; }

                if (reader[1] != DBNull.Value)
                { personaBE.VP_Apellido_Paterno = (string)reader[1]; }
                else
                { personaBE.VP_Apellido_Paterno = ""; }

                if (reader[2] != DBNull.Value)
                { personaBE.VP_Apellido_Materno = (string)reader[2]; }
                else
                { personaBE.VP_Apellido_Materno = ""; }

                if (reader[3] != DBNull.Value)
                { personaBE.IP_Telefono = (int)reader[3]; }
                else
                { personaBE.IP_Telefono = 0; }


                if (reader[4] != DBNull.Value)
                { personaBE.VP_Correo_Electronico = (string)reader[4]; }
                else
                { personaBE.VP_Correo_Electronico = ""; }
                if (reader[5] != DBNull.Value)
                { personaBE.VP_Direccion = (string)reader[5]; }
                else
                { personaBE.VP_Direccion = ""; }
                if (reader[6] != DBNull.Value)
                { citaBE.DC_Fecha_Cita = (DateTime)reader[6]; }
                else
                { citaBE.DC_Fecha_Cita = DateTime.Parse("01/01/2000"); }
                if (reader[7] != DBNull.Value)
                { horarioBE.TH_Horario_Atencion = (TimeSpan)reader[7]; }
                else
                { horarioBE.TH_Horario_Atencion = TimeSpan.Parse("{0:mm\\:ss}"); }


                if (reader[8] != DBNull.Value)
                { doctoBE.VD_Apellidos = (string)reader[8]; }
                else
                { doctoBE.VD_Apellidos = ""; }

                if (reader[9] != DBNull.Value)
                { citaBE.VC_Tratamiento = (string)reader[9]; }
                else
                { citaBE.VC_Tratamiento = ""; }

             



                personaBE.estado = 99;
            }
            else
            {
                personaBE.estado = 1;
            }
            sqlc.Close();

        }


    }
}
