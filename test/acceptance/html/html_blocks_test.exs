defmodule Acceptance.Html.HtmlBlocksTest do
  use ExUnit.Case
  
  import Support.Helpers, only: [as_html: 1]

  describe "HTML blocks, one level" do
    test "tables are just tables again (or was that mountains?)" do
      markdown = "<table>\n  <tr>\n    <td>\n           hi\n    </td>\n  </tr>\n</table>\n\nokay.\n"
      html     = "<table>\n  <tr>\n    <td>\n           hi\n    </td>\n  </tr>\n</table><p>okay.</p>\n"
      messages = []

      assert as_html(markdown) == {:ok, html, messages}
    end

    test "div (ine?)" do
      markdown = "<div>\n  *hello*\n         <foo><a>\n</div>\n"
      html     = "<div>\n  *hello*\n         <foo><a>\n</div>"
      messages = []

      assert as_html(markdown) == {:ok, html, messages}
    end

    test "we are not leaving html alone any more" do
      markdown = "<div>\n*Emphasized* text.\n</div>"
      html     = "<div>\n<em>Emphasized</em> text.\n</div>"
      messages = []

      assert as_html(markdown) == {:ok, html, messages}
    end
  end

  describe "HTML blocks, one level, for larger values of one" do
    test "soo verbatim" do
      markdown = """
      <section>
        # Headline
        <nav>
           [linke me on twinter](#)
        </nav>
        <footer>
        __not important__
        </footer>
      </section>
      """
      html = """
      <section>
        <h1>Headline</h1>
        <nav>
          <p><a href="#">linke me on twinter</a></p>
        </nav>
        <footer>
          <p><em>not important</em></p>
        </footer>
      </section>
      """
      messages = []

      assert as_html(markdown) == {:ok, html, messages}
    end
  end
end

# SPDX-License-Identifier: Apache-2.0
