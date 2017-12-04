<%@ Page Title="Student Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Comp229_Assign03.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
      <div>
    <h2><%: Title %>.</h2>

          StudentID:
          <asp:Label ID="lblId" runat="server" Text="StudentID"></asp:Label>
            First Name:
            <asp:Label ID="lblFname" runat="server" Text="First Name"></asp:Label>
            Last Name:
            <asp:Label ID="lblLname" runat="server" Text="Last Name"></asp:Label>
            Enrollment Date:
            <asp:Label ID="lblDate" runat="server" Text="Enrollment Date"></asp:Label>
            Course:
            <asp:Label ID="lblCourse" runat="server" Text="Course"></asp:Label>
            <hr />
            <asp:HyperLink ID="lnkMemoModify" runat="server">수정</asp:HyperLink>
            <asp:HyperLink ID="lnkMemoDelete" runat="server">삭제</asp:HyperLink>
            <asp:HyperLink ID="lnkMemoList" runat="server" 
                NavigateUrl ="~/WebForm2.aspx">리스트</asp:HyperLink>
        </div>

</asp:Content>
