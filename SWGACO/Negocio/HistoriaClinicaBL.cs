
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
    public class HistoriaClinicaBL
    {
        HistoriaClinicaDA objHistoria;
        public HistoriaClinicaBL()
        {
            objHistoria = new HistoriaClinicaDA();
        }
        public int RegistrarHistoriaClinica(HistoriaClinicaBE historiaBE)
        {
            return objHistoria.registrarHistoriaClinica(historiaBE);
        }

    }
}
