describe "directory structure" do
  let :first_chapter { 1 }
  let :last_chapter { 10 }

  it "includes directories for all chapters" do
    (first_chapter..last_chapter).each do |number|
      expect(Dir.exists?(chapter_dir_path(number))).to be(true)
    end
  end

  def chapter_dir_path(number)
    repo_root = File.join(File.dirname(__FILE__), "../")
    File.join(repo_root, "chapter#{number.to_s}")
  end
end
