using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace base_de_datos
{
    public partial class updatePanel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void txtnombre_TextChanged(object sender, EventArgs e)
        {
            lblnombre.Text = txtnombre.Text;
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            txtnombre.Text = "cambio el texto";
        }
    }
}