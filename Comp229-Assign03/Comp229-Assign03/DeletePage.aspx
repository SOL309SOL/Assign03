<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DeletePage.aspx.cs" Inherits="Comp229_Assign03.DeletePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <%--To delete Selected Student Data--%>
    <h2>Delete</h2>
    <asp:Image ID="Image1" runat="server" ImageUrl="~/img/delete2.png" />
    <div class="Default_List">
        Do you want to delete following Student Number?:
        <br />
        <b>
            <asp:Label ID="lblNum" runat="server" Text="Label"></asp:Label></b><br />
        <br />
        <asp:Button ID="btnDelete" class="btn dropdown-toggle" runat="server" Text="Delete"
            OnClientClick="return confirm('Are you sure to delete this information?');"
            OnClick="btnDelete_Click" />
        <asp:Button ID="btnList" class="btn dropdown-toggle" runat="server" Text="List"
            OnClick="btnList_Click" />
    </div>

</asp:Content>
