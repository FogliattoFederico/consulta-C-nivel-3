using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;
using negocio;

namespace base_de_datos
{
    public partial class About : Page
    {
        public bool FiltroAvanzado { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            FiltroAvanzado = chkAvanzado.Checked;
            if (!IsPostBack)
            {
                PokemonNegocio negocio = new PokemonNegocio();
                Session.Add("ListaPokemons", negocio.listarConSP());
                dgvpokemon.DataSource = Session["ListaPokemons"];
                DataBind();

            }
        }

        protected void dgvpokemon_SelectedIndexChanged(object sender, EventArgs e)
        {
            var id = dgvpokemon.SelectedDataKey.Value.ToString();
            Response.Redirect("FormularioPokemon.aspx? id=" + id);
        }

        protected void dgvpokemon_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dgvpokemon.PageIndex = e.NewPageIndex;
            dgvpokemon.DataBind();
        }

        protected void TxtFiltro_TextChanged(object sender, EventArgs e)
        {
            List<Pokemon> lista = (List<Pokemon>)Session["ListaPokemons"];
            List<Pokemon> listaFiltrada = lista.FindAll(x => x.Nombre.ToUpper().Contains(TxtFiltro.Text.ToUpper()));
            dgvpokemon.DataSource = listaFiltrada;
            dgvpokemon.DataBind();
        }

        protected void chkFiltroAvanzado_CheckedChanged(object sender, EventArgs e)
        {
            FiltroAvanzado = chkAvanzado.Checked;
            TxtFiltro.Enabled = !FiltroAvanzado;
        }



        protected void ddlCampo_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlCriterio.Items.Clear();
            if (ddlCampo.SelectedItem.ToString() == "Numero")
            {
                ddlCriterio.Items.Add("Mayor a ");
                ddlCriterio.Items.Add("Menor a");
                ddlCriterio.Items.Add("Igual a ");
            }
            else
            {
                ddlCriterio.Items.Add("Comienza con ");
                ddlCriterio.Items.Add("Termina con ");
                ddlCriterio.Items.Add("Contiene ");
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            try
            {
                PokemonNegocio negocio = new PokemonNegocio();
                dgvpokemon.DataSource = negocio.filtrar(ddlCampo.SelectedItem.ToString(),
                    ddlCriterio.SelectedItem.ToString(), txtFiltroAvanzado.Text,
                    ddlEstado.SelectedItem.ToString());
                dgvpokemon.DataBind();


            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
                throw;
            }
        }
    }
}