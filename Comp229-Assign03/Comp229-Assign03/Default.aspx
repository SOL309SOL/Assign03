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
                        DataNavigateUrlFormatString ="WebForm3.aspx?StudentID={0}"
                        DataNavigateUrlFields="StudentID" />
                    <asp:TemplateField HeaderText="EnrollmentDate">
                        <ItemTemplate>
                            <%# Eval("EnrollmentDate") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
             


</asp:Content>
