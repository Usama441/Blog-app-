require "test_helper"

class BlogPostTest < ActiveSupport::TestCase
  test "draft? returns true if published_at is nil" do
    assert blog_posts(:draft).draft?
  end

  test "draft? returns false if published_at is set" do
    refute blog_posts(:published).draft?
  end

 test "draft? returns false if scheduled is in the past" do
    refute blog_posts(:scheduled).draft?
    end

  test "published? returns true for published post" do
    assert blog_posts(:published).published?
  end
  test "published? returns false for draft post" do
    refute blog_posts(:draft).published?
  end

  test "published? returns false for scheduled post" do
    refute blog_posts(:scheduled).published?
  end

  test "scheduled? returns true for scheduled post" do
    assert blog_posts(:scheduled).scheduled?
  end

  test "scheduled? returns false for draft post" do
    refute blog_posts(:draft).scheduled?
  end

  test "scheduled? returns false for published post" do
    refute blog_posts(:published).scheduled?
  end

  def draft_blog_post
    BlogPost.new(published_at: nil)
  end
end
