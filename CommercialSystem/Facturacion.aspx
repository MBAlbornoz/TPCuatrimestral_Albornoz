<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Facturacion.aspx.cs" Inherits="CommercialSystem.Facturacion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<style>@import url(http://fonts.googleapis.com/css?family=Bree+Serif);
  body, h1, h2, h3, h4, h5, h6{
    font-family: 'Bree Serif', serif;
  }

  </style>    

<div class="col-xs-6">
<h1><a href="#"><img alt="" src="Imagenes/commerce.png" width="200" height="100"/></a>
<a><pre style="margin:0 0px -130px 110px; width:580px;">Datos de la Empresa</pre></a>
</h1>
<div>
</div>
</div>
<div class="col-xs-6 text-right">
<h1>FACTURA</h1>
<h1><small>Factura #001</small></h1>
</div>
 <pre>Medios de Pago</pre>
<pre><!-- / fin de sección de datos del Cliente  -->
Detalles del Cliente</pre>
<table class="table table-bordered">
<thead>
<tr>
<th>
<h4>Producto</h4>
</th>
<th>
<h4>Descripción</h4>
</th>
<th>
<h4>Cantidad</h4>
</th>
<th>
<h4>Precio</h4>
</th>
<th>
<h4>Sub-Total</h4>
</th>
</tr>
</thead>
<tbody>
<tr>
<td>Artículo</td>
<td><a href="#"> Título de su artículo aquí </a></td>
<td class=" text-right ">-</td>
<td class=" text-right ">200.00 €</td>
<td class=" text-right ">200.00 €</td>
</tr>
<tr>
<td>Plantilla de diseño</td>
<td><a href="#"> Detalles del proyecto aquí </a></td>
<td class="text-right">10</td>
<td class="text-right ">75.00 €</td>
<td class="text-right ">750.00 €</td>
</tr>
<tr>
<td>Desarrollo</td>
<td><a href="#"> Plugin WordPress </a></td>
<td class="text-right ">5</td>
<td class="text-right">50.00 €</td>
<td class="text-right">250.00 €</td>
</tr>
</tbody>
</table>
<pre>Sección Totales</pre>
<div class="row text-right">
<div class="col-xs-3 col-xs-offset-7"><strong>
Sub Total:
Impuestos (IVA 21%):
Total:
</strong></div>
<div class="col-xs-2"><strong>
1,200.00 €
252.00 €
1,452.00 €
</strong></div>
</div>
<pre>Sección detalles de pago</pre>
<div class="row">
</div>
    <div class="panel panel-info">
<div class="panel-heading">
<h4>Datos Adicionales</h4>
</div>
<div class="panel-body">
 Su nombre
 Nombre 
 Número de cuenta: 12345678
 IVA: ------</div>
</div>

</asp:Content>
