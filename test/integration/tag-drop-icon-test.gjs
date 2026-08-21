import { render } from "@ember/test-helpers";
import { module, test } from "qunit";
import TagDrop from "discourse/select-kit/components/tag-drop";
import { setupRenderingTest } from "discourse/tests/helpers/component-test";

module("Integration | Component | Tag Icons | TagDrop", function (hooks) {
  setupRenderingTest(hooks);

  test("shows the configured icon in the selected tag header", async function (assert) {
    settings.tag_icon_list = "video,circle-question|news,gear";

    this.set("selectedTag", { id: 42, name: "video", slug: "video" });

    await render(<template><TagDrop @tag={{this.selectedTag}} /></template>);

    assert
      .dom(".tag-drop .select-kit-selected-name .d-icon-circle-question")
      .exists("the selected tag uses its configured icon");
  });
});
