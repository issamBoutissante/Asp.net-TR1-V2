<%@ Page Title="" Language="C#" MasterPageFile="~/PagePrincipale.Master" AutoEventWireup="true" CodeBehind="PageInscription.aspx.cs" Inherits="Boutissante_Issam_TDI201_B_TR1__V2.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div>
            <label>Id Volontaire</label>
            <asp:TextBox ID="Id_Volontaire" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="Id_Volontaire" Text="*" ForeColor="Red" ErrorMessage="*"/>
            <asp:CustomValidator ID="isIdVolontaireDejaExistValidator" runat="server" ControlToValidate="Id_Volontaire" ErrorMessage="Cet Id Deja Exist" ForeColor="Red" OnServerValidate="isIdVolontaireDejaExistValidator_ServerValidate" Display="Dynamic"></asp:CustomValidator>
            <br />
            <label>Nom Volontaire</label>
            <asp:TextBox ID="Nom_Volontaire" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="Nom_Volontaire" Text="*" ForeColor="Red" ErrorMessage="*"/>
            <br />
            <label>Prenom Volontaire</label>
            <asp:TextBox ID="Prenom_Volontaire" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="Prenom_Volontaire" Text="*" ForeColor="Red" ErrorMessage="*"/>
            <br />
            <label>Mail</label>
            <asp:TextBox ID="Mail" runat="server"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="Mail" ErrorMessage="Email not Valid" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
            <br />
             <label>Ville</label>
            <asp:DropDownList ID="Villes" runat="server" DataSourceID="VilleDataSource" DataTextField="Nom_Ville" DataValueField="Id_ville"></asp:DropDownList>
            <asp:SqlDataSource ID="VilleDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:MonConnection %>" SelectCommand="SELECT [Id_ville], [Nom_Ville] FROM [Ville]"></asp:SqlDataSource>
            <br />
            <label>Mot Pass</label>
            <asp:TextBox ID="MotPass" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="MotPass" Text="*" ForeColor="Red" ErrorMessage="*"/>
            <br />
            <label>Confirm Mot Pass</label>
            <asp:TextBox ID="ConfirmMotPass" runat="server"></asp:TextBox>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="MotPass" ControlToValidate="ConfirmMotPass" ErrorMessage="Mot Pass N'est pas Semblable" ForeColor="Red">*</asp:CompareValidator>
            <br />
            <asp:Button ID="Ajouter" runat="server" Text="Ajouter" OnClick="Ajouter_Click" />
            <asp:Label ID="Message" runat="server" ForeColor="Blue" />
        </div>
</asp:Content>
