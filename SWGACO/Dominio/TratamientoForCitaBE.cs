using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class TratamientoForCitaBE
    {
        public int PK_ITFC_Cod { get; set; }
        public string VITFC_NombreTratamiento { get; set; }
        public int ITFC_Cantidad { get; set; }
        public int ITFC_NumeroSesiones { get; set; }
        public int ITFC_CostoUnitario { get; set; }
        public int ITFC_CostoTotal { get; set; }

        public int FK_IC_Cod { get; set; }
        public int FK_ITRA_Cod { get; set; }
        public int FK_IETFC_Cod { get; set; }

    }
}
