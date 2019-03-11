# Ferramentas, projetos, filosofias e metodologias que podem ser utilizadas por profissionais de tecnologia.

###### versão 0.0.0.0.1
###### Caso tenha alguma recomendação ou dica, colabore com esta página :D

## Se você é Sysadmin/DevOps ou Desenvolvedor, alguma coisa aqui pode lhe ser útil, ou não.

| Tópico                             | Descrição                                                   |
|:-----------------------------------|:------------------------------------------------------------|
| [Ferramentas para seu desktop](#Desktop) | Ferramentas que podem melhorar sua produtividade no dia a dia |
| [Desenvolvimento ](#Desenvolvimento) | Compilação de feramentas para desenvolvedores/sysadmins |
| [Ferramentas para DevOps](#DevOps) | Compilação de ferramentas DevOps |
| [Diagramas e fluxogramas](#Diagrama) | Ferramentas para elaboração de diagramas e fluxogramas |
| [Editores de texto](#Editores) | Conheço apenas VIM e VSCode | 
| [Metodologias e filosofias](#Metodologias) | Filosofias, metodologias e boas práticas |

| Diversos                             | Bonus track/Lado B                                        |
|:-----------------------------------|:------------------------------------------------------------|
| [Imagens](images/images.md) | Algumas imagens baixadas por aí | 
| [Primeira versão deste documento](docs/old_sc.md) | Lista de ferramentas para profissinais de TI |
| [Dicas](#Dicas) | Dicas de linhas de comando |
| [Livros e handbooks](handbooks/books.md) | Livros e handbooks |


# Desktop

Em breve.

# Desenvolvimento

| Desenvolvimento                    | Ferramentas e dicas para desenvolvimento                  |
|:-----------------------------------|:------------------------------------------------------------|
| [gitignore.io](https://www.gitignore.io/) | Create useful .gitignore files for your project |

# DevOps

| Tópico                             | Descrição                                                   |
|:-----------------------------------|:------------------------------------------------------------|
| [microk8s.io](https://microk8s.io/) | Kubernetes for workstations and appliances |
| [Docker](https://www.docker.com/) | Docker is a tool designed to make it easier to create, deploy, and run applications by using containers. |
| [Kubernetes](https://kubernetes.io/) | Kubernetes (K8s) is an open-source system for automating deployment, scaling, and management of containerized applications. |
| [Ansible](https://www.ansible.com/) | Ansible is the simplest way to automate apps and IT infrastructure. Application Deployment + Configuration Management + Continuous Delivery. |
| [Terraform](https://www.terraform.io/) | Write, Plan, and Create Infrastructure as Code | 

# Diagrama

| Tópico                             | Descrição                                                   |
|:-----------------------------------|:------------------------------------------------------------|
| [draw.io](https://www.draw.io/) | draw.io is free online diagram software for making flowcharts, process diagrams, org charts, UML, ER and network diagrams. |
| [cloudcraft.co](https://cloudcraft.co/) | Visualize your AWS environment as isometric architecture diagrams. Snap together blocks for EC2s, ELBs, RDS and more. Connect your live AWS environment. |
| [DIA](http://dia-installer.de/) | Dia is free (open source) drawing software. |
| [Microsoft Visio](https://office.live.com/start/visio.aspx) | Microsoft Visio is a diagramming and vector graphics application and is part of the Microsoft Office family. |

# Editores

| Tópico                             | Descrição                                                   |
|:-----------------------------------|:------------------------------------------------------------|
| [VIM](https://www.vim.org/) | Vim is a highly configurable text editor for efficiently creating and changing any kind of text. It is included as "vi" with most UNIX systems and with Apple OS X. |
| [Microsoft vscode](https://code.visualstudio.com/) | Visual Studio Code is a lightweight but powerful source code editor which runs on your desktop and is available for Windows, macOS and Linux. |
| [NeoVIM](https://neovim.io) | Neovim is a refactor, and sometimes redactor, in the tradition of Vim (which itself derives from Stevie). It is not a rewrite but a continuation and extension of Vim. Many clones and derivatives exist, some very clever—but none are Vim. Neovim is built for users who want the good parts of Vim, and more. |

### VIM Cheat Sheet
https://vim.rtorr.com

# Metodologias

| Tópico                             | Descrição                                                   |
|:-----------------------------------|:------------------------------------------------------------|
| [The twelve-factor app](https://12factor.net/) | The twelve-factor methodology can be applied to apps written in any programming language, and which use any combination of backing services (database, queue, memory cache, etc). |
| [The agile manifesto](https://agilemanifesto.org/) | Manifesto for Agile Software Development |
| [OKR](https://rework.withgoogle.com/guides/set-goals-with-okrs/steps/introduction/) | OKR (Objectives and Key Results) is a goal system used by Google and others. It is a simple tool to create alignment and engagement around measurable goals. |
| [Pomodoro Technique](https://francescocirillo.com/pages/pomodoro-technique) | The Pomodoro Technique is a time management method developed by Francesco Cirillo in the late 1980s. The technique uses a timer to break down work into intervals, traditionally 25 minutes in length, separated by short breaks. |
| [Git best pratices](https://sethrobertson.github.io/GitBestPractices/) | Best Practices vary from environment to environment, and there is no One True Answer, but still, this represents a consensus from #git and in some cases helps you frame the discussion for the generation of your very own best practices. |

# Dicas

- Extract HTTP Passwords in POST Requests
```bash
sudo tcpdump -s 0 -A -n -l | egrep -i "POST /|pwd=|passwd=|password=|Host:"
```
- Capture FTP Credentials and Commands
```bash
sudo tcpdump -nn -v port ftp or ftp-data
```
- Capture all plaintext passwords
```bash
sudo tcpdump port http or port ftp or port smtp or port imap or port pop3 or port telnet -l -A | egrep -i -B5 'pass=|pwd=|log=|login=|user=|username=|pw=|passw=|passwd=|password=|pass:|user:|username:|password:|login:|pass |user '
```
- Display live hosts on the network
```bash
nmap -sP "$(ip -4 -o route get 1 | cut -d ' ' -f 7)"/24 | grep report | cut -d ' ' -f 5-
```
- Generate a self-signed certificate
```bash
openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:2048 -keyout privateKey.key -out certificate.crt
```

- See all online IPs in your network
```bash
for x in {1..255} ; do (ping 192.168.1.255 -c 1 -w 5 >/dev/null && echo 192.168.1.255 &) ; done
```