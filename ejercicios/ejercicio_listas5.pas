/*
 Una productora nacional realiza un casting de personas para la selección de actores extras de una
 nueva película, para ello se debe leer y almacenar la información de las personas que desean
 participar de dicho casting. De cada persona se lee: DNI, apellido y nombre, edad y el código de
 género de actuación que prefiere (1: drama, 2: romántico, 3: acción, 4: suspenso, 5: terror). 
 La lectura finaliza cuando llega una persona con DNI 33555444, la cual debe procesarse.
 Una vez finalizada la lectura de todas las personas, se pide:
 a. Informar la cantidad de personas cuyo DNI contiene más dígitos pares que impares.
 b. Informar los dos códigos de género más elegidos.
 c. Realizar un módulo que reciba un DNI, lo busque y lo elimine de la estructura. El DNI puede no
 existir. Invocar dicho módulo en el programa principal
*/

program ejercicio5;

type 

vector = array [1..5] of integer;

persona = record 
dni:integer;
apellido:string;
nombre:string;
edad:integer;
cod:1..5;
end;

lista = ^nodo;

nodo = record 
elem:persona;
sig:lista;
end;

procedure leerPersona(var p:persona)
begin
 read(p.dni);
 read(p.apellido);
 read(p.nombre);
 read(p.edad);
 read(p.cod); 
end;

procedure generarLista(var l:lista)
var 
 p:persona;
begin
repeat 
leerPersona(p);
agregarALaLista(p,l);
until(p.dni = 33555444); // Finaliza si el dni es igual a 33555444
end;

procedure agregarALaLista(var l:lista; p:persona)
var 
 nuevo:lista;
begin 
 new(nuevo); nuevo^.elem := p; nuevo^.sig := nil;
 if(l = nil)then 
 begin
  l := nuevo; 
 end;
 else 
  begin 
   nuevo^.sig := l;
   l := nuevo; 
  end;
end;

// inciso a.
procedure procesarLista(l:lista; v:vector)
var 
 pares:integer;
begin 
 pares := 0;
 while( l <> nil)do 
 begin 
  if(descomponerDNI(l^.elem^.dni))then
   pares := pares + 1;
  end;
  // Cargamos los codigos al vector para sacar los dos maximos.
   v[l^.elem.cod] := v[l^.elem.cod] + 1;
   l := l^.sig; // Avanzar en la lista.
 end;
end;

function descomponerDNI(dni:integer):boolean 
var 
 par,impar,dig:integer;
 hayMasPares:boolean;
 begin
 par:=0;
 impar:=0;
 while(dni <> 0)do
 begin
  dig := dni mod 10; 
  if(dig mod 2 = 0)then 
  begin
    par := par + 1; 
  end;
  else 
   impar := impar + 1;
  dni := dni div 10;
 end; 
 // Retorno de la función
  if(par > impar)then
  begin
   hayMasPares := true;
  end;
   else 
   begin
    hayMasPares := false;
   end;
 end;

// inciso b.
procedure informarMaximos(v:vector) 
var 
 i,max1,max2,cod1,cod2:integer;
begin 
 max1 := -1;
 max2 := -1;
 cod1 := -1;
 cod2 := -1;
 for i := 1 to 5 do 
 begin
  if(v[i] > max1)then 
  begin 
   max2 := max1;
   cod2 := cod1;
   max1 := v[i]; // cantidad
   cod1 := i; // codigo
  end;
  else 
   if(v[i] > max2)then
   begin 
    max2 := v[i];
    cod2 := i;
   end;
 end;
  write('Los codigos de genero mas elegidos son:', cod1, cod2);
end;

procedure eliminarDNI(dni: integer; var l: lista);
var 
  act, ant: lista;
begin
  act := l;
  ant := nil;  
  while (act <> nil) do 
  begin
    if (act^.elem.dni <> dni) then  // Si no es el que buscamos, avanzamos
    begin
      ant := act;
      act := act^.sig; 
    end
    else // Si encontramos el DNI
    begin
      if (act = l) then  // Si es el primer nodo
        l := l^.sig
      else
       ant^.sig := act^.sig; // Enlazamos el anterior con el siguiente nodo
       dispose(act); // Liberamos la memoria del nodo eliminado
       exit; // Salimos de la función tras la eliminación
    end;
  end;
end;


var
l:lista;
v:vector;
dni:integer;
begin 
dni := 31294356;
incializarVector(v); // poner sus posiciones a 0.
l:= nil;
generarLista(l);
procesarLista(l,v);
informarMaximos(v);
eliminarDNI(dni,l);
end.