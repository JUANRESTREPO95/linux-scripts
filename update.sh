#!/bin/bash
# Colores
CYAN='\033[0;36m'
NC='\033[0m'

# Función para el submenú de aplicaciones
submenu_aplicaciones() {
    while true; do
        clear
        echo -e "${CYAN}"
        echo "╔════════════════════════════════════════════════════╗"
        echo "║              MENÚ DE APLICACIONES                  ║"
        echo "╚════════════════════════════════════════════════════╝"
        echo -e "${NC}\n"
        
        echo "═══ APLICACIONES ═══"
        echo ""
        echo "1) Tailscale"
        echo "2) Samba"
        echo "0) Volver al menú principal"
        echo ""
        echo -n "Selecciona una opción: "
        read subopcion
        
        case $subopcion in
            1)
                clear
                echo ""
                echo "Instalando Tailscale..."
                echo ""
                # Aquí va tu código de instalación de Tailscale
                echo ""
                echo "✓ Tailscale instalado correctamente"
                echo ""
                echo "Presiona Enter para continuar..."
                read
                ;;
            2)
                clear
                echo ""
                echo "Instalando Samba..."
                echo ""
                # Aquí va tu código de instalación de Samba
                echo ""
                echo "✓ Samba instalado correctamente"
                echo ""
                echo "Presiona Enter para continuar..."
                read
                ;;
            0)
                break  # Sale del submenú y vuelve al menú principal
                ;;
            *)
                echo ""
                echo "Opción inválida"
                echo ""
                sleep 2
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
            submenu_aplicaciones  # Llama a la función del submenú
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