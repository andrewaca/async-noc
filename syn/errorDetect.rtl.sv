`include "/home/scf-12/ee552/proteus/pdk/proteus/svc2rtl.sv"
`E1OFN_M(2,9)
        `E1OFN_M(2,1)
        `E1OFN_M(2,4)
        //--------RTL module--------
        module  errorDetect_RTL    ( interface   In     , interface   Out      , interface   Error      , input    CLK      , input    _RESET       )  ;
logic  [ In        . W              -  1       : 0       ]    data    , ff$data      ;
logic    receivedParity    , ff$receivedParity      ;
always_ff  @ ( posedge  CLK         , negedge  _RESET          )
  begin
   if ( !  _RESET          )
   begin
    ff$data        <= 0       ;
    ff$receivedParity        <= 0       ;
   end
   else
   begin
    ff$data        <= data         ;
    ff$receivedParity        <= receivedParity         ;
   end
  end
  always_comb
   begin
    In        . InitDo          ;
    Out        . InitDo          ;
    Out        . InitData          ;
    Error        . InitDo          ;
    Error        . InitData          ;
    data        =  ff$data          ;
    receivedParity        =  ff$receivedParity          ;
    In        . Receive     ( data          )      ;
    # 1     ;
    Out        . Send     ( data          )      ;
    receivedParity        =  ^  data     [ 8      : 1        ]      ;
    if ( receivedParity        !=  data    [0     ]        )
    begin
     Error        . Send     ( 1        )      ;
    end
    else
    begin
     Error        . Send     ( 0        )      ;
    end
    # 1     ;
   end
   endmodule    //--------------------------
     //------Wrapper module------
     module  errorDetect    ( e1of2_9    . In      In     , e1of2_9    . Out      Out      , e1of2_1    . Out      Error      , input    CLK      , input    _RESET       )  ;
rtl_interface    # ( . M    ( In    .  M          ) , . N    ( In    .  N          )   )  RTL_In     (    )  ;
RECV_M_1ofN    # ( . M    ( In    .  M          ) , . N    ( In    .  N          )   )  In_RECEIVE     ( In    .  In         , RTL_In    .  RcvOut           )  ;
rtl_interface    # ( . M    ( Out    .  M          ) , . N    ( Out    .  N          )   )  RTL_Out     (    )  ;
SEND_M_1ofN    # ( . M    ( Out    .  M          ) , . N    ( Out    .  N          )   )  Out_SEND     ( RTL_Out    .  SndIn         , Out    .  Out           )  ;
rtl_interface    # ( . M    ( Error    .  M          ) , . N    ( Error    .  N          )   )  RTL_Error     (    )  ;
SEND_M_1ofN    # ( . M    ( Error    .  M          ) , . N    ( Error    .  N          )   )  Error_SEND     ( RTL_Error    .  SndIn         , Error    .  Out           )  ;
errorDetect_RTL    errorDetect_RTL_BODY     ( . In    ( RTL_In    .  RtlIn         ) , . Out    ( RTL_Out    .  RtlOut         ) , . Error    ( RTL_Error    .  RtlOut         ) , . CLK    ( CLK         ) , . _RESET    ( _RESET         )   )  ;
endmodule
