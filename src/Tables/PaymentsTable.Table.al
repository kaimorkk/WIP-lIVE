Table 52193972 "Payments Table"
{
    //DrillDownPageID = UnknownPage74002;
    //LookupPageID = UnknownPage74002;

    fields
    {
        field(1; No; Code[20])
        {

            trigger OnValidate()
            begin
                if No <> xRec.No then begin
                    GenLedgerSetup.Get;
                    /*
                    IF "Payment Type"="Payment Type"::Normal THEN BEGIN
                      NoSeriesMgt.TestManual(GenLedgerSetup."Cash Limit");
                    END
                    ELSE BEGIN
                      NoSeriesMgt.TestManual(GenLedgerSetup."Default Cash Account");
                    END;
                    */
                    "No. Series" := '';
                end;

            end;
        }
        field(2; Date; Date)
        {
        }
        field(3; Type; Code[20])
        {

            trigger OnValidate()
            begin
                "Account No." := '';
                "Account Name" := '';
                Remarks := '';
                RecPayTypes.Reset;
                RecPayTypes.SetRange(RecPayTypes.Code, Type);
                RecPayTypes.SetRange(RecPayTypes.Type, RecPayTypes.Type::Payment);

                if RecPayTypes.Find('-') then begin
                    Grouping := RecPayTypes."Default Grouping";
                end;
                /*
                IF RecPayTypes.FIND('-') THEN BEGIN
                "Account Type":=RecPayTypes."Account Type";
                "Transaction Name":=RecPayTypes.Description;
                "Investment Type":=RecPayTypes."Investment Type";
                "Investment Transcation Type":=RecPayTypes."Investment Transcation Type";
                "No. Of Units Required":=RecPayTypes."No. Of Units Required";
                "VAT Code":=RecPayTypes."VAT Code";
                "Calculate Interest":=RecPayTypes."Calculate Interest";
                IF RecPayTypes."Account Type"=RecPayTypes."Account Type"::"0" THEN BEGIN
                //RecPayTypes.TESTFIELD(RecPayTypes."G/L Account");
                "Account No.":=RecPayTypes."G/L Account";
                IF "Account No."<>'' THEN
                VALIDATE("Account No.");
                END;
                
                
                END;
                */
                //VALIDATE("Account No.");

            end;
        }
        field(4; "Pay Mode"; Code[20])
        {
            //TableRelation = Table50119.Field1;
        }
        field(5; "Cheque No"; Code[20])
        {
        }
        field(6; "Cheque Date"; Date)
        {
        }
        field(7; "Cheque Type"; Code[20])
        {
            //TableRelation = Table50120;
        }
        field(8; "Bank Code"; Code[20])
        {
            TableRelation = "Bank Account";
        }
        field(9; "Received From"; Text[100])
        {
        }
        field(10; "On Behalf Of"; Text[100])
        {
        }
        field(11; Cashier; Code[20])
        {
        }
        field(12; "Account Type"; Option)
        {
            Caption = 'Account Type';
            OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset,IC Partner';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner";
        }
        field(13; "Account No."; Code[20])
        {
            Caption = 'Account No.';
            TableRelation = if ("Account Type" = const("G/L Account")) "G/L Account"
            else if ("Account Type" = const(Customer)) Customer where("Customer Posting Group" = field(Grouping))
            else if ("Account Type" = const(Vendor)) Vendor
            else if ("Account Type" = const("Bank Account")) "Bank Account"
            else if ("Account Type" = const("Fixed Asset")) "Fixed Asset" where("Asset Type" = field("Investment Type"))
            else if ("Account Type" = const("IC Partner")) "IC Partner";

            trigger OnValidate()
            begin
                "Account Name" := '';
                RecPayTypes.Reset;
                RecPayTypes.SetRange(RecPayTypes.Code, Type);
                RecPayTypes.SetRange(RecPayTypes.Type, RecPayTypes.Type::Payment);

                if "Account Type" in ["account type"::"G/L Account", "account type"::Customer, "account type"::Vendor, "account type"::"IC Partner"]
                then
                    case "Account Type" of
                        "account type"::"G/L Account":
                            begin
                                GLAcc.Get("Account No.");
                                "Account Name" := GLAcc.Name;
                                "VAT Code" := RecPayTypes."VAT Code";
                                "Withholding Tax Code" := RecPayTypes."Withholding Tax Code";
                                "Global Dimension 6 Code" := '';
                                "Control Ac" := "Account No.";
                            end;
                        "account type"::Customer:
                            begin
                                Cust.Get("Account No.");
                                "Account Name" := Cust.Name;
                                Payee := Cust.Name;
                                /*
                                "VAT Code":=Cust."Default VAT Code";
                                "Withholding Tax Code":=Cust."Default Withholding Tax Code";
                                "Global Dimension 6 Code":=Cust."Global Dimension 1 Code";
                                */
                                "Control Ac" := Cust."Customer Posting Group";
                            end;
                        "account type"::Vendor:
                            begin
                                Vend.Get("Account No.");
                                "Account Name" := Vend.Name;
                                Payee := Vend.Name;
                                /*
                               "VAT Code":=Vend."Default VAT Code";
                               "Withholding Tax Code":=Vend."Default Withholding Tax Code";
                               */
                                "Global Dimension 6 Code" := Vend."Global Dimension 1 Code";
                                "Control Ac" := Vend."Vendor Posting Group";
                            end;
                        "account type"::"Bank Account":
                            begin
                                BankAcc.Get("Account No.");
                                "Account Name" := BankAcc.Name;
                                "VAT Code" := RecPayTypes."VAT Code";
                                "Withholding Tax Code" := RecPayTypes."Withholding Tax Code";
                                "Global Dimension 6 Code" := BankAcc."Global Dimension 1 Code";
                                "Control Ac" := BankAcc."Bank Acc. Posting Group";

                            end;
                        "account type"::"Fixed Asset":
                            begin
                                FA.Get("Account No.");
                                "Account Name" := FA.Description;

                                //  "VAT Code":=FA."Default VAT Code";
                                // "Withholding Tax Code":=FA."Default Withholding Tax Code";
                                "Global Dimension 6 Code" := FA."Global Dimension 1 Code";
                            end;
                    end;

            end;
        }
        field(14; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(15; "Account Name"; Text[150])
        {
        }
        field(16; Posted; Boolean)
        {
        }
        field(17; "Date Posted"; Date)
        {
        }
        field(18; "Time Posted"; Time)
        {
        }
        field(19; "Posted By"; Code[20])
        {
        }
        field(20; Amount; Decimal)
        {

            trigger OnValidate()
            begin
                if FA."Asset Type" = FA."asset type"::Equity then
                    "Share Unit Price" := Amount / "No. Of Units";
                "Interest Amount" := Amount - "Gross Amount";
                Yield := (Amount / "Gross Amount") * 100;
                Yield := ROUND(Yield, 0.0001);
            end;
        }
        field(21; Remarks; Text[100])
        {
        }
        field(22; "Transaction Name"; Text[100])
        {
        }
        field(23; "VAT Code"; Code[20])
        {
            //TableRelation = Table50122;
        }
        field(24; "Withholding Tax Code"; Code[20])
        {
            //TableRelation = Table50122;
        }
        field(25; "VAT Amount"; Decimal)
        {
        }
        field(26; "Withholding Tax Amount"; Decimal)
        {
        }
        field(27; "Net Amount"; Decimal)
        {
        }
        field(28; "Paying Bank Account"; Code[20])
        {
            TableRelation = "Bank Account"."No.";

            trigger OnValidate()
            begin
                // IF "Investment Payment Type"="Investment Payment Type"::"Member Deposit" THEN BEGIN
                BankAcc.Get("Paying Bank Account");

                //"Global Dimension 6 Code":=BankAcc."Global Dimension 6 Code";
                //END;
            end;
        }
        field(29; Payee; Text[100])
        {
        }
        field(30; "Global Dimension 6 Code"; Code[20])
        {
            Caption = 'Global Dimension 6 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(6));
        }
        field(31; "Fund Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(7));
        }
        field(32; "PO/INV No"; Code[20])
        {
        }
        field(33; "Bank Account No"; Code[20])
        {
        }
        field(34; "Cashier Bank Account"; Code[20])
        {
        }
        field(35; Status; Option)
        {
            OptionCaption = 'Pending,1st Approval,2nd Approval,Cheque Printing,Rejected,Approved';
            OptionMembers = Pending,"1st Approval","2nd Approval","Cheque Printing",Rejected,Approved;
        }
        field(36; Select; Boolean)
        {
        }
        field(37; Grouping; Code[20])
        {
            TableRelation = "Customer Posting Group".Code;
        }
        field(38; "Payment Type"; Option)
        {
            OptionMembers = Normal,"Petty Cash";
        }
        field(39; "Bank Type"; Option)
        {
            OptionMembers = Normal,"Petty Cash";
        }
        field(40; "PV Type"; Option)
        {
            OptionMembers = Normal,Other;
        }
        field(41; "Apply to"; Code[20])
        {
            TableRelation = "Vendor Ledger Entry"."Vendor No." where("Vendor No." = field("Account No."));
        }
        field(42; "Apply to ID"; Code[20])
        {
        }
        field(44; "No. Of Units"; Decimal)
        {

            trigger OnValidate()
            begin

                if "No. Of Units" < 0 then
                    Error('You cannot purchase Negative No. of Shares');
                // VALIDATE("Price Per Share");

                // IF RightsIssue.Posted=TRUE THEN
                //BEGIN
                // IF "No. Of Units">RightsIssue."New No. of Units" THEN
                // ERROR('You do not qualify to by that amount of shares');
                //END;

                // Rights Issue
                if "Rights Issue" = true then begin
                    if "No. Of Units" > "No. of Shares Qualified" then
                        Error('You do not qualify to by that amount of shares, Check your Right Issue');
                end;
            end;
        }
        field(45; "Investment No"; Code[20])
        {
            TableRelation = "Fixed Asset";

            trigger OnValidate()
            begin
                if FA.Get("Investment No") then begin
                    //  "Global Dimension 6 Code":=FA."Global Dimension 6 Code";
                    // "Fund Code":=FA."Global Dimension 6 Code";
                    // Broker:=FA.Broker;
                    // IF Broker<>'' THEN
                    // VALIDATE(Broker);

                    //IF "Investment Payment Type"="Investment Payment Type"::"Unit Trust" THEN BEGIN
                    if FA."Asset Type" = FA."asset type"::"Unit Trust" then begin
                        /*
                        //"No. Of Units":=FA."Minimum Amount"/FA."Initial Unit Price";
                        //FA.CALCFIELDS("Current Value","No.Of Units");
                        IF FA."Current Value"=0 THEN
                        "Price Per Share":=FA."Initial Unit Price"
                        ELSE
                        "Price Per Share":=FA."Current Value"/FA."No.Of Units";
                         */


                    end;

                end;


                if "Calculate Interest" then begin

                    if InvestmentRec.Get("Investment No") then begin
                        /*
                        IF InvestmentRec."Tracking Renewal date"='05' THEN BEGIN
                            "Interest Rate":=InvestmentRec."Rate %";
                          // Principal:=ROUND("Gross Amount"/(1+("Interest Rate"/100)*(InvestmentRec."Maturity Period Days"/365)),0.01);
                           Principal:="Gross Amount"/100*ROUND(100/(1+("Interest Rate"/100)*(InvestmentRec."Maturity Period Days"/365)),0.001);
                            //Principal:=ROUND("Gross Amount"/(1+("Interest Rate"/100)*(91/365)),0.01);

                        //MESSAGE('%1',Principal);
                            "Interest Amount":="Gross Amount"-Principal;
                           // "Interest Amount":=ROUND(("Interest Rate"/100)*(InvestmentRec."Maturity Period Days"/365)*Amount,0.01);
                          END;
                        */
                        /*
                        if InvestmentRec."Investment Type"='06' then begin
                            "Interest Rate":=InvestmentRec."Rate %";
                          // Principal:=ROUND("Gross Amount"/(1+("Interest Rate"/100)*(InvestmentRec."Maturity Period Days"/365)),0.01);
                           Principal:="Gross Amount"/100*ROUND(100/(1+("Interest Rate"/100)*(InvestmentRec."Maturity Period Days"/365)),0.001);


                        //MESSAGE('%1',Principal);
                            "Interest Amount":="Gross Amount"-Principal;
                           "Interest Amount":=ROUND(("Interest Rate"/100)*(InvestmentRec."Maturity Period Days"/365)*Amount,0.01);
                          end;
                        */

                    end;
                end;

            end;
        }
        field(46; "Investment Type"; Option)
        {
            OptionMembers = " ","Money Market",Property,Equity,Mortgage;
        }
        field(47; "Investment Transcation Type"; Option)
        {
            OptionMembers = " ",Acquisition,Disposal,Interest,Dividend,Bonus,Revaluation,"Share-split",Premium,Discounts,"Other Income",Expenses,Principal;
        }
        field(48; "No. Of Units Required"; Boolean)
        {
        }
        field(49; Multiple; Boolean)
        {
        }
        field(50; "Interest Amount"; Decimal)
        {

            trigger OnValidate()
            begin
                // Amount:="Gross Amount"+"Interest Amount";
                // Amount:="Gross Amount";
                "Dirty Price" := "Interest Amount" / "Gross Amount" * 100;
            end;
        }
        field(51; "Interest Rate"; Decimal)
        {
            DecimalPlaces = 2 : 6;

            trigger OnValidate()
            begin
                if "Calculate Interest" then begin
                    if InvestmentRec.Get("Investment No") then begin

                        "Interest Amount" := ROUND(("Interest Rate" / 100) * (InvestmentRec."Maturity Period Days" / 365) * Amount, 0.01);
                        Amount := "Broker Fees" + "Interest Amount";
                        Validate(Amount);

                    end;
                end;
            end;
        }
        field(52; "Calculate Interest"; Boolean)
        {
        }
        field(53; "Control Ac"; Code[20])
        {
        }
        field(54; Broker; Code[20])
        {
            //TableRelation = Table74120;

            trigger OnValidate()
            begin

                if Brokers.Get(Broker) then begin
                    Payee := Brokers.Name;
                    //Commission:=Brokers."Commision Percentage";
                end;
                // MESSAGE('%1',Commission);
            end;
        }
        field(55; Currency; Code[20])
        {
            TableRelation = Currency;
        }
        field(56; "Security Cost"; Decimal)
        {
        }
        field(57; "Broker Fees"; Decimal)
        {
            DecimalPlaces = 1 : 4;

            trigger OnValidate()
            begin
                //"Revenue Stamp Fees" :=(("Broker Fees" + "Other Charges" + "Gross Amount")/10000) *2;
                //VALIDATE("Broker Fees");
                //"Broker Fees":="Interest Amount"*("Broker Fees"/100);
                Amount := "Interest Amount" + "Broker Fees" + "Gross Amount" + "Other Charges";
            end;
        }
        field(58; "Other Charges"; Decimal)
        {

            trigger OnValidate()
            begin
                Amount := "Gross Amount" + "Broker Fees" + "Other Charges";
                //"Revenue Stamp Fees";
                //"Revenue Stamp Fees" :=(("Broker Fees" + "Other Charges" + "Gross Amount")/10000) *2;
            end;
        }
        field(59; "Gross Amount"; Decimal)
        {

            trigger OnValidate()
            begin
                if "Investment Type" = "investment type"::Equity then begin
                    "Price Per Share" := "Gross Amount" / "No. Of Units";
                    "Share Unit Price" := "Gross Amount" / "No. Of Units";
                end;
                if "Account Type" <> "account type"::Vendor then begin
                    if RecPayTypes.Get(Type, RecPayTypes.Type::Payment) then
                        /*
                        IF RecPayTypes."Calculate Broker Commission" THEN
                        BEGIN
                        IF Vend.GET(Broker) THEN
                        //"Broker Fees":=Amount*(Vend."Commision Percentage"/100);
                        //Revenue Stamp Fees Calculation
                        //"Revenue Stamp Fees" :=(("Broker Fees" + "Other Charges" + "Gross Amount")/10000) * 2;
                         //Larger := '>';
                         //Precision := 1;
                        // "Revenue Stamp Fees" := ROUND("Revenue Stamp Fees",Precision,Larger);
                          //MESSAGE('%1',"Revenue Stamp Fees");
                        //END;
                         //"Revenue Stamp Fees" :=(("Broker Fees" + "Other Charges" + "Gross Amount")/10000) *2;
                        // Amount:="Gross Amount"+"Broker Fees"+"Other Charges";

                        FA.GET("Investment No");

                        IF FA."Tracking Renewal date"='05' THEN BEGIN
                        VALIDATE("Investment No");

                        //Amount:="Gross Amount"-"Interest Amount";
                        Amount:="Broker Fees"+"Interest Amount";
                        MODIFY;
                        END;

                        IF FA."Tracking Renewal date"='06' THEN BEGIN
                        VALIDATE("Investment No");

                        //Amount:="Gross Amount"-"Interest Amount";
                        MODIFY;
                        END;



                        END;

                        IF "Account Type"="Account Type"::Vendor THEN BEGIN

                        IF RecPayTypes.GET(Type,RecPayTypes.Type::"2") THEN
                        IF RecPayTypes."Calculate Broker Commission" THEN
                        BEGIN
                        IF Vend.GET(Broker) THEN
                        //"Broker Fees" := Amount* (Vend."Commision Percentage"/100);
                        "Broker Fees" :=("Broker Fees"/100)*"Gross Amount";
                        "Other Charges":=("Other Charges"/100)*"Interest Amount";


                        ///"Revenue Stamp Fees" :="Broker Fees" + "Other Charges" + "Gross Amount";
                         //Larger := '>';
                         //Precision := 1;
                        // "Revenue Stamp Fees" := ROUND("Revenue Stamp Fees",Precision,Larger);
                         END;
                         Amount:= "Gross Amount" + "Broker Fees" + "Other Charges"+"Revenue Stamp Fees" ;
                         //VALIDATE(Amount);
                        //"Revenue Stamp Fees" :=(("Broker Fees" + "Other Charges" + "Gross Amount")/10000) * 2;
                        // Larger := '>';
                        // Precision := 1;
                        // "Revenue Stamp Fees" := ROUND("Revenue Stamp Fees",Precision,Larger);


                        END;

                        IF
                        FA.GET("Investment No") THEN
                        BEGIN
                         IF
                           FA."Asset Type"= FA."Asset Type"::"Unit Trust" THEN
                          BEGIN
                          IF Vend.GET("Unit Trust Member No") THEN
                            BEGIN
                                Vend.CALCFIELDS(Cost,Cost1,Cost2,"Balance (LCY)","Acquisition Cost","Acquisition Cost1","Acquisition Cost2");
                                DeficitMin:=(FA."Minimum Amount"-Vend.Cost+Vend.Cost1+Vend.Cost2);
                                Uninvamt:= Vend."Balance (LCY)"- ( Vend."Acquisition Cost"+ Vend."Acquisition Cost1"+ Vend."Acquisition Cost2");

                            IF Uninvamt<"Gross Amount" THEN BEGIN
                              ERROR('The Max amount available for Investment is %1',Uninvamt);
                             END;

                          IF (Vend.Cost+Vend.Cost1+Vend.Cost2+"Gross Amount") < FA."Minimum Amount" THEN BEGIN
                           ERROR('The minimum amount required for Investment is atleast %1',DeficitMin);
                              END;
                             END;
                            END;
                        IF RecPayTypes.GET(Type,RecPayTypes.Type::"1") THEN
                        IF RecPayTypes."Calculate Broker Commission" THEN
                        BEGIN
                        IF Vend.GET(Broker) THEN
                        //"Broker Fees" := Amount* (Vend."Commision Percentage"/100);
                        "Broker Fees" :=("Broker Fees"/100)*"Gross Amount";
                        "Other Charges":=("Other Charges"/100)*"Interest Amount";


                        ///"Revenue Stamp Fees" :="Broker Fees" + "Other Charges" + "Gross Amount";
                         //Larger := '>';
                         //Precision := 1;
                        // "Revenue Stamp Fees" := ROUND("Revenue Stamp Fees",Precision,Larger);
                         END;
                         */
                 Amount := "Gross Amount" + "Broker Fees" + "Other Charges" + "Revenue Stamp Fees";

                end;

                /*
                IF Vend.GET("Investment No") THEN BEGIN
                
                Vend.CALCFIELDS(Cost);
                
                MESSAGE('%1',Vend.Cost);
                
                Vend.CALCFIELDS(Cost);
                END;
                 */

            end;
        }
        field(60; "Price Per Share"; Decimal)
        {
            DecimalPlaces = 1 : 4;

            trigger OnValidate()
            begin
                "Gross Amount" := "No. Of Units" * "Price Per Share";
                //MESSAGE('%1',Commission);
                /*
                IF Vend.GET(Broker) THEN BEGIN
                Commission:=Vend."Commision Percentage";
                //MESSAGE('%1',Commission);
                "Broker Fees":=Amount*(Vend."Commision Percentage"/100);
                //"Revenue Stamp Fees" :=(("Broker Fees" + "Other Charges" + "Gross Amount")/10000) * 2;
                // Larger := '>';
                // Precision := 1;
                // "Revenue Stamp Fees" := ROUND("Revenue Stamp Fees",Precision,Larger);
                
                END;
                
                "Broker Fees":="Gross Amount"*Commission/100;
                //"Revenue Stamp Fees" :=(("Broker Fees" + "Other Charges" + "Gross Amount")/10000) * 2;
                 //Larger := '>';
                 //Precision := 1;
                 //"Revenue Stamp Fees" := ROUND("Revenue Stamp Fees",Precision,Larger);
                //"Revenue Stamp Fees" := ROUND("Revenue Stamp Fees",Precision,Larger);
                     MODIFY;
                IF ("Investment Payment Type"<>"Investment Payment Type"::"Member Deposit") OR
                ("Investment Payment Type"<>"Investment Payment Type"::"Unit Trust")
                 THEN BEGIN
                IF InvestSetup.GET THEN
                "Other Charges":="Gross Amount"*InvestSetup."Other Commission Percentage"/100;
                
                END;
                //"Revenue Stamp Fees" :=(("Broker Fees" + "Other Charges" + "Gross Amount")/10000) * 2;
                 //Larger := '>';
                // Precision := 1;
                // "Revenue Stamp Fees" := ROUND("Revenue Stamp Fees",Precision,Larger);
                
                    //Amount Calcultaion
                 //Amount := "Gross Amount" + "Broker Fees" + "Other Charges";
                 Amount:="Gross Amount"+"Broker Fees"+"Other Charges" + "Revenue Stamp Fees";
                
                
                IF "Investment Payment Type"="Investment Payment Type"::"Unit Trust" THEN BEGIN
                IF FA.GET("Investment No") THEN BEGIN
                IF Amount<FA."Minimum Amount" THEN
                ERROR('The member allocation amount is less than the minimum deposit.Please check!!');
                END;
                END;
                
                
                 MODIFY;
                VALIDATE("Gross Amount");
                VALIDATE(Amount);
                
                
                FA.GET("Investment No");
                
                IF FA.UnitTrust=TRUE THEN BEGIN
                
                IF InvestmentRec.GET(FA."Unit Trust") THEN BEGIN
                InvestmentRec.CALCFIELDS("Acquisition Cost");
                FA2.RESET;
                //WHERE(Asset Type=CONST(Equity),UnitTrust=CONST(Yes))
                //FA.SETRANGE(FA2."Asset Type",FA2."Asset Type"::Equity);
                FA2.SETRANGE(FA2.UnitTrust,TRUE);
                FA2.SETRANGE(FA2."Unit Trust",InvestmentRec."No.");
                
                IF FA2.FIND('-') THEN BEGIN
                REPEAT
                FA2.CALCFIELDS(FA2."Acquisition Cost","Current Value");
                AmountInvested:=AmountInvested+FA2."Acquisition Cost";
                //"Investments Current Value":="Investments Current Value"+FA."Current Value";
                UNTIL FA2.NEXT=0;
                END;
                
                END;
                RemainingAmt:=InvestmentRec."Acquisition Cost"-AmountInvested;
                //MESSAGE('%1',AmountInvested);
                //MESSAGE('%1',RemainingAmt);
                
                //IF Amount>RemainingAmt THEN ERROR('You have exceeded the remaining amount of unit trust.Please check!!');
                END;
                */

            end;
        }
        field(61; "Share Unit Price"; Decimal)
        {
            DecimalPlaces = 1 : 4;
        }
        field(62; Institution; Code[20])
        {
            TableRelation = Institution1;

            trigger OnValidate()
            begin
                /*IF Institutions.GET(Institution) THEN
                "Intitution Name":=Institutions.Description;
                MODIFY;
                */

            end;
        }
        field(63; "Intitution Name"; Text[100])
        {
        }
        field(64; "Investment Payment Type"; Option)
        {
            OptionCaption = ''''',Equity,Money Market,Unit Trust';
            OptionMembers = ,Equity,"Money Market","Unit Trust","Member Deposit","Member Redeem",Mortgage,property;
        }
        field(65; "Unit Trust Member No"; Code[20])
        {

            trigger OnValidate()
            begin
                if Brokers.Get("Unit Trust Member No") then begin
                    "Unit Trust Member Name" := Brokers.Name
                end else begin
                    "Unit Trust Member Name" := '';

                end;
            end;
        }
        field(66; "Unit Trust Member Name"; Text[100])
        {
        }
        field(67; UnitTrust; Boolean)
        {
        }
        field(68; "Payment Schedule"; Date)
        {
            //TableRelation = Table54022.Field2;

            trigger OnValidate()
            begin
                /*
                IF  PaymentSchedule.GET("Unit Trust Member No","Payment Schedule") THEN BEGIN
                 "Gross Amount":=PaymentSchedule."Expected  Amount";
                 VALIDATE("Gross Amount");
                 MODIFY;
                END;
                */

            end;
        }
        field(69; "Available Money"; Decimal)
        {

            trigger OnValidate()
            begin
                /*
                IF Vend.GET("Investment No") THEN BEGIN
                
                Vend.CALCFIELDS(Cost);
                
                MESSAGE('%1',Vend.Cost);
                END;
                */

            end;
        }
        field(70; "Revenue Stamp Fees"; Decimal)
        {
            Editable = true;

            trigger OnValidate()
            begin
                /*"Revenue Stamp Fees" :=(("Broker Fees" + "Other Charges" + "Gross Amount")/10000) * 2;
                 Larger := '>';
                 Precision := 1;
                 "Revenue Stamp Fees" := ROUND("Revenue Stamp Fees",Precision,Larger);
                 VALIDATE("Revenue Stamp Fees");*/
                Amount := "Gross Amount" + "Broker Fees" + "Other Charges" + "Revenue Stamp Fees";

            end;
        }
        field(71; "Dirty Price"; Decimal)
        {

            trigger OnValidate()
            begin
                //"Interest Amount":=("Dirty Price"*"Gross Amount")/100;
                "Broker Fees" := "Interest Amount" * ("Broker Fees" / 100);
                //Amount:="Interest Amount"+"Broker Fees";
            end;
        }
        field(72; "New Ratio"; Decimal)
        {

            trigger OnValidate()
            begin

                if "Rights Issue" = true then begin

                    if FA.Get("Investment No") then begin
                        FA.SetRange(FA."Maturity Date", 0D, Date);
                        // MESSAGE('%1',FA."No.Of Units");
                        FA.CalcFields(FA."No.Of Units");
                        if "New Ratio" <> 0 then
                            "No. of Shares Qualified" := ("Old Ratio" / "New Ratio") * FA."No.Of Units"
                    end;
                    //MESSAGE('%1',FA."No.Of Units");
                end;
            end;
        }
        field(73; "Old Ratio"; Decimal)
        {
        }
        field(74; "No. of Shares Qualified"; Decimal)
        {
        }
        field(75; "Rights Issue"; Boolean)
        {
        }
        field(76; Yield; Decimal)
        {

            trigger OnValidate()
            begin
                Amount := Yield / 100 * "Gross Amount";
                "Interest Amount" := Amount - "Gross Amount";
            end;
        }
        field(77; "CIFM  Email"; Text[60])
        {
        }
        field(78; "CIFM Approval Time"; Time)
        {
        }
        field(79; "CIFM Approval Date"; Date)
        {
        }
        field(80; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(81; "FIAM ID"; Code[10])
        {
        }
        field(82; "FIAM Approval Time"; Time)
        {
        }
        field(83; "FIAM Approval Date"; Date)
        {
        }
        field(84; "FIAM Email"; Text[60])
        {
        }
        field(85; "CIFM ID"; Code[10])
        {
        }
        field(86; "Issue No"; Code[50])
        {
        }
        field(87; Rate; Decimal)
        {
        }
        field(88; "Cashier E-Mail"; Text[60])
        {
        }
        field(89; "Rejection Comments"; Text[250])
        {
        }
        field(90; "Rejection Date"; Date)
        {
        }
    }

    keys
    {
        key(Key1; No)
        {
            Clustered = true;
        }
        key(Key2; "Unit Trust Member No", "Payment Schedule")
        {
            SumIndexFields = Amount;
        }
        key(Key3; "Investment No", Posted)
        {
            SumIndexFields = "Interest Amount", "Gross Amount";
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        if Posted = true then
            Error('The transaction has already been posted and therefore cannot be modified.');

        /*IF Status<>Status::Pending THEN
        ERROR('The Payment Voucher cannot be modified');*/

    end;

    trigger OnInsert()
    begin
        if No = '' then begin
            GenLedgerSetup.Get;
            /*
              IF "Payment Type"="Payment Type"::Normal THEN BEGIN
                 GenLedgerSetup.TESTFIELD(GenLedgerSetup."Cash Limit");
                 NoSeriesMgt.InitSeries(GenLedgerSetup."Cash Limit",xRec."No. Series",0D,No,"No. Series");
              END
              ELSE BEGIN
                 GenLedgerSetup.TESTFIELD(GenLedgerSetup."Default Cash Account");
                 NoSeriesMgt.InitSeries(GenLedgerSetup."Default Cash Account",xRec."No. Series",0D,No,"No. Series");
              END;
              */
        end;

        Date := Today;
        /*
      //Cashier:=USERID;
      //CashierLinks.RESET;
      //CashierLinks.SETRANGE(CashierLinks.UserID,USERID);
      IF CashierLinks.FIND('-') THEN BEGIN
      "Fund Code":=CashierLinks."Branch Code";
      "Cashier Bank Account":=CashierLinks."Bank Account No";
      END;
        */

    end;

    trigger OnModify()
    begin
        /*IF Posted=TRUE THEN
        ERROR('The transaction has already been posted and therefore cannot be modified.');
        "Dirty Price":="Interest Amount"/"Gross Amount"*100;
        */
        /*IF Status<>Status::Pending THEN
        ERROR('The Payment Voucher cannot be modified');*/

    end;

    trigger OnRename()
    begin
        /*IF Posted=TRUE THEN
        ERROR('The transaction has already been posted and therefore cannot be modified.');*/

        /*IF Status<>Status::Pending THEN
        ERROR('The Payment Voucher cannot be modified');*/

    end;

    var
        GLAcc: Record "G/L Account";
        Cust: Record Customer;
        Vend: Record Vendor;
        FA: Record "Fixed Asset";
        BankAcc: Record "Bank Account";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        GenLedgerSetup: Record "General Ledger Setup";
        RecPayTypes: Record "Receipts and Payment Types1";
        InvestmentRec: Record "Fixed Asset";
        Brokers: Record Vendor;
        Commission: Decimal;
        Principal: Decimal;
        DeficitMin: Decimal;
        Uninvamt: Decimal;
        FA2: Record "Fixed Asset";
        AmountInvested: Decimal;
        RemainingAmt: Decimal;
        Larger: Text[30];
        Precision: Integer;
        StampFees: Decimal;
        Res: Decimal;
        GAMOUNT: Decimal;
}

