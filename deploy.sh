rsync -avz --exclude 'public/images/' --exclude '.git/' --exclude 'node_modules/' --exclude '.bundle/' --exclude 'tmp/' . web@10.101.101.189:/var/www/
ssh -t web@10.101.101.189 'sudo systemctl restart web'

echo 'Deploy completed'