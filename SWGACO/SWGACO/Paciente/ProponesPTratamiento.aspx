<%@ Page Title="" Language="C#" MasterPageFile="~/Paciente/PacienteHome.Master" AutoEventWireup="true" CodeBehind="ProponesPTratamiento.aspx.cs" Inherits="SWGACO.Paciente.ProponesPTratamiento" %>
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
    <asp:Label ID="a" runat="server" Text="" Visible="false"></asp:Label>
    <script type="text/javascript">
        function Search_Gridview(strKey) {
            var strData = strKey.value.toLowerCase().split(" ");
            var tblData = document.getElementById("<%=gv_Tabla_Lista_Paciente_Cita.ClientID %>");
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

    <script class="cssdeck" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>

    <div class="row" style="padding-left:20px">
        <!-- column -->
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">Propuestas</h4>
                   
                </div>
           <asp:Label ID="txtCodCitaPropuesta" runat="server" Text="" Visible="false"></asp:Label>
                 <asp:Label ID="txtDoctor" runat="server" Text="" Visible="false"></asp:Label>
                    <asp:Label ID="txtEstadoCita" runat="server" Text="" Visible="false"></asp:Label>
                <asp:GridView ID="gv_Tabla_Lista_Paciente_Cita" runat="server" OnRowCommand="gv_Tabla_Lista_Paciente_Cita_RowCommand" OnPageIndexChanging="gv_Tabla_Lista_Paciente_Cita_PageIndexChanging" EmptyDataText="No hay Solicitudes aceptadas" CssClass="table-responsive-sm table-hover" Width="100%" AutoGenerateColumns="False" GridLines="None" OnDataBound="gv_Tabla_Lista_Paciente_Cita_DataBound" OnRowDataBound="gv_Tabla_Lista_Paciente_Cita_RowDataBound">
                    <Columns>
                        <asp:BoundField DataField="PK_IC_Cod" HeaderText="#" />
                        <asp:BoundField DataField="VP_Nombre_Completo" HeaderText="Nombres" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                            <HeaderStyle CssClass="text-center"></HeaderStyle>

                            <ItemStyle CssClass="text-center"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="Apellidos" HeaderText="Apellidos" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                            <HeaderStyle CssClass="text-center"></HeaderStyle>

                            <ItemStyle CssClass="text-center"></ItemStyle>
                        </asp:BoundField>

                         <asp:BoundField DataField="IP_Dni" HeaderText="Dni" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                            <HeaderStyle CssClass="text-center"></HeaderStyle>

                            <ItemStyle CssClass="text-center"></ItemStyle>
                        </asp:BoundField>

                          <asp:BoundField DataField="DC_Fecha_Cita" HeaderText="Fecha Cita" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" DataFormatString="{0:d}">
                            <HeaderStyle CssClass="text-center"></HeaderStyle>

                            <ItemStyle CssClass="text-center"></ItemStyle>
                        </asp:BoundField>


                        <asp:BoundField DataField="Hora" HeaderText="Hora" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                            <HeaderStyle CssClass="text-center"></HeaderStyle>

                            <ItemStyle CssClass="text-center"></ItemStyle>
                        </asp:BoundField>
                         <asp:BoundField DataField="Doctor" HeaderText="Doctor" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                            <HeaderStyle CssClass="text-center"></HeaderStyle>

                            <ItemStyle CssClass="text-center"></ItemStyle>
                        </asp:BoundField>
          

                        <asp:TemplateField HeaderText="Acción" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                            <ItemTemplate>
                               
                                 <asp:LinkButton ID="btnRegistrarPropuesta" Height="38px" CssClass="btn btn-primary" runat="server" CommandName="RegistrarPropuesta" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" Text="RegistrarPropuesta" Style="color: white">
                                         Gestionar Propuesta             
                                </asp:LinkButton>
                                                               
                                
                                 <asp:LinkButton ID="btnVerDetalle" Height="38px" CssClass="btn btn-success" runat="server" CommandName="Historia" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" Text="Historia" Style="color: white">
                                         Ver Detalles             
                                </asp:LinkButton>
                             
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>

                    <HeaderStyle BackColor="#008080" ForeColor="white" Font-Bold="true" />
                </asp:GridView>
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
            SetupFilter('txtFillter', 'gv_Tabla_Lista_Paciente_Cita', 'VP_Nombre_Completo');
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

