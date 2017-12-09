<%@ Page Title="Student Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="StudentPage.aspx.cs" Inherits="Comp229_Assign03.StudentPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <h2><%: Title %>.</h2>

        <asp:Image ID="Image1" runat="server" ImageUrl="~/img/profile2.png" />

        <%--Selected Student Data--%>

        <div class="Default_List">
            <div class="font">
                <b>StudentID:</b>
                <asp:Label ID="lblId" runat="server" Text="StudentID"></asp:Label><br />
                <b>Name:</b>
                <asp:Label ID="lblFname" runat="server" Text="First Name"></asp:Label>
                <asp:Label ID="lblLname" runat="server" Text="Last Name"></asp:Label><br />
                <b>Enrollment Date:</b>
                <asp:Label ID="lblDate" runat="server" Text="Enrollment Date"></asp:Label><br />
        
            </div>
            <p></p>

            <%--List for Course of Selected Student--%>

            <asp:GridView ID="CourseGridView" class="table table-hover" Width="30%" runat="server" HorizontalAlign="Center" AutoGenerateColumns="False" RowStyle-BorderColor="White">
                <Columns>

                    <asp:HyperLinkField HeaderText="Course"
                        DataTextField="CourseID"
                        DataNavigateUrlFormatString="CoursePage.aspx?CourseID={0}"
                        DataNavigateUrlFields="CourseID" />
                    <asp:BoundField HeaderText="Title" DataField="Title" />
                </Columns>

            </asp:GridView>
            <div class="buttons">
                <asp:HyperLink ID="lnkMemoModify" runat="server"><span class="glyphicon glyphicon-edit"></span></asp:HyperLink>
                <asp:HyperLink ID="lnkMemoDelete" runat="server"><span class="glyphicon glyphicon-trash"></span></asp:HyperLink>
                <asp:HyperLink ID="lnkMemoList" runat="server"
                    NavigateUrl="~/Default.aspx"><span class="glyphicon glyphicon-list"></span></asp:HyperLink>

            </div>

        </div>

    </div>
</asp:Content>
