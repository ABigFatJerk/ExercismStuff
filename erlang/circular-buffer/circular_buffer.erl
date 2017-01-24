-module(circular_buffer).
-export([create/1, size/1, read/1, write/2, write_attempt/2]).
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, code_change/3, terminate/2]).
-behavior(gen_server).

% A buffer state is a tuple of form
% {buffer, MaxSize (number), CurSize (number), Queue (queue)}

create(MaxSize) -> {ok, Pid} = gen_server:start_link(?MODULE, {buffer, MaxSize, 0, queue:new()}, []), Pid.

size(Pid) -> gen_server:call(Pid, size).

read(Pid) -> gen_server:call(Pid, read).

write(Pid, Value) -> gen_server:call(Pid, {write, Value}).

write_attempt(Pid, Value) -> gen_server:call(Pid, {write_attempt, Value}).

% ---- server ----
init(InitialState) -> {ok, InitialState}.

handle_call(size, _From, Buffer = {buffer, MaxSize, _, _}) -> {reply, {ok, MaxSize}, Buffer};
handle_call({write, Value}, _From, Buffer) -> NewBuffer = push(Buffer, Value, overwrite), {reply, ok, NewBuffer};
handle_call({write_attempt, Value}, _From, Buffer) -> case push(Buffer, Value, no_overwrite) of
                                                        full -> {reply, {error, full}, Buffer};
                                                        NewBuffer -> {reply, ok, NewBuffer}
                                                      end;
handle_call(read, _From, Buffer) -> case pop(Buffer) of 
                                      {ok, Value, NewBuffer} -> {reply, {ok, Value}, NewBuffer};
                                      empty -> {reply, {error, empty}, Buffer}
                                    end.

handle_cast(_Message, State) -> {noreply, State}.

handle_info(_Message, State) -> {noreply, State}.

code_change(_, State, _) -> {ok, State}.

terminate(_Reason, _State) -> true.

% ---- private methods for buffer transformation ----
% remove an item from the buffer = remove the item at the front of the queue and decrement the size, OR queue is empty
pop({buffer, MaxSize, CurSize, Queue}) -> case queue:out(Queue) of
                                            {{value, Value}, NewQueue} -> {ok, Value, {buffer, MaxSize, CurSize-1, NewQueue}};
                                            {empty, Queue} -> empty
                                          end.

% adding an item to a full buffer with overwriting allowed = add new item to end of queue and drop item at front of queue out
push({buffer, MaxSize, MaxSize, Queue}, Value, overwrite) -> AddedQueue = queue:in(Value, Queue), 
                                                             {{value, _Value}, ResizedQueue} = queue:out(AddedQueue), 
                                                             {buffer, MaxSize, MaxSize, ResizedQueue};

% adding an item to a full buffer with no overwriting allowed = indicate it's full
push({buffer, MaxSize, MaxSize, _Queue}, _Value, no_overwrite) -> full;

% adding an item to a nonfull buffer = add new item to end of the queue and increment the size
push({buffer, MaxSize, CurSize, Queue}, Value, _) -> AddedQueue = queue:in(Value, Queue), 
                                                     {buffer, MaxSize, CurSize+1, AddedQueue}.
