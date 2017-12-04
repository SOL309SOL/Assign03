<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="Comp229_Assign03.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div>
            <h3>Delete</h3>
            Do you want to delete <asp:Label ID="lblNum" runat="server" Text="Label"></asp:Label>?
            <asp:Button ID="btnDelete" runat="server" Text="Delete" 
                OnClientClick="return confirm('Are you sure to delete this information?');"
                OnClick="btnDelete_Click"/>
            <asp:HyperLink ID="lnkList" runat="server"
                NavigateUrl="~/FrmMemoList.aspx">List</asp:HyperLink>
     </div>

</asp:Content>
