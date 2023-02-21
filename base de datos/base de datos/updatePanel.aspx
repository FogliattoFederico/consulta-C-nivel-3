<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="updatePanel.aspx.cs" Inherits="base_de_datos.updatePanel" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   
   
  
        
    
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <asp:Label Text="text" ID="lblnombre" runat="server" />
            <asp:TextBox runat="server" ID="txtnombre" AutoPostBack="true" OnTextChanged="txtnombre_TextChanged" />
            <asp:Button Text="Aceptar" ID="btnAceptar" CssClass="btn btn-primary" runat="server" OnClick="btnAceptar_Click" />
        </ContentTemplate>
    </asp:UpdatePanel>
    
    

</asp:Content>


