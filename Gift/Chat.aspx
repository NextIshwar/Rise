<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Chat.aspx.cs" Inherits="Gift.Chat" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <style type="text/css">
    .container {
        display: flex;
        flex-direction: row;
        position: fixed;
        top: 0;
        width: 100%;
        height: 40%;
        background-image: url("Img/bitsindri.jpg");
        border-bottom-left-radius: 5px;
        border-bottom-right-radius: 5px;
    }

    .profilePic {
        position: relative;
        top: 10px;
        left: 10px;
        width: 170px;
        height: 170px;
        border-radius: 20px;
        background-color: blue;
    }

    .searchBar {
        position: relative;
        top: 70px;
        left: 40px;
        width: 500px;
        height: 45px;
    }

    .notificationBar {
        position: relative;
        top: 0px;
        left: 33%;
        width: 300px;
        height: 45px;
        background-color: black;
        border-bottom-left-radius: 10px;
        border-bottom-right-radius: 10px;
    }

    .chatSection {
        position: fixed;
        display: flex;
        flex-direction: row-reverse;
        background-color: green;
        height: 100%;
        width: 100%;
        top: 40%;
    }

    .msgs {
        cursor: pointer;
        position: absolute;
        right: 10px;
        background-color: blue;
        height: 10px;
        width: 300px;
        bottom: 40%;
    }

    input[type=text] {
        width: 130px;
        box-sizing: border-box;
        border: 2px solid #ccc;
        border-radius: 4px;
        font-size: 16px;
        background-color: white;
        background-image: url('Img/searchicon.png');
        background-position: 10px 10px;
        background-size: 30px 30px;
        background-repeat: no-repeat;
        padding: 12px 20px 12px 40px;
        -webkit-transition: width 0.4s ease-in-out;
        transition: width 0.4s ease-in-out;
    }

        input[type=text]:focus {
            width: 100%;
        }

    .msgs li {
        font-family: helvetica;
        padding-bottom: 5px;
    }

    .msgs li {
        color: limegreen;
    }

        .msgs li span {
            color: black;
        }
</style>
    <title></title>
</head>
<body>
    <script src="scripts/ai.0.22.9-build00167.min.js"></script>
    <script src="scripts/jquery-1.6.4-vsdoc.js"></script>
    <script src="scripts/jquery-1.6.4.js"></script>
    <script src="/signalr/hubs"></script>
    <script type="text/javascript">
        $(function () {
            var chat = $.connection.chatHub;
            registerClientMethod(chatHub);
            $.connection.hub.start().done(function () {
                registerEvents(chatHub)
            })
        });
        function registerClientMethod(chatHub)
        {
            chathub.client.onConnected = function (id, userName, allUsers, message) {
                setScreen(true);

                $('#hdId').val(id);
                $('#hiddenUserName').val(userName);
             //   $('#spanUser').html(userName);
                for (i = 0; i < allUsers.length; i++) {

                    AddUser(chatHub, allUsers[i].ConnectionId, allUsers[i].UserName);
                }
                for (i = 0; i < messages.length; i++) {

                    AddMessage(messages[i].UserName, messages[i].Message);
                }
            }
        }
        function AddUser(chatHub,id,userName)
        {
            var userId = $('#hdId').val();

            var code = "";

            if (userId == id) {

               // code = $('<div class="loginUser">' + name + "</div>");
                //var contsiner=$("Users").append('<li>')
            }
            else {

               // code = $('<a id="' + id + '" class="user" >' + name + '<a>');
            var code=    $('Users').append('<li><a id="'+id+ 'class="'+userName+'<a>');
                $(code).dblclick(function () {
                    var id = $(this).attr('id');

                    if (userId != id)
                        OpenPrivateChatWindow(chatHub, id, name);

                });
            }

            $("#divusers").append(code);

        }
        function OpenPrivateChatWindow(chatHub, id, userName) {

            var ctrId = 'private_' + id;

            if ($('#' + ctrId).length > 0) return;

            createPrivateChatWindow(chatHub, id, ctrId, userName);

        }
        function createPrivateChatWindow(chatHub, userId, ctrId, userName) {

            var div = '<div id="' + ctrId + '" class="ui-widget-content draggable" rel="0">' +
                       '<div class="header">' +
                          '<div  style="float:right;">' +
                              '<img id="imgDelete"  style="cursor:pointer;" src="/Images/delete.png"/>' +
                           '</div>' +  

                           '<span class="selText" rel="0">' + userName + '</span>' +
                       '</div>' +
                       '<div id="divMessage" class="messageArea">' +

                       '</div>' +
                       '<div class="buttonBar">' +
                          '<input id="txtPrivateMessage" class="msgText" type="text"   />' +
                          '<input id="btnSendMessage" class="submitButton button" type="button" value="Send"   />' +
                       '</div>' +
                    '</div>';

            var $div = $(div);

          
            $div.find('#imgDelete').click(function () {
                $('#' + ctrId).remove();
            });

           
            $div.find("#btnSendMessage").click(function () {

                $textBox = $div.find("#txtPrivateMessage");
                var msg = $textBox.val();
                if (msg.length > 0) {

                    chatHub.server.sendPrivateMessage(userId, msg);
                    $textBox.val('');
                }
            });
            $div.find("#txtPrivateMessage").keypress(function (e) {
                if (e.which == 13) {
                    $div.find("#btnSendMessage").click();
                }
            });

            AddDivToContainer($div);

        }
        function AddDivToContainer($div) {
            $('#divContainer').prepend($div);

            $div.draggable({

                handle: ".header",
                stop: function () {

                }
            });
        }
    </script>
    <div class="container">
        
        <div class="profilePic"></div>
        <div class="searchBar">
            <input type="text" name="search" placeholder="Search.."/>
        </div>
        <div class="notificationBar"></div>
    </div>
    <div class="chatSection">
        <script src="jquery-3.1.1.js"></script>
        <script src="jqery-ui.js"></script>
        <script>
function divChange()
{
   var a=$("hiddenUserName").val();
    $("#msgs").animate({ height: "400px" })
    $("#msgs").css("cursor","default")
}
        </script>
        <div class="msgs" id="msgs" onclick="divChange()">
            <ul id="Users">
            </ul>
        </div>
    </div>
    <asp:HiddenField runat="server" ID="hiddenUserName" />
        <asp:HiddenField runat="server" ID="hdId" />
</body>
</html>
