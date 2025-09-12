<%@ Page Title="Alta de Usuario" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserCreate.aspx.cs" Inherits="UserInterfaces.Users.UserCreate" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-4">
        <h2>Alta de Usuario</h2>

        <div class="mb-3">
            <label class="form-label">Nombre</label>
            <asp:TextBox CssClass="form-control inputSize" ID="firstName" runat="server"></asp:TextBox>
        </div>
        <div class="mb-3">
            <label class="form-label">Apellido</label>
            <asp:TextBox CssClass="form-control inputSize" ID="lastName" runat="server"></asp:TextBox>
        </div>

        <div class="mb-3">
            <label for="txtEmail" class="form-label">Email</label>
            <asp:TextBox CssClass="form-control inputSize" type="email" ID="email" runat="server"></asp:TextBox>
        </div>

        <div class="mb-3">
            <label class="form-label">Contraseña</label>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" />
        </div>

        <div class="mb-3">
            <label class="form-label">Confirmar contraseña</label>
            <asp:TextBox ID="txtPasswordConfirm" runat="server" TextMode="Password" CssClass="form-control" />
        </div>


        <br />

        <asp:Button CssClass="btn btn-primary" Text="Crear" ID="createUser" OnClick="createUser_Click" runat="server" />

        <div style="display: flex; margin-top: 10px;">
            <asp:Label CssClass="alert alert-warning" Visible="false" ID="Warning" runat="server" Text="Debe completar todos los campos obligatorios">
            </asp:Label>
        </div>

        <div style="display: flex; margin-top: 10px">
            <asp:Label CssClass="alert alert-success" Visible="false" ID="SuccessUser" runat="server">
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </asp:Label>
        </div>
        <div style="display: flex; margin-top: 10px">
            <asp:Label CssClass="alert alert-success" Visible="false" ID="SuccessList" runat="server">
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </asp:Label>
        </div>
        <div style="display: flex; margin-top: 10px">
            <asp:Label CssClass="aler alert-danger" Visible="false" ID="FailUser" runat="server">
            </asp:Label>
        </div>
    </div>
</asp:Content>
