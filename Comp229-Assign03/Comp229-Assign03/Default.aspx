<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Comp229_Assign03._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    
   
    <div class="jumbotron">
        
    <asp:Image ID="Image1" runat="server" ImageUrl="~/img/school.png" width="200px"/>
         </div>

    <div class="row">
        <div class="col-md-6">
             <div class="Default_List">
             <h3>Register Student</h3>
            
            First Name: <asp:TextBox ID="txtfName" runat="server"></asp:TextBox><br />
        Last Name: <asp:TextBox ID="txtlName" runat="server"></asp:TextBox><br />
         Course: <asp:TextBox ID="txtCourse" runat="server"></asp:TextBox><br />
            <asp:Button ID="btnWrite" runat="server" Text="Register" 
                Onclick="btnWrite_Click"/>&nbsp;
            <asp:Button ID="btnList" runat="server" Text="View List" 
                Onclick="btnList_Click"/>

            <asp:Label ID="label2" runat="server"></asp:Label>
                 </div>
          </div>
        <div class="col-md-6">
             <div class="Default_List">
             <h3>Students List</h3>
            <asp:GridView ID="GridView1" runat="server" horizontalalign="Center" AutoGenerateColumns="False" RowStyle-BorderColor="White">
                <Columns>
                    <asp:BoundField HeaderText ="Number" DataField ="StudentID" />
                    <asp:HyperLinkField HeaderText="First Name"
                        DataTextField="FirstMidName"
                        DataNavigateUrlFormatString ="StudentPage.aspx?StudentID={0}"
                        DataNavigateUrlFields="StudentID" />
                    <asp:BoundField HeaderText ="Last Name" DataField="LastName" />
                    <asp:TemplateField HeaderText="EnrollmentDate">
                        <ItemTemplate>
                            <%# Eval("EnrollmentDate") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>

            </asp:GridView>
                 </div>
            </div>
    </div>


</asp:Content>
