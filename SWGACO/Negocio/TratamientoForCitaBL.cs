
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
    public class TratamientoForCitaBL
    {
        TratamientoForCitaDA objtratamientoforcita;
        public TratamientoForCitaBL()
        {
            objtratamientoforcita = new TratamientoForCitaDA();
        }


        public int RegistrarTratamientoForCita(TratamientoForCitaBE tratamientoForCitaBE)
        {
            return objtratamientoforcita.registrarTratamientoForCita(tratamientoForCitaBE);
        }

        public int actualizarTratamientoForCita(int pk )
        {
            return objtratamientoforcita.actualizarTratamientoForCita(pk);
        }

        public int asistioDCita(int pk)
        {
            return objtratamientoforcita.asistioDCita(pk);
        }
        public int CancelarPForCita(int pk)
        {
            return objtratamientoforcita.CancelarPForCita(pk);
        }

        public DataTable ListarTratamientoForCita(int pkcita)
        {
            return objtratamientoforcita.ListarTratamientoForCita(pkcita);
        }

    }
}
