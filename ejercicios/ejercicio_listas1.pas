// Leer información de personas y agregarla a la lista hasta que se ingrese un dni = 0.
// De cada persona se lee: dni, nombre y apellido.

program ejercicio_personas

type 
 
lista =  ^nodo; 

persona = record 
dni:integer
nombre:string
apellido:string
end;

nodo = record
dato:persona
sig:lista
end;

procedure leerPersona(p:persona)
begin
read(p.dni);
if(p.dni <> 0)
begin
 read(p.nombre);
 read(p.apellido);
end
end

procedure generarLista(var l:lista)
var 
 p:persona;
 begin
 leerPersona(p);
 while(p.dni <> 0)
 begin
  agregarNodo(l,p);
  leerPersona(p);
 end
 end

procedure agregarNodo(var l:lista, p:persona)
var 
nuevo:lista;
begin
  new(nuevo); nuevo^.dato := p; nuevo^.sig := nil;
  if(nuevo = nil) then 
    l := nuevo;
  else 
    nuevo^.sig := l;
    l := nuevo;
end
  
var 
l:lista;
begin
l:=nil;
generarLista(l);
end