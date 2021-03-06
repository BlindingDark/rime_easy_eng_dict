# RimeEasyEnglishDict

conver [ECDICT](https://github.com/skywind3000/ECDICT) to [rime-easy-en](https://github.com/BlindingDark/rime-easy-en) dict.

## How to use

1. install Erlang and Elixir.
1. download ECDICT csv dict 👇.
   ```shell
   wget https://github.com/skywind3000/ECDICT/raw/master/ecdict.csv
   ```
1. git clone https://github.com/BlindingDark/rime_easy_eng_dict
1. cd rime_easy_eng_dict
1. run.
   ```shell
   mix deps.get
   mix conver ./ecdict.csv
   ```
1. dict file will be saved in the `out` folder.

### Convert all content

**WARNING! The output file will be too large, it will seriously affect the running speed of RIME!**

By default, only the high-frequency words will be converted, you can convert the entire contents of the dictionary by setting environment variable.

``` shell
CONVERT_ALL_CONTENT=true mix conver ./ecdict.csv
```
