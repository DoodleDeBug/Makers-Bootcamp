# AceBook

## Links
- [Live](https://acebook-ace-rails.herokuapp.com/)
- Link to our [Trello Board](https://trello.com/b/L3P4vDYK/acebook-team-name)

![image](https://user-images.githubusercontent.com/75613073/148761974-a4498122-67ff-4f6a-be75-22750bd83e02.png)


## MVP Mockup 
![image](https://user-images.githubusercontent.com/75613073/145019013-674c2d06-2cb6-4165-9039-8a9b5a9912d5.png)


## Quickstart

First, clone this repository. Then:

```bash
> bundle install
> bin/rails db:create
> bin/rails db:migrate

> bundle exec rspec # Run the tests to ensure it works
> bin/rails server # Start the server at localhost:3000
```

## Troubleshooting

If you don't have Node.js installed yet, you might run into this error when running rspec:

```
ExecJS::RuntimeUnavailable:
  Could not find a JavaScript runtime. See https://github.com/rails/execjs for a list of available runtimes.
 ```

Rails requires a Javascript runtime to work. The easiest way is to install Node by running `brew install node` - and then run `bundle exec rspec` again
