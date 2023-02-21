<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ejemploDDL.aspx.cs" Inherits="base_de_datos.ejemploDDL" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">



    <div class="row">
        <div class="col">
            <asp:Label Text="Tipo" ID="lbtipo" runat="server" />
            <asp:DropDownList runat="server" CssClass="form-control" ID="ddltipo" AutoPostBack="true" OnSelectedIndexChanged="ddltipo_SelectedIndexChanged">
            
            </asp:DropDownList> 
            <asp:Label Text="pokemon" ID="PokeFiltrado" runat="server" />
            <asp:DropDownList runat="server" ID="ddlpokemon" CssClass="form-control">
               
            </asp:DropDownList>   
           
        </div>
    </div>

</asp:Content>
