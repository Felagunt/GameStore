﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Listing.aspx.cs" Inherits="GameStore.Pages.Listing"
    MasterPageFile="~/Pages/Store.Master" %>
<%@ import Namespace="System.Web.Routing" %>
<%@ Import Namespace="GameStore.Pages" %>//it's wrong


<asp:Content ContentPlaceHolderID="bodyContent" runat="server">
    <div id="content">
        <%
            foreach (GameStore.Models.Game game in Listing.GetGames())
            {
                Response.Write(String.Format(@"
                    <div class='item'>
                        <h3>{0}</h3>
                        {1}
                        <h4>{2:c}</h>
                    </div>",
                    game.Name, game.Description, game.Price));
            }
        %>
    </div>
    <div class="pager">
        <%
            for(int i=1;i<=Listing.MaxPage;i++)
            {
                string path = RouteTable.Routes.GetVirtualPath(null, null,
                    new RouteValueDictionary() { { "page", i } }).VirtualPath;
                Response.Write(
                    String.Format("<a href='{0}'{1}>{2}</a>",
                    path, i == Listing.CurrentPage ? "class='selected'" : "", i));
            }
        %>
    </div>
</asp:Content>
