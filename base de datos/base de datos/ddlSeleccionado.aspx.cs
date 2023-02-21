using dominio;
using negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace base_de_datos
{
    public partial class ddlSeleccionado : System.Web.UI.Page
    {
        public String Urlimagen { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            ElementoNegocio tipo = new ElementoNegocio();
            try
            {
                if (!IsPostBack)
                {
                    List < Elemento > elementos = tipo.listar();
                    ddlpokemonseleccionado.DataSource = elementos;
                    ddlpokemonseleccionado.DataTextField = "descripcion";
                    ddlpokemonseleccionado.DataValueField = "Id";
                    ddlpokemonseleccionado.DataBind();  
                }

            }
            catch (Exception ex)
            {
                throw ex;
                
            }
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            string id = txtId.Text;
             //opcion 1
            ddlpokemonseleccionado.SelectedIndex = ddlpokemonseleccionado.Items.IndexOf(
                ddlpokemonseleccionado.Items.FindByValue(id));

            //opcion2
            ddlpokemonseleccionado.SelectedIndex = -1;
            ddlpokemonseleccionado.Items.FindByValue(id).Selected = true;


        }

        protected void btnaceptar_Click1(object sender, EventArgs e)
        {
            Urlimagen = txturl.Text;
        }
    }
}