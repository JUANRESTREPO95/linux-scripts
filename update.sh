#!/bin/bash

# Colores
CYAN='\033[0;36m'
NC='\033[0m'

mostrar_banner() {
    clear
    echo -e "${CYAN}"
    cat << "EOF"
╔════════════════════════════════════════════════════╗
║                                                    ║
║    ███████╗ ██████╗██████╗ ██╗██████╗ ████████╗    ║
║    ██╔════╝██╔════╝██╔══██╗██║██╔══██╗╚══██╔══╝    ║
║    ███████╗██║     ██████╔╝██║██████╔╝   ██║       ║
║    ╚════██║██║     ██╔══██╗██║██╔═══╝    ██║       ║
║    ███████║╚██████╗██║  ██║██║██║        ██║       ║
║    ╚══════╝ ╚═════╝╚═╝  ╚═╝╚═╝╚═╝        ╚═╝       ║
║                                                    ║
║           Sistema de Gestión Automatizada          ║
║                   by JUANRESTREPO95                ║
╚════════════════════════════════════════════════════╝
EOF
    echo -e "${NC}\n"
}

#APARTIR DE ACA SON LAS VARIABLES PARA ARRIBA ES LA PARTE DE STYLE

mostrar_banner
sudo apt update
