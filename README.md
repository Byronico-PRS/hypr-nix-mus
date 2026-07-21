# dotfiles — paulo_dell (NixOS)

Configuração NixOS do notebook Dell de Paulo Serafim (emmp / Byronico-PRS).
Repositório: `hypr-nix-mus` no GitHub.

---

## Hardware

| Componente | Detalhe |
|---|---|
| Máquina | Dell (hostname: `paulo_dell`) |
| CPU | Intel i5-4200U |
| GPU | Intel integrada (nvidia-dell.nix deletado — não funciona nesse modelo) |
| Áudio | Placa onboard + suporte a interfaces USB (Scarlett, MOD Duo) |
| Câmera | Canon DSLR como webcam via v4l2loopback |

---

## Sistema

- **OS:** NixOS 26.05
- **DE:** XFCE com LightDM
- **Áudio:** PipeWire + JACK (via musnix)
- **Home Manager:** 25.11 (versão estável atual — 26.05 ainda não lançado)
- **Canal Musnix:** master

---

## Propósito principal

Este PC serve primariamente como **estação de produção musical**, mas também é usado para:

- Navegação, escritório e comunicação
- Jogos via Steam e Lutris
- Gravação de vídeo (OBS, Canon como webcam)
- Edição de vídeo (Kdenlive)
- Trabalho com modelos de IA (Claude Code via terminal)

---

## Estrutura do repositório

```
.dotfiles/
├── system/                     # Configuração NixOS (sudo nixos-rebuild)
│   ├── configuration.nix       # Entrada principal — imports, locale, usuário, firewall
│   ├── pkgs.nix                # Pacotes do sistema
│   ├── audio.nix               # PipeWire + JACK + musnix (config em uso)
│   ├── steam.nix               # Steam, Lutris, Proton-GE, gamemode, OpenGL
│   ├── video.nix               # Canon DSLR como webcam (v4l2loopback)
│   ├── mod-duo.nix             # MOD Duo conectado via USB (IP estático 192.168.51.2)
│   ├── hardware-configuration.nix  # Gerado pelo NixOS, não editar
│   ├── des/
│   │   └── xfce.nix            # XFCE + LightDM + tema Zukitwo-dark
│   └── scripts/                # Scripts empacotados como derivações Nix
│       ├── apply-system.nix    # nixos-rebuild switch
│       ├── apply-user.nix      # home-manager switch
│       ├── audio-gravacao.nix  # muda quantum para 256 (~5ms)
│       ├── audio-normal.nix    # volta quantum para 1024 (~21ms)
│       ├── reaper-ll.nix       # abre Reaper com PIPEWIRE_LATENCY=128/48000
│       └── calendar.nix        # popup de calendário (yad)
│
├── users/                      # Configuração Home Manager (sem sudo)
│   ├── home.nix                # Pacotes do usuário + plugins de áudio + git + gpg
│   └── xfce/
│       └── xfconf.nix          # Atalhos de teclado XFCE, tema, WM
│
├── Scripts/                    # Shell scripts para aplicar as configs
│   ├── apply-system.sh         # Aplica configuração do sistema
│   ├── apply-user.sh           # Aplica configuração do usuário
│   ├── apply-upgrade.sh        # Atualiza canais + rebuild sistema
│   ├── update-system.sh        # Atualiza sistema
│   └── update-user.sh          # Atualiza usuário
│
├── backgrounds/                # Wallpapers (tema One Punch Man)
└── icon/                       # Ícone do usuário na tela de login
```

---

## Scripts do sistema (disponíveis no terminal após apply-system)

| Comando | O que faz |
|---|---|
| `apply-system` | `sudo nixos-rebuild switch` a partir de `~/.dotfiles/system/configuration.nix` |
| `apply-user` | `home-manager switch` a partir de `~/.dotfiles/users/home.nix` |
| `audio-gravacao` | Define quantum do PipeWire para **256** (~5.3ms de latência) — usar ao gravar |
| `audio-normal` | Volta quantum para **1024** (~21ms) — uso normal / reprodução |
| `reaper-ll` | Abre o Reaper com `PIPEWIRE_LATENCY=128/48000` para máxima performance |
| `calendar` | Abre um popup de calendário no canto da tela |

---

## Áudio

Toda a configuração de áudio está em `system/audio.nix`.

- **PulseAudio**: desabilitado
- **PipeWire**: servidor principal, emulando JACK e PulseAudio
- **musnix**: kernel patches para tempo real (`rtirq`, `rtcqs`, `alsaSeq`)
- **Quantum padrão**: 1024 @ 48000 Hz (~21ms) — adequado para uso normal
- **Modo gravação**: rode `audio-gravacao` para baixar para 256 (~5ms)
- **`implicit_fb=1`**: ativado no `snd-usb-audio` para corrigir ticks periódicos em interfaces USB (Scarlett, MOD Duo)

### MOD Duo

O MOD Duo conecta via USB e aparece como interface ethernet.
O perfil NetworkManager `mod-duo.nix` atribui IP estático `192.168.51.2/24` automaticamente ao plugar.
Interface web do MOD Duo: **http://192.168.51.1**

> **Atenção:** o nome da interface USB (`enp0s29u1u3`) depende da porta usada.
> Se mudar de porta, rode `ip link` com o MOD plugado e edite `mod-duo.nix`.

### Plugins de áudio

Os plugins estão declarados em `users/home.nix` e são **copiados** (não linkados) para:

| Diretório | Formato |
|---|---|
| `~/.lv2` | LV2 |
| `~/.vst3` | VST3 |
| `~/.vst` | VST2 / LXVST |
| `~/.clap` | CLAP |
| `~/.ladspa` | LADSPA |

A cópia real (não symlink) é necessária porque o **Reaper Flatpak** não consegue seguir symlinks para o `/nix/store`.
A cópia é feita automaticamente pelo `home.activation.copyAudioPlugins` a cada `apply-user`.

---

## Gaming

Configurado em `system/steam.nix`:

- **Steam** com Remote Play e Dedicated Server habilitados
- **Proton-GE** (`proton-ge-bin`) como camada de compatibilidade extra
- **Gamemode** (`programs.gamemode.enable`) para melhor performance em jogos
- **Lutris** com `wineWow64Packages.full` nas bibliotecas extras
- **OpenGL 32bit** habilitado (`hardware.graphics.enable32Bit`)

---

## Atalhos XFCE (xfconf.nix)

| Atalho | Ação |
|---|---|
| `Super + W` | Abre Brave |
| `Super + C` | Abre VSCodium |
| `Super + Z` | Menu Whisker |
| `Super + Q` | Fecha janela |
| `Super + 1/2/3/4` | Muda de workspace |
| `Shift + Super + 1/2/3/4` | Move janela para workspace |
| `Super + D / F` | Move janela para monitor esquerdo/direito |
| `Ctrl + Shift + A / D` | Cola janela esquerda/direita |
| `Ctrl + Shift + S` | Maximiza janela |

---

## Câmera Canon como webcam

Configurado em `system/video.nix` via `v4l2loopback`.
O dispositivo aparece como `"Canon"` para aplicativos como Zoom, OBS, etc.
Requer `ffmpeg` para transmitir o feed da câmera para o dispositivo virtual.

---

## Histórico de configuração

### Sessão — Julho 2026

**O que foi feito (limpeza e consolidação):**

- Deletados todos os configs não usados: Hyprland, AwesomeWM, Budgie, GNOME, KDE, `audio-old.nix`, `audio-pipewire.nix`, `nvidia-dell.nix`
- Removida toda a pasta `users/hyprland/` e `system/wms/`
- `pkgs.nix`: removidos duplicados (`zafiro-icons`, `kdeconnect-kde`, `wine`, `xdg-desktop-portal`)
- `configuration.nix`: removido serviço Dropbox incompleto, fechada porta VNC 5900, limpos imports
- `xfconf.nix`: corrigido icon theme de `maia-dark` → `Zafiro` (maia não estava instalado)
- `home.nix`: removido `hyprcursor` (Hyprland desabilitado); reorganizado com `home.activation.copyAudioPlugins`
- `steam.nix`: adicionado `hardware.graphics.enable`, `gamemode`, `proton-ge-bin`, libs do lutris
- Corrigidas deprecações do nixpkgs 26.05: `wineWowPackages` → `wineWow64Packages`, `surge-XT` → `surge-xt`, pacotes XFCE movidos para top-level
- Configurado SSH key (ed25519) para push ao GitHub
- Canal home-manager atualizado para `release-25.11` (versão estável atual — 26.05 ainda não lançado)
- Adicionados ao git: `mod-duo.nix`, `audio-gravacao.nix`, `audio-normal.nix`

**Estado atual do sistema:**
- Tudo funcionando: XFCE, PipeWire+JACK, MOD Duo, Steam, plugins de áudio copiados
- Warning esperado: home-manager 25.11 + NixOS 26.05 (mismatch vai sumir quando HM lançar 26.05)
- Warnings de deprecação internos do NixOS (`xfce.xfconf`, `xorg.lndir`): não são nosso código, ignorar

**Próximas melhorias possíveis:**
- Configurar Bluetooth (atualmente `bluez-alsa`/`bluez-tools` instalados mas `hardware.bluetooth.enable` não está ativo)
- Explorar `musnix.kernel.realtime = true` para latência ainda menor (linha comentada em `configuration.nix`)
- Atualizar home-manager para 26.05 quando sair

---

## Canais Nix

```
nixos         https://channels.nixos.org/nixos-26.05
home-manager  https://github.com/nix-community/home-manager/archive/release-25.11.tar.gz
musnix        https://github.com/musnix/musnix/archive/master.tar.gz
```

Para atualizar tudo:
```sh
apply-upgrade
```
