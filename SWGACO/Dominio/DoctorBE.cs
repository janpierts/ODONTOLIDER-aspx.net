using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class DoctorBE
    {
        public int PK_ID_Cod { get; set; } 
        public string VD_Codigo_Medico { get; set; }
        public string VD_Nombre { get; set; }
        public string VD_Apellidos { get; set; }
        public int ID_Numero_Colegiado { get; set; }

    }
}
