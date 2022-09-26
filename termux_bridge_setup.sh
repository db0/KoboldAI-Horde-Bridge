apt update
yes | apt -y install python openssh git 
git clone https://github.com/db0/KoboldAI-Horde.git ${HOME}/KoboldAI-Horde
cd ${HOME}/KoboldAI-Horde
pip install -r ${HOME}/KoboldAI-Horde/bridge_requirements.txt --user
cp ${HOME}/KoboldAI-Horde/clientData_template.py ${HOME}/KoboldAI-Horde/clientData.py 

if [[ "$1" ]]; then
    echo "" >> ${HOME}/KoboldAI-Horde/clientData.py
    echo "kai_url = $1" >> ${HOME}/KoboldAI-Horde/clientData.py
else
    echo 'No Colab URL provided. Please manually edit your clientData.py and add your colab url in the 'kai_url' variable.'
fi
