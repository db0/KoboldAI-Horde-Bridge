pkg update
termux-setup-storage
yes | pkg install python openssh git
git clone https://github.com/db0/KoboldAI-Horde.git
cd KoboldAI-Horde
pip install -r bridge_requirements.txt --user
cp clientData_template.py clientData.py 
echo "kai_url = $1" >> clientData.py