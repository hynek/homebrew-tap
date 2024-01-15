class Doc2dash < Formula
  include Language::Python::Virtualenv

  desc "Create docsets for Dash.app-compatible API browsers"
  homepage "https://doc2dash.hynek.me/"
  url "https://files.pythonhosted.org/packages/ba/41/e5eda8e3fff9d1c86345fe040f2de004918006a49dfe1bec41ea6bc0638a/doc2dash-3.1.0.tar.gz"
  sha256 "37f61c8d8f6a955d2466b9c073eb2bff44cc54352bf817afb48a3ac8aef6d594"
  license "MIT"
  head "https://github.com/hynek/doc2dash.git", branch: "main"

  bottle do
    rebuild 1
    root_url "https://hynek.me/bottles"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "d0b388f3703a732791b600226a543fd58a542f54e6273d4ea446e616d141da02"
    sha256 cellar: :any_skip_relocation, catalina:       "396d80b2f0b7b9a5e87a1b781d605a6d2efe1b35e11ee239c389df81add3ffb4"
    sha256 cellar: :any_skip_relocation, big_sur:        "6347927d49b8252051cff2a819faac1d9bc66e2283be2addcd50629cafed2958"
    sha256 cellar: :any_skip_relocation, monterey:       "f158208cfd5e6da1c7a85090b6c8abdeb2c2e078449c0c6ce47f703ead1f3cc2"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "61e031b00a1c7ffc3fda2b63e59135634994ec0a3dfd3c34ddcade200bd7f4b4"
  end

  depends_on "python@3.12"

  resource "attrs" do
    url "https://files.pythonhosted.org/packages/e3/fc/f800d51204003fa8ae392c4e8278f256206e7a919b708eef054f5f4b650d/attrs-23.2.0.tar.gz"
    sha256 "935dc3b529c262f6cf76e50877d35a4bd3c1de194fd41f47a2b7ae8f19971f30"
  end

  resource "beautifulsoup4" do
    url "https://files.pythonhosted.org/packages/af/0b/44c39cf3b18a9280950ad63a579ce395dda4c32193ee9da7ff0aed547094/beautifulsoup4-4.12.2.tar.gz"
    sha256 "492bbc69dca35d12daac71c4db1bfff0c876c00ef4a2ffacce226d4638eb72da"
  end

  resource "click" do
    url "https://files.pythonhosted.org/packages/96/d3/f04c7bfcf5c1862a2a5b845c6b2b360488cf47af55dfa79c98f6a6bf98b5/click-8.1.7.tar.gz"
    sha256 "ca9853ad459e787e2192211578cc907e7594e294c7ccc834310722b41b9ca6de"
  end

  resource "commonmark" do
    url "https://files.pythonhosted.org/packages/60/48/a60f593447e8f0894ebb7f6e6c1f25dafc5e89c5879fdc9360ae93ff83f0/commonmark-0.9.1.tar.gz"
    sha256 "452f9dc859be7f06631ddcb328b6919c67984aca654e5fefb3914d54691aed60"
  end

  resource "Pygments" do
    url "https://files.pythonhosted.org/packages/55/59/8bccf4157baf25e4aa5a0bb7fa3ba8600907de105ebc22b0c78cfbf6f565/pygments-2.17.2.tar.gz"
    sha256 "da46cec9fd2de5be3a8a784f434e4c4ab670b4ff54d605c4c2717e9d49c4c367"
  end

  resource "rich" do
    url "https://files.pythonhosted.org/packages/a7/ec/4a7d80728bd429f7c0d4d51245287158a1516315cadbb146012439403a9d/rich-13.7.0.tar.gz"
    sha256 "5cb5123b5cf9ee70584244246816e9114227e0b98ad9176eede6ad54bf5403fa"
  end

  resource "soupsieve" do
    url "https://files.pythonhosted.org/packages/ce/21/952a240de1c196c7e3fbcd4e559681f0419b1280c617db21157a0390717b/soupsieve-2.5.tar.gz"
    sha256 "5663d5a7b3bfaeee0bc4372e7fc48f9cff4940b3eec54a6451cc5299f1097690"
  end

  def install
    venv = virtualenv_create(libexec, "python3.12")
    venv.pip_install resources

    venv.pip_install_and_link buildpath
  end

  test do
    system "#{bin}/doc2dash", "--version"
  end
end
