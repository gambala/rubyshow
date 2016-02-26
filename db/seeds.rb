# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# course = Course.create(
#   title: '',
#   description: '',
#   url: '',
#   paid: false,
#   language: ''
# )
# p "#{course.title} created, paid? #{course.paid}"

course = Course.create(
  title: 'Mackenzie Child: Intro to Rails',
  description: "We'll talk about what Rails is and how it got its start as a framework, we'll cover the basics of Ruby, and we'll go through concepts like MVC (Models, Views, Controllers) Architecture, convention over configuration & DRY (Don't Repeat Yourself).",
  url: 'https://mackenziechild.me/intro-to-rails/',
  paid: false,
  language: 'English'
)
p "#{course.title} created, paid? #{course.paid}"

course = Course.create(
  title: 'Mackenzie Child: Blog & Portfolio',
  description: "In this course we're going to go step by step through planning, designing & coding a Ruby on Rails Blog & Portfolio app.",
  url: 'https://mackenziechild.me/blog-portfolio/',
  paid: false,
  language: 'English'
)
p "#{course.title} created, paid? #{course.paid}"

course = Course.create(
  title: 'Mackenzie Child: Podcast Network',
  description: "In this course we're going to go step by step through planning, designing & coding a Ruby on Rails Podcast Network.",
  url: 'https://mackenziechild.me/podcast-network/',
  paid: false,
  language: 'English'
)
p "#{course.title} created, paid? #{course.paid}"

course = Course.create(
  title: 'Mackenzie Child: 12 in 12 Challenge',
  description: 'I challenged myself to truly learn Ruby on Rails by building 12 web apps in 12 weeks. Each week I recorded a screencast to show you how I built each app.',
  url: 'https://mackenziechild.me/12-in-12/',
  paid: false,
  language: 'English'
)
p "#{course.title} created, paid? #{course.paid}"

course = Course.create(
  title: 'RubyMonk: Ruby Primer',
  description: 'Learn Ruby, today. You want to learn Ruby for fun, for a new job, or just to see what all the fuss is about? Start here.',
  url: 'https://rubymonk.com/learning/books/1-ruby-primer',
  paid: false,
  language: 'English'
)
p "#{course.title} created, paid? #{course.paid}"

course = Course.create(
  title: 'RubyMonk: Ruby Primer: Ascent',
  description: "Experience the next level. You've mastered the Ruby Primer. Now it's time to master more advanced Ruby skills!",
  url: 'https://rubymonk.com/learning/books/4-ruby-primer-ascent',
  paid: false,
  language: 'English'
)
p "#{course.title} created, paid? #{course.paid}"

course = Course.create(
  title: 'RubyMonk: Metaprogramming Ruby',
  description: 'Code that writes code. Add more powerful abstractions and reduce duplication through Ruby that writes Ruby!',
  url: 'https://rubymonk.com/learning/books/2-metaprogramming-ruby',
  paid: false,
  language: 'English'
)
p "#{course.title} created, paid? #{course.paid}"

course = Course.create(
  title: 'RubyMonk: Metaprogramming Ruby: Ascent',
  description: "Experience dynamic power. You've learned the basics of writing code with code in Metaprogramming Ruby. Now take it to the next level with eval, object lifecycle hooks, and more!",
  url: 'https://rubymonk.com/learning/books/5-metaprogramming-ruby-ascent',
  paid: false,
  language: ''
)
p "#{course.title} created, paid? #{course.paid}"

course = Course.create(
  title: 'mkdev: Ruby on Rails для самых маленьких',
  description: 'Курс для на­чи­на­ю­щих осва­и­вать не толь­ко RoR, но и веб-раз­ра­бот­ку в це­лом. От ООП в Ruby и про­сто­го кон­трол­ле­ра до production при­ло­же­ния.',
  url: 'https://mkdev.me/courses/1',
  paid: true,
  language: 'Русский'
)
p "#{course.title} created, paid? #{course.paid}"

course = Course.create(
  title: 'mkdev: Ruby on Rails для взрослых',
  description: 'Бес­по­щад­ный курс, на­це­лен­ный на ре­ше­ние слож­ных за­дач и изу­че­ние тон­ны но­вых тех­но­ло­гий. От ре­фак­то­рин­га до биз­нес ана­ли­ти­ки.',
  url: 'https://mkdev.me/courses/3',
  paid: true,
  language: 'Русский'
)
p "#{course.title} created, paid? #{course.paid}"

course = Course.create(
  title: 'mkdev: Ruby: основы программирования',
  description: 'Ба­зо­вое вве­де­ние в про­грам­ми­ро­ва­ние на Ruby и на­дёж­ная опо­ра для даль­ней­ше­го про­фес­си­о­наль­но­го обу­че­ния.',
  url: 'https://mkdev.me/courses/4',
  paid: true,
  language: 'Русский'
)
p "#{course.title} created, paid? #{course.paid}"

course = Course.create(
  title: 'Thinknetica: Интенсив по Ruby on Rails',
  description: 'Главная цель курса - дать участникам такой уровень знаний и навыков, когда их можно будет смело брать на работу. Мы ставим перед собой задачу научить создавать качественные протестированные веб-приложения, привить лучшие практики и культуру разработки на Ruby on Rails.',
  url: 'http://www.thinknetica.com/',
  paid: true,
  language: 'Русский'
)
p "#{course.title} created, paid? #{course.paid}"

course = Course.create(
  title: 'CodenameCRUD: Бесплатное обучение веб-разработке с нуля',
  description: 'Наш проект предлагает то, что хотелось бы знать нам, когда мы сами только начинали учиться. Мы собрали учебную программу из лучших ресурсов, которые смогли найти в Интернете, а теперь она доступна и вам.',
  url: 'http://codenamecrud.ru/',
  paid: false,
  language: 'Русский'
)
p "#{course.title} created, paid? #{course.paid}"

course = Course.create(
  title: 'Школа Программирования: Ruby/Rails',
  description: 'Ruby - удивительный язык программирования, который вам понравится! С помощью Ruby и фреймворка Rails вы научитесь разрабатывать приложения для большинства существующих настольных (Windows, Linux, Mac OS) и мобильных (Android, iOS) платформ. Вы получите в свои руки удобный и востребованный инструмент, позволяющий легко и быстро решать самые разнообразные задачи программирования. Курс содержит как изучение Ruby/Rails, так и использование целой экосистемы, включая применение наиболее распространённых библиотек. Множество практических задач на протяжении всего курса помогут не только освоить Ruby/Rails, но и оценить всю мощь и красоту языка.',
  url: 'http://www.proglive.ru/courses/ruby1',
  paid: true,
  language: 'Русский'
)
p "#{course.title} created, paid? #{course.paid}"

course = Course.create(
  title: 'Codeschool: Try Ruby',
  description: 'Learn the basic building blocks of Ruby, all in the browser.',
  url: 'https://www.codeschool.com/courses/try-ruby',
  paid: false,
  language: 'English'
)
p "#{course.title} created, paid? #{course.paid}"

course = Course.create(
  title: 'Codeschool: Rails for Zombies Redux',
  description: 'Learn Ruby on Rails, an open-source framework.',
  url: 'https://www.codeschool.com/courses/rails-for-zombies-redux',
  paid: false,
  language: 'English'
)
p "#{course.title} created, paid? #{course.paid}"

course = Course.create(
  title: 'Codeschool: Rails for Zombies 2',
  description: 'Experience the sequel to the infamous Rails for Zombies.',
  url: 'https://www.codeschool.com/courses/rails-for-zombies-2',
  paid: true,
  language: 'English'
)
p "#{course.title} created, paid? #{course.paid}"

course = Course.create(
  title: 'Codeschool: Ruby Bits',
  description: 'Learn the core bits every Ruby programmer should know.',
  url: 'https://www.codeschool.com/courses/ruby-bits',
  paid: true,
  language: 'English'
)
p "#{course.title} created, paid? #{course.paid}"

course = Course.create(
  title: 'Codeschool: Ruby Bits Part 2',
  description: 'Learn the advanced bits of expert Ruby programming.',
  url: 'https://www.codeschool.com/courses/ruby-bits-part-2',
  paid: true,
  language: 'English'
)
p "#{course.title} created, paid? #{course.paid}"

course = Course.create(
  title: 'Codeschool: Rails 4: Zombie Outlaws',
  description: 'Build faster and more secure web apps with Rails 4.',
  url: 'https://www.codeschool.com/courses/rails-4-zombie-outlaws',
  paid: true,
  language: 'English'
)
p "#{course.title} created, paid? #{course.paid}"

course = Course.create(
  title: 'Codeschool: Surviving APIs with Rails',
  description: 'Learn how to build and test web APIs with Ruby on Rails.',
  url: 'https://www.codeschool.com/courses/surviving-apis-with-rails',
  paid: true,
  language: 'English'
)
p "#{course.title} created, paid? #{course.paid}"

course = Course.create(
  title: 'Codeschool: Rails 4 Patterns',
  description: 'Learn helpful patterns for building complex Rails applications.',
  url: 'https://www.codeschool.com/courses/rails-4-patterns',
  paid: true,
  language: 'English'
)
p "#{course.title} created, paid? #{course.paid}"

course = Course.create(
  title: 'Codeschool: Rails Testing for Zombies',
  description: 'Pick up the fundamentals of testing a Rails application.',
  url: 'https://www.codeschool.com/courses/rails-testing-for-zombies',
  paid: true,
  language: 'English'
)
p "#{course.title} created, paid? #{course.paid}"
course = Course.create(
  title: 'Codeschool: Testing with RSpec',
  description: 'Try this trusted testing framework for Ruby applications.',
  url: 'https://www.codeschool.com/courses/testing-with-rspec',
  paid: true,
  language: 'English'
)
p "#{course.title} created, paid? #{course.paid}"

course = Course.create(
  title: 'Codecademy: Learn Ruby on Rails',
  description: "Learn to build web apps with Ruby on Rails 4. By the end of the course, you'll be able to use Ruby on Rails to create your own apps.",
  url: 'https://www.codecademy.com/learn/learn-rails',
  paid: true,
  language: 'English'
)
p "#{course.title} created, paid? #{course.paid}"

course = Course.create(
  title: 'Codecademy: Ruby on Rails: Authentication',
  description: 'Learn how to add sign up, log in, and log out functionality to your Rails apps, as well as how to manage access to specific pages.',
  url: 'https://www.codecademy.com/learn/rails-auth',
  paid: true,
  language: 'English'
)
p "#{course.title} created, paid? #{course.paid}"

course = Course.create(
  title: 'Codecademy: Ruby',
  description: 'Learn to program in Ruby, a ﬂexible language used to create sites like Codecademy.',
  url: 'https://www.codecademy.com/learn/ruby',
  paid: false,
  language: 'English'
)
p "#{course.title} created, paid? #{course.paid}"

course = Course.create(
  title: 'hasBrains: Ruby',
  description: 'Ruby - это динамический язык программирования с открытым исходным кодом с упором на простоту и продуктивность. Он обладает элегантным синтаксисом, который приятно читать и легко писать. В это разделе собраны материалы, которые позволят вам научитсья программировать на Ruby практически с нуля.',
  url: 'http://ruby.hasbrains.org/',
  paid: false,
  language: 'Русский'
)
p "#{course.title} created, paid? #{course.paid}"

course = Course.create(
  title: 'hasBrains: Rails',
  description: 'RubyOnRails - один из самых популярных и развитых на данный момент фреймворков для разработки веб-приложений, написанный на языке Ruby. Этот курс предлагает познакомиться с основами фреймворка и быстро научиться создавать простые веб-приложения. Чтобы начать, вам понадобится базовое знание языка Ruby, которое можно получить в соответствующем разделе на сайте.',
  url: 'http://rails.hasbrains.org/',
  paid: false,
  language: 'Русский'
)
p "#{course.title} created, paid? #{course.paid}"

course = Course.create(
  title: 'RubyBursa',
  description: 'Мы предлагаем вам выход из ситуации, в которую попадают 80% новичков, бросающих изучение на полпути. Получите все необходимые знания и сразу же примените их на практике. Алгоритм буквально такой: теория - практика, теория - практика и так до конца. Если вы хотите разобрать по шагам весь процесс разработки и внедрения компонентов - это можно сделать на курсах. Вы начнете с самого простого проекта и постепенно доведете его до полноценного современного Web приложения.',
  url: 'http://rubybursa.com/',
  paid: true,
  language: 'Русский'
)
p "#{course.title} created, paid? #{course.paid}"

course = Course.create(
  title: 'LevelUp: Ruby on Rails',
  description: 'Ruby on Rails - это прорыв в снижении входного барьера в программировании. Мощные веб–приложения, которые раньше разрабатывались за недели или месяцы, теперь могут быть сделаны за считанные дни. Акцент курса делается на понимание и практику программирования на языке Ruby в объектно-ориентированном стиле c использованием самого популярного, мощного и в тоже время простого фреймворка - Rails, написанного Девидом Хэйнемеером-Хенсcоном. Для увеличения объема пройденного материала часть теории будет Вашей домашней работой с последующим закреплением в форме вопросов, обычно задаваемых на собеседовании. Фреймворк Rails сочетает в себе все передовые технологии, идеи и паттерны проектирования, благодаря чему разработка на нем становится в несколько раз проще и быстрее. ',
  url: 'http://levelp.ru/courses/programmirovanie/ruby-on-rails-developer/',
  paid: true,
  language: 'Русский'
)
p "#{course.title} created, paid? #{course.paid}"

course = Course.create(
  title: 'Coursera: Web Application Architectures',
  description: 'This course explores the development of web application architectures from an engineering perspective.  We will consider the fundamental design patterns and philosophies associated with modern web application architectures, along with their major components.',
  url: 'https://www.coursera.org/course/webapplications',
  paid: false,
  language: 'English'
)
p "#{course.title} created, paid? #{course.paid}"

course = Course.create(
  title: 'Специалист: Ruby Association',
  description: 'Центр компьютерного обучения «Специалист» при МГТУ им. Н.Э. Баумана первым в России начал преподавание Ruby & Ruby on Rails на курсе «Ruby. Уровень 1. Основы программирования на языке Ruby». Успешное окончание курса подготовит Вас к сдаче международного сертификационного экзамена RY0-100 – Ruby Association Certified Ruby Programmer Silver.',
  url: 'http://www.specialist.ru/vendor/ruby-association',
  paid: true,
  language: 'Русский'
)
p "#{course.title} created, paid? #{course.paid}"

course = Course.create(
  title: 'Специалист: Ruby',
  description: 'На занятиях курса Вы освоите основные принципы и методики объектно-ориентированного программирования и их реализацию на языке Ruby. Вы овладеете основным инструментарием, применяемым при программировании на языке Ruby. Ruby - динамично развивающийся язык программирования, удовлетворяющий самым современным запросам информационных технологий. В нем нашли отражение как традиционных, так и новые методики обработки информации и решения связанных с этим задач.',
  url: 'http://www.specialist.ru/course/ruby1-a',
  paid: true,
  language: 'Русский'
)
p "#{course.title} created, paid? #{course.paid}"

course = Course.create(
  title: 'Hackday: Интенсив Ruby on Rails',
  description: 'ZendFramework, Django, Plone? Все эти фреймворки имеют лишь отдаленное сходство с Rails - фреймворком, на котором 80% действий выполняется простым конфигурированием: Авторизация, регистрация, восстановление паролей, Авторизация с помощью социальных сетей, Оплата товаров и услуг (поддержка 80 видов платежных систем), Админка сайта, Безопасность, Формы любой сложности с проверкой данных и выводом ошибок, Локализация интерфейса и пр.',
  url: 'http://hackday.ru/school/3',
  paid: true,
  language: 'Русский'
)
p "#{course.title} created, paid? #{course.paid}"

course = Course.create(
  title: 'Upcase',
  description: "Upcase turns junior Rails developers into ass-kicking name-takers. We're not a bootcamp, we're a finishing school.",
  url: 'https://upcase.com/',
  paid: true,
  language: 'English'
)
p "#{course.title} created, paid? #{course.paid}"

course = Course.create(
  title: 'Learn.co: Intro to Ruby',
  description: 'Learn the basics of the Ruby language by building Tic Tac Toe as a command line application.',
  url: 'https://learn.co/tracks/intro-to-ruby-development',
  paid: false,
  language: 'English'
)
p "#{course.title} created, paid? #{course.paid}"


course = Course.create(
  title: 'Evil Martians: Брейнвошинг: Разработка на Ruby on Rails',
  description: 'https://brainwashing.pro/rails',
  url: 'https://brainwashing.pro/rails',
  paid: true,
  language: 'Русский'
)
p "#{course.title} created, paid? #{course.paid}"


course = Course.create(
  title: 'RubyNinja',
  description: '3 курса для всех уровней подготовки, каждый из которых адаптируете индивидуально. 3 профессиональных программиста-преподавателя. 25 студентов ежемесячно по всей России',
  url: 'http://rubyninja.ru/promo.php',
  paid: true,
  language: 'Русский'
)
p "#{course.title} created, paid? #{course.paid}"


course = Course.create(
  title: 'GeekBrains: Программист Ruby',
  description: 'Только GeekBrains имеет более 30 компаний-партнеров в сфере ИТ для стажировки наших выпускников. Сразу после завершения обучения Вы сможете выбрать наиболее интересную стажировку для работы над реальным проектом.',
  url: 'https://geekbrains.ru/professions/ruby_developer',
  paid: true,
  language: 'Русский'
)
p "#{course.title} created, paid? #{course.paid}"


course = Course.create(
  title: 'Moscow Coding School: Основы Ruby on Rails',
  description: 'Ruby on Rails — это прорыв в снижении входного барьера в программировании. Веб-приложения, которые раньше требовали месяцы разработки, теперь могут быть сделаны за считанные дни. Rails используют все — от стартапов и некоммерческих организаций до крупного бизнеса. Rails — это прежде всего инфраструктура, поэтому среда великолепно подходит для любого типа веб-приложений, будь это программы для организации совместной работы, поддержки сообществ, электронного бизнеса, управления содержанием, статистики, управления.',
  url: 'http://moscoding.ru/course/rails/',
  paid: true,
  language: 'Русский'
)
p "#{course.title} created, paid? #{course.paid}"


course = Course.create(
  title: 'RubyGarage: Курсы по Ruby/Rails',
  description: "Курс создан для тех, кто хочет освоить профессию 'WEB разработчик'. Цель курса — дать участникам необходимый уровень знаний и навыков, когда их можно будет смело брать на работу. Программа курса основана на требованиях работодателей и сфокусирована на процессах, подходах и лучших практиках опытных разработчиков. Основная наша задача — научить участников создавать качественные WEB-приложения на базе Ruby on Rails, привить лучшие практики и культуру разработки.",
  url: 'https://rubygarage.com.ua/',
  paid: true,
  language: 'Русский'
)
p "#{course.title} created, paid? #{course.paid}"


course = Course.create(
  title: 'Pragmatic Studio: Ruby on Rails: Level I',
  description: "You'll discover how to put all the pieces together to build a complete Ruby on Rails 4 app from idea to deployment. You'll come away with a solid understanding of Rails as well as key design principles and practices to help you craft robust and flexible apps on your own!",
  url: 'https://pragmaticstudio.com/rails',
  paid: true,
  language: 'English'
)
p "#{course.title} created, paid? #{course.paid}"


course = Course.create(
  title: 'Pragmatic Studio: Ruby Programming',
  description: "You'll discover how to build your own Ruby program from beginning to end, incorporate Ruby principles and techniques in your design, write your own Ruby gem, and make sense of the “magic” behind Rails. All of the topics and syntax in this course work seamlessly with both Ruby 2.0 and 1.9.",
  url: 'https://pragmaticstudio.com/ruby',
  paid: true,
  language: 'English'
)
p "#{course.title} created, paid? #{course.paid}"


course = Course.create(
  title: 'Pragmatic Studio: Ruby on Rails: Level II',
  description: "You'll learn how to design some of the more advanced Rails features you've seen in sophisticated apps including user accounts, authentication and authorization, many-to-many and through associations, custom routes, and other pro-level design facets in Rails 4.",
  url: 'https://pragmaticstudio.com/rails-ii',
  paid: true,
  language: 'English'
)
p "#{course.title} created, paid? #{course.paid}"


course = Course.create(
  title: 'OneMonth: Ruby on Rails',
  description: "One Month's Ruby on Rails tutorials are a series of video lessons and tutorials that show anyone (even a total beginner) how to build their first web application (a simple photo-sharing app). When you sign up, you immediately get access to a member's area where you can take each lesson at your own pace. Along the way, you'll learn Ruby on Rails, HTML, CSS, JavaScript, and much more.",
  url: 'https://onemonth.com/courses/one-month-rails',
  paid: true,
  language: 'English'
)
p "#{course.title} created, paid? #{course.paid}"


course = Course.create(
  title: 'OneMonth: Web Security',
  description: "By the end of One Month Web Security, you will be able to review your own applications for security issues and ensure the code is properly hardened against malicious attacks. You will also be able to design new applications with security in mind, significantly lowering the risk and cost associated with deploying new applications.",
  url: 'https://onemonth.com/courses/web-security',
  paid: true,
  language: 'English'
)
p "#{course.title} created, paid? #{course.paid}"

###

Course.update_all(approved: true)
