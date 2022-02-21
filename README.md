# Flutter Challenge 20210610

Aplicativo desenvolvido para o desafio de Flutter da [Coodesh](https://coodesh.com/). 

A aplicação recupera dados do Firestore através de uma Realtime Database e gera uma lista editável de produtos.

## Instruções de instalação

Para instalar o aplicativo basta executar o [.apk](https://drive.google.com/file/d/133BKzadSasrDzalH6f1bsYyGJfn5PVoo/view?usp=sharing) no seu dispositivo android. É importante ativar a permissão de "[Fontes Desconhecidas](https://www.tudocelular.com/curiosidade/noticias/n139751/como-instalar-apps-fontes-desconhecidas-android.html)" para conseguir instalar o arquivo.

<img title="" src="assets/qrcode.png" alt="QR code para Download" width="163" data-align="center">

Ou clicando [aqui](https://drive.google.com/file/d/133BKzadSasrDzalH6f1bsYyGJfn5PVoo/view?usp=sharing).

## Instruções de utilização

Na tela principal do aplicativo há uma lista de produtos contendo as seguintes informações:

- Foto

- Título

- Tipo

- Avaliação

- Data de criação

- Preço

Também é possível excluir e editar os items através dos botões em cada um dos items.

**Para editar um item**, basta tocar no ícone do lápis no canto superior direito do card. Uma tela de edição aparecerá com os campos preenchidos com as informações atuais do item selecionado. Basta editar os campos existentes. É necessário que o campo de título não seja vazio! Caso contrário, as edições não poderão ser confirmadas.

**Para excluir um item**, basta tocar no ícone "X" no canto superior direito do card. Em seguida, aparecerá uma mensagem de confirmação, então basta confirmar a exclusão do item. 

Após a exclusão de todos os items, aparecerá uma mensagem informando que o banco de dados está vazio, então basta pressionar o botão para redefinir a base de dados no centro da tela. Isso fará com que os items sejam restaurados ao seu estado original, descartando todas as modificações realizadas previamente.
