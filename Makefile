help:
	@echo 'Build the Gremlin Playground VM'
	@echo 'For more information see: https://github.com/gremlin/gremlin-playground'
	@echo ''
	@echo '    build   - Run the Packer build process and generate the'
	@echo '              gremlin_playground.tar.gz distributable file.'
	@echo '    clean   - Stops any running GremlinPlayground VM, deletes build'
	@echo '              files, and removes SSH known host entries for the VM.'
	@echo '    rebuild - Runs the clean and build processes, extracts the'
	@echo '              distributable VM, imports it into VirtualBox, and runs it.'
	@echo ''
	

build:
	@echo "Running Packer build..."
	@packer build playground.json
	@echo "Build size is:" 
	@du -h gremlin_playground.tar.gz | cut -d '	' -f 1


clean:
	@echo "Stopping and removing any running VM builds..."
	-@vboxmanage controlvm GremlinPlayground poweroff
	@sleep 10 # Need to wait a bit to ensure poweroff
	-@vboxmanage unregistervm --delete GremlinPlayground

	@echo "Deleting previous build files..."
	-@rm GremlinPlayground-disk001.vmdk GremlinPlayground.ovf gremlin_playground.tar.gz

	#@echo "Removing VM key from SSH known hosts..."
	@sed -i '' '/\[localhost\]:2222/d' ~/.ssh/known_hosts
	@sed -i '' '/\[127.0.0.1\]:2222/d' ~/.ssh/known_hosts


rebuild: | clean build
	@echo "Unzipping build..."
	@tar xzvf gremlin_playground.tar.gz

	@echo "Importing and starting the VM..."
	@vboxmanage import GremlinPlayground.ovf
	@sleep 10
	@vboxmanage startvm GremlinPlayground
