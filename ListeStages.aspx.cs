using System;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Web.UI.WebControls;

namespace Boutissante_Issam_TDI201_B_TR1__V2
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["isAuthentifie"] == null)
                {
                    Response.Redirect("~/PageConnection.aspx");
                }
                Volontaire v = Session["infoVolontaire"] as Volontaire;
                VolontaireInfo.Text = "Connection Id : " + v.id + " " + v.nom + " " + v.prenom;

            }
        }
        protected void Update_Grid()
        {
            Database.Execute(Connection =>
            {

                DataTable table = new DataTable();
                new SqlDataAdapter()
                {
                    SelectCommand = new SqlCommand("select * from Stage where id_Ass=@idAss", Connection)
                    {
                        Parameters =
                        {
                            new SqlParameter("@idAss",Assocations.SelectedValue.ToString())
                        }
                    }
                }.Fill(table);
                StagesGridView.DataSource = table;
                StagesGridView.DataBind();
            });
        }
        protected void Assocations_SelectedIndexChanged(object sender, EventArgs e)
        {
            Update_Grid();
            NomAssociation.Text = "Liste des stages relatifs a l'association : " + Assocations.SelectedItem.ToString();
        }

        protected void Selectionner_Click(object sender, EventArgs e)
        {
            int idStage=Convert.ToInt32((sender as LinkButton).CommandArgument);
            Database.Execute(Connection =>
            {
                SqlDataReader reader = new SqlCommand("select * from Stage where id_stage=@id",Connection)
                {
                    Parameters =
                    {
                        new SqlParameter("@id",idStage)
                    }
                }.ExecuteReader();
                reader.Read();
                Id_Stage.Text = reader["Id_Stage"].ToString();
                Date_Debut.Text = reader["Date_Debut"].ToString();
                Date_Fin.Text = reader["Date_Fin"].ToString();
                reader.Close();
                
            });
        }

        protected void Sinscrire_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Id_Stage.Text))
            {
                Message.ForeColor = Color.Red;
                Message.Text = "Selection un stage";
                return;
            }
            Database.Execute(Connection =>
            {
                Volontaire volontaire = Session["infoVolontaire"] as Volontaire;
                new SqlCommand("insert into Demande_Inscription values(@dateDemande,@idVlt,@IdStage,'En attente')", Connection)
                {
                    Parameters =
                    {
                        new SqlParameter("@dateDemande",DateTime.Now.Date.ToShortDateString()),
                        new SqlParameter("@idVlt",volontaire.id),
                        new SqlParameter("@IdStage",Id_Stage.Text),
                    }
                }.ExecuteNonQuery();
            }, () =>
            {
                Message.ForeColor = Color.Green;
                Message.Text = "Inscription a ete effectue";
            }, Error =>
            {
                Message.ForeColor = Color.Red;
                Message.Text = Error;
            });
        }
    }
}