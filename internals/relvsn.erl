#!/usr/bin/env escript

%% returns (output to stdout) current release vsn from reltool.config

main([ServiceName, RootDir]) ->
    Rel = case file:consult(RootDir ++ "/rel/reltool.config") of
        {ok, Reltool} ->
            Sys = proplists:get_value(sys, Reltool),
            lists:foldl(fun(X, Acc)->
                case X of
                    {rel, ServiceName, VSN, _} -> VSN;
                    _ -> Acc
                end
            end, "", Sys);
        {error, _} ->
            io:format(standard_error, "Error parsing rel/reltool.config", []),
            halt(1)
    end,
    io:format("~s", [Rel]).
