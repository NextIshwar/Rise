<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Gift.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
 
   
#forgotUrPwd{position: absolute;
    top:50%;
}
      
#ImageButton1{
    padding-top:65px;
            top: 0px;
            left: 0px;
            height: -7px;
        }  
       .Login{
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
           box-shadow:  1px 2px 25px skyblue inset;
        }
        .table {
            width: 100%;
        }
        .userName {
            font-family: Lucida Bright;
            width: 261px;
            height: 33px;
        }
        .txtUser {
            height: 33px;
            box-shadow:  0px 5px 5px skyblue;
        }
      .txtUser:hover{
       box-shadow:0px 5px 5px lightblue;
         }
        .pwd {
            font-family: Lucida Bright;
            width: 261px;
            height: 32px;
        }
        .txtPwd {
            height: 32px;
           box-shadow:  0px 5px 5px skyblue;
        }
.txtPwd:hover{
    box-shadow:0px 5px 5px lightblue;
}
        .row1{
           
        }
.textPassword{
    margin-top:15px;
    
}
#remember{
    font-family:Lucida Bright;
}
#forgotUrPwd{
    text-decoration:none;
}
.notmember{
    display:flex;
    position: absolute;
    left:65%;
    top:2%;
}
#newMember{
    padding:15px;
}
.txtbox{
    border-radius: 5px;
    font-family: arial;
    font-size: small;
background: white;
color: grey;
width: 150px;
padding: 6px 15px 6px 35px;
transition: 500ms all ease;
border: 1px solid #333;
}
.txtbox:focus
{
    color:grey;
    font-family: arial;

box-shadow: 12px 13px 0px rgba(204, 211, 51, 0.38),
-11px -14px 0px rgba(241, 96, 0, 0.28),
18px -24px 0px rgba(0, 0, 0, 0.34),
33px -6px 0px rgba(39, 74, 214, 0.28);
} 
    
.btnLogin{
    position:relative;

}
    
        .auto-style3 {
            height: 1px;
            width: 28px;
        }
        .auto-style4 {
            font-family: Lucida Bright;
            width: 287px;
            height: 33px;
        }
        .auto-style5 {
            font-family: Lucida Bright;
            width: 287px;
            height: 32px;
        }
    
        .auto-style6 {
            width: 101px;
            height: 40px;
            margin-right: 0px;
            margin-top: 16px;
        }
    
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="Login">
        <table class="table">
        <div class="notmember"><p id="Not_Member">Not a Member/&nbsp</p><a href="Register.aspx" id="newMember" style="text-decoration:none">Register Here</a></div>
            <tr class="row1">
                <td class="auto-style4">User Name&nbsp; :</td>
                <td class="txtUser"><asp:TextBox ID="txtUser" runat="server" Height="32px" Width="256px" BorderStyle="None" CssClass="txtbox" style="margin-bottom: 15px" CausesValidation="True"></asp:TextBox>  </td>
                <td style="width:256px"><asp:RequiredFieldValidator ID="vUser" runat="server" ControlToValidate="txtUser" ForeColor="Red" Text="*" ErrorMessage="User Name is Required"></asp:RequiredFieldValidator></td>
            </tr>
            <tr class="row2">
                <td class="auto-style5">Password&nbsp;&nbsp; :</td>
                <td class="txtPwd"><asp:TextBox ID="txtPassword" runat="server" Height="32px" Width="256px" BorderStyle="None" CssClass="txtbox" CausesValidation="True"></asp:TextBox></td> 
            <td style="width:256px" ><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUser" ForeColor="Red" Text="*" ErrorMessage="User Name is Required"></asp:RequiredFieldValidator></td>
</tr>
            <tr>
                <td class="auto-style3">
                    
                  <asp:ImageButton runat="server" ID="btnLogin" ImageUrl="~/img/btnLogin.png" Height="45px" Width="106px" OnClick="btnLogin_Click" /></td>
                <td>
                  <a href="#" style="font-family:'Lucida Bright'" id="forgotUrPwd">Forgot Your password</a>
                    <asp:CheckBox ID="stay" runat="server" Text="Stay Logged In" />
                </td>
            </tr>
        </table>
        
    <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
        </div>
    </form>
</body>
</html>
