<%@ Page Title="" Language="C#" MasterPageFile="~/PagePrincipale.Master" AutoEventWireup="true" CodeBehind="PageInscription.aspx.cs" Inherits="Boutissante_Issam_TDI201_B_TR1__V2.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td>
                <label>Id Volontaire</label>
            </td>
            <td>
                <asp:TextBox CssClass="text" ID="Id_Volontaire" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Id_Volontaire" Text="*" ForeColor="Red" ErrorMessage="*"/>
                <asp:CustomValidator ID="isIdVolontaireDejaExistValidator" runat="server" ControlToValidate="Id_Volontaire" ErrorMessage="Cet Id Deja Exist" ForeColor="Red" OnServerValidate="isIdVolontaireDejaExistValidator_ServerValidate" Display="Dynamic"></asp:CustomValidator>
            </td>
        </tr>
          <tr>
            <td>
                <label>Nom Volontaire</label>
            </td>
            <td>
                <asp:TextBox CssClass="text" ID="Nom_Volontaire" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Nom_Volontaire" Text="*" ForeColor="Red" ErrorMessage="*"/>
            </td>
        </tr>
        <tr>
            <td>
                <label>Prenom Volontaire</label>
            </td>
            <td>
                <asp:TextBox CssClass="text" ID="Prenom_Volontaire" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Prenom_Volontaire" Text="*" ForeColor="Red" ErrorMessage="*"/>
            </td>
        </tr>
        <tr>
            <td>
                 <label>Mail</label>
            </td>
            <td>
                 <asp:TextBox CssClass="text" ID="Mail" runat="server"></asp:TextBox>
                 <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="Mail" ErrorMessage="Email not Valid" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>
                <label>Ville</label>
            </td>
            <td>
                <asp:DropDownList CssClass="text" ID="Villes" runat="server" DataSourceID="VilleDataSource" DataTextField="Nom_Ville" DataValueField="Id_ville"></asp:DropDownList>
                <asp:SqlDataSource ID="VilleDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:MonConnection %>" SelectCommand="SELECT [Id_ville], [Nom_Ville] FROM [Ville]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <label>Mot Pass</label>
            </td>
            <td>
                <asp:TextBox CssClass="text" ID="MotPass" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="MotPass" Text="*" ForeColor="Red" ErrorMessage="*"/>
            </td>
        </tr>
        <tr>
            <td>
                <label>Confirm Mot Pass</label>
            </td>
            <td>
                <asp:TextBox CssClass="text" ID="ConfirmMotPass" runat="server"></asp:TextBox>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="MotPass" ControlToValidate="ConfirmMotPass" ErrorMessage="Mot Pass N'est pas Semblable" ForeColor="Red">*</asp:CompareValidator>
          
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="Ajouter" CssClass="btn"  runat="server" Text="Ajouter" OnClick="Ajouter_Click" />
            </td>
            <td>
                 <asp:Label ID="Message" runat="server" ForeColor="Blue" />
            </td>
        </tr>
    </table>
</asp:Content>
