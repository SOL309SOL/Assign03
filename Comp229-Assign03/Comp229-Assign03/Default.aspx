<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Comp229_Assign03._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">


        <div>
            <h3>메모리스트</h3>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField HeaderText ="Number" DataField ="StudentID" />
                    <asp:BoundField HeaderText ="Last Name" DataField="LastName" />
                    <asp:HyperLinkField HeaderText="First Name"
                        DataTextField="FirstMidName"
                        DataNavigateUrlFormatString ="WebForm1.aspx?StudentID={0}"
                        DataNavigateUrlFields="StudentID" />
                    <asp:TemplateField HeaderText="EnrollmentDate">
                        <ItemTemplate>
                            <%# Eval("EnrollmentDate") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
             </div>
    <div>
            <h3>Register</h3>
            Last Name: <asp:TextBox ID="txtlName" runat="server"></asp:TextBox><br />
            First Name: <asp:TextBox ID="txtfName" runat="server"></asp:TextBox><br />
            <asp:Button ID="btnWrite" runat="server" Text="Register" 
                Onclick="btnWrite_Click"/>&nbsp;
            <asp:Button ID="btnList" runat="server" Text="View List" 
                Onclick="btnList_Click"/>

            <asp:Label ID="label2" runat="server"></asp:Label>
  </div>


</asp:Content>
