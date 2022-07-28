using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class PersonaBE
    {
        public int PK_IP_Cod { get; set; }
        public int IP_Dni { get; set; }
        public string VP_Nombre_Completo { get; set; }
        public string VP_Apellido_Paterno { get; set; }
        public string VP_Apellido_Materno { get; set; }
        public string VP_Correo_Electronico { get; set; }

        public string VP_Direccion { get; set; }

        public DateTime DP_Fecha_Nacimiento { get; set; }

        public DateTime DP_Fecha_Registro { get; set; }

        public int IP_Telefono { get; set; }
        public int estado { get; set; }
    }
}
