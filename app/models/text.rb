class Text < Widget
  store :data, accessors: [:title, :body]
  
  def to_partial_path
    'widgets/text/text'
  end
end
