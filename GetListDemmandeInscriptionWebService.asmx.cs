using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace Boutissante_Issam_TDI201_B_TR1__V2
{
    /// <summary>
    /// Summary description for GetListDemmandeInscriptionWebService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class GetListDemmandeInscriptionWebService : System.Web.Services.WebService
    {

        [WebMethod]
        public DataTable GetListDemmandeInscription(int Id_Vlt)
        {
            DataTable table = new DataTable();
            Database.Execute(Connection =>
            {
                new SqlDataAdapter()
                {
                    SelectCommand = new SqlCommand("select * from Demande_Inscription where id_Vlt=@idVlt", Connection)
                    {
                        Parameters =
                        {
                            new SqlParameter("@idVlt",Id_Vlt)
                        }
                    }
                }.Fill(table);
            });
            return table;
        }
    }
}
