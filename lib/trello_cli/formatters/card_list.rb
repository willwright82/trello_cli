module TrelloCli
  module Formatters
    class CardList < Base
      def to_legacy
        data.map do |d|
          msg = "| Name: #{d[:name]} ( #{d[:id]} )\n"
          msg << "| Description: #{d[:desc]}\n" if d[:desc]
          msg << "|------------------------\n"
        end
      end

      def to_tsv
        data.map do |d|
          [d[:id], '[' + d[:url].gsub('https://trello.com/c/', '') + '] ' + d[:name] + ' — ' + d[:url]].join("\t") + "\n"
        end
      end
    end
  end
end
