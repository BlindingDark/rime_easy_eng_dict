defmodule Mix.Tasks.Conver do
  use Mix.Task
  require Logger

  def run([path]) do
    out_path = prepare_head_file()

    path
    |> Path.expand()
    |> RimeDict.conver(out_path)
  end

  @head_file "easy_en.dict.head.yaml"
  @out_file "easy_en.dict.yaml"
  @out_dir "out"

  def prepare_head_file() do
    head = Path.expand(@head_file)
    File.mkdir!(@out_dir)
    out = @out_dir |> Path.join(@out_file) |> Path.expand()

    Logger.info("Output file path: #{out}")

    File.copy!(head, out)

    out
  end
end
