<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="UserInterfaces.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid vh-100 bg-light">
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
            <div class="col-md-6 d-flex justify-content-center align-items-center bg-light">
                <div class="card shadow-lg border-0" style="width: 400px; min-height: 500px;">
                    <div class="card-body p-5">
                        <form id="loginForm">
                            <!-- Campo Email -->
                            <div class="mb-4">
                                <label for="Email" class="form-label">Email</label>
                                <asp:TextBox CssClass="form-control" ID="email" runat="server"
                                    placeholder="mail@mail.com"
                                    onkeyup="validateForm()"></asp:TextBox>
                            </div>

                            <!-- Campo Contraseña -->
                            <div class="mb-4">
                                <label for="Password" class="form-label">Contraseña</label>
                                <div class="input-group">
                                    <asp:TextBox CssClass="form-control" ID="password" TextMode="Password" runat="server"
                                        placeholder="••••••••••••"
                                        onkeyup="validateForm()"></asp:TextBox>
                                    <button class="btn btn-outline-secondary" type="button" onclick="togglePassword()">
                                        <i class="fas fa-eye"></i>
                                    </button>
                                </div>
                            </div>

                            <!-- Botón Iniciar Sesión -->
                            <div class="mb-3">
                                <asp:Button ID="Ingresar" CssClass="btn btn-primary w-100 py-2"
                                    OnClick="Ingresar_Click" Text="Iniciar sesión"
                                    runat="server" Enabled="false" />
                            </div>

<%--                            <!-- Enlace Olvidé mi contraseña -->
                            <div class="mb-4 text-center">
                                <a href="#" class="text-primary text-decoration-none">¿Olvidaste tu contraseña?</a>
                            </div>--%>

                            <!-- Botón Crear cuenta nueva -->
                            <div class="mb-3">
                                <asp:Button ID="Register" class="btn btn-success w-100 py-2" 
                                    OnClick="Register_Click" Text="Crear cuenta nueva" runat="server" />
                            </div>

                            <!-- Mensaje de error -->
                            <div class="mt-5 text-center">
                                <asp:Label CssClass="alert alert-danger d-inline-block" ID="ErrorLogueo"
                                    Text="Usuario y/o contraseña ingersado incorecto" runat="server" Visible="false"></asp:Label>
                            </div>
                            <div class="mt-5 text-center">
                                <asp:Label CssClass="alert alert-danger d-inline-block" ID="ErrorActive"
                                    Text="Usuario no activo" runat="server" Visible="false"></asp:Label>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Scripts para validación y funcionalidad -->
    <script>
        function validateForm() {
            const email = document.getElementById('<%= email.ClientID %>').value.trim();
            const password = document.getElementById('<%= password.ClientID %>').value.trim();
            const loginBtn = document.getElementById('<%= Ingresar.ClientID %>');

            // Habilitar/deshabilitar botón según los campos
            if (email !== '' && password !== '') {
                loginBtn.disabled = false;
                loginBtn.classList.remove('btn-secondary');
                loginBtn.classList.add('btn-primary');
            } else {
                loginBtn.disabled = true;
                loginBtn.classList.remove('btn-primary');
                loginBtn.classList.add('btn-secondary');
            }
        }

        function togglePassword() {
            const passwordField = document.getElementById('<%= password.ClientID %>');
            const toggleBtn = event.target.closest('button');
            const icon = toggleBtn.querySelector('i');

            if (passwordField.type === 'password') {
                passwordField.type = 'text';
                icon.classList.remove('fa-eye');
                icon.classList.add('fa-eye-slash');
            } else {
                passwordField.type = 'password';
                icon.classList.remove('fa-eye-slash');
                icon.classList.add('fa-eye');
            }
        }

        // Validación inicial al cargar la página
        document.addEventListener('DOMContentLoaded', function () {
            validateForm();
        });
    </script>
</asp:Content>

