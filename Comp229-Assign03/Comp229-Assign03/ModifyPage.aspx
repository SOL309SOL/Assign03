<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ModifyPage.aspx.cs" Inherits="Comp229_Assign03.ModifyPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <h3>Modify</h3>
        <img src="img/modify.png" />
        <div class="Default_List">
           
            <b>Student Number:</b><br />
            <asp:Label ID="lblId" runat="server" Text="Label"></asp:Label><br /><br />
            <b>First Name:</b>
            <asp:TextBox CssClass="form-control" ID="txtFName" runat="server"></asp:TextBox><br />
            <b>Last Name:</b>
            <asp:TextBox CssClass="form-control" ID="txtLName" runat="server"></asp:TextBox><br />
           <!-- Enrollment Date:
            <asp:TextBox ID="txtDate" runat="server"></asp:TextBox>--><br />
            <asp:Button ID="btnModify" class="btn dropdown-toggle" runat="server" Text="Modify" 
                Onclick="btnModify_Click"/>
            <asp:Button ID="btnList" class="btn dropdown-toggle" runat="server" Text="List" 
                Onclick="btnList_Click"/>

        </div>

</asp:Content>
