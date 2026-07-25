
---

### 📄 Arquivo 2: `AGENTS.md`
*Este arquivo diz à IA **como** ela deve escrever e modificar o código. É a "regra de ouro" para o Antigravity/IA não quebrar o app.*

```markdown
# 🤖 Instruções para Agentes de IA (Antigravity / Cursor / Copilot)

Este documento contém as diretrizes estritas para modificar, expandir ou corrigir o código deste projeto.

## 🎯 Visão Geral do Projeto
Este é um PWA (Progressive Web App) de página única (SPA) para vistoria de pintura. O foco é **simplicidade, funcionamento offline e performance em celulares**.

## ⚙️ Stack Tecnológica e Restrições
1. **Sem Frameworks:** O projeto usa **apenas HTML, CSS e JavaScript puro (Vanilla)**. Não introduza React, Vue, Angular ou build steps (Webpack/Vite).
2. **Arquivo Único:** Todo o CSS e JS da aplicação principal vive dentro do `index.html`. Mantenha essa estrutura para facilitar o deploy.
3. **Dependências Externas:** A única dependência externa permitida é o `jsPDF` via CDN (`unpkg.com`). Não adicione outras bibliotecas sem justificativa crítica.
4. **Persistência:** Os dados são salvos no `localStorage` do navegador. Não crie backends ou APIs a menos que seja explicitamente solicitado.

## 📐 Arquitetura e Padrões de Código
- **Estado Global:** O estado da aplicação (lista de anotações, foto atual, modo de edição) é gerenciado por variáveis globais simples no topo do script (`fotoAtual`, `editandoId`, etc.).
- **Renderização:** A UI é re-renderizada via manipulação direta do DOM (`innerHTML`) na função `renderizarLista()`.
- **Eventos:** Use atributos `onclick` no HTML para manter a simplicidade, ou `addEventListener` para eventos complexos.
- **CSS:** Use CSS puro com variáveis ou cores diretas. O design é *Mobile-First*. Botões devem ter altura mínima de 44px para toque.

##  Tratamento de Imagens
- As imagens são convertidas para Base64 (Data URL) e salvas no `localStorage`.
- **Regra Crítica:** As imagens DEVEM ser redimensionadas no `<canvas>` antes de salvar (máximo 1000px de largura, qualidade 0.6 JPEG) para não estourar o limite de 5MB do LocalStorage.

## 📄 Geração de PDF
- O PDF é gerado usando `jsPDF`.
- O layout do PDF agrupa os itens por local.
- Sempre verifique se `window.jspdf` está carregado antes de tentar exportar.

## 🛠️ Como Adicionar Novas Funcionalidades
Se for pedido para adicionar um novo campo (ex: "Cor da Tinta"):
1. Adicione o `<input>` no formulário dentro de `index.html`.
2. Atualize o objeto de anotação na função `salvarAnotacao()`.
3. Atualize a exibição na função `renderizarLista()`.
4. Atualize a geração do PDF na função `exportarPDF()`.
5. **Não esqueça** de atualizar a função `editarAnotacao()` para popular o novo campo.