using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;
using GestionDatos;
using System.Data;
using System.Text.RegularExpressions;
using System.Text;
using System.Drawing;
using System.Net;
using System.Net.Mail;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Configuration;


namespace SWGACO.Doctor
{
    public partial class RegistrarPropuestaP : System.Web.UI.Page
    {
        TratamientoBL tratamientoBL = new TratamientoBL();
        TratamientoForCitaBE tratamientoForCitaBE = new TratamientoForCitaBE();
        TratamientoForCitaBL tratamientoForCitaBL = new TratamientoForCitaBL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuario_en_sesion"] != null)
            {
                string usuarioensesion = Session["usuario_en_sesion"].ToString();
                if (!IsPostBack)
                {
                    if (Session["CodCitaPropuesta"] == null)
                    {
                        Response.Redirect("ProponesTratamientoP.aspx");

                    }
                    else
                    {
                        txtCodCitaPropuesta.Text = Session["CodCitaPropuesta"].ToString();
                        txtCodDoctorCita.Text = Session["Doctor"].ToString();
                        //listarCamposDdl();
                        listarTratamientoForCita();

                        //txtDoctor.Text = txtCodDoctorCita.Text;
                        double montofinal = gv_Tabla_Lista_Tratamiento_Cita.Rows.Cast<GridViewRow>().Sum(x => Convert.ToDouble(x.Cells[4].Text));
                        txtMontoTotalPropuesta.Text = Convert.ToString(montofinal);



                    }

                }
            }
            else
            {
                Response.Redirect("~/IniciarSesion.aspx");
            }

                
        }

        /*private void listarCamposDdl()
        {
            //DOCTOR
            ddlTratamiento.DataSource = tratamientoBL.listarTratamiento();
            ddlTratamiento.DataTextField = "VTRA_Nombre";
            ddlTratamiento.DataValueField = "PK_ITRA_Cod";
            ddlTratamiento.DataBind();
            ddlTratamiento.Items.Insert(0, "--seleccionar--");


        }

        protected void ddlTratamiento_SelectedIndexChanged(object sender, EventArgs e)
        {
            int id = ddlTratamiento.SelectedIndex;
            SqlConnection sqlc = new SqlConnection(ConexionDA.CadenaConexion);
            SqlCommand cm = new SqlCommand("SELECT * FROM Tratamiento where PK_ITRA_Cod='" + id + "'", sqlc);
            sqlc.Open();
            SqlDataReader dr = cm.ExecuteReader();
            if (dr.Read())
            {
                txtCosto.Text = dr["ITRA_Costo"].ToString();

            }
            sqlc.Close();
        }*/

        private void listarTratamientoForCita()
        {
            int pkcita = int.Parse(txtCodCitaPropuesta.Text);
            gv_Tabla_Lista_Tratamiento_Cita.DataSource = tratamientoForCitaBL.ListarTratamientoForCita(pkcita);
            gv_Tabla_Lista_Tratamiento_Cita.DataBind();
        }

        /*private void agregarP()
        {
            tratamientoForCitaBE.VITFC_NombreTratamiento = ddlTratamiento.SelectedItem.ToString();
            tratamientoForCitaBE.ITFC_Cantidad = int.Parse(txtCantidad.Text);
            tratamientoForCitaBE.ITFC_NumeroSesiones = ddlSesiones.SelectedIndex;
            tratamientoForCitaBE.ITFC_CostoUnitario = int.Parse(txtCosto.Text);
            var calcularCostoTotal = int.Parse(txtCosto.Text) * int.Parse(txtCantidad.Text);
            tratamientoForCitaBE.ITFC_CostoTotal = calcularCostoTotal;
            tratamientoForCitaBE.FK_IC_Cod = int.Parse(txtCodCitaPropuesta.Text);
            tratamientoForCitaBE.FK_ITRA_Cod = int.Parse(ddlTratamiento.SelectedValue);
            tratamientoForCitaBL.RegistrarTratamientoForCita(tratamientoForCitaBE);
            Response.Redirect("RegistrarPropuestaP.aspx");
            ClientScript.RegisterStartupScript(this.Page.GetType(), "alerta", "RegistrarHistoriaClinica()", true);

        }
        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            if (ddlSesiones.SelectedIndex==0)
            {

                return;
            }
            agregarP();
            


        }*/

        protected void gv_Tabla_Lista_Tratamiento_Cita_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Eliminar")//VER 

            {
                int index = Convert.ToInt32(e.CommandArgument);
                txtCodITFC.Text = gv_Tabla_Lista_Tratamiento_Cita.Rows[index].Cells[0].Text;
                tratamientoForCitaBL.actualizarTratamientoForCita(int.Parse(txtCodITFC.Text));
                listarTratamientoForCita();
            }
        }

        protected void gv_Tabla_Lista_Tratamiento_Cita_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {

            Response.Redirect("ProponesPTratamiento.aspx");
        }

    
    }
}