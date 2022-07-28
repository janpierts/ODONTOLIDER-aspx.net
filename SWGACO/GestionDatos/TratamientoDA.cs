using Dominio;
using System;
using System.Data;
using System.Data.SqlClient;


namespace GestionDatos
{
    public class TratamientoDA
    {
        SqlConnection sqlc;
        private SqlDataAdapter dat;
        private SqlCommand cmd;
        private DataSet ds;
        public TratamientoDA()
        {
            sqlc = new SqlConnection(ConexionDA.CadenaConexion);

        }


        public DataTable listarTratamiento()
        {
            try
            {
                dat = new SqlDataAdapter("SP_Listar_Tratamiento_ddl", sqlc);
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

        

        public string ConsultarCostoTratamiento(int pk)
        {

            cmd = new SqlCommand("SP_ConsultarCostoTratamiento", sqlc);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@PKINT", pk);
            sqlc.Open();
            cmd.ExecuteNonQuery();
            sqlc.Close();
            return null;

        }


    }
}
