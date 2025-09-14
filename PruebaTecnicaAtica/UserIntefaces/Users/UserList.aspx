<%@ Page Title="Listado de usuarios" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserList.aspx.cs" Inherits="UserInterfaces.Users.UserList" %>
<%@ Import Namespace="System.Collections.Generic" %>
<%@ Import Namespace="Entities" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid vh-100 bg-light">

        <!-- Contenido principal -->
        <div class="row h-100 justify-content-center">

            <!-- Sección de la tabla (centrada) -->
            <div class="col-md-10 col-lg-8 col-xl-6 d-flex justify-content-center align-items-start bg-light pt-4">
                <div class="w-100">
                    <div class="card shadow-lg border-0">
                        <div class="card-header bg-primary text-white">
                            <div class="d-flex justify-content-between align-items-center">
                                <h4 class="mb-0">
                                    <i class="fas fa-users me-2"></i>Lista de Usuarios
                                </h4>
                                <%if (listUsers != null && listUsers.Count > 0) { %>
                                <span class="badge bg-light text-primary fs-6">
                                    <i class="fas fa-user-check me-1"></i><%=listUsers.Count %> usuario(s)
                                </span>
                                <%} %>
                            </div>
                        </div>
                        <div class="card-body p-0">
                            <div class="table-responsive">
                                <table class="table table-hover mb-0">
                                    <thead class="table-dark">
                                        <tr>
                                            <th scope="col" class="text-center">
                                                <i class="fas fa-user me-1"></i>Nombre
                                            </th>
                                            <th scope="col" class="text-center">
                                                <i class="fas fa-user me-1"></i>Apellido
                                            </th>
                                            <th scope="col" class="text-center">
                                                <i class="fas fa-envelope me-1"></i>Email
                                            </th>
                                            <th scope="col" class="text-center">
                                                <i class="fas fa-calendar me-1"></i>Creación
                                            </th>
                                            <th scope="col" class="text-center">
                                                <i class="fas fa-cogs me-1"></i>Acciones
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:Repeater ID="rptUsers" runat="server" OnItemCommand="rptUsers_ItemCommand">
                                            <ItemTemplate>
                                                <tr class="align-middle">
                                                    <td class="text-center fw-medium"><%# Eval("FirstName") %></td>
                                                    <td class="text-center fw-medium"><%# Eval("LastName") %></td>
                                                    <td class="text-center">
                                                        <span class="badge bg-light text-dark border">
                                                            <%# Eval("Email") %>
                                                        </span>
                                                    </td>
                                                    <td class="text-center text-muted">
                                                        <small><%# Eval("Creation", "{0:dd/MM/yyyy}") %></small>
                                                    </td>
                                                    <td class="text-center">
                                                        <div class="btn-group" role="group">
                                                            <asp:Button ID="btnModify" runat="server" 
                                                                Text="Modificar" 
                                                                CssClass="btn btn-warning btn-sm me-1"
                                                                CommandName="ModifyUser"
                                                                CommandArgument='<%# Eval("Id") %>'
                                                                OnClientClick="return confirm('¿Deseas modificar este usuario?');" />
                                                            <asp:Button ID="btnDisable" runat="server" 
                                                                Text="Deshabilitar" 
                                                                CssClass="btn btn-secondary btn-sm me-1"
                                                                CommandName="DisableUser"
                                                                CommandArgument='<%# Eval("Id") %>'
                                                                OnClientClick="return confirm('¿Estás seguro de que deseas deshabilitar este usuario?');" />
                                                            <asp:Button ID="btnDelete" runat="server" 
                                                                Text="Eliminar" 
                                                                CssClass="btn btn-danger btn-sm"
                                                                CommandName="DeleteUser"
                                                                CommandArgument='<%# Eval("Id") %>'
                                                                OnClientClick="return confirm('¿Estás seguro de que deseas eliminar este usuario?');" />
                                                        </div>
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                        <tr runat="server" id="trNoUsers" visible="false">
                                            <td colspan="5" class="text-center text-muted py-5">
                                                <div class="d-flex flex-column align-items-center">
                                                    <i class="fas fa-users fa-3x text-muted mb-3"></i>
                                                    <h5 class="text-muted mb-2">No hay usuarios registrados</h5>
                                                    <p class="text-muted mb-0">Crea el primer usuario para comenzar</p>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
