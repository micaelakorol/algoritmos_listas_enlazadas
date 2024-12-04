Program agregar_atras

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
   pU := nuevo;
  end
  else
   begin
    pU^.sig := nuevo;
    pU := nuevo; 
   end
 end

var
 pI:list;
 pU:list;
 num:integer;
begin
 num := 10;
 pI:= nil;
 pU:= nil;
 agregarAlFinal(pI,pU,num);
end.