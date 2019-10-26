<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CommercialSystem._Default" %>



<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
    form{
    margin: 0 auto;
    text-align: center;
    border-radius: 10px;
    border: 1px solid #666666;
    width: 800px;
    }
    body{
        background: antiquewhite;
    }
    </style>

  <form>
  <div class="form-group row">
    <label for="inputUser" class="col-sm-2 col-form-label">Usuario</label>
    <div class="col-sm-10">
      <input type="email" class="form-control" id="inputEmail3" placeholder="Usuario">
    </div>
  </div>
  <div class="form-group row">
    <label for="inputPassword" class="col-sm-2 col-form-label">Contraseña</label>
    <div class="col-sm-10">
      <input type="password" class="form-control" id="inputPassword3" placeholder="Contraseña">
    </div>
  </div>
    <div class="form-group row">
     <div class="col-sm-10">
        <a href="MenuPrincipal.aspx" class="btn btn-primary btn-lg active" role="button" aria-pressed="true">Iniciar Sesion</a></div>
  </div>
</form>
</asp:Content>

