<%@ Page Title="Alta de Usuario" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserCreate.aspx.cs" Inherits="UserInterfaces.Users.UserCreate" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid vh-100 bg-light">
        <div class="row h-100 justify-content-center">
            <div class="col-md-10 col-lg-8 col-xl-6 d-flex justify-content-center align-items-start bg-light pt-4">
                <div class="w-100">
                    <div class="card shadow-lg border-0">
                        <div class="card-header bg-primary text-white text-center">
                            <h4 class="mb-0"><i class="fas fa-user-plus me-2"></i>Alta de Usuario</h4>
                        </div>
                        <div class="card-body p-4">
                            <asp:Panel runat="server" DefaultButton="createUser">
                                <div class="mb-3">
                                    <label class="form-label fw-bold">Nombre <span class="text-danger">*</span></label>
                                    <asp:TextBox CssClass="form-control" ID="firstName" runat="server" placeholder="Ingrese el nombre"></asp:TextBox>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label fw-bold">Apellido <span class="text-danger">*</span></label>
                                    <asp:TextBox CssClass="form-control" ID="lastName" runat="server" placeholder="Ingrese el apellido"></asp:TextBox>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label fw-bold">Email <span class="text-danger">*</span></label>
                                    <asp:TextBox CssClass="form-control" type="email" ID="email" runat="server" placeholder="Ingrese el email"></asp:TextBox>
                                </div>

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
                            </asp:Panel>

                            <div class="mt-3">
                                <asp:Label CssClass="alert alert-danger d-block" Visible="false" ID="FailUser" runat="server"></asp:Label>
                                <asp:Label CssClass="alert alert-warning d-block" Visible="false" ID="Warning" runat="server"></asp:Label>
                                <asp:Label CssClass="alert alert-success d-block" Visible="false" ID="SuccessUser" runat="server"></asp:Label>
                                <asp:Label CssClass="alert alert-success d-block" Visible="false" ID="SuccessList" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
