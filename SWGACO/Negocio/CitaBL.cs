
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

    public class CitaBL
    {


        CitaDA objcita;
        public CitaBL()
        {
            objcita = new CitaDA();
        }

        public int RegistrarCita(CitaBE citaBE)
        {
            return objcita.registrarCita(citaBE);
        }
        public DataTable listarDoctor()
        {
            return objcita.listarDoctor();
        }
        public DataTable listarHorario()
        {
            return objcita.listarHorario();
        }

        public DataTable listaCita()
        {
            return objcita.listaCita();
        }
        public DataTable listaDCita()
        {
            return objcita.listaDCita();
        }
        public DataTable listaPCita(CitaBE citaBE)
        {
            return objcita.listapcita(citaBE);
        }
        public DataTable listaPPCita(CitaBE citaBE)
        {
            return objcita.listappcita(citaBE);
        }
        public DataTable listaRPCita(CitaBE citaBE)
        {
            return objcita.listarpcita(citaBE);
        }


        public void consultarCita(PersonaBE personaBE, CitaBE citaBE, HorarioBE horarioBE, DoctorBE doctoBE)
        {
            objcita.ConsultarCitaPk(personaBE, citaBE, horarioBE, doctoBE);
        }

        public void ActualizarEstadoSolicitud(CitaBE citaBE)
        {
            objcita.actualizarEstadoCita(citaBE);
        }


        public void insertarCostoCita(CitaBE citaBE)
        {
            objcita.insertarCostoCita(citaBE);
        }
        

    }




}
