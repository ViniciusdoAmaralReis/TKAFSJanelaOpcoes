unit UntKAFSJanelaOpcoes;

interface

uses
  System.Classes, System.SysUtils, System.UITypes,
  FMX.Forms, FMX.Layouts, FMX.Types,
  UntKAFSBotao, UntKAFSJanelaModal;

type
  TKAFSJanelaOpcoes = class(TKAFSJanelaModal)
    ScbCorpo: TScrollBox;
    BtnSobre: TKAFSBotao;

    constructor Create(AOwner: TComponent); override;
    procedure KAFSJanelaOpcoesConfig(const _cortema1, _cortema2: TAlphaColor);
    procedure Retornar(Sender: TObject);
    procedure Sobre(Sender: TObject);
    procedure Sair(Sender: TObject);
    destructor Destroy; override;
  end;

implementation

uses
  UntKAFSJanelaSobre;

constructor TKAFSJanelaOpcoes.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  ScbCorpo := TScrollBox.Create(Self);
  with ScbCorpo do
  begin
    Align := TAlignLayout.Client;
    Parent := RecCorpo;
  end;

  BtnSobre := TKAFSBotao.Create(Self);
  with BtnSobre do
  begin
    Align := TAlignLayout.Bottom;
    Parent := RecCorpo;
    LabDescricao.Font.Size := 24;
    LabDescricao.Text := 'Sobre';
    Margins.Bottom := 10;
    Margins.Left := 50;
    Margins.Right := 50;
  end;
end;

procedure TKAFSJanelaOpcoes.KAFSJanelaOpcoesConfig(const _cortema1, _cortema2: TAlphaColor);
begin
  var _sair := '';
  {$IFDEF MSWINDOWS}
  _sair := 'Fechar ❯';
  {$ENDIF}

  // Configura propriedades da tela padrão
  KAFSJanelaModalConfig(_cortema1, _cortema2, 'Opções', '🔧', _sair);

  // Associa procedures aos botões
  BtnVoltar.OnClick := Retornar;
  BtnConfirmar.OnClick := Sair;

  // Cor dos botões de ação e texto
  with BtnSobre do
  begin
    Fill.Color := _cortema1;
    LabDescricao.FontColor := _cortema2;

    OnCLick := Sobre;
  end;

  TThread.Synchronize(nil, procedure begin Visible := True; end);
end;

procedure TKAFSJanelaOpcoes.Retornar(Sender: TObject);
begin
  Free;
end;

procedure TKAFSJanelaOpcoes.Sobre(Sender: TObject);
begin
  var _sobre := TKAFSJanelaSobre.Create(Parent);
  _sobre.KAFSJanelaSobreConfig(
    Labtitulo.FontColor,
    RecCorpo.Fill.Color);
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
