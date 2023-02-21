using negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;


namespace base_de_datos
{
    public partial class ejemploDDL : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        { 
            PokemonNegocio negocio = new PokemonNegocio();
            ElementoNegocio negocioTipo  = new ElementoNegocio();
            try
            {
                List<Pokemon> listaPokemon = negocio.listarConSP();
                Session["ListaPokemon"] = listaPokemon;
                ddlpokemon.DataSource = listaPokemon;
                ddlpokemon.DataBind();

                List<Elemento> listaTipo = negocioTipo.listar();
                ddltipo.DataSource = listaTipo;
                ddltipo.DataValueField = "Id";
                ddltipo.DataTextField = "Descripcion";
                ddltipo.DataBind();
            }
            catch (Exception ex)
            {

                Session.Add("error", ex);
            }
        
        }

        protected void ddltipo_SelectedIndexChanged(object sender, EventArgs e)
        {
            int id = int.Parse(ddltipo.SelectedItem.Value);
            ddlpokemon.DataSource = ((List<Pokemon>)Session["ListaPokemon"]).FindAll(x => x.Tipo.Id == id);
            ddlpokemon.DataBind();
        }
    }
}