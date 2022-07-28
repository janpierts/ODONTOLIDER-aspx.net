<%@ Page Title="" Language="C#" MasterPageFile="~/Paciente/PacienteHome.Master" AutoEventWireup="true" CodeBehind="AdministrarCitas.aspx.cs" Inherits="SWGACO.Paciente.AdministrarCitas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">

        function SoloNumeros(e) {
            var key_press = document.all ? key_press = e.keyCode : key_press = e.which;
            return ((key_press > 47 && key_press < 58) || key_press == 46);
        }

        function SoloLetrasYEsp() {

            if ((event.keyCode >= 65) && (event.keyCode <= 90) || (event.keyCode >= 97) && (event.keyCode <= 122) || event.keyCode == 32 || event.keyCode >= 192 && event.keyCode <= 255) {
                event.returnValue = true;
            }
            else {
                event.returnValue = false;
            }
        }

    </script>

    <style>
        .hdrText1 {
            color: #73879C;
            font-weight: bold;
        }

        fieldset {
            background-color: white;
            border-radius: 4px;
        }


        legend {
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 4px;
            color: var(--purple);
            font-size: 17px;
            font-weight: bold;
            padding: 3px 5px 3px 7px;
            width: auto;
        }

        .tab-content {
            width: 95%;
            height: 50%;
            background: #215a65;
            margin-left: 50px;
        }
    </style>
    <div class="row" style="padding-left: 20px">
        <!-- column -->
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body">

                 
                    <fieldset class="border" style="width: 80%; margin-left: 160px">
                        <legend class="hdrText"><i class="fa fa-user"></i>   PACIENTE</legend>
                        <h3 style="margin-left: 60px">  Datos Personales</h3>
                        

                        <div class="col-sm-9 col-md-6" style="margin-left: 80px; margin-top: 10px">

                            <div class="form-group">
                                <asp:Label ID="Label1" runat="server" Text="Nombre "></asp:Label>
                                <br />
                                <asp:TextBox ID="txtNombre" runat="server" class="form-control" Width="30%"></asp:TextBox>
                                   <asp:TextBox ID="txtpkip" runat="server" class="form-control" Width="30%" Visible="false"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="Label3" runat="server" Text="Apellidos"></asp:Label>
                                <br />
                                <asp:TextBox ID="txtApellidos" runat="server" class="form-control" Width="30%"></asp:TextBox>
                            </div>

                            <div class="form-group">
                                <asp:Label ID="Label2" runat="server" Text="Telefono"></asp:Label>
                                <br />
                                <asp:TextBox ID="txtTelefono" runat="server" class="form-control" Width="30%"></asp:TextBox>

                            </div>
                        </div>

                        <div class="col-sm-3 col-md-6" style="margin-left: 460px; margin-top: -260px">

                            <div class="form-group">
                                <asp:Label ID="Label5" runat="server" Text="Correo"></asp:Label>
                                <br />
                                <asp:TextBox ID="txtCorreo" runat="server" class="form-control" Width="40%"></asp:TextBox>
                            </div>

                            <div class="form-group">
                                <asp:Label ID="Label6" runat="server" Text="Direccion"></asp:Label>
                                <br />
                                <asp:TextBox ID="txtDireccion" runat="server" class="form-control" Width="40%"></asp:TextBox>

                            </div>
                        </div>

                        <section style="padding: 60px">
                        </section>

                        <fieldset class="border" style="width: 90%; margin-left: 20px">
                            <legend class="hdrText"><i class="fa fa-book"></i>   Cita</legend>

                            <div class="col-sm-3 col-md-6" style="margin-left: 60px">
                                <div class="form-group">
                                    <asp:Label ID="txtafiliacion" runat="server" Text="" Visible="false"></asp:Label>
                                    <asp:Label ID="Label7" runat="server" Text="Doctor"></asp:Label>
                                    <br />
                                    <asp:DropDownList ID="ddlDoctor" runat="server" CssClass="form-control" Width="35%" AutoPostBack="True">
                                        <asp:ListItem Value="">Seleccione una opción </asp:ListItem>
                                    </asp:DropDownList>
                                    <div class="form-group">
                                        <asp:Label ID="Label8" runat="server" Text="Fecha Cita"></asp:Label>
                                        <br />
                                        <asp:TextBox ID="txtfechaCita" runat="server" class="form-control" Width="35%" TextMode="Date"></asp:TextBox>
                                       
                                    </div>
                                </div>
                            </div>

                            <div class="col-sm-9 col-md-6" style="margin-left: 460px; margin-top: -150px">
                                <div class="form-group">
                                    <asp:Label ID="Label4" runat="server" Text="" Visible="false"></asp:Label>
                                    <asp:Label ID="Label9" runat="server" Text="Hora"></asp:Label>
                                    <br />
                                    <asp:DropDownList ID="ddlHora" runat="server" CssClass="form-control" Width="35%" AutoPostBack="True">
                                        <asp:ListItem Value="">Seleccione una opción </asp:ListItem>
                                    </asp:DropDownList>

                                    <div class="form-group">
                                        <asp:Label ID="Label10" runat="server" Text="Tratamiento"></asp:Label>
                                        <br />
                                        <asp:DropDownList ID="ddlTratamiento" runat="server" CssClass="form-control" Width="35%" AutoPostBack="True">
                                             <asp:ListItem Value="primero">--Seleccionar--</asp:ListItem>
                                            <asp:ListItem Value="Nuevo">Nuevo</asp:ListItem>
                                            <asp:ListItem Value="Continuo">Continuo</asp:ListItem>

                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                        </fieldset>
                        <section style="padding: 30px; margin-left: 10px">



                            <asp:LinkButton ID="btnRegistrarCita" CssClass="btn btn-info" runat="server" Text="Enviar" OnClick="btnRegistrarCita_Click"> <span class="glyphicon glyphicon-pencil" aria-hidden="true" style="color:white;"></span>
                                                        <p5 style="color:white">Registrar</p5>
                            </asp:LinkButton>
                            <asp:LinkButton ID="btnatras" CssClass="btn btn-danger" runat="server" Text="Atras" OnClick="btnatras_Click"> <span class="glyphicon glyphicon-remove" style="color:white" aria-hidden="true"></span>
                                                        <p5 style="color:white">Cancelar</p5>
                            </asp:LinkButton>

                        </section>


                    </fieldset>




                </div>


            </div>
        </div>
    </div>


    <!-- Alertas -->
  <script src="html/js/sweetalert.js"></script>
  
    <script>
        function alertDnivacio() {
            Swal.fire({
                position: 'center',
                icon: 'error',
                title: 'Ingrese un DNI',
                showConfirmButton: false,
                timer: 2000
            })
        }
        function alertDnidigitos() {
            Swal.fire({
                position: 'center',
                icon: 'error',
                title: 'El DNI solo puede contener 8 digitos',
                showConfirmButton: false,
                timer: 2000
            })
        }
        function alertNombreVacio() {
            Swal.fire({
                position: 'center',
                icon: 'error',
                title: 'Ingrese Nombre completo',
                showConfirmButton: false,
                timer: 2000
            })
        }

        function alertApaVacio() {
            Swal.fire({
                position: 'center',
                icon: 'error',
                title: 'Ingrese Apellido Paterno',
                showConfirmButton: false,
                timer: 2000
            })
        }
        function alertAmaVacio() {
            Swal.fire({
                position: 'center',
                icon: 'error',
                title: 'Ingrese Apeliido Materno',
                showConfirmButton: false,
                timer: 2000
            })
        }

        function alertDoctorVacio() {
            Swal.fire({
                position: 'center',
                icon: 'error',
                title: 'Seleccione un Doctor',
                showConfirmButton: false,
                timer: 2000
            })
        }
        function alertHoraVacio() {
            Swal.fire({
                position: 'center',
                icon: 'error',
                title: 'Seleccione una Hora',
                showConfirmButton: false,
                timer: 2000
            })
        }
        function alertTratamientoVacio() {
            Swal.fire({
                position: 'center',
                icon: 'error',
                title: 'Seleccione un tratamiento',
                showConfirmButton: false,
                timer: 2000
            })
        }

        function alertFechaCitaVacio() {
            Swal.fire({
                position: 'center',
                icon: 'error',
                title: 'Ingrese Fecha de cita',
                showConfirmButton: false,
                timer: 2000
            })
        }
        function alertFechaNacMayor18() {
            Swal.fire({
                position: 'center',
                icon: 'error',
                title: 'Tiene que ser persona mayor a 18 años',
                showConfirmButton: false,
                timer: 2000
            })
        }



        function alertDireccionVacio() {
            Swal.fire({
                position: 'center',
                icon: 'error',
                title: 'Ingrese Direccion',
                showConfirmButton: false,
                timer: 2000
            })
        }


        function alertDepartamentoVacio() {
            Swal.fire({
                position: 'center',
                icon: 'error',
                title: 'Seleccione su Lugar de Nacimiento',
                showConfirmButton: false,
                timer: 2000
            })
        }

        function alertDistritoVacio() {
            Swal.fire({
                position: 'center',
                icon: 'error',
                title: 'Seleccione su Distrito',
                showConfirmButton: false,
                timer: 2000
            })
        }

        function alertProvinciaVacio() {
            Swal.fire({
                position: 'center',
                icon: 'error',
                title: 'Seleccione su Provincia',
                showConfirmButton: false,
                timer: 2000
            })
        }


        function alertCorreoVacio() {
            Swal.fire({
                position: 'center',
                icon: 'error',
                title: 'Ingrese Correo Electronico',
                showConfirmButton: false,
                timer: 2000
            })
        }

        function alertCelularVacio() {
            Swal.fire({
                position: 'center',
                icon: 'error',
                title: 'Ingrese Numero celular',
                showConfirmButton: false,
                timer: 2000
            })
        }

        function alertTelefonoVacio() {
            Swal.fire({
                position: 'center',
                icon: 'error',
                title: 'Ingrese Telefono Fijo',
                showConfirmButton: false,
                timer: 2000
            })
        }

        function alertOcupacionVacio() {
            Swal.fire({
                position: 'center',
                icon: 'error',
                title: 'Seleccione su Ocupacion',
                showConfirmButton: false,
                timer: 2000
            })
        }


        function RegistrarCita() {
            Swal.fire({
                position: 'center',
                icon: 'success',
                title: 'Registrado',
                text: 'Se Registro la cita con exito',
                showConfirmButton: false,
                timer: 4000
            })
        }

        function alertErrorImagen() {
            Swal.fire({
                position: 'center',
                icon: 'error',
                title: 'Adjunte Archivo Solicitado',
                showConfirmButton: false,
                timer: 2000
            })
        }

        function alertErrorFechaCita() {
            Swal.fire({
                position: 'center',
                icon: 'error',
                title: 'la fecha ingresada no puede ser pasada a la actual',
                showConfirmButton: false,
                timer: 2000
            })
        }
    </script>


</asp:Content>
