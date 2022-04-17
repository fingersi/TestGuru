class GistSaveService

  EXCEPTIONS = [Octokit::Error, Faraday::ClientError, Faraday::ServerError, Faraday::ConnectionFailed].freeze

  def initialize
    @client = Octokit::Client.new(access_token: Rails.application.credentials.github[:token])
  end

  def call(test_passing, user)
    Gist.new(
      question_id: test_passing.current_question.id,
      link: save_gist(test_passing.current_question),
      user_id: user.id
    )
  end

  private

  def save_gist(question)
    @client.create_gist(gist_content(question)).html_url
  rescue *EXCEPTIONS => e
    puts "error: #{e}"
    nil
  end

  def gist_content(question)
    str = ''
    question.answers.each { |a| str += " answer: #{a.value} \n" }

    {
      discription: I18n.t('gistsave', test: question.test.title),
      files: {
        "question: #{question.id}.html" => {
          content: "#{I18n.t('question')}: #{question.body}\n#{str}"
        }
      }
    }
  end
end
