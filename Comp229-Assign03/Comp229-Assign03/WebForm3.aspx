<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebForm3.aspx.cs" Inherits="Comp229_Assign03.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <h3>Modify</h3>
        <img src="img/modify.png" />
        <div class="Default_List">
           
            Student Number:
            <asp:Label ID="lblId" runat="server" Text="Label"></asp:Label><br />
            First Name:
            <asp:TextBox ID="txtFName" runat="server"></asp:TextBox>
            Last Name:
            <asp:TextBox ID="txtLName" runat="server"></asp:TextBox>
           <!-- Enrollment Date:
            <asp:TextBox ID="txtDate" runat="server"></asp:TextBox>--><br />
            <asp:Button ID="btnModify" runat="server" Text="Modify" 
                Onclick="btnModify_Click"/>
            <asp:Button ID="btnList" runat="server" Text="List" 
                Onclick="btnList_Click"/>

        </div>

</asp:Content>
