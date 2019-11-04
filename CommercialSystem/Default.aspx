<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CommercialSystem._Default" %>



<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
    form{
    text-align: center;
    margin-bottom:auto;
    width: 800px;
    }
    label{
        text-align:center;
    }
    body{
        background: antiquewhite;
    }
 
    </style>
    <h1>Registro Usuario <span class="badge badge-secondary"></span></h1>
    <br />
    <br />
 <form class="form">
  <div class="form-group row">
    <p>Password</p>
    <div class="col-sm-10">
      <input type="text" style="width:500px" class="form-control" id="inputUser" placeholder="Usuario">
    </div>
  </div>
  <div class="form-group row">
    <p>Usuaio</p>
    <div class="col-sm-10">
      <input type="password" style="width:500px" class="form-control" id="inputPassword3" placeholder="Contraseña">
    </div>
  </div>
    <div class="form-group row">
     <div class="col-sm-10">
        <a href="MenuPrincipal.aspx" class="btn btn-primary btn-lg active" role="button" aria-pressed="true">Iniciar Sesion</a></div>
  </div>
</form>
</asp:Content>

