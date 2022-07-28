<%@ Page Title="" Language="C#" MasterPageFile="~/Secretaria/SecretariaHome.Master" AutoEventWireup="true" CodeBehind="PagarCita.aspx.cs" Inherits="SWGACO.Secretaria.PagarCita" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


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

                    <script language="javascript">
                        function myFunction() {
                            alert('Key Press')
                        }
                    </script>
                    <fieldset class="border" style="width: 80%; margin-left: 160px">
                        <legend class="hdrText"><i class="fa fa-user"></i>   Pagar Cita</legend>
                        <h3 style="margin-left: 60px">  Datos Personales</h3>
                     
                         <asp:Label ID="txtCodCita" runat="server" Text="" Visible="false"></asp:Label>
                         <asp:Label ID="txtEstadoCita" runat="server" Text="" Visible="false"></asp:Label>
                        <div class="col-sm-9 col-md-6" style="margin-left: 70px; margin-top: 54px">

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

                        
                        </div>

                        <div class="col-sm-3 col-md-6" style="margin-left: 380px; margin-top: -180px">

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

                        <div class="col-sm-3 col-md-6" style="margin-left: 780px; margin-top: -170px">

                              <div class="form-group">
                                <asp:Label ID="Label2" runat="server" Text="Telefono"></asp:Label>
                                <br />
                                <asp:TextBox ID="txtTelefono" runat="server" class="form-control" Width="30%"></asp:TextBox>

                            </div>
                        </div>


                         
                        <section style="padding: 90px">
                        </section>

                        <fieldset class="border" style="width: 90%; margin-left: 20px">
                            <legend class="hdrText"><i class="fa fa-book"></i>   Cita</legend>

                               <div class="col-sm-3 col-md-6" style="margin-left: 60px">
                                <div class="form-group">
                                    <asp:Label ID="Label11" runat="server" Text="" Visible="false"></asp:Label>
                                    <asp:Label ID="Label12" runat="server" Text="Costo"></asp:Label>
                                    <br />
                                     <asp:TextBox ID="txtCosto" runat="server" class="form-control" Width="30%"></asp:TextBox>
                                    <div class="form-group">
                                        <asp:Label ID="Label13" runat="server" Text="Cambio"></asp:Label>
                                        <br />
                                         <asp:TextBox ID="txtCambio" runat="server" class="form-control" Width="30%"></asp:TextBox>

                                    </div>
                                </div>
                            </div>

                            <div class="col-sm-3 col-md-6" style="margin-left: 360px;margin-top:-150px">
                                <div class="form-group">
                                    <asp:Label ID="txtafiliacion" runat="server" Text="" Visible="false"></asp:Label>
                                    <asp:Label ID="Label7" runat="server" Text="Doctor"></asp:Label>
                                    <br />
                               <asp:TextBox ID="txtDoctor" runat="server" class="form-control" Width="30%"></asp:TextBox>
                                    <div class="form-group">
                                        <asp:Label ID="Label8" runat="server" Text="Fecha Cita"></asp:Label>
                                        <br />
                                       <asp:TextBox ID="txtFecha" runat="server" class="form-control" Width="30%"></asp:TextBox>

                                    </div>
                                </div>
                            </div>

                            <div class="col-sm-9 col-md-6" style="margin-left: 660px; margin-top: -150px">
                                <div class="form-group">
                                    <asp:Label ID="Label4" runat="server" Text="" Visible="false"></asp:Label>
                                    <asp:Label ID="Label9" runat="server" Text="Hora"></asp:Label>
                                    <br />
                                   <asp:TextBox ID="txtHora" runat="server" class="form-control" Width="30%"></asp:TextBox>

                                    <div class="form-group">
                                        <asp:Label ID="Label10" runat="server" Text="Tratamiento"></asp:Label>
                                        <br />
                                       <asp:TextBox ID="txtTratamiento" runat="server" class="form-control" Width="30%"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </fieldset>
                        <section style="padding: 30px; margin-left: 10px">



                            <asp:LinkButton ID="btnHabilitarCita" CssClass="btn btn-primary" runat="server" Text="Habilitar" OnClick="btnHabilitarCita_Click"> <span class="glyphicon glyphicon-pencil" aria-hidden="true" style="color:white;"></span>
                                                        <p5 style="color:white">Habilitar</p5>
                            </asp:LinkButton>
                            <asp:LinkButton ID="btnatras" CssClass="btn btn-danger" runat="server" Text="Cancelar" OnClick="btnatras_Click"> <span class="glyphicon glyphicon-remove" style="color:white" aria-hidden="true"></span>
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

        function alertEstadoCivilVacio() {
            Swal.fire({
                position: 'center',
                icon: 'error',
                title: 'Seleccione su Estado Civil',
                showConfirmButton: false,
                timer: 2000
            })
        }
        function alertSexolVacio() {
            Swal.fire({
                position: 'center',
                icon: 'error',
                title: 'Seleccione su Sexo',
                showConfirmButton: false,
                timer: 2000
            })
        }

        function alertFechaNacVacio() {
            Swal.fire({
                position: 'center',
                icon: 'error',
                title: 'Ingrese Fecha de Nacimiento',
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

        function habilitarCita() {
            Swal.fire({
                position: 'center',
                icon: 'success',
                title: 'Habilitado',
                text: 'Se Habilitó la cita con exito',
                showConfirmButton: false,
                timer: 4000
            })
        }

        function alertError() {
            Swal.fire({
                position: 'center',
                icon: 'error',
                title: 'Ya Pagó esta cita',
                showConfirmButton: false,
                timer: 2000
            })
        }
    </script>


</asp:Content>
