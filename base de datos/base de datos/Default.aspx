<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="base_de_datos._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">


    <%-- <%
       foreach (dominio.Pokemon Poke in ListaPokemons)
        { %>

            <div class="row row-cols-1 row-cols-md-3 g-4">
                <div class="col">
                    <div class="card">
                        <img src="<%:Poke.UrlImagen %>" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title"><%:Poke.Nombre %></h5>
                            <p class="card-text"><%:Poke.Descripcion %></p>
                            <a href="DetallePokemon.aspx? id=<%:Poke.Id %>">Detalle</a>
                        </div>
                    </div>
                </div>
            </div>

    <% }%>--%>

    <asp:Repeater ID="Repetidor" runat="server">
        <ItemTemplate>
            <h1>
                <div class="row row-cols-1 row-cols-md-3 g-4">
                    <div class="col">
                        <div class="card">
                            <img src="<%# Eval ("urlImagen")%>" class="card-img-top" alt="...">
                            <div class="card-body">
                                <h5 class="card-title"><%# Eval ("Nombre")%></h5>
                                <p class="card-text"><%# Eval ("Descripcion") %></p>
                                <a href="DetallePokemon.aspx? id=<%# Eval ("Id") %>">Detalle</a>
                                <asp:Button Text="Ejemplo" ID="btnEjemplo" CssClass="btn btn-primary" runat="server" CommandArgument='<%#Eval("Id") %>' CommandName="pokemonId" OnClick="btnEjemplo_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </h1>
        </ItemTemplate>
    </asp:Repeater>

</asp:Content>
