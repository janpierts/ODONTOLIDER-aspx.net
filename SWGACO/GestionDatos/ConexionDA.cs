using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;


namespace GestionDatos
{
    public class ConexionDA
    {
        public static string CadenaConexion
        {
            get
            {
                return "Data Source =localhost;Initial Catalog=BD_SWGACO;Integrated Security=True";

            }


        }
    }
}
