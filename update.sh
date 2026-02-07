#!/bin/bash

# Colores
GREEN='\033[0;32m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
MAGENTA='\033[0;35m'
NC='\033[0m'

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
║           Sistema de Gestión Automatizada         ║
║                   by JUANRESTREPO95                ║
╚════════════════════════════════════════════════════╝
EOF
echo -e "${NC}\n"

echo -e "${MAGENTA}═══ MENÚ PRINCIPAL ═══${NC}\n"
echo "1) Actualizar sistema"
echo "2) Aplicaciones"
echo "0) Salir"
echo ""
echo -n -e "${CYAN}Selecciona una opción: ${NC}"
