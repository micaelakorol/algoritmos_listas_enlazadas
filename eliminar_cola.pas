// Leer y agregar personas a la lista en el orden en que van llegando. La lectura finaliza cuando se ingresa un dni = 0.
// De cada persona se lee: dni, nombre, apellido y edad.
// Luego eliminar de la lista a todas las personas que tengan edad 25.

program ejercicio_eliminar_de_la_cola

type 
 
lista =  ^nodo; 

persona = record 
dni:integer
nombre:string
apellido:string
edad:integer
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
 read(p.edad)
end
end

procedure generarLista(var l:lista, var lU:lista)
var 
 p:persona;
 begin
 leerPersona(p);
 while(p.dni <> 0)
 begin
  agregarNodo(l,lU,p);
  leerPersona(p);
 end
 end

procedure agregarNodo(var l,lU:lista, p:persona)
var 
nuevo:lista;
begin
  new(nuevo); nuevo^.dato := p; nuevo^.sig := nil;
  if(l = nil) then 
    l := nuevo;
    lU := nuevo;
  else 
    lU^.sig := nuevo;
    lU := nuevo;
end

procedure eliminar(var l: lista; edad: integer);
var 
  act, ant: lista;
begin
  act := l;
  while (act <> nil) do 
  begin
    if (act^.dato.edad <> edad) then 
    begin
      ant := act;
      act := act^.sig;
    end
    else 
    begin
      if (act = l) then 
        l := l^.sig
      else 
        ant^.sig := act^.sig;
      dispose(act);
      act := ant;
    end;
  end;
end;
  
var 
l,lU:lista;
edad:integer;
begin
l:=nil; // inicio la lista vacía.
lU:=nil;  // el puntero lU mantiene donde termina la lista.
edad:=25; // edad a eliminar
generarLista(l,lU);
eliminar(edad);
end