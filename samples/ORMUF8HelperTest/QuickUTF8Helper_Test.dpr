program QuickUTF8Helper_Test;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  SynCommons,
  Quick.Log,
  Quick.Console,
  Quick.Commons,
  Quick.UTF8Helper;

var
  R : RawUTF8;
  S : string;
  done : Boolean;
  auxR : RawUTF8;
  auxS : string;

const
  TESTPHRASE = '�ngel, �guila, T�tulo, Amigo, �gora, Est�s?';
  TESTPHRASE2 = 'uno, dos, tres, cuatro � cinco � seis y siete';

procedure Check(const Test : string; B1, B2 : Boolean);
begin
  if B1 = B2 then coutFmt('%s [Good=%s / Real=%s]',[Test,BoolToStr(B1,True),BoolToStr(B2,True)],etSuccess)
    else coutFmt('%s [Good=%s / Real=%s]',[Test,BoolToStr(B1,True),BoolToStr(B2,True)],etError);
end;

begin
  Console.LogVerbose := LOG_DEBUG;
  R := TESTPHRASE;
  S := TESTPHRASE;
  cout(R,etDebug);
  //STRING: StartsWith Test
  cout('//STRING: StartsWith Test',etInfo);

  done := S.StartsWith('�ngel',False);
  Check('1. StartsWith(''�ngel'',CaseSensitive)',False,done);

  done := S.StartsWith('�ngel',False);
  Check('2. StartsWith(''�ngel'',CaseSensitive)',True,done);

  done := S.StartsWith('�ngel',True);
  Check('3. StartsWith(''�ngel'',IgnoreCase)',True,done);

  done := S.StartsWith('�ngel',True);
  Check('4. StartsWith(''�ngel'',IgnoreCase)',True,done);

  //RAWUTF8: StartsWith Test
  cout('//RAWUTF8: StartsWith Test',etInfo);

  done := R.StartsWith('�ngel',False);
  Check('1. StartsWith(''�ngel'',CaseSensitive)',False,done);

  done := R.StartsWith('�ngel',False);
  Check('2. StartsWith(''�ngel'',CaseSensitive)',True,done);

  done := R.StartsWith('�ngel',True);
  Check('3. StartsWith(''�ngel'',IgnoreCase)',True,done);

  done := R.StartsWith('�ngel',True);
  Check('4. StartsWith(''�ngel'',IgnoreCase)',True,done);

  //STRING: EndsWith Test
  cout('//STRING: EndsWith Test',etInfo);

  done := S.EndsWith('t�s?',False);
  Check('1. EndsWith(''t�s?'',CaseSensitive)',True,done);

  done := S.EndsWith('T�S?',False);
  Check('2. EndsWith(''T�S?'',CaseSensitive)',False,done);

  done := S.EndsWith('t�s?',True);
  Check('3. EndsWith(''t�s?'',IgnoreCase)',True,done);

  done := S.EndsWith('T�S?',True);
  Check('4. EndsWith(''T�S?'',IgnoreCase)',True,done);

  //RAWUTF8: EndsWith Test
  cout('//RAWUTF8: EndsWith Test',etInfo);

  done := R.EndsWith('t�s?',False);
  Check('1. EndsWith(''t�s?'',CaseSensitive)',True,done);

  done := R.EndsWith('T�S?',False);
  Check('2. EndsWith(''T�S?'',CaseSensitive)',False,done);

  done := R.EndsWith('t�s?',True);
  Check('3. EndsWith(''t�s?'',IgnoreCase)',True,done);

  done := R.EndsWith('T�S?',True);
  Check('4. EndsWith(''T�S?'',IgnoreCase)',True,done);

  //STRING: Contains Test
  cout('//STRING: Contains Test',etInfo);
  done := S.Contains('t�s?');
  Check('1. Contains(''t�s?'',CaseSensitive)',True,done);

  done := S.Contains('T�S?');
  Check('2. Contains(''T�S?'',CaseSensitive)',False,done);

  done := S.Contains('T�S?');
  Check('3. Contains(''T�S?'',IgnoreCase) [not implemented]',False,done);

  //RAWUTF8: Contains Test
  cout('//RAWUTF8: Contains Test',etInfo);
  done := R.Contains('t�s?',False);
  Check('1. Contains(''t�s?'',CaseSensitive)',True,done);

  done := R.Contains('T�S?',False);
  Check('2. Contains(''T�S?'',CaseSensitive)',False,done);

  done := R.Contains('T�TULO',True);
  Check('3. Contains(''T�TULO'',IgnoreCase)',True,done);

  //STRING: Uppercase Test
  cout('//STRING: Uppercase Test',etInfo);
  cout(S.ToUpper,etWarning);

  //RAWUTF8: Uppercase Test
  cout('//RAWUTF8: Uppercase Test',etInfo);
  cout(R.ToUpper,etWarning);

  //STRING: LowerCase Test
  cout('//STRING: LowerCase Test',etInfo);
  cout(S.ToLower,etWarning);

  //RAWUTF8: LowerCase Test
  cout('//RAWUTF8: LowerCase Test',etInfo);
  cout(R.ToLower,etWarning);

  R := TESTPHRASE;
  S := TESTPHRASE;
  //STRING: CapitalizeAll Test
  cout('//STRING: CapitalizeAll Test',etInfo);
  cout(CapitalizeWords(S),etWarning);

  //RAWUTF8: CapitalizeAll Test
  cout('//RAWUTF8: CapitalizeAll Test',etInfo);
  cout(R.CapitalizeAll,etWarning);

  R := TESTPHRASE2;
  S := TESTPHRASE2;
  //STRING: Split Test
  cout('//STRING: Split Test',etInfo);
  cout(S,etDebug);
  for auxS in S.Split([',','y','�']) do
  begin
    cout(auxS.Trim,etWarning);
  end;

  //RAWUTF8: Split Test
  cout('//RAWUTF8: Split Test',etInfo);
  cout(R,etDebug);
  for auxR in R.Split([',','y','�']) do
  begin
    cout(auxR.Trim,etWarning);
  end;


  ConsoleWaitForEnterKey;
end.
