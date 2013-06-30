module CoursesHelper

  def tile_to_column(size)
    case size
      when "one_by_one"
        return "small-4"
      when "one_by_two"
        return "small-4"
      when 'two_by_one'
        return 'small-8'
      when 'two_by_two'
        return 'small-8'
      else
        return 'small-4'
      end
    end

end
