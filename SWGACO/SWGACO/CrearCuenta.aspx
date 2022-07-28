<%@ Page Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="CrearCuenta.aspx.cs" Inherits="SWGACO.CrearCuenta" %>


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
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body">
                    <fieldset class="border" style="width: 80%; margin-left: 160px" >
                        <legend class="hdrText"><i class="fa fa-user"></i>  Crear Cuenta</legend>
                        <div class="col-sm-3 col-md-6">
                            <section style="margin-left: 400px">
                                <div>
                                    <asp:TextBox ID="txtNombres" CssClass="form-control" onkeypress="javascript:return SoloLetrasYEsp(event)" runat="server" type="text" Style="border-radius: 25px" placeholder="Nombres" required="true"></asp:TextBox>
                                    <span id="icon" style="margin-left: -40px">
                                        <i class="fa fa-id-card" aria-hidden="true"></i>
                                    </span>
                                </div>
                                <br />
                                <div>
                                    <asp:TextBox ID="txtApellidoP" CssClass="form-control" onkeypress="javascript:return SoloLetrasYEsp(event)" runat="server" type="text" Style="border-radius: 25px" placeholder="Apellido Paterno" required="true"></asp:TextBox>
                                    <span id="icon" style="margin-left: -40px">
                                        <i class="fa fa-id-card" aria-hidden="true"></i>
                                    </span>
                                </div>
                                <br />
                                <div>
                                    <asp:TextBox ID="txtApellidoM" CssClass="form-control" onkeypress="javascript:return SoloLetrasYEsp(event)" runat="server" type="text" Style="border-radius: 25px" placeholder="Apellido Materno" required="true"></asp:TextBox>
                                    <span id="icon" style="margin-left: -40px">
                                        <i class="fa fa-id-card" aria-hidden="true"></i>
                                    </span>
                                </div>
                                <br />
                                <div>
                                    <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server" type="email" onfocus="this.type='email'" Style="border-radius: 25px" placeholder="Correo" required="true"></asp:TextBox>
                                    <span id="icon" style="margin-left: -40px">
                                        <i class="fa fa-id-card" aria-hidden="true"></i>
                                    </span>
                                </div>
                                <br />
                                <div>
                                    <asp:TextBox ID="txtTel" CssClass="form-control" onkeypress="javascript:return SoloNumeros(event)" runat="server" type="text" Style="border-radius: 25px" placeholder="Telefono/Celular" required="true"></asp:TextBox>
                                    <span id="icon" style="margin-left: -40px">
                                        <i class="fa fa-id-card" aria-hidden="true"></i>
                                    </span>
                                </div>
                                <br />
                                <div>
                                    <asp:TextBox ID="txtFechaN" CssClass="form-control" onkeypress="javascript:return SoloNumeros(event)" runat="server" type="date" Style="border-radius: 25px" required="true"></asp:TextBox>
                                    
                                </div>
                                <br />
                                <div>
                                    <asp:TextBox ID="txtDireccion" CssClass="form-control" runat="server" type="text" Style="border-radius: 25px" placeholder="Direccion" required="true"></asp:TextBox>
                                    <span id="icon" style="margin-left: -40px">
                                        <i class="fa fa-id-card" aria-hidden="true"></i>
                                    </span>
                                </div>
                                <br />
                                <div>
                                    <asp:TextBox ID="txtDni" CssClass="form-control" onkeypress="javascript:return SoloNumeros(event)" runat="server" type="text" Style="border-radius: 25px" placeholder="DNI" required="true"></asp:TextBox>
                                    <span id="icon" style="margin-left: -40px">
                                        <i class="fa fa-id-card" aria-hidden="true"></i>
                                    </span>
                                </div>
                                <br />
                                <div>
                                    <asp:TextBox ID="txtPass" CssClass="form-control" runat="server" TextMode="Password" Style="border-radius: 25px" placeholder="Contraseña" required="true"></asp:TextBox>
                                    
                                </div>
                                <br />
                                <div>
                                    <asp:TextBox ID="txtConfirmarPass" CssClass="form-control" runat="server" TextMode="Password" Style="border-radius: 25px" placeholder="Repita contraseña" required="true"></asp:TextBox>
                                    
                                </div>
                                <br />
                                <div class="row">
                                    <asp:Button ID="btnRegistrar" CssClass="btn btn-primary btn-dark" runat="server" Text="Registrar" OnClick="btnCrearCuenta_Click" />
                                </div>
                                <br />
                                <div class="row">
                                    <asp:Label runat="server" CssClass="alert-danger" ID="lblError"></asp:Label>
                                </div>
                                <br />
                                <div class="row">
                                    <asp:Label runat="server" CssClass="alert-success" ID="lblSuccess"></asp:Label>
                                </div>
                                <br />
                                <a href="Inicio.aspx">Atras</a> 
                                <br />
                                <a href="IniciarSesion.aspx">Iniciar Sesion</a>
                            </section>
                        </div>
                    </fieldset>
                </div>
            </div>
        </div>
    </div>


</asp:Content>
