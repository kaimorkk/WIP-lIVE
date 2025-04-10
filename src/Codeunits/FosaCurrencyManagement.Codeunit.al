Codeunit 52193438 "Fosa Currency Management"
{

    trigger OnRun()
    begin
    end;


    procedure "Denominational Totals"(var TransRec: Record Denominations)
    begin
        
        TransRec.Totals:=TransRec."10"*10 + TransRec."20"*20 +TransRec."50"
        *50 +
        TransRec."100"*100 + TransRec."200"* 200 + TransRec."500"* 500 +TransRec."1000"* 1000 +TransRec."5c"* 0.05 +
        TransRec."1c"* 0.01 + TransRec."2c"* 0.02 +
        TransRec."10c"*0.1 + TransRec."20c"*0.2 + TransRec."50c"*0.5 + TransRec."1"*1 +
        TransRec."2"*2 + TransRec."5"*5
        
        /*TransRec."10 Rand Notes"*10 + TransRec."20 Rand Notes"*20 +TransRec."50 Rand Notes"
        *50 +
        TransRec."100 Rand Notes"*100 + TransRec."200 Rand Notes"* 200 +
         TransRec."1 Cent"* 0.01+ TransRec."2 Cents"* 0.02 + TransRec."5 Cents"* 0.05 +
        TransRec."10 Cents"*0.1 + TransRec."20 Cents"*0.2 + TransRec."50 Cents"*0.5 + TransRec."1 Rand"*1 +
        TransRec."2 Rand"*2 + TransRec."5 Rand"*5*/;
        
        
        TransRec.Validate(TransRec.Totals);

    end;


    procedure CoinsTotals(var TransRec: Record Transactions)
    begin
        /*IF TransRec.Type=TransRec.Type::"Cash Deposit" THEN BEGIN
        
        TransRec."Total Coinage":= TransRec."1 Lisente"* 0.01 + TransRec."2 Lisente"* 0.02 + TransRec."5 Lisente"* 0.05 +
        TransRec."10 Lisente"*0.1 + TransRec."20 Lisente"*0.2 + TransRec."50 Lisente"*0.5 + TransRec."1 Loti"*1 +
        TransRec."2 Maloti"*2 + TransRec."5 Maloti"*5 +
        
        TransRec."1 Cent"* 0.01 + TransRec."2 Cents"* 0.02 + TransRec."5 Cents"* 0.05 +
        TransRec."10 Cents"*0.1 + TransRec."20 Cents"*0.2 + TransRec."50 Cents"*0.5 + TransRec."1 Rand"*1 +
        TransRec."2 Rand"*2 + TransRec."5 Rand"*5;
        
        TransRec.VALIDATE(TransRec."Total Coinage");
        END;
        */

    end;
}

