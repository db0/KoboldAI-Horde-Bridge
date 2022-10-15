# Termux stuff
if [[ $(uname -o) == "Android" ]]; then 
    apt update
    yes | apt -y upgrade
    yes | apt -y install python openssh git 
fi

git clone https://github.com/db0/KoboldAI-Horde-Bridge.git ${HOME}/KoboldAI-Horde-Bridge
cd ${HOME}/KoboldAI-Horde-Bridge
pip install -r ${HOME}/KoboldAI-Horde-Bridge/requirements.txt --user
cp ${HOME}/KoboldAI-Horde-Bridge/clientData_template.py ${HOME}/KoboldAI-Horde-Bridge/clientData.py 

if [[ "$1" ]]; then
    sed -i "s/0000000000/$1/g" clientData.py
    echo "INFO: API Key set to '$(tput setaf 5)$1$(tput setaf 7)'"
else
    echo "$(tput setaf 3)WARNING: $(tput setaf 7)No API Provided. Please manually edit your clientData.py and add your API KEY in the 'api_key' variable."
fi

if [[ "$2" ]]; then
    sed -i "s/My Awesome Instance/$2/g" clientData.py
    echo "INFO: Worker name set to $(tput setaf 5)$2$(tput setaf 7)'"
else
    echo "$(tput setaf 3)WARNING: $(tput setaf 7)No Worker Name provided. Please manually edit your clientData.py and add your colab url in the 'kai_name' variable."
fi

if [[ "$3" ]]; then
    sed -i "s#http://localhost:5000#$3#g" clientData.py
    echo "INFO: Worker url set to '$(tput setaf 5)$3$(tput setaf 7)'"
else
    echo "$(tput setaf 3)WARNING: $(tput setaf 7)No Colab URL provided. Please manually edit your clientData.py and add your colab url in the 'kai_url' variable."
fi


echo "## Bridge prepared. If you haven't already, edit clientData.py and add your own settings."
echo "## Start the bridge with: $(tput setaf 6)cd ${HOME}/KoboldAI-Horde-Bridge && python bridge.py -vv"
if [[ $(uname -o) == "Msys" ]]; then 
    echo "$(tput setaf 7)## Or from windows explorer, navigate to $(tput setaf 6)C:\\Users\\$(whoami)\KoboldAI-Horde-Bridge $(tput setaf 7)and run $(tput setaf 6)bridge_start.bat$(tput setaf 7)"
else
    chmod +x ${HOME}/KoboldAI-Horde-Bridge/bridge_start.sh
    echo "$(tput setaf 7)## Or from file explorer, navigate to $(tput setaf 6)${HOME}/KoboldAI-Horde-Bridge $(tput setaf 7)and run $(tput setaf 6)bridge_start.sh$(tput setaf 7)"
fi

