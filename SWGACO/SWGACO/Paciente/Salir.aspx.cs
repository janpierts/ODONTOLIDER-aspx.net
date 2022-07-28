using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;
using System.Data;
using System.Text.RegularExpressions;
using System.Text;
using System.Drawing;
using System.Net;
using System.Net.Mail;
using System.Threading.Tasks;
using System.Data.SqlClient;
using Rotativa;
using System.Security.Policy;
using System.Web.Mvc;

namespace SWGACO.Paciente
{
    public partial class Salir : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Remove("usuario_en_sesion");
            Response.Redirect("~/IniciarSesion.aspx");

        }


    }   
}