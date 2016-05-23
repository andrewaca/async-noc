`include "/home/scf-12/ee552/proteus/pdk/proteus/svc2rtl.sv"
`E1OFN_M(2,9)
        `E1OFN_M(2,1)
        `E1OFN_M(2,4)
        //--------RTL module--------
        module  decoder4_RTL    ( interface   In     , interface   S      , interface   Out0      , interface   Out1      , input    CLK      , input    _RESET       )  ;
logic  [ In        . W              -  1       : 0       ]    data    , ff$data      ;
logic  [ 3      : 0       ]    address    , ff$address      ;
logic  [ 3      : 0       ]    mask    , ff$mask      ;
logic    leaf    , ff$leaf      ;
always_ff  @ ( posedge  CLK         , negedge  _RESET          )
  begin
   if ( !  _RESET          )
   begin
    ff$data        <= 0       ;
    ff$address        <= 4'b0100        ;
    ff$mask        <= 4'b1100        ;
    ff$leaf        <= 0       ;
   end
   else
   begin
    ff$data        <= data         ;
    ff$address        <= address         ;
    ff$mask        <= mask         ;
    ff$leaf        <= leaf         ;
   end
  end
  always_comb
   begin
    In        . InitDo          ;
    S        . InitDo          ;
    S        . InitData          ;
    Out0        . InitDo          ;
    Out0        . InitData          ;
    Out1        . InitDo          ;
    Out1        . InitData          ;
    data        =  ff$data          ;
    address        =  ff$address          ;
    mask        =  ff$mask          ;
    leaf        =  ff$leaf          ;
    In        . Receive     ( data          )      ;
    # 1     ;
    if ( leaf        ==  1         )
    begin
     if ( ( data     [ 8      : 5        ]    &  mask          )   ==  address           )
     begin
      S        . Send     ( 0        )      ;
      # 1     ;
      Out0        . Send     ( data          )      ;
     end
     else
     begin
      S        . Send     ( 1        )      ;
      # 1     ;
      Out1        . Send     ( data          )      ;
     end
    end
    else
    begin
     if ( ( ( mask        ==  4'b0000         )   &&  ( data    [8     ]     ==  1'b0         )     )   ||  ( ( mask        ==  4'b1000         )   &&  ( data    [7     ]     ==  1'b0         )     )   ||  ( ( mask        ==  4'b1100         )   &&  ( data    [6     ]     ==  1'b0         )     )     ||  ( ( mask        ==  4'b1110         )   &&  ( data    [5     ]     ==  1'b0         )     )      )
     begin
      S        . Send     ( 0        )      ;
      # 1     ;
      Out0        . Send     ( data          )      ;
     end
     else
     begin
      S        . Send     ( 1        )      ;
      # 1     ;
      Out1        . Send     ( data          )      ;
     end
    end
    # 1     ;
   end
   endmodule    //--------------------------
     //------Wrapper module------
     module  decoder4    ( e1of2_9    . In      In     , e1of2_9    . Out      Out0      , Out1      , e1of2_1    . Out      S      , input    CLK      , input    _RESET       )  ;
rtl_interface    # ( . M    ( In    .  M          ) , . N    ( In    .  N          )   )  RTL_In     (    )  ;
RECV_M_1ofN    # ( . M    ( In    .  M          ) , . N    ( In    .  N          )   )  In_RECEIVE     ( In    .  In         , RTL_In    .  RcvOut           )  ;
rtl_interface    # ( . M    ( S    .  M          ) , . N    ( S    .  N          )   )  RTL_S     (    )  ;
SEND_M_1ofN    # ( . M    ( S    .  M          ) , . N    ( S    .  N          )   )  S_SEND     ( RTL_S    .  SndIn         , S    .  Out           )  ;
rtl_interface    # ( . M    ( Out0    .  M          ) , . N    ( Out0    .  N          )   )  RTL_Out0     (    )  ;
SEND_M_1ofN    # ( . M    ( Out0    .  M          ) , . N    ( Out0    .  N          )   )  Out0_SEND     ( RTL_Out0    .  SndIn         , Out0    .  Out           )  ;
rtl_interface    # ( . M    ( Out1    .  M          ) , . N    ( Out1    .  N          )   )  RTL_Out1     (    )  ;
SEND_M_1ofN    # ( . M    ( Out1    .  M          ) , . N    ( Out1    .  N          )   )  Out1_SEND     ( RTL_Out1    .  SndIn         , Out1    .  Out           )  ;
decoder4_RTL    decoder4_RTL_BODY     ( . In    ( RTL_In    .  RtlIn         ) , . S    ( RTL_S    .  RtlOut         ) , . Out0    ( RTL_Out0    .  RtlOut         ) , . Out1    ( RTL_Out1    .  RtlOut         ) , . CLK    ( CLK         ) , . _RESET    ( _RESET         )   )  ;
endmodule
