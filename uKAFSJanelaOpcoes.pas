unit uKAFSJanelaOpcoes;

interface

uses
  System.Classes, System.SysUtils, System.UITypes,
  FMX.Forms, FMX.Graphics, FMX.Layouts, FMX.Types,
  uKAFSBotao, uKAFSJanelaModal;

type
  TKAFSJanelaOpcoes = class(TKAFSJanelaModal)
    scrollCorpo: TScrollBox;
    btnSobre: TKAFSBotao;

    constructor Create(AOwner: TComponent); reintroduce;
    procedure KAFSJanelaOpcoesConfig(const _cortema1, _cortema2: TAlphaColor);
    procedure Retornar(Sender: TObject);
    procedure Sobre(Sender: TObject);
    procedure Sair(Sender: TObject);
    destructor Destroy; override;
  end;

implementation

uses
  uKAFSJanelaSobre;

constructor TKAFSJanelaOpcoes.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  scrollCorpo := TScrollBox.Create(Self);
  with scrollCorpo do
  begin
    Align := TAlignLayout.Client;
    Parent := rectCorpo;
  end;

  btnSobre := TKAFSBotao.Create(Self);
  with btnSobre do
  begin
    Align := TAlignLayout.Bottom;
    Parent := rectCorpo;
    labDescricao.Font.Size := 24;
    labDescricao.Text := 'Sobre';
    labDescricao.TextSettings.Font.Style := [TFontStyle.fsUnderline];
    Margins.Bottom := 5;
    Stroke.Kind := TBrushKind.None;
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
  btnVoltar.btnBotao.OnClick := Retornar;
  btnConfirmar.btnBotao.OnClick := Sair;

  // Cor dos botões de ação e texto
  with btnSobre do
  begin
    Fill.Color := _cortema2;
    labDescricao.FontColor := _cortema1;

    btnBotao.OnCLick := Sobre;
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
    labtitulo.FontColor,
    rectCorpo.Fill.Color);
end;

procedure TKAFSJanelaOpcoes.Sair(Sender: TObject);
begin
  Application.MainForm.Close;
end;

destructor TKAFSJanelaOpcoes.Destroy;
begin

  inherited Destroy;
end;

end.
