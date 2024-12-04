Program agregar_adelante

Type list =  ^dato;

dato = record
elemento:integer;
siguiente: list;

procedure agregarAdelante(var pI:list; num:integer)
var 
 nuevo:list
 begin
  new(nuevo); nuevo^.dato := num; nuevo^.sig := nil;
  if (pI = nil) then
  begin
   pI := nuevo;
  end
  else
   begin
    nuevo^.sig := pI;
    pI := nuevo; 
   end
 end

var
 pI:list;
 num:integer;
begin
 num := 10;
 pI:= nil;
 agregarAdelante(pI,num);
end.