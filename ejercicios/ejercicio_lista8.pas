/* Leer información de personas y agregarla a la lista hasta que se ingrese un dni = 0.
 De cada persona se lee: dni, nombre, apellido y edad. 
 a. Luego de generar la lista, contar la cantidad de edades que sean números primos.

 Un número es primo si:
 -Es mayor que 1.
 -Solo tiene dos divisores: el 1 y el número mismo.

 */

 program ejercicio8

 type 

 persona = record 
 dni:integer
 nombre:string
 apellido:string
 edad:integer

 lista = ^nodo;
 
 nodo = record 
 dato:persona
 sig:lista

 procedure leerPersona(p:persona) // se dispone

 procedure agregarAlalista(var l:lista) // se dispone

 procedure generarLista(var l:lista)
 var 
  p:persona;
 begin 
  leerPersona(p);
  while(p.dni <> 0)do 
  begin
   agregarAlalista(l,p);
   leerPersona(p);
  end;
 end;

 procedure procesarLista(l:lista) 
 var 
  contPrimos:integer;
 begin 
  contPrimos:=0;
  while(l <> nil) do 
  begin
    if(esPrimo(l^.dato.dni))then 
    begin
     contPrimos := contPrimos + 1; 
    end;
    l := l^.sig;
  end;
   write('Hay', contPrimos, 'de números primos.')
 end;


 function esPrimo(num:integer):boolean;
 var 
  nroPrimo:boolean;
 begin
    nroPrimo := true;
    // Num debe ser mayor y distinto que 1.
    if(num <= 1) then 
    begin
     nroPrimo := false; 
    end;
    for i:= 2 to num -1 do //Esto asegura que no estamos verificando el número mismo
    begin 
     if(num mod i = 0)then // Si encontramos un divisor, no es primo
     begin
      nroPrimo:= false; 
     end;
    end;
      esPrimo := nroPrimo; 
 end;


 var 
 l:lista;
 begin 
 l:=nil;
 generarLista(l);
 procesarLista(l);
 end.
