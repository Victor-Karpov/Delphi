unit uExampleModule5;
interface

uses SysUtils,Classes,
     uSXML,
     uPluginInterface, uPluginUtils;

const
  Alias   = 'Sverka';
  Version = '1.0.0';

type

  TExample = class(_TInterfacedObject,
                     IModule,
                     IMathProcess,
                     IModule_use_Model)

  private
   r:IModel;
   zagrr:Pointer;
  er:Pointer;
  public

    function Init(AXML: PAnsiChar): Cardinal; stdcall;
    function Specification: PAnsiChar; stdcall;
    function ProcessBuffer(AInPtr: Pointer; AInLen: Cardinal; AOutPtr: Pointer; AOutLen: Cardinal): Cardinal; stdcall;
    function SetModel(AModel: IModel): HRESULT; stdcall;
  end;

implementation

uses uExampleModule1;

{ TExample }

function TExample.Specification: PAnsiChar;
begin
  Result :=
  '<?xml version="1.0" encoding="UTF-8"?>'#$D#$A+
  '<module>'#$D#$A+
  '  <name value="'+Alias+'"/>'#$D#$A+
  '  <version value="'+Version+'"/>'#$D#$A+
  '</module>';
end;
type
 PMyArray =^TMyArray;
 TMyArray = packed record
   Count : integer;
   Value : array[0..1000000] of Integer;
 end;
    type
P = ^PT;
Pt = packed record
first : integer;
second : integer;
end;

function TExample.Init(AXML: PAnsiChar): Cardinal;
  var t:PMyArray; Zagru:P;  Y:Integer;
begin
  with TSXMLNodeMsg.Create(AXML) do try
    if Name='init' then begin
      er:=FieldPointerByName(This,'TMyArray','',nil);
      zagrr:=FieldPointerByName(This,'T','',nil);
    end;
  finally
    Free;
  end;
  Result:=S_OK;
      t:=pointer(er);
      zagru:=pointer(zagrr);
       if zagrr = nil  then begin
   FmtLog(r,'Модуль "Основной" не подключен',[]);
   if er = nil  then
   FmtLog(r,'Модуль "Загрузка" не подключен',[]);

   end
   else begin

   FmtLog(r,'Модуль "Основной" подключен',[]);
   if zagru.first+19=zagru.second then  begin
     FmtLog(r,'Все работает, Паша будет доволен',[]);
     end
     else
     FmtLog(r,'Все сломалось, Паша будет ругаться',[]);
   //  t.value[999]:=1;






end;
  end;


function TExample.ProcessBuffer(AInPtr: Pointer; AInLen: Cardinal; AOutPtr: Pointer; AOutLen: Cardinal): Cardinal;
begin
end;

function TExample.SetModel(AModel: IModel): HRESULT;
begin
  r:=AModel;
end;
end.
