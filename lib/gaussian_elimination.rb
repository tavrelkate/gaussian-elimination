# frozen_string_literal: true

module Matrix
  class GaussianElimination
    attr_accessor :array, :column_index, :row_index, :focus_element

    def initialize(array)
      validate_input_data!(array)

      @array = Marshal.load(Marshal.dump(array))
    end

    def build_echelon_form
      each_array_element do |column_index, row_index|
        @column_index  = column_index
        @row_index     = row_index
        @focus_element = current_element

        is_diagonal? ? focus_element_to_eq_one_and_update_row : focus_element_to_eq_zero_and_update_row
      end
    end

    private

    def each_array_element
      array.each_with_index do |_column, column_index|
        array.each_with_index do |_row, row_index|
          # We proccess under diagonal and diagonal elements only
          yield(column_index, row_index) unless row_index < column_index
        end
      end
    end

    def is_diagonal?
      row_index == column_index
    end

    # Transforming diagonal elements to 1. Then updating the rest elements of the row 
    # Multiplying them to 1.0 / diagonal element
    def focus_element_to_eq_one_and_update_row
      current_row.map! { |el| el * 1.0 / focus_element }

      focus_element_to_be_positive_and_update_row if current_element.negative?
    end

    # Transforming under diagonal elements to 0. Then updating the rest elements of the row 
    # Reduce them to diagonal element * current under diagonal element
    def focus_element_to_eq_zero_and_update_row
      current_row.each_with_index do |_element, index|
        current_row[index] -= current_row_transposed[index] * focus_element
      end
    end

    # Transforming element to possitive. Then updating the rest elements of the row 
    def focus_element_to_be_positive_and_update_row
      current_row.map!(&:-@)
    end

    def current_row_transposed
      array[column_index]
    end

    def current_row
      array[row_index]
    end

    def current_element
      array[row_index][column_index]
    end

    def validate_input_data!(input)
      raise 'please input matrix data as array obj' unless input.is_a?(Array)
    end
  end
end
