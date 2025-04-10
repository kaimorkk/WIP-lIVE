codeunit 52193423 "Code Factory"
{
    procedure DetermineIfIsNonWorking(var bcDate: Date) ItsNonWorking: Boolean
    var
        dates: Record Date;
        HRLeaveCal: Record "Base Calendar";
        HRLeave_Calendar: Record "Base Calendar Change";
        GeneralOptions: record "Human Resources Setup";

    begin
        Clear(ItsNonWorking);
        GeneralOptions.Find('-');
        HRLeaveCal.Reset;
        // HRLeaveCal.SetRange(Current, true);
        if HRLeaveCal.FindFirst() then begin
            HRLeave_Calendar.Reset;
            HRLeave_Calendar.SetFilter("Base Calendar Code", HRLeaveCal.Code);
            HRLeave_Calendar.SetRange(Date, bcDate);
            if HRLeave_Calendar.Find('-') then begin
                if HRLeave_Calendar."NonWorking" = true then
                    ItsNonWorking := true;
            end;
        end;
    end;
}
