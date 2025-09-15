<%@ Page Title="Registrate" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserRegister.aspx.cs" Inherits="UserInterfaces.Users.UserRegister" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid vh-100 bg-light">
        <div class="row h-100">
            <div class="col-md-6 d-flex flex-column justify-content-center align-items-center bg-light">
                <div class="text-center">
                    <h1 class="display-4 fw-bold text-dark mb-3">Javier Larroca</h1>
                    <h5 class="text-dark text-decoration-underline mb-4">Gestión de usuarios</h5>

                    <a href="https://www.javierlarroca.com.ar" target="_blank">
                        <div class="bg-gradient bg-dark rounded-3 d-inline-flex align-items-center justify-content-center"
                            style="width: 120px; height: 120px; background: linear-gradient(180deg, #6c757d 0%, #000000 100%);">
                            <div class="text-white fw-bold" style="font-size: 2rem;">
                                <div class="d-flex">
                                    <span class="me-2">J</span>
                                    <span>L</span>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
            </div>

            <div class="col-md-6 d-flex justify-content-center align-items-center bg-light">
                <div class="card shadow-lg border-0" style="width: 500px; min-height: 600px;">
                    <div class="card-body p-5">
                        <div class="text-center mb-4">
                            <h2 class="fw-bold text-dark mb-2">Crea una cuenta</h2>
                        </div>

                        <form id="registerForm">
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label class="form-label">Nombre <span class="text-danger">*</span></label>
                                    <asp:TextBox CssClass="form-control required-field" ID="firstName" runat="server"
                                        placeholder="Nombre"></asp:TextBox>
                                    <div class="invalid-feedback">El nombre es obligatorio</div>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">Apellido <span class="text-danger">*</span></label>
                                    <asp:TextBox CssClass="form-control required-field" ID="lastName" runat="server"
                                        placeholder="Apellido"></asp:TextBox>
                                    <div class="invalid-feedback">El apellido es obligatorio</div>
                                </div>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Fecha de nacimiento</label>
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

                            <div class="mb-3">
                                <label class="form-label">Email <span class="text-danger">*</span></label>
                                <asp:TextBox CssClass="form-control required-field" type="email" ID="email" runat="server"
                                    placeholder="correo electrónico"></asp:TextBox>
                                <div class="invalid-feedback">El email es obligatorio</div>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Contraseña nueva</label>
                                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"
                                    CssClass="form-control" placeholder="Contraseña nueva" />
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Confirmar contraseña</label>
                                <asp:TextBox ID="txtPasswordConfirm" runat="server" TextMode="Password"
                                    CssClass="form-control" placeholder="Repite tu contraseña" />
                            </div>

                            <div class="mb-4">
                                <asp:Button CssClass="btn btn-success w-100 py-2 fw-bold" Text="Registrarte"
                                    ID="createUser" OnClick="createUser_Click" runat="server" />
                            </div>

                            <div class="text-center">
                                <a href="../Login.aspx" class="text-primary text-decoration-underline">¿Ya tienes una cuenta?</a>
                            </div>

                            <div class="mt-4 text-center">
                                <asp:Label CssClass="alert alert-warning d-inline-block" Visible="false" ID="Warning"
                                    runat="server" Text="Debe completar todos los campos obligatorios"></asp:Label>
                            </div>

                            <div class="mt-3 text-center">
                                <asp:Label CssClass="alert alert-success d-inline-block" Visible="false" ID="SuccessList"
                                    runat="server"></asp:Label>
                            </div>

                            <div class="mt-3 text-center">
                                <asp:Label CssClass="alert alert-danger d-inline-block" Visible="false" ID="FailUser"
                                    runat="server"></asp:Label>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>