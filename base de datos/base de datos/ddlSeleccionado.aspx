<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ddlSeleccionado.aspx.cs" Inherits="base_de_datos.ddlSeleccionado" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <asp:Label Text="text" runat="server" id="lblnombre"/>
    <asp:TextBox runat="server" Id="txtId"/>
    <asp:Button Text="Aceptar" ID="btnAceptar" CssClass="btn btn-primary" runat="server" onclick="btnAceptar_Click"/>
    <asp:DropDownList runat="server" ID="ddlpokemonseleccionado" CssClass="btn btn-block"></asp:DropDownList>

    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <asp:TextBox runat="server" ID="txturl" cssclass="form-control"/>
            <asp:Button Text="Cargar" ID="btnCargar" OnClick="btnaceptar_Click1" runat="server" cssclass="btn btn-primary"/>
            <img src="<% = Urlimagen %>"  width="50%" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
