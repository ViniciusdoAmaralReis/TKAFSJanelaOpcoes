# 🚀 TKAFSJanelaOpcoes

Componente Delphi/FireMonkey especializado para exibição de janelas de opções modais personalizáveis.

## 📋 Descrição

Componente derivado de `TKAFSJanelaModal` que adiciona funcionalidades específicas para criação de janelas de opções com área de conteúdo rolável e comportamentos personalizados.

## ✨ Características

- ✅ Herda todas as características do TKAFSJanelaModal
- ✅ Área de conteúdo com ScrollBox para opções extensas
- ✅ Comportamento específico para janelas de opções
- ✅ Botões de ação configuráveis (voltar e sair)
- ✅ Suporte multiplataforma (Windows, Android)
- ✅ Cores totalmente personalizáveis
- ✅ Integração completa com o componente base TKAFSJanelaModal

## 🛠️ Configuração

### Parâmetros de Configuração

```
Windows: Exibe texto "Fechar ❯" no botão de confirmar
Android: Comportamento adaptado para dispositivos móveis
```

## 📦 Como Usar

### Instanciação Básica

```pascal
var
  JanelaOpcoes: TKAFSJanelaOpcoes;
begin
  JanelaOpcoes := TKAFSJanelaOpcoes.Create(Self);
  try
    JanelaOpcoes.KAFSJanelaOpcoesConfig(TAlphaColors.White, TAlphaColors.Blue);
    JanelaOpcoes.Visible := True;
    // Adicionar opções ao ScbCorpo aqui
  finally
    JanelaOpcoes.Free;
  end;
end;
```

### Métodos Principais

| Método | Descrição |
|--------|-----------|
| `Create` | Construtor que cria o ScrollBox para conteúdo |
| `KAFSJanelaOpcoesConfig` | Configura a aparência e comportamento da janela de opções |
| `Retornar` | Fecha a janela de opções (ação do botão voltar) |
| `Sair` | Fecha a aplicação principal (ação do botão confirmar) |
| `Destroy` | Destrutor que libera recursos adequadamente |

### Parâmetros do Método KAFSJanelaOpcoesConfig

```pascal
procedure KAFSJanelaOpcoesConfig(
  const _cortema1: TAlphaColor;    // Cor dos elementos e texto
  const _cortema2: TAlphaColor     // Cor de fundo
);
```

## 🔧 Dependências

- `System.Classes`
- `System.SysUtils`
- `System.UITypes`
- `FMX.Forms`
- `FMX.Layouts`
- `FMX.Types`
- `UntKAFSJanelaModal` (componente base)

## 🎨 Estrutura do Componente

### Elementos Visuais
- **ScbCorpo**: TScrollBox para conter as opções da janela
- Herda todos os elementos de TKAFSJanelaModal (RecCorpo, BtnVoltar, BtnConfirmar, etc.)

### Comportamentos
- **Windows**: Botão de confirmar exibe "Fechar ❯"
- **Botão Voltar**: Fecha a janela de opções
- **Botão Confirmar**: Fecha a aplicação principal

## ⚠️ Comportamento Multiplataforma

- **Windows**: Texto específico no botão confirmar
- **Android**: Comportamento adaptado para touch

## 🎯 Funcionalidades Específicas

- Área de conteúdo rolável para listas longas de opções
- Comportamento padrão para janelas de configurações
- Integração visual consistente com o componente base
- Gerenciamento automático de recursos

---

**Nota:** Este componente é ideal para exibição de telas de configurações, opções do usuário ou qualquer interface que requeira múltiplas opções organizadas em uma área rolável dentro de um modal.
