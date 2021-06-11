<%@ Page Title="" Language="C#" MasterPageFile="~/PagePrincipale.Master" AutoEventWireup="true" CodeBehind="ConsomerWebService.aspx.cs" Inherits="Boutissante_Issam_TDI201_B_TR1__V2.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        section{
            margin-left:20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <section>
        <div>
            <label>Id Volontaire</label>
            <asp:TextBox CssClass="text" ID="Id_Volontaire" runat="server" />
            <asp:Button CssClass="btn" ID="Afficher" Text="Afficher Liste de Demande Inscription" runat="server" OnClick="Afficher_Click" />
        </div>
        <asp:GridView ID="DemandeInscriptionGridView" runat="server" ShowHeaderWhenEmpty="True">
        </asp:GridView>
        <br />
        <asp:Label ID="Message" ForeColor="Red" runat="server" />
      </section>
</asp:Content>
