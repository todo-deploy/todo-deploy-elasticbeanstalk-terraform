up:
	git clone https://github.com/todo-deploy/todo-app.git
	cd todo-app
	zip -r ../todo-app.zip *
	cd ..
	terraform init
	terraform apply
	eb init --platform node.js --region us-east-1 todo-deploy
	eb deploy development --version version

down:
	terraform destroy