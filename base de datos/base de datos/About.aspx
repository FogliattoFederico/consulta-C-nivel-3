<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="base_de_datos.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <div class="row">
                <div class="col-6">
                    <div class="mb-3">
                        <asp:Label Text="Filtrar" runat="server" />
                        <asp:TextBox ID="TxtFiltro" AutoPostBack="true" OnTextChanged="TxtFiltro_TextChanged" runat="server" />
                    </div>
                </div>
                <div class="col-6">
                    <div class="mb-3">
                        <asp:CheckBox Text="Filtro Avanzado" ID="chkAvanzado" AutoPostBack="true" 
                            OnCheckedChanged="chkFiltroAvanzado_CheckedChanged" runat="server" />
                    </div>
                </div>
            </div>

            <%if (FiltroAvanzado)
                {%>
            <div class="row">
                <div class="col-3">
                    <div class="mb-3">
                        <asp:Label Text="Campo"  runat="server" />
                        <asp:DropDownList CssClass="form-control" Id="ddlCampo" AutoPostBack="true" OnSelectedIndexChanged="ddlCampo_SelectedIndexChanged" runat="server">
                            <asp:ListItem Text="Nombre" />
                            <asp:ListItem Text="Tipo" />
                            <asp:ListItem Text="Numero" />
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="col-3">
                    <div class="mb-3">
                        <asp:Label Text="Criterio" runat="server" />
                        <asp:DropDownList ID="ddlCriterio" CssClass="form-control" runat="server"></asp:DropDownList>
                    </div>
                </div>
                <div class="col-3">
                    <div class="mb-3">
                        <asp:Label Text="Filtro" runat="server" />
                        <asp:TextBox ID="txtFiltroAvanzado" runat="server" CssClass="form-control" />
                    </div>
                </div>
                <div class="col-3">
                    <div class="mb-3">
                        <asp:Label Text="Estado" runat="server" />
                        <asp:DropDownList ID="ddlEstado" CssClass="form-control" runat="server">
                            <asp:ListItem Text="Activo" />
                            <asp:ListItem Text="Inactivo" />
                            <asp:ListItem Text="Todos" />
                        </asp:DropDownList>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-3">
                    <div class="mb-3">
                        <asp:Button Text="Buscar" ID="btnBuscar" OnClick="btnBuscar_Click" CssClass="btn btn-primary" runat="server" />
                    </div>
                </div>
            </div>
            <% } %>
        </ContentTemplate>
    </asp:UpdatePanel>
    <h3>Your application description page.</h3>
    <p>Use this area to provide additional information.</p>
    <asp:GridView ID="dgvpokemon" runat="server" CssClass="table" AutoGenerateColumns="false"
        DataKeyNames="Id" OnSelectedIndexChanged="dgvpokemon_SelectedIndexChanged"
        OnPageIndexChanging="dgvpokemon_PageIndexChanging" AllowPaging="true" PageSize="5">
        <Columns>
            <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
            <asp:BoundField HeaderText="Numero" DataField="Numero" />
            <asp:BoundField HeaderText="Tipo" DataField="Tipo.descripcion" />
            <asp:CheckBoxField HeaderText="Activo" DataField="Activo" />
            <asp:CommandField HeaderText="Accion" ShowSelectButton="true" SelectText="<>" />
        </Columns>
    </asp:GridView>
    <a href="FormularioPokemon.aspx" class="btn btn-primary">Agregar</a>
</asp:Content>





