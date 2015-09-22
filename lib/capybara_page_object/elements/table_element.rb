module CapybaraPageObject
  class TableElement < Element
    include Enumerable

    def each
      for index in 1..self.rows.length do
        yield self[index-1]
      end
    end

    def [](row_index)
      if row_index.kind_of?(String)
        rows.find do |row|
          row.columns.any? {|col| col.text.include?(row_index) }
        end
      else
        rows[row_index]
      end
    end

    def as_hashes
      rows[1..-1].map do |row|
        Hash[headers.zip(row.map(&:text))]
      end
    end


    def rows
      within do
        all(:xpath, ".//child::tr").map do |row|
          TableRowElement.new(row, page, self)
        end
      end
    end

    def last_row
      the_rows = rows
      the_rows[the_rows.length - 1]
    end

    def first_row
      rows[0]
    end

    def headers
      rows[0].columns.map(&:text)
    end

  end
end
