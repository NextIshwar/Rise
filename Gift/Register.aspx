<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Gift.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
           .register{
             background-color: white;
            position: relative;
            left:23%;
            top:30%;
            margin-top:10%;
            padding-top:7%;
            padding-left: 5%;
           padding-right:5%;
            width:50%;
            height:400px;
             border-radius: 30px;
           box-shadow:  1px 2px 25px skyblue inset;
              padding-top: 45px;
        }
        .imgSignup {
            width: 211px;
        }
        .auto-style1 {
            height: 26px;
            font-family: lucida bright;
            
        }
        .RegisterToHome{
         font-family:Lucida Bright;
         font-size:larger;
         text-decoration:none;
         
        }
        .auto-style2 {
            font-size: x-large;
            position:absolute;
            top:8%;
            right:8%;
        }
#form1{
    background-color: lightgrey;
    padding-top:60px;
    padding-bottom: 60px;
    display: flex;
    align-content: center;
    height:100%;
    
}
.textbox
{border-radius: 5px;
    font-family: arial;
    font-size: small;
background: red;
box-shadow:0px 5px 5px skyblue;
color: grey;
width: 150px;
padding: 6px 15px 6px 35px;
transition: 500ms all ease;
border: 1px solid grey;
}
.textbox:focus
{
    color:black;
    font-family: arial;

box-shadow: 12px 13px 0px rgba(204, 211, 51, 0.38),
-11px -14px 0px rgba(241, 96, 0, 0.28),
18px -24px 0px rgba(0, 0, 0, 0.34),
33px -6px 0px rgba(39, 74, 214, 0.28);
}  
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="register">
        <a href="Login.aspx" id="RegisterToHome"><strong><span class="auto-style2">Home</span></strong></a>
    <table class="registerTable">
        <tr>
            <td class="auto-style1"><p id="Name">Name</p></td>
            <td class="auto-style1"><asp:TextBox ID="txtName" runat="server" BackColor="#99CCFF" Font-Names="Lucida Bright" CssClass="textbox"></asp:TextBox></td>
            <td class="auto-style1"><asp:RequiredFieldValidator ID="rfvNAme" runat="server" ErrorMessage="Name required" ControlToValidate="txtName" Text="*" ForeColor="Red"></asp:RequiredFieldValidator></td>
            <td class="auto-style1"><asp:RegularExpressionValidator ID="rxvName" runat="server" ControlToValidate="txtName" ValidationExpression="^[a-zA-Z\s]+$" ErrorMessage="Invalid Name" ForeColor="Red" SetFocusOnError="True"></asp:RegularExpressionValidator></td>
        </tr>
        <tr>
            <td class="auto-style1"><p id="Year">Year</p></td>
            <td class="auto-style1"><asp:TextBox ID="txtYear" runat="server" BackColor="#99CCFF" Font-Names="Lucida Bright" CssClass="textbox"></asp:TextBox></td>
            <td class="auto-style1"><asp:RequiredFieldValidator ID="rfvYear" runat="server" ErrorMessage="Year required" ControlToValidate="txtYear" Text="*" ForeColor="Red"></asp:RequiredFieldValidator></td>
            <td class="auto-style1"><asp:RegularExpressionValidator ID="rxvYear" runat="server" ControlToValidate="txtYear" ErrorMessage="Invalid Year" ValidationExpression="\d{4}" ForeColor="Red"></asp:RegularExpressionValidator></td>
        </tr>
        <tr>
            <td class="auto-style1"><p id="email">Email</p></td>
            <td class="auto-style1"><asp:TextBox ID="txtEmail" runat="server" BackColor="#99CCFF" Font-Names="Lucida Bright" CssClass="textbox"></asp:TextBox></td>
            <td class="auto-style1"><asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email Required" ForeColor="Red" Text="*"></asp:RequiredFieldValidator></td>
            <td class="auto-style1"><asp:RegularExpressionValidator ID="rxvEmail" runat="server" ErrorMessage="Invalid Email" ForeColor="Red" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ></asp:RegularExpressionValidator></td>
             </tr>
        <tr>
            <td class="auto-style1"><p id= "year">Roll No</p> </td>
            <td class="auto-style1"><asp:TextBox ID="txtRoll_No" runat="server" BackColor="#99CCFF" Font-Names="Lucida Bright" CssClass="textbox"></asp:TextBox></td>
            <td class="auto-style1"><asp:RequiredFieldValidator ID="rfvRoll_No" runat="server" ErrorMessage="DOB required" ControlToValidate="txtRoll_No" Text="*" ForeColor="Red"></asp:RequiredFieldValidator></td>
            <td class="auto-style1"><asp:RegularExpressionValidator ID="rxvRoll_No" ControlToValidate="txtRoll_No" runat="server" ErrorMessage="invalid Roll No." ForeColor="Red" ValidationExpression="\d{6,8}"></asp:RegularExpressionValidator></td>
             </tr>
        <tr>
            <td class="auto-style1"><p id="password">Password</p></td>
            <td class="auto-style1"><asp:TextBox ID="txtPassword" runat="server" TextMode="Password" BackColor="#99CCFF" Font-Names="Lucida Bright" CssClass="textbox"></asp:TextBox></td>
            <td class="auto-style1"><asp:RequiredFieldValidator ID="rfvPassword" runat="server" ErrorMessage="Password required" ControlToValidate="txtPassword" Text="*" ForeColor="Red"></asp:RequiredFieldValidator></td>
            <td class="auto-style1"><asp:RegularExpressionValidator ID="rxvPassword" ForeColor="Red" runat="server" ControlToValidate="txtPassword" ValidationExpression="((?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%]).{6,20})" ErrorMessage="Password should be of length 6-15 and must contain atleast one upper case and a special char"></asp:RegularExpressionValidator></td>
        </tr>
        <tr>
            <td class="imgSignup"><asp:ImageButton ID="signup" runat="server" ImageUrl="~/img/signup.png" Height="50px" Width="107px" OnClick="signup_Click" /></td>
            
        </tr>
    </table>
    </div>
    </form>
    <p>
        &nbsp;</p>
</body>
</html>
