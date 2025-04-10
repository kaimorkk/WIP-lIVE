
codeunit 69018 "Leave Jnl.-Check Line"
{
    TableNo = "HR Journal Line";

    trigger OnRun()
    begin
        GLSetup.Get;
        RunCheck(Rec);
    end;

    var
        Text000: label 'The combination of dimensions used in %1 %2, %3, %4 is blocked. %5';
        Text001: label 'A dimension used in %1 %2, %3, %4 has caused an error. %5';
        GLSetup: Record "General Ledger Setup";
        FASetup: Record "Human Resources Setup";
        DimMgt: Codeunit DimensionManagement;
        CallNo: Integer;
        LeaveEntries: Record "HR Leave Ledger Entries";


    procedure RunCheck(var InsuranceJnlLine: Record "HR Journal Line")
    var
        TableID: array[10] of Integer;
        No: array[10] of Code[20];
    begin
        with InsuranceJnlLine do begin

            if "Leave Entry Type" = "leave entry type"::Negative then begin
                //TESTFIELD("Leave Application No.");
            end;

            if "Document No." = '' then
                exit;

            TestField("Document No.");
            TestField("Posting Date");
            TestField("Staff No.");


            CallNo := 1;

            if not DimMgt.CheckDimIDComb("Dimension Set ID") then
                Error(
                  Text000,
                  TableCaption, "Journal Template Name", "Journal Batch Name", "Line No.",
                  DimMgt.GetDimCombErr);

            TableID[1] := Database::"HR Journal Line";
            No[1] := "Leave Application No.";
            if not DimMgt.CheckDimValuePosting(TableID, No, "Dimension Set ID") then
                if "Line No." <> 0 then
                    Error(
                      Text001,
                      TableCaption, "Journal Template Name", "Journal Batch Name", "Line No.",
                      DimMgt.GetDimValuePostingErr)
                else
                    Error(DimMgt.GetDimValuePostingErr);
        end;
    end;
}

