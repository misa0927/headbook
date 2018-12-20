require 'rails_helper'

describe Topic do
  it "is valid with title" do
    topic = Topic.new(title:'sample',content:'aaa',image:File.open("./app/assets/images/no_image.png"))
    expect(topic).to be_valid
end
  it "is invalid without a title" do
    topic = Topic.new
    expect(topic).not_to be_valid
  end
  it "is valid with title" do
    topic = Topic.new
    topic.valid?
    expect(topic.errors[:title]).to include("を入力してください")
  end
end
