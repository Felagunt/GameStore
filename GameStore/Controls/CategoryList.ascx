<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CategoryList.ascx.cs" Inherits="GameStore.Controls.CategoryList" %>
<% CreatHomeLinkHtml() %>

<% foreach (string category in GetCategories()) { 
        Response.Write(CreateLinkHtml(category));
    }%>