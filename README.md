# Lingo
A work in progress Swift Localization Library. Lingo will find all localization key-value pairs in `.strings` files and put the keys in a easy to access global structure.

## Installation
TODO

## Usage
Build your app (shift + cmd + B). In the file you want to use Lingo, import Lingo:

```import Lingo```

Then to use the localized string defined in a `Navigation.strings` file as such:

```"next" = "Next";```

simply use:

```let next = Lingo.Navigation.next```

## License
Available under the [MIT License](https://github.com/mattDavo/Lingo/blob/master/LICENSE)
