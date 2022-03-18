# Ruby on Rails social network application

University of Gdansk project.

## License

All source code is available jointly under the MIT License. 
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
Next, for Rails 7 install node packages and create css and js bundles:
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
$ rails server
```
