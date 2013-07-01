# Fias parser

Парсер базы ФИАС.
http://fias.nalog.ru/Public/DownloadPage.aspx
Гем в стадии разработки.

## Installation

Add this line to your application's Gemfile:

    gem 'fias', git: 'git@github.com:revis0r/fias_parser.git'

And then execute:

    $ bundle


## Usage

    importer = Fias::Importer.new do |settings|
      settings.addr_object Fias::AddrObj, :aoguid => :ao_guid
      settings.house Fias::House, :aoguid => :ao_guid
      settings.base 'spec/base/'
    end
    importer.import_house
    importer.import_addrobj


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
