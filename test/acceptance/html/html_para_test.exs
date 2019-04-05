defmodule Acceptance.Html.HtmlParaTest do
  use ExUnit.Case
  
  import Support.Helpers, only: [as_html: 1]

  describe "HTML and paragraphs" do
    test "void elements close para" do
      markdown = "alpha\n<hr>beta"
      html     = "<p>alpha</p>\n<hr>beta"
      messages = []

      assert as_html(markdown) == {:ok, html, messages}
    end

    test "void elements close para but only at BOL" do
      markdown = "alpha\n <hr>beta"
      html     = "<p>alpha\n <hr>beta</p>\n"
      messages = []

      assert as_html(markdown) == {:ok, html, messages}
    end

    test "self closing block elements close para" do
      markdown = "alpha\n<div/>beta"
      html     = "<p>alpha</p>\n<div/>beta"
      messages = []

      assert as_html(markdown) == {:ok, html, messages}
    end

    test "self closing block elements close para, atts do not matter" do
      markdown = "alpha\n<div class=\"first\"/>beta"
      html     = "<p>alpha</p>\n<div class=\"first\"/>beta"
      messages = []

      assert as_html(markdown) == {:ok, html, messages}
    end

    test "self closing block elements close para, atts and spaces do not matter" do
      markdown = "alpha\n<div class=\"first\"   />beta\ngamma"
      html     = "<p>alpha</p>\n<div class=\"first\"   />beta<p>gamma</p>\n"
      messages = []

      assert as_html(markdown) == {:ok, html, messages}
    end

    test "self closing block elements close para but only at BOL" do
      markdown = "alpha\n <div/>beta"
      html     = "<p>alpha\n <div/>beta</p>\n"
      messages = []

      assert as_html(markdown) == {:ok, html, messages}
    end

    test "self closing block elements close para but only at BOL, atts do not matter" do
      markdown = "alpha\ngamma<div class=\"fourty two\"/>beta"
      html     = "<p>alpha\ngamma<div class=\"fourty two\"/>beta</p>\n"
      messages = []

      assert as_html(markdown) == {:ok, html, messages}
    end

    test "block elements close para" do
      markdown = "alpha\n<div></div>beta"
      html     = "<p>alpha</p>\n<div></div>beta"
      messages = []

      assert as_html(markdown) == {:ok, html, messages}
    end

    test "block elements close para, atts do not matter" do
      markdown = "alpha\n<div class=\"first\"></div>beta"
      html     = "<p>alpha</p>\n<div class=\"first\"></div>beta"
      messages = []

      assert as_html(markdown) == {:ok, html, messages}
    end

    test "block elements close para but only at BOL" do
      markdown = "alpha\n <div></div>beta"
      html     = "<p>alpha\n <div></div>beta</p>\n"
      messages = []

      assert as_html(markdown) == {:ok, html, messages}
    end

    test "block elements close para but only at BOL, atts do not matter" do
      markdown = "alpha\ngamma<div class=\"fourty two\"></div>beta"
      html     = "<p>alpha\ngamma<div class=\"fourty two\"></div>beta</p>\n"
      messages = []

      assert as_html(markdown) == {:ok, html, messages}
    end

  end
end

# SPDX-License-Identifier: Apache-2.0
