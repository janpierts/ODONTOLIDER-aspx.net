using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class CitaBE
    {
        public int PK_IC_Cod { get; set; }
        public int IP_Dni { get; set; }
        public DateTime DC_Fecha_Cita { get; set; }
        public string VC_Tratamiento { get; set; }
        public int IC_Costo_Cita { get; set; }
        public int FK_IP_Cod { get; set; }
        public int FK_ID_Cod { get; set; }
        public int FK_IH_Cod { get; set; }
        public int FK_IEC_Cod { get; set; }


    }
}
