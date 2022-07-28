<%@ Page Title="" Language="C#" MasterPageFile="~/Doctor/DoctorHome.Master" AutoEventWireup="true" CodeBehind="HistoriaClinica.aspx.cs" Inherits="SWGACO.Doctor.HistoriaClinica" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">

        function SoloNumeros(e) {
            var key_press = document.all ? key_press = e.keyCode : key_press = e.which;
            return ((key_press > 47 && key_press < 58) || key_press == 46);
        }

        function SoloLetrasYEsp(e) {

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
                      <asp:Label ID="txtCodHistoria" runat="server" Text="" Visible="false"></asp:Label>
                      <asp:Label ID="txtDniCodHistoria" runat="server" Text="" Visible="false"></asp:Label>
                    <fieldset class="border" style="width: 80%; margin-left: 160px">
                        <legend class="hdrText"><i class="fa fa-user"></i>PACIENTE</legend>
                        <h3 style="margin-left: 60px">Datos Personales</h3>


                        <div class="col-sm-9 col-md-6" style="margin-left: 50px; margin-top: 40px">

                            <div class="form-group">
                                <asp:Label ID="Label1" runat="server" Text="Dni "></asp:Label>
                                <br />
                                <asp:TextBox ID="txtDni" runat="server" class="form-control" Width="30%"></asp:TextBox>
                              
                            </div>

                        </div>
                        <div class="col-sm-9 col-md-6" style="margin-left: 300px; margin-top: -85px">

                            <div class="form-group">
                                <asp:Label ID="Label2" runat="server" Text="Nombre "></asp:Label>
                                <br />
                                <asp:TextBox ID="txtNombre" runat="server" class="form-control" Width="30%"></asp:TextBox>
                               
                            </div>

                        </div>

                        <div class="col-sm-9 col-md-6" style="margin-left: 550px; margin-top: -85px">

                            <div class="form-group">
                                <asp:Label ID="Label3" runat="server" Text="Apellidos "></asp:Label>
                                <br />
                                <asp:TextBox ID="txtApellidos" runat="server" class="form-control" Width="30%"></asp:TextBox>
                                
                            </div>

                        </div>
                        <div class="col-sm-9 col-md-6" style="margin-left: 800px; margin-top: -85px">

                            <div class="form-group">
                                <asp:Label ID="Label23" runat="server" Text="Correo "></asp:Label>
                                <br />
                                <asp:TextBox ID="txtCorreo" runat="server" class="form-control" Width="30%"></asp:TextBox>
                           
                            </div>

                        </div>

                        <hr style="color: deepskyblue; width: 80%; margin-left: 50px;" />

                        <section style="padding: 20px">
                        </section>

                        <fieldset class="border" style="width: 90%; margin-left: 20px">
                            <legend class="hdrText"><i class="fa fa-book"></i>Ficha Dental</legend>


                            <div class="col-sm-9 col-md-6" style="margin-left: 50px; margin-top: 40px">

                                <div class="form-group">
                                    <asp:Label ID="Label5" runat="server" Text="Codigo "></asp:Label>
                                    <br />
                                    <asp:TextBox ID="txtxCodigo" runat="server" class="form-control" Width="40%"></asp:TextBox>
                                    
                                </div>

                            </div>
                            <div class="col-sm-9 col-md-6" style="margin-left: 330px; margin-top: -85px">

                                <div class="form-group">
                                    <asp:Label ID="Label6" runat="server" Text="Fecha "></asp:Label>
                                    <br />
                                    <asp:TextBox ID="txtFecha" runat="server" class="form-control" Width="40%"></asp:TextBox>
                                   
                                </div>

                            </div>

                            <div class="col-sm-9 col-md-6" style="margin-left: 620px; margin-top: -85px">

                                <div class="form-group">
                                    <asp:Label ID="Label24" runat="server" Text="Doctor "></asp:Label>
                                    <br />
                                    <asp:TextBox ID="txtDoctor" runat="server" class="form-control" Width="40%"></asp:TextBox>
                                 
                                </div>

                            </div>


                        </fieldset>
                        <section style="padding: 10px">
                        </section>
                        <fieldset class="border" style="width: 90%; margin-left: 20px">
                            <legend class="hdrText"><i class="fa fa-book"></i>Riesgos</legend>



                            <div class="col-sm-9 col-md-6" style="margin-left: 50px; margin-top: 40px">

                                <div class="form-group">
                                    <asp:Label ID="Label4" runat="server" Text="Motivo de Consulta "></asp:Label>
                                    <br />
                                    <asp:TextBox ID="txtMotivo" runat="server" class="form-control" Width="85%" onkeypress="javascript:return SoloLetrasYEsp(event)" required="true"></asp:TextBox>
                               
                                </div>

                            </div>
                            <div class="col-sm-9 col-md-6" style="margin-left:650px; margin-top: -85px">

                                <div class="form-group">
                                    <asp:Label ID="Label7" runat="server" Text="Ultima Visita al Dentista "></asp:Label>
                                    <br />
                                    <asp:TextBox ID="txtVisita" runat="server" TextMode="Date" class="form-control" Width="40%" required="true"></asp:TextBox>
                                 
                                </div>

                            </div>



                        </fieldset>

                        <section style="padding: 10px">
                        </section>
                        <fieldset class="border" style="width: 90%; margin-left: 20px">
                            <legend class="hdrText"><i class="fa fa-book"></i>Antecedentes </legend>



                            <div class="col-sm-9 col-md-6" style="margin-left: 50px; margin-top: 40px">

                                <div class="form-group">
                                    <asp:Label ID="Label8" runat="server" Text="Alergias "></asp:Label>
                                    <br />
                                    <asp:TextBox ID="txtAlergias" runat="server" class="form-control" Width="40%" onkeypress="javascript:return SoloLetrasYEsp(event)"></asp:TextBox>
                                
                                </div>

                            </div>
                            <div class="col-sm-9 col-md-6" style="margin-left: 350px; margin-top: -90px">

                                <div class="form-group">
                                    <asp:Label ID="Label9" runat="server" Text="¿Toma Algún medicamento?"></asp:Label>
                                    <br />
                                    <asp:CheckBox ID="CheckSI" runat="server" Text="SI" />
                                    <asp:CheckBox ID="CheckNo" runat="server" Text="NO" />
                                </div>

                            </div>



                        </fieldset>
                        <section style="padding: 10px">
                        </section>

                        <fieldset class="border" style="width: 90%; margin-left: 20px">
                            <legend class="hdrText"><i class="fa fa-book"></i>Diagnostico </legend>



                            <div class="col-sm-9 col-md-6" style="margin-left: 50px; margin-top: 40px">

                                <div class="form-group">
                                    <asp:Label ID="Label10" runat="server" Text="Observacion"></asp:Label>
                                    <br />
                                    <asp:TextBox ID="txtObservacion" runat="server" class="form-control" Width="180%"></asp:TextBox>
                                
                                </div>

                            </div>

                        </fieldset>
                        <section style="padding: 30px; margin-left: 10px">



                            <asp:LinkButton ID="btnRegistrarHistoria" CssClass="btn btn-info" runat="server" Text="Enviar" OnClick="btnRegistrarHistoria_Click"> <span class="glyphicon glyphicon-pencil" aria-hidden="true" style="color:white;"></span>
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

        function alertAlergiasvacio() {
            Swal.fire({
                position: 'center',
                icon: 'error',
                title: 'Ingrese la alergia',
                showConfirmButton: false,
                timer: 2000
            })
        }

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


        function RegistrarHistoriaClinica() {
            Swal.fire({
                position: 'center',
                icon: 'success',
                title: 'Registrado',
                text: 'Se Registro la historia clinica con exito',
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
                title: 'La ultima visita no puede ser la fecha de hoy no posterior',
                showConfirmButton: false,
                timer: 2000
            })
        }
        function alertFechaCitaVacio() {
            Swal.fire({
                position: 'center',
                icon: 'error',
                title: 'Ingrese Fecha de ultima visita',
                showConfirmButton: false,
                timer: 2000
            })
        }
    </script>


</asp:Content>

