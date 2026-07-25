#  Contexto de Negócio e Regras da Aplicação

## 👤 Quem é o Usuário?
O usuário é o **Henrique**, síndico ou administrador de um condomínio. Ele está fazendo a vistoria da pintura realizada por uma empresa terceirizada. Ele estará andando pelo condomínio com o celular na mão, muitas vezes em áreas com pouco ou nenhum sinal de internet (garagens, subsolos, telhados).

## 🎯 Qual o Problema que o App Resolve?
Substituir o bloco de notas e fotos soltas no WhatsApp. O app centraliza a vistoria, garantindo que cada problema de pintura esteja vinculado a uma foto, um local exato e uma descrição clara, gerando um relatório PDF profissional no final para enviar à empresa ou para a assembleia.

## 🔄 Fluxo do Usuário (User Flow)
1. **Abertura:** Henrique abre o app (que já está instalado na tela inicial). O app carrega instantaneamente, mesmo offline.
2. **Registro:** Ele vai até o local (ex: "Hall de Entrada Bloco B"), tira uma foto da parede descascada, escreve "Repintar área de 2m² com mofo", define como "Prioridade Alta" e "Pendente". Salva.
3. **Continuidade:** Ele vai para o próximo local e repete o processo. O app sugere locais já digitados anteriormente.
4. **Correção:** Se ele errou algo, ele clica em "Editar" no card da anotação, o formulário é preenchido, ele corrige e salva.
5. **Finalização:** Ao terminar a vistoria, ele clica em "Exportar PDF". O app gera um arquivo único, agrupado por locais, pronto para ser compartilhado.

## 🗄️ Modelo de Dados (Schema do LocalStorage)
Os dados são salvos no `localStorage` sob a chave `vistoria_pintura_condominio`.
É um Array de Objetos JSON com a seguinte estrutura:

```json
[
  {
    "id": 1716300000000, 
    "local": "Fachada Norte - Bloco A",
    "descricao": "Retocar pintura onde há infiltração próxima à janela 302.",
    "prioridade": "Alta",
    "status": "Pendente",
    "foto": "data:image/jpeg;base64,/9j/4AAQSkZJRg...", 
    "data": "2024-05-21T14:30:00.000Z",
    "dataEdicao": "2024-05-21T15:00:00.000Z" 
  }
]