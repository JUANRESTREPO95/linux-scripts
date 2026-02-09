#!/bin/bash

# Colores
CYAN='\033[0;36m'
NC='\033[0m'

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
            clear
            echo ""
            echo "Actualizando sistema..."
            echo ""
            echo ""
            echo "✓ Sistema actualizado correctamente"
            echo ""
            echo "Presiona Enter para continuar..."
            read
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
