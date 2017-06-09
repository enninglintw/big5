class BigFiveResultsTextSerializer
  def initialize(text)
    @text = text
  end

  def hash
    matching_line = "Domain/Facet............ Score"
    paragraphs = @text.split(matching_line)[1..-1]

    Hash[
      paragraphs.map do |paragraph|
        items = paragraph.split(/\n|\./).delete_if(&:empty?)[0..13]
        formatted_items = items.each_with_index.map{ |el, i| i.even? ? el : el.to_i }
        domain_name, domain_score = formatted_items[0..1]
        facets_hash = Hash[*formatted_items[2..13]]
        domain_hash = Hash['Overall Score', domain_score, 'Facets', facets_hash]

        [domain_name, domain_hash]
      end.unshift(["NAME", "Irene Lin"])
    ]
  end
end
