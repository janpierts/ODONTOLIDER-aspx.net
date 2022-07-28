using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using GestionDatos;
using Dominio;

namespace Negocio
{
    public class TratamientoBL
    {

        TratamientoDA objtratamiento;
        public TratamientoBL()
        {
            objtratamiento = new TratamientoDA();
        }

        public DataTable listarTratamiento()
        {
            return objtratamiento.listarTratamiento();
        }


        public string consultarCostoTratamiento(int pk)
        {
           return objtratamiento.ConsultarCostoTratamiento(pk);
        }
        

    }
}
