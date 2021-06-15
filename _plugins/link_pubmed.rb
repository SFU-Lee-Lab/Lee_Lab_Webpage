module Jekyll
  module AddPubMedLink
    def link_pubmed(input, *text_before)
      for text in text_before do
        begin
          # Find where that text starts.
          index = input.index(text)
          text_after = input[(index + text.length..)]
          # The first semicolon after the text is used as the ending point. If a
          # semicolon is not found, a period will be used instead.
          semicolon_index = text_after.index(';')
          if semicolon_index
            pubmed_id = text_after[(..semicolon_index - 1)]
          else
            pubmed_id = text_after[(..text_after.index('.') - 1)]
          end
          # Create the link in markdown format.
          pubmed_id_url = "https://pubmed.ncbi.nlm.nih.gov/" + pubmed_id
          markown_url = "[" + text + pubmed_id + "]" + "(" + pubmed_id_url + ")"
          # Modify the input text to have the markdown link now.
          input[index, text.length + pubmed_id.length] = markown_url
        rescue NoMethodError
          # That bit of text does not exist in this publication.
        end
      end
      # Return the new text with the markdown formatting. The markdownify filter
      # will be called after to display the text correctly.
      return input
    end
  end
end

Liquid::Template.register_filter(Jekyll::AddPubMedLink)
