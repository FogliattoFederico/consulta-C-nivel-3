<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FormularioPokemon.aspx.cs" Inherits="base_de_datos.FormularioPokemon" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">

        <div class="row">
            <div class="col-6">
                <div class="mb-3">
                    <label for="Id" class="form-label">ID</label>
                    <asp:TextBox runat="server" ID="txtid" CssClass="form-control" />
                </div>
                <div class="mb-3">
                    <label for="txtNombre" class="form-label">Nombre</label>
                    <asp:TextBox runat="server" ID="txtNombre" CssClass="form-control" />
                </div>
                <div class="mb-3">
                    <label for="txtNumero" class="form-label">Numero</label>
                    <asp:TextBox runat="server" ID="txtNumero" CssClass="form-control" />
                </div>
                <div class="mb-3">
                    <label for="txtDescripcion" class="form-label">Descripcion</label>
                    <asp:TextBox runat="server" ID="txtdescripcion" TextMode="MultiLine" CssClass="form-control" />
                </div>
                <div class="mb-3">
                    <label for="ddltipo" class="form-label">Tipo</label>
                    <asp:DropDownList runat="server" CssClass="form-control" ID="ddlTipo"></asp:DropDownList>
                </div>
                <div class="mb-3">
                    <label for="ddlDebilidad" class="form-label">Debilidad</label>
                    <asp:DropDownList runat="server" CssClass="form-control" ID="ddlDebilidad"></asp:DropDownList>
                </div>
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <div class="mb-3">
                            <label for="lblimagen" class="form-label">Imagen</label>
                            <asp:TextBox runat="server" ID="txtimagen" AutoPostBack="true" CssClass="form-control" OnTextChanged="txtimagen_TextChanged" />
                            <asp:Image ImageUrl="https://editorial.unc.edu.ar/wp-content/uploads/sites/33/2022/09/placeholder.png" ID="ImagenPoke" runat="server" Width="30%" />
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <div class="mb-3">
                    <asp:Button Text="Aceptar" runat="server" ID="BtnAceptar" CssClass="btn btn-primary" OnClick="BtnAceptar_Click" />
                    <a href="About.aspx">Cancelar</a>
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <div>
                                <asp:Button Text="Eliminar" runat="server" ID="BtnEliminar" CssClass="btn btn-warning" OnClick="btnEliminar_Click" />
                            </div>
                            <div>
                                <%if (ConfirmarcionEliminacion)
                                    {%>
                                <asp:CheckBox Text="ConfirmarEliminacion" ID="chkconfirmarEliminacion" runat="server" />
                                <asp:Button Text="Eliminar" runat="server" ID="btnConfirEliminar" CssClass="btn btn-danger" OnClick="btnConfirEliminar_Click" />
                                <%} %>
                            </div>
                            <div>
                                <asp:Button Text="Desactivar" runat="server" ID="btnDesactivar" CssClass="btn btn-danger" OnClick="btnDesactivar_Click" />

                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>



</asp:Content>

