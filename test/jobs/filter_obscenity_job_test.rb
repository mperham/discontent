require 'test_helper'

class FilterObscenityJobTest < ActiveJob::TestCase
  test "removes bad language" do
    p = Post.create! :title => 'Bite my shiny metal butt.',
                     :body => 'This website is poop!'

    job = FilterObscenityJob.new
    job.perform(p.id)

    p.reload
    assert_equal "Bite my shiny metal bottom.", p.title
    assert_equal "This website is dookie!", p.body
  end
end
