all:
	@echo '## Make commands ##'
	@echo
	@$(MAKE) -pRrq -f $(lastword $(MAKEFILE_LIST)) : 2>/dev/null | awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$' | xargs

# install_first:
	# @install/install_first.sh
        
install_anaconda3:
	@install/install_anaconda3.sh

install: install_anaconda3  
	@install/install.sh

clean:
	@rm -rf *.egg-info
	@rm -rf .anaconda3

