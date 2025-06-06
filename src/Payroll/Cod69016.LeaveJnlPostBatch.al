
codeunit 69016 "Leave Jnl.-Post Batch"
{
    Permissions = TableData "HR Leave Journal Batch" = imd;
    TableNo = "HR Journal Line";

    trigger OnRun()
    begin
        InsuranceJnlLine.Copy(Rec);
        Code;
        Rec := InsuranceJnlLine;
    end;

    var
        Text000: label 'cannot exceed %1 characters';
        Text001: label 'Journal Batch Name    #1##########\\';
        Text002: label 'Checking lines        #2######\';
        Text003: label 'Posting lines         #3###### @4@@@@@@@@@@@@@';
        Text004: label 'A maximum of %1 posting number series can be used in each journal.';
        InsuranceJnlLine: Record "HR Journal Line";
        InsuranceJnlTempl: Record "HR Leave Journal Template";
        InsuranceJnlBatch: Record "HR Leave Journal Batch";
        InsuranceReg: Record "HR Leave Register";
        InsCoverageLedgEntry: Record "HR Leave Ledger Entries";
        InsuranceJnlLine2: Record "HR Journal Line";
        InsuranceJnlLine3: Record "HR Journal Line";
        NoSeries: Record "No. Series" temporary;
        FAJnlSetup: Record "Human Resources Setup";
        InsuranceJnlPostLine: Codeunit "Leave Jnl.-Post Line";
        InsuranceJnlCheckLine: Codeunit "Leave Jnl.-Check Line";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        NoSeriesMgt2: array[10] of Codeunit NoSeriesManagement;
        Window: Dialog;
        LineCount: Integer;
        StartLineNo: Integer;
        NoOfRecords: Integer;
        InsuranceRegNo: Integer;
        LastDocNo: Code[20];
        LastDocNo2: Code[20];
        LastPostedDocNo: Code[20];
        NoOfPostingNoSeries: Integer;
        PostingNoSeriesNo: Integer;

    local procedure "Code"()
    var
        UpdateAnalysisView: Codeunit "Update Analysis View";
    begin
        with InsuranceJnlLine do begin
            SetRange("Journal Template Name", "Journal Template Name");
            SetRange("Journal Batch Name", "Journal Batch Name");
            LockTable;

            InsuranceJnlTempl.Get("Journal Template Name");
            InsuranceJnlBatch.Get("Journal Template Name", "Journal Batch Name");
            if StrLen(IncStr(InsuranceJnlBatch.Name)) > MaxStrLen(InsuranceJnlBatch.Name) then
                InsuranceJnlBatch.FieldError(
                  Name,
                  StrSubstNo(
                    Text000,
                    MaxStrLen(InsuranceJnlBatch.Name)));

            if not Find('=><') then begin
                Commit;
                "Line No." := 0;
                exit;
            end;

            Window.Open(
              Text001 +
              Text002 +
              Text003);
            Window.Update(1, "Journal Batch Name");

            // Check lines
            LineCount := 0;
            StartLineNo := "Line No.";
            repeat
                LineCount := LineCount + 1;
                Window.Update(2, LineCount);
                InsuranceJnlCheckLine.RunCheck(InsuranceJnlLine);
                if Next = 0 then
                    Find('-');
            until "Line No." = StartLineNo;
            NoOfRecords := LineCount;

            InsCoverageLedgEntry.LockTable;
            if InsCoverageLedgEntry.FindLast then;
            InsuranceReg.LockTable;
            if InsuranceReg.FindLast then
                InsuranceRegNo := InsuranceReg."No." + 1
            else
                InsuranceRegNo := 1;

            // Post lines
            LineCount := 0;
            LastDocNo := '';
            LastDocNo2 := '';
            LastPostedDocNo := '';
            Find('-');
            repeat
                LineCount := LineCount + 1;
                Window.Update(3, LineCount);
                Window.Update(4, ROUND(LineCount / NoOfRecords * 10000, 1));
                if not ("Leave Period" = 0) and
                   (InsuranceJnlBatch."No. Series" <> '') and
                   ("Document No." <> LastDocNo2)
                then
                    //TESTFIELD("Document No.",NoSeriesMgt.GetNextNo(InsuranceJnlBatch."No. Series","Posting Date",FALSE));
                    if not ("Leave Period" = 0) then
                        LastDocNo2 := "Document No.";
                if "Posting No. Series" = '' then
                    "Posting No. Series" := InsuranceJnlBatch."No. Series"
                else
                    if not ("Leave Period" = 0) then
                        if "Document No." = LastDocNo then
                            "Document No." := LastPostedDocNo
                        else begin
                            if not NoSeries.Get("Posting No. Series") then begin
                                NoOfPostingNoSeries := NoOfPostingNoSeries + 1;
                                if NoOfPostingNoSeries > ArrayLen(NoSeriesMgt2) then
                                    Error(
                                      Text004,
                                      ArrayLen(NoSeriesMgt2));
                                NoSeries.Code := "Posting No. Series";
                                NoSeries.Description := Format(NoOfPostingNoSeries);
                                NoSeries.Insert;
                            end;
                            LastDocNo := "Document No.";
                            Evaluate(PostingNoSeriesNo, NoSeries.Description);
                            "Document No." := NoSeriesMgt2[PostingNoSeriesNo].GetNextNo("Posting No. Series", "Posting Date", false);
                            LastPostedDocNo := "Document No.";
                        end;
                InsuranceJnlPostLine.RunWithOutCheck(InsuranceJnlLine);
            until Next = 0;

            if InsuranceReg.FindLast then;
            if InsuranceReg."No." <> InsuranceRegNo then
                InsuranceRegNo := 0;

            Init;
            "Line No." := InsuranceRegNo;

            // Update/delete lines
            if InsuranceRegNo <> 0 then begin
                InsuranceJnlLine2.CopyFilters(InsuranceJnlLine);
                InsuranceJnlLine2.SetFilter("Leave Period", '<>%1', 0);
                if InsuranceJnlLine2.FindLast then; // Remember the last line
                InsuranceJnlLine3.Copy(InsuranceJnlLine);
                InsuranceJnlLine3.DeleteAll;
                InsuranceJnlLine3.Reset;
                InsuranceJnlLine3.SetRange("Journal Template Name", "Journal Template Name");
                InsuranceJnlLine3.SetRange("Journal Batch Name", "Journal Batch Name");
                if not InsuranceJnlLine3.FindLast then
                    if IncStr("Journal Batch Name") <> '' then begin
                        InsuranceJnlBatch.Get("Journal Template Name", "Journal Batch Name");
                        InsuranceJnlBatch.Delete;
                        //FAJnlSetup.IncInsuranceJnlBatchName(InsuranceJnlBatch);
                        InsuranceJnlBatch.Name := IncStr("Journal Batch Name");
                        if InsuranceJnlBatch.Insert then;
                        "Journal Batch Name" := InsuranceJnlBatch.Name;
                    end;

                InsuranceJnlLine3.SetRange("Journal Batch Name", "Journal Batch Name");
                if (InsuranceJnlBatch."No. Series" = '') and not InsuranceJnlLine3.FindLast then begin
                    InsuranceJnlLine3.Init;
                    InsuranceJnlLine3."Journal Template Name" := "Journal Template Name";
                    InsuranceJnlLine3."Journal Batch Name" := "Journal Batch Name";
                    InsuranceJnlLine3."Line No." := 10000;
                    InsuranceJnlLine3.Insert;
                    InsuranceJnlLine3.SetUpNewLine(InsuranceJnlLine2);
                    InsuranceJnlLine3.Modify;
                end;
            end;
            if InsuranceJnlBatch."No. Series" <> '' then
                NoSeriesMgt.SaveNoSeries;
            if NoSeries.Find('-') then
                repeat
                    Evaluate(PostingNoSeriesNo, NoSeries.Description);
                    NoSeriesMgt2[PostingNoSeriesNo].SaveNoSeries;
                until NoSeries.Next = 0;

            Commit;
            Clear(InsuranceJnlCheckLine);
            Clear(InsuranceJnlPostLine);
        end;
        UpdateAnalysisView.UpdateAll(0, true);
        Commit;
    end;
}

