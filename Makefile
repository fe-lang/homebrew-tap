.PHONY: push-new-version
push-new-version:
	echo -e "\033[0;32mPushing a new version...\033[0m"

	./scripts/update.sh > Formula/fe.rb

	git add Formula/fe.rb
	git commit -m "Update to latest version"
	git push origin main
