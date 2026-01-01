-module(test_glwav_erlang).
-export([main/1]).


-spec main(_Args) -> any()
              when _Args :: [string()].
main(_Args) ->
    SineData = sine_wave(44100, 1.0, 440, 44100),
    Wave = {wave, p_c_m, 44100, 1, i16, SineData},
    WaveBits = glwav:to_bit_array(Wave),
    file:write_file("output.wav", WaveBits).


%% @doc Generates a list of sine wave samples with type annotations.
-spec sine_wave(Samples, Amplitude, Frequency, SampleRate) -> [float()]
              when Samples :: non_neg_integer(),
                   Amplitude :: number(),
                   Frequency :: number(),
                   SampleRate :: number().
sine_wave(Samples, Amplitude, Frequency, SampleRate) ->
    Omega = 2.0 * math:pi() * Frequency,
    [ Amplitude * math:sin(Omega * I / SampleRate) || I <- lists:seq(0, Samples - 1) ].
