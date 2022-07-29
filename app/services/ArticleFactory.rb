class ArticleFactory
  BLOCK_SIZE = 25_000

  def generate(number: 100_000)
    iterations = number / BLOCK_SIZE
    leftover = number % BLOCK_SIZE

    puts "Generating #{number} in #{iterations} blocks of #{BLOCK_SIZE}"

    time
    iterations.times do |i|
      articles = article_arr(BLOCK_SIZE)
      Article.insert_all(articles)
      puts "Inserted #{(i + 1) * BLOCK_SIZE}"
    end

    articles = article_arr(leftover)
    Article.insert_all(articles)

  end

  private

  def article_arr(size)
    arr = []
    size.times do
      arr.append(random_article)
    end

    arr
  end

  def random_article
    {
      id: SecureRandom.uuid,
      title: Faker::Company.bs,
      body: Faker::Lorem.words(number: 50)
    }
  end
end
