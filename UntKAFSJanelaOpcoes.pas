unit UntKAFSJanelaOpcoes;

interface

uses
  System.Classes, System.SysUtils, System.UITypes,
  FMX.Forms, FMX.Layouts, FMX.Types,
  UntKAFSJanelaModal;

type
  TKAFSJanelaOpcoes = class(TKAFSJanelaModal)
    ScbCorpo: TScrollBox;

    constructor Create(AOwner: TComponent); override;
    procedure KAFSJanelaOpcoesConfig(const _cortema1, _cortema2: TAlphaColor);
    procedure Retornar(Sender: TObject);
    procedure Sair(Sender: TObject);
    destructor Destroy; override;
  end;

implementation

constructor TKAFSJanelaOpcoes.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  ScbCorpo := TScrollBox.Create(Self);
  with ScbCorpo do
  begin
    Align := TAlignLayout.Client;
    Parent := RecCorpo;
  end;
end;

procedure TKAFSJanelaOpcoes.KAFSJanelaOpcoesConfig(const _cortema1, _cortema2: TAlphaColor);
begin
  var _sair := '';
  {$IFDEF MSWINDOWS}
  _sair := 'Fechar ❯';
  {$ENDIF}

  TThread.Synchronize(nil, procedure
  begin
    // Configura propriedades da tela padrão
    KAFSJanelaModalConfig(_cortema1, _cortema2, 'Opções', _sair);

    Visible := True;
  end);

  // Associa procedures aos botões
  BtnVoltar.OnClick := Retornar;
  BtnConfirmar.OnClick := Sair;
end;

procedure TKAFSJanelaOpcoes.Retornar(Sender: TObject);
begin
  Free;
end;

procedure TKAFSJanelaOpcoes.Sair(Sender: TObject);
begin
  Application.MainForm.Close;
end;

destructor TKAFSJanelaOpcoes.Destroy;
begin
  if Assigned(ScbCorpo) then
    FreeAndNil(ScbCorpo);

  inherited Destroy;
end;

end.
