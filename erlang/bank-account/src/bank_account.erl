-module(bank_account).
-export([test_version/0, create/0, balance/1, deposit/2, close/1, withdraw/2, charge/2]).
% gen-server behavior
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, code_change/3, terminate/2]).
-behavior(gen_server).

test_version() -> 1.

% ---- API ----
create() -> {ok, Pid} = gen_server:start_link(?MODULE, {open, 0}, []), Pid.

balance(Pid) -> gen_server:call(Pid, balance).

deposit(Pid, Amount) -> gen_server:call(Pid, {deposit, Amount}).

close(Pid) -> gen_server:call(Pid, close).

withdraw(Pid, Amount) -> gen_server:call(Pid, {withdraw, Amount}).

charge(Pid, Amount) -> gen_server:call(Pid, {charge, Amount}).

% ---- server ----
% Server state is a tuple {state, Balance (number)} where state = open or closed
init(InitialState) -> {ok, InitialState}.

handle_call(balance, _From, BankAccount = {open, Balance}) -> {reply, Balance, BankAccount};
handle_call(balance, _From, BankAccount = {closed, Balance}) -> {reply, {error, account_closed}, BankAccount};
handle_call({deposit, Amount}, _From, {_, Balance}) -> NewBalance = apply_deposit(Balance, Amount), 
                                                       {reply, ok, {open, NewBalance}};
handle_call({withdraw, Amount}, _From, {_, Balance}) -> {NewBalance, WithdrawnAmount} = apply_withdrawal(Balance, Amount, withdraw), 
                                                        {reply, WithdrawnAmount, {open, NewBalance}};
handle_call({charge, Amount}, _From, {_, Balance}) -> {NewBalance, WithdrawnAmount} = apply_withdrawal(Balance, Amount, charge), 
                                                      {reply, WithdrawnAmount, {open, NewBalance}};
handle_call(close, _From, {open, Balance}) -> {reply, Balance, {closed, 0}}.

handle_cast(_Message, State) -> {noreply, State}.

handle_info(_Message, State) -> {noreply, State}.

code_change(_, State, _) -> {ok, State}.

terminate(_Reason, _State) -> true.

% ---- internal transformation logic ----
apply_deposit(OldBalance, Deposit) when Deposit < 0 -> OldBalance;
apply_deposit(OldBalance, Deposit) -> OldBalance + Deposit.

% return {new balance, withdrawn amount}
apply_withdrawal(OldBalance, Amount, _) when Amount < 0 -> {OldBalance, 0};
apply_withdrawal(OldBalance, Amount, withdraw) when Amount > OldBalance -> {0, OldBalance};
apply_withdrawal(OldBalance, Amount, charge) when Amount > OldBalance -> {OldBalance, 0};
apply_withdrawal(OldBalance, Amount, _) -> {OldBalance - Amount, Amount}.
