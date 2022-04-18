class GistSaveService

  EXCEPTIONS = [Octokit::Error, Faraday::ClientError, Faraday::ServerError, Faraday::ConnectionFailed].freeze
  SUCCESSFUL_RESPONSE_CODES = 200..299

  def initialize
    @client = Octokit::Client.new(access_token: Rails.application.credentials.github[:token])
  end

  def call(test_passing)
    @client.create_gist(gist_content(test_passing.current_question)).html_url
  rescue *EXCEPTIONS => e
    puts "error: #{e}"
    nil
  end

  def success?
    return @client.last_response.status >= 200 unless @client.last_response.nil?

    false
  end

  def delete_gist(id)
    @client.delete_gist(id)
  end

  private

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
