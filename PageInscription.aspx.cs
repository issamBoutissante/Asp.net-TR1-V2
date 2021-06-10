using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Boutissante_Issam_TDI201_B_TR1__V2
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Ajouter_Click(object sender, EventArgs e)
        {
            Database.Execute(Connection =>
            {
                new SqlCommand("insert into Volontaire values(@id,@nom,@prenom,@mail,@motPass,@ville,@actif)", Connection)
                {
                    Parameters =
                    {
                        new SqlParameter("@id",Id_Volontaire.Text),
                        new SqlParameter("@nom",Nom_Volontaire.Text),
                        new SqlParameter("@prenom",Prenom_Volontaire.Text),
                        new SqlParameter("@mail",Mail.Text),
                        new SqlParameter("@MotPass",MotPass.Text),
                        new SqlParameter("@ville",Villes.SelectedValue.ToString()),
                        new SqlParameter("@actif",1)
                    }
                }.ExecuteNonQuery();
            }, () =>
            {
                Message.ForeColor = Color.Green;
                Message.Text = "L'ajout a ete effectue";
            }, Error =>
            {
                Message.ForeColor = Color.Red;
                Message.Text = "Error d'ajout";
            });
        }

        protected void isIdVolontaireDejaExistValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            Database.Execute(Connection =>
            {
                int nombre = (int)new SqlCommand("select Count(*) from Volontaire where id_Vlt=@id", Connection)
                {
                    Parameters =
                    {
                        new SqlParameter("@id",Id_Volontaire.Text),
                    }
                }.ExecuteScalar();
                if (nombre == 1)
                    args.IsValid = false;
            });
        }
    }
}