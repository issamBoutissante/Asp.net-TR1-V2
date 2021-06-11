<%@ Page Title="" Language="C#" MasterPageFile="~/PagePrincipale.Master" AutoEventWireup="true" CodeBehind="ListeStages.aspx.cs" Inherits="Boutissante_Issam_TDI201_B_TR1__V2.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        section{
            margin-left:20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
   <section>
        <asp:label ID="VolontaireInfo" runat="server"/>
    <br />
    <br />
    <label>Inscription a un stage</label>
    <br />
    <br />
    <label>Association</label>
    <asp:DropDownList CssClass="text" ID="Assocations" runat="server" DataSourceID="SqlDataSource1" DataTextField="Nam_Ass" DataValueField="Id_Ass" OnSelectedIndexChanged="Assocations_SelectedIndexChanged" AutoPostBack="True" />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MonConnection %>" SelectCommand="SELECT [Nam_Ass], [Id_Ass] FROM [Association]"></asp:SqlDataSource>
    <br />
    <br />
    <asp:label ID="NomAssociation" runat="server">List de stages relatifs a l'association : </asp:label>
    <br />
    <br />
    <asp:GridView ID="StagesGridView" runat="server" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True">
        <Columns>
            <asp:BoundField DataField="Id_Stage" HeaderText="Id_Stage"/>
            <asp:BoundField DataField="Date_Debut" HeaderText="Date_Debut"/>
            <asp:BoundField DataField="Date_Fin" HeaderText="Date_Fin"/>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="Selectionner" Text="Selectionner" CommandArgument='<%#Eval("id_Stage")%>' OnClick="Selectionner_Click"/>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <br />
    <br />
    <asp:UpdatePanel runat="server">
       <ContentTemplate>
            <div>
            <Label>Id_Stage : </Label>
            <asp:Label ID="Id_Stage" runat="server" />
            <br />
            <br />
            <Label>Date_Debut : </Label>
            <asp:Label ID="Date_Debut" runat="server" />
               <br />
            <br />
            <Label>Date_Fin : </Label>
            <asp:Label ID="Date_Fin" runat="server" />
            <br />
            <br />
        </div>
       </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="StagesGridView" EventName="SelectedIndexChanged" />
        </Triggers>
    </asp:UpdatePanel>
            <asp:Button CssClass="btn" Text="S'inscrire" runat="server" OnClick="Sinscrire_Click" ID="Sinscrire" />
    <asp:Label runat="server" ID="Message" ForeColor="Green" />
   </section>

</asp:Content>
