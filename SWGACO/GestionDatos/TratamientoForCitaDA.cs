using Dominio;
using System;
using System.Data;
using System.Data.SqlClient;

namespace GestionDatos
{
    public class TratamientoForCitaDA
    {
        SqlConnection sqlc;
        private SqlDataAdapter dat;
        private SqlCommand cmd;
        private DataSet ds;
        public TratamientoForCitaDA()
        {
            sqlc = new SqlConnection(ConexionDA.CadenaConexion);

        }


        public int registrarTratamientoForCita(TratamientoForCitaBE tratamientoForCitaBE)
        {
            cmd = new SqlCommand("sp_Registrar_TratamientoForCita", sqlc);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@VITFC_NombreTratamiento", tratamientoForCitaBE.VITFC_NombreTratamiento);
            cmd.Parameters.AddWithValue("@ITFC_Cantidad", tratamientoForCitaBE.ITFC_Cantidad);
            cmd.Parameters.AddWithValue("@ITFC_NumeroSesiones", tratamientoForCitaBE.ITFC_NumeroSesiones);
            cmd.Parameters.AddWithValue("@ITFC_CostoUnitario", tratamientoForCitaBE.ITFC_CostoUnitario);
            cmd.Parameters.AddWithValue("@ITFC_CostoTotal", tratamientoForCitaBE.ITFC_CostoTotal);
            cmd.Parameters.AddWithValue("@FK_IC_Cod", tratamientoForCitaBE.FK_IC_Cod);
            cmd.Parameters.AddWithValue("@FK_ITRA_Cod", tratamientoForCitaBE.FK_ITRA_Cod);
           
            sqlc.Open();
            cmd.ExecuteNonQuery();
            sqlc.Close();
            return 1;
        }

        public DataTable ListarTratamientoForCita(int pkcita)
        {
            try
            {
                sqlc.Close();
                sqlc.Open();

                cmd = new SqlCommand("SP_Listar_TratamientoForCita", sqlc);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@pkcita", pkcita);
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

        public int actualizarTratamientoForCita(int pkcita)
        {
            cmd = new SqlCommand("sp_UpdateStateTratamientoForCita", sqlc);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@pkitfc", pkcita);
         
            sqlc.Open();
            cmd.ExecuteNonQuery();
            sqlc.Close();
            return 1;
        }
        public int CancelarPForCita(int pk)
        {
            cmd = new SqlCommand("sp_CancelarPCita", sqlc);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@PK_IC_Cod", pk);

            sqlc.Open();
            cmd.ExecuteNonQuery();
            sqlc.Close();
            return 1;

        }
        public int asistioDCita(int pk)
        {
            cmd = new SqlCommand("sp_asistioDCita", sqlc);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@PK_IC_Cod", pk);

            sqlc.Open();
            cmd.ExecuteNonQuery();
            sqlc.Close();
            return 1;

        }


    }
}
