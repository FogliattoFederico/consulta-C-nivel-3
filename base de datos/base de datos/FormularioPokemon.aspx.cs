using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using negocio;
using dominio;


namespace base_de_datos
{
    public partial class FormularioPokemon : System.Web.UI.Page
    {
        public bool ConfirmarcionEliminacion { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            txtid.Enabled = false;
            ConfirmarcionEliminacion = false;
           


            try
            {
                //si  estamos dando un alta
                if (!IsPostBack)
                {
                    
                    ElementoNegocio negocio = new ElementoNegocio();
                    List<Elemento> lista = negocio.listar();

                    ddlTipo.DataSource = lista;
                    ddlTipo.DataValueField = "ID";
                    ddlTipo.DataTextField = "Descripcion";
                    ddlTipo.DataBind();

                    ddlDebilidad.DataSource = lista;
                    ddlDebilidad.DataValueField = "ID";
                    ddlDebilidad.DataTextField = "Descripcion";
                    ddlDebilidad.DataBind();
                }
            }
            catch (Exception ex)
            {

                Session.Add("error", ex);
                throw;
            }
            //si estamos modificando
            string id = Request.QueryString["id"] != null ? Request.QueryString["id"].ToString() : "";
            if (id != "" && !IsPostBack)
            {
                PokemonNegocio negocio = new PokemonNegocio();
                //List<Pokemon> lista = negocio.listar(id);
                //Pokemon seleccionado = lista[0];
                Pokemon seleccionado = (negocio.listar(id))[0];

                //guardo objeto en session
                Session.Add("pokeSeleccionado", seleccionado);

                //haremos la precarga
                txtid.Text = id;
                txtNombre.Text = seleccionado.Nombre.ToString();
                txtNumero.Text = seleccionado.Numero.ToString();
                txtdescripcion.Text = seleccionado.Descripcion;
                txtimagen.Text = seleccionado.UrlImagen;

                ddlTipo.SelectedValue = seleccionado.Tipo.Id.ToString();
                ddlDebilidad.SelectedValue = seleccionado.Debilidad.Id.ToString();
                txtimagen_TextChanged(sender, e);

                //configurar acciones
                if (!seleccionado.Activo)
                {
                    btnDesactivar.Text = "Reactivar";
                }


            }
        }

        protected void txtimagen_TextChanged(object sender, EventArgs e)
        {
            ImagenPoke.ImageUrl = txtimagen.Text;
        }

        protected void BtnAceptar_Click(object sender, EventArgs e)
        {
            try
            {
                Pokemon nuevo = new Pokemon();
                PokemonNegocio negocio = new PokemonNegocio();

                nuevo.Nombre = txtNombre.Text;
                nuevo.Numero = int.Parse(txtNumero.Text);
                nuevo.Descripcion = txtdescripcion.Text;
                nuevo.UrlImagen = txtimagen.Text;

                nuevo.Tipo = new Elemento();
                nuevo.Tipo.Id = int.Parse(ddlTipo.SelectedValue);
                nuevo.Debilidad = new Elemento();
                nuevo.Debilidad.Id = int.Parse(ddlDebilidad.SelectedValue);

                if (Request.QueryString["id"] != null)
                {
                    nuevo.Id = int.Parse(Request.QueryString["id"].ToString());
                    negocio.modificarConSp(nuevo);

                }
                else
                    negocio.agregarConSp(nuevo);

                Response.Redirect("About.aspx", false);


            }

            catch (Exception ex)
            {

                Session.Add("error", ex);
                throw;
            }

        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            ConfirmarcionEliminacion = true;
        }

        protected void btnConfirEliminar_Click(object sender, EventArgs e)
        {

            try
            {
                if (chkconfirmarEliminacion.Checked)
                {
                    PokemonNegocio negocio = new PokemonNegocio();
                    negocio.eliminar(int.Parse(txtid.Text));
                    Response.Redirect("about.aspx");
                }

            }
            catch (Exception ex)
            {

                Session.Add("error", ex);
            }
        }

        protected void btnDesactivar_Click(object sender, EventArgs e)
        {
            try
            {
                PokemonNegocio negocio = new PokemonNegocio();
                Pokemon Seleccionado = (Pokemon)Session["pokeSeleccionado"];

                negocio.eliminarLogico(Seleccionado.Id, !Seleccionado.Activo);
                Response.Redirect("about.aspx");
            }
            catch (Exception ex)
            {

                Session.Add("error", ex);
            }
        }
    }
}