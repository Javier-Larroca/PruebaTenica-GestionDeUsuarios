<%@ Page Title="Alta de Usuario" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserCreate.aspx.cs" Inherits="UserInterfaces.Users.UserCreate" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid vh-100 bg-light">

        <!-- Contenido principal -->
        <div class="row h-100">
            <!-- Sección del perfil (izquierda) -->
            <div class="col-md-6 d-flex flex-column justify-content-center align-items-center bg-light">
                <div class="text-center">
                    <h1 class="display-4 fw-bold text-dark mb-3">Javier Larroca</h1>
                    <h5 class="text-dark text-decoration-underline mb-4">Gestión de usuarios</h5>

                    <!-- Avatar con iniciales -->
                    <div class="bg-gradient bg-dark rounded-3 d-inline-flex align-items-center justify-content-center"
                        style="width: 120px; height: 120px; background: linear-gradient(180deg, #6c757d 0%, #000000 100%);">
                        <div class="text-white fw-bold" style="font-size: 2rem;">
                            <div class="d-flex">
                                <span class="me-2">J</span>
                                <span>L</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Sección del formulario (derecha) -->
            <div class="col-md-6 d-flex justify-content-center align-items-start bg-light pt-4">
                <div class="w-100">
                    <div class="card shadow-lg border-0">
                        <div class="card-header bg-primary text-white">
                            <h4 class="mb-0 text-center">
                                <i class="fas fa-user-plus me-2"></i>Alta de Usuario
                            </h4>
                        </div>
                        <div class="card-body p-4">
                            <form>
                                <div class="mb-3">
                                    <label class="form-label fw-bold">Nombre</label>
                                    <asp:TextBox CssClass="form-control" ID="firstName" runat="server" placeholder="Ingrese el nombre"></asp:TextBox>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label fw-bold">Apellido</label>
                                    <asp:TextBox CssClass="form-control" ID="lastName" runat="server" placeholder="Ingrese el apellido"></asp:TextBox>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label fw-bold">Email</label>
                                    <asp:TextBox CssClass="form-control" type="email" ID="email" runat="server" placeholder="Ingrese el email"></asp:TextBox>
                                </div>

                                <!-- Fecha de nacimiento -->
                                <div class="mb-3">
                                    <label class="form-label fw-bold">Fecha de nacimiento</label>
                                    <div class="row">
                                        <div class="col-4">
                                            <asp:DropDownList CssClass="form-select" ID="dayBirth" runat="server" />
                                        </div>
                                        <div class="col-4">
                                            <asp:DropDownList CssClass="form-select" ID="monthBirth" runat="server" />
                                        </div>
                                        <div class="col-4">
                                            <asp:DropDownList CssClass="form-select" ID="yearBirth" runat="server" />
                                        </div>
                                    </div>
                                </div>

                                <div class="d-grid gap-2">
                                    <asp:Button CssClass="btn btn-primary btn-lg" Text="Crear Usuario" ID="createUser" OnClick="createUser_Click" runat="server" />
                                </div>
                            </form>

                            <!-- Mensajes de alerta -->
                            <div class="mt-3">
                                <asp:Label CssClass="alert alert-warning d-block" Visible="false" ID="Warning" runat="server" >
                                </asp:Label>

                                <asp:Label CssClass="alert alert-success d-block" Visible="false" ID="SuccessUser" runat="server">
                                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                </asp:Label>

                                <asp:Label CssClass="alert alert-success d-block" Visible="false" ID="SuccessList" runat="server">
                                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                </asp:Label>

                                <asp:Label CssClass="alert alert-danger d-block" Visible="false" ID="FailUser" runat="server">
                                </asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
