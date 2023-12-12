#!/bin/bash
clear
menu_principal() {
   echo "
░█████╗░██╗███████╗██████╗░░█████╗░██████╗░░█████╗░
██╔══██╗██║██╔════╝██╔══██╗██╔══██╗██╔══██╗██╔══██╗
██║░░╚═╝██║█████╗░░██████╔╝███████║██║░░██║██║░░██║
██║░░██╗██║██╔══╝░░██╔══██╗██╔══██║██║░░██║██║░░██║
╚█████╔╝██║██║░░░░░██║░░██║██║░░██║██████╔╝╚█████╔╝
░╚════╝░╚═╝╚═╝░░░░░╚═╝░░╚═╝╚═╝░░╚═╝╚═════╝░░╚════╝░

░██████╗██╗███╗░░░███╗███████╗████████╗██████╗░██╗░█████╗░░█████╗░
██╔════╝██║████╗░████║██╔════╝╚══██╔══╝██╔══██╗██║██╔══██╗██╔══██╗
╚█████╗░██║██╔████╔██║█████╗░░░░░██║░░░██████╔╝██║██║░░╚═╝██║░░██║
░╚═══██╗██║██║╚██╔╝██║██╔══╝░░░░░██║░░░██╔══██╗██║██║░░██╗██║░░██║
██████╔╝██║██║░╚═╝░██║███████╗░░░██║░░░██║░░██║██║╚█████╔╝╚█████╔╝
╚═════╝░╚═╝╚═╝░░░░░╚═╝╚══════╝░░░╚═╝░░░╚═╝░░╚═╝╚═╝░╚════╝░░╚════╝░"
    echo "Progama cifrado simetrico creado por maarcox"
    echo "1. Cifrar mensaje en algoritmo simétrico"
    echo "2. Salir"
}

cifrar_simetrico() {
    read -p "Ingrese la frase a cifrar: " frase
    read -p "Ingrese el nombre del archivo cifrado (sin extensión): " nombre_archivo
    echo "$frase" > mensaje.txt
    echo""
    echo "Cifrando mensaje..."
    gpg --symmetric --output "${nombre_archivo}_cifrado.gpg" mensaje.txt
    echo ""
    echo "Mensaje cifrado correctamente. El archivo cifrado se encuentra en ${nombre_archivo}_cifrado.gpg."
    echo ""
    echo "Contenido del archivo cifrado:"
    cat "${nombre_archivo}_cifrado.gpg"
}

while true; do
    menu_principal
    read -p "Seleccione una opción: " opcion_principal

    case $opcion_principal in
        1)
            cifrar_simetrico
 	    exit 0
            ;;
        2)
            echo "Saliendo..."
            exit 0
            ;;
        *)
            echo "Opción no válida. Inténtelo de nuevo."
            ;;
    esac
done
