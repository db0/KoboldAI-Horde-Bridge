git clone https://github.com/db0/KoboldAI-Horde.git ${HOME}/KoboldAI-Horde
cd ${HOME}/KoboldAI-Horde
pip install -r ${HOME}/KoboldAI-Horde/bridge_requirements.txt --user
cp ${HOME}/KoboldAI-Horde/clientData_template.py ${HOME}/KoboldAI-Horde/clientData.py 

if [[ "$1" ]]; then
    sed -i 's\0000000000\$1\g' clientData.py
    echo "INFO: API Key set to '$1'"
else
    echo 'WARN: No API Provided. Please manually edit your clientData.py and add your API KEY in the 'api_key' variable.'
fi

if [[ "$2" ]]; then
    sed -i 's\My Awesome Instance\$2\g' clientData.py
    echo "INFO: Worker name set to '$2'"
else
    echo 'WARN: No Worker Name provided. Please manually edit your clientData.py and add your colab url in the 'kai_name' variable.'
fi

if [[ "$3" ]]; then
    sed -i 's\http://localhost:5000\$3\g' clientData.py
    echo "INFO: Worker url set to '$3'"
else
    echo 'WARN: No Colab URL provided. Please manually edit your clientData.py and add your colab url in the 'kai_url' variable.'
fi


echo "## Bridge prepared. If you haven't already, edit clientData.py and add your own settings."
echo "## Start the bridge with: bridge_start.bat"