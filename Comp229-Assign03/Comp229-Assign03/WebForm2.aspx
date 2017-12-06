<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="Comp229_Assign03.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

            <h3>Delete</h3>
         <div class="Default_List">
         <asp:Image ID="Image1" runat="server" ImageUrl="~/img/delete.png" />
            Do you want to delete <asp:Label ID="lblNum" runat="server" Text="Label"></asp:Label>?
            <asp:Button ID="btnDelete" runat="server" Text="Delete" 
                OnClientClick="return confirm('Are you sure to delete this information?');"
                OnClick="btnDelete_Click"/>
            <asp:HyperLink ID="lnkList" runat="server"
                NavigateUrl="~/Default.aspx">List</asp:HyperLink>
     </div>

</asp:Content>
