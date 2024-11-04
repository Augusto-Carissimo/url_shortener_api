# URL Shortener API

## About
URL Shortener API developed with Ruby On Rails. 

It includes a background Job URL Crawler which recovers the website title.

The algorithm that turns the URL into it shorten version is a [Bijective Function](https://en.wikipedia.org/wiki/Bijection)

[Original Stack Overflow post](https://stackoverflow.com/questions/742013/how-do-i-create-a-url-shortener)

## Usage
🏁 Clone the repo and start the application 🏁
```
git clone git@github.com:Augusto-Carissimo/url_shortener_api.git
cd url_shortener_api
rails server
```
🩳 To shorten an URL, prefix it with '?key=' 🩳
```
localhost:3000/?key=[url]
```
↪️ You can use the shorten url to redirect to it website ↩️
```
localhost:3000/[shorten_url]
```
🌱 You can seed the db running 🌱
```
rails db:seed
```
🔝 Visit the Top100 most popular links 🔝
```
localhost:3000/links/top100
```
🧪 Run Rspec Unit Tests 🧪
```
bundle exec rspec
```
