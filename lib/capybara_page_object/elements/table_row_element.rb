module CapybaraPageObject
  class TableRowElement < Element
    include Enumerable

    attr_reader :parent_table

    def initialize(element, page, parent_table = nil)
      super(element, page)
      @parent_table = parent_table || find_parent_table
    end

    def each
      for index in 1..self.columns.length do
        yield self[index-1]
      end
    end

    def [](column_index)
      if column_index.kind_of?(String)
        column_index = lookup_index_by_name(column_index)
      end

      return nil if column_index == nil
      columns[column_index]
    end

    def columns
      within do
        all(:xpath, ".//child::td|th")
      end
    end

    private

    def lookup_index_by_name(column_name)
      parent_table.headers.find_index{|header_name| header_name.include?(column_name) }
    end

    # Find the parent table based on the current nodes xpath expression
    # e.g.
    #  irb > path = "/html/body/table[1]/tbody/tr[1]"
    #  irb> paths = path.split("/")
    #       => ["", "html", "body", "table[1]", "tbody", "tr[1]"]
    #  irb>       paths.reverse!
    #       => ["tr[1]", "tbody", "table[1]", "body", "html", ""]
    #  irb>       index = paths.find_index{|s| s.include?('table') }
    #       => 2
    #  irb>       paths = paths[index..-1]
    #       => ["table[1]", "body", "html", ""]
    #  irb>       paths.reverse!
    #       => ["", "html", "body", "table[1]"]
    #  irb> paths.join("/")
    #       => "/html/body/table[1]"
    #
    def find_parent_table
      path = element.path
      paths = path.split("/")
      paths.reverse!
      index = paths.find_index{|s| s.include?('table') }
      paths = paths[index..-1]
      paths.reverse!
      page.first(:xpath, paths.join("/"))
    end
  end
end

