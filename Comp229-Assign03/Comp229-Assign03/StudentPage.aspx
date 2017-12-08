<%@ Page Title="Student Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="StudentPage.aspx.cs" Inherits="Comp229_Assign03.StudentPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
      <div>
    <h2><%: Title %>.</h2>

          <asp:Image ID="Image1" runat="server" ImageUrl="~/img/profile2.png" />
          <div class="Default_List">
          StudentID:
          <asp:Label ID="lblId" runat="server" Text="StudentID"></asp:Label><br />
            Name:
            <asp:Label ID="lblFname" runat="server" Text="First Name"></asp:Label>
            <asp:Label ID="lblLname" runat="server" Text="Last Name"></asp:Label><br />
            Enrollment Date:
            <asp:Label ID="lblDate" runat="server" Text="Enrollment Date"></asp:Label><br />
            Course:
            <asp:Label ID="lblCourse" runat="server" Text="Course"></asp:Label><br />
            
              <asp:GridView ID="CourseGridView" runat="server" horizontalalign="Center" AutoGenerateColumns="False" RowStyle-BorderColor="White">
                <Columns>
                    
                    <asp:HyperLinkField HeaderText="Course"
                        DataTextField="CourseID"
                        DataNavigateUrlFormatString ="WebForm4.aspx?CourseID={0}"
                        DataNavigateUrlFields="CourseID" />
                   <asp:BoundField HeaderText ="Title" DataField ="Title" />
                </Columns>

            </asp:GridView>

        </div>
          
            <asp:HyperLink ID="lnkMemoModify" class="Button_List" runat="server">Modify</asp:HyperLink>
            <asp:HyperLink ID="lnkMemoDelete" class="Button_List" runat="server">Delete</asp:HyperLink>
            <asp:HyperLink ID="lnkMemoList" class="Button_List" runat="server" 
                NavigateUrl ="~/Default.aspx">View List</asp:HyperLink>


      </div>
</asp:Content>
