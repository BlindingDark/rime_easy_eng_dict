defmodule Mix.Tasks.Conver do
  use Mix.Task

  @head "easy_en.dict.head.yaml"
  @out "out/easy_en.dict.yaml"

  def run([path]) do
    out = copy_head()

    path
    |> Path.expand()
    |> RimeDict.conver(out)
  end

  def copy_head() do
    head = Path.expand(@head)
    out = Path.expand(@out)

    File.copy(head, out)

    out
  end
end
