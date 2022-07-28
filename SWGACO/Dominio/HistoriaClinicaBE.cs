using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class HistoriaClinicaBE
    {
        public int PK_IHC_Cod { get; set; }
        public string VHC_Codigo { get; set; }
        public DateTime DHC_Fecha_Historia { get; set; }
        public string VHC_Motivo_Consulta { get; set; }
        public DateTime DHC_Ultima_Visita { get; set; }
        public string VHC_Alergias { get; set; }
        public bool BHC_Toma_Medicamento { get; set; }
        public string VHC_Diagnostico { get; set; }
        public int FK_IP_Cod { get; set; }

        public int estado { get; set; }

    }
}
