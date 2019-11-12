defmodule RimeDict do
  @moduledoc """
  Documentation for RimeDict.
  """

  @max 999_999

  def conver(path, out_path \\ "easy_en.dict.out") do
    path
    |> decode()
    |> encode()
    |> write(out_path)

    out_path
  end

  def decode(path) do
    path
    |> File.stream!([:line])
    |> CSV.decode!(headers: true)
  end

  def encode(list) do
    list
    |> Stream.flat_map(&format/1)
    |> CSV.encode(headers: false, separator: ?\t, delimiter: "\n")
  end

  def format(%{"word" => word, "bnc" => bnc, "frq" => frq}) do
    frequent = frequent(bnc, frq)
    sentence? = String.contains?(word, " ")

    if frequent > 0 do
      if sentence? do
        format_sentence(word, frequent)
      else
        format_word(word, frequent)
      end
    else
      []
    end
  end

  def format_sentence(word, frequent) do
    [[word, downcase(word), frequent]]
  end

  def format_word(word, frequent) do
    [[word, downcase(word), frequent],
     [String.capitalize(word), capitalize(word), frequent],
     [String.upcase(word), capitalize(word), frequent]]
  end

  def reject(word) do
    word
    |> String.replace(" ", "")
    |> String.replace("'", "")
  end

  def downcase(word) do
    word
    |> reject()
    |> String.downcase()
  end

  def capitalize(word) do
    word
    |> reject()
    |> String.capitalize()
  end

  def frequent(bnc, frq) do
    bnc = String.to_integer(bnc)
    frq = String.to_integer(frq)
    f = bnc + frq
    if f == 0, do: 0, else: @max - (bnc + frq)
  end

  def write(contants, to) do
    Enum.each(contants, fn(contant) ->
      File.write(to, contant, [:append, :utf8])
      print_contant = contant |> String.trim()
      ProgressBar.render(0, 1, width: 0, percent: false, left: "", right: "converting | #{print_contant}")
    end)
  end
end
