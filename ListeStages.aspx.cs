using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace Boutissante_Issam_TDI201_B_TR1__V2
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["isAuthentifie"] == null)
            //{
            //    Response.Redirect("~/PageConnection.aspx");
            //}
            if (!IsPostBack)
            {
                Volontaire v = Session["infoVolontaire"] as Volontaire;
                VolontaireInfo.Text = "Connection Id : " + v.id + " " + v.nom + " " + v.prenom;
            }
        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {

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
                //VolontaireInfo.Text = dataSet.Tables["stages"].Rows.Count.ToString();
            });
        }
        protected void Assocations_SelectedIndexChanged(object sender, EventArgs e)
        {
            Update_Grid();
            NomAssociation.Text = "Liste des stages relatifs a l'association : " + Assocations.SelectedValue.ToString(); 
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
            Database.Execute(Connection =>
            {
                new SqlCommand("insert into Demande_Inscription values(@dateDemande,@idVlt,#IdStage,'En attente')", Connection)
                {
                    Parameters =
                    {
                        new SqlParameter()
                    }
                }
            });
        }
    }
}