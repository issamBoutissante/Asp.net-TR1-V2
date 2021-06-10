<%@ Page Title="" Language="C#" MasterPageFile="~/PagePrincipale.Master" AutoEventWireup="true" CodeBehind="PageConnection.aspx.cs" Inherits="Boutissante_Issam_TDI201_B_TR1__V2.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <label>Mail</label>
            <asp:TextBox ID="Mail" runat="server"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="Mail" ErrorMessage="Email not Valid" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
            <br />
            <label>Mot Pass</label>
            <asp:TextBox TextMode="Password" type="password" ID="MotPass" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="MotPass" Text="*" ForeColor="Red" ErrorMessage="*"/>
            <br />
            <asp:Button ID="Connection" runat="server" Text="Connection" OnClick="Connection_Click" />
            <asp:Label ID="Message" runat="server" ForeColor="Red" />
</asp:Content>
