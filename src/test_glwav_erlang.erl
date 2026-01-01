-module(test_glwav_erlang).
-export([main/1]).


-spec main(_Args) -> any()
              when _Args :: [string()].
main(_Args) ->
    Wave = {wave, p_c_m, 44100, 1, i16, []},
    WaveBits = glwav:to_bit_array(Wave),
    io:format("~p~n", [WaveBits]).
