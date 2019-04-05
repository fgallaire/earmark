defmodule Acceptance.Html.HtmlVoidTest do
  use ExUnit.Case
  
  import Support.Helpers, only: [as_html: 1]

  describe "HTML void elements" do
    test "area" do
      markdown = "<area shape=\"rect\" coords=\"0,0,1,1\" href=\"xxx\" alt=\"yyy\">\n**emphasized** text"
      html     = "<area shape=\"rect\" coords=\"0,0,1,1\" href=\"xxx\" alt=\"yyy\"><p><strong>emphasized</strong> text</p>\n"
      messages = []

      assert as_html(markdown) == {:ok, html, messages}
    end

    test "we are outside the void now (lucky us)" do
      markdown = "<br>\n**emphasized** text"
      html     = "<br><p><strong>emphasized</strong> text</p>\n"
      messages = []

      assert as_html(markdown) == {:ok, html, messages}
    end

    test "high regards???" do
      markdown = "<hr>\n**emphasized** text"
      html     = "<hr><p><strong>emphasized</strong> text</p>\n"
      messages = []

      assert as_html(markdown) == {:ok, html, messages}
    end

    test "img (a punless test)" do
      markdown = "<img src=\"hello\">\n**emphasized** text"
      html     = "<img src=\"hello\"><p><strong>emphasized</strong> text</p>\n"
      messages = []

      assert as_html(markdown) == {:ok, html, messages}
    end

    test "not everybody knows this one (hint: take a break)" do
      markdown = "<wbr>\n**emphasized** text"
      html = "<wbr><p><strong>emphasized</strong> text</p>\n"
      messages = []
      assert as_html(markdown) == {:ok, html, messages}
    end
  end

end

# SPDX-License-Identifier: Apache-2.0
