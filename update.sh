#!/bin/bash
# Colores
CYAN='\033[0;36m'
NC='\033[0m'

# Función para el submenú de aplicaciones con checklist
submenu_aplicaciones() {
    # Crear el checklist con whiptail
    opciones=$(whiptail --title "Instalador de Aplicaciones" \
        --checklist "Usa ESPACIO para marcar/desmarcar, ENTER para instalar:" 15 60 5 \
        "tailscale" "Cliente VPN Tailscale" OFF \
        "samba" "Servidor de archivos Samba" OFF \
        "docker" "Plataforma de contenedores" OFF \
        "git" "Sistema de control de versiones" OFF \
        3>&1 1>&2 2>&3)
    
    # Si el usuario canceló, volver al menú
    if [ $? -ne 0 ]; then
        return
    fi
    
    # Si no seleccionó nada
    if [ -z "$opciones" ]; then
        whiptail --title "Aviso" --msgbox "No seleccionaste ninguna aplicación" 8 45
        return
    fi
    
    # Procesar instalaciones
    clear
    echo ""
    echo "Instalando aplicaciones seleccionadas..."
    echo ""
    
    # Convertir la salida a array
    for app in $opciones; do
        # Remover comillas
        app=$(echo $app | tr -d '"')
        
        case $app in
            tailscale)
                echo "→ Instalando Tailscale..."
                # Aquí va tu código de instalación de Tailscale
                sleep 1
                echo "✓ Tailscale instalado"
                echo ""
                ;;
            samba)
                echo "→ Instalando Samba..."
                # Aquí va tu código de instalación de Samba
                sleep 1
                echo "✓ Samba instalado"
                echo ""
                ;;
            docker)
                echo "→ Instalando Docker..."
                # Aquí va tu código de instalación de Docker
                sleep 1
                echo "✓ Docker instalado"
                echo ""
                ;;
            git)
                echo "→ Instalando Git..."
                # Aquí va tu código de instalación de Git
                sleep 1
                echo "✓ Git instalado"
                echo ""
                ;;
        esac
    done
    
    echo "✓ Instalación completada"
    echo ""
    echo "Presiona Enter para continuar..."
    read
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