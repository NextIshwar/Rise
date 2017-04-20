using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using Microsoft.AspNet.SignalR;

namespace Gift
{
    public class ChatHub:Hub
    {
        private static List<UserDetail> ConnectedUsers = new List<UserDetail>();
        
        static List<MessageDetail> Message = new List<MessageDetail>();
        public void  Connect(string username)
        { 
            var id = Context.ConnectionId;
            if(ConnectedUsers.Count(x => x.ConnectionId==id)==0)
            {
                ConnectedUsers.Add(new UserDetail { ConnectionId = id, UserName = username });
                Clients.Caller.onConnected(id, username, ConnectedUsers, Message);
                Clients.AllExcept(id).onNewUserConnected(id, username);
            }
        }
        public void SendMessageToAll(string userName, string message)
        {
           
            AddMessageinCache(userName, message);
            Clients.All.messageReceived(userName, message);
        }
        private void AddMessageinCache(string userName, string message)
        {
            Message.Add(new MessageDetail { UserName = userName, Message = message });

            if (Message.Count > 100)
                Message.RemoveAt(0);
        }
        private void PrivateMessage(string userId, string message)
        {
            string fromUserId = Context.ConnectionId;
            var to = ConnectedUsers.FirstOrDefault(x => x.ConnectionId == userId);
            var from = ConnectedUsers.FirstOrDefault(x => x.ConnectionId == fromUserId);
            if(to!=null&&from!=null)
            {
                Clients.Client(userId).sendPrivateMessage(from, from.UserName, message);
                Clients.Caller.sendPrivateMessage(to, from.UserName, message);
            }
        }

    }
}