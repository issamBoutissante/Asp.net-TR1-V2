using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Boutissante_Issam_TDI201_B_TR1__V2
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["isAuthentifie"] == null)
                {
                    Response.Redirect("~/PageConnection.aspx");
                }
            }
        }

        protected void Afficher_Click(object sender, EventArgs e)
        {
            GetListDemmandeInscriptionWebService webService = new GetListDemmandeInscriptionWebService();
            if (string.IsNullOrEmpty(Id_Volontaire.Text))
            {
                Message.Text = "Entrer un id";
                return;
            }
            DemandeInscriptionGridView.DataSource = webService.GetListDemmandeInscription(Convert.ToInt32(Id_Volontaire.Text));
            DemandeInscriptionGridView.DataBind();
        }
    }
}