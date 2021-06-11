<%@ Page Title="" Language="C#" MasterPageFile="~/PagePrincipale.Master" AutoEventWireup="true" CodeBehind="PageConnection.aspx.cs" Inherits="Boutissante_Issam_TDI201_B_TR1__V2.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td>
                <label>Mail</label>
            </td>
            <td>
                <asp:TextBox CssClass="text" ID="Mail" runat="server"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="Mail" ErrorMessage="Email not Valid" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>
                 <label>Mot Pass</label>
            </td>
            <td>
                <asp:TextBox CssClass="text" TextMode="Password" type="password" ID="MotPass" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="MotPass" Text="*" ForeColor="Red" ErrorMessage="*"/>
            </td>
        </tr>
        <tr>
            <td>
                 <asp:Button CssClass="btn"  ID="Connection" runat="server" Text="Connection" OnClick="Connection_Click" />
            </td>
            <td>
                 <asp:Label ID="Message" runat="server" ForeColor="Red" />
            </td>
        </tr>
    </table>
</asp:Content>
