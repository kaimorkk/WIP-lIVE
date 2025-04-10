report 70002 "Payroll Projections"
{
    ApplicationArea = All;
    Caption = 'Payroll Projections';
    UsageCategory = ReportsAndAnalysis;
    ProcessingOnly = true;
    dataset
    {
        dataitem(Employee; Employee)
        {
            DataItemTableView = where(Status = filter(Active), Present = filter(<> ''));

            trigger OnAfterGetRecord()
            var
                i: Integer;
            begin
                if StartDate = 0D then
                    Error('Please enter a start date');
                if EndDate = 0D then
                    Error('Please enter an end date');
                if StartDate < Today then
                    Error('This report cannot project past events!');
                // Ensure that EndDate is after or equal to StartDate
                if EndDate < StartDate then
                    Error('EndDate must be on or after StartDate.');
                // if Employee."No." = '57007' then
                //     Message('Here');
                if Date2DMY(EndDate, 3) = Date2DMY(StartDate, 3) then
                    NoMonths := Date2DMY(EndDate, 2) - Date2DMY(StartDate, 2) + 1
                else
                    NoMonths := 12 - Date2DMY(StartDate, 2) + Date2DMY(EndDate, 2) + 1;
                PayPeriod.Reset();
                PayPeriod.SetRange(Closed, true);
                PayPeriod.FindLast();
                LastPeriodRun := (Date2DMY(PayPeriod."Date Opened", 2) + 5) mod 12 + 1;
                CurrentMonth := (Date2DMY(Today, 2) + 5) mod 12 + 1;

                NewPointer := incstr(Employee.Present);
                if Employee."Increment Date" <> 0D then
                    IncrementalMonth := Date2DMY("Increment Date", 2);
                CustomMonth := (IncrementalMonth + 5) mod 12 + 1;
                ///Check if employee has already received increment
                if CustomMonth < CurrentMonth then
                    NewPointer := Employee.Present;
                IncrementalChanges[1] := CustomMonth - 1;

                ///Check if employee is at end of scale
                ScaleBenefits.Reset();
                ScaleBenefits.SetRange("Salary Scale", Employee."Salary Scale");
                ScaleBenefits.SetRange("Salary Pointer", NewPointer);
                if ScaleBenefits.IsEmpty then
                    IncrementalChanges[1] := 12;
                if Employee."Increment Date" = 0D then
                    IncrementalChanges[1] := 12;

                ScaleBenefits.Reset();
                ScaleBenefits.SetRange("Salary Scale", Employee."Salary Scale");
                ScaleBenefits.SetRange("Salary Pointer", Employee.Present);
                if ScaleBenefits.FindSet() then
                    repeat
                        EntryNo += 1;
                        Projections.Init();
                        Projections."Entry No" := EntryNo;
                        Projections."Employee No" := Employee."No.";
                        Projections."Transaction Code" := ScaleBenefits."ED Code";
                        Projections.Grade := Employee."Salary Scale";
                        Projections."Job ID" := Employee."Current Position ID";

                        Projections.Amount := CalcAmt(NoMonths, CustomMonth);
                        // //ScaleBenefits.Amount * IncrementalChanges[1];
                        // if IncrementalChanges[1] <> 12 then begin
                        //     scalebenefits2.reset();
                        //     ScaleBenefits2.SetRange("Salary Scale", Employee."Salary Scale");
                        //     ScaleBenefits2.SetRange("Salary Pointer", NewPointer);
                        //     ScaleBenefits2.SetRange("ED Code", ScaleBenefits."ED Code");
                        //     if ScaleBenefits2.FindFirst() then
                        //         Projections.Amount := Projections.Amount + ScaleBenefits2.Amount * (12 - IncrementalChanges[1]);
                        // end;
                        Projections.Insert();
                    until ScaleBenefits.Next() = 0;

                if IsDecemberInRange(StartDate, EndDate) then begin
                    if Scales.Get(Employee."Salary Scale") then begin
                        EntryNo += 1;
                        Projections.Init();
                        Projections."Entry No" := EntryNo;
                        Projections."Employee No" := Employee."No.";
                        Projections."Transaction Code" := 'ALW-0044';
                        Projections.Grade := Employee."Salary Scale";
                        Projections."Job ID" := Employee."Current Position ID";
                        Projections.Amount := Scales."Leave Allowance";
                        Projections.Insert();
                    end;

                end;
            end;

        }


    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(Filters)
                {
                    field(StartDate; StartDate)
                    {
                        ApplicationArea = All;
                    }
                    field(EndDate; EndDate)
                    {
                        ApplicationArea = All;
                    }
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }
    trigger OnPreReport()
    begin
        Projections.Reset();
        // Projections.SetRange("Start Date", StartDate);
        Projections.deleteall();
        Projections.Reset();
        if Projections.FindLast() then
            EntryNo := Projections."Entry No";
    end;

    var
        StartDate: Date;
        EndDate: Date;
        PayPeriod: Record "PR Payroll Periods";
        LastPeriodRun, CurrentMonth : Integer;
        NoMonths: Integer;
        IncrementalMonth, CustomMonth : Integer;
        ScaleBenefits, ScaleBenefits2 : Record "Scale Benefits";
        Pointer, NewPointer : Code[10];
        Projections: Record "Payroll Projections Buffer";
        IncrementalChanges: array[2] of Integer;
        EntryNo: Integer;
        Scales: Record "Salary Scales";


    procedure Initialize()
    begin
        IncrementalMonth := 0;
        StartDate := 0D;

    end;

    procedure IsDecemberInRange(StartDate: Date; EndDate: Date): Boolean;
    var
        DecemberStart: Date;
        DecemberEnd: Date;
    begin
        // Define December's start and end dates for the year of StartDate
        DecemberStart := DMY2Date(1, 12, Date2DMY(StartDate, 3));
        DecemberEnd := DMY2Date(31, 12, Date2DMY(StartDate, 3));

        // Check if December overlaps with the given range
        exit(not ((EndDate < DecemberStart) or (StartDate > DecemberEnd)));
    end;

    procedure CalcAmt(NoMonth: Integer; IncrementalMonth: Integer): Decimal;
    var
        StartMonth: Integer;
        Amount: Decimal;
        NewPointer2: Code[10];
    begin
        NewPointer := '';
        NewPointer2 := '';
        StartMonth := (Date2DMY(StartDate, 2) + 5) mod 12 + 1;
        if IncrementalMonth < CurrentMonth then
            NewPointer := Employee.Present
        else if StartMonth + NoMonth < IncrementalMonth then
            NewPointer := Employee.Present
        else
            NewPointer2 := incstr(Employee.Present);
        if NewPointer2 = '' then begin
            scalebenefits2.reset();
            ScaleBenefits2.SetRange("Salary Scale", Employee."Salary Scale");
            ScaleBenefits2.SetRange("Salary Pointer", NewPointer);
            ScaleBenefits2.SetRange("ED Code", ScaleBenefits."ED Code");
            if ScaleBenefits2.FindFirst() then
                Amount := ScaleBenefits2.Amount * NoMonth;
        end else begin
            if StartMonth <> IncrementalMonth then begin
                scalebenefits2.reset();
                ScaleBenefits2.SetRange("Salary Scale", Employee."Salary Scale");
                ScaleBenefits2.SetRange("Salary Pointer", Employee.Present);
                ScaleBenefits2.SetRange("ED Code", ScaleBenefits."ED Code");
                if ScaleBenefits2.FindFirst() then
                    Amount := ScaleBenefits2.Amount * (IncrementalMonth - StartMonth);
                scalebenefits2.reset();
                ScaleBenefits2.SetRange("Salary Scale", Employee."Salary Scale");
                ScaleBenefits2.SetRange("Salary Pointer", NewPointer2);
                ScaleBenefits2.SetRange("ED Code", ScaleBenefits."ED Code");
                if ScaleBenefits2.FindFirst() then
                    Amount += ScaleBenefits2.Amount * (NoMonth - (IncrementalMonth - StartMonth));
            end else begin
                scalebenefits2.reset();
                ScaleBenefits2.SetRange("Salary Scale", Employee."Salary Scale");
                ScaleBenefits2.SetRange("Salary Pointer", Employee.Present);
                ScaleBenefits2.SetRange("ED Code", ScaleBenefits."ED Code");
                if ScaleBenefits2.FindFirst() then
                    Amount += ScaleBenefits2.Amount * NoMonth;
            end;

        end;
        // if IncrementalMonth > StartMonth then begin
        //     Amount := ScaleBenefits.Amount * (IncrementalMonth - StartMonth) + ScaleBenefits2.Amount * (NoMonth - (IncrementalMonth - StartMonth));
        // end;
        exit(Amount);
    end;

}
