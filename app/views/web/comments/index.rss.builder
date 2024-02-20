xml.instruct! :xml, version: "1.0"
xml.rss version: "2.0" do
  xml.channel do
    xml.title "Отзывы о курсе #{@course.title}"
    xml.description "ruby.show — Рейтинг курсов по Ruby и Ruby on Rails"
    xml.link course_url(@course)

    @comments.each do |comment|
      xml.item do
        xml.title "Отзыв #{comment.user.username} о курсе #{@course.title}"
        xml.link user_url(comment.user)
        xml.description do
          xml.div do
            xml.p("Ученик: #{comment.user.username}")
            xml.p("Оценка: #{comment.rating}") if comment.rating.present?
            xml.p("Отзыв: #{comment.content}")
          end
        end
        xml.enclosure :url, gravatar_url(comment.user.email, 144)
        xml.enclosure :type, "image/png"
        xml.pubDate comment.created_at.strftime("%d.%m.%Y %H:%M")
        xml.guid comment.id
      end
    end
  end
end
