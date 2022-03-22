require './decorator'

class Trimmer < Decorator
  def correct_name
    @component.correct_name.length > 10 ? @component.correct_name[0..10] : @component.correct_name
  end
end
