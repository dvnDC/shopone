# Ruby on Rails Shopone application

Basic the shop-like MVC application.

## License
 
See [LICENSE.md](LICENSE.md) for details.

## Getting started

To get started with the app, clone the repo and then install the needed gems:
```
$ bundle install --without production
```
Next, migrate the database:
```
$ rails db:migrate
```
Next install yarn and compile css and js:
```
$ yarn install
$ yarn build
$ yarn build:css
```
Finally, run the test suite to verify that everything is working correctly:
```
$ rails test
```
If the test suite passes, you'll be ready to run the app in a local server:
```
$ ./bin/dev
``` 
or
```
$ rails server
```
