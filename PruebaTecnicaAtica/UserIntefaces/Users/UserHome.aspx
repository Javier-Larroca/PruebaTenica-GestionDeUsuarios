<%@ Page Title="Inicio" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserHome.aspx.cs" Inherits="UserInterfaces.Users.UserHome" %>

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
                <div class="row g-4 w-100">
                    <div class="col-12">
                        <div class="card shadow-lg border-0 h-100" style="min-height: 200px; cursor: pointer;"
                            onclick="window.location.href='UserCreate.aspx'">
                            <div class="card-body d-flex flex-column justify-content-center align-items-center p-5">
                                <div class="text-center">
                                    <div class="bg-primary rounded-circle d-inline-flex align-items-center justify-content-center mb-3"
                                        style="width: 80px; height: 80px;">
                                        <i class="fas fa-user-plus text-white" style="font-size: 2rem;"></i>
                                    </div>
                                    <h3 class="fw-bold text-dark mb-2">Crear Usuario</h3>
                                    <p class="text-muted mb-0">Registra nuevos usuarios en el sistema</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-12">
                        <div class="card shadow-lg border-0 h-100" style="min-height: 200px; cursor: pointer;"
                            onclick="window.location.href='UserList.aspx'">
                            <div class="card-body d-flex flex-column justify-content-center align-items-center p-5">
                                <div class="text-center">
                                    <div class="bg-secondary rounded-circle d-inline-flex align-items-center justify-content-center mb-3"
                                        style="width: 80px; height: 80px;">
                                        <i class="fas fa-users-cog text-white" style="font-size: 2rem;"></i>
                                    </div>
                                    <h3 class="fw-bold text-dark mb-2">Administrar Usuario</h3>
                                    <p class="text-muted mb-0">Gestiona y administra usuarios existentes</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const cards = document.querySelectorAll('.card[onclick]');
            cards.forEach(card => {
                card.addEventListener('mouseenter', function () {
                    this.style.transform = 'translateY(-5px)';
                    this.style.transition = 'transform 0.3s ease';
                });

                card.addEventListener('mouseleave', function () {
                    this.style.transform = 'translateY(0)';
                });
            });
        });
    </script>
</asp:Content>
