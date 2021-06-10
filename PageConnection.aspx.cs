using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Boutissante_Issam_TDI201_B_TR1__V2
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["nombreEssaie"] = 0;
            }
        }

        protected void Connection_Click(object sender, EventArgs e)
        {
            Database.Execute(Connection =>
            {
                bool? nombre = new SqlCommand("select actif from Volontaire where Mail=@mail and Mot_Passe=@motPass;", Connection)
                {
                    Parameters =
                    {
                        new SqlParameter("@mail",Mail.Text),
                        new SqlParameter("@motPass",MotPass.Text)
                    }
                }.ExecuteScalar() as bool?;
                if (nombre == true)
                {
                    Session["nombreEssaie"] = 0;
                    Session["isAuthentifie"] = true;
                    SqlDataReader reader = new SqlCommand("select actif from Volontaire where Mail=@mail and Mot_Passe=@motPass;", Connection)
                    {
                        Parameters =
                        {
                            new SqlParameter("@mail",Mail.Text),
                            new SqlParameter("@motPass",MotPass.Text)
                        }
                    }.ExecuteReader();

                    reader.Read();
                    Session["infoVolontaire"] = new Volontaire()
                    {
                        id = reader["id_Vlt"].ToString(),
                        nom=reader["nom_Vlt"].ToString(),
                        prenom=reader["prenom_Vlt"].ToString()
                    };
                    Response.Redirect("~/ListeStages.aspx");
                    reader.Close();
                }
                else if (nombre == false)
                {
                    Message.Text = "votre counte n'est pas actif";
                }
                else
                {
                    Session["nombreEssaie"] = Convert.ToInt32(Session["nombreEssaie"]) + 1;
                    if (Convert.ToInt32(Session["nombreEssaie"]) >= 3)
                    {
                            new SqlCommand("update Volontaire set actif=0 where Mail=@mail", Connection)
                            {
                                Parameters =
                                {
                                    new SqlParameter("@mail",Mail.Text)
                                }
                            }.ExecuteNonQuery();
                        Message.Text = "vous avez essayez plus que trois foit votre compte n'est pas actif";
                    }
                    else
                    {
                        Message.Text = "invalid mail ou mot de passe " + (3 - Convert.ToInt32(Session["nombreEssaie"])) + " essai.";
                    }
                }
            }, null, Error =>
            {
                Message.Text = Error;
            });
        }
    }
}