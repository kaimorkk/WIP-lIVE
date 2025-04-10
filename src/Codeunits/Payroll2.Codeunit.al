Codeunit 52193455 Payroll2
{

    trigger OnRun()
    begin
    end;


    procedure GetUserGroup(var UserIDs: Code[10];var PGroup: Code[20])
    var
        UserSetup: Record "User Setup";
    begin
          /*
           IF UserSetup.GET(UserIDs) THEN BEGIN
           PGroup:=UserSetup.Picture;
           IF PGroup='' THEN
            ERROR('Dont have payroll permission');
          END;
        */

    end;


    procedure PensionCalculation()
    begin
    end;
}

