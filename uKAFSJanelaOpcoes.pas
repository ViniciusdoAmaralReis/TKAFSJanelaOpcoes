unit uKAFSJanelaOpcoes;

interface

uses
  System.Classes, System.SysUtils, System.UITypes,
  FMX.Forms, FMX.Graphics, FMX.Layouts, FMX.Types,
  uKAFSBotao, uKAFSJanelaModal;

type
  TKAFSJanelaOpcoes = class(TKAFSJanelaModal)
    sclCorpo: TScrollBox;
    btnSobre: TKAFSBotao;
    imgLogoSobre: TBitmap;

    constructor Create(AOwner: TComponent); reintroduce;
    procedure KAFSJanelaOpcoesConfig(const _cortema1, _cortema2: TAlphaColor; const _imgLogoOpcoes, _imgLogoSobre: TBitmap);
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
  TThread.Synchronize(nil, procedure
  begin
    inherited Create(AOwner);

    sclCorpo := TScrollBox.Create(Self);
    sclCorpo.Align := TAlignLayout.Client;
    sclCorpo.Parent := Self.recCorpo;

    btnSobre := TKAFSBotao.Create(Self);
    btnSobre.Align := TAlignLayout.Bottom;
    btnSobre.Parent := Self.recCorpo;
    btnSobre.labDescricao.Font.Size := 20;
    btnSobre.labDescricao.Text := 'Sobre';
    btnSobre.Margins.Bottom := 5;
    btnSobre.Stroke.Kind := TBrushKind.None;
  end);
end;

procedure TKAFSJanelaOpcoes.KAFSJanelaOpcoesConfig(const _cortema1, _cortema2: TAlphaColor; const _imgLogoOpcoes, _imgLogoSobre: TBitmap);
begin
  var _sair := '';
  {$IFDEF MSWINDOWS}
  _sair := 'Fechar ❯';
  {$ENDIF}

  KAFSJanelaModalConfig(_cortema1, _cortema2, _imgLogoOpcoes, 'Opções', _sair);

  TThread.Synchronize(nil, procedure
  begin
    // Configura componentes
    imgLogoSobre := _imgLogoSobre;

    btnVoltar.btnBotao.OnClick := Retornar;

    btnSobre.btnBotao.OnCLick := Sobre;
    btnSobre.Fill.Color := _cortema2;
    btnSobre.labDescricao.FontColor := _cortema1;

    btnConfirmar.btnBotao.OnClick := Sair;

    Self.Visible := True;
  end);
end;

procedure TKAFSJanelaOpcoes.Retornar(Sender: TObject);
begin
  Self.Free;
end;

procedure TKAFSJanelaOpcoes.Sobre(Sender: TObject);
begin
  var _sobre := TKAFSJanelaSobre.Create(Parent);
  _sobre.KAFSJanelaSobreConfig(
    Self.recTitulo.Fill.Color,
    Self.recCorpo.Fill.Color,
    imgLogoSobre);
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
