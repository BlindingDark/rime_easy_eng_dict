defmodule RimeDict do
  @moduledoc """
  Documentation for RimeDict.
  """

  @max 999_999

  def conver(path, out_path \\ "easy_en.dict.out") do
    path
    |> decode()
    |> encode()
    |> write(path, out_path)

    out_path
  end

  def decode(path) do
    path
    |> File.stream!([:line])
    |> CSV.decode!(headers: true)
  end

  def encode(list) do
    list
    |> Stream.map(fn %{"word" => word, "bnc" => bnc, "frq" => frq} ->
      [word, format_code(word), frequent(bnc, frq)]
    end)
    |> CSV.encode(headers: false, separator: ?\t, delimiter: "\n")
  end

  def format_code(word) do
    word
    |> String.replace(" ", "")
    |> String.replace("'", "")
    |> String.downcase()
  end

  def frequent(bnc, frq) do
    bnc = String.to_integer(bnc)
    frq = String.to_integer(frq)
    f = bnc + frq
    if f == 0, do: 0, else: @max - (bnc + frq)
  end

  def write(contants, from, to) do
    count = get_count(from)

    Enum.reduce(contants, 1, fn contant, now_count ->
      File.write(to, contant, [:append, :utf8])
      ProgressBar.render(now_count, count, suffix: :count)
      now_count + 1
    end)
  end

  def get_count(from) do
    {count, 0} = System.cmd("wc", ["-l", from])
    count = String.split(count) |> List.first() |> String.to_integer()
    # remove head
    count - 1
  end
end
