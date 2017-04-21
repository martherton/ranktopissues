#encoding: UTF-8

xml.instruct! :xml, :version => '1.0'
xml.rss :version => '2.0' do
  xml.channel do
    xml.title 'FM Issues'
    xml.description 'Lists that matter to investors'
    xml.link 'https://marketissues.com'
 
    @issuetweet.each do |issue|
      if issue.subcategory.blank?
        category= ""
      else  
        category = Issuecat.find(issue.subcategory).issuecatname
      end
      xml.item do
        xml.title "#{issue.issuetitle} | #{category}. See the LR Research short view."
 
        # choose description based on social media platform
        # uses custom functions on models, they might be better
        # suited for a helper though
        
 
        xml.pubDate issue.created_at.strftime("%Y-%m-%d")
        xml.link issue_url(issue)
        
      end
    end
  end
end