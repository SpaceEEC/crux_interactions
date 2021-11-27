defmodule Crux.Interaction.MessageComponent.InputTextTest do
  use ExUnit.Case, async: true
  alias Crux.Interaction.MessageComponent.InputText
  doctest InputText

  describe "text_style" do
    test "short" do
      assert 1 === InputText.text_style_short()
    end

    test "paragraph" do
      assert 2 === InputText.text_style_paragraph()
    end
  end

  test "new/3" do
    %InputText{type: 4, style: 1, custom_id: "custom_id", label: "label"} =
      InputText.new(InputText.text_style_short(), "custom_id", "label")
  end

  test "put_placeholder/2" do
    %InputText{
      type: 4,
      style: 1,
      custom_id: "custom_id",
      label: "label",
      placeholder: "hello there"
    } =
      InputText.new(InputText.text_style_short(), "custom_id", "label")
      |> InputText.put_placeholder("hello there")
  end

  @input_text InputText.new(InputText.text_style_short(), "custom_id", "label")

  describe "put_min_length/2" do
    test "valid number works" do
      %InputText{type: 4, style: 1, custom_id: "custom_id", label: "label", min_length: 0} =
        @input_text
        |> InputText.put_min_length(0)
    end

    test "invalid numbers raise" do
      assert_raise FunctionClauseError, fn ->
        InputText.put_min_length(@input_text, -1)
      end
    end
  end

  describe "put_max_length/2" do
    test "valid number works" do
      %InputText{type: 4, style: 1, custom_id: "custom_id", label: "label", max_length: 1} =
        @input_text
        |> InputText.put_max_length(1)
    end

    test "invalid numbers raise" do
      assert_raise FunctionClauseError, fn ->
        @input_text
        |> InputText.put_max_length(0)
      end
    end
  end
end