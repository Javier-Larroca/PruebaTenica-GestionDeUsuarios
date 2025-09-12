<%@ Page Title="Registrate" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserRegister.aspx.cs" Inherits="UserIntefaces.Users.UserRegister" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
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
                <div class="card shadow-lg border-0" style="width: 500px; min-height: 600px;">
                    <div class="card-body p-5">
                        <!-- Título del formulario -->
                        <div class="text-center mb-4">
                            <h2 class="fw-bold text-dark mb-2">Crea una cuenta</h2>
                            <p class="text-muted">Es rápido y fácil.</p>
                        </div>

                        <form id="registerForm">
                            <!-- Nombre y Apellido en la misma fila -->
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label class="form-label">Nombre</label>
                                    <asp:TextBox CssClass="form-control" ID="firstName" runat="server"
                                        placeholder="Nombre"></asp:TextBox>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">Apellido</label>
                                    <asp:TextBox CssClass="form-control" ID="lastName" runat="server"
                                        placeholder="Apellido"></asp:TextBox>
                                </div>
                            </div>

                            <!-- Fecha de nacimiento -->
                            <div class="mb-3">
                                <label class="form-label">Fecha de nacimiento</label>
                                <div class="row">
                                    <div class="col-4">
                                        <asp:DropDownList CssClass="form-select" ID="dayBirth" runat="server">
                                            <asp:ListItem Value="" Text="Día"></asp:ListItem>
                                            <asp:ListItem Value="1" Text="1"></asp:ListItem>
                                            <asp:ListItem Value="2" Text="2"></asp:ListItem>
                                            <asp:ListItem Value="3" Text="3"></asp:ListItem>
                                            <asp:ListItem Value="4" Text="4"></asp:ListItem>
                                            <asp:ListItem Value="5" Text="5"></asp:ListItem>
                                            <asp:ListItem Value="6" Text="6"></asp:ListItem>
                                            <asp:ListItem Value="7" Text="7"></asp:ListItem>
                                            <asp:ListItem Value="8" Text="8"></asp:ListItem>
                                            <asp:ListItem Value="9" Text="9"></asp:ListItem>
                                            <asp:ListItem Value="10" Text="10"></asp:ListItem>
                                            <asp:ListItem Value="11" Text="11"></asp:ListItem>
                                            <asp:ListItem Value="12" Text="12"></asp:ListItem>
                                            <asp:ListItem Value="13" Text="13"></asp:ListItem>
                                            <asp:ListItem Value="14" Text="14"></asp:ListItem>
                                            <asp:ListItem Value="15" Text="15"></asp:ListItem>
                                            <asp:ListItem Value="16" Text="16"></asp:ListItem>
                                            <asp:ListItem Value="17" Text="17"></asp:ListItem>
                                            <asp:ListItem Value="18" Text="18"></asp:ListItem>
                                            <asp:ListItem Value="19" Text="19"></asp:ListItem>
                                            <asp:ListItem Value="20" Text="20"></asp:ListItem>
                                            <asp:ListItem Value="21" Text="21"></asp:ListItem>
                                            <asp:ListItem Value="22" Text="22"></asp:ListItem>
                                            <asp:ListItem Value="23" Text="23"></asp:ListItem>
                                            <asp:ListItem Value="24" Text="24"></asp:ListItem>
                                            <asp:ListItem Value="25" Text="25"></asp:ListItem>
                                            <asp:ListItem Value="26" Text="26"></asp:ListItem>
                                            <asp:ListItem Value="27" Text="27"></asp:ListItem>
                                            <asp:ListItem Value="28" Text="28"></asp:ListItem>
                                            <asp:ListItem Value="29" Text="29"></asp:ListItem>
                                            <asp:ListItem Value="30" Text="30"></asp:ListItem>
                                            <asp:ListItem Value="31" Text="31"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-4">
                                        <asp:DropDownList CssClass="form-select" ID="monthBirth" runat="server">
                                            <asp:ListItem Value="" Text="Mes"></asp:ListItem>
                                            <asp:ListItem Value="1" Text="ene"></asp:ListItem>
                                            <asp:ListItem Value="2" Text="feb"></asp:ListItem>
                                            <asp:ListItem Value="3" Text="mar"></asp:ListItem>
                                            <asp:ListItem Value="4" Text="abr"></asp:ListItem>
                                            <asp:ListItem Value="5" Text="may"></asp:ListItem>
                                            <asp:ListItem Value="6" Text="jun"></asp:ListItem>
                                            <asp:ListItem Value="7" Text="jul"></asp:ListItem>
                                            <asp:ListItem Value="8" Text="ago"></asp:ListItem>
                                            <asp:ListItem Value="9" Text="sep"></asp:ListItem>
                                            <asp:ListItem Value="10" Text="oct"></asp:ListItem>
                                            <asp:ListItem Value="11" Text="nov"></asp:ListItem>
                                            <asp:ListItem Value="12" Text="dic"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-4">
                                        <asp:DropDownList CssClass="form-select" ID="yearBirth" runat="server">
                                            <asp:ListItem Value="" Text="Año"></asp:ListItem>
                                            <asp:ListItem Value="2025" Text="2025"></asp:ListItem>
                                            <asp:ListItem Value="2024" Text="2024"></asp:ListItem>
                                            <asp:ListItem Value="2023" Text="2023"></asp:ListItem>
                                            <asp:ListItem Value="2022" Text="2022"></asp:ListItem>
                                            <asp:ListItem Value="2021" Text="2021"></asp:ListItem>
                                            <asp:ListItem Value="2020" Text="2020"></asp:ListItem>
                                            <asp:ListItem Value="2019" Text="2019"></asp:ListItem>
                                            <asp:ListItem Value="2018" Text="2018"></asp:ListItem>
                                            <asp:ListItem Value="2017" Text="2017"></asp:ListItem>
                                            <asp:ListItem Value="2016" Text="2016"></asp:ListItem>
                                            <asp:ListItem Value="2015" Text="2015"></asp:ListItem>
                                            <asp:ListItem Value="2014" Text="2014"></asp:ListItem>
                                            <asp:ListItem Value="2013" Text="2013"></asp:ListItem>
                                            <asp:ListItem Value="2012" Text="2012"></asp:ListItem>
                                            <asp:ListItem Value="2011" Text="2011"></asp:ListItem>
                                            <asp:ListItem Value="2010" Text="2010"></asp:ListItem>
                                            <asp:ListItem Value="2009" Text="2009"></asp:ListItem>
                                            <asp:ListItem Value="2008" Text="2008"></asp:ListItem>
                                            <asp:ListItem Value="2007" Text="2007"></asp:ListItem>
                                            <asp:ListItem Value="2006" Text="2006"></asp:ListItem>
                                            <asp:ListItem Value="2005" Text="2005"></asp:ListItem>
                                            <asp:ListItem Value="2004" Text="2004"></asp:ListItem>
                                            <asp:ListItem Value="2003" Text="2003"></asp:ListItem>
                                            <asp:ListItem Value="2002" Text="2002"></asp:ListItem>
                                            <asp:ListItem Value="2001" Text="2001"></asp:ListItem>
                                            <asp:ListItem Value="2000" Text="2000"></asp:ListItem>
                                            <asp:ListItem Value="1999" Text="1999"></asp:ListItem>
                                            <asp:ListItem Value="1998" Text="1998"></asp:ListItem>
                                            <asp:ListItem Value="1997" Text="1997"></asp:ListItem>
                                            <asp:ListItem Value="1996" Text="1996"></asp:ListItem>
                                            <asp:ListItem Value="1995" Text="1995"></asp:ListItem>
                                            <asp:ListItem Value="1994" Text="1994"></asp:ListItem>
                                            <asp:ListItem Value="1993" Text="1993"></asp:ListItem>
                                            <asp:ListItem Value="1992" Text="1992"></asp:ListItem>
                                            <asp:ListItem Value="1991" Text="1991"></asp:ListItem>
                                            <asp:ListItem Value="1990" Text="1990"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>

                            <!-- Email -->
                            <div class="mb-3">
                                <label class="form-label">Email</label>
                                <asp:TextBox CssClass="form-control" type="email" ID="email" runat="server"
                                    placeholder="correo electrónico"></asp:TextBox>
                            </div>

                            <!-- Contraseña nueva -->
                            <div class="mb-3">
                                <label class="form-label">Contraseña nueva</label>
                                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"
                                    CssClass="form-control" placeholder="Contraseña nueva" />
                            </div>

                            <!-- Repetir contraseña -->
                            <div class="mb-3">
                                <label class="form-label">Confirmar contraseña</label>
                                <asp:TextBox ID="txtPasswordConfirm" runat="server" TextMode="Password"
                                    CssClass="form-control" placeholder="Repite tu contraseña" />
                            </div>

                            <!-- Botón Registrarte -->
                            <div class="mb-4">
                                <asp:Button CssClass="btn btn-success w-100 py-2 fw-bold" Text="Registrarte"
                                    ID="createUser" OnClick="createUser_Click" runat="server" />
                            </div>

                            <!-- Enlace ¿Ya tienes una cuenta? -->
                            <div class="text-center">
                                <a href="../Login.aspx" class="text-primary text-decoration-underline">¿Ya tienes una cuenta?</a>
                            </div>

                            <!-- Mensajes de estado -->
                            <div class="mt-4 text-center">
                                <asp:Label CssClass="alert alert-warning d-inline-block" Visible="false" ID="Warning"
                                    runat="server" Text="Debe completar todos los campos obligatorios"></asp:Label>
                            </div>

                            <div class="mt-3 text-center">
                                <asp:Label CssClass="alert alert-success d-inline-block" Visible="false" ID="SuccessUser"
                                    runat="server"></asp:Label>
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
