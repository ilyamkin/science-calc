{ 	The Scientific Calculator v.4.0
    Copyright (C) 2010  Ilya Lyamkin

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
}

unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Math, XPMan, ExtCtrls, Spin, Menus,
  jpeg, Buttons;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Edit2: TEdit;
    Edit3: TEdit;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    XPManifest1: TXPManifest;
    Label1: TLabel;
    Bevel1: TBevel;
    Label2: TLabel;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    Button7: TButton;
    SpinEdit1: TSpinEdit;
    SpinEdit2: TSpinEdit;
    SpinEdit3: TSpinEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    BitBtn13: TBitBtn;
    BitBtn14: TBitBtn;
    BitBtn15: TBitBtn;
    BitBtn16: TBitBtn;
    BitBtn17: TBitBtn;
    BitBtn18: TBitBtn;
    Label4: TLabel;
    RadioGroup1: TRadioGroup;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    BitBtn19: TBitBtn;
    BitBtn20: TBitBtn;
    Image1: TImage;
    procedure Button1Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure Edit2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure Edit3Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure Edit4Click(Sender: TObject);
    procedure Edit5Click(Sender: TObject);
    procedure BitBtn17Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure BitBtn18Click(Sender: TObject);
    procedure BitBtn19Click(Sender: TObject);
    procedure BitBtn20Click(Sender: TObject);
    procedure Edit1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit2KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


var
  Form1: TForm1;
  i,j,sym:integer;
  r,r1,r2,re,rec,f:double;
  str:string;
  a,b: array [1..256] of longint;
  flag1,flag2,func1,func2:boolean;
  alf: array [10..36] of char;

implementation



uses Unit2;

{$R *.dfm}
{$SETPEFlAGS IMAGE_FILE_RELOCS_STRIPPED or IMAGE_FILE_DEBUG_STRIPPED or
  IMAGE_FILE_LINE_NUMS_STRIPPED or IMAGE_FILE_LOCAL_SYMS_STRIPPED or
  IMAGE_FILE_REMOVABLE_RUN_FROM_SWAP or IMAGE_FILE_NET_RUN_FROM_SWAP}

function checkData() : boolean;
var
  s1,s2,s3:string;
  flagg:boolean;
begin
Form1.Edit3.Clear;
flagg:=false;
s1:=Form1.Edit1.Text;
s2:=Form1.Edit2.Text;
sym:=0;
if Form1.Edit1.Text = '' then
  Form1.Edit1.Text:='0';
if Form1.Edit2.Text = '' then
  Form1.Edit2.Text:='0';
///  First String// Begin
for i := 1 to length(s1) do
if s1[i] <> ',' then
begin
  for j:=10 to 35 do
        if s1[i] = alf[j] then
        begin
        sym:=j;
        break;
        end;
   if sym <> j then sym:=StrtoInt(s1[i]);
  if sym > Form1.SpinEdit1.Value then
  flagg:=true;
end;
///  First String// End
if not(flagg) then
sym:=0;
///  Second String// Begin
for i := 1 to length(s2) do
if s2[i] <> ',' then
begin
  for j:=10 to 35 do
        if s2[i] = alf[j] then
        begin
        sym:=j;
        break;
        end;
   if sym <> j then sym:=StrtoInt(s2[i]);
  if sym > Form1.SpinEdit2.Value then
  flagg:=true;
end;
///  Second String// End
 checkData:=flagg;
end;



// Сумма   BEGIN //////////////////////////////////////
procedure TForm1.Button1Click(Sender: TObject);
var
  pr:integer;
begin
pr:=0;
if checkData() then
ShowMessage('Ошибка. Обратите внимание на то, что цифры числа не могут быть больше, чем основание системы счисления')
else
begin
Label1.Caption:='+';
r2:=0;rec:=0;
re:=0;
r:=0;
sym:=0;
if SpinEdit1.Value <> 10  then
begin
  if  Pos(',',Edit1.Text) <> 0 then
  begin
      i:=0;
      while Edit1.Text[i+1] <> ',' do
      begin
      for j:=10 to 35 do
        if Edit1.Text[length(Edit1.Text)-i] = alf[j] then
        begin
        sym:=j;
        break;
        end;
      if sym <> j then
        sym:=StrtoInt(Edit1.Text[Pos(',',Edit1.Text)-i-1]);
      rec:=rec + sym * IntPower(SpinEdit1.Value,i);
      inc(i);
      end;
      sym:=0;
    for i := 1 to (length(Edit1.Text) - Pos(',',Edit1.Text))  do
    begin
      for j:=10 to 35 do
        if Edit1.Text[i+Pos(',',Edit1.Text)] = alf[j] then
        begin
        sym:=j;
        break;
        end;
      if sym <> j then
        sym:=StrtoInt(Edit1.Text[i+Pos(',',Edit1.Text)]);
      re:=re + sym * IntPower(SpinEdit1.Value,-i);
    end;
    r:=rec+re;
  end
  else
  begin
    for i := 0 to length(Edit1.Text) -1 do
    begin
      for j:=10 to 35 do
        if Edit1.Text[length(Edit1.Text)-i] = alf[j] then
         begin
         sym:=j;
         break;
         end;
       if sym <> j then
         sym:=StrtoInt(Edit1.Text[length(Edit1.Text)-i]);
      r:=r + sym * IntPower(SpinEdit1.Value,i);
    end;
  end;
end
else
  r:=StrtoFloat(Edit1.Text);
// Functions
if RadioButton1.Checked then
begin
if Edit4.Text= 'sin' then r:=sin(DegtoRad(r));
if Edit4.Text= 'cos' then r:=cos(DegToRad(r));
if Edit4.Text= 'tg' then r:=tan(DegtoRad(r));
if Edit4.Text= 'ctg' then r:=cot(DegtoRad(r));
if Edit4.Text= 'arcsin' then r:=arcsin(DegtoRad(r));
if Edit4.Text= 'arccos' then r:=arccos(DegtoRad(r));
end else
begin
if Edit4.Text= 'sin' then r:=sin(r);
if Edit4.Text= 'cos' then r:=cos(r);
if Edit4.Text= 'tg' then r:=tan(r);
if Edit4.Text= 'ctg' then r:=cot(r);
if Edit4.Text= 'arcsin' then r:=arcsin(r);
if Edit4.Text= 'arccos' then r:=arccos(r);
end;
// Functions
rec:=0;re:=0;sym:=0;
if SpinEdit2.Value <> 10  then
begin
  if  Pos(',',Edit2.Text) <> 0 then
  begin
      i:=0;
      while Edit2.Text[i+1] <> ',' do
      begin
      for j:=10 to 35 do
        if Edit2.Text[length(Edit2.Text)-i] = alf[j] then
        begin
        sym:=j;
        break;
        end;
      if sym <> j then
        sym:=StrtoInt(Edit2.Text[Pos(',',Edit2.Text)-i-1]);
      rec:=rec + sym * IntPower(SpinEdit2.Value,i);
      inc(i);
      end;
      sym:=0;
    for i := 1 to (length(Edit2.Text) - Pos(',',Edit2.Text))  do
    begin
      for j:=10 to 35 do
        if Edit2.Text[i+Pos(',',Edit2.Text)] = alf[j] then
        begin
        sym:=j;
        break;
        end;
      if sym <> j then
        sym:=StrtoInt(Edit2.Text[i+Pos(',',Edit2.Text)]);
      re:=re + sym * IntPower(SpinEdit2.Value,-i);
    end;
    r2:=rec+re;
  end
  else
  begin
    for i := 0 to length(Edit2.Text) -1 do
    begin
      for j:=10 to 35 do
        if Edit2.Text[length(Edit2.Text)-i] = alf[j] then
         begin
         sym:=j;
         break;
         end;
       if sym <> j then
         sym:=StrtoInt(Edit2.Text[length(Edit2.Text)-i]);
      r2:=r2 + sym * IntPower(SpinEdit2.Value,i);
    end;
  end;
end
else
  r2:=StrtoFloat(Edit2.Text);
//Functions 2
if RadioButton1.Checked then
begin
if Edit5.Text= 'sin' then r2:=sin(DegtoRad(r2));
if Edit5.Text= 'cos' then r2:=cos(DegToRad(r2));
if Edit5.Text= 'tg' then r2:=tan(DegtoRad(r2));
if Edit5.Text= 'ctg' then r2:=cot(DegtoRad(r2));
if Edit5.Text= 'arcsin' then r2:=arcsin(DegtoRad(r2));
if Edit5.Text= 'arccos' then r2:=arccos(DegtoRad(r2));
end else
begin
if Edit5.Text= 'sin' then r2:=sin(r2);
if Edit5.Text= 'cos' then r2:=cos(r2);
if Edit5.Text= 'tg' then r2:=tan(r2);
if Edit5.Text= 'ctg' then r2:=cot(r2);
if Edit5.Text= 'arcsin' then r2:=arcsin(r2);
if Edit5.Text= 'arccos' then r2:=arccos(r2);
end;
// Functions 2
r1:=r + r2;
re:=0;rec:=0;
if SpinEdit3.Value <> 10 then
begin
  if Frac(r1) <> 10 then
  begin
    j:=round(Int(r1));
    str:=' ';
    i:=1;
    pr:=0;
    while (j > 0) and (pr < 15) do
    begin
      a[i]:= j mod SpinEdit3.Value;
      j:=j div SpinEdit3.Value;
      i:=i+1;
      inc(pr);
    end;
    for j:=1 to i do
      str:=Concat(str,FloattoStr(a[i-j+1]));
    rec:=StrtoFloat(str);
    f:=Frac(r1);
    i:=1;
    pr:=0;
    while (f <> 0) and (pr < 15) do
    begin
      f:=f * SpinEdit3.Value;
      b[i]:=Trunc(f);
      f:=Frac(f);
      i:=i+1;
      inc(pr);
    end;
    str:=' ';
    for j:=1 to i do
      str:=Concat(str,FloattoStr(b[i-j+1]));
    re:=StrtoFloat(str);
    str:=Concat(FloattoStr(rec),',',FloattoStr(re));
    Edit3.Text:=str;
  end
  else
  begin
    j:=round(r1);
    str:=' ';
    i:=1;
    pr:=0;
    while (j > 0) and (pr < 15) do
    begin
      a[i]:=j mod SpinEdit3.Value;
      j:=j div SpinEdit3.Value;
      i:=i+1;
      inc(pr);
    end;
    for j:=1 to i do
      str:=Concat(str,FloattoStr(a[i-j+1]));
    Edit3.Text:=str;
  end;
end
else
  Edit3.Text:=FloattoStr(r1);
end;
end;
//Сумма END  ///////////////////////////////////////////////////



//////////////////////Вычитание BEGIN////////////////////////////////
procedure TForm1.Button2Click(Sender: TObject);
var
  pr:integer;
begin
pr:=0;
if checkData() then
ShowMessage('Ошибка. Обратите внимание на то, что цифры числа не могут быть больше, чем основание системы счисления')
else
begin
Label1.Caption:='-';
r2:=0;rec:=0;
re:=0;
r:=0;
sym:=0;
if SpinEdit1.Value <> 10  then
begin
  if  Pos(',',Edit1.Text) <> 0 then
  begin
      i:=0;
      while Edit1.Text[i+1] <> ',' do
      begin
      for j:=10 to 35 do
        if Edit1.Text[length(Edit1.Text)-i] = alf[j] then
        begin
        sym:=j;
        break;
        end;
      if sym <> j then
        sym:=StrtoInt(Edit1.Text[Pos(',',Edit1.Text)-i-1]);
      rec:=rec + sym * IntPower(SpinEdit1.Value,i);
      inc(i);
      end;
      sym:=0;
    for i := 1 to (length(Edit1.Text) - Pos(',',Edit1.Text))  do
    begin
      for j:=10 to 35 do
        if Edit1.Text[i+Pos(',',Edit1.Text)] = alf[j] then
        begin
        sym:=j;
        break;
        end;
      if sym <> j then
        sym:=StrtoInt(Edit1.Text[i+Pos(',',Edit1.Text)]);
      re:=re + sym * IntPower(SpinEdit1.Value,-i);
    end;
    r:=rec+re;
  end
  else
  begin
    for i := 0 to length(Edit1.Text) -1 do
    begin
      for j:=10 to 35 do
        if Edit1.Text[length(Edit1.Text)-i] = alf[j] then
         begin
         sym:=j;
         break;
         end;
       if sym <> j then
         sym:=StrtoInt(Edit1.Text[length(Edit1.Text)-i]);
      r:=r + sym * IntPower(SpinEdit1.Value,i);
    end;
  end;
end
else
  r:=StrtoFloat(Edit1.Text);
// Functions
if RadioButton1.Checked then
begin
if Edit4.Text= 'sin' then r:=sin(DegtoRad(r));
if Edit4.Text= 'cos' then r:=cos(DegToRad(r));
if Edit4.Text= 'tg' then r:=tan(DegtoRad(r));
if Edit4.Text= 'ctg' then r:=cot(DegtoRad(r));
if Edit4.Text= 'arcsin' then r:=arcsin(DegtoRad(r));
if Edit4.Text= 'arccos' then r:=arccos(DegtoRad(r));
end else
begin
if Edit4.Text= 'sin' then r:=sin(r);
if Edit4.Text= 'cos' then r:=cos(r);
if Edit4.Text= 'tg' then r:=tan(r);
if Edit4.Text= 'ctg' then r:=cot(r);
if Edit4.Text= 'arcsin' then r:=arcsin(r);
if Edit4.Text= 'arccos' then r:=arccos(r);
end;
// Functions
rec:=0;re:=0;sym:=0;
if SpinEdit2.Value <> 10  then
begin
  if  Pos(',',Edit2.Text) <> 0 then
  begin
      i:=0;
      while Edit2.Text[i+1] <> ',' do
      begin
      for j:=10 to 35 do
        if Edit2.Text[length(Edit2.Text)-i] = alf[j] then
        begin
        sym:=j;
        break;
        end;
      if sym <> j then
        sym:=StrtoInt(Edit2.Text[Pos(',',Edit2.Text)-i-1]);
      rec:=rec + sym * IntPower(SpinEdit2.Value,i);
      inc(i);
      end;
      sym:=0;
    for i := 1 to (length(Edit2.Text) - Pos(',',Edit2.Text))  do
    begin
      for j:=10 to 35 do
        if Edit2.Text[i+Pos(',',Edit2.Text)] = alf[j] then
        begin
        sym:=j;
        break;
        end;
      if sym <> j then
        sym:=StrtoInt(Edit2.Text[i+Pos(',',Edit2.Text)]);
      re:=re + sym * IntPower(SpinEdit2.Value,-i);
    end;
    r2:=rec+re;
  end
  else
  begin
    for i := 0 to length(Edit2.Text) -1 do
    begin
      for j:=10 to 35 do
        if Edit2.Text[length(Edit2.Text)-i] = alf[j] then
         begin
         sym:=j;
         break;
         end;
       if sym <> j then
         sym:=StrtoInt(Edit2.Text[length(Edit2.Text)-i]);
      r2:=r2 + sym * IntPower(SpinEdit2.Value,i);
    end;
  end;
end
else
  r2:=StrtoFloat(Edit2.Text);
//Functions 2
if RadioButton1.Checked then
begin
if Edit5.Text= 'sin' then r2:=sin(DegtoRad(r2));
if Edit5.Text= 'cos' then r2:=cos(DegToRad(r2));
if Edit5.Text= 'tg' then r2:=tan(DegtoRad(r2));
if Edit5.Text= 'ctg' then r2:=cot(DegtoRad(r2));
if Edit5.Text= 'arcsin' then r2:=arcsin(DegtoRad(r2));
if Edit5.Text= 'arccos' then r2:=arccos(DegtoRad(r2));
end else
begin
if Edit5.Text= 'sin' then r2:=sin(r2);
if Edit5.Text= 'cos' then r2:=cos(r2);
if Edit5.Text= 'tg' then r2:=tan(r2);
if Edit5.Text= 'ctg' then r2:=cot(r2);
if Edit5.Text= 'arcsin' then r2:=arcsin(r2);
if Edit5.Text= 'arccos' then r2:=arccos(r2);
end;
// Functions 2
r1:=r - r2;
re:=0;rec:=0;
if SpinEdit3.Value <> 10 then
begin
  if Frac(r1) <> 10 then
  begin
    j:=round(Int(r1));
    str:=' ';
    i:=1;
    pr:=0;
    while (j > 0) and (pr < 15) do
    begin
      a[i]:= j mod SpinEdit3.Value;
      j:=j div SpinEdit3.Value;
      i:=i+1;
      inc(pr);
    end;
    for j:=1 to i do
      str:=Concat(str,FloattoStr(a[i-j+1]));
    rec:=StrtoFloat(str);
    f:=Frac(r1);
    i:=1;
    pr:=0;
    while (f <> 0) and (pr < 15) do
    begin
      f:=f * SpinEdit3.Value;
      b[i]:=Trunc(f);
      f:=Frac(f);
      i:=i+1;
      inc(pr);
    end;
    str:=' ';
    for j:=1 to i do
      str:=Concat(str,FloattoStr(b[i-j+1]));
    re:=StrtoFloat(str);
    str:=Concat(FloattoStr(rec),',',FloattoStr(re));
    Edit3.Text:=str;
  end
  else
  begin
    j:=round(r1);
    str:=' ';
    i:=1;
    pr:=0;
    while (j > 0) and (pr < 15) do
    begin
      a[i]:=j mod SpinEdit3.Value;
      j:=j div SpinEdit3.Value;
      i:=i+1;
      inc(pr);
    end;
    for j:=1 to i do
      str:=Concat(str,FloattoStr(a[i-j+1]));
    Edit3.Text:=str;
  end;
end
else
  Edit3.Text:=FloattoStr(r1);
end;
end;
//////////////////////Вычитание END//////////////////////////////




procedure TForm1.Button5Click(Sender: TObject);
begin
close;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
Edit1.Clear;
Edit2.Clear;
Edit3.Clear;
Edit4.Clear;
Edit5.Clear;
end;

/////////////////////////Произведение BEGIN/////////////////////////
procedure TForm1.Button3Click(Sender: TObject);
var
  pr:integer;
begin
pr:=0;
if checkData() then
ShowMessage('Ошибка. Обратите внимание на то, что цифры числа не могут быть больше, чем основание системы счисления')
else
begin
Label1.Caption:='*';
r2:=0;rec:=0;
re:=0;
r:=0;
sym:=0;
if SpinEdit1.Value <> 10  then
begin
  if  Pos(',',Edit1.Text) <> 0 then
  begin
      i:=0;
      while Edit1.Text[i+1] <> ',' do
      begin
      for j:=10 to 35 do
        if Edit1.Text[length(Edit1.Text)-i] = alf[j] then
        begin
        sym:=j;
        break;
        end;
      if sym <> j then
        sym:=StrtoInt(Edit1.Text[Pos(',',Edit1.Text)-i-1]);
      rec:=rec + sym * IntPower(SpinEdit1.Value,i);
      inc(i);
      end;
      sym:=0;
    for i := 1 to (length(Edit1.Text) - Pos(',',Edit1.Text))  do
    begin
      for j:=10 to 35 do
        if Edit1.Text[i+Pos(',',Edit1.Text)] = alf[j] then
        begin
        sym:=j;
        break;
        end;
      if sym <> j then
        sym:=StrtoInt(Edit1.Text[i+Pos(',',Edit1.Text)]);
      re:=re + sym * IntPower(SpinEdit1.Value,-i);
    end;
    r:=rec+re;
  end
  else
  begin
    for i := 0 to length(Edit1.Text) -1 do
    begin
      for j:=10 to 35 do
        if Edit1.Text[length(Edit1.Text)-i] = alf[j] then
         begin
         sym:=j;
         break;
         end;
       if sym <> j then
         sym:=StrtoInt(Edit1.Text[length(Edit1.Text)-i]);
      r:=r + sym * IntPower(SpinEdit1.Value,i);
    end;
  end;
end
else
  r:=StrtoFloat(Edit1.Text);
// Functions
if RadioButton1.Checked then
begin
if Edit4.Text= 'sin' then r:=sin(DegtoRad(r));
if Edit4.Text= 'cos' then r:=cos(DegToRad(r));
if Edit4.Text= 'tg' then r:=tan(DegtoRad(r));
if Edit4.Text= 'ctg' then r:=cot(DegtoRad(r));
if Edit4.Text= 'arcsin' then r:=arcsin(DegtoRad(r));
if Edit4.Text= 'arccos' then r:=arccos(DegtoRad(r));
end else
begin
if Edit4.Text= 'sin' then r:=sin(r);
if Edit4.Text= 'cos' then r:=cos(r);
if Edit4.Text= 'tg' then r:=tan(r);
if Edit4.Text= 'ctg' then r:=cot(r);
if Edit4.Text= 'arcsin' then r:=arcsin(r);
if Edit4.Text= 'arccos' then r:=arccos(r);
end;
// Functions
rec:=0;re:=0;sym:=0;
if SpinEdit2.Value <> 10  then
begin
  if  Pos(',',Edit2.Text) <> 0 then
  begin
      i:=0;
      while Edit2.Text[i+1] <> ',' do
      begin
      for j:=10 to 35 do
        if Edit2.Text[length(Edit2.Text)-i] = alf[j] then
        begin
        sym:=j;
        break;
        end;
      if sym <> j then
        sym:=StrtoInt(Edit2.Text[Pos(',',Edit2.Text)-i-1]);
      rec:=rec + sym * IntPower(SpinEdit2.Value,i);
      inc(i);
      end;
      sym:=0;
    for i := 1 to (length(Edit2.Text) - Pos(',',Edit2.Text))  do
    begin
      for j:=10 to 35 do
        if Edit2.Text[i+Pos(',',Edit2.Text)] = alf[j] then
        begin
        sym:=j;
        break;
        end;
      if sym <> j then
        sym:=StrtoInt(Edit2.Text[i+Pos(',',Edit2.Text)]);
      re:=re + sym * IntPower(SpinEdit2.Value,-i);
    end;
    r2:=rec+re;
  end
  else
  begin
    for i := 0 to length(Edit2.Text) -1 do
    begin
      for j:=10 to 35 do
        if Edit2.Text[length(Edit2.Text)-i] = alf[j] then
         begin
         sym:=j;
         break;
         end;
       if sym <> j then
         sym:=StrtoInt(Edit2.Text[length(Edit2.Text)-i]);
      r2:=r2 + sym * IntPower(SpinEdit2.Value,i);
    end;
  end;
end
else
  r2:=StrtoFloat(Edit2.Text);
//Functions 2
if RadioButton1.Checked then
begin
if Edit5.Text= 'sin' then r2:=sin(DegtoRad(r2));
if Edit5.Text= 'cos' then r2:=cos(DegToRad(r2));
if Edit5.Text= 'tg' then r2:=tan(DegtoRad(r2));
if Edit5.Text= 'ctg' then r2:=cot(DegtoRad(r2));
if Edit5.Text= 'arcsin' then r2:=arcsin(DegtoRad(r2));
if Edit5.Text= 'arccos' then r2:=arccos(DegtoRad(r2));
end else
begin
if Edit5.Text= 'sin' then r2:=sin(r2);
if Edit5.Text= 'cos' then r2:=cos(r2);
if Edit5.Text= 'tg' then r2:=tan(r2);
if Edit5.Text= 'ctg' then r2:=cot(r2);
if Edit5.Text= 'arcsin' then r2:=arcsin(r2);
if Edit5.Text= 'arccos' then r2:=arccos(r2);
end;
// Functions 2
r1:=r * r2;
re:=0;rec:=0;
if SpinEdit3.Value <> 10 then
begin
  if Frac(r1) <> 10 then
  begin
    j:=round(Int(r1));
    str:=' ';
    i:=1;
    pr:=0;
    while (j > 0) and (pr < 15) do
    begin
      a[i]:= j mod SpinEdit3.Value;
      j:=j div SpinEdit3.Value;
      i:=i+1;
      inc(pr);
    end;
    for j:=1 to i do
      str:=Concat(str,FloattoStr(a[i-j+1]));
    rec:=StrtoFloat(str);
    f:=Frac(r1);
    i:=1;
    pr:=0;
    while (f <> 0) and (pr < 15) do
    begin
      f:=f * SpinEdit3.Value;
      b[i]:=Trunc(f);
      f:=Frac(f);
      i:=i+1;
      inc(pr);
    end;
    str:=' ';
    for j:=1 to i do
      str:=Concat(str,FloattoStr(b[i-j+1]));
    re:=StrtoFloat(str);
    str:=Concat(FloattoStr(rec),',',FloattoStr(re));
    Edit3.Text:=str;
  end
  else
  begin
    j:=round(r1);
    str:=' ';
    i:=1;
    pr:=0;
    while (j > 0) and (pr < 15) do
    begin
      a[i]:=j mod SpinEdit3.Value;
      j:=j div SpinEdit3.Value;
      i:=i+1;
      inc(pr);
    end;
    for j:=1 to i do
      str:=Concat(str,FloattoStr(a[i-j+1]));
    Edit3.Text:=str;
  end;
end
else
  Edit3.Text:=FloattoStr(r1);
end;
end;
//////////////////////////Произведение END//////////////////////////////

////////////////////////////Деление BEGIN/////////////////////////
procedure TForm1.Button4Click(Sender: TObject);
var
  pr:integer;
begin
pr:=0;
if checkData() or (Edit2.Text = '0') then
ShowMessage('Ошибка. Обратите внимание на то, что цифры числа не могут быть больше, чем основание системы счисления и делить на ноль нельзя')
else
begin
Label1.Caption:='/';
r2:=0;rec:=0;
re:=0;
r:=0;
sym:=0;
if SpinEdit1.Value <> 10  then
begin
  if  Pos(',',Edit1.Text) <> 0 then
  begin
      i:=0;
      while Edit1.Text[i+1] <> ',' do
      begin
      for j:=10 to 35 do
        if Edit1.Text[length(Edit1.Text)-i] = alf[j] then
        begin
        sym:=j;
        break;
        end;
      if sym <> j then
        sym:=StrtoInt(Edit1.Text[Pos(',',Edit1.Text)-i-1]);
      rec:=rec + sym * IntPower(SpinEdit1.Value,i);
      inc(i);
      end;
      sym:=0;
    for i := 1 to (length(Edit1.Text) - Pos(',',Edit1.Text))  do
    begin
      for j:=10 to 35 do
        if Edit1.Text[i+Pos(',',Edit1.Text)] = alf[j] then
        begin
        sym:=j;
        break;
        end;
      if sym <> j then
        sym:=StrtoInt(Edit1.Text[i+Pos(',',Edit1.Text)]);
      re:=re + sym * IntPower(SpinEdit1.Value,-i);
    end;
    r:=rec+re;
  end
  else
  begin
    for i := 0 to length(Edit1.Text) -1 do
    begin
      for j:=10 to 35 do
        if Edit1.Text[length(Edit1.Text)-i] = alf[j] then
         begin
         sym:=j;
         break;
         end;
       if sym <> j then
         sym:=StrtoInt(Edit1.Text[length(Edit1.Text)-i]);
      r:=r + sym * IntPower(SpinEdit1.Value,i);
    end;
  end;
end
else
  r:=StrtoFloat(Edit1.Text);
// Functions
if RadioButton1.Checked then
begin
if Edit4.Text= 'sin' then r:=sin(DegtoRad(r));
if Edit4.Text= 'cos' then r:=cos(DegToRad(r));
if Edit4.Text= 'tg' then r:=tan(DegtoRad(r));
if Edit4.Text= 'ctg' then r:=cot(DegtoRad(r));
if Edit4.Text= 'arcsin' then r:=arcsin(DegtoRad(r));
if Edit4.Text= 'arccos' then r:=arccos(DegtoRad(r));
end else
begin
if Edit4.Text= 'sin' then r:=sin(r);
if Edit4.Text= 'cos' then r:=cos(r);
if Edit4.Text= 'tg' then r:=tan(r);
if Edit4.Text= 'ctg' then r:=cot(r);
if Edit4.Text= 'arcsin' then r:=arcsin(r);
if Edit4.Text= 'arccos' then r:=arccos(r);
end;
// Functions
rec:=0;re:=0;sym:=0;
if SpinEdit2.Value <> 10  then
begin
  if  Pos(',',Edit2.Text) <> 0 then
  begin
      i:=0;
      while Edit2.Text[i+1] <> ',' do
      begin
      for j:=10 to 35 do
        if Edit2.Text[length(Edit2.Text)-i] = alf[j] then
        begin
        sym:=j;
        break;
        end;
      if sym <> j then
        sym:=StrtoInt(Edit2.Text[Pos(',',Edit2.Text)-i-1]);
      rec:=rec + sym * IntPower(SpinEdit2.Value,i);
      inc(i);
      end;
      sym:=0;
    for i := 1 to (length(Edit2.Text) - Pos(',',Edit2.Text))  do
    begin
      for j:=10 to 35 do
        if Edit2.Text[i+Pos(',',Edit2.Text)] = alf[j] then
        begin
        sym:=j;
        break;
        end;
      if sym <> j then
        sym:=StrtoInt(Edit2.Text[i+Pos(',',Edit2.Text)]);
      re:=re + sym * IntPower(SpinEdit2.Value,-i);
    end;
    r2:=rec+re;
  end
  else
  begin
    for i := 0 to length(Edit2.Text) -1 do
    begin
      for j:=10 to 35 do
        if Edit2.Text[length(Edit2.Text)-i] = alf[j] then
         begin
         sym:=j;
         break;
         end;
       if sym <> j then
         sym:=StrtoInt(Edit2.Text[length(Edit2.Text)-i]);
      r2:=r2 + sym * IntPower(SpinEdit2.Value,i);
    end;
  end;
end
else
  r2:=StrtoFloat(Edit2.Text);
//Functions 2
if RadioButton1.Checked then
begin
if Edit5.Text= 'sin' then r2:=sin(DegtoRad(r2));
if Edit5.Text= 'cos' then r2:=cos(DegToRad(r2));
if Edit5.Text= 'tg' then r2:=tan(DegtoRad(r2));
if Edit5.Text= 'ctg' then r2:=cot(DegtoRad(r2));
if Edit5.Text= 'arcsin' then r2:=arcsin(DegtoRad(r2));
if Edit5.Text= 'arccos' then r2:=arccos(DegtoRad(r2));
end else
begin
if Edit5.Text= 'sin' then r2:=sin(r2);
if Edit5.Text= 'cos' then r2:=cos(r2);
if Edit5.Text= 'tg' then r2:=tan(r2);
if Edit5.Text= 'ctg' then r2:=cot(r2);
if Edit5.Text= 'arcsin' then r2:=arcsin(r2);
if Edit5.Text= 'arccos' then r2:=arccos(r2);
end;
// Functions 2
r1:=r / r2;
re:=0;rec:=0;
if SpinEdit3.Value <> 10 then
begin
  if Frac(r1) <> 10 then
  begin
    j:=round(Int(r1));
    str:=' ';
    i:=1;
    pr:=0;
    while (j > 0) and (pr < 15) do
    begin
      a[i]:= j mod SpinEdit3.Value;
      j:=j div SpinEdit3.Value;
      i:=i+1;
      inc(pr);
    end;
    for j:=1 to i do
      str:=Concat(str,FloattoStr(a[i-j+1]));
    rec:=StrtoFloat(str);
    f:=Frac(r1);
    i:=1;
    pr:=0;
    while (f <> 0) and (pr < 15) do
    begin
      f:=f * SpinEdit3.Value;
      b[i]:=Trunc(f);
      f:=Frac(f);
      i:=i+1;
      inc(pr);
    end;
    str:=' ';
    for j:=1 to i do
      str:=Concat(str,FloattoStr(b[i-j+1]));
    re:=StrtoFloat(str);
    str:=Concat(FloattoStr(rec),',',FloattoStr(re));
    Edit3.Text:=str;
  end
  else
  begin
    j:=round(r1);
    str:=' ';
    i:=1;
    pr:=0;
    while (j > 0) and (pr < 15) do
    begin
      a[i]:=j mod SpinEdit3.Value;
      j:=j div SpinEdit3.Value;
      i:=i+1;
      inc(pr);
    end;
    for j:=1 to i do
      str:=Concat(str,FloattoStr(a[i-j+1]));
    Edit3.Text:=str;
  end;
end
else
  Edit3.Text:=FloattoStr(r1);
end;
end;
//////////////////////Деление END//////////////////////////////////


procedure TForm1.Button7Click(Sender: TObject);
begin
Form2.Show;
end;

procedure TForm1.BitBtn9Click(Sender: TObject);
begin
if flag1 then  Edit1.Text:=ConCat(Edit1.Text,'1');
if flag2 then  Edit2.Text:=ConCat(Edit2.Text,'1');
end;

procedure TForm1.Edit1Click(Sender: TObject);
begin
if  Edit1.Focused then
begin
  flag1:=true;
  flag2:=false;
end;
end;


procedure TForm1.Edit2Click(Sender: TObject);
begin
if  Edit2.Focused then
begin
  flag2:=true;
  flag1:=false;
end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
flag1:=false;
flag2:=false;
for i:=10 to 35 do
  alf[i]:=chr(65+i-10);
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
begin
if flag1 then  Edit1.Text:=ConCat(Edit1.Text,'2');
if flag2 then  Edit2.Text:=ConCat(Edit2.Text,'2');
end;

procedure TForm1.BitBtn5Click(Sender: TObject);
begin
if flag1 then  Edit1.Text:=ConCat(Edit1.Text,'3');
if flag2 then  Edit2.Text:=ConCat(Edit2.Text,'3');
end;

procedure TForm1.BitBtn6Click(Sender: TObject);
begin
if flag1 then  Edit1.Text:=ConCat(Edit1.Text,'4');
if flag2 then  Edit2.Text:=ConCat(Edit2.Text,'4');
end;

procedure TForm1.BitBtn8Click(Sender: TObject);
begin
if flag1 then  Edit1.Text:=ConCat(Edit1.Text,'5');
if flag2 then  Edit2.Text:=ConCat(Edit2.Text,'5');
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
begin
if flag1 then  Edit1.Text:=ConCat(Edit1.Text,'6');
if flag2 then  Edit2.Text:=ConCat(Edit2.Text,'6');
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
if flag1 then  Edit1.Text:=ConCat(Edit1.Text,'7');
if flag2 then  Edit2.Text:=ConCat(Edit2.Text,'7');
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
if flag1 then  Edit1.Text:=ConCat(Edit1.Text,'8');
if flag2 then  Edit2.Text:=ConCat(Edit2.Text,'8');
end;

procedure TForm1.BitBtn7Click(Sender: TObject);
begin
if flag1 then  Edit1.Text:=ConCat(Edit1.Text,'9');
if flag2 then  Edit2.Text:=ConCat(Edit2.Text,'9');
end;

procedure TForm1.BitBtn10Click(Sender: TObject);
begin
if flag1 then  Edit1.Text:=ConCat(Edit1.Text,'0');
if flag2 then  Edit2.Text:=ConCat(Edit2.Text,'0');
end;

procedure TForm1.BitBtn12Click(Sender: TObject);
begin
if flag1 then  Edit1.Text:=ConCat(Edit1.Text,'00');
if flag2 then  Edit2.Text:=ConCat(Edit2.Text,'00');
end;

procedure TForm1.BitBtn11Click(Sender: TObject);
begin
if flag1 then  Edit1.Text:=ConCat(Edit1.Text,',');
if flag2 then  Edit2.Text:=ConCat(Edit2.Text,',');
end;

procedure TForm1.Edit3Click(Sender: TObject);
begin
flag1:=false;
flag2:=False;
end;

procedure TForm1.BitBtn13Click(Sender: TObject);
begin
if func1 then  Edit4.Text:='sin';
if func2 then  Edit5.Text:='sin';
end;



procedure TForm1.Edit4Click(Sender: TObject);
begin
func1:=true;
func2:=false;
end;

procedure TForm1.Edit5Click(Sender: TObject);
begin
func1:=false;
func2:=true;
end;

procedure TForm1.BitBtn17Click(Sender: TObject);
begin
if func1 then  Edit4.Text:='cos';
if func2 then  Edit5.Text:='cos';
end;

procedure TForm1.BitBtn14Click(Sender: TObject);
begin
if func1 then  Edit4.Text:='tg';
if func2 then  Edit5.Text:='tg';
end;

procedure TForm1.BitBtn15Click(Sender: TObject);
begin
if func1 then  Edit4.Text:='ctg';
if func2 then  Edit5.Text:='ctg';
end;

procedure TForm1.BitBtn16Click(Sender: TObject);
begin
if func1 then  Edit4.Text:='arcsin';
if func2 then  Edit5.Text:='arcsin';
end;


procedure TForm1.BitBtn18Click(Sender: TObject);
begin
if func1 then  Edit4.Text:='arccos';
if func2 then  Edit5.Text:='arccos';
end;

procedure TForm1.BitBtn19Click(Sender: TObject);
begin
if func1 then  Edit4.Text:='arctg';
if func2 then  Edit5.Text:='arctg';
end;

procedure TForm1.BitBtn20Click(Sender: TObject);
begin
if func1 then  Edit4.Text:='arcctg';
if func2 then  Edit5.Text:='arcctg';
end;

procedure TForm1.Edit1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  chb,stb:string;
begin

if (Key >= 65) and (Key <= 90) then
begin
chb:=chr(Key);
stb:=Edit1.Text;
Delete(stb,Edit1.SelStart,1);
Edit1.Text:=ConCat(stb,chb);
Edit1.SelStart:=length(Edit1.Text);
end;
if Key = 190 then
begin
stb:=Edit1.Text;
Delete(stb,Edit1.SelStart,1);
Edit1.Text:=ConCat(stb,',');
Edit1.SelStart:=length(Edit1.Text);
end;
end;



procedure TForm1.Edit2KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  chb,stb:string;
begin
if (Key >= 65) and (Key <= 90) then
begin
chb:=chr(Key);
stb:=Edit2.Text;
Delete(stb,Edit2.SelStart,1);
Edit2.Text:=ConCat(stb,chb);
Edit2.SelStart:=length(Edit2.Text);
end;
end;

end.
