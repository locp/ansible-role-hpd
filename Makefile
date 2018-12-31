all: requirements requirements lint kitchen_tests

requirements:
	bundle update
	pip install -Ur requirements.txt

clean:
	kitchen destroy
	rm -rf .kitchen

lint:
	bundle exec rubocop -ES
	ansible-lint -pv . test/test.yml
	ansible-review -c ./test/ansible-review.cfg \
	  defaults/main.yml \
	  handlers/main.yml \
	  meta/main.yml \
	  tasks/main.yml \
	  test/test.yml \
	  vars/main.yml

kitchen_tests:
	bundle exec kitchen create
