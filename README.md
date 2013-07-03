# Fias parser

Парсер базы ФИАС.
http://fias.nalog.ru/Public/DownloadPage.aspx
Гем в стадии разработки.

## Installation

Add this line to your application's Gemfile:

    gem 'fias_parser', git: 'git@github.com:revis0r/fias_parser.git'

And then execute:

    $ bundle


## Usage

    importer = FiasParser::Importer.new do |settings|
      settings.addr_object FiasParser::AddrObj, :aoguid => :ao_guid
      settings.house FiasParser::House, :aoguid => :ao_guid
      settings.base 'spec/base/'
      settings.set_batch_size 10
    end

    importer.import_addrobj do |batch|
      batch.each do |obj|
        AddrObj.create! obj
      end
    end

    importer.import_house do |batch|
      batch.each do |obj|
        House.create! obj
      end
    end


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
