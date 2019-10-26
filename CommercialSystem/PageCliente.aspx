<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PageCliente.aspx.cs" Inherits="CommercialSystem.PageCliente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
       
        .menuABM{
            float:left;
            margin: 0px 0px 15px 15px;
        }
        .buscarABM{
            text-align:center;
            margin-left:60%;
            margin-right:10px;
            text-anchor:start;
            margin-top:10px;   
        }
        
        .ImgUser{
             float:left;
            margin: 0px 40px 15px 30px;
        }
        
       * { 
	    margin: 0; 
	    padding: 0; 
       }
        body { 
	    font: 14px/1.4 Georgia, Serif; 
        }
        #page-wrap {
	    margin: 50px;
        }
        p {
	        margin: 20px 0; 
        }   

	/* 
	Generic Styling, for Desktops/Laptops 
	*/
	    table { 
		    width: 100%; 
		    border-collapse: collapse; 
	    }
	/* Zebra striping */
	    tr:nth-of-type(odd) { 
		    background: #eee; 
	    }
	    th { 
		    background: #333; 
		    color: white; 
		    font-weight: bold; 
	    }
	    td, th { 
		    padding: 6px; 
		    border: 1px solid #ccc; 
		    text-align: left; 
	    }

        .auto-style1 {
            margin-left: 40px;
        }

       </style>



    <div class="container body-content">
        <a href="#" class="menuABM" title="Nuevo"><img src="Imagenes/new-file_40454.png"><div>Nuevo</div></a> 
        <a href="#" class="menuABM" title="Editar"><img src="Imagenes/Edit.png"><div>Editar</div></a>
        <a href="#" class="menuABM" title="Eliminar"><img src="Imagenes/Delete.png"><div>Eliminar</div></a>
        <a href="MenuPrincipal.aspx" class="menuABM" title="Cancelar"><img src="Imagenes/Cancel.png"><div>Cancelar</div></a> 
    </div>
    <div></div>
    <asp:TextBox runat="server" AutoPostBack="true" BorderStyle="Solid" BorderColor="#0066ff" Height="30px" Width="457px" CssClass="buscarABM"></asp:TextBox><asp:Button runat="server" BorderStyle="Groove" Width="112px" BorderWidth="2px" Font-Bold="True" Font-Italic="False" Font-Size="Medium" ForeColor="Black" Text="Buscar"/>

    <h1>REGISTRO CLIENTE</h1>
    <div><img src="Imagenes/User.png" style="border: thin dashed #000080; -moz-border-bottom-colors:cornflowerblue; height: 77px; width: 68px;" class="ImgUser" alt="imgCliente"/>
        <p class="auto-style1">
        <label>Nombre </label><asp:TextBox runat="server" Width="256px"></asp:TextBox>
        <label>Apellido</label><asp:TextBox runat="server" Width="324px"></asp:TextBox>
        <br />
        <label>DNI/CUIT</label><asp:TextBox runat="server"></asp:TextBox>
        <label>Fecha Nacimiento</label><asp:ListBox runat="server" Height="20px" Width="50px" AutoPostBack="true" CausesValidation="true"></asp:ListBox>
        <asp:ListBox runat="server" Height="20px" Width="50px" AutoPostBack="true" CausesValidation="true"></asp:ListBox>
        <asp:ListBox runat="server" Height="20px" Width="90px" AutoPostBack="true" CausesValidation="true"></asp:ListBox>
        <label>Sexo</label><asp:ListBox runat="server" Height="20px" Width="50px" AutoPostBack="true" CausesValidation="true"></asp:ListBox></p>
    </div>
    
  
    <br />
	<h2 style="margin: 0px 10px 30px 80px">Table</h2>		
	<table>
		<tr>
			<th>COLUMNA 1</th>
			<th>COLUMNA 2</th>
			<th>COLUMNA 3</th>
		</tr>
		<tr>
			<td>FILA 1</td>
			<td>FILA 2</td>
			<td>FILA 3</td>
		</tr>
		<tr>
		    <td>FILA 1</td>
			<td>FILA 2</td>
			<td>FILA 3</td>
		</tr>
		<tr>
		    <td>FILA 1</td>
			<td>FILA 2</td>
			<td>FILA 3</td>
		</tr>
		<tr>
		    <td>FILA 1</td>
			<td>FILA 2</td>
			<td>FILA 3</td>
		</tr>
		<tr>
		    <td>FILA 1</td>
			<td>FILA 2</td>
			<td>FILA 3</td>
		</tr>
	</table>	


</asp:Content>
