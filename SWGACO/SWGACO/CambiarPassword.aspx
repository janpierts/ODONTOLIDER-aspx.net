<%@ Page Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="CambiarPassword.aspx.cs" Inherits="SWGACO.CambiarPassword" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script type="text/javascript">
        function SoloNumeros(e) {
            var key_press = document.all ? key_press = e.keyCode : key_press = e.which;
            return ((key_press > 47 && key_press < 58) || key_press == 46);
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
                        <legend class="hdrText"><i class="fa fa-user"></i>  Cambiar contraseña</legend>
                        <div class="col-sm-3 col-md-6">
                            <section style="margin-left: 400px">
                                <div>
                                    <asp:TextBox ID="txtUsuario" CssClass="form-control" onkeypress="javascript:return SoloNumeros(event)" runat="server" type="text" Style="border-radius: 25px" placeholder="DNI" required="true"></asp:TextBox>
                                    <span id="icon" style="margin-left: -40px">
                                        <i class="fa fa-id-card" aria-hidden="true"></i>
                                    </span>
                                </div>
                                <br />
                                <div>
                                    <asp:TextBox ID="txtPassword" CssClass="form-control" runat="server" TextMode="Password" Style="border-radius: 25px" placeholder="Contraseña" required="true"></asp:TextBox>
                                    
                                </div>
                                <br />
                                <div>
                                    <asp:TextBox ID="txtPasswordNuevo" CssClass="form-control" runat="server" TextMode="Password" Style="border-radius: 25px" placeholder="Nueva contraseña" required="true"></asp:TextBox>
                                    
                                </div>
                                <br />
                                <div>
                                    <asp:TextBox ID="txtConfirmarPasswordNuevo" CssClass="form-control" runat="server" TextMode="Password" Style="border-radius: 25px" placeholder="Repita contraseña" required="true"></asp:TextBox>
                                    
                                </div>
                                <br />
                                <div class="row">
                                    <asp:Button ID="btnCambiarPassword" CssClass="btn btn-primary btn-dark" runat="server" Text="Guardar" OnClick="btnCambiarPassword_Click" />
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
