#!/bin/bash
# Colores
CYAN='\033[0;36m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Variables para tracking de selección
declare -A apps_selected
apps_selected[tailscale]=0
apps_selected[samba]=0
apps_selected[docker]=0
apps_selected[git]=0

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
        echo "1) $(mostrar_checkbox ${apps_selected[tailscale]}) Tailscale"
        echo "2) $(mostrar_checkbox ${apps_selected[samba]}) Samba"
        echo "3) $(mostrar_checkbox ${apps_selected[docker]}) Docker"
        echo "4) $(mostrar_checkbox ${apps_selected[git]}) Git"
        echo ""
        echo -e "${YELLOW}i) Instalar seleccionadas${NC}"
        echo "0) Volver al menú principal"
        echo ""
        echo -n "Selecciona (presiona Enter para instalar): "
        read subopcion
        
        case $subopcion in
            1)
                # Toggle tailscale
                if [ ${apps_selected[tailscale]} -eq 0 ]; then
                    apps_selected[tailscale]=1
                else
                    apps_selected[tailscale]=0
                fi
                ;;
            2)
                # Toggle samba
                if [ ${apps_selected[samba]} -eq 0 ]; then
                    apps_selected[samba]=1
                else
                    apps_selected[samba]=0
                fi
                ;;
            3)
                # Toggle docker
                if [ ${apps_selected[docker]} -eq 0 ]; then
                    apps_selected[docker]=1
                else
                    apps_selected[docker]=0
                fi
                ;;
            4)
                # Toggle git
                if [ ${apps_selected[git]} -eq 0 ]; then
                    apps_selected[git]=1
                else
                    apps_selected[git]=0
                fi
                ;;
            i|I|"")
                # Verificar si hay algo seleccionado
                hay_seleccion=0
                for app in "${!apps_selected[@]}"; do
                    if [ ${apps_selected[$app]} -eq 1 ]; then
                        hay_seleccion=1
                        break
                    fi
                done
                
                if [ $hay_seleccion -eq 0 ]; then
                    clear
                    echo ""
                    echo "⚠ No hay aplicaciones seleccionadas"
                    echo ""
                    echo "Presiona Enter para continuar..."
                    read
                    continue
                fi
                
                # Instalar las aplicaciones seleccionadas
                clear
                echo ""
                echo "Instalando aplicaciones seleccionadas..."
                echo ""
                
                if [ ${apps_selected[tailscale]} -eq 1 ]; then
                    echo "→ Instalando Tailscale..."
                    # Aquí va tu código de instalación
                    sleep 1
                    echo "✓ Tailscale instalado"
                    echo ""
                fi
                
                if [ ${apps_selected[samba]} -eq 1 ]; then
                    echo "→ Instalando Samba..."
                    # Aquí va tu código de instalación
                    sleep 1
                    echo "✓ Samba instalado"
                    echo ""
                fi
                
                if [ ${apps_selected[docker]} -eq 1 ]; then
                    echo "→ Instalando Docker..."
                    # Aquí va tu código de instalación
                    sleep 1
                    echo "✓ Docker instalado"
                    echo ""
                fi
                
                if [ ${apps_selected[git]} -eq 1 ]; then
                    echo "→ Instalando Git..."
                    # Aquí va tu código de instalación
                    sleep 1
                    echo "✓ Git instalado"
                    echo ""
                fi
                
                # Resetear selecciones
                for app in "${!apps_selected[@]}"; do
                    apps_selected[$app]=0
                done
                
                echo "✓ Instalación completada"
                echo ""
                echo "Presiona Enter para continuar..."
                read
                ;;
            0)
                # Resetear selecciones al salir
                for app in "${!apps_selected[@]}"; do
                    apps_selected[$app]=0
                done
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