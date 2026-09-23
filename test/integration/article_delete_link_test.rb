require "test_helper"

class ArticleDeleteLinkTest < ActionDispatch::IntegrationTest
  test "index page uses turbo delete method for article delete links" do
    article = Article.create!(title: "Test title", description: "Test description")

    get articles_path

    assert_response :success
    assert_match(/<a[^>]*data-turbo-method="delete"[^>]*href="\/articles\/#{article.id}"[^>]*>Delete<\/a>/, @response.body)
  end
end
