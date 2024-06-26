# My Money

O Objeto do MyMoney é listar blogs post sobre como fazer seu dinheiro render, variações da bolsa e dicas de uso!

## Tabela de Conteúdos

- [Pré-requisitos](#pré-requisitos)
- [Instalação](#instalação)
- [Configuração do Firebase](#configuração-do-firebase)
- [Estrutura de Pasta](#estrutura-pasta)

## Pré-requisitos

Certifique-se de ter o seguinte instalado em sua máquina:

- [Flutter](https://flutter.dev/docs/get-started/install)
- [Firebase CLI](https://firebase.google.com/docs/cli)

## Instalação

Siga os passos abaixo para instalar o projeto:

```bash
# Clone o repositório
git clone https://github.com/TaylonKalel/mymoney.git

# Navegue até o diretório do projeto
cd mymoney

# Instale as dependências do Flutter
flutter pub get`
```

## Configuração do Firebase

- [Firebase](https://firebase.google.com/docs/flutter/setup?hl=pt-br&platform=web)


## Estrutura de Pasta

mymoney/
├── android/                               			# Diretório do projeto para a plataforma Android
├── assets/								   			# Diretório do projeto para o armazenamento de arquivos
│   ├── svg								   			# Diretório do projeto para o armazenamento de svg
├── build/                                 			# Diretório de saída da build
├── ios/                                   			# Diretório do projeto para a plataforma iOS
├── lib/                                   			# Diretório principal do código-fonte Dart
│   ├── global/                            			# Diretório para variáveis e configurações globais
│   ├── loading_service/                   			# Serviço para gerenciar estados de carregamento
│   ├── models/                            			# Diretório de modelos de dados
│   │   ├── ad_model.dart                  			# Modelo de dados para anúncios
│   │   ├── login_model.dart               			# Modelo de dados para login
│   │   ├── response.dart                    		# Modelo de dados para reposta da autenticação
│   │   ├── user_model.dart                			# Modelo de dados para usuário
│   ├── pages/                             			# Diretório para as páginas da aplicação
│   │   ├── authentication/                			# Diretório para funcionalidades de autenticação
│   │   │   ├── login/                     			# Diretório para funcionalidades de login
│   │   │   │   ├── login_page.dart        			# Página de login
│   │   │   │   ├── login_service.dart     			# Serviço para login
│   │   │   ├── register/                  			# Diretório para funcionalidades de registro
│   │   │   │   ├── register_page.dart     			# Página de registro
│   │   │   │   ├── register_service.dart  			# Serviço para registro
│   │   │   ├── validation_email_and_password.dart 	# Validação de email e senha
│   │   ├── home_page.dart                 			# Página inicial
│   │   ├── home_service.dart              			# Serviço para a página inicial
│   ├── widgets/                           			# Diretório de widgets reutilizáveis
│   │   ├── button_widget.dart             			# Widget de botão personalizado
│   │   ├── divider_widget.dart            			# Widget de divisor personalizado
│   │   ├── link_widget.dart               			# Widget de link personalizado
│   │   ├── loading_widget.dart            			# Widget de carregamento personalizado
│   │   ├── logo_widget.dart               			# Widget de logo personalizado
│   │   ├── text_widget.dart               			# Widget de texto personalizado
│   ├── router.dart                        			# Configuração de rotas da aplicação
│   ├── theme.dart                         			# Configuração de tema da aplicação
├── web/                                   			# Diretório para arquivos específicos da web
│   ├── index.html                         			# Página HTML principal
│   ├── favicon.png                        			# Ícone do site
├── test/                                  			# Diretório para testes
│   └── widget_test.dart                   			# Testes de widgets
├── pubspec.yaml                           			# Arquivo de configuração do Flutter
├── README.md                              			# Documentação do projeto


O aplicativo, apesar de sua simplicidade, adota uma padronização clara entre as páginas (pages) e os serviços (services). Nesta estrutura, a responsabilidade pela exibição da interface do usuário é separada da lógica de negócios, garantindo um código mais organizado, modular e fácil de manter.