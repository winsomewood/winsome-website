rsync -avz --exclude '.git/' --exclude 'node_modules/' --exclude '.bundle/' --exclude 'tmp/' . web@192.168.161.189:/var/www/
ssh -t web@192.168.161.189 'sudo systemctl restart web'

echo 'Deploy completed'