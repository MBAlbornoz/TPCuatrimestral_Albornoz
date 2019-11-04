<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FormCliente.aspx.cs" Inherits="CommercialSystem.FormCliente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Sign Up Form by Colorlib</title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="Content/material-design-iconic-font.min.css">
    <link rel="stylesheet" href="Content/jquery-ui.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="Content/style.css">
</head>
<body style="background:antiquewhite">

    <div class="main">
        <section class="signup">
            <!-- <img src="images/signup-bg.jpg" alt=""> -->
            <div class="container">
                <div class="signup-content">
                    <form method="POST" id="signup-form" class="signup-form">
                        <div class="form-row">
                            <div class="form-group">
                                <label for="first_name">Nombre</label>
                                <input type="text" class="form-input" name="first_name" id="first_name" />
                            </div>
                            <div class="form-group">
                                <label for="last_name">Apellido</label>
                                <input type="text" class="form-input" name="last_name" id="last_name" />
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group form-icon">
                                <label for="birth_date">Fecha Nacimiento</label>
                                <input type="text" class="form-input" name="birth_date" id="birth_date" placeholder="MM-DD-YYYY" />
                            </div>
                            <div class="form-radio">
                                <label for="gender">Sexo</label>
                                <div class="form-flex">
                                    <input type="radio" name="gender" value="Masculino" id="male" checked="checked" />
                                    <label for="male">Masculino</label>
                                    <input type="radio" name="gender" value="Femenino" id="female" />
                                    <label for="female">Femenino</label>
                                    <input type="radio" name="gender" value="other" id="other" />
                                    <label for="other">Otro</label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="phone_number">Telefono</label>
                            <input type="number" class="form-input" name="phone_number" id="phone_number" />
                        </div>
                        <div class="form-text">
                            <a href="#" class="add-info-link"><i class="zmdi zmdi-chevron-right"></i>Información Adicional</a>
                            <div class="add_info">
                                <div class="form-group">
                                    <label for="email">Email</label>
                                    <input type="email" class="form-input" name="email" id="email"/>
                                </div>
                                 <div class="form-group">
                                    <label for="direccion">Direccion</label>
                                    <input type="text" class="form-input" name="Direccion" id="direccion"/>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <%--<input type="submit" name="submit" id="submit" class="form-submit" value="Guardar"/>---%>
                            <asp:Button ID="BtnGuardar" runat="server" Text="Guardar" OnClick="BtnGuardar_Click" class="form-submit"/>
                           
                        </div>
                         <div class="form-group">
                             <%--<input type="submit" name="submit" id="cancel" class="form-submit" value="Cancelar" onclick="window.location.href ='MenuPrincipal.aspx'"/>--%>
                             <%---<asp:Button ID="BtnCancelar" runat="server" Text="Otro" OnClick="BtnCancelar_Click" />---%>
                             <input type="button" value="Cancelar" class="form-submit" onclick="window.location.href = 'PageCliente.aspx'" />
                         </div>
                    </form>
                </div>
            </div>
        </section>

    </div>

    <!-- JS -->

        <script src="Scripts/jquery.min.js"></script>
        <script src="Scripts/jquery-ui.min.js"></script>
        <script src="Scripts/jquery.validate.min.js"></script>
        <script src="Scripts/additional-methods.min.js"></script>
        <script src="Scripts/main.js"></script>
</body>
</html>
</asp:Content>
