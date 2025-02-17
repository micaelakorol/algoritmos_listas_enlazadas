/*
 4. Una maternidad dispone información sobre sus pacientes. De cada una se conoce: nombre, apellido y
 peso registrado el primer día de cada semana de embarazo (a lo sumo 42). La maternidad necesita un
 programa que analice esta información, determine e informe:
 a. Para cada embarazada, la semana con mayor aumento de peso.
 b. El aumento de peso total de cada embarazada durante el embarazo.

 ¿Se sabe la cantidad de pacientes que hay? - No. Entonces necesito usar una estructura dinámica (lista).

*/

program ejercicio1

type 
// Guarda el peso de las 42 semanas de embarazo.
vPeso = array[1..42] of real; 

paciente = record 
nombre:string
apellido:string
peso:vPeso 

lista = ^nodo; 

nodo = record 
dato:paciente
sig:lista 

procedure procesarPacientes(var l:lista) // se dispone.


procedure procesarLista(l:lista)
var 
semanaMax, pesoTotal:integer;
begin
 while(l <> nil)do 
 begin
 semanaMax := obtenerMax(l^.dato); // Pasar todo el registro, no solo el peso.
 writeln('La semana con mayor aumento de peso para ', l^.dato.nombre, ' ', l^.dato.apellido, ' es la semana ', semanaMax);
 pesoTotal := aumentoPesoTotal(l^.dato);
 writeln('Aumento de peso total: ', pesoTotal);
 l:= l^.sig; 
 end; 
end;

// l^.dato = paciente (registro).

function obtenerMax(p:paciente):integer
var 
 max:real; 
 semana:integer;
begin
 max := -9999;
 semana := 0;
 for i := 1 to 42 do 
 begin 
  if(p.peso[i] > max) then 
   max := p.peso[i];
   semana := i;
 end; 
  // Retorna la semana donde pesó más.
  obtenerMax :=  semana;
end;

function aumentoPesoTotal(p:paciente):real 
var 
pesoTotal:real;
begin 
pesoTotal := 0;
 for i := i to 42 do 
 begin
  pesoTotal := pesoTotal + p.peso[i];
 end;
  aumentoPesoTotal := pesoTotal;
end;

var 
l:lista;
v:vPeso; // dispone el peso de las 42 semanas.
begin 
procesarPacientes(l);
end.