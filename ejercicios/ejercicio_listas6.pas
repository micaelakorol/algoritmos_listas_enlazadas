/*
 2. Implementar un programa que lea y almacene información de clientes de una empresa aseguradora
 automotriz. De cada cliente se lee: código de cliente, DNI, apellido, nombre, código de póliza
 contratada (1..6) y monto básico que abona mensualmente. La lectura finaliza cuando llega el cliente
 con código 1122, el cual debe procesarse.
 La empresa dispone de una tabla donde guarda un valor que representa un monto adicional que el
 cliente debe abonar en la liquidación mensual de su seguro, de acuerdo al código de póliza que tiene
 contratada.
 Una vez finalizada la lectura de todos los clientes, se pide:
 a. Informar para cada cliente DNI, apellido, nombre y el monto completo que paga mensualmente
 por su seguro automotriz (monto básico + monto adicional).
 b. Informar apellido y nombre de aquellos clientes cuyo DNI contiene al menos dos dígitos 9.
 c. Realizar un módulo que reciba un código de cliente, lo busque (seguro existe) y lo elimine de la
 estructura.
*/


program ejercicio6;

type 

vMontoAdicional = array[1..6] of real;

cliente = record 
codCliente:integer
dni:integer
apellido:string
nombre:string
codPoliza:1..6
monto:real 

lista = ^nodo; 

nodo = record 
dato:cliente
sig:lista 

procedure leerCliente(c:cliente)
begin 
 read(c.codCliente);
 read(c.dni);
 read(c.apellido);
 read(c.nombre);
 read(c.codPoliza);
 read(c.monto);
end

procedure procesarClientes(var l:lista)
var 
c:cliente;
begin 
repeat
leerCliente(c);
agregarALaLista(l,c);
until(c.codCliente = 1122);
end;

procedure agregarALaLista(var l:lista; c:cliente)
var 
 nuevo:lista;
begin
 new(nuevo); nuevo^.dato := c; nuevo^.sig := nil;
 if(l = nil)then 
  l := nuevo;
  else 
   nuevo^.sig := l; // engancha el nodo al principio
   l := nuevo; 
end;

procedure procesarLista(l:lista; vMontos:vMontoAdicional)
var 
 montoTotal:real;
 begin
  while(l <> nil)do 
  begin
  montoTotal := 0;
  montoTotal := l^.dato.monto + vMontos[l^.dato.codPoliza]; // busca el valor en la posicion del vector.
  write(l^.dato.nombre + l^.dato.apellido + 'monto total: ' + montoTotal);
  // inciso b:
  if(descomponer(l^.dato.dni))then 
  begin
   write(l^.dato.nombre + l^.dato.apellido); 
  end;  
   l := l^.sig; 
  end; 
 end;

// Descompongo el dni y verifico si tiene al menos dos digitos 9.
 function descomponer(dni:integer):boolean 
 var 
  digito,contador:integer;
 begin 
  contador := 0; // contará los digitos que sean= = 9.
  while(dni <> 0)do 
  begin 
   // digito toma el último numero:
   digito := dni mod 10; 
   if(digito = 9) then 
   begin 
    contador := contador + 1;
   end; 
   dni := dni div 10; // elimino el último digito.
  end;
  // Retorno de función:
   if(contador >= 2)then 
    descomponer := true;
   else 
    descomponer := false;
 end;

procedure eliminarCliente(var l:lista; cod:integer)
var 
 ant,act:lista;
begin 
 act := l;
 while(act <> nil)do 
 begin
  if(act^.dato.codCliente <> cod)then 
  begin
   ant:=act;
   act:= act^.sig; 
  end; 
  // Si el cod actual NO es distinto del cod que busco (son iguales, lo encontré)
  else 
  // Está primero en la lista:
   if (act = l)then  
    l := l^.sig;
    else 
     begin
      ant^.sig := act^.sig; 
      dispose(act);
     end;
 end;
end;


var 
l:lista;
vMontos:vMontoAdicional; // Ya dispone los montos adicionales.
cod:integer;
begin
l := nil; 
cod:= 1133;
procesarClientes(l);
procesarLista(l,vMontos);
eliminarCliente(l,cod);
end.