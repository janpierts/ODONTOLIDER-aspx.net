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
    public class PersonaBL
    {


        PersonaDA objpersona;

        public PersonaBL()
        {
            objpersona = new PersonaDA();
        }


        public int RegistrarPersona(PersonaBE personaBE)
        {
            return objpersona.registrarPersona(personaBE);
        }

        public DataTable listaPersona()
        {
            return objpersona.listaPersona();
        }

        public void BuscarPersona(PersonaBE personaBE)
        {
            objpersona.buscarPersona(personaBE);
        }

        public DataTable listaPacienteNueva()
        {
            return objpersona.listaPacienteNueva();
        }

        public DataTable listaPacienteCita()
        {
            return objpersona.listaPacienteCita();
        }
        public DataTable listaCitasPT()
        {
            return objpersona.listaCitasPT();
        }
    }
}
