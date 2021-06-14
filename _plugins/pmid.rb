module Jekyll
  module AddPMIDURL
    def pmid(input)
      index = input.index("PMID: ")
      text_after = input[(index + 6..)]
      semicolon_index = text_after.index(';')
      if semicolon_index
        pmid = text_after[(..semicolon_index - 1)]
      else
        pmid = text_after[(..text_after.index('.') - 1)]
      end
      pmid_url = "https://pubmed.ncbi.nlm.nih.gov/" + pmid
      pmid_markown_url = "[PMID: " + pmid + "]" + "(" + pmid_url + ")"
      input[index, 6 + pmid.length] = pmid_markown_url
      input
    end
  end
end

Liquid::Template.register_filter(Jekyll::AddPMIDURL)
