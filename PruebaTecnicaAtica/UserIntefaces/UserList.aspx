<%@ Page Title="Listado de usuaios" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserList.aspx.cs" Inherits="UserIntefaces.UserList" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">


    <div class="div-tabla">
        <table class="table table-bordered">
            <thead class="table-dark">
                <tr>
                    <th scope="col" class="centrar-texto">Nombre</th>
                    <th scope="col" class="centrar-texto">Apellido</th>
                    <th scope="col" class="centrar-texto">Email</th>
                    <th scope="col" class="centrar-texto">Creacion</th>
                </tr>
            </thead>
            <tbody>
                <%foreach (var user in listUsers)
                    { %>
                <tr>
                    <td class="centrar-texto"><%=user.FirstName %></td>
                    <td class="centrar-texto"><%=user.LastName %></td>
                    <td class="centrar-texto"><%=user.Email %></td>
                    <td class="centrar-texto"><%=user.Creation %></td>
                </tr>
                <%} %>
            </tbody>
        </table>
    </div>
</asp:Content>
