Codeunit 52193464 "Workbook Exercises"
{

    trigger OnRun()
    begin
        Message('The value of %1 is %2','LoopNo',LoopNo);
    end;

    var
        LoopNo: Integer;
        YesOrNo: Boolean;
        Amount: Decimal;
        "When Was It": Date;
        Desciption: Text[30];
        "Code Number": Code[10];
        Ch: Char;
        Color: Option Red,Orange,Yellow,Green,"Blue ",Violet;
}

