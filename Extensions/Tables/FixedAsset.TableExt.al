TableExtension 52193693 tableextension52193693 extends "Fixed Asset"
{
    fields
    {

        
        field(50000; "Acq. date"; Date)
        {
        }
        field(50001; Supplier; Text[50])
        {
        }
        field(50002; "Invoice no."; Code[30])
        {
        }
        field(50003; Cost; Decimal)
        {
        }
        field(50004; "Depr. Rate"; Decimal)
        {
        }
        field(50005; "Acc Depreciation"; Decimal)
        {
        }
        field(50006; "Fixed Asset Type"; Option)
        {
            OptionCaption = ',Equipment,Computers,Furniture and Fittings,Motor Vehicles,Money Market';
            OptionMembers = ,Equipment,Computers,"Furniture and Fittings","Motor Vehicles","Money Market";
        }
        field(50007; "Max. Carrying Capacity"; Decimal)
        {
        }
        field(50008; "In Use"; Boolean)
        {
            CalcFormula = exist("Transport Request1" where("Vehicle Allocated" = field("No."),
                                                            "Return Date" = filter('')));
            FieldClass = FlowField;
        }
        field(50009; "Registration No"; Code[10])
        {
        }
        field(50010; "Parastatl Reg. No"; Code[10])
        {
        }
        field(50011; Make; Text[30])
        {
        }
        field(50012; YOM; Code[10])
        {
        }
        field(50013; "C.C"; Decimal)
        {
        }
        field(50014; Duty; Option)
        {
            OptionMembers = Paid,"Not Paid";
        }
        field(50015; Rating; Decimal)
        {
        }
        field(50016; Body; Text[30])
        {
        }
        field(50017; Model; Text[30])
        {
        }
        field(50018; "Car Rating"; Code[20])
        {
        }
        field(50019; "Language Code (Default)"; Code[10])
        {
        }
        field(50020; Attachement; Option)
        {
            OptionMembers = No,Yes;
        }
        field(50021; Disposed; Boolean)
        {
        }
        field(50022; "Tracking Date"; Date)
        {
        }
        field(50023; "Tracking Renewal date"; Date)
        {
        }
        field(50024; "Car Tracking Company"; Text[60])
        {
        }
        field(50025; "Total Expense"; Decimal)
        {
            CalcFormula = sum("G/L Entry".Amount where("Asset No" = field("No."),
                                                        "Posting Date" = field("FA Posting Date Filter")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50026; "Fuel Consumption Km/Ltr"; Decimal)
        {
        }
        field(50027; "Maturity Period"; Integer)
        {

            trigger OnValidate()
            begin
                /*
                InvestmentSetup.GET;

                IF "Issue Date"<>0D THEN
                BEGIN
                NoOfDays:="Maturity Period"*InvestmentSetup."CBK Year Days";
                 "Maturity Period Days":="Maturity Period"*InvestmentSetup."CBK Year Days";
                "No. Of Interest Periods":="Maturity Period"*2;


                IF NoOfDays>9999 THEN BEGIN
                     NoOfDays1:=NoOfDays-9999;
                     NofDaysTxt1:=FORMAT(NoOfDays1)+'D';
                     NoOfDays:=9999;
                     NofDaysTxt:=FORMAT(NoOfDays)+'D';

                     NewDate:=CALCDATE(NofDaysTxt,"Issue Date");
                      FinalDate:=CALCDATE(NofDaysTxt1,NewDate);
                       "Maturity Date":=FinalDate;
                     // MESSAGE(FORMAT("Maturity Date"));

                     END ELSE  BEGIN
                     IF NoOfDays<=999   THEN
                     //"Maturity Date":=FinalDate;
               NofDaysTxt:=FORMAT(NoOfDays)+'D';
                "Maturity Date":=CALCDATE(NofDaysTxt,"Issue Date");
               END;
                END;
                */

            end;
        }
        field(50028; "No. Of Interest Periods"; Integer)
        {

            trigger OnValidate()
            begin
                // VALIDATE("Rate %");
            end;
        }
        field(50029; Status; Option)
        {
            OptionCaption = 'Open,Pending Approval,Pending Prepayment,Released,Rejected,,Closed';
            OptionMembers = Open,"Pending Approval","Pending Prepayment",Released,Rejected,,Closed;
        }
        field(50030; "Investment Type Name"; Text[50])
        {
            Editable = false;
        }
        field(50050; "No.Of Units"; Decimal)
        {
            Editable = false;
        }
        field(50051; "Asset Type"; Option)
        {
            OptionMembers = " ","Money Market",Property,Equity,Mortgage,"Unit Trust",Forex;
        }
        field(50052; "Interest Rate Type"; Option)
        {
            OptionMembers = " ","Fixed",Floating;
        }
        field(50053; "Acquisition Cost"; Decimal)
        {
            Editable = false;
        }
        field(50054; "Rate %"; Decimal)
        {
            DecimalPlaces = 3 : 8;
            MaxValue = 100;

            trigger OnValidate()
            begin
                if "Asset Type" = "asset type"::Mortgage then begin
                    //result:=5000000*(0.008333333/(1-(POWER(1.008333333,-120))));
                    MonthlyRate := ROUND((("Rate %" / 100) / 12), 0.000000001);
                    //"Expected Repayment":="Loan Amount"*(MonthlyRate/(1-(POWER((1+MonthlyRate),(-1*"No. Of Interest Periods")))));
                    //"Payments Over Term":="Expected Repayment"*"No. Of Interest Periods";
                    //"Interest Over Term":="Payments Over Term"-"Loan Amount";
                end;
                /*
                IF Receipts.GET(Receipts."Investment No") THEN
                BEGIN
                IF "No.Of Units"<Receipts."No. Of Units" THEN
                ERROR('You cannot sale more than what you have');
                END;
                */

            end;
        }
        field(50055; "Issue Date"; Date)
        {

            trigger OnValidate()
            begin
                "Investment Date" := "Issue Date";
            end;
        }
        field(50057; "Term (Days)"; DateFormula)
        {
        }
        field(50060; "Purchase Type"; Option)
        {
            OptionMembers = " ",Primary,Secondary;
        }
        field(50064; "Disposal Value"; Decimal)
        {
            Editable = false;
        }
        field(50065; Revaluations; Decimal)
        {
            Editable = false;
        }
        field(50066; "Interest Received"; Decimal)
        {
            Editable = false;
        }
        field(50067; "Dividend Received"; Decimal)
        {
            Editable = false;
        }
        field(50068; Balance; Decimal)
        {
        }
        field(50069; "Investment Type"; Code[20])
        {
            //TableRelation = Table74012 where (Field3=field("Asset Type"));

            trigger OnValidate()
            begin
                /*
                 IF InvestmentType.GET("Investment Type") THEN
                     BEGIN
                  "Investment Type Name":=InvestmentType.Description;
                  {
                  IF "Investment Type"='01'THEN
                     BEGIN

                    //"Investment Posting Group":='QUOTED EQUITY KENYA';
                    // "Purchase Link":= 'QUOTED-BUY';
                    // "Sale Link":= 'QUOTE-SALE';
                    //"Dividend Link":='DIVIDEND-QUOTED';
                    //"RBA Class":='05';
                     END;

                IF  "Investment Type"='10'THEN
                      BEGIN
                 "NSE Website":=InvestmentSetup."NSE Website";

                     "Investment Posting Group":='UN EQUITIES';
                     "Purchase Link":= 'UNQUOTE-SALE';
                     "Sale Link":= 'UNQUOTED-BUY';
                     "Dividend Link":='DIVIDEND-UNQUOTED';
                     "RBA Class":='06';
                          END;

                IF "Investment Type"='06' THEN
                    BEGIN
                    "RBA Class":='05';

                    END;
                IF "Investment Type"='07' THEN
                    BEGIN
                      "Investment Posting Group":='COMMPAPERS';
                     "Purchase Link":='COMMPAPER-BUY';
                     "Sale Link":='COMMPAPER-SALE';
                     "Interest Link":='INTCOMMPAPER';
                     "RBA Class":='03';
                     END;
                IF "Investment Type"='08' THEN
                    BEGIN
                    END;
                IF "Investment Type"='12' THEN
                    BEGIN
                     "Investment Posting Group":='CALL DEPOSITS';
                     "Purchase Link":= 'CALLDEPOSIT-BUY';
                     "Sale Link":='CALLDEPOSIT-SALE';
                     "Interest Link":='INT CALL DEPOSITS';
                     "RBA Class":='02';

                    END;
                IF "Investment Type"='13' THEN
                    BEGIN
                     "Investment Posting Group":='FIXED DEPOSITS';
                     "Purchase Link":= 'FIXED BUY';
                     "Sale Link":='FIXED SALE';
                     "Interest Link":='INT FIXED DEPOSIT';
                     "RBA Class":='02';

                    END;
                IF "Investment Type"='14' THEN
                    BEGIN
                    END;
                   }
                IF "Investment Type"='15' THEN
                    BEGIN
                     "Investment Posting Group":='TRESURY BILLS';
                     "Purchase Link":= 'TBILLS BUY';
                     "Sale Link":='TBILLS-SALE';
                     "Interest Link":= 'INT TBILLS';
                     "RBA Class":='04';

                    END;
                IF "Investment Type"='16' THEN
                    BEGIN
                     "Investment Posting Group":='COPBOND';
                     "Purchase Link":= 'CORBOND-BUY';
                     "Sale Link":='CORBOND-SALE';
                     "Interest Link":='INT CORPORATE';
                     "RBA Class":='03';

                    END;
                  {
                IF "Investment Type"='17' THEN
                    BEGIN
                     "Investment Posting Group":='OFFSHORE';
                     "Purchase Link":= 'OFFSHORE-BUY';
                     "Sale Link":='OFFSHORE-SALE';
                      "Dividend Link":='OFFSHORE-INCOME';
                     "RBA Class":='07';
                    END;
               }
                  END;
               {
                IF "Investment Type"='18' THEN
                    BEGIN
                     "Investment Posting Group":='UNIT';
                     "Purchase Link":= 'UNIT-BUY';
                     "Sale Link":='UNIT-SALE';
                     "Interest Link":='INT UNIT TRUST';
                     "RBA Class":='08';

                    END;

               }



                 {
                  IF InvestmentType."Interest Rate p.a"<>0 THEN
                  "Rate %":=InvestmentType."Interest Rate p.a";
                  "Interest Frequency Period":=InvestmentType."Repayment Frequency";
                  "Grace Period":=InvestmentType."Grace Period";
                 END;  }
                */

            end;
        }
        field(50070; "Interest Frequency Period"; DateFormula)
        {
        }
        field(50071; "Maturity Date"; Date)
        {

            trigger OnValidate()
            begin
                "Maturity Period Days" := "Maturity Date" - "Investment Date";
            end;
        }
        field(50072; "Investment Date"; Date)
        {

            trigger OnValidate()
            begin
                /* IF "Asset Type"="Asset Type"::Mortgage THEN
                 BEGIN
                 IF "Date of Birth"=0D THEN
                 ERROR('You must specify the mortgagee birth date');
                 NextBirthDay:="Date of Birth";
                  REPEAT
                  NextBirthDay:=CALCDATE('1Y',NextBirthDay);
                  Age:=Age+1;
                  UNTIL NextBirthDay>="Investment Date";
                  "Age Next BirthDay":=Age;


                 IF InvestmentSetup.GET THEN
                // MESSAGE('%1 %2',InvestmentSetup."Retirement Age",Age);
                "No. Of Interest Periods":=(InvestmentSetup."Retirement Age"-Age)*12;





                    END;


                { IF "Rate %"= 0 THEN
                BEGIN

                IF "No. Of Interest Periods"<>0 THEN


                 "Expected Repayment":= ROUND("Principal Amount"/ "No. Of Interest Periods",0.0001,'>')
                 ELSE
                  "Expected Repayment" := ROUND(DebtService("Principal Amount","Rate %", "No. Of Interest Periods"),0.0001,'>');

                END;
               END
               ELSE
               ERROR('No. Of Interest Periods must be greater than Zero!');

               //"Expected Repayment":="No. Of Interest Periods"*Repayment;


               //Flat Rate
               //
                   }
               {//IF LoanType."Interest Calculation Method" =LoanType."Interest Calculation Method"::"Flat Rate" THEN
               IF "Interest Calculation Method" ="Interest Calculation Method"::"Flat Rate" THEN

                BEGIN
                  Repayment:=ROUND(("Approved Amount"/Installments)+FlatRateCalc("Approved Amount",Interest),0.01,'>');
                  "Flat rate Interest":=ROUND(FlatRateCalc("Approved Amount",Interest),0.01,'>');
                  "Flat Rate Principal":=Repayment-"Flat rate Interest";
                END;} */

            end;
        }
        field(50073; "Date Filter"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(50080; "Investment Posting Group"; Code[20])
        {
            //TableRelation = Table74013;

            trigger OnValidate()
            begin
                if "Investment Posting Group" = 'CALL DEPOSITS' then begin
                    "Purchase Link" := 'CALLDEPOSIT-BUY';
                    "Sale Link" := 'CALLDEPOSIT-SALE';
                    "Interest Link" := 'INT CALL DEPOSITS';

                end;
                if "Investment Posting Group" = 'COMMPAPERS' then begin
                    "Purchase Link" := 'COMMPAPER-BUY';
                    "Sale Link" := 'COMMPAPER-SALE';
                    "Interest Link" := 'INTCOMMPAPER';

                end;
                if "Investment Posting Group" = 'COPBOND' then begin
                    "Purchase Link" := 'CORBOND-BUY';
                    "Sale Link" := 'CORBOND-SALE';
                    "Interest Link" := 'INT CORPORATE';

                end;
                /*
   IF "Investment Posting Group"='UN EQUITIES' THEN BEGIN
   "Purchase Link":= 'UNQUOTE-SALE';
   "Sale Link":= 'UNQUOTED-BUY';
   "Dividend Link":='DIVIDEND-UNQUOTED';

                END;
   IF "Investment Posting Group"='FIXED DEPOSITS' THEN BEGIN
   "Purchase Link":= 'FIXED BUY';
   "Sale Link":='FIXED SALE';
   "Interest Link":='INT FIXED DEPOSIT';
   "RBA Class":='04';

                END;
   IF "Investment Posting Group"='UNIT' THEN BEGIN
   "Purchase Link":='UNIT-BUY';
   "Sale Link":= 'UNIT-SALE';
   "Interest Link":='INT UNIT TRUST';

                END;
   IF "Investment Posting Group"='QUOTED EQUITY KENYA' THEN BEGIN
   "Purchase Link":= 'QUOTED-BUY';
   "Sale Link":= 'QUOTE-SALE';
   "Dividend Link":='DIVIDEND-QUOTED';

                END;
      */
                if "Investment Posting Group" = 'TRESURY BOND AFS' then begin
                    "Purchase Link" := 'TBOND AFS BUY';
                    "Sale Link" := 'TBOND AFS SALE';
                    "Interest Link" := 'INT TBONDS AFS';
                    "RBA Class" := '04';

                end;
                if "Investment Posting Group" = 'TRESURY BILLS' then begin
                    "Purchase Link" := 'TBILLS BUY';
                    "Sale Link" := 'TBILLS-SALE';
                    "Interest Link" := 'INT TBILLS';
                    "RBA Class" := '04';


                end;
                if "Investment Posting Group" = 'TRESURY BOND HTM' then begin
                    "Purchase Link" := 'TBOND HTM-BUY';
                    "Sale Link" := 'TBOND HTM-SALE';
                    "Interest Link" := 'INT TBONDS HTM';
                    "RBA Class" := '04';

                end;

            end;
        }
        field(50088; "Maturity Period Days"; Integer)
        {

            trigger OnValidate()
            begin
                if "Investment Date" <> 0D then
                    "Maturity Date" := CalcDate(Format("Maturity Period Days") + 'D', "Investment Date")
                else
                    Error('Please key investment date');
            end;
        }
        field(50089; "Accrued Interest"; Decimal)
        {
            Editable = false;

            trigger OnValidate()
            begin
                //IF "Asset Type"="Asset Type"::"Money Market" THEN
                //"Accrued Interest2":="Accrued Interest"-"Interest Received1";
            end;
        }
        field(50090; "Interest at purchase"; Decimal)
        {
        }
        field(50091; "Valuation Method"; Option)
        {
            OptionMembers = "Armortised Cost","Fair Value";
        }
        field(50094; "RBA Class"; Code[20])
        {
            NotBlank = true;
            //TableRelation = Table0;
        }
        field(50112; "Purchase Link"; Code[20])
        {
            TableRelation = "Receipts and Payment Types1" where(Type = const(Payment));
        }
        field(50113; "Sale Link"; Code[20])
        {
            TableRelation = "Receipts and Payment Types1" where(Type = const(Receipt));
        }
        field(50114; "Interest Link"; Code[20])
        {
            TableRelation = "Receipts and Payment Types1" where(Type = const(Receipt));
        }
        field(50115; "Disposal Status"; Option)
        {
            OptionCaption = ' ,Due for Disposal,Approved for Disposal,Valued for Disposal,Disposed';
            OptionMembers = " ","Due for Disposal","Approved for Disposal","Valued for Disposal",Disposed;
        }
        field(50116; "Method of Disposal"; Option)
        {
            OptionCaption = ' ,Sale by Public Tender,Sale by Auction,Destruction/Dumping/Burying,Trade In,Transfer to Other Public Entity';
            OptionMembers = " ","Sale by Public Tender","Sale by Auction","Destruction/Dumping/Burying","Trade In","Transfer to Other Public Entity";
        }
        field(50117; "Valuation Amount"; Decimal)
        {
        }
        field(50118; "Reserve Price"; Decimal)
        {
        }
        field(50119; "Disposal Committee Meeting"; Code[20])
        {
            TableRelation = Campaign;
        }
        field(50120; "Log Book No."; Code[30])
        {
        }
        field(50121; "Policy No"; Code[30])
        {
        }
        field(50122; "Last Valued Date"; Date)
        {
        }
        field(50123; Valuer; Code[10])
        {
            TableRelation = Vendor."No.";

            trigger OnValidate()
            begin
                if VendorRec.Get(Valuer) then
                    "Valuation Firm" := VendorRec.Name;
            end;
        }
        field(50124; "Premium Amount"; Decimal)
        {
        }
        field(50125; "Valuation Firm"; Text[80])
        {
            TableRelation = Vendor."No.";
        }
        field(50126; "Date of Commencement"; Date)
        {
        }
        field(50127; "Expiry Date"; Date)
        {
        }
        field(50128; Insurer; Code[10])
        {
            TableRelation = Vendor."No.";

            trigger OnValidate()
            begin
                if VendorRec.Get(Insurer) then
                    "Insurance Company" := VendorRec.Name;
            end;
        }
        field(50129; "Date of Purchase"; Date)
        {
        }
        field(50130; "Amount of Purchase"; Decimal)
        {
        }
        field(50131; "Insurance Company"; Text[80])
        {
        }
        field(50132; "Service Provider"; Code[10])
        {
            TableRelation = Vendor;

            trigger OnValidate()
            begin
                if VendorRec.Get("Service Provider") then
                    "Service Provider Name" := VendorRec.Name;
            end;
        }
        field(50133; "Service Provider Name"; Text[30])
        {
        }
        field(50134; "Service Intervals"; Code[30])
        {
        }
        field(50135; "Date Last Serviced"; Date)
        {
        }
        field(50136; "Next Service"; Text[30])
        {
        }
        field(50137; Amount; Decimal)
        {
        }
        field(50138; "Service/Repair Description"; Text[100])
        {
        }
        field(50139; Manufacturer; Text[50])
        {
        }
        field(50140; "Asset Bar Code"; Code[20])
        {
        }
        field(50141; "Lease Term"; Duration)
        {
        }
        field(50142; "Lease Start Date"; Date)
        {
        }
        field(50143; "Lease End Date"; Date)
        {
        }
        field(50144; "On Lease"; Boolean)
        {
        }
        field(50145; "Depreciation Book Code"; Code[10])
        {
            Caption = 'Depreciation Book Code';
            NotBlank = true;
            TableRelation = "Depreciation Book";
        }
         field(70000; "Asset Purchase Groups"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(70004; "Suggested For Disposal"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        //Marked for Disposal
        field(70005; "Marked for Disposal"; Boolean)
        {
            DataClassification = CustomerContent;
        }
    }
    

    var
        NoOfDays: Integer;
        NofDaysTxt: Code[10];
        NextBirthDay: Date;
        Age: Integer;
        VendorRec: Record Vendor;
        PeriodInterval: Text[30];
        Repayment: Decimal;
        Cust: Record Customer;
        MonthlyRate: Decimal;
        P: Decimal;
        i: Integer;
        N: Decimal;
        r: Decimal;
        "Expected Int": Decimal;
        X: Decimal;
        Y: Decimal;
        Frac: Decimal;
        "No.OfFullPeriodsRemain": Integer;
        LastCouponPayDate: Date;
        ElapsedDays: Integer;
        Accruing: Decimal;
        Paydate: Text[30];
        ShortcutDimCode: array[8] of Code[20];
        Dim: Record "Dimension Value";
        GLSetup: Record "General Ledger Setup";
        Receipts: Record Receipts1;
        Int: Decimal;
        T: Integer;
        PV: Decimal;
        E: Decimal;
        CV: Decimal;
        EffectiveValue: Decimal;
        NoOfDays1: Integer;
        NofDaysTxt1: Code[10];
        NewDate: Date;
        FinalDate: Date;
}

