#!/bin/bash
# Colores
CYAN='\033[0;36m'
GREEN='\033[0;32m'
NC='\033[0m'

# Variables para tracking de selección
tailscale_selected=0
samba_selected=0

# Función para mostrar checkbox
mostrar_checkbox() {
    if [ $1 -eq 1 ]; then
        echo -e "${GREEN}[✓]${NC}"
    else
        echo "[ ]"
    fi
}

# Función para el submenú de aplicaciones
submenu_aplicaciones() {
    while true; do
        clear
        echo -e "${CYAN}"
        echo "╔════════════════════════════════════════════════════╗"
        echo "║              MENÚ DE APLICACIONES                  ║"
        echo "╚════════════════════════════════════════════════════╝"
        echo -e "${NC}\n"
        
        echo "═══ SELECCIONA APLICACIONES ═══"
        echo ""
        echo "1) $(mostrar_checkbox $tailscale_selected) Tailscale"
        echo "2) $(mostrar_checkbox $samba_selected) Samba"
        echo ""
        echo "9) Instalar seleccionadas"
        echo "0) Volver al menú principal"
        echo ""
        echo -n "Selecciona una opción: "
        read subopcion
        
        case $subopcion in
            1)
                # Toggle tailscale
                if [ $tailscale_selected -eq 0 ]; then
                    tailscale_selected=1
                else
                    tailscale_selected=0
                fi
                ;;
            2)
                # Toggle samba
                if [ $samba_selected -eq 0 ]; then
                    samba_selected=1
                else
                    samba_selected=0
                fi
                ;;
            9)
                # Instalar las aplicaciones seleccionadas
                clear
                echo ""
                echo "Instalando aplicaciones seleccionadas..."
                echo ""
                
                if [ $tailscale_selected -eq 1 ]; then
                    echo "→ Instalando Tailscale..."
                    # Aquí va tu código de instalación
                    echo "✓ Tailscale instalado"
                    echo ""
                fi
                
                if [ $samba_selected -eq 1 ]; then
                    echo "→ Instalando Samba..."
                    # Aquí va tu código de instalación
                    echo "✓ Samba instalado"
                    echo ""
                fi
                
                if [ $tailscale_selected -eq 0 ] && [ $samba_selected -eq 0 ]; then
                    echo "⚠ No se seleccionó ninguna aplicación"
                    echo ""
                fi
                
                # Resetear selecciones
                tailscale_selected=0
                samba_selected=0
                
                echo "Presiona Enter para continuar..."
                read
                ;;
            0)
                # Resetear selecciones al salir
                tailscale_selected=0
                samba_selected=0
                break
                ;;
            *)
                ;;
        esac
    done
}

# Menú principal
while true; do
    clear
    echo -e "${CYAN}"
    cat << 'EOF'
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
    
    echo "═══ MENÚ PRINCIPAL ═══"
    echo ""
    echo "1) Actualizar"
    echo "2) Aplicaciones"
    echo "0) Salir"
    echo ""
    echo -n "Selecciona una opción: "
    read opcion
    
    case $opcion in
        1)
            clear
            echo ""
            echo "Actualizando sistema..."
            echo ""
            sudo apt update
            sudo apt upgrade -y
            echo ""
            echo "✓ Sistema actualizado correctamente"
            echo ""
            echo "Presiona Enter para continuar..."
            read
            ;;
        2)
            submenu_aplicaciones
            ;;    
        0)
            clear
            echo ""
            echo "¡Hasta luego!"
            echo ""
            exit 0
            ;;
        *)
            echo ""
            echo "Opción inválida"
            echo ""
            sleep 2
            ;;
    esac
done