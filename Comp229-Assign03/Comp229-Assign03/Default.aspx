<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Comp229_Assign03._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <asp:Image class="tree" runat="server" ImageUrl="img/tree1.png"/>
    <asp:Image ID="school" runat="server" ImageUrl="~/img/school.png" width="200px"/>
    <asp:Image class="tree" runat="server" ImageUrl="img/tree1.png" />

    <div class="row">
        <div class="col-md-2">
            </div>
        <div class="col-md-4">
             <div class="Default_List">
             <h3>Register Student</h3>
            
            First Name: <asp:TextBox CssClass="form-control" ID="txtfName" runat="server" Width="170px" Wrap="False"></asp:TextBox><br />
       <asp:RequiredFieldValidator id="ValFname" runat="server"
  ControlToValidate="txtfName"
  ErrorMessage="First name is a required field."
  ForeColor="White" BackColor="#FF5050" Display="Dynamic">
</asp:RequiredFieldValidator><br />
                 Last Name: <asp:TextBox CssClass="form-control" Width="170px" ID="txtlName" runat="server"></asp:TextBox><br />
         <asp:RequiredFieldValidator id="ValLname" runat="server"
  ControlToValidate="txtlName"
  ErrorMessage="Last name is a required field."
  ForeColor="White" BackColor="#FF5050" Display="Dynamic">
</asp:RequiredFieldValidator><br />
                 Course: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox CssClass="form-control" Width="170px" ID="txtCourse" runat="server"></asp:TextBox><br />
                  <asp:RequiredFieldValidator id="ValCourse" runat="server"
  ControlToValidate="txtCourse"
  ErrorMessage="Course is a required field."
  ForeColor="White" BackColor="#FF5050" Display="Dynamic">
</asp:RequiredFieldValidator><br />
                 <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
     ControlToValidate="txtCourse"
     ErrorMessage="Only numeric allowed." ForeColor="White"
     ValidationExpression="^[0-9]*$" ValidationGroup="NumericValidate" BackColor="#FF5050" Display="Dynamic">*Only numeric allowed.</asp:RegularExpressionValidator>

                 <div style="margin-top:30px;">
                     
                 <asp:Button class="btn dropdown-toggle" ID="btnWrite" runat="server" Text="Register" 
                Onclick="btnWrite_Click"/>&nbsp;
            <asp:Button class="btn dropdown-toggle" ID="btnList" runat="server" Text="View List" 
                Onclick="btnList_Click"/>
                 </div>
            <asp:Label ID="label2" runat="server"></asp:Label>
                     </div>
            <div style="margin-top:20px">
           <%-- <img src="img/heart.png" width="100px" />
            <img src="img/heart.png" width="100px" />
            <img src="img/heart.png" width="100px" />--%>
                </div>
          </div>
        <div class="col-md-4">
             <div class="Default_List" >
             <h3>Students List</h3>
            <asp:GridView class="table table-hover" BorderStyle="none"  HeaderStyle-BackColor="gold"  ID="GridView1" runat="server" horizontalalign="Center" AutoGenerateColumns="False" RowStyle-BorderColor="White" CaptionAlign="Left">
                <Columns>
                    <asp:BoundField HeaderText ="Number" DataField ="StudentID" />
                    <asp:HyperLinkField HeaderText="First"
                        DataTextField="FirstMidName"
                        DataNavigateUrlFormatString ="StudentPage.aspx?StudentID={0}"
                        DataNavigateUrlFields="StudentID" />
                    <asp:BoundField HeaderText ="Last" DataField="LastName" />
               
                </Columns>

            </asp:GridView>
                 </div>
            </div>
        <div class="col-md-2">
            </div>
    </div>

</asp:Content>
