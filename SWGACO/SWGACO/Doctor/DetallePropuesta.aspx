<%@ Page Title="" Language="C#" MasterPageFile="~/Doctor/DoctorHome.Master" AutoEventWireup="true" CodeBehind="DetallePropuesta.aspx.cs" Inherits="SWGACO.Doctor.DetallePropuesta" %>

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
                    <asp:Label ID="txtCodCitaPropuesta" runat="server" Text="" Visible="false"></asp:Label>
                    <asp:Label ID="txtCodDoctorCita" runat="server" Text="" Visible="false"></asp:Label>
                     <asp:Label ID="txtCodITFC" runat="server" Text="" Visible="false"></asp:Label>
            
                    <asp:Label ID="txtCosto" runat="server" Text="" Visible="false"></asp:Label>
                    <fieldset class="border" style="width: 80%; margin-left: 160px">
                        <legend class="hdrText"><i class="fa fa-user"></i>DETALLE DE PROPUESTAS</legend>
                        <h3 style="margin-left: 60px">Doctor</h3>


                        <!--<div class="col-sm-9 col-md-6" style="margin-left: 50px; margin-top: 40px">

                            <div class="form-group">
                                <asp:Label ID="Label1" runat="server" Text="Tratamiento "></asp:Label>
                                <br />
                                <asp:DropDownList ID="ddlTratamiento" runat="server" CssClass="form-control" Width="35%" AutoPostBack="True" OnSelectedIndexChanged="ddlTratamiento_SelectedIndexChanged">
                                    <asp:ListItem Value="">Seleccione una opción </asp:ListItem>
                                </asp:DropDownList>
                            </div>

                        </div>
                        <div class="col-sm-9 col-md-6" style="margin-left: 300px; margin-top: -85px">

                            <div class="form-group">
                                <asp:Label ID="Label2" runat="server" Text="Cantidad"></asp:Label>
                                <br />
                                <asp:TextBox ID="txtCantidad" runat="server" class="form-control" Width="30%"></asp:TextBox>

                            </div>

                        </div>

                        <div class="col-sm-9 col-md-6" style="margin-left: 550px; margin-top: -85px">

                            <div class="form-group">
                                <asp:Label ID="Label3" runat="server" Text="Numero de Sesiones "></asp:Label>
                                <br />
                                <asp:DropDownList ID="ddlSesiones" runat="server" CssClass="form-control" Width="35%" AutoPostBack="True">
                                    <asp:ListItem Value="0">--Seleccionar--</asp:ListItem>
                                    <asp:ListItem Value="1">1</asp:ListItem>
                                    <asp:ListItem Value="2">2</asp:ListItem>
                                    <asp:ListItem Value="3">3</asp:ListItem>
                                    <asp:ListItem Value="4">4</asp:ListItem>
                                    <asp:ListItem Value="5">5</asp:ListItem>
                                    <asp:ListItem Value="6">6</asp:ListItem>
                                    <asp:ListItem Value="7">7</asp:ListItem>
                                    <asp:ListItem Value="8">8</asp:ListItem>
                                    <asp:ListItem Value="9">9</asp:ListItem>
                                    <asp:ListItem Value="10">10</asp:ListItem>

                                </asp:DropDownList>

                            </div>

                        </div>
                        <div class="col-sm-9 col-md-6" style="margin-left: 800px; margin-top: -85px">

                            <div class="form-group">
                                <asp:Label ID="Label23" runat="server" Text="Doctor "></asp:Label>
                                <br />
                                <asp:TextBox ID="txtDoctor" ReadOnly="true" runat="server" class="form-control" Width="30%"></asp:TextBox>

                            </div>

                        </div>


                        -->

                        <hr style="color: deepskyblue; width: 80%; margin-left: 50px;" />

                        <section style="margin-left : 10px">
                            <asp:GridView ID="gv_Tabla_Lista_Tratamiento_Cita" runat="server" OnRowCommand="gv_Tabla_Lista_Tratamiento_Cita_RowCommand" OnPageIndexChanging="gv_Tabla_Lista_Tratamiento_Cita_PageIndexChanging" EmptyDataText="No hay tratamientos propuestos" CssClass="table-responsive-sm table-hover" Width="60%" AutoGenerateColumns="False" GridLines="None">
                                <Columns>
                                    <asp:BoundField DataField="PK_ITFC_Cod" HeaderText="#" />
                                    <asp:BoundField DataField="VITFC_NombreTratamiento" HeaderText="Tratamiento" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                                        <HeaderStyle CssClass="text-center"></HeaderStyle>

                                        <ItemStyle CssClass="text-center"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="ITFC_Cantidad" HeaderText="Cantidad" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                                        <HeaderStyle CssClass="text-center"></HeaderStyle>

                                        <ItemStyle CssClass="text-center"></ItemStyle>
                                    </asp:BoundField>

                                    <asp:BoundField DataField="ITFC_CostoUnitario" HeaderText="Costo Unitario" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                                        <HeaderStyle CssClass="text-center"></HeaderStyle>

                                        <ItemStyle CssClass="text-center"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="ITFC_CostoTotal" HeaderText="Costo Total" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                                        <HeaderStyle CssClass="text-center"></HeaderStyle>

                                        <ItemStyle CssClass="text-center"></ItemStyle>
                                    </asp:BoundField>
                                    

                                </Columns>

                                <HeaderStyle BackColor="#008080" ForeColor="white" Font-Bold="true" />
                            </asp:GridView>


                        </section>

                        <!--<div class="col-sm-9 col-md-6" style="margin-left: 450px; margin-top: 75px">

                            <div class="form-group">
                                <asp:Label ID="Label4" runat="server" Text="Tipo de Pago : "></asp:Label>

                                <asp:DropDownList ID="ddlTipoPago" runat="server" CssClass="form-control" Width="35%" AutoPostBack="True">
                                    <asp:ListItem Value="0">--Seleccionar--</asp:ListItem>
                                    <asp:ListItem Value="1">Contado</asp:ListItem>
                                    <asp:ListItem Value="2">Por Cuotas</asp:ListItem>


                                </asp:DropDownList>

                            </div>


                        </div>-->

                        <div class="col-sm-9 col-md-6" style="margin-left: 490px; margin-top: 5px">


                            <div class="form-group">
                                <asp:Label ID="Label7" runat="server" Text="Total : "></asp:Label>

                                <asp:TextBox ID="txtMontoTotalPropuesta" ReadOnly="true" runat="server" class="form-control" Width="35%"></asp:TextBox>

                            </div>

                        </div>

                        <div class="col-sm-9 col-md-6" style="margin-left: 1000px; margin-top: 75px">

                            <div class="form-group">
                                <asp:LinkButton ID="btnAtras" CssClass="btn btn-info" runat="server" OnClick="btnAtras_Click" Text="Atras"> <span class="glyphicon glyphicon-pencil" aria-hidden="true" style="color:white;"></span>
                                                        <p5 style="color:white">Atras</p5>
                                </asp:LinkButton>
                            </div>

                        </div>


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


        function RegistrarHistoriaClinica() {
            Swal.fire({
                position: 'center',
                icon: 'success',
                title: 'Registrado',
                text: 'Se Registro la la propuesta con exito',
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
    </script>


</asp:Content>
