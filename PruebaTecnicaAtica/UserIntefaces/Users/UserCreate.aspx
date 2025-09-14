<%@ Page Title="Alta de Usuario" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserCreate.aspx.cs" Inherits="UserInterfaces.Users.UserCreate" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid vh-100 bg-light">

        <div class="row h-100 justify-content-center">
            <div class="col-md-10 col-lg-8 col-xl-6 d-flex justify-content-center align-items-start bg-light pt-4">
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
                                    <label class="form-label fw-bold">Nombre <span class="text-danger">*</span></label>
                                    <asp:TextBox CssClass="form-control required-field" ID="firstName" runat="server" placeholder="Ingrese el nombre"></asp:TextBox>
                                    <div class="invalid-feedback">El nombre es obligatorio</div>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label fw-bold">Apellido <span class="text-danger">*</span></label>
                                    <asp:TextBox CssClass="form-control required-field" ID="lastName" runat="server" placeholder="Ingrese el apellido"></asp:TextBox>
                                    <div class="invalid-feedback">El apellido es obligatorio</div>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label fw-bold">Email <span class="text-danger">*</span></label>
                                    <asp:TextBox CssClass="form-control required-field" type="email" ID="email" runat="server" placeholder="Ingrese el email"></asp:TextBox>
                                    <div class="invalid-feedback">El email es obligatorio</div>
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

    <!-- Scripts para validación -->
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const form = document.querySelector('form');
            const requiredFields = document.querySelectorAll('.required-field');
            const submitButton = document.querySelector('#createUser');

            // Función para validar un campo
            function validateField(field) {
                const value = field.value.trim();
                const isValid = value.length > 0;
                
                if (isValid) {
                    field.classList.remove('is-invalid');
                    field.classList.add('is-valid');
                } else {
                    field.classList.remove('is-valid');
                    field.classList.add('is-invalid');
                }
                
                return isValid;
            }

            // Validación en tiempo real
            requiredFields.forEach(field => {
                field.addEventListener('blur', function() {
                    validateField(this);
                });

                field.addEventListener('input', function() {
                    if (this.classList.contains('is-invalid')) {
                        validateField(this);
                    }
                });
            });

            // Validación al enviar el formulario
            if (submitButton) {
                submitButton.addEventListener('click', function(e) {
                    let allValid = true;
                    
                    requiredFields.forEach(field => {
                        if (!validateField(field)) {
                            allValid = false;
                        }
                    });

                    if (!allValid) {
                        e.preventDefault();
                        // Scroll al primer campo inválido
                        const firstInvalid = document.querySelector('.is-invalid');
                        if (firstInvalid) {
                            firstInvalid.scrollIntoView({ behavior: 'smooth', block: 'center' });
                            firstInvalid.focus();
                        }
                    }
                });
            }
        });
    </script>
</asp:Content>
