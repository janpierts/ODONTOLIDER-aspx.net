using Dominio;
using System;
using System.Data;
using System.Data.SqlClient;


namespace GestionDatos
{
   public class HistoriaClinicaDA
    {
        SqlConnection sqlc;
        private SqlDataAdapter dat;
        private SqlCommand cmd;
        private DataSet ds;
        public HistoriaClinicaDA()
        {
            sqlc = new SqlConnection(ConexionDA.CadenaConexion);

        }

        public int registrarHistoriaClinica(HistoriaClinicaBE historiaBE)
        {
            cmd = new SqlCommand("sp_Registrar_HistoriaClinica", sqlc);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@VHC_Codigo", historiaBE.VHC_Codigo);
            cmd.Parameters.AddWithValue("@DHC_Fecha_Historia", historiaBE.DHC_Fecha_Historia);
            cmd.Parameters.AddWithValue("@VHC_Motivo_Consulta", historiaBE.VHC_Motivo_Consulta);
            cmd.Parameters.AddWithValue("@DHC_Ultima_Visita", historiaBE.DHC_Ultima_Visita);
            cmd.Parameters.AddWithValue("@VHC_Alergias", historiaBE.VHC_Alergias);
            cmd.Parameters.AddWithValue("@BHC_Toma_Medicamento", historiaBE.BHC_Toma_Medicamento);
            cmd.Parameters.AddWithValue("@VHC_Diagnostico", historiaBE.VHC_Diagnostico);
            cmd.Parameters.AddWithValue("@FK_IP_Cod", historiaBE.FK_IP_Cod);

            sqlc.Close();
            sqlc.Open();
            cmd.ExecuteNonQuery();
            sqlc.Close();
            return 1;
        }


    }
}
