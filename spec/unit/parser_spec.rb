describe GitHubChangelogGenerator::Parser do
  describe ".user_project_from_remote" do
    context "when remote is 1" do
      subject { GitHubChangelogGenerator::Parser.user_project_from_remote("origin  https://github.com/skywinder/ActionSheetPicker-3.0 (fetch)") }
      it { is_expected.to be_a(Array) }
      it { is_expected.to match_array(["skywinder", "ActionSheetPicker-3.0"]) }
    end
    context "when remote is 2" do
      subject { GitHubChangelogGenerator::Parser.user_project_from_remote("https://github.com/skywinder/ActionSheetPicker-3.0") }
      it { is_expected.to be_a(Array) }
      it { is_expected.to match_array(["skywinder", "ActionSheetPicker-3.0"]) }
    end
    context "when remote is 3" do
      subject { GitHubChangelogGenerator::Parser.user_project_from_remote("https://github.com/skywinder/ActionSheetPicker-3.0") }
      it { is_expected.to be_a(Array) }
      it { is_expected.to match_array(["skywinder", "ActionSheetPicker-3.0"]) }
    end
    context "when remote is 4" do
      subject { GitHubChangelogGenerator::Parser.user_project_from_remote("origin git@github.com:skywinder/ActionSheetPicker-3.0.git (fetch)") }
      it { is_expected.to be_a(Array) }
      it { is_expected.to match_array(["skywinder", "ActionSheetPicker-3.0"]) }
    end
    context "when remote is invalid" do
      subject { GitHubChangelogGenerator::Parser.user_project_from_remote("some invalid text") }
      it { is_expected.to be_a(Array) }
      it { is_expected.to match_array([nil, nil]) }
    end
  end
  describe ".user_project_from_option" do
    # context "when option is invalid" do
    #   it("should exit") { expect { GitHubChangelogGenerator::Parser.user_project_from_option("blah", nil) }.to raise_error(SystemExit) }
    # end

    context "when option is valid" do
      subject { GitHubChangelogGenerator::Parser.user_project_from_option("skywinder/ActionSheetPicker-3.0", nil) }
      it { is_expected.to be_a(Array) }
      it { is_expected.to match_array(["skywinder", "ActionSheetPicker-3.0"]) }
    end
    context "when option nil" do
      subject { GitHubChangelogGenerator::Parser.user_project_from_option(nil, nil) }
      it { is_expected.to be_a(Array) }
      it { is_expected.to match_array([nil, nil]) }
    end
    context "when site is nil" do
      subject { GitHubChangelogGenerator::Parser.user_project_from_option("skywinder/ActionSheetPicker-3.0", nil, nil) }
      it { is_expected.to be_a(Array) }
      it { is_expected.to match_array(["skywinder", "ActionSheetPicker-3.0"]) }
    end
    context "when site is valid" do
      subject { GitHubChangelogGenerator::Parser.user_project_from_option("skywinder/ActionSheetPicker-3.0", nil, "https://codeclimate.com") }
      it { is_expected.to be_a(Array) }
      it { is_expected.to match_array(["skywinder", "ActionSheetPicker-3.0"]) }
    end
    context "when second arg is not nil" do
      subject { GitHubChangelogGenerator::Parser.user_project_from_option("skywinder/ActionSheetPicker-3.0", "blah", nil) }
      it { is_expected.to be_a(Array) }
      it { is_expected.to match_array([nil, nil]) }
    end
  end
end
