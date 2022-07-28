<%@ Page Title="" Language="C#" MasterPageFile="~/Secretaria/SecretariaHome.Master" AutoEventWireup="true" CodeBehind="GestionarDatosPersonales.aspx.cs" Inherits="SWGACO.GestionarDatosPersonales" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .icon {
            position: absolute;
            top: 0;
            right: -15px;
            transition: right 0.2s;
        }
    </style>
    <script type="text/javascript">
        function Search_Gridview(strKey) {
            var strData = strKey.value.toLowerCase().split(" ");
            var tblData = document.getElementById("<%=gv_Tabla_Lista_Persona.ClientID %>");
            var rowData;
            for (var i = 1; i < tblData.rows.length; i++) {
                rowData = tblData.rows[i].innerHTML;
                var styleDisplay = 'none';
                for (var j = 0; j < strData.length; j++) {
                    if (rowData.toLowerCase().indexOf(strData[j]) >= 0)
                        styleDisplay = '';
                    else {
                        styleDisplay = 'none';
                        break;
                    }
                }
                tblData.rows[i].style.display = styleDisplay;
            }
        }
    </script>


   
    <div class="text-align: right mt-1" style="padding: 20px;">
        <!-- Button trigger modal -->
        <button type="button" class="btn waves-effect waves-light btn-success hidden-md-down text-white" data-toggle="modal" data-target="#exampleModalCenter">
            <i class="fa fa-user" aria-hidden="true" style="color: black;"></i>Registrar Persona
        </button>
    </div>



    <div class="field" id="searchform">
        <%-- <asp:TextBox placeholder="Ingresar elemento a buscar" ID="txtFillter"  runat="server" AutoPostBack="true" onkeyup="Search_Gridview(this)" />
        --%><%--   <button type="button" id="search">Buscar</button>--%>
    </div>

    <script class="cssdeck" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>


    <div class="row" style="padding-left:20px">
        <!-- column -->
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">Agregar Persona</h4>
                    <h6 class="card-subtitle"><code>Listado de Persona</code></h6>

                    <label for="password2">DNI:</label>
                    <input type="text" style="border-radius: 25px; padding-left: 40px; padding-right: 40px;"
                        onkeyup="Search_Gridview(this)" />
                    <span id="icon" style="margin-left: -250px">
                        <i class="fa fa-search" aria-hidden="true"></i>
                    </span>
                    <label for="password2" style="margin-left: 260px">Nombre:</label>
                    <input type="text" style="border-radius: 25px; padding-left: 40px; padding-right: 40px;"
                        onkeyup="Search_Gridview(this)" />
                    <span id="icon2" style="margin-left: -250px">
                        <i class="fa fa-search" aria-hidden="true"></i>
                    </span>
                </div>
          
                <asp:GridView ID="gv_Tabla_Lista_Persona" runat="server" OnRowCommand="gv_Tabla_Lista_Persona_RowCommand" OnPageIndexChanging="gv_Tabla_Lista_Persona_PageIndexChanging" EmptyDataText="No hay Solicitudes aceptadas" CssClass="table-responsive-sm table-hover" Width="100%" AutoGenerateColumns="False" GridLines="None" OnDataBound="gv_Tabla_Lista_Persona_DataBound" OnRowDataBound="gv_Tabla_Lista_Persona_RowDataBound">
                    <Columns>
                        <asp:BoundField DataField="PK_IP_Cod" HeaderText="#" />
                        <asp:BoundField DataField="IP_Dni" HeaderText="Dni" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                            <HeaderStyle CssClass="text-center"></HeaderStyle>

                            <ItemStyle CssClass="text-center"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="VP_Nombre_Completo" HeaderText="Nombres" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                            <HeaderStyle CssClass="text-center"></HeaderStyle>

                            <ItemStyle CssClass="text-center"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="VP_Apellido_Paterno" HeaderText="Apellido Paterno" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                            <HeaderStyle CssClass="text-center"></HeaderStyle>

                            <ItemStyle CssClass="text-center"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="VP_Apellido_Materno" HeaderText="Apellido Materno" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                            <HeaderStyle CssClass="text-center"></HeaderStyle>

                            <ItemStyle CssClass="text-center"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="VP_Correo_Electronico" HeaderText="Correo" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" DataFormatString="{0:d}">
                            <HeaderStyle CssClass="text-center"></HeaderStyle>

                            <ItemStyle CssClass="text-center"></ItemStyle>
                        </asp:BoundField>

                        <asp:BoundField DataField="DP_Fecha_Nacimiento" HeaderText="Fecha Nacimiento" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" DataFormatString="{0:d}">
                            <HeaderStyle CssClass="text-center"></HeaderStyle>

                            <ItemStyle CssClass="text-center"></ItemStyle>
                        </asp:BoundField>

                        <asp:BoundField DataField="IP_Telefono" HeaderText="Telefono" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" DataFormatString="{0:d}">
                            <HeaderStyle CssClass="text-center"></HeaderStyle>

                            <ItemStyle CssClass="text-center"></ItemStyle>
                        </asp:BoundField>



                        <asp:TemplateField HeaderText="Acción" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnEditar" Height="38px" CssClass="btn btn-warning" runat="server" CommandName="Editar" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" Text="Editar" Style="color: white"> <i class="fa fa-edit"></i>
                                         Editar             
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>

                    <HeaderStyle BackColor="#008080" ForeColor="white" Font-Bold="true" />
                </asp:GridView>
            </div>
            </div>
        </div>





    <!-- Modal -->
    <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="w3-container w3-green">
                    <h5 style="text-align: center" class="modal-title " id="exampleModalLongTitle">Agregar Persona</h5>

                </div>

                <div class="modal-body">
                    <div class="row">
                        <div class="col-sm-3 col-md-6">
                            <div class="form-group">
                                <asp:Label ID="Label1" runat="server" Text="Nombre:"></asp:Label>
                                <asp:TextBox ID="txtNombre" runat="server" class="form-control"></asp:TextBox>
                                <asp:Label ID="Label2" runat="server" Text="Correo:"></asp:Label>
                                <asp:TextBox ID="txtCorreo" runat="server" class="form-control"></asp:TextBox>
                                <asp:Label ID="Label3" runat="server" Text="Telefono:"></asp:Label>
                                <asp:TextBox ID="txtTelefono" runat="server" class="form-control"></asp:TextBox>
                                 <asp:Label ID="lblfecha" runat="server" Text="Fecha Nacimiento:"></asp:Label>
                                <br />
                                <asp:TextBox ID="txtFechaNacimiento" runat="server" class="form-control" ValidateRequestMode="Inherit" TextMode="Date"></asp:TextBox>
                      
                            </div>
                        </div>
                        <div class="col-sm-3 col-md-6">
                            <div class="form-group">
                                <asp:Label ID="txtimporte" runat="server" Text="Apellido Paterno:"></asp:Label>
                                <asp:TextBox ID="txtAP" runat="server" class="form-control"></asp:TextBox>
                                <asp:Label ID="Label4" runat="server" Text="Apellido Materno:"></asp:Label>
                                <asp:TextBox ID="txtAM" runat="server" class="form-control"></asp:TextBox>
                                <asp:Label ID="Label5" runat="server" Text="Dni:"></asp:Label>
                                <asp:TextBox ID="txtDni" runat="server" class="form-control"></asp:TextBox>
                                   <asp:Label ID="Label6" runat="server" Text="Direccion:"></asp:Label>
                                <asp:TextBox ID="txtDireccion" runat="server" class="form-control"></asp:TextBox>


                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer" style="margin-left: -20px">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                    <asp:LinkButton ID="btnRegistrar" CssClass="btn btn-info" runat="server" OnClick="btnRegistrar_Click" Text="Registrar"> <span class="glyphicon glyphicon-save-file" aria-hidden="true" style="color:white"></span>
                                         <p5 style="color:white">Registrar</p5>
                    </asp:LinkButton>
                </div>
            </div>
        </div>
    </div>


    <script type="text/javascript">
        function SetupFilter(textboxID, gridID, columnName) {
            $('#' + textboxID).keyup(function () {
                var index;
                var text = $("#" + textboxID).val();

                $('#' + gridID + ' tbody tr').each(function () {
                    $(this).children('th').each(function () {
                        if ($(this).html() == columnName)
                            index = $(this).index();
                    });

                    $(this).children('td').each(function () {
                        if ($(this).index() == index) {
                            var tdText = $(this).children(0).html() == null ? $(this).html() : $(this).children(0).html();

                            if (tdText.indexOf(text, 0) > -1) {
                                $(this).closest('tr').show();
                            } else {
                                $(this).closest('tr').hide();
                            }
                        };
                    });
                });
            });
        };

        $(function () {
            SetupFilter('txtFillter', 'gv_Tabla_Lista_Persona', 'VP_Nombre_Completo');
        });
    </script>



    <link rel="stylesheet"
        href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
        integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
        crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
        integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
        crossorigin="anonymous"></script>


</asp:Content>
