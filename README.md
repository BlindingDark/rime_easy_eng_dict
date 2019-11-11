# RimeEasyEnglishDict

cover [ECDICT](https://github.com/skywind3000/ECDICT) to [rime-easy-en](https://github.com/BlindingDark/rime-easy-en) dict.

## How to use

1. install Erlang and Elixir.
1. download ECDICT csv dict 👇🏻.
   ```shell
   wget https://github.com/skywind3000/ECDICT/blob/master/ecdict.csv
   ```
1. git clone https://github.com/BlindingDark/rime_easy_eng_dict
1. cd rime_easy_eng_dict
1. run.
   ```shell
   mix conver ./ecdict.csv
   ```
1. dict file will be saved in the `out` folder.
