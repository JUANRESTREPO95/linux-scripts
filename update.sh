#!/bin/bash

# Colores
GREEN='\033[0;32m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
MAGENTA='\033[0;35m'
NC='\033[0m'

# Función para mostrar el banner
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
║           Sistema de Gestión Automatizada         ║
║                   by JUANRESTREPO95                ║
╚════════════════════════════════════════════════════╝
EOF
    echo -e "${NC}\n"
}

# Función para pausar
pausar() {
    echo ""
    echo -e "${YELLOW}Presiona Enter para continuar...${NC}"
    read
}

# Función de actualización del sistema
actualizar_sistema() {
    mostrar_banner
    echo -e "${YELLOW}🔄 Iniciando actualización del sistema...${NC}\n"
    sleep 1
    
    echo -e "${BLUE}📦 Actualizando lista de paquetes...${NC}"
    sudo apt update
    
    echo ""
    echo -e "${BLUE}⬆️  Instalando actualizaciones...${NC}"
    sudo apt upgrade -y
    
    echo ""
    echo -e "${GREEN}✓ ¡Sistema actualizado correctamente!${NC}"
    pausar
}

# Submenú de Aplicaciones
menu_aplicaciones() {
    while true; do
        mostrar_banner
        echo -e "${MAGENTA}═══ APLICACIONES ═══${NC}\n"
        echo "1) Tailscale"
        echo "2) Samba"
        echo "0) Volver"
        echo ""
        echo -n -e "${CYAN}Selecciona una opción: ${NC}"
        read opcion
        
        case $opcion in
            1)
                mostrar_banner
                echo -e "${BLUE}Instalando Tailscale...${NC}\n"
                curl -fsSL https://tailscale.com/install.sh | sh
                echo ""
                echo -e "${GREEN}✓ Tailscale instalado correctamente${NC}"
                pausar
                ;;
            2)
                mostrar_banner
                echo -e "${BLUE}Instalando Samba...${NC}\n"
                sudo apt install samba -y
                echo ""
                echo -e "${GREEN}✓ Samba instalado correctamente${NC}"
                pausar
                ;;
            0)
                break
                ;;
            *)
                echo -e "${RED}Opción inválida${NC}"
                sleep 1
                ;;
        esac
    done
}

# Menú principal
while true; do
    mostrar_banner
    echo -e "${MAGENTA}═══ MENÚ PRINCIPAL ═══${NC}\n"
    echo "1) Actualizar sistema"
    echo "2) Aplicaciones"
    echo "0) Salir"
    echo ""
    echo -n -e "${CYAN}Selecciona una opción: ${NC}"
    read opcion
    
    case $opcion in
        1)
            actualizar_sistema
            ;;
        2)
            menu_aplicaciones
            ;;
        0)
            mostrar_banner
            echo -e "${GREEN}¡Hasta luego!${NC}\n"
            exit 0
            ;;
        *)
            echo -e "${RED}Opción inválida${NC}"
            sleep 1
            ;;
    esac
done
