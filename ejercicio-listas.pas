 {/*5. Realizar un programa que lea y almacene la información de productos de un supermercado. De cada
 producto se lee: código, descripción, stock actual, stock mínimo y precio. La lectura finaliza cuando se ingresa
 el código-1, que no debe procesarse. Una vez leída y almacenada toda la información, calcular e informar:
 a. Porcentaje de productos con stock actual por debajo de su stock mínimo.
 b. Descripción de aquellos productos con código compuesto por al menos tres dígitos pares.
 c. Código de los dos productos más económicos.*/}

program ejercicio_practica

type lista = ^nodo;

producto = record 
cod:integer
descripcion:string
stockAct:integer
stockMin:integer
precio:real 
end;

nodo = record
dato: producto
sig:lista
end;

procedure generarLista(var l:lista)
var 
 p:producto;
 begin
 leerProductos(p);
 while(p.cod <> -1)do 
  agregarALaLista(l,p);
  leerProductos(p) 
 end
 
 procedure agregarALaLista(var l:lista, p:producto)
 var 
  nodo:lista;
 begin
  new(nodo); nodo^.dato := p; nodo^.sig := nil;
  if(l = nil) then l := nodo;
  else 
   nodo^.sig := l;
   l := nodo;
 end

 procedure leerProductos(p:producto)
 begin
  read(p.cod);
  if (p.cod <> -1)then
   read(p.descripcion);
   read(p.stockAct);
   read(p.stockMin);
   read(p.precio);
   read(p.cod);
 end

procedure recorrerLista(l:lista, var contarStock, var totalProd)
var 
 dig:integer;
 cod1,cod2:integer;
begin
 dig := 0;
 while(l <> nil)do 
 begin
 if(l^.dato.stockAct > l^.dato.stockAct)then 
 begin 
   contarStock := contarStock + 1;
 end
 totalProd := totalProd + 1;
 calcularMinimos(l^.dato.cod, l^.dato.precio,cod1,cod2);
 if ( descomponerCod(l^.dato.cod)) then
 begin 
  write(l^.dato.descripcion); 
 end
 l := l^.sig;
end
end

function porcentaje(contarStock:integer, totalProd:integer):integer
var 
 retorno:integer;
begin 
 retorno := totalProd div contarStock * 100;
porcentaje := retorno;
end 

function descomponerCod(cod:integer):boolean
var 
 digito,contador:integer;
 retorno:boolean;
begin 
 contador := 0;
 retorno = false;
 while(cod <> 0) do 
 begin 
  digito := cod mod 10;
  if (digito mod 2 = 0) then 
  begin 
   contador := contador + 1;
  end 
  cod := cod div 10;
 end
  if contador >= 3 then retorno := true;
end

procedure calcularMinimos(cod:integer, precio:real, var cod1:integer, var cod2:integer)
var 
 min1,min2:integer;
begin 
 min1 := 9999;
 min2 := 9999;
 if(precio < min1)then 
 begin 
  min2 := min1; 
  min1 := precio;
  cod2 := cod1;
  cod1 := cod;
  else 
   if(precio < min2)then 
    max2:= precio;
    cod2 := cod;  
 end
  write(cod1,cod2); // informar los cod minimos.
end

var
l:lista;
contarStock,totalProd:integer;
begin
l := nil;
contarStock:=0;
totalProd:=0;
generarLista(l);
recorrerLista(l,contarStock,totalProd);
porcentaje(contarStock,totalProd);
end
